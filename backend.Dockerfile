FROM php:8.2-apache
# Instalar extensiones de PHP para MySQL
RUN docker-php-ext-install pdo pdo_mysql mysqli

ADD ext /var/www/html/ext
COPY *.html .
COPY *.css /var/www/html
COPY *.js /var/www/html
COPY *.xsd /var/www/html
COPY *.xsl /var/www/html
COPY *.php /var/www/html

