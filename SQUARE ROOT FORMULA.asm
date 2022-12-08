SQUARE ROOT FORMULA


lw $t3, number
li $t4, 2
li $t0, 0
li $t2, 1
move $t3, $t5 #t5 = x, t3 = n
div $t3, $t4
mflo $t1

loop:
div $t3, $t5
mflo $t6
add $t6, $t5, $t6
div $t6, $t4
mflo $t5      #x = (x+ n/x)/2
add $t0, $t2, $t0 #i++
blt $t0, $t1, loop
