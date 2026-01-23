FROM node:20-alpine
WORKDIR /app

# copy everything (frontend + shared + backend if present)
COPY . .

# install + build frontend
WORKDIR /app/frontend
RUN npm install
RUN npm run build

EXPOSE 8080
CMD ["npm", "run", "start"]
