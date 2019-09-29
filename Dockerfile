FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# when container runs, nginx run the start command automatically
