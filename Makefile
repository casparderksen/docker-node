TAG		= my/app
PORT0	= 3000
PORT	= 8080

.PHONY: default
default: build

.PHONY: build
build:
	-docker build -t $(TAG) .

.PHONY: run
run:
	-docker run -d --rm --env PORT0=$(PORT0) -p $(PORT):$(PORT0) $(TAG)

.PHONY: stop
stop:
	-docker ps -q -f ancestor=$(TAG) | xargs docker stop

.PHONY: rmi
rmi: stop
	-docker rmi -f $(TAG)

.PHONY: clean
clean: stop rmi

.PHONY: clobber
clobber: clean
	-docker ps -q -a | xargs docker stop
	-docker ps -q -a | xargs docker rm
	-docker images | tail -n +2 | awk '$$1 == "<none>" {print $$3}' | xargs docker rmi
