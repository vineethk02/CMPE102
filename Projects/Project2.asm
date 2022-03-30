Comment !
Description: Write a program that calculates the sum of all the gaps between successive array elements. The array elements are doublewords and in ascending order. 
Student Name: Vineeth Kandukuri
Course Number: CMPE 102-section 04
Project Number: 2
Date: 3/20/22
!
include Irvine32.inc
.386

.model flat, stdcall

.stack 4096

ExitProcess PROTO dwExitCode:DWORD

.data
 array DWORD 0, 2, 5, 9, 10  




.code
main PROC
count EQU lengthof array
mov edx, 0h
mov ebx, 0h
mov ecx, count
l1:
	mov eax, 0h
	mov eax, [array + ebx]

	add eax, array + [ebx +4]

	add edx, eax

	loop l1

call DumpRegs

INVOKE ExitProcess, 0

main ENDP
END main