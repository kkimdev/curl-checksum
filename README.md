Just putting out the idea, probably I'm not going to implement :).

# curl-checksum

curl-checksum is a hypothetical command line utility that combines curl +
checksum. There was a discussion about this in
[the Curl repository](https://github.com/curl/curl/issues/1399) but
didn't get enough attention.

```bash
# If the checksum doesn't match, it fails.
./curl-checksum.sh example.org --sha256 3587cb776ce0e4e8237f215800b7dffba0f25865cb84550e87ea8bbac838c423

# Without a checksum argument, it prints out the checksums
./curl-checksum.sh example.org
# --sha256 3587cb776ce0e4e8237f215800b7dffba0f25865cb84550e87ea8bbac838c423
# --sha512 ddf40ddbc3887566ad782ea04cc6a4cbd5bc5db159fe9baa91b773cd7cc0c30498efdfb9fe7524ec1c2ded1e8513544c5a6703e0785d0bfd6aeca4be603701ff
# --whirlpoolsum 3257ceb9b59847f225ebb819e742b8f4e585be899f8b8cf68d949c3c070a2d6c05f910e7af86c012346d1d73f7696819508bf2b88b7b1a16ec2e36dd78005574
# --...
```

Also it correctly take account `-o` and `-O` options.
