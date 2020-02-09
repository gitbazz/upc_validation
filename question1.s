		AREA question1, CODE, READWRITE
		ENTRY
		
		LDR	r10, =UPC					;Load r10 with the memory location of UPC
		LDR r11, =6						;Set r11 to be the loop counter
SUM	
		LDRB r1, [r10], #1				;Load r1 with the next byte of the UPC string - odd indexes
		SUB r1, r1, #48					;Convert the ASCII code to an integer value
		ADD r3, r1						;Add r1 - integer at odd index - to r3 to keep a running sum of all odd indexes of the UPC string
		LDRB r2, [r10], #1				;Load r2 with the next byte of the UPC string - even indexes
		SUB r2, r2, #48					;Convert the ASCII code to an integer value
		ADD r4, r2						;Add r2 - integer at even index - to r4 to keep a running sum of all even indexes of the UPC string
		SUB r11, #1						;Decrement loop counter for every odd and even index pair
		CMP r11, #0						;Compare r11 with 0 - if it is equal to 0 then we have iterated through all odd and even indexes of the UPC string
		BNE SUM							;Branches back to SUM if loop counter does not equal 0
		
MULT	ADD r3, r3, LSL #1				;Multiply the sum of odd integers by 3 and use a left logical shift
TOTAL	ADD r5, r3, r4					;Add the new value for odd sum to the even sum and store the value in r5
		
DIVIDE	SUB r5, #10						;Subtract 10 from r5 until it becomes less than 10
		CMP r5, #10						;Compare the value of r5 with 10
		BEQ VALID						;If the result of dividing by 10 is equal to 0, jump to VALID
		BMI INVALID						;If the result of dividing by 10 is not equal to 0, jump to INVALID
		B DIVIDE
		
VALID	MOV r0, #1						;If the string of 12 ASCII encoded digits is valid store 1 in r0
		B FINISH						;Jump to FINISH

INVALID	MOV r0, #2						;If the string of 12 ASCII encoded digits is invalid store 2 in r0
		
FINISH	B FINISH
UPC		DCB	"013800150738"				;UPC string
		END