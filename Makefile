run-bundle:
	cd migrations
	docker compose up -d
	cd ../worker
	docker compose up gatherer
	docker compose up parser
	docker compose up generator
	cd ../employee
	docker compose up -d
	
run-migrations:
	cd migtations
	docker compose up -d

run-workers:
	cd worker
	docker compose up gatherer
	docker compose up parser
	docker compose up generator

run-service:
	cd employee
	docker compose up -d
