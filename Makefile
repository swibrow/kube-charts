SHELL := /usr/bin/env bash
HELM := $(shell which helm) --kube-context kubernetes-admin@kubernetes

.PHONY: all
all: homeassistant

.PHONY: homeassistant
homeassistant:
	${HELM} upgrade --install homeassistant \
	 homeassistant \
	 --namespace home-automation \
	 --values homeassistant/values.yaml \
	 --set image=homeassistant/home-assistant:0.62.1
	 --set TZ=Europe/Berlin
