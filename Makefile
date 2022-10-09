include employee/.env
export

update:
	cd migrations && git pull origin main
	cd worker && git pull origin main
	cd employee && git pull origin main

run-bundle:
	@make run-migrations
	@make run-workers
	@make run-service
	
run-migrations:
	cd migrations && docker-compose up -d && poetry install && cd migrator && poetry run alembic upgrade head

run-workers:
	cd worker && docker-compose up gatherer && docker-compose up parser && docker-compose up generator

run-service:
	cd employee && docker-compose up -d

down:
	cd migrations && docker-compose down
	cd worker && docker-compose down
	cd employee && docker-compose down
