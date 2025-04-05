FROM ghcr.io/open-webui/open-webui:main

# 1. Create directories FIRST with permissions
RUN mkdir -p /app/data && \
    chmod -R 777 /app/data && \
    mkdir -p /root/.config/git && \
    chmod 777 /root/.config /root/.config/git

# 2. Sync script setup
COPY sync_data.sh /app/sync_data.sh
RUN chmod +x /app/sync_data.sh

# 3. Auto-start sync
RUN echo "/app/sync_data.sh &" >> /app/start.sh

WORKDIR /app

