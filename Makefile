.PHONY: create update upload build

VERSION := 0.0.0
MODULE_NAME := my-priv-app-mod
ORG_PUBLIC_NAMESPACE := priv-app
BASE_URL := https://pr-10341-appmain-bplesliplq-uc.a.run.app

create:
	viam --base-url ${BASE_URL} module create --name=${MODULE_NAME} --public-namespace=${ORG_PUBLIC_NAMESPACE}

update:
	viam --base-url ${BASE_URL} module update --module=meta.json

upload: build
	viam --base-url ${BASE_URL} module upload --version=${VERSION} --platform=any --public-namespace=${ORG_PUBLIC_NAMESPACE} module

build:
	npm run build
