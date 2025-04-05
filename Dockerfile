# This is your MAIN Dockerfile that defines the build
FROM ghcr.io/open-webui/open-webui:main

# Fix permission issues
RUN mkdir -p /root/.config/git && \
    chmod 777 /root/.config /root/.config/git && \
    chmod 777 /app

# Copy sync script (from GitHub to container)
COPY --chmod=777 sync_data.sh /app/sync_data.sh

# Set up data directory
RUN mkdir -p /app/data && chmod -R 777 /app/data

# Automatically start sync script
RUN echo "/app/sync_data.sh &" >> /app/start.sh

# Set working directory
WORKDIR /app
