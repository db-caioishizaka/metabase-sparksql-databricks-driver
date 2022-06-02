FROM metabase/metabase:v0.43.1

ENV MB_DB_CONNECTION_TIMEOUT_MS=60000

COPY ./target/sparksql_databricks.metabase-driver.jar /plugins/
