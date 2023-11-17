VERSION=$(shell date +"%Y%m%d%H%M%S")
APP_GROUP=foundation
APP_NAME=front

chatgpt-next-web:
	make build APP_NAME=chatgpt-next-web APP_GROUP=foundation

build:
	npm run build
	docker build --platform linux/amd64 -t $(APP_NAME):$(VERSION) .
	# docker build -t $(APP_NAME):$(VERSION) .
	docker tag $(APP_NAME):$(VERSION) ccr.ccs.tencentyun.com/fflow/fflow:$(APP_NAME)-$(VERSION)
	docker push ccr.ccs.tencentyun.com/fflow/fflow:$(APP_NAME)-$(VERSION)

