# WL-Dockerfile
# Use Node.js LTS version as base image
FROM node:20-slim

# Set work directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire source code to the container
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY .env* ./

# Create necessary data directories
RUN mkdir -p /app/data/cookies
RUN mkdir -p /app/zalo_data

# Clean npm cache
RUN npm cache clean --force

# Set required permissions
RUN chmod -R 755 /app

# Expose the application port
EXPOSE 3000

# Define the entry point
CMD ["node", "src/server.js"]