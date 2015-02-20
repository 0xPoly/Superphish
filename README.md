# Superphish
Peter Hortensius, Lenovo CTO, in an interview with Wall Street Journal:
> "We’re not trying to get into an argument with the security guys. They’re dealing with theoretical concerns."

This script will silently intercept SSL connections made from computers infected with Superfish malware on the local network. All traffic will be logged into 'superphish.log'. Works in three stages:

* Activates packet forwarding
* ARP poisoning
* SSL interception with Superfish CA keys

To target all clients on network:

    ./superphish.sh interface gateway-ip
    
Specific target:

    ./superphish.sh interface gateway-ip target-ip

Needed dependecies will be installed automatically at first run.

Thanks to:
* [Robbert Graham](https://twitter.com/erratarob) for the [Superfish certificate](http://blog.erratasec.com/2015/02/extracting-superfish-certificate.html)
* [Moxie](https://twitter.com/moxie) for sslniff
