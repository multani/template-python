DIRECTORIES = NAME tests


all: format

.PHONY: format
test:
	poetry run pytest

.PHONY: format
format:
	@poetry run black $(DIRECTORIES)
	@poetry run isort $(DIRECTORIES)

requirements.txt: pyproject.toml poetry.lock
	poetry -V
	poetry export --format requirements.txt --output $@ --without-hashes
