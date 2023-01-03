.DEFAULT_GOAL := help
SHELL := /bin/bash

# Lazily create and "source" the .env file
# See: https://unix.stackexchange.com/a/235254
ifeq (,$(wildcard .env))
$(shell cp .env.example .env)
endif
include .env
export $(shell sed 's/=.*//' .env)


##@ App

.PHONY: format
format: ## Format the files
	pin-github-action .github/workflows/*.yml

.PHONY: lint
lint: actionlint ## Lint the files
	@actionlint

.PHONY: build
build: ## Build the files
	markscribe -write README.md ./templates/README.md.tpl


##@ Other

.PHONY: setup
setup: ## Bootstrap for local development
	@if ! command -v gh >/dev/null 2>&1; then echo "Unable to find gh!"; exit 1; fi
	@if ! command -v git >/dev/null 2>&1; then echo "Unable to find git!"; exit 1; fi
	@if ! command -v go >/dev/null 2>&1; then echo "Unable to find go!"; exit 1; fi
	@if ! command -v hugo >/dev/null 2>&1; then echo "Unable to find hugo!"; exit 1; fi

# Via https://www.thapaliya.com/en/writings/well-documented-makefiles/
# Note: The `##@` comments determine grouping
.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo ""


# Dependencies

.PHONY: actionlint
actionlint:
	@if ! command -v actionlint >/dev/null 2>&1; then go install github.com/rhysd/actionlint/cmd/actionlint@latest; fi

.PHONY: markscribe
markscribe:
	@if ! command -v markscribe >/dev/null 2>&1; then go install github.com/muesli/markscribe@latest; fi
