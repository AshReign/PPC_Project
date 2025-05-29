# Use Python 3.9 slim as the base image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Install Git and necessary dependencies, then clean up
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the entire project into the /app directory in the container
COPY . /app

# Ensure entrypoint.sh is executable
RUN chmod +x /app/.github/scripts/entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/bin/bash", "/app/.github/scripts/entrypoint.sh"]
