# grpc-sdk
alpine base gRPC SDK

## build container
```sh
docker build -t ymdymd/grpc-sdk .
```

## run container
```sh
docker run -it -v $PWD:/root/$PWD --rm -net host ymdymd/grpc-sdk 
```


