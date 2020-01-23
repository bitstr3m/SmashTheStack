	.file	"example1.c"
	.text
	.globl	function
	.type	function, @function
function:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	nop
	leave
	ret
	.size	function, .-function
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$3
	pushl	$2
	pushl	$1
	call	function
	addl	$12, %esp
	nop
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
