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
	 --set image.repository=homeassistant/home-assistant
	 --set inage.tag=0.62.1
	 --set TZ=Europe/Berlin
