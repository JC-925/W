FROM ghcr.io/open-webui/open-webui:main

# Set default environment variables
ENV WEBUI_SECRET_KEY=$WEBUI_SECRET_KEY
ENV OLLAMA_API_BASE_URL=$OLLAMA_API_BASE_URL

# Fix permissions upfront
RUN mkdir -p /app/data /root/.config/git && \
    chmod -R 777 /app /app/data /root/.config

# Copy sync script
COPY sync_data.sh /app/sync_data.sh
RUN chmod +x /app/sync_data.sh

# Auto-start sync
RUN echo "/app/sync_data.sh &" >> /app/start.sh

WORKDIR /app


