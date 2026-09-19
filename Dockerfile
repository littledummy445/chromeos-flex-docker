FROM docker.io/forkymcforkface/chromeos:latest

# Set environment variables for stable release
ENV VERSION=stable

# Expose the web interface port
EXPOSE 8006
