from node:16-alpine as builder
workdir '/app'

copy package.json .
run npm install
copy . .
run npm run build

# /app/build will have the stuff

from nginx
copy --from=builder /app/build /usr/share/nginx/html
# default command wll start nginx in the nginx container