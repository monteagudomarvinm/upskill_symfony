SHELL := /bin/bash

grn=$'\e[1;32m
yel=$'\e[1;33m
end=$'\e[0m

# Docker Operations

deploy:
	docker-compose up -d --build ;\

start:
	docker-compose up -d ;\

stop: 
	docker-compose down ;\

restart:
	docker-compose down ;\
	make start

list:
	docker-compose ps

docker-update: 
	docker-compose pull ;\
	docker volume prune -f || true ;\
	dmake deploy ;\

docker-clean:
	docker ps -qa --no-trunc --filter "status=exited" | xargs docker rm || true ;\
	docker images -f "dangling=true" -q | xargs docker rmi || true ;\
	docker volume prune -f || true ;\

ssh:
	docker-compose exec upskill_symfony_php bash

