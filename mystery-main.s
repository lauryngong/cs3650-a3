# Write the assembly code for the main function of the mystery program
.text
.global main

main:
  # Prologue
  pushq %rbp
  movq %rsp, %rbp
  pushq %r12
  pushq %r13

  # Save argv
  movq %rsi, %r12

  # argc must be 3:
  # program name + two arguments
  cmpq $3, %rdi
  jne error

  # Convert argv[1] to a long
  movq 8(%r12), %rdi
  call atol
  movq %rax, %r13

  # Convert argv[2] to a long
  movq 16(%r12), %rdi
  call atol

  # Call crunch(first, second)
  movq %rax, %rsi
  movq %r13, %rdi
  call crunch

  # Check the result of crunch
  cmpq $0, %rax
  jl print_hat
  je print_tea
  jg print_beer

print_hat:
  leaq hat_msg(%rip), %rdi
  call puts
  jmp success

print_tea:
  leaq tea_msg(%rip), %rdi
  call puts
  jmp success

print_beer:
  leaq beer_msg(%rip), %rdi
  call puts
  jmp success

error:
  leaq error_msg(%rip), %rdi
  call puts
  movq $1, %rax
  jmp done

success:
  movq $0, %rax

done:
  popq %r13
  popq %r12
  popq %rbp
  ret

.data
error_msg:
  .asciz "Two arguments required."
hat_msg:
  .asciz "hat"
tea_msg:
  .asciz "tea"
beer_msg:
  .asciz "beer"
