#!/bin/bash

Hello(){
    echo "Hello $1 $2"
    return 10
}

#Invoke FUnction
Hello mankind jnr

# capture value returned by function
ret=$?
echo "Return value is $ret"