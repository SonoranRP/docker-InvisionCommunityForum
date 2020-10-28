FROM php:fpm

# Install extensions
RUN set -xe \
	&& apt-get update \
	&& apt-get install -y libicu-dev --no-install-recommends \
	&& apt-get install -y zlib1g-dev \
		libpng-dev \
		libzip-dev \
		libjpeg62-turbo-dev \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
	&& docker-php-ext-install -j$(nproc) pdo_mysql mysqli calendar intl zip exif \
	&& docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
	&& apt-get purge -y --auto-remove libicu-dev \
	&& rm -rf /var/lib/apt/lists/*

# Configure production php.ini
RUN curl -sS https://raw.githubusercontent.com/php/php-src/master/php.ini-production \
	| sed -e 's/^;\(date.timezone.*\)/\1 \"Etc\/UTC\"/' \
	-e 's/^\(upload_max_filesize =\).*/\1 25M/' \
	-e 's/^\(post_max_size =\).*/\1 25M/' \
	> /usr/local/etc/php/php.ini
