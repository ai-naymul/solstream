// FILE: Makefile
.PHONY: install test lint docker-build cluster-create cluster-delete clean

install:
	cd packages/ingestor && npm install
	cd packages/sdk-ts && npm install
	cd packages/demo-web && npm install
	cd tools/loadgen && npm install
	cd packages/replay && go mod download

test:
	cd packages/ingestor && npm test
	cd packages/sdk-ts && npm test
	cd packages/replay && go test ./...

lint:
	cd packages/ingestor && npm run lint
	cd packages/sdk-ts && npm run lint
	cd packages/replay && golangci-lint run

docker-build:
	docker build -t solstream-ingestor:latest -f packages/ingestor/Dockerfile packages/ingestor
	docker build -t solstream-replay:latest -f packages/replay/Dockerfile packages/replay

cluster-create:
	kind create cluster --name solstream --config infra/k8s/kind-config.yaml || true
	kubectl apply -f infra/k8s/namespace.yaml
	kubectl apply -f infra/k8s/prometheus.yaml
	kubectl apply -f infra/k8s/grafana.yaml

cluster-delete:
	kind delete cluster --name solstream

clean:
	rm -rf packages/*/node_modules
	rm -rf packages/*/dist
	rm -rf packages/replay/bin
	rm -rf rocksdb-data leveldb-data