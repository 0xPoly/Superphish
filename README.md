# Superphish
Peter Hortensius, Lenovo CTO, in an interview with Wall Street Journal:
> "We’re not trying to get into an argument with the security guys. They’re dealing with theoretical concerns."

This script to silently intercepts SSL connections made computers infected with Superfish malware on the same network. This attack will intercept all HTTPS traffic and log it to the specificed log file. Works in three stages:
* Activates packet forwarding
* ARP poisoning
* SSL interception with Superfish CA keys

Usage:

    ./superphish -l logfile gateway-ip target-ip

Needed dependecies will be install automatically at first run.

Thanks to:
* [Robbert Graham](https://twitter.com/erratarob) for the [Superfish certificate](http://blog.erratasec.com/2015/02/extracting-superfish-certificate.html)
* [Moxie](https://twitter.com/moxie) for sslniff
