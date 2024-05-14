# Establecer la imagen base
FROM mysql:8.2

# Copiar el archivo de configuración personalizado al directorio de configuración de MySQL
COPY ./my.cnf /etc/mysql/conf.d/my.cnf

# Establecer las variables de entorno para MySQL
ENV MYSQL_ROOT_PASSWORD=12345
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

# Exponer el puerto de MySQL
EXPOSE 3306
