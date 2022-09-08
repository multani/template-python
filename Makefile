DIRECTORIES = NAME tests


all: format

.PHONY: poetry
poetry: .venv

.venv: poetry.lock poetry.toml pyproject.toml
	poetry install
	@touch .venv

.PHONY: format
test: poetry
	poetry run pytest

.PHONY: format
format: poetry
	@poetry run black $(DIRECTORIES)
	@poetry run isort $(DIRECTORIES)

requirements.txt: poetry pyproject.toml poetry.lock
	poetry -V
	poetry export --format requirements.txt --output $@ --without-hashes
