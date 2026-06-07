#!/bin/sh
set -e
cd /var/www/html

touch .env

DB_FILE="${DB_DATABASE:-/var/www/html/storage/database.sqlite}"
DB_DIR="$(dirname "$DB_FILE")"

mkdir -p "$DB_DIR"
touch "$DB_FILE"
chown www-data:www-data "$DB_FILE"

php artisan config:cache
php artisan route:cache
php artisan view:cache

php artisan migrate --force

exec supervisord -c /etc/supervisord.conf
