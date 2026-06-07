#!/bin/sh
cd /var/www/html

touch .env

touch database/database.sqlite

php artisan config:cache
php artisan route:cache
php artisan view:cache

php artisan migrate --force

exec supervisord -c /etc/supervisord.conf
