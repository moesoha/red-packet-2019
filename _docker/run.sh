#!/bin/sh

/usr/sbin/nginx &
/usr/bin/redis-server &
/usr/local/sbin/php-fpm -D

tail -f /var/log/nginx/project.log
