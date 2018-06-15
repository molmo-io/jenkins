JENKINS_VER ?= 2.114

REPO = nohost/jenkins
NAME = jenkins-$(JENKINS_VER)

TAG ?= $(JENKINS_VER)
BASE_IMAGE_TAG = $(JENKINS_VER)-alpine

ifneq ($(STABILITY_TAG),)
    ifneq ($(TAG),latest)
        override TAG := $(TAG)-$(STABILITY_TAG)
    endif
endif

.PHONY: build test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) --build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) ./
