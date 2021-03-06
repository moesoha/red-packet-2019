FROM kkarczmarczyk/node-yarn AS stage-yarn
RUN mkdir /app
ADD ./ui/src /app/src
WORKDIR /app/src
RUN yarn install
RUN yarn build

FROM php:7.2-fpm-alpine3.7
ENV LC_ALL=C.UTF-8
RUN apk add --no-cache \
		nginx redis \
		vim \
	&& \
	cd $(mktemp -d) \
	&& pecl download redis \
	&& mkdir -p /usr/src/php/ext/redis && tar -C /usr/src/php/ext/redis --strip 1 -zxvf redis*tgz \
	&& docker-php-ext-install opcache redis \
	&& echo "All packages installed."

# fix fastcgi bug & create nginx directory
RUN mkdir -p /run/nginx && \
	echo -e '\nfastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;' > /etc/nginx/fastcgi_params

# configure web service
RUN rm -f /etc/nginx/conf.d/default.conf /etc/php/7.2/fpm/pool.d/*
COPY _docker/nginx.conf /etc/nginx/conf.d/www.conf
COPY _docker/php-fpm.ini /usr/local/etc/php-fpm.d/pool.conf

# deploy code
RUN mkdir -p /app
COPY --from=stage-yarn /app/src/dist /app/www
ADD sqlinj/getPoem.php /app/www/
ADD sqlinj/poems.db /app/www/
ADD png/final_rb.png /app/www/09a29bc6-83d1-47fa-b94d-d3219d946f03.png
ADD oreo/tasty.jpg /app/www/8e1a0417-3c5f-474a-9a16-f028c3582f24.jpg
COPY _docker/run.sh /app/run.sh

RUN chown -R root /app/www \
	&& chmod 755 /app/www

EXPOSE 80
CMD ["/app/run.sh"]
