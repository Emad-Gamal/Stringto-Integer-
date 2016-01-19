
.data
	string: .asciiz "123"
.text 

	la $s0,string
	addi $s2,$zero,0  #final result
	 
	
	for:
		lb  $s1,0($s0)
		beq $s1,$zero,end		#chech end of asciiz
		addi $a0,$s1,0  #char
		addi $a1,$s2,0	#result
		jal num
		addi $s0,$s0,1          #increase the base of array by 1
		add $s2,$v0,$zero		#save the return value in s2
		j for
		
	num:
		addi $t0,$zero,10		#t0 value of 10 to update the num
		mult $a1,$t0			#update the num mult by 10 then add value of next char
		subi $a0,$a0,48			#sub from char ascii 48 to et it's value
		mflo $a1				#but the low reg values in a1
		add $v0,$a1,$a0			#sum the old result with new ine
		jr $ra
		
	end:
	