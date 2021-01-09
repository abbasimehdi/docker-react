FROM node:alpine as builder

WORKDIR /user/app

COPY ./ ./
RUN npm install

RUN npm run build

FROM nginx
COPY --from=builder /user/app/build /usr/share/nginx/html
