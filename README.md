# SolStream – RPCv2 Streaming & Observability

> Production-flavored, open-source streaming layer for Solana with backpressure, gap detection, automatic replay, and first-class observability.

## Quick Start (5 minutes)

### Prerequisites
- Node.js 20+
- Go 1.22+
- Docker & Docker Compose
- kubectl & Helm 3
- kind or minikube

### Local Development (Docker Compose)
```bash
# Clone and setup
git clone https://github.com/yourusername/solstream.git
cd solstream

# Install dependencies
make install

# Start services (Ingestor + Replay + Prometheus + Grafana)
docker-compose up -d

# View logs
docker-compose logs -f ingestor

# Access dashboards
# Grafana: http://localhost:3000 (admin/admin)
# Prometheus: http://localhost:9090
# Metrics: http://localhost:8080/metrics