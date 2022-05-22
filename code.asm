org 100h 
jmp start
msg1         DB  'Enter students marks: $'
msg2         DB  'Enter students ids**: $'
msg3         DB  '******students marks: $'
msg4         DB  '******students ids**: $' 
space         DB  ' $' 
NUM Db ?
n   Db 7 
NUM_2 Db 10H
newline      DB  0DH,0AH,'$'  
start: 
mov    [504h] , 25    ;N : can be changed to any value
mov    [503h] , 25
mov    [700h] , 25
mov    [400h] , 25 
mov   si , 701h 
    LEA    dx,msg1  
    MOV    ah,09h   
    INT    21h

lop: 
    dec    [504h]
    mov    bx,0 
    mov    cx,10h
    mov    ah, 1
    int    21h   
    call   parse
    mov    ah,0
    mov    bx,ax

    mov    ah, 1
    int    21h   
    call   parse
    mov    ah,0
    mov    dx,ax
    mov    ax , bx 
    mov    bx , dx
    mul    cx
    add    bx , ax               
    mov    [si],bx
    inc    si
    cmp    [504h],0h
    
    LEA    dx,space  
    MOV    ah,09h   
    INT    21h 
    
    jne    lop
    
LEA    dx,newline  
MOV    ah,09h   
INT    21h

LEA    dx,msg2  
MOV    ah,09h   
INT    21h 


                         
mov si , 401h
lp: 
    dec    [503h]
    mov    bx,0 
    mov    cx,10h
    mov    ah, 1
    int    21h   
    call   parse
    mov    ah,0
    mov    bx,ax

    mov    ah, 1
    int    21h   
    call   parse
    mov    ah,0
    mov    dx,ax
    mov    ax , bx 
    mov    bx , dx
    mul    cx
    add    bx , ax               
    mov    [si],bx
    inc    si
    cmp    [503h],0h
    
    LEA    dx,space  
    MOV    ah,09h   
    INT    21h
    
    jne    lp 

call sort
LEA    dx,newline  
MOV    ah,09h   
INT    21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov    [504h] , 25
mov    [503h] , 25
mov    [700h] , 25
mov    [400h] , 25 
mov   si , 701h 
    LEA    dx,msg3  
    MOV    ah,09h   
    INT    21h

lopp:
    dec  [504h]
    
    mov   al , [si]
    mov   ah,0
    mov   dx,0
    div   NUM_2
    mov   ch ,ah
             
    call parseinv
    mov   dl  ,al
    mov   ah , 02h
    int   21h
    
    
    mov   al,ch
    call parseinv
    mov   dl  ,al
    mov   ah , 02h
    int   21h
    inc    si 
    
    cmp    [504h],0h
    
    LEA    dx,space  
    MOV    ah,09h   
    INT    21h
    
    jne    lopp
    
LEA    dx,newline  
MOV    ah,09h   
INT    21h

LEA    dx,msg4  
MOV    ah,09h   
INT    21h 


                         
mov si , 401h
lpp:
    dec   [503h] 
    mov   al , [si]
    mov   ah,0
    mov   dx,0
    div   NUM_2
    mov   ch ,ah
             
    call parseinv
    mov   dl  ,al
    mov   ah , 02h
    int   21h
    
    
    mov   al,ch
    call parseinv
    mov   dl  ,al
    mov   ah , 02h
    int   21h
    inc    si 
    
    cmp    [503h],0h
    
    LEA    dx,space  
    MOV    ah,09h   
    INT    21h 
    
    jne    lpp
parse proc near
cmp    al,48
je     zero
cmp    al,49
je     one
cmp    al,50
je     two
cmp    al,51
je     three
cmp    al,52
je     four
cmp    al,53
je     five
cmp    al,54
je     six
cmp    al,55
je     seven
cmp    al,56
je     eight
cmp    al,57
je     nine

zero: 
mov   al,0h
jmp     out
one: 
mov   al,1h
jmp     out
two: 
mov   al,2h
jmp     out
three: 
mov   al,3h
jmp     out
four: 
mov   al,4h
jmp     out
five: 
mov   al,5h
jmp     out
six: 
mov   al,6h
jmp     out 
seven: 
mov   al,7h
jmp     out
eight: 
mov   al,8h
jmp     out
nine: 
mov   al,9h
jmp     out

out: 

ret
parse endp 

sort proc near

        mov si,700h
	    mov cl,[si]
	    dec cl
l1:     mov si,700h
        mov di,400h
        mov ch,[si]
        dec ch
        inc si
        inc di
        
l2:     mov al,[si]
        mov ah,[di]
        inc si
        inc di
        cmp al,[si]
        ja skip
        xchg al,[si]
        xchg ah,[di]
        dec si
        dec di
        xchg al,[si]
        xchg ah,[di]
        inc  si
        inc  di
skip:   dec ch
        jnz l2
        dec cl
        jnz l1
ret
sort endp

parseinv proc near:
cmp    al,0
je     zeros
cmp    al,1
je     ones
cmp    al,2
je     twos
cmp    al,3
je     threes
cmp    al,4
je     fours
cmp    al,5
je     fives
cmp    al,6
je     sixs
cmp    al,7
je     sevens
cmp    al,8
je     eights
cmp    al,9
je     nines

zeros: 
mov   al,30h
jmp     outs
ones: 
mov   al,31h
jmp     outs
twos: 
mov   al,32h
jmp     outs
threes: 
mov   al,33h
jmp     outs
fours: 
mov   al,34h
jmp     outs
fives: 
mov   al,35h
jmp     outs
sixs: 
mov   al,36h
jmp     outs 
sevens: 
mov   al,37h
jmp     outs
eights: 
mov   al,38h
jmp     outs
nines: 
mov   al,39h
jmp     outs

outs: 
ret
parseinv endp

ret
