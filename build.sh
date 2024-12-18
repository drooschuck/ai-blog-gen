#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Run database migrations
python manage.py migrate

# Create a superuser if it doesn't exist
python - <<EOF
import os
from django.core.management import call_command
from django.contrib.auth import get_user_model

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "ai_blog_app.settings")
import django
django.setup()

User  = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'drooschuck@gmail.com', 'admin@1234')
EOF
