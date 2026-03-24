FROM node:18

# Install Node + Java JDK (includes javac compiler and java runtime)
RUN apt-get update && apt-get install -y openjdk-17-jdk-headless && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package.json ./
RUN npm install
COPY server.mjs ./

ENV PORT=8080
EXPOSE 8080

CMD ["npm", "start"]
