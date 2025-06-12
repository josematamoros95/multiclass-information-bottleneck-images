.DEFAULT_GOAL := help # when you run make, it defaults to printing available commands

# discover the absolute path to the project repo on the host machine
ifeq ($(OS),Windows_NT)
	PROJECT_DIR := "$(shell powershell "(New-Object -ComObject Scripting.FileSystemObject).GetFolder('.').ShortPath")"
else
	PROJECT_DIR := "$$(pwd)"
endif

PROJECT_IMAGE_NAME := "python-instance" ## name of the docker image

.PHONY: build-image
build-image: ## build the base docker image
	docker build -t $(PROJECT_IMAGE_NAME) .

.PHONY: run-container-interactive
run-container-interactive: ## run the docker container
	docker run -it -v "$(PROJECT_DIR):/app" $(PROJECT_IMAGE_NAME)

.PHONY: run-jupyter
run-jupyter: ## run the jupyter notebook server
	docker run -t --rm --workdir="/app" -p 8888:8888 -v "$(PROJECT_DIR):/app" $(PROJECT_IMAGE_NAME) /bin/bash -ci "jupyter notebook --allow-root --port 8888 --ip 0.0.0.0 --no-browser --NotebookApp.token=''"

.PHONY: poetry-add-package
PACK_NAME ?= 'numpy'
poetry-add-package: ## install or update single packages
	docker run -it --workdir="/app" -v $(PROJECT_DIR):/app $(PROJECT_IMAGE_NAME) /bin/bash -ci "poetry add $(PACK_NAME)"