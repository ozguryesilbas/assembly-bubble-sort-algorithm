.data
array1: .word 5, 10, 3, 8, 20, 3, 8, 25, 6, 1
array2: .word 5, 6, 8, 13, 15, 22, 41, 42, 50, 75
array3: .word 75, 50, 42, 41, 22, 15, 13, 8, 6, 5
bosluk: .asciiz " "

.text
.globl main
main:
la $s0, array1  			# dizi
li $t0, 0                   #i = 0
li $t1, 0                   #j = 0
li $s1, 10                  #n = 10
li $s2, 10                  #n-i döngü
add $t2, $zero, $s0               
add $t3, $zero, $s0          
addi $s1, $s1, -1

loop2:
li  $t1, 0                   #j = 0
addi $s2, $s2, -1            
add $t3, $zero, $s0          

loop1:
lw $s3, 0($t3)               #array[j]
addi $t3, $t3, 4             #addr itr j += 4
lw $s4, 0($t3)               #arr[j+1]
addi $t1, $t1, 1             #j++

slt $t4, $s3, $s4            
bne $t4, $zero, cond
swap:
sw $s3, 0($t3)
sw $s4, -4($t3)
lw $s4, 0($t3)

cond:
bne $t1, $s2, loop1          #j != n-i

addi $t0, $t0, 1             #i++
bne $t0, $s1, loop2          #i != n
li $t0, 0
addi $s1, $s1, 1

print:
li $v0, 1
lw $a0, 0($t2)
syscall

li $v0, 4
la $a0, bosluk
syscall

addi $t2, $t2, 4             #addr itr i += 4
addi $t0, $t0, 1             #i++
bne $t0, $s1, print          #i != n

exit:
li $v0, 10
syscall