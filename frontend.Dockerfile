# Etapa 1: Construcción (Se mantiene igual)
FROM node:20-alpine AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: Producción con Apache
FROM httpd:2.4-alpine AS production-stage

# 1. Habilitamos el módulo Rewrite de Apache (necesario para .htaccess)
# Por defecto viene desactivado en la imagen alpine.
RUN sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's/AllowOverride None/AllowOverride All/' /usr/local/apache2/conf/httpd.conf

# 2. Copiamos los archivos de Vite a la carpeta pública de Apache
COPY --from=build-stage /app/dist /usr/local/apache2/htdocs/

# El puerto por defecto de esta imagen es el 80
EXPOSE 80