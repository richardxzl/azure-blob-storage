# Usa una imagen oficial de PHP con extensiones recomendadas para Laravel
FROM php:8.2-fpm

# Instala dependencias del sistema y extensiones de PHP necesarias
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev zip unzip git curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Instala Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Setea el directorio de trabajo
WORKDIR /var/www

# Copia los archivos del proyecto
COPY . .

# Instala las dependencias de PHP
RUN composer install

# Permisos (solo para desarrollo)
RUN chown -R www-data:www-data /var/www && chmod -R 775 /var/www/storage

EXPOSE 9000
CMD ["php-fpm"]
