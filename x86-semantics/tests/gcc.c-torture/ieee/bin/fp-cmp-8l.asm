test_isunordered:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jnp	L2
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L3
L2:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L3:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_not_isunordered:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jp	L6
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L7
L6:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L7:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_isless:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	32(%rbp)
	fldt	16(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	setbe	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L10
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L11
L10:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L11:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_not_isless:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	32(%rbp)
	fldt	16(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	L19
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L16
L19:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L16:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_islessequal:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	32(%rbp)
	fldt	16(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	setb	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L21
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L22
L21:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L22:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_not_islessequal:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	32(%rbp)
	fldt	16(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jnb	L30
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L27
L30:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L27:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_isgreater:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	setbe	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L32
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L33
L32:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L33:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_not_isgreater:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	L41
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L38
L41:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L38:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_isgreaterequal:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	setb	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L43
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L44
L43:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L44:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_not_isgreaterequal:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jnb	L52
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L49
L52:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L49:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_islessgreater:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fucomip	%st(1), %st
	fstp	%st(0)
	sete	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L54
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L55
L54:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L55:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
test_not_islessgreater:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	32(%rbp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jne	L63
	movq	48(%rbp), %rax
	movl	56(%rbp), %edx
	jmp	L60
L63:
	movq	64(%rbp), %rax
	movl	72(%rbp), %edx
L60:
	movq	%rax, -16(%rbp)
	movl	%edx, -8(%rbp)
	fldt	-16(%rbp)
	popq	%rbp
	ret
one_test:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movabsq	$-9223372036854775808, %rax
	movl	$16384, %edx
	pushq	%rdx
	pushq	%rax
	movabsq	$-9223372036854775808, %rax
	movl	$16383, %edx
	pushq	%rdx
	pushq	%rax
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movq	-16(%rbp), %rax
	call %rax
	addq	$64, %rsp
	fld1
	fucomip	%st(1), %st
	setnp	%al
	movl	$0, %edx
	fld1
	fucomip	%st(1), %st
	fstp	%st(0)
	cmovne	%edx, %eax
	movzbl	%al, %eax
	cmpl	-4(%rbp), %eax
	je	L65
	call	abort
L65:
	movabsq	$-9223372036854775808, %rax
	movl	$16385, %edx
	pushq	%rdx
	pushq	%rax
	movabsq	$-4611686018427387904, %rax
	movl	$16384, %edx
	pushq	%rdx
	pushq	%rax
	pushq	40(%rbp)
	pushq	32(%rbp)
	pushq	24(%rbp)
	pushq	16(%rbp)
	movq	-24(%rbp), %rax
	call %rax
	addq	$64, %rsp
	fldt	LC3(%rip)
	fucomip	%st(1), %st
	setnp	%al
	movl	$0, %edx
	fldt	LC3(%rip)
	fucomip	%st(1), %st
	fstp	%st(0)
	cmovne	%edx, %eax
	movzbl	%al, %eax
	cmpl	-4(%rbp), %eax
	je	L64
	call	abort
L64:
	leave
	ret
.globl _start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movl	$14, -20(%rbp)
	movl	$0, -28(%rbp)
	jmp	L68
L71:
	movl	$0, -24(%rbp)
	jmp	L69
L70:
	movl	-24(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$tests.2342, %rax
	movq	8(%rax), %r8
	movl	-24(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$tests.2342, %rax
	movq	(%rax), %rsi
	movl	-24(%rbp), %eax
	cltq
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rdx, %rax
	addq	$8, %rax
	movl	data.2330(,%rax,4), %edi
	movl	-28(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	$data.2330, %rax
	movq	16(%rax), %rcx
	movl	24(%rax), %ebx
	movl	-28(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	$data.2330, %rax
	movl	8(%rax), %edx
	movq	(%rax), %rax
	pushq	%rbx
	pushq	%rcx
	pushq	%rdx
	pushq	%rax
	movq	%r8, %rdx
	call	one_test
	addq	$32, %rsp
	addl	$1, -24(%rbp)
L69:
	cmpl	$5, -24(%rbp)
	jle	L70
	addl	$1, -28(%rbp)
L68:
	movl	-28(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	L71
	movl	$0, %edi
	call	exit
tests.2342:
	.quad	test_isunordered
	.quad	test_not_isunordered
	.quad	test_isless
	.quad	test_not_isless
	.quad	test_islessequal
	.quad	test_not_islessequal
	.quad	test_isgreater
	.quad	test_not_isgreater
	.quad	test_isgreaterequal
	.quad	test_not_isgreaterequal
	.quad	test_islessgreater
	.quad	test_not_islessgreater
data.2330:
	.long	0
	.long	3221225472
	.long	32767
	.long	0
	.long	0
	.long	3221225472
	.long	32767
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.zero	8
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	3221225472
	.long	32767
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.zero	8
	.long	0
	.long	3221225472
	.long	32767
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.zero	8
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	1
	.long	0
	.zero	8
	.long	0
	.long	2147483648
	.long	16383
	.long	0
	.long	0
	.long	2147483648
	.long	16384
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	1
	.zero	8
	.long	0
	.long	2147483648
	.long	16384
	.long	0
	.long	0
	.long	2147483648
	.long	16383
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.zero	8
	.long	0
	.long	2147483648
	.long	32767
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.zero	8
	.long	0
	.long	2147483648
	.long	16383
	.long	0
	.long	0
	.long	2147483648
	.long	32767
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	1
	.zero	8
	.long	0
	.long	2147483648
	.long	32767
	.long	0
	.long	0
	.long	2147483648
	.long	32767
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	1
	.long	0
	.zero	8
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	2147483648
	.long	65535
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.zero	8
	.long	0
	.long	2147483648
	.long	65535
	.long	0
	.long	0
	.long	2147483648
	.long	16383
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	1
	.zero	8
	.long	0
	.long	2147483648
	.long	65535
	.long	0
	.long	0
	.long	2147483648
	.long	65535
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	1
	.long	0
	.zero	8
	.long	0
	.long	2147483648
	.long	32767
	.long	0
	.long	0
	.long	2147483648
	.long	65535
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.zero	8
	.long	0
	.long	2147483648
	.long	65535
	.long	0
	.long	0
	.long	2147483648
	.long	32767
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	1
	.zero	8
LC3:
	.long	0
	.long	2147483648
	.long	16385
	.long	0
