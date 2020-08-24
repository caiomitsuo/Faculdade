.data
CARTEIRA:
	.word 300
STR_SALARIO:
	.asciiz "O salario calculado foi de: "

.text
	lw $a0, CARTEIRA
	la $a0,	STR_MESES	# Meses de cálculo
	li $a2, 1000			# Valor do salário
	li $a3, 437			# Imposto mensal bruto
	jal FUNC_COMPUTA_SALARIO # Chama a rotina do salario
	sw $v0, CARTEIRA
	
	li $v0, 4			# Nº serviço escrita de string
	la $a0, STR_SALARIO	# Endereço da frase a escrever
	syscall

	li $v0, 1			# Serviço de escrita de inteiros
	lw $a0, CARTEIRA
	syscall
	
	li $v0, 10
	syscall 		# Interrupção (implica necessariamente que o SO tomou o controle)
	
# Nossa rotina de salários, similar a um método java
# int computaSalario(int carteira, int meses, int salario, int valorImpostos)
FUNC_COMPUTA_SALARIO:
	add $a0, $a0, $a2	# Soma salario com carteira
	sub $a0, $a0, $a3	# Subtrai os impostos
	addi $a1, $a1, -1	# decrementa um mês
	bne $a1, $zero, FUNC_COMPUTA_SALARIO
	add $v0, $a0, $zero # Copia o resultado para retorno
	jr $ra					# Retorna após o "jal"
