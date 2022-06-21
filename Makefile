

all:
	docker build -t llhttp-build .
	docker run -dt --rm --platform linux/amd64 --name llhttp-build llhttp-build /bin/sh
	docker cp llhttp-build:/build/dist .
	docker kill llhttp-build