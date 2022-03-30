Comment !
Description: Write a program that calculates the following expression: total =  (num3 + num4) - (num1 + num2) + 1.
Student Name: Vineeth Kandukuri
Course Number: CMPE 102-section 04
Project Number: 1
Date: 3/8/22
!
include Irvine32.inc
.386

.model flat, stdcall

.stack 4096

ExitProcess PROTO dwExitCode:DWORD

.data
myArray DWORD 1000h, 2000h, 3000h, 4000h
num1 DWORD 1d
num2 DWORD 2d
num3 DWORD 4d
num4 DWORD 8d
total DWORD ?


.code
main PROC
mov esi, OFFSET myArray ;returning myArray

mov eax, num1 ;mov num1 to eax
add ax, WORD PTR [esi] ;add esi to ax
add esi, TYPE myArray ;add myArray to esi
mov num1, eax ;closing the register

mov eax, num2 ;mov num2 to eax
add ax, WORD PTR [esi] ;add esi to ax
add esi, TYPE myArray ;add myArray to esi
mov num2, eax ;closing register

mov ebx, num3 ;mov num3 to ebx
add bx, WORD PTR [esi] ;add esi to bx
add esi, TYPE myArray ;add myArray to esi
mov num3, ebx ;close register

mov ebx, num4 ;mov num4 to ebx
add bx, [esi] ;add esi to bx, no need to adding PTR here because there is no number after num4
mov num4, ebx ;close register


;total = (num3 + num4) - (num1 + num2) + 1

	mov eax, num3 ;mov num3 to eax
	add eax, num4 ;(num3 + num4)
	mov ebx, num1 ;mov num1 to ebx
	add ebx, num2 ;(num1 + num2)
	sub eax, ebx  ;(num3 + num4) - (num1 + num2)
	inc eax       ;(num3 + num4) - (num1 + num2) + 1
	mov total, eax ;mov eax to total

	call DumpRegs

INVOKE ExitProcess, 0

main ENDP
END main