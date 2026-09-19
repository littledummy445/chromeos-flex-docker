# ChromeOS Flex Docker Emulator

Run a full ChromeOS Flex environment inside a Docker container with QEMU and KVM acceleration, accessible right through your browser.

## Features
* **Web-Based Interface**: Access the virtual machine directly via port `8006`.
* **Persistent Storage**: Mounts a local directory (`/storage`) to keep your virtual disk intact.
* **Hardware Acceleration**: Utilizes `/dev/kvm` and `/dev/dri` for smoother performance.

---

## Quick Start Guide

### 1. Prerequisites
Ensure your host environment or Codespace supports hardware acceleration (`/dev/kvm` must be available).

### 2. Run the Container
Execute the following Docker command in your terminal:

```bash
docker run -it --rm --name chromeos -e "VERSION=stable" -p 8006:8006 --device=/dev/kvm --device=/dev/net/tun --device-cgroup-rule="c 226:* rwm" --cap-add NET_ADMIN -v "${PWD:-.}/chromeos:/storage" -v /dev/dri:/dev/dri --stop-timeout 120 docker.io/forkymcforkface/chromeos
