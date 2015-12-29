all: build

build:
	docker build . -t ryzom:latest
