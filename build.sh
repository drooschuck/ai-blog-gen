#!/bin/bash

# Exit immediately if a command exits with a non-zero status
#set -e

# Print each command before executing it
#set -x

# Step 1: Set up Python environment
# You can specify the Python version you want to use
#PYTHON_VERSION="3.9"  # Change this to your desired Python version
#pyenv install -s $PYTHON_VERSION
#pyenv global $PYTHON_VERSION

# Step 2: Upgrade pip
pip install --upgrade pip

# Step 3: Install dependencies
# Make sure you have a requirements.txt file in your project root
pip install -r requirements.txt

# Step 5: Collect static files
# This is important for serving static files in production
python manage.py collectstatic --noinput

# Step 4: Run migrations
# Make sure to set the environment variable for your database
python manage.py migrate --noinput



# Step 6: (Optional) Run tests
# Uncomment the following line if you want to run tests before deployment
# python manage.py test

# Step 7: Start the application
# This command may vary depending on how you want to run your Django app
# For example, using Gunicorn:
#gunicorn myproject.wsgi:application --bind 0.0.0.0:8000
