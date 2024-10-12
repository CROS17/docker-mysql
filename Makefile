.PHONY: help

CMD ?= ''

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
nginxversion=1.0.0

setup: ## mysql setup configuration for development in the project
	@make build
	@make up
	@make migrate

build:
	docker-compose up --build
stop: ## Stop the application
	docker-compose down
start: ## Start the application api
	docker exec app bash -c "php artisan serve --host=0.0.0.0 --port=8000"
up: ## Execute the container
	docker-compose up -d
cli_db:  ## Enter to container console from MySQL
	docker exec -it db mysql -u root -psecret
migrate: ## Execute the container
	docker exec -it app php artisan migrate --seed
refresh: ## Execute the container
	docker exec -it app php artisan migrate:refresh --seed
