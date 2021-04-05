all: parallel-download

.PHONY: docker

parallel-download:
	go build -o parallel-download

docker:
	docker build --pull -t parallel-download .
