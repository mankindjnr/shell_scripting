# shell scripting

```bash
mv -v
mv --verbose
```
With the verbose flag, the command shows you where you are moving the file to and if the file is a large one, it will show you when the moving starts and we it ends.

## Permissions
A file has three owner references (user, group and others) - with this format,you can choose who to give what permissions 
```bash
chmod ugo filename
```
0 = 0 = nothing
1 = 1 = execute
2 = 2 = write
3 = 2+1 = write + execute
4 = 4 = read
5 = 4 + 1 = read + execute
6 = 4 + 2 = read + write
7 = 4 + 2 + 1 = read + write + execute

i.e
```bash
chmod 777 filename
```
The above statement gives the user, all permissions, the group, all permissions and others- all permissions.

# shell script basics
A shell is a command line interpreter. It translates commands entered by the user and converts them to a langage that is understood by the kernel.

A shell script is a list of commands, which are listed in order of execution. A good shell script will have comments, preceded by the # sign - Describes the steps.

### Accepting input from the command line, store in a variable and print it out to the user or pass it
```bash
#!/bin/bash
# Author: Mankindjnr

echo "what is your name?"

read PERSON
echo "Hello, $PERSON"
```

## Variables
### readonly varaibles
When a variable is marked readonly, it cannot be changed later on.
i.e
```bash
#!/bin/bash

#scalar variable
NAME="Amos Njoroge"
readonly NAME
NAME="KAMJORO"
```
The above script will through an error here ```NAME="KAMJORO```. This is because the  varibale __NAME__ has already been marked __readonly__, it can no longer be reassigned another value.

You can print the value of the variable using the echo command:
```bash
#!/bin/bash

echo $NAME
```

### unsetting a variable / deleting a variable
This directs the shell to remove the varaible from the list of variables that it tracks.

```bash
#!/bin/bash

NAME="Njoroge"
unset NAME
echo $NAME
```
Here we unset the variable name, when we echo the variable after, it will not be printed to the commandline since it is no longer tracked by the shell.


### Special Variables
```bash
$0
$1.....$9
$#
$*
$@
$?
$$

#!/bin/bash

echo "File name: $0"
echo "First parameter: $1"
echo "Second paramter: $2"
echo "Quoted values: $@"
echo "Quoted Values: $*"
echo "No of Parameters passed to the script: $#"
```
```./variables.sh one two three```

```bash
#!/bin/bash

for TOKEN in $*
do
    echo $TOKEN
done
```
This for loop will collect all the parameters passed to the file during execution and print them one after the other. i.e ```./varaibles one two three``` will print

```
one
two
three
```

To check the exit status for the script you just executed, run
```bash
echo $?
```
This will print ```0``` if the last command run was successful or other numbers depending on the error you just got.

# Basic Operators
#### Addition | Subtraction
```bash
`expr $a + $b`
`expr $a + $b`
```

#### Multiplication | Division | Modulus
```bash
`expr $a \* $b`
`expr $b / $a`
`expr $b % $a`
```

#### Assignment | Equality | Not Equality
```bash
a = $b
[ $a == $b ]
[ $a != $b ]
```

# Relational Operators
__They only work for numeric values__
### -eq
Checks if two operands are equal or not (returns true or False)
```bash
[ $a -eq $b ]
```

### -ne
__notequal__
Checks if two operands are equal or not. __If the values are not equal, then the condition becomes true.__
```bash
[ $a -ne $b ]
```

### -gt
Checks if the value of the left operand is greater that the value of right operand: if yes, then the condition becomes true.
```bash
[ $a -gt $b ]
```

### -lt
Checks if the value of the left operand is less than the value of the right operand. If yes, then the condition becomes true.
```bash
[ $a -lt $b ]
```

### -ge
Checks if the value of left operand is greater than or equal to the value of right operand. if yes, then the condition becomes true.
```bash
[ $a -ge $b ]
```

### -le
Checks if the value of the left operand is less than or equla to the value of the right operand. if yes, then the condition becomes true.
```bash
[ $a -le $b ]
```

# Boolean Operators
```bash
!
[ !false ] # is true
```
A logical notation. This inverts a true conditio into false and vice versa

```bash
-o
[ $a -lt 20 -o $b -gt 100 ] #if any of this conditions is true, the whole statement is true
```
This is logical __OR__. If one of the operands is true, then the condition becomes true.

```bash
-a
[ $a -lt 20 -a $b -gt 100 ] # if both are true, the statement is true, if nor is false, its FALSE
```
This is a logical __AND__. if both the operands are true, then the condition becomes true, otherwise false

# string operators
```bash
= # checks if two strings are equal
!= # not equal
[ $a = $b ]
```
Check if the value of two operands are equal or not

```bash
-z
[ -z $a ]
```
Checks if the given string operand size is zero, it it is zero length, then it returns true

```bash
-n
[ -n $a ]
```
Checks if the given string operand size is non-zero. if it is non-zero length, it returns true

```bash
str
[ $a ]
```
Checks if a string is empty or not, is it is empty, it returns false

Other Tests include __File Test Operators__

# SHELL LOOPS

### For Loop
```bash
#!/bin/bash
for var in words
do
    statement
done

for var in 0 1 2 3 4 5 6 7 8 9
do 
    echo $var
done
```

### While Loop
```bash
while condition
do
    statement
done

a=0
while [ $a -lt 10 ]
do
    echo $a
    a=`expr $a + 1`
done
```
While loops executes as long as a certain condition is true but until command wille xecutte till the condition is met.

### Until Command
```bash
until command
do
    statement
done

# until $a is not less than 10, execute, when a is greater than or equal to ten, then it will not be less than 10, hence it ends
a=0
until [ ! $a -lt 10 ]
do
    echo $a
    a=`expr $a + 1`
done
```

### Nested Loops
```bash
a=0
while [ "$a" -lt 10 ]
do
    b="$a"
    while [ "$b" -ge 0 ]
    do
        echo -n "$b "
        b=`expr $b - 1`
    done
    echo
    a=`expr $a + 1`
done
```

### Loop Control
```bash
#INFINITE LOOP
a=10

until [ $a -gt 0 ]
do
    echo $a
    a=`expr $a + 1`
done
```

```bash
#BREAK
a=0

until [ $a -gt 10 ]
do
    echo $a
    if [ $a -eq 5 ]
    then
        break
    fi
    a=`expr $a + 1`
done

#CONTINUE
NUMS="1 2 3 4 5 6 7 8 9"

for NUM in $NUMS
do
    Q=`expr $NUM % 2`
    if [ $Q -eq 0 ]
    then
        echo "Number is an even number!!"
        continue
    fi
    echo "FOund odd NUmber"
done
```

# SHELL FUNCTIONS
### Defining functions and invoking them
```bash
#!/bin/bash

#define function
Hello(){
    echo "Hello World"
}

#invoke Function
Hello
```
### Functions with Parameters
```bash
Hello(){
    echo "Hello $1 $2"
}

#invoke with parameters
Hello Amos Njoro
```
### Functions with return command
```bash
Hello(){
    echo "Hello $1 $2"
    return 10
}

#Invoke FUnction
Hello mankind jnr

# capture value returned by function
ret=$?
echo "Return value is $ret"
```

# SHELL SCRIPTING USE CASES
```bash

```