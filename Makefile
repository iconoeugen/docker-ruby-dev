NAME = iconoeugen/ruby-dev
TAG = latest
all: build

build:
	docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} --build-arg no_proxy=${no_proxy} -t $(NAME) -t $(NAME):$(TAG) .

build-nocache:
	docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} --build-arg no_proxy=${no_proxy} -t $(NAME) -t $(NAME):$(TAG) . --no-cache

run:
	docker run -it $(NAME):$(TAG)
