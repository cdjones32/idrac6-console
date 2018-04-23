# idrac6-console
Utility to make creating a Dell iDrac6 console actually work on OSX...

Dells iDRAC 6 has always had VERY poor support for non-windows environments. This is a simple script and set of binary files required to initiate an iDRAC console without going through the extremely buggy (and typically not working at all) console process from the iDRAC interface.

Ideas liberally stolen from:

https://gist.github.com/xbb/4fd651c2493ad9284dbcb827dc8886d6

Requires an installed JVM, but should not matter too much which version. I have successfully tested on Java 6, 7, 8 and 9.

## Usage

```
./console.sh
```

or... set the environment variables in a script and then call it.

E.g. in a script on the path:

```
ORIGINAL_DIR=`pwd`
      
cd ~/idrac6-console
  
export DRAC_HOST=10.0.0.200
export DRAC_USER=root
export DRAC_PASSWORD=defaultpassword
  
./console.sh
  
cd ${ORIGINAL_DIR}
```