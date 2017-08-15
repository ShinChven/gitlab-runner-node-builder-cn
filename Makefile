all: build

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build	- build image."
	@echo "   2. make release	- build release image."
	@echo "   3. make publish	- build the release image and push to dockerhub."


build:
	@docker build --tag=shinchven/gitlab-runner-node-builder-cn .

release: 
	@docker build --no-cache --tag=shinchven/gitlab-runner-node-builder-cn .
	
publish: release
	@docker push shinchven/gitlab-runner-node-builder-cn