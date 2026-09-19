#!/bin/bash

# Create storage directory if it doesn't exist
mkdir -p ./chromeos

echo "Starting ChromeOS Flex Docker container..."
docker run -it --rm --name chromeos \
  -e "VERSION=stable" \
  -p 8006:8006 \
  --device=/dev/kvm \
  --device=/dev/net/tun \
  --device-cgroup-rule="c 226:* rwm" \
  --cap-add NET_ADMIN \
  -v "${PWD}/chromeos:/storage" \
  -v /dev/dri:/dev/dri \
  --stop-timeout 120 \
  docker.io/forkymcforkface/chromeos
