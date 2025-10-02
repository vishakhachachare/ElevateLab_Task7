docker run -d --name=netdata \
  -p 19999:19999 \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/passwd:/host/etc/passwd:ro \
  netdata/netdata
