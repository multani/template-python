DIRECTORIES = NAME tests


all: fmt

.PHONY: poetry
poetry: .venv

.venv: poetry.lock poetry.toml pyproject.toml
	poetry install
	@touch .venv

.PHONY: fmt
test: poetry
	poetry run pytest

.PHONY: fmt format
fmt format: poetry
	@poetry run ruff format $(DIRECTORIES)

.PHONY: check
check: poetry
	@poetry run ruff check
	@poetry run mypy

requirements.txt: poetry pyproject.toml poetry.lock
	poetry -V
	poetry export --format requirements.txt --output $@ --without-hashes
