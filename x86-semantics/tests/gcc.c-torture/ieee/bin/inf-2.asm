test:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	vmovsd	%xmm0, -8(%rbp)
	vmovsd	%xmm1, -16(%rbp)
	movq	-8(%rbp), %rax
	vmovq	%rax, %xmm2
	vucomisd	LC0(%rip), %xmm2
	jbe	L18
	call	abort
L18:
	movabsq	$-4503599627370497, %rax
	vmovq	%rax, %xmm3
	vucomisd	-8(%rbp), %xmm3
	jbe	L19
	call	abort
L19:
	movabsq	$-4503599627370497, %rax
	vmovq	%rax, %xmm4
	vucomisd	-16(%rbp), %xmm4
	jbe	L20
	call	abort
L20:
	movq	-16(%rbp), %rax
	vmovq	%rax, %xmm5
	vucomisd	LC0(%rip), %xmm5
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L8
	call	abort
L8:
	movq	-8(%rbp), %rax
	vmovq	%rax, %xmm6
	vucomisd	LC0(%rip), %xmm6
	jbe	L21
	call	abort
L21:
	movabsq	$-4503599627370497, %rax
	vmovq	%rax, %xmm7
	vucomisd	-8(%rbp), %xmm7
	jbe	L22
	call	abort
L22:
	leave
	ret
testf:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	vmovss	%xmm0, -4(%rbp)
	vmovss	%xmm1, -8(%rbp)
	movl	-4(%rbp), %eax
	vmovd	%eax, %xmm2
	vucomiss	LC2(%rip), %xmm2
	jbe	L40
	call	abort
L40:
	movl	LC3(%rip), %eax
	vmovd	%eax, %xmm3
	vucomiss	-4(%rbp), %xmm3
	jbe	L41
	call	abort
L41:
	movl	LC3(%rip), %eax
	vmovd	%eax, %xmm4
	vucomiss	-8(%rbp), %xmm4
	jbe	L42
	call	abort
L42:
	movl	-8(%rbp), %eax
	vmovd	%eax, %xmm5
	vucomiss	LC2(%rip), %xmm5
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L30
	call	abort
L30:
	movl	-4(%rbp), %eax
	vmovd	%eax, %xmm6
	vucomiss	LC2(%rip), %xmm6
	jbe	L43
	call	abort
L43:
	movl	LC3(%rip), %eax
	vmovd	%eax, %xmm7
	vucomiss	-4(%rbp), %xmm7
	jbe	L44
	call	abort
L44:
	leave
	ret
testl:
	pushq	%rbp
	movq	%rsp, %rbp
	fldt	16(%rbp)
	fldt	LC4(%rip)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	L62
	call	abort
L62:
	fldt	LC5(%rip)
	fldt	16(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	L63
	call	abort
L63:
	fldt	LC5(%rip)
	fldt	32(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	L64
	call	abort
L64:
	fldt	32(%rbp)
	fldt	LC4(%rip)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L52
	call	abort
L52:
	fldt	16(%rbp)
	fldt	LC4(%rip)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	L65
	call	abort
L65:
	fldt	LC5(%rip)
	fldt	16(%rbp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	L66
	call	abort
L66:
	popq	%rbp
	ret
.globl _start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	movabsq	$9218868437227405312, %rdx
	movabsq	$4629981891913580544, %rax
	vmovq	%rdx, %xmm1
	vmovq	%rax, %xmm0
	call	test
	vmovss	LC9(%rip), %xmm1
	vmovss	LC10(%rip), %xmm0
	call	testf
	movabsq	$-9223372036854775808, %rax
	movl	$32767, %edx
	pushq	%rdx
	pushq	%rax
	movabsq	$-8646911284551352320, %rax
	movl	$16388, %edx
	pushq	%rdx
	pushq	%rax
	call	testl
	addq	$32, %rsp
	movl	$0, %eax
	leave
	ret
LC0:
	.long	4294967295
	.long	2146435071
LC2:
	.long	2139095039
LC3:
	.long	4286578687
LC4:
	.long	4294967295
	.long	4294967295
	.long	32766
	.long	0
LC5:
	.long	4294967295
	.long	4294967295
	.long	65534
	.long	0
LC9:
	.long	2139095040
LC10:
	.long	1107820544
