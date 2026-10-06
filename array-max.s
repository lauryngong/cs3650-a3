# Write the assembly code for the array_max function

.text
.global array_max

array_max:
  # Start with the first array element as the maximum
  movq (%rsi), %rax

  # i = 1 because items[0] is already the current maximum
  movq $1, %rcx

loop:
  # If i >= n, we have checked the entire array
  cmpq %rdi, %rcx
  jae done

  # Load items[i]
  # Address = items + (i * 8)
  movq (%rsi,%rcx,8), %rdx

  # If items[i] <= max, skip updating max
  cmpq %rax, %rdx
  jbe next

  # Otherwise items[i] is the new maximum
  movq %rdx, %rax

next:
  # i++
  incq %rcx
  jmp loop

done:
  # The return value is already in %rax
  ret