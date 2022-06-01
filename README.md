# Metabase Driver: Spark Databricks

>### ***This project fork upgrades the Metabase plugin for Databricks to use latest Simba JDBC 42 driver and adds support to connect to Databricks SQL compute endpoints***


All you need you do is drop the driver in your Metabase `plugins/` directory. You can grab it [here](https://github.com/ewok/metabase-sparksql-databricks-driver/releases/download/v1.2.1/sparksql_databricks.metabase-driver.jar) or build it yourself:

## Building the driver (the fast way)

Use the `Dockerfile` on this repo:

- `curl -L "https://github.com/ewok/metabase-sparksql-databricks-driver/releases/download/v1.2.1/sparksql_databricks.metabase-driver.jar" -o sparksql-databricks.metabase-driver.jar`
- `docker build -t metabase:metabase-head-databricks-1.2.1 .`

And you can deploy to some docker registry of your own and use the image!

Example of running:
- `docker run -d -p 3000:3000 --name metabase metabase:metabase-head-databricks-1.2.1`

And access `http://localhost:3000`.

## Building the driver (advanced way)

### Prereq: Install Metabase as a local maven dependency, compiled for building drivers

Clone the [Metabase repo](https://github.com/metabase/metabase) first if you haven't already done so.

```bash
cd /path/to/metabase/
```

### Build the Spark Databricks driver

Update deps.edn file:
Point metabase path to metabase/metabase-core and build-drivers extra-deps.

```bash
# (In the sparksql-databricks driver directory)
clojure -X:dev:build
```

### Copy it to your plugins dir and restart Metabase

```bash
mkdir -p /path/to/metabase/plugins/
cp target/sparksql_databricks.metabase-driver.jar /path/to/metabase/plugins/
jar -jar /path/to/metabase/metabase.jar
```

*or:*

```bash
mkdir -p /path/to/metabase/plugins
cp target/sparksql_databricks.metabase-driver.jar /path/to/metabase/plugins/
cd /path/to/metabase_source
clojure -M:run
```
