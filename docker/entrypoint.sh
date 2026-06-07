#!/bin/sh
cd /var/www/html

touch .env

touch /var/www/html/storage/database.sqlite
chown www-data:www-data /var/www/html/storage/database.sqlite

php artisan config:cache
php artisan route:cache
php artisan view:cache

php artisan migrate --force

exec supervisord -c /etc/supervisord.conf
