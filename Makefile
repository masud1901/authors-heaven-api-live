build:
	docker compose -f local.yml up --build -d --remove-orphans

up:
	docker compose -f local.yml up -d

down:
	docker compose -f local.yml down

show_logs:
	docker compose -f local.yml logs

migrate:
	docker compose -f local.yml run --rm api python3 manage.py migrate

makemigrations:
	docker compose -f local.yml run --rm api python3 manage.py makemigrations

collectstatic:
	docker compose -f local.yml run --rm api python3 manage.py collectstatic --no-input --clear

runserver:
	docker compose -f local.yml run --rm api python3 manage.py runserver

superuser:
	docker compose -f local.yml run --rm api python3 manage.py createsuperuser

down-v:
	docker compose -f local.yml down -v

volume:
	docker volume inspect authors-src_local_postgres_data

authors-db:
	docker compose -f local.yml exec postgres psql --username=postgres --dbname=authors-live

flake8:
	docker compose -f local.yml exec api flake8 .

black-check:
	docker compose -f local.yml exec api black --check --exclude=migrations .

black-diff:
	docker compose -f local.yml exec api black --diff --exclude=migrations .

black:
	docker compose -f local.yml exec api black --exclude=migrations .

isort-check:
	docker compose -f local.yml exec api isort . --check-only --skip venv --skip migrations

isort-diff:
	docker compose -f local.yml exec api isort . --diff --skip venv --skip migrations

isort:
	docker compose -f local.yml exec api isort . --skip venv --skip migrations

