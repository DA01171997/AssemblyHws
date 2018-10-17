TITLE Add and Subtract HW3(AddHw3)
; Name: Duy Do
; Date: 10/9/2018
; Compiler used as in VS2017
; This is the HW#3 program that add and
; subtract number and stores result
; in a sum variable
INCLUDE Irvine32.inc
.data
; initilize value
able        WORD ?
baker       WORD 70
charlie     WORD 10
delta		WORD 30
.code
main PROC
; clear out registers
xor eax,eax				
xor ebx,ebx
xor ecx,ecx
xor edx,edx
; load registers with values 
mov bx,baker			; store 70 in bx
mov cx,charlie			; store 10 in cx
mov dx,delta			; store 30 in dx
; perform arithmetics
add cx,dx				; charlie(10)+delta(30) = 40
sub bx,cx				; baker(70)-(charlie(10)+Delta(30))=70-40=30
mov able,bx				; store final result in verable able
mov ax, able			; store able in ax for WriteDec
; dump registers and 
; print out result in decial
call DumpRegs           ; display the registers
call WriteDec			; display result = 30 
exit
main ENDP
END main
