## Envirement Setup
# python3 -m venv venv
# source venv/bin/activate
setup:
	@./venv/bin/pip install -r requirements.txt

run:
	@./venv/bin/python src/main.py

test:
	@./venv/bin/python src/test.py

## Image Building
REGISTRY?="quay.io"
REPO?="faresherhar/testapi"
TAG?="latest"

build:
	@podman build -t ${REGISTRY}/${REPO}:${TAG} ./

publish: build
	@podman push ${REGISTRY}/${REPO}:${TAG}

run:
	@podman run --detach --name testapi -p 8001:8001 ${REGISTRY}/${REPO}:${TAG}

remove:
	@podman rm --force testapi


.PHONY: setup run test
.PHONY: build publish run remove