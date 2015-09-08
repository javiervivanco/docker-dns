# Tiny dnsmasq server IP/FQDN maps

Return IP for a specific FQDN or subdomain

## Example dnsmasq.conf

    address=/.server-dev.docker/10.11.12.13
    address=/.site1.server-dev.docker/10.12.14.16
    address=/.docker/172.17.42.1

    listen-address=0.0.0.0
    interface=lo
    interface=eth0
    interface=docker0


## Example use

Modified your dnsmasq.conf.dist to dnsmasq.conf

    docker run -d -p '0.0.0.0:53:53/udp' -v $PWD/dnsmasq.conf.d/:/etc/  javiervivanco/docker-dns 


    #$ dig @127.0.0.1 my.host.dev

    ; <<>> DiG 9.9.5-3ubuntu0.2-Ubuntu <<>> @127.0.0.1 my.host.dev
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 43789
    ;; flags: qr aa rd ra ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

    ;; QUESTION SECTION:
    ;my.host.dev.           IN  A

    ;; ANSWER SECTION:
    my.host.dev.        0   IN  A   172.17.42.1

    ;; Query time: 1 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Tue Sep 08 16:42:35 ART 2015
    ;; MSG SIZE  rcvd: 45
    
    #$ dig @127.0.0.1 site1.server-dev.docker

    ; <<>> DiG 9.9.5-3ubuntu0.2-Ubuntu <<>> @127.0.0.1 site1.server-dev.docker
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 43789
    ;; flags: qr aa rd ra ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

    ;; QUESTION SECTION:
    ;site1.server-dev.docker.           IN  A

    ;; ANSWER SECTION:
    site1.server-dev.docker.        0   IN  A   10.12.14.16

    ;; Query time: 1 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Tue Sep 08 16:42:35 ART 2015
    ;; MSG SIZE  rcvd: 45
