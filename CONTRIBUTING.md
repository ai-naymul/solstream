# Contributing to SolStream

## Development Setup

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/solstream.git`
3. Install dependencies: `make install`
4. Create a branch: `git checkout -b feature/your-feature`

## Code Style

- **TypeScript**: Follow ESLint rules (Prettier for formatting)
- **Go**: Use `gofmt` and `golint`
- Write tests for new features
- Update documentation

## Pull Request Process

1. Ensure all tests pass: `make test`
2. Update README if adding features
3. Add entry to CHANGELOG (if applicable)
4. Request review from maintainers

## Architecture Decision Records

For significant design choices, create an ADR in `docs/ADRs/`.

## License

By contributing, you agree to license your work under MIT.