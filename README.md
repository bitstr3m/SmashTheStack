# SmashTheStack
An updated tutorial of Aleph One's 1996 paper  "Smashing The Stack For Fun And Profit"

This project is in support of the 2nd annual Information Security COnference at California State University Northridge. The workshop was a presentation on buffer overflows and how they are exploited. THis project is the support documentation for that workshop.
For interested parties wishing to follow along in this tutorial this tutorial was rn on the following configuration

Operating System: Ubuntu 18.04.3 LTS
Note: If you are using the 64-bit version of the OS you will need to install the necessary 32-bit libraries for this tutorial.

```console
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 g++-multilib build-essential gdb
```

If you are running the 32-bit version then you need the following additional packages.

```console
sudo apt install build-essential gdb
```
In order to compile the example, code you need to disable the security features that have been enabled since Smashing the Stack has been written. Here’s an example of how to compile example1.c:

```console
gcc -m32 -fno-stack-protector -z execstack -D_FORTIFY_SOURCE=0 -o example1 example1.c
```
where
- -m-32: compile for 32 bit.
- -fno-stack-protector: disable stack canaries
- -z execstack: ensure the stack is executable (disable NX bit protection)
- -D_FORTIFY_SOURCE=0: disable FORTIFY_SOURCE

Before running programs you need to disable ASLR for your system so that addresses are predictable.

To disable ASLR:
```console
sudo sysctl -w kernel.randomize_va_space=0
```
To re-enable ASLR:
```console
sudo sysctl -w kernel.randomize_va_space=2
```
