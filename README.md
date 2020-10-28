# PHP FPM Container

[![Docker Pulls](https://img.shields.io/docker/pulls/sonoranrp/php-invisionforum.svg)](https://hub.docker.com/r/sonoranrp/php-invisionforum/)
[![Docker Stars](https://img.shields.io/docker/stars/sonoranrp/php-invisionforum.svg)](https://hub.docker.com/r/sonoranrp/php-invisionforum/)
[![Docker Build](https://img.shields.io/docker/cloud/automated/sonoranrp/php-invisionforum.svg)](https://hub.docker.com/r/sonoranrp/php-invisionforum/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/sonoranrp/php-invisionforum.svg)](https://hub.docker.com/r/sonoranrp/php-invisionforum/)

Latest offical [PHP-FPM](https://hub.docker.com/_/php/) container configured with basic extensions and [production settings](https://github.com/php/php-src/blob/master/php.ini-production). Includes additional extensions for Invision Community Forum software.

## Changes to offical container

### Extentions

- pdo_mysql
- mysqli
- calendar
- intl
- GD
- ZIP
- EXIF

### php.ini

- date.timezone = Etc/UTC
- upload_max_filesize = 25M
- post_max_size = 25M

## Configuration

See [example directory](https://github.com/SonoranRP/docker-php/tree/master/example) for sample config file showing how to use this container with [nginx](https://hub.docker.com/_/nginx/).

## Quickstart

```yml
php:
  image: sonoranrp/php-invisionforum

  volumes:
    # Website files
    - ./www:/www

  ports:
    - "9000:9000"
```
