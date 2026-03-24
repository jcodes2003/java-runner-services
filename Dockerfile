FROM node:18

# Install Node + Java runtime (headless JRE for smaller footprint)
RUN apt-get update && apt-get install -y openjdk-21-jre-headless && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package.json ./
RUN npm install
COPY server.mjs ./

ENV PORT=8080
EXPOSE 8080

CMD ["npm", "start"]
