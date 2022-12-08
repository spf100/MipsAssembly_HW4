.data
ask: .asciiz "Please enter a positive non-zero integer: "
number: .word 0
DATASIZE = 4
ask2: .asciiz "Please enter "
finalmsg: .asciiz "The final result is: "
newline: .asciiz "\n"
temp: .asciiz "Enter integer: "
final: .word 0
#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
li $v0, 4
la $a0, ask
syscall

li $v0, 5
syscall
sw $v0, number

li $v0, 9
lw $t0, number
mul $t0, $t0, DATASIZE
move $a0, $t0
syscall

move $s0, $v0

li $t0, 0
lw $t1, number
move $t2, $s0


inputloop:
li $v0, 4
la $a0, temp
syscall

li $v0, 5
syscall

sw $v0, ($t2)
add $t2, $t2, DATASIZE

add $t0, $t0, 1

blt $t0, $t1, inputloop


########################
move $a0, $s0
lw $a1, number
jal calculate
sw $v0, final

li $v0, 4
la $a0, finalmsg
syscall

li $v0, 1
lw $a0, final
syscall

li $v0, 4
la $a0, newline
syscall


li $v0, 10
syscall
.end main



.globl calculate
.ent calculate
calculate:
li $t0, 0
li $t1, 0
move $t2, $a0
calcloop:
lw $t4, ($t2)
add $t0, $t0, $t4	# sum += temps[i];
add $t2, $t2, DATASIZE
# i++
add $t1, $t1, 1
# i<size
blt $t1, $a1, calcloop

div $v0, $t0, $t1  #sum/amount = mean



############################################################################
############################################################################
############################################################################
############################################################################
#THIS SECTION IS HAVING ISSUES WITH STACK WITHOUT WORKS FINE
############################################################################
############################################################################
############################################################################
############################################################################
li $t0, 0
li $t1, 0
anotherloop:
lw $t4, ($t2)
sub $t5, $t4, $t9	# = data[i] - mean
move $t7, $t5
add $t2, $t2, DATASIZE

mul $t5, $t7, $t0
add $t8, $t5, $t8
add $t1, $t1, 1 #i++

# i<size
blt $t1, $a1, anotherloop



jr $ra
.end calculate
