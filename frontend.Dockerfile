FROM nginx:alpine

# Copia los archivos estáticos desde tu carpeta local al contenedor
COPY ./index.html /usr/share/nginx/html/index.html
# Si tienes más archivos (css, js), copia todo el directorio:
COPY . /usr/share/nginx/html

# Expone el puerto 80 para acceder a la web
EXPOSE 80