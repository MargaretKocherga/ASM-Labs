.286
.model small
.stack 100h
.data
message_welcome db "Arkanoid",0Dh ,0Ah   
                db "Controls:",0Dh ,0Ah
                db "Left/Right arrow - move paddle",0Dh ,0Ah
                db "Enter - shoot",0Dh ,0Ah
                db "Esc - exit",0Dh ,0Ah
                db "Enter - start",0Dh ,0Ah, '$' 
message_win db "                YOU WIN                 ",0Dh ,0Ah
            db "                                        ",0Dh ,0Ah
            db "              DESIGNED BY               ",0Dh ,0Ah
            db "                                        ",0Dh ,0Ah
            db "           KOCHERGA MARGARITA           ",0Dh ,0Ah, '$'    
                  
str_score db "Score:"   
message_lose db " You lose"
             db "Press Enter"  
             
screen_buffer db 1000 dup(0)
playfield db 396 dup(00h)   

level db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h
      db 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h
      db 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h
      db 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h
      db 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h
      db 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h, 0b0h
      db 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h
      db 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h, 0d0h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h  

     
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 0a0h, 0a0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0a0h, 0a0h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 0a0h, 0a0h, 00h, 00h, 00h, 00h, 00h, 00h, 0a0h, 0a0h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 00h, 00h, 00h, 00h	 
      db 00h, 00h, 0a0h, 0a0h, 0a0h, 0a0h, 00h, 00h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 00h, 00h, 0a0h, 0a0h, 0a0h, 0a0h, 00h, 00h	 
      db 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h	   
      db 0a0h, 0a0h, 00h, 00h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 0a0h, 00h, 00h, 0a0h, 0a0h	  
      db 0a0h, 0a0h, 00h, 00h, 0a0h, 0a0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0a0h, 0a0h, 00h, 00h, 0a0h, 0a0h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 0a0h, 0a0h, 0a0h, 0a0h, 00h, 00h, 0a0h, 0a0h, 0a0h, 0a0h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  

level_count dw 88
            dw 46

      
current_level dw 0     

vertical_movement dw 0    ;1 - down, 0 - up
horizontal_movement dw 0  ;1 - left, 0 - right
                  
ball_position_y dw 18
ball_position_x dw 11
                   
paddle_position dw 0                   
previous_time dw 0    
score dw 0                       
win_count dw 0
.code
jmp main

;   print score number  
print_score proc near
    pusha
    xor cx, cx    
    mov ax, score
    xor dx, dx 
    mov si, 10
    .load_stack:   
    div si 		    ;   divide number to 10	  		
    add dl, '0'     ;   ascii
    push dx         ;   push last digit to stack
    xor dx, dx 
    inc cx          ;   for loop
    cmp ax, 0       ;   if quotient 0, then print number
    jne .load_stack ;   else next  
    
    mov bx, 466      
    .print_stack:
    pop dx 
    push ds
    mov ax, 0b800h
    mov ds, ax
    mov [bx], dl
    inc bx
    mov byte ptr [bx], 0fh         
    inc bx
    pop ds           
    loop .print_stack 
             
    popa 
    ret   
endp    

;   initialize game screen  
init_screen proc near
    push cx
    push ax
    push si
    push ds  
    push bx
    push dx     
    mov ax, 0b800h
    mov ds, ax 
        
    xor bx, bx
    mov cx, 1000
    loop_screen:            ;   print black screen
    mov byte ptr [bx], ' '
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    loop loop_screen
    
;   print blue frame
    xor si, si
    mov cx, 40
    .upper_line:
    mov byte ptr [si], ' '
    inc si
    mov byte ptr [si], 90h
    inc si
    loop .upper_line 
    
    mov cx, 23 
    .columns:
    mov byte ptr [si], ' '
    inc si
    mov byte ptr [si], 90h
    inc si
    add si, 76
    mov byte ptr [si], ' '
    inc si
    mov byte ptr [si], 90h
    inc si
    loop .columns

    mov cx, 40
    .lower_line:
    mov byte ptr [si], ' '
    inc si
    mov byte ptr [si], 90h
    inc si
    loop .lower_line

;   print glass (white frame)
    mov cx, 2
    .glass:
    mov al, 80
    mul cl
    add ax, 4
    mov si, ax
    mov byte ptr [si], ' '
    inc si
    mov byte ptr [si], 0f0h
    add si, 45
    mov byte ptr [si], ' '
    inc si
    mov byte ptr [si], 0f0h
    inc cx
    cmp cx, 23
    jne .glass

    mov cx, 2
    .upper_glass:
    mov al, 2
    mul cl
    add ax, 160
    mov si, ax
    mov byte ptr [si], ' '
    inc si
    mov byte ptr [si], 0f0h
    inc cx
    cmp cx, 26
    jne .upper_glass
    
    mov byte ptr [ds:454], 'S' 
    mov byte ptr [ds:456], 'c'
    mov byte ptr [ds:458], 'o'
    mov byte ptr [ds:460], 'r'
    mov byte ptr [ds:462], 'e'
    mov byte ptr [ds:464], ':'    

;   move cursor
    xor bh, bh
    mov dh, 25
    mov ah, 02
    int 10h
      
    pop dx
    pop bx
    pop ds
    pop si
    pop ax
    pop cx
    ret
endp

;   initialize playfield
init_playfield proc near
    push cx
    push bx
    push ax  
    push es
    push di
    push si
      
    mov ax, ds
    mov es, ax
    mov si, offset level
    mov di, offset playfield  
    mov cx, current_level
     
    .level_count:    ;  offset to required level in 'level'
    add si, 396
    loop .level_count
    
    mov cx, 396
    repnz movsb      ;  mov from 'level' to 'playfield'
    
;   mov num of blocks to 'win_count'
    mov bx, offset level_count
    mov cx, current_level
    .blocks_count:     
    add bx, 2
    loop .blocks_count
    mov ax, [bx]
    mov win_count, ax 
    
    pop si
    pop di
    pop es 
    pop ax
    pop bx
    pop cx
    ret
endp

;   print playfield
display_playfield proc near
    push ax
    push es
    push cx
    push di
    push si
    mov ax, 0B800h
    mov es, ax
    mov cx, 19
    mov di, 247
    mov si, offset playfield
    .out_loop:
    push cx
    mov cx, 22
    .in_loop:
    movsb
    inc di          ;   skip attribute
    loop .in_loop
    add di, 36
    pop cx
    loop .out_loop
    pop si
    pop di
    pop cx
    pop es
    pop ax
    ret
endp
        

print_lose proc near    
    push ds
    mov ax, 0b800h
    mov ds, ax
    mov bx, 820 
    mov byte ptr [bx], 'Y'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'o'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'u'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], ' '
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'l'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'o'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 's'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'e'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov bx, 896   
    mov byte ptr [bx], 'P'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'r'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx        
    mov byte ptr [bx], 'e'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 's'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 's'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], ' '
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'E'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'n'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 't'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'e'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    mov byte ptr [bx], 'r'
    inc bx
    mov byte ptr [bx], 0fh
    inc bx 
    mov byte ptr [bx], ' '
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    pop ds
    ret
endp

;   draw paddle
display_paddle proc near       
    push ds
    
    mov bx, offset paddle_position
    mov dx, [bx] 
     
;   draw background    
    mov ax, 0b800h
    mov ds, ax
    mov bx, 1767
    mov cx, 22            
    .next_black:    
    mov byte ptr [bx], 00h
    add bx, 2
    loop .next_black 
;   draw paddle  
    mov bx, 1767
    add bx, dx
    add bx, dx
    mov cx, 4  
    .next_paddle:    
    mov byte ptr [bx], 0e0h
    add bx, 2
    loop .next_paddle
    
    pop ds    
    ret
endp

;   print welcome screen and wait for Enter
welcome_screen proc near 
    push ax
    push bx 
    push dx
    push ds    
    mov ax, 0B800h
    mov ds, ax
    xor bx, bx
    mov cx, 1000
    .print_screen:          ;    print black screen
    mov byte ptr [bx], ' '
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    loop .print_screen
    pop ds
    mov ah, 9h
    mov dx, offset message_welcome
    int 21h                          ;  print welcome message
    
    .wait_enter: 
    mov ah, 1             
    int 16h             ;   check pressed
    jz .wait_enter      ;   if not pressed
    xor ah, ah          ;   if pressed
    int 16h             ;   read key
    cmp ah, 1Ch         ;   cmp if Enter
    je .enter_pressed
    cmp ah, 01h         ;   cmp if Esc
    jne .wait_enter     ;   not Esc
    jmp exit            ;   Esc, close program
    .enter_pressed:     
    pop dx
    pop bx
    pop ax      
    ret
endp

;   move ball
move_ball proc near  
    push dx    
    cmp vertical_movement, 0       ;    up?
    jne .move_down                 ;    no
    cmp ball_position_y, 0         ;    yes, up collision?
    jne .not_up_col                ;    no
    mov vertical_movement, 1       ;    yes, down
    .not_up_col:              
    jmp .horizontal_check
    .move_down:
    cmp ball_position_y, 18        ;    down collision?
    jne .not_down_col              ;    no  
    
    mov bx, offset paddle_position ;    yes, check with paddle
    mov ax, [bx]
    cmp ax, ball_position_x
    jg .paddle_lose
    add ax, 3
    cmp ax, ball_position_x
    jl .paddle_lose
    mov vertical_movement, 0
    jmp .not_down_col 
    
;   you lose    
    .paddle_lose:
    mov ax, 01h
    pop dx
    ret     
    
    .not_down_col: 
    .horizontal_check:
    cmp horizontal_movement, 0
    jne .move_left
    cmp ball_position_x, 21        ;    glass collision? 
    jne .change_ball_pos
    mov horizontal_movement, 1
    jmp .change_ball_pos   
    
    .move_left:                    ;    move ball to the left
    cmp ball_position_x, 0         ;    if it's not on the left
    jne .change_ball_pos   
    mov horizontal_movement, 0
    
    .change_ball_pos:              ;    move ball
    cmp horizontal_movement, 1     ;    left?
    jne .move_right                ;    no
    dec ball_position_x            ;    yes, move left
    call check_collision           ;    collision?
    cmp dx, 00h
    je .vertical_move              ;    no, vertical move
    inc ball_position_x            ;    yes, change direction
    mov horizontal_movement, 0     ;    move right
    jmp .vertical_move
    
    .move_right:                   ;    same...
    inc ball_position_x 
    call check_collision 
    cmp dx, 00h
    je .vertical_move
    dec ball_position_x
    mov horizontal_movement, 1  
    
    .vertical_move:
    cmp vertical_movement, 1
    jne .move_up
    inc ball_position_y 
    call check_collision  
    cmp dx, 00h
    je .move_end
    dec ball_position_y 
    mov vertical_movement, 0
    jmp .move_end 
    
    .move_up:
    dec ball_position_y  
    call check_collision
    cmp dx, 00h
    je .move_end
    inc ball_position_y  
    mov vertical_movement, 1 
    
    .move_end:   
    call check_collision  
    xor ax, ax
    pop dx
    ret
endp

;   draw ball
display_ball proc near           
    push ax
    push bx
    push cx
    push ds     
    mov bx, offset ball_position_y
    mov ax, [bx]
    add ax, 3
    mov cl, 80
    mul cl                      
    mov bx, offset ball_position_x
    mov cx, [bx]
    add ax, cx
    add ax, cx
    add ax, 7
    mov bx, ax
    mov ax, 0b800h
    mov ds, ax 
    mov byte ptr [bx], 0f0h
    pop ds
    pop cx
    pop bx
    pop ax
    ret
endp

;   check is was collision
check_collision proc near    
    push ax
    push bx
    push cx    
    xor dx, dx
    mov bx, offset ball_position_y
    mov ax, [bx]
    mov cl, 22
    mul cl
    mov bx, offset ball_position_x
    mov cx, [bx]
    add ax, cx
    mov bx, offset playfield
    add bx, ax
    cmp byte ptr [bx], 00h
    je .not_collision         ; if not collision - endp
    add score, 10
    dec win_count                
    call print_score
    mov dx, 01h               ; flag for move_ball
    mov byte ptr [bx], 00h
    and ax, 01h               ; check odd 
    cmp ax, 00h               ; or even
    je .delete_next           ; if even - delete next
    dec bx                    ; if odd - delete prev
    mov byte ptr [bx], 00h
    jmp .not_collision
    .delete_next:
    inc bx
    mov byte ptr [bx], 00h  
    
    .not_collision: 
    pop cx
    pop bx
    pop ax
    ret
endp

;   start moving paddle
paddle_start proc near
    mov bx, offset paddle_position
    mov ax, [bx]
    add ax, 2
    mov ball_position_x, ax
    mov ball_position_y, 18
    mov horizontal_movement, 0
    mov vertical_movement, 0 
    call display_playfield
    call display_ball   
    call display_paddle  
    
    .paddle_loop:
    mov ah, 1
    int 16h
    jz .no_key_pressed      ;   key wasn't pressed
    xor ah, ah              ;   key was pressed
    int 16h                 ;   check what key
    cmp ah, 4Dh             ;   if -> pressed
    jne .not_right
    cmp paddle_position, 18 ;   can go right or no? 
    jge .not_right          ;   no
    inc paddle_position     ;   yes, move right
    inc ball_position_x     ;   move ball right too
    call display_playfield
    call display_paddle 
    call display_ball    
    .not_right:             ;   if not ->
    cmp ah, 4Bh             ;   than if <-
    jne .not_left
    cmp paddle_position, 0  ;   can go left or no?
    je .not_left            ;   no
    dec paddle_position     ;   yes, move left
    dec ball_position_x     ;   move ball too
    call display_playfield
    call display_paddle 
    call display_ball
    .not_left:              ;   if not <-
    cmp ah, 01h             ;   if Esc
    jne .not_escape
    jmp exit                ;   close program
    .not_escape:            ;   if not Esc
    cmp ah, 1ch             ;   if Enter
    jne .not_enter
    ret                     ;   exit proc
    .not_enter:             ;   if nothing from special keys was pressed
    .no_key_pressed:
    jmp .paddle_loop        ;   continue waiting
    ret
endp    

print_win proc near   
    push ax
    push bx 
    push dx
    push ds    
    xor bh, bh
    mov dh, 4
    xor dl, dl
    mov ah, 02
    int 10h
    mov ax, 0B800h
    mov ds, ax
    xor bx, bx
    mov cx, 1000
    loop_screen_win:     
    mov byte ptr [bx], ' '
    inc bx
    mov byte ptr [bx], 0fh
    inc bx
    loop loop_screen_win
    pop ds
    mov ah, 9h
    mov dx, offset message_win
    int 21h          
    
    wait_enter_win: 
    mov ah, 1
    int 16h
    jz wait_enter_win
    xor ah, ah
    int 16h
    cmp ah, 1Ch
    je enter_win
    cmp ah, 01h
    jne wait_enter_win
    mov ah, 00
    mov al, 03
    int 10h
    mov ah, 4Ch
    int 21h
    enter_win:
    xor bh, bh
    mov dh, 25
    mov ah, 02
    int 10h
    pop dx
    pop bx
    pop ax      
    ret
endp

main:
    mov ax, @data
    mov ds, ax          
    
    ;   set video mode
    mov ah, 00  
    mov al, 01
    int 10h       

    ; turn-off blinking attribute
    mov ax, 1003h       
    mov bl, 00
    int 10h

    call welcome_screen
    
    restart:
    mov score, 0 
    mov current_level, 0
    mov previous_time, 0  
    mov ball_position_y, 18
    mov ball_position_x, 11
    mov horizontal_movement, 0
    mov vertical_movement, 0    
    call init_screen
    call print_score 
    call init_playfield  
    call display_playfield
    call display_ball   
    call display_paddle
    call paddle_start  
    
;   set timer to real time
    mov ah, 01h          
    xor cx, cx             ;    h, min
    xor dx, dx             ;    sec, summer time
    int 1ah 
        
    start:                     
    mov ah, 1
    int 16h                ;    key pressed?
    jz no_key_pressed
    xor ah, ah
    int 16h
    cmp ah, 4Dh            ;    -> pressed?
    jne not_right
    cmp paddle_position, 18
    jge not_right
    inc paddle_position
    call display_playfield
    call display_paddle 
    call display_ball    
    not_right:  
    cmp ah, 4Bh            ;    <- pressed?
    jne not_left
    cmp paddle_position, 0
    je not_left
    dec paddle_position
    call display_playfield
    call display_paddle 
    call display_ball
    not_left:
    cmp ah, 01h            ;    Esc pressed?
    jne not_escape
    jmp exit
    not_escape: 
    no_key_pressed: 
    
    mov ah, 00h            ;    read timer
    int 1ah       
    
    push dx
    mov ax, previous_time
    sub dx, ax
    mov ax, dx
    pop dx        
    
    cmp ax, 3              ;    delay 3 * 0.06 sec
    jl not_move
    mov previous_time, dx
    call move_ball 
    cmp ax, 00h            ;    if ax == 01h - you lose
    je not_lose
    call print_lose
    jmp wait_enter
    
    not_lose:  
    call display_playfield
    call display_paddle 
    call display_ball 
    
    not_move:
    cmp win_count, 0
    jne start
    inc current_level
    cmp current_level, 2
    jne not_win
    call print_win
    jmp restart 
    
    not_win:  
    mov previous_time, 0  
    mov ball_position_y, 18
    mov ball_position_x, 11
    mov horizontal_movement, 0
    mov vertical_movement, 0    
    call init_screen
    call print_score 
    call init_playfield  
    call display_playfield
    call display_ball   
    call display_paddle
    call paddle_start
    mov ah, 01h
    xor cx, cx
    xor dx, dx
    int 1ah      
    jmp start   
    
    wait_enter:
    mov ah, 1
    int 16h
    jz wait_enter
    xor ah, ah
    int 16h
    cmp ah, 1Ch
    jne not_enter
    jmp restart
    not_enter:
    cmp ah, 01
    jne wait_enter  
exit:
mov ah, 00
mov al, 03
int 10h
mov ah, 4Ch
int 21h
end main
