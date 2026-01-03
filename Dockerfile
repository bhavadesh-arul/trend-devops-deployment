FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy static build files
COPY dist/ /usr/share/nginx/html/

# Change nginx to listen on port 3000
RUN sed -i 's/80/3000/g' /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]