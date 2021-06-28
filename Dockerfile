
# stage 1

FROM node:alpine AS studentshop9
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=studentshop9 /app/dist/studentshop9 /usr/share/nginx/html
EXPOSE 80