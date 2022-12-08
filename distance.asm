
#
#
# SQUARE ROOT NEEDED
#
#
#	Data declarations go here!
.data
STRUCT_SIZE = 16
final: .word 0

askX1: .asciiz "Please enter X1 value: "
askY1: .asciiz "Please enter Y1 value: "
askX2: .asciiz "Please enter X2 value: "
askY2: .asciiz "Please enter Y2 value: "
finalmsg: .asciiz "Final Distance: "
newline: .asciiz "\n"
#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
li $t0, 0

#equation under square root
jal distance

li $v0, 4
la $a0, finalmsg
syscall

li $v0, 1
lw $a0, final
syscall

#	-------
#	Done terminate program
end:
	li $v0, 10		# exit system call
	syscall

.end	main


.globl distance
.ent distance
distance:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0

li $v0, 4
la $a0, askX1
syscall

li $v0, 5
syscall
sw $v0, ($s0)

#get y
li $v0, 4
la $a0, askY1
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, askX2
syscall

li $v0, 5
syscall
sw $v0, 8($s0)

#get y
li $v0, 4
la $a0, askY2
syscall

li $v0, 5
syscall


sw $v0, 12($s0)
move $v0, $s0


lw $t0, ($s0)
lw $t1, 4($s0)
lw $t2, 8($s0)
lw $t3, 12($s0)




sub $t8, $t2, $t0
add $t7, $t8, $0
mul $t4, $t8, $t7			#t4 is x2-x1 squared

sub $t6, $t3, $t1
add $t5, $t6, $0
mul $t6, $t5, $t6		#t6 is y2 - y1 squared

li $t0, 0
add $t3, $t6, $t4



###need to do square root then finished

li $t9, 2
li $t0, 0
li $t2, 1
add $t5, $0, $t3 #t5 = x, t3 = n
div $t3, $t9
mflo $t1

loop:
div $t3, $t5
mflo $t7
add $t7, $t5, $t7
div $t7, $t9
mflo $t5      #x = (x+ n/x)/2
add $t0, $t2, $t0 #i++
blt $t0, $t1, loop
sw $t5, final





jr $ra

.end distance
