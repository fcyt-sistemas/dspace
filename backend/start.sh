#!/bin/bash

# Ejecutar el fresh_install
ant fresh_install

echo "Configurando Solr..."
# Configurar Solr para DSpace
mkdir -p /opt/solr/server/solr/configsets
# Aquí deberías copiar los archivos de configuración de Solr para DSpace
#solr_config /opt/solr/server/solr/configsets
cp -R /build/DSpace-dspace-7.6/solr/* /opt/solr/server/solr/configsets

# Iniciar Solr
echo "Iniciando Solr..."
/opt/solr/bin/solr start -force

# Esperar a que Solr esté completamente iniciado
echo "Esperando a que Solr esté listo..."
until curl --output /dev/null --silent --head --fail http://localhost:8983/solr; do
    printf '.'
    sleep 5
done

# Verificar que el core de DSpace existe o crearlo
if [ ! -d "/opt/solr/server/solr/dspace" ]; then
    echo "Creando el core 'dspace' en Solr..."
    /opt/solr/bin/solr create -c dspace -force
fi

# Buscar y mostrar la ubicación de catalina.sh
echo "Buscando catalina.sh..."
find /  -name catalina.sh

#!/bin/bash
# Esperar a que PostgreSQL esté disponible
until PGPASSWORD="dspace" psql -h "dspace-db" -U "dspace" -c '\q'; do
  >&2 echo "PostgreSQL está indisponible - esperando..."
  sleep 5
done

# Ejecutar el fresh_install
# ant fresh_install


cp -R /build/DSpace-dspace-7.6/webapps/*   $CATALINA_HOME/webapps
#cp -R /dspace/webapps/* $CATALINA_HOME/webapps

# Inicializar la base de datos
/build/DSpace-dspace-7.6/bin/dspace database migrate
#/dspace/bin/dspace database migrate

echo "crear administrador...."
#/build/DSpace-dspace-7.6/dspace/bin/dspace 
#/build/DSpace-dspace-7.6/bin/dspace create-administrator
/build/DSpace-dspace-7.6/bin/dspace create-administrator -e fcyt_sistemas@uader.edu.ar -f Sistemas -l FCYT -p abc123456

# Iniciar Tomcat
echo "Iniciando Tomcat..."
/usr/local/tomcat/bin/catalina.sh  run

#para que el contenedor se mantenga activo
#tail -f /dev/null
