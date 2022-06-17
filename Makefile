.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'


.PHONY: lint
lint:  ## Check code for style, imports, type hints, and docstring coverage.
	poetry run flake8 cw_ngrams/
	poetry run black cw_ngrams/ --check --diff --quiet
	poetry run isort cw_ngrams/ --check
	poetry run mypy cw_ngrams/


.PHONY: format
format:  ## Format with black, fix imports with isort, and remove unused imports with autoflake.
	poetry run black cw_ngrams/ --quiet
	poetry run isort cw_ngrams/


.DEFAULT_GOAL := help