#
#	Data declarations go here!
.data
answer: .word 0
msgrain: .asciiz "Please enter the rainfall: "
msghigh: .asciiz "Please enter the high temp: "
msglow: .asciiz "Please enter the low temp: "
anlow: .asciiz "Low: "
anhigh: .asciiz "\nHigh: "
anavg: .asciiz "\nAverage rainfall: "
antotal: .asciiz "\nTotal: "
anavgtemp: .asciiz "\nAverage Temperature: "
STRUCT_SIZE = 12
avgrain: .word 0
avgtemp: .word 0
low: .word 0
high: .word 0
total: .word 0
jan: .asciiz "January: "
feb: .asciiz "February: "
mar: .asciiz "March: "
apr: .asciiz "April: "
ma: .asciiz "May: "
jun: .asciiz "June: "
jul: .asciiz "July: "
aug: .asciiz "August: "
sept: .asciiz "September: "
oct: .asciiz "October: "
nov: .asciiz "November: "
dec: .asciiz "December: "
newline: .asciiz "\n"
#
#	Program code goes here!
.text

.globl	main
.ent	main
main:
#	-------
#	Your code goes here

jal months
jal print
li $v0, 10
syscall
.end main

##################################
##################################
##################################
.globl print
.ent print
print:
li $v0, 4
la $a0, anlow
syscall

li $v0, 1
lw $a0, low
syscall

li $v0, 4
la $a0, anhigh
syscall

li $v0, 1
lw $a0, high
syscall

li $v0, 4
la $a0, antotal
syscall

li $v0, 1
lw $a0, total
syscall

li $v0, 4
la $a0, anavg
syscall

li $v0, 1
lw $a0, avgrain
syscall

li $v0, 4
la $a0, anavgtemp
syscall

li $v0, 1
lw $a0, avgtemp
syscall

jr $ra
.end print

########################################
############################################
##########################################
####DOING MONTHS
.globl months
.ent months
months:
li $t0, 1


january:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

###########################################
li $v0, 4
la $a0, jan
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
##################################

#set high and low since its first entered
lw $t9, 4($s0)    #High
lw $t8, 8($s0)    #low
#load in rainfall
lw $t7 ($s0)

sw $t9, high
sw $t8, low
sw $t7, total
add $t6, $t9, $t8   #t6 average temp
move $v0, $s0

february:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

##############################################
li $v0, 4
la $a0, feb
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################

lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
move $v0, $s0





march:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

#li $v0, 4
#la $a0, stateJan
#syscall
li $v0, 4
la $a0, mar
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0



april:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, apr
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
move $v0, $s0















##########################ISSUES PROB LOW TEMP?
may:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct


li $v0, 4
la $a0, ma
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0


june:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, jun
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0

july:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, jul
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0



august:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, aug
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0

september:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, sept
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0


october:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, oct
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0


november:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, nov
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0



december:
li $v0, 9
li $a0, STRUCT_SIZE
syscall
move $s0, $v0	# s0 has our pointer to the struct

li $v0, 4
la $a0, dec
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msgrain
syscall

li $v0, 5
syscall
sw $v0, ($s0)


li $v0, 4
la $a0, msghigh
syscall

li $v0, 5
syscall
sw $v0, 4($s0)

li $v0, 4
la $a0, msglow
syscall

li $v0, 5
syscall
sw $v0, 8($s0)
#################################################
lw $t3, ($s0)
lw $t2, 4($s0)
lw $t1, 8($s0)
add $t7, $t3, $t7
sw $t7, total
add $t6, $t2, $t6
add $t6, $t1, $t6
sw $t6, avgtemp
	move $v0, $s0
###########################################################
li $s3, 12
li $s4, 24
div $t7, $s3
mflo $t7
sw $t7, avgrain

#find avgtemp
div $t6, $s4
mflo $t6
sw $t6, avgtemp
###################################################

# needs to set low when new LOW
# needs to set high when new high
# recheck avg rain and average temp math
#
#

jr $ra
.end months

#########
####
#do if this then that then return back to jump
#set jumps after each month

.globl sethigh
.ent sethigh
sethigh:
li $t9, 0
add $t9, $t2, $t9
jr $ra
.end sethigh

.globl setlow
.ent setlow
setlow:
li $t9, 0
add $t8, $t1, $t8
jr $ra
.end setlow
