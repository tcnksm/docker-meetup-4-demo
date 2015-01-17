Demo for Docker meetup #4
====

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)][license]

[license]: https://github.com/tcnksm/deeeet.com/blob/master/LICENSE

This is demo for [docker meetup tokyo #4](http://connpass.com/event/10318/).

Deploy [tcnksm/docker-meetup-demo-web](https://registry.hub.docker.com/u/tcnksm/docker-meetup-demo-web/) container and load-balancing it by [tcnksm/docker-meetup-demo-lb](https://registry.hub.docker.com/u/tcnksm/docker-meetup-demo-lb/) container. 

## Workflows

On Local

```bash
$ docker run -d -p 8888:80 tcnksm/docker-meetup-demo-web:1
$ docker run -d -p 9999:80 tcnksm/docker-meetup-demo-web:2
```

Check sites

```bash
$ curl $(boot2docker ip 2>/dev/null):8888
$ curl $(boot2docker ip 2>/dev/null):9999
```

Build CoreOS cluster on DigitalOcean

```bash
$ cd tf
$ terraform apply
```

```bash
$ export FLEETCTL_TUNNEL="128.199.199.122"
$ fleet list-machines
```

Start first web container (`tcnksm/docker-meetup-demo-web:1`) service and its side kick service

```bash
$ ls unit-files/web/1
$ fleetctl start unit-files/web/1/*
```

```bash
$ fleetctl list-units
```

Start lb container (`tcnksm/docker-meetup-demo-lb`) service.

```bash
$ ls unit-files/lb
$ fleetctl start unit-files/lb/lb.service
```

```bash
$ fleetctl list-units
```

Start second web container (`tcnksm/docker-meetup-demo-web:2`) service and its side kick service.

```bash
$ ls unit-files/web/1
$ fleetctl start unit-files/web/1/*
```

```bash
$ fleetctl list-units
```

## Author

[tcnksm](https://github.com/tcnksm)
