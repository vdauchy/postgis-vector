FROM postgis/postgis:17-3.5

ARG PGBACKREST_VERSION=2.57.0

RUN set -e \
    && apt-get update \
    && PGBACKREST_PKG_VERSION="$(apt-cache madison pgbackrest | awk -v ver="${PGBACKREST_VERSION}" '$3 ~ "^"ver {print $3; exit}')" \
    && if [ -z "${PGBACKREST_PKG_VERSION}" ]; then echo "pgbackrest version ${PGBACKREST_VERSION} not found"; exit 1; fi \
    && apt-get install -y --no-install-recommends \
       postgresql-${PG_MAJOR}-pgvector \
       pgbackrest=${PGBACKREST_PKG_VERSION} \
    && rm -rf /var/lib/apt/lists/*
