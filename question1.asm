.data
input_prompt: .asciiz "Enter n, followed by n lines of text:\n"
output_msg: .asciiz "The values are:\n"
texts:  .space 400 # 4 byte * 10 (10 chars each line) * 10 (10 lines of text) 
.text
.globl main
main:
	#print input prompt message to user
	la $a0, input_prompt
	li $v0, 4
	syscall
	
	#get first line which is the number of lines integer
	li $v0, 5
	syscall 
	
	move $s1, $v0
	lw $t0, ($s1)
	la $a0, texts
loop: 
	beqz $t0, exit
	#la $a0, ($s1)
	#li $v0, 1
	#syscall
	l
	li $a1, 10
	li $v0, 8
	syscall
	
	subi $t0,$t0, 1
	j loop

reverseprint:
	j exit
exit: 
	li $v0, 10
	syscall
	
