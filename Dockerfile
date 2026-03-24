FROM node:18

# Install JDK
RUN apt-get update && apt-get install -y openjdk-21-jdk && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json ./
RUN npm install

COPY server.mjs ./

ENV PORT=8080

EXPOSE 8080

CMD ["npm", "start"]
