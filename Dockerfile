# Use Node.js 20 on Alpine Linux for a smaller image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies (in production mode)
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the port (this is the default port in Docker, but we'll make it dynamic)
EXPOSE ${PORT:-3057}

# Command to run the application
CMD ["node", "app.js"]
