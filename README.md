# Tiny dnsmasq server IP/FQDN maps [![Build Status](https://travis-ci.org/javiervivanco/docker-dns.svg)](https://travis-ci.org/javiervivanco/docker-dns)

Return IP for a specific FQDN or subdomain

## Example docker-compose.yml

    dns:
        image: javier/docker-dns
        command: -A /.docker/127.1.1.1 -A /.dev.server/1.2.3.4 -A /.dev.qa/1.2.3.3
        ports:
            - '0.0.0.0:53:53/udp'
        extra_hosts:
         - "somehost:162.242.195.82"
         - "otherhost:50.31.209.229"



## Example use

Modified your dnsmasq.conf.dist to dnsmasq.conf
  
    docker run -d -p '0.0.0.0:53:53/udp'  javiervivanco/docker-dns -A /.docker/127.0.0.1 -A /.mydev/127.0.0.2


    #$ dig @127.0.0.1 my.host.mydev

    ; <<>> DiG 9.9.5-3ubuntu0.2-Ubuntu <<>> @127.0.0.1 my.host.mydev
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 43789
    ;; flags: qr aa rd ra ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

    ;; QUESTION SECTION:
    ;my.host.mydev.           IN  A

    ;; ANSWER SECTION:
    my.host.mydev.        0   IN  A   127.0.0.2

    ;; Query time: 1 msec
    ;; SERVER: 127.0.0.1#53(127.0.0.1)
    ;; WHEN: Tue Sep 08 16:42:35 ART 2015
    ;; MSG SIZE  rcvd: 45
    
   
## DNS on ubuntu or debian 

If you want to have access in your local machine to the DNS, please add in /etc/resolvconf/resolv.conf.d/head

    nameserver 127.0.0.1 
    # Or IP of your container server


