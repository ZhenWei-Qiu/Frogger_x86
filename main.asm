INCLUDE Irvine32.inc
.data
background BYTE  "================================================",0
background1 BYTE "||                                            ||",0
background2 BYTE "||    ______   ______    ______    _____      ||",0
background3 BYTE "||    |  __ | |  __ |   |  __  |  |  ___|     ||",0
background4 BYTE "||    | |__   | |__||   | |  | |  | |  ___    ||",0
background5 BYTE "||    |  __|  |  __ |   | |  | |  | | |__ |   ||",0
background6 BYTE "||    | |     | |  | |  | |_ | |  | |___| |   ||",0
background7 BYTE "||    |_|     |_|   |_| |______|  |_______|   ||",0
background8 BYTE "||                                            ||",0
background9 BYTE "||    1.END                                   ||",0
background10 BYTE"||    2.EASY                                  ||",0
background11 BYTE"||    3.HARD                                  ||",0
background12 BYTE"||                                            ||",0
background13 BYTE "================================================",0


game  BYTE "_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|",0	;8
game1 BYTE "                                          ",0	;7
game2 BYTE "                                          ",0	;6
game3 BYTE "                                          ",0	;5
game4 BYTE "==========================================",0	;4
game5 BYTE "                                          ",0	;3
game6 BYTE "                                      	  ",0	;3
game7 BYTE "                                      	  ",0	;2
game8 BYTE "                                      	  ",0	;1
game9 BYTE "==========================================",0

endgame  BYTE "=========================================================",0
endgame1 BYTE " _______ __   __  ______  ______  ___	  __  ______",0	
endgame2 BYTE "|__   __|| |  | | |  ___| |  ___| |   \   | | | ___ | 	",0	
endgame3 BYTE "   | |   | |__| | | |__   | |__   | |\ \  | | | |  | |  ",0	
endgame4 BYTE "   | |   |  __  | |  __|  |  __|  | | \ \ | | | |   | | ",0	
endgame5 BYTE "   | |	 | |  | | | |___  | |___  | |  \ \| | | |__| |	",0	
endgame6 BYTE "   |_|	 |_|  |_| |_____| |_____| |_|   \ __| |_____|   ",0
endgame7 BYTE "                                      					",0	
endgame8 BYTE "=========================================================",0
wingame  BYTE "============================================",0
wingame1 BYTE "___    __    __  _____   ___    __    __ ",0    
wingame2 BYTE "| |   /  \   | ||_   _| |   \   | |  |  |",0    
wingame3 BYTE "| |  / /\ \  | |  | | 	| |\ \  | |  |  |",0    
wingame4 BYTE "| | / /  \ \ | |  | | 	| | \ \ | |  |__|",0    
wingame5 BYTE "| |/ /	  \ \| | _| |_	| |  \ \| |   __ ",0    
wingame6 BYTE "|___/  	   \___||_____| |_|   \ __|  |__|",0
wingame7 BYTE "                                          ",0    
wingame8 BYTE "============================================",0
losegame  BYTE "======================================",0
losegame1 BYTE "___       ______   ______  _______	",0    
losegame2 BYTE "| |	 |  __  |  | __  | |  ____|	",0    
losegame3 BYTE "| |      | |  | |  | | |_| |  |		",0    
losegame4 BYTE "| |      | |  | |  | |___  |  |__	",0    
losegame5 BYTE "| |      | |  | |  |___  | |	__|	",0    
losegame6 BYTE "| |      | |  | |   _  | | |  |		",0    
losegame7 BYTE "| |____  | |_ | |  | |_| | |  |___	",0    
losegame8 BYTE "|______| |______|  |_____| |_______|",0
losegame9 BYTE "                                    ",0    
losegame10 BYTE "======================================",0
score BYTE"SCORE : ",0
life BYTE"LIFE : ",0
wrong BYTE "please enter 1, 2, 3",0 



car BYTE "#",0
frogwalk BYTE 0
frogwalk2 BYTE 12
iswalk BYTE 0
cnt BYTE 38
intVal SDWORD ?
iswin BYTE 0
islose BYTE 2
flag BYTE 0

.code
FROG PROC USES bx
   push bx
    	mov bx,0000h
    	cmp frogwalk,0;
    	je L0
    	cmp frogwalk,1;
    	je L1
    	cmp frogwalk,2;
    	je L2
    	cmp frogwalk,3;
    	je L3
    	cmp frogwalk,4;
    	je L4
    	cmp frogwalk,5;
    	je L5
    	cmp frogwalk,6;
    	je L6
    	cmp frogwalk,7;
    	je L7
    	cmp frogwalk,8;
    	je L8
	L0:
    	mov edx, OFFSET game8
    	jmp cmph
	L1:
    	mov edx, OFFSET game7
    	jmp cmph
	L2:
    	mov edx, OFFSET game6
    	jmp cmph
	L3:
    	mov edx, OFFSET game5
    	jmp cmph
	L4:
    	mov edx, OFFSET game4
    	jmp cmph
	L5:
    	mov edx, OFFSET game3
    	jmp cmph
	L6:
    	mov edx, OFFSET game2
    	jmp cmph
	L7:
    	mov edx, OFFSET game1
    	jmp cmph
	L8:
    	mov edx, OFFSET game
	    mov bl,frogwalk2
    	add dl,bl
    	mov al,70
    	mov [edx],al
    	mov frogwalk,0
    	mov frogwalk2,12
		inc iswin
   	 call FROG
    	jmp tmp1
	cmph:
    	mov bl,frogwalk2
    	add dl,bl
	Cmph2:
    	mov al,70
    	mov [edx],al
   	 tmp1:
    	mov  dl, 0                       
        mov  dh, 0                     
        call Gotoxy 
		mov  eax,11+(0*16)
		call SetTextColor
    	mov edx, OFFSET game
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game1
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game2
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game3
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game4
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game5
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game6
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game7
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game8
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game9
    	call WriteString
    	call Crlf
    	pop bx

Ret
FROG ENDP
FROGR PROC USES bx
   push bx
    	mov bx,0000h
    	cmp frogwalk,0;
    	je L0
    	cmp frogwalk,1;
    	je L1
    	cmp frogwalk,2;
    	je L2
    	cmp frogwalk,3;
    	je L3
    	cmp frogwalk,4;
    	je L4
    	cmp frogwalk,5;
    	je L5
    	cmp frogwalk,6;
    	je L6
    	cmp frogwalk,7;
    	je L7
    	cmp frogwalk,8;
    	je L8
	L0:
    	mov edx, OFFSET game8
    	jmp cmph
	L1:
    	mov edx, OFFSET game7
    	jmp cmph
	L2:
    	mov edx, OFFSET game6
    	jmp cmph
	L3:
    	mov edx, OFFSET game5
    	jmp cmph
	L4:
    	mov edx, OFFSET game4
    	mov bh,frogwalk2
    	add dl,bh
    	mov al,61
    	mov [edx],al
    	jmp tmp
	L5:
    	mov edx, OFFSET game3
    	jmp cmph
	L6:
    	mov edx, OFFSET game2
    	jmp cmph
	L7:
    	mov edx, OFFSET game1
    	jmp cmph
	L8:
    	mov edx, OFFSET game
    	call FROG
    	jmp tmp
	cmph:
    	mov bh,frogwalk2
    	add dl,bh
    	mov al,32
    	mov [edx],al
	tmp:
    	mov  dl, 0                       
        mov  dh, 0                     
        call Gotoxy 
    	mov edx, OFFSET game
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game1
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game2
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game3
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game4
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game5
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game6
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game7
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game8
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game9
    	call WriteString
    	call Crlf

    	pop bx

Ret
FROGR ENDP
UpMove PROC
    	push bx
    	call FROGR
    	mov bx,0000h
    	cmp frogwalk,8;
    	jb big
    	mov frogwalk,8
    	jmp fin
	big:
    	call frogfirst
    	cmp iswalk,1
    	je fin
    	mov bl,frogwalk
    	add bl,1
    	mov frogwalk,bl
	fin:
    	pop bx
    	mov iswalk,0
Ret
UpMove ENDP
DownMove PROC
    	push bx
    	call FROGR
    	mov bx,0000h
    	cmp frogwalk,0;
    	jg smell
    	mov frogwalk,0
    	jmp fin
	smell:
    	mov bl,frogwalk
    	sub bl,1
    	mov frogwalk,bl
	fin:
    	pop bx
Ret
DownMove ENDP
LeftMove PROC
    	push bx
    	call FROGR
    	mov bx,0000h
    	cmp frogwalk2,0;
    	jg smell
    	mov frogwalk2,0
    	jmp fin
	smell:
    	mov bl,frogwalk2
    	sub bl,1
    	mov frogwalk2,bl
	fin:
    	pop bx
Ret
LeftMove ENDP
RightMove PROC
    	push bx
    	call FROGR
    	mov bx,0000h
    	cmp frogwalk2,39;
    	jb big
    	mov frogwalk2,39
    	jmp fin
	big:
    	mov bl,frogwalk2
    	add bl,1
    	mov frogwalk2,bl
	fin:
    	pop bx
Ret
RightMove ENDP
frogfirst PROC
    	push bx
    	mov bh,frogwalk
    	mov bl,frogwalk2
    	cmp frogwalk,7
    	jne walk
    	cmp frogwalk2,2;
    	je walk
    	cmp frogwalk2,6;
    	je walk
    	cmp frogwalk2,10;
    	je walk
    	cmp frogwalk2,14;
    	je walk
    	cmp frogwalk2,18;
    	je walk
    	cmp frogwalk2,22;
    	je walk
    	cmp frogwalk2,26;
    	je walk
    	cmp frogwalk2,30;
    	je walk
    	cmp frogwalk2,34;
    	je walk
    	cmp frogwalk2,38;
    	je walk
    	mov iswalk,1
walk:
    	pop bx
Ret
frogfirst ENDP

Signal PROC
	 
 	 
	 
    mov edx, OFFSET game1
  	mov al, cnt
  	cmp frogwalk2, al
  	jne notdie
  	cmp frogwalk, 7
  	jne notdie
  	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
    sub al,1
    mov islose,al

notdie:    
  	cmp cnt,39  ;if(cnt==39)
  	je  gL1
  	mov al,35
  	add dl,cnt
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp g3
gL1: 
  	mov ebx, 0h
  	mov al,32
  	mov [edx+ebx],al
    

g3: mov edx, OFFSET game3
  	mov ah, cnt
	sub ah, 35
  	cmp frogwalk2, ah
  	jne notdie3
  	cmp frogwalk, 5
  	jne notdie3
  	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
   sub al,1
   mov islose,al

notdie3:    
  	cmp cnt,34  ;if(cnt==18)
  	je  gL3
	jb  gL33
  	mov al,35
  	add dl,ah
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp g5
   gL3:
    
  	mov ebx, 0h
  	mov al,32
  	mov [edx+ebx],al
	jmp g5
   gL33:
	add ah, 39
	cmp frogwalk2, ah
  	jne notdie33
  	cmp frogwalk, 5
  	jne notdie33
	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
   sub al,1
   mov islose,al
notdie33:
	mov al,35
  	add dl,ah
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp g5


	 

g5: mov edx, OFFSET game5
  	mov al, cnt
  	cmp frogwalk2, al
  	jne notdie5
  	cmp frogwalk, 3
  	jne notdie5
  	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
   sub al,1
   mov islose,al

notdie5:    
  	cmp cnt,39  ;if(cnt==39)
  	je  gL5
  	mov al,35
  	add dl,cnt
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp g6
   gL5:
  	mov ebx, 0h
  	mov al,32
  	mov [edx+ebx],al
  

g6: mov edx, OFFSET game6
  	mov ah, cnt
	sub ah, 20
  	cmp frogwalk2, ah
  	jne notdie6
  	cmp frogwalk, 2
  	jne notdie6
  	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
   sub al,1
   mov islose,al

notdie6:    
  	cmp cnt,19  ;if(cnt==18)
  	je  gL6
	jb  gL66
  	mov al,35
  	add dl,ah
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp g7
   gL6:
    
  	mov ebx, 0h
  	mov al,32
  	mov [edx+ebx],al
	jmp g7
   gL66:
	add ah, 39
	cmp frogwalk2, ah
  	jne notdie66
  	cmp frogwalk, 2
  	jne notdie66
	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
   sub al,1
   mov islose,al
notdie66:
	mov al,35
  	add dl,ah
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp g7

g7: mov edx, OFFSET game7
  	mov ah, cnt
	sub ah, 25
  	cmp frogwalk2, ah
  	jne notdie7
  	cmp frogwalk, 1
  	jne notdie7
  	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
   sub al,1
   mov islose,al

notdie7:    
  	cmp cnt,24  ;if(cnt==18)
  	je  gL7
	jb  gL77
  	mov al,35
  	add dl,ah
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp end_signal
   gL7:
    
  	mov ebx, 0h
  	mov al,32
  	mov [edx+ebx],al
	jmp end_signal
   gL77:
	add ah, 39
	cmp frogwalk2, ah
  	jne notdie77
  	cmp frogwalk, 1
  	jne notdie77
	mov frogwalk, 0
  	mov frogwalk2,12
	mov al,islose
   sub al,1
   mov islose,al
notdie77:
	mov al,35
  	add dl,ah
  	mov [edx],al  
  	mov al,32
  	mov [edx+1],al
  	jmp end_signal




end_signal:
 	 
Ret
Signal ENDP

main PROC
start:
	mov  eax, 10+(0*16)
	call SetTextColor

	mov bx,0000h
	mov edx, OFFSET background
	call WriteString
	call Crlf
	mov  eax, 11+(0*16)
	call SetTextColor
    
	mov edx, OFFSET background1
	call WriteString
	call Crlf
	mov  eax, 10+(0*16)
	call SetTextColor
    
	mov edx, OFFSET background2
	call WriteString
	call Crlf
	mov  eax, 11+(0*16)
	call SetTextColor
    
	mov edx, OFFSET background3
	call WriteString
	call Crlf
	mov  eax, 10+(0*16)
	call SetTextColor
    
	mov edx, OFFSET background4
	call WriteString
	call Crlf
    mov  eax, 11+(0*16)
	call SetTextColor
	mov edx, OFFSET background5
	call WriteString
	call Crlf
    mov  eax, 10+(0*16)
	call SetTextColor
	mov edx, OFFSET background6
	call WriteString
	call Crlf
    mov  eax, 11+(0*16)
	call SetTextColor
	mov edx, OFFSET background7
	call WriteString
	call Crlf
	mov  eax, 10+(0*16)
	call SetTextColor
    
	mov edx, OFFSET background8
	call WriteString
	call Crlf
    mov  eax, 11+(0*16)
	call SetTextColor
	mov edx, OFFSET background9
	call WriteString
	call Crlf
	mov  eax, 10+(0*16)
	call SetTextColor
    
	mov edx, OFFSET background10
	call WriteString
	call Crlf
	mov  eax, 11+(0*16)
	call SetTextColor
	mov edx, OFFSET background11
	call WriteString
	call Crlf
	mov  eax, 10+(0*16)
	call SetTextColor
    
	mov edx, OFFSET background12
	call WriteString
	call Crlf
    mov  eax, 11+(0*16)
	call SetTextColor
	mov edx, OFFSET background13
	call WriteString
	call Crlf
read:
	call ReadInt
	mov intVal, eax
	cmp eax, 1;
	je break
	cmp eax, 2;
	je easy
	cmp eax, 3;
	je hard
	mov edx, OFFSET wrong
    call WriteString
    call Crlf
	jmp read
easy:
		cmp iswin,10
   		je win
		cmp islose,0
		je lose
		mov bl, cnt
		mov al, flag
		cmp al, 0
		jne notclear
		call Clrscr
		inc al
		mov flag, al
 notclear:
		mov  dl, 0                       
        mov  dh, 0                     
        call Gotoxy                     
		mov  eax, 11+(0*16)
		call SetTextColor

    	mov edx, OFFSET game
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game1
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game2
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game3
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game4
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game5
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game6
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game7
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game8
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game9
    	call WriteString
    	call Crlf
		mov edx, OFFSET score
    	call WriteString
        mov al, iswin
   	    call  WriteDec
    	call Crlf
   	    mov edx, OFFSET life
    	call WriteString
        mov al, islose
   	    call  WriteDec
    	call Crlf

    	call signal
    	cmp cnt, 1
    	jl thirtynine ;if(cnt<0)
    	sub cnt,1
   	 
    	jmp	L
	thirtynine:
    	mov cnt,39  	;cnt=39
   	 
	L:
       	Call FROG;
       	mov eax , 500 ;
    	call Delay;
    	call ReadKey
    	jz easy
        cmp dx, 26h
        je Up
        cmp dx, 28h
        je Down
        cmp dx, 25h
        je Left
        cmp dx, 27h
        je Right
		jnz easy
		cmp dx, 69h
	    ja easy
    	Up:
      	call UpMove
      	call Next
    	Down:
      	call DownMove
      	call Next
    	Left:
      	call LeftMove
      	call Next
    	Right:
      	call RightMove
      	call Next
    	Next:
		cmp iswin,10
   		 je Win
      	jmp easy
hard:
		cmp iswin,10
   		je Win
		cmp islose,0
		je lose
		mov bl, cnt
    	mov al, flag
		cmp al, 0
		jne notclearr
		call Clrscr
		inc al
		mov flag, al
 notclearr:
		mov  dl, 0                       
        mov  dh, 0                     
        call Gotoxy   
		mov  eax, 11+(0*16)
		call SetTextColor
    	mov edx, OFFSET game
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game1
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game2
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game3
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game4
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game5
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game6
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game7
    	call WriteString
    	call Crlf
    	mov edx, OFFSET game8
    	call WriteString
    	call Crlf
		mov edx, OFFSET game9
    	call WriteString
    	call Crlf
		mov edx, OFFSET score
    	call WriteString
   	    mov al, iswin
        call  WriteDec
    	call Crlf
   	    mov edx, OFFSET life
    	call WriteString
   	    mov al, islose
   	    call  WriteDec
    	call Crlf

    	call signal
    	cmp cnt, 1
    	jl thirtyninee ;if(cnt<0)
    	sub cnt,1
   	 
    	jmp	L2
	thirtyninee:
    	mov cnt,39  	;cnt=39
   	 L2:
       	Call FROG ;
       	mov eax ,30 ;
    	call Delay;
    	call ReadKey
    	jz hard
        cmp dx, 26h
        je Up2
        cmp dx, 28h
        je Down2
        cmp dx, 25h
        je Left2
        cmp dx, 27h
        je Right2
	    jnz hard
        cmp dx, 69h
		ja hard
    	Up2:
     	call UpMove
      	call Next2
    	Down2:
     	call DownMove
      	call Next2
    	Left2:
     	call LeftMove
      	call Next2
    	Right2:
      	call RightMove
      	call Next2
    	Next2:
	
      	jmp hard
    Win:
   	mov bx,0000h
   	 call Clrscr
	 	mov  eax, 14+(0*16)
	    call SetTextColor
    	mov edx, OFFSET wingame
    	call WriteString
    	call Crlf
    
    	mov edx, OFFSET wingame1
    	call WriteString
    	call Crlf
    
    	mov edx, OFFSET wingame2
    	call WriteString
    	call Crlf
    
    	mov edx, OFFSET wingame3
    	call WriteString
    	call Crlf
    
    	mov edx, OFFSET wingame4
    	call WriteString
    	call Crlf
    
    	mov edx, OFFSET wingame5
    	call WriteString
    	call Crlf
    
    	mov edx, OFFSET wingame6
    	call WriteString
    	call Crlf
    
    	mov edx, OFFSET wingame7
    	call WriteString
    	call Crlf
    	mov edx, OFFSET wingame8
    	call WriteString
    	call Crlf
   		mov	eax , 5000 	; 0.5¬í
    	call Delay;
	    call Clrscr
	    mov iswin,0
		mov islose,2
	    mov edx, OFFSET game
        mov al,32
        mov [edx+2],al
		mov [edx+6],al
	    mov [edx+10],al
		mov [edx+14],al
	    mov [edx+18],al
		mov [edx+22],al
		mov [edx+26],al
	    mov [edx+30],al
		mov [edx+34],al
		mov [edx+38],al
		mov flag, 0
   	 jmp start
	 lose:
	    mov   eax , 12+ (0*16 )    ; ¥Õ¦rÂÅ©³
        call    SetTextColor
        mov bx,0000h
        call Clrscr
        mov edx, OFFSET losegame
        call WriteString
        call Crlf
    
        mov edx, OFFSET losegame1
        call WriteString
        call Crlf
    
        mov edx, OFFSET losegame2
        call WriteString
        call Crlf
    
        mov edx, OFFSET losegame3
        call WriteString
        call Crlf
    
        mov edx, OFFSET losegame4
        call WriteString
        call Crlf
    
        mov edx, OFFSET losegame5
        call WriteString
        call Crlf
    
        mov edx, OFFSET losegame6
        call WriteString
        call Crlf
    
        mov edx, OFFSET losegame7
        call WriteString
        call Crlf
        mov edx, OFFSET losegame8
        call WriteString
        call Crlf
		mov edx, OFFSET losegame9
        call WriteString
        call Crlf
		mov edx, OFFSET losegame10
        call WriteString
        call Crlf
		mov edx, OFFSET score
    	call WriteString
   		mov al, iswin
   		call  WriteDec
    	call Crlf
	 	mov edx, OFFSET life
    	call WriteString
   		mov al, islose
   	    call  WriteDec
    	call Crlf

        mov eax , 5000  ; 0.5¬í
        call Delay;
        call Clrscr
		mov iswin,0
		mov islose,2
	    mov edx, OFFSET game
		mov al,32
		mov [edx+2],al
		mov [edx+6],al
		mov [edx+10],al
		mov [edx+14],al
		mov [edx+18],al
		mov [edx+22],al
	    mov [edx+26],al
		mov [edx+30],al
		mov [edx+34],al
		mov [edx+38],al
		mov flag, 0
        jmp start
 	 

	break:
		mov bx,0000h
		call Clrscr
		mov edx, OFFSET endgame
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame1
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame2
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame3
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame4
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame5
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame6
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame7
		call WriteString
		call Crlf
    
		mov edx, OFFSET endgame8
		call WriteString
		call Crlf
    
		call WaitMsg
		jmp end_
end_:

RET
main ENDP
END main





