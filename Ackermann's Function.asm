	# Ackermans
        # Written by Anthony Gatte
        
        # A(m, n) = n+1				if m = 0
        #	  = A(m - 1, 1)			if m > && n = 0
        #	  = A(m - 1, A(m, n - 1))	if m && n > 0
        
        .data
	.align  2
	
mprmpt: .asciiz "Enter m: "
nprmpt: .asciiz "Enter n: "
aanswr:  .asciiz "Ackermanns value = "

	.text
       	.globl main
       	
# --------------------------------------------
       	
# ---------- m value prompt -------------
        li	$v0, 4       
        la      $a0 mprmpt
        syscall
        
        li	$v0, 5
	move 	$t0,$v0
	syscall
	
	move 	$a0, $t0
	move 	$a1, $t1
	
	li 	$v0, 4
	la 	$a0, nprmpt
	syscall
	
	li 	$v0, 5
	syscall
	
	move 	$t1, $v0
	move	$t2, $v0
	
	jal	ackermann
	
        
	addi	$sp, $sp, -16	# stack pointer - allocating space for 4 values
	sw	$ra, 0($sp)	
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	
	move 	$a2, $v0	# moves user value to a2 (argument)
	
	addi	$sp, $sp, -4	# makes new stack for a0
	sw	$a0, 0($sp)	# store a0 in stack at first location

	la 	$a0, result
	li 	$v0, 4
	syscall

	move 	$a0, $t2
	li 	$v0, 1
	syscall
	
	li 	$v0, 10
	syscall
	
ackermann: 
	addi 	$sp, $sp, -8   	# making room in the stack to store 2 registers    
        sw 	$ra, 0($sp)		# store $s0 (m) in stack      
        sw 	$s0, 0($sp)    	# storing return address register $ra in stack
	
	
	
	
	