#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION pgcrypto;
    CREATE SCHEMA AUTHORIZATION $POSTGRES_USER;
    ALTER USER $POSTGRES_USER SET search_path TO $POSTGRES_USER, public;
EOSQL

echo "DSpace database initialized"
