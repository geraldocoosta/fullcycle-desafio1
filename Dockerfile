FROM golang as build

WORKDIR /var/go

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch

WORKDIR /root
COPY --from=build /var/go/main ./

CMD ["./main"]