mbentley/owncloud-client
========================

docker image for owncloudcmd
based off of debian:stretch

To pull this image:
`docker pull mbentley/owncloud-client`

Example usage:
```
docker run -t --rm \
  --name owncloud-client \
  -u "$(id -u):$(id -g)" \
  -e OWNCLOUD_URL="https://owncloud.example.com" \
  -e USERNAME="username" \
  -e PASSWORD="password" \
  -e OPTIONS="--non-interactive" \
  -v ${HOME}/ownCloud:/data \
  mbentley/owncloud-client
```
