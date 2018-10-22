TITLE Indirect Address Switching HW4 (SwitchHw4)
; Name: Duy Do
; Date: 10/21/2018
; Compiler used as in VS2017
; This is the HW#4 program loop and use indirect
; addressing to switch the 1st and 2nd element
; of an array, and switch for the 3rd and 4rd
; and 5th and 6th, etc.

INCLUDE Irvine32.inc

.data
	message1	BYTE	"This is the content of wArray before Indirect Address Switching", 0
	message2	BYTE	"This is the content of wArray after Indirect Address Switching", 0
	wArray		WORD	4,9,13,7,5,12,17,2,6,8
.code 

main PROC
	; clear out registers
	xor	eax,	eax
	xor	ebx,	ebx
	xor	ecx,	ecx 
	xor	edx,	edx
	
	; print message1
	mov	edx,	OFFSET message1				; edx has message1
	call		WriteString				; "This is the content of wArray before Indirect Address Switching", 0
	call		Crlf					; print newline
	
	; initialize loop L1 
	mov esi,	OFFSET wArray				; esi is pointer to first value of wArray
	mov ecx,	LENGTHOF wArray				; L1 loop counter = number of element

	; loop L1 print all value of wArray
	call		L1					; 4 9 13 7 5 12 17 2 6 8  

	; initialize loop L2
	mov	esi,	OFFSET wArray				; esi is pointer to first value of wArray
	mov 	edi,	OFFSET wArray				; edi is pointer to first value of wArray
	add 	edi,	TYPE   wArray				; edi is pointer to second value of wArray
	mov 	ecx,	(LENGTHOF wArray) - 1			; L2 loop counter = number of element - 1
	
	; loop L2 use indirect addressing to switch two value
L2:
	mov	ax,	[esi]					; ax is temp value holder for esi
	mov 	bx,	[edi]					; bx is temp value holder for edi
	mov 	[esi],	bx					; [esi] = [edi]
	mov 	[edi],	ax					; [edi] = [esi]	 
	add 	esi,	(TYPE wArray) * 2			; esi points to the next element 2 indexes away
	add 	edi,	(TYPE wArray) * 2			; edi points to the next element 2 indexes away
	loop		L2					; repeat L12
	
	; print message2					
	mov 	edx,	OFFSET message2				; edx has message2
	call 		WriteString				; "This is the content of wArray after Indirect Address Switching", 0
	call 		Crlf					; print newline

	; initialize loop L1
	mov	esi,	OFFSET wArray				; esi is pointer to first value of wArray
	mov 	ecx,	(LENGTHOF wArray)			; L3 loop counter = number of element

	; loop L1 print all value of wArray
	call		L1					; 9 4 7 13 12 5 2 17 8 6 

call DumpRegs
exit
main ENDP
	; loop L1 print all value of wArray
L1:
	mov 	ax,	[esi]					; ax has current value of wArray
	add	esi,	TYPE wArray				; esi points to the next element  1 index away
	call		WriteDec				; print current value of wArray in decimal
	mov 	ax,	" "					; ad has a space
	call		WriteChar				; print spaces between each value
	loop		L1					; repeat L1 
	call		Crlf					; print newline
	ret							; return
END main

