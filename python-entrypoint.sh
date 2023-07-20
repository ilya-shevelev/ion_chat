#!/bin/bash

set -euo pipefail

python manage.py collectstatic --no-input
python manage.py migrate
if [[ "$DJANGO_ENV" = "prod" ]]; then
  mv /app/.env.prod /app/.env
else
  mv /app/.env.example /app/.env
fi
  daphne -b 0.0.0.0 -p 8001 django_project.asgi:application
