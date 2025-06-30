docker rmi ghcr.io/firebolt-db/firebolt-core:preview-rc

docker run -it --rm \
  --ulimit memlock=8589934592:8589934592 \
  --security-opt seccomp=unconfined \
  -p 127.0.0.1:3473:3473 \
  -v firebolt-core-data:/firebolt-core/volume \
  ghcr.io/firebolt-db/firebolt-core:preview-rc


