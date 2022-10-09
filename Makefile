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
