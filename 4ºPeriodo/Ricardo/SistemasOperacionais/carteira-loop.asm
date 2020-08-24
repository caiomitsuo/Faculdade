# Valores constantes e strings do programa
.data
CARTEIRA: # label (etiqueta)
	.word 300
#SALARIO:
#	.word 1000


# Instruções do programa vão abaixo de .text
.text
	
	# Análogo ao inicializador do for-loop
	li $a0, 12
	
	# Análogo ao escopo do for-loop
COMPUTA_SALARIO:
	lw $t0, CARTEIRA
	li $t1, 1000
	add $s0, $t0, $t1
	li $t0, 447				# Valor dos impostos
	sub $s0, $s0, $t0
	sw $s0, CARTEIRA
	
	# Análogo ao decrementador de fim do for-loop
	addi $a0, $a0, -1
	
	# Teste de continuidade do for-loop
	bne $a0, $zero, COMPUTA_SALARIO
