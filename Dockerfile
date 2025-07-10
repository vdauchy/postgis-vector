FROM postgis/postgis:17-3.5

RUN set -e \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-${PG_MAJOR}-pgvector \
    && rm -rf /var/lib/apt/lists/*
