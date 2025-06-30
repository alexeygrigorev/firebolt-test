Download the data:

```bash
cd data
bash data-download.sh
```


Run it with Docker

```bash
docker rmi ghcr.io/firebolt-db/firebolt-core:preview-rc

docker run -it --rm \
  --ulimit memlock=8589934592:8589934592 \
  --security-opt seccomp=unconfined \
  -p 127.0.0.1:3473:3473 \
  -v firebolt-core-data:/firebolt-core/volume \
  -v ./data:/data \
  ghcr.io/firebolt-db/firebolt-core:preview-rc
```

Execute the client:

```bash
#docker exec -ti firebolt-core fbcli
docker exec -ti ecstatic_yalow fbcli
```

Let's run some queries:

```bash
SELECT count(1) FROM READ_PARQUET('/data/fhvhv_tripdata_2024-01.parquet');

SELECT count(1), $source_file_name 
FROM READ_PARQUET('/data/*.parquet')
GROUP BY $source_file_name;

SELECT "PULocationID", count(1) as CNT, $source_file_name
FROM READ_PARQUET('/data/*.parquet')
GROUP BY $source_file_name, "PULocationID"
HAVING CNT >= 150000
ORDER BY $source_file_name, "PULocationID";
```

