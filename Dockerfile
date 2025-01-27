FROM golang:1.16-alpine



WORKDIR /POS



COPY go.mod .
COPY go.sum .



RUN go mod download



COPY . ./
RUN ls
RUN go build -o point/of/sale main.go



EXPOSE 8090:3030
# Run
CMD [ "point/of/sale" ]




ENV MYSQL_HOST: ${MYSQL_HOST}
ENV MYSQL_USER: ${MYSQL_USER}
ENV MYSQL_PASSWORD: ${MYSQL_PASSWORD}
ENV MYSQL_DBNAME: ${MYSQL_DBNAME}
ENV PRIV_KEY: Secretcode



#docker run -e MYSQL_HOST=host.docker.internal -e MYSQL_USER=root -e MYSQL_PASSWORD=abc123 -e MYSQL_DBNAME=sale -p 8090:3030 test_server1




# docker tag local-image:tagname new-repo:tagname
# docker push new-repo:tagname
# MYSQL_DBNAME='sale'
# MYSQL_USER=root
# MYSQL_PASSWORD=abc123
# MYSQL_HOST=host.docker.internal
# PRIV_KEY=Secretcode