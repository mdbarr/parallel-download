all: parallel-download

.PHONY: docker

parallel-download: main.go go.mod go.sum
	go build -o parallel-download

docker:
	docker build --pull -t parallel-download .
