CURRENT_DIR = $(shell pwd)

IMAGE := quay.io/kameshsampath/app-spice-operator
VERSION := latest

.DEFAULT_GOAL := all

# TODO add YAML lint and ansible-lint before building

.PHONY:
build-image:
	@docker build --rm --no-cache -t $(IMAGE) -f build/Dockerfile $(CURRENT_DIR)

push-image: build
	@docker push $(IMAGE)

all:  build-image push-image