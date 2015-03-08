# syslog-ng in docker

Minimal syslog-ng container (8.5mb) that listens for tcp and upd on port 514
and writes logs to `/var/log/syslog-ng/$PROGRAM/$PROGRAM.log`.

## Usage

Listen for udp port 514 on localhost and save logs to `/var/log/syslog-ng`:

```
docker run -d -p 127.0.0.1:514:514/udp \
    -v /var/log/syslog-ng:/var/log/syslog-ng \
    --name syslog-ng bobrik/syslog-ng
```

If you want to change config, just bind-mount it to `/etc/syslog-ng/syslog-ng.conf`.
