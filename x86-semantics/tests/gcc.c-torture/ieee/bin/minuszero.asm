.globl _start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	$40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -24(%rbp)
	movl	$-5, -20(%rbp)
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	-24(%rbp), %xmm1, %xmm1
	vmovq	%xmm1, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	-20(%rbp), %xmm0, %xmm0
	vmovq	%rax, %xmm3
	vdivsd	%xmm0, %xmm3, %xmm2
	vmovq	%xmm2, %rax
	movq	%rax, -16(%rbp)
	movl	$0, -28(%rbp)
	jmp	L2
L4:
	movl	-28(%rbp), %eax
	cltq
	movzwl	-16(%rbp,%rax,2), %eax
	cmpw	$-32768, %ax
	jne	L3
	movl	$0, %edi
	call	exit
L3:
	addl	$1, -28(%rbp)
L2:
	movl	-28(%rbp), %eax
	cmpl	$3, %eax
	jbe	L4
	call	abort
