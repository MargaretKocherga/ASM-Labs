.286
.model small
.data

cannot_open_file_msg db 'Cannot open file$'
wrong_args_msg db 'Wrong arguments', 10, 13, 'Use: lab5.exe filename.txt$'
cannot_read_data db 'Cannot read data from file$'
success_msg db 'Success!$'
endl db 10, 13, '$'                                                                 
                  
debug db "debug$" 
                  
size_to_read equ 256          
word_max_size equ 50

file_descriptor dw 0
cmd_file_name db 256 dup(0)
word db word_max_size + 1 dup('$')   
word_last_index dw 0
reading_size dw 0   
word_counter dw 0

last_word_removed_flag db 0 
                    
reading_val db size_to_read dup('$')
file_read_position dd 0  

file_write_position dd 0
                 
.stack 100h

.code

proc print_str 
    push ax
    xor ax, ax     
    mov ah, 09h
    int 21h
    pop ax     
    ret       
endp print_str     

;   work with file                   
proc manage_file                
    mov dx, offset cmd_file_name
    mov ah, 3Dh        ;    open file
    mov al, 02h        ;    for read/write
    int 21h      
    mov file_descriptor, ax  
    
    jnc read_file      ;    if not CF, file_descriptor is ok
    jmp wrong_file     ;    else error
    
wrong_file:
    mov dx, offset cannot_open_file_msg
    call print_str
    mov ax, 4c00h
    int 21h     
        
read_file:
    mov ah, 42h   ; move read/write pointer
    mov cx, word ptr [file_read_position]      ;    cx:dx -  distance
    mov dx, word ptr [file_read_position + 2]
    mov al, 0     ; regarding begining of file  
    mov bx, file_descriptor
    int 21h 
        
    mov cx, size_to_read        ;   bytes to read
    mov dx, offset reading_val  ;   receiving buffer 
    mov ah, 3Fh   ; read from file
    mov bx, file_descriptor
    int 21h
        
    jc close_file_cause_error   ;   if cf == 1 error
        
    cmp ax, 0     
    je close_file ; if number read bytes == 0 close file
        
    mov cx, word ptr [file_read_position]
    mov dx, word ptr [file_read_position + 2]
    add dx, ax    ; add read bytes to dx
    adc cx, 0     ; add cf to cx
    mov word ptr [file_read_position], cx
    mov word ptr [file_read_position + 2], dx   ;   set new pos
    mov [reading_size], ax
    call manipulate_reading_data
         
    jmp read_file               
                                 
close_file_cause_error:    
    push dx       
    mov dx, offset cannot_read_data
    call print_str                 
    pop dx 
               
close_file:    
    call check_last_word
                         
    mov ah, 3Eh     ;   close file
    mov bx, file_descriptor
    int 21h           
ret                               
endp manage_file

;   check read words    
proc manipulate_reading_data
    pusha                   
    xor si, si
    xor ax, ax
manipulating_loop:
    mov dl, [reading_val + si]
    mov di, word_last_index
    mov [word + di], dl
    inc di
    mov [word_last_index], di
        
check_for_separation:
    cmp dl, ' '
    je find_separator  
    
    cmp dl, 13        ; cret
    je find_separator
            
    cmp dl, 10        ; newl
    je find_separator
            
    cmp dl, 0         ; null
    je find_separator           
    jmp increment_manipulation_loop
         
find_separator:
    call check_word            ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    cmp dl, 13                 ;    if cret
    je reset_word_counter      ;    word_counter = 0
         
    jmp increment_manipulation_loop 
        
reset_word_counter:
    mov word_counter, 0 
            
increment_manipulation_loop:
    inc si
    cmp si, reading_size    
    jb manipulating_loop 
exit_manipulation:
    popa      
    ret
endp manipulate_reading_data

;   check if word odd or even 
proc check_word    
    pusha
    mov bx, word_last_index
    dec bx    
    cmp bx, 0
    jbe save_word 

;   word_counter++    
    mov bx, word_counter     
    inc bx
    mov word_counter, bx  
    
    mov ax, bx 
    mov bl, 2
    xor ah, ah  
    idiv bl      
    cmp ah, 1      
    jne save_word  ;    if even - save word
                   ;    if odd - delete               
                      
    mov di, word_last_index
    dec di                     
    mov bl, [word + di]
    mov [word], bl    
    mov word_last_index, 1   
    
save_word: 
    call print_word    
    popa            
    ret
endp check_word      

proc print_word
    pusha
    mov ah, 42h     ; move read/write pointer
    mov cx, word ptr [file_write_position]      ;   cx:dx - distance    
    mov dx, word ptr [file_write_position + 2]
    mov al, 0       ; regarding begining of file
    mov bx, file_descriptor
    int 21h
    
    mov ah, 40h             ;   write word to file
    mov cx, word_last_index ;   word length
    mov bx, file_descriptor
    mov dx, offset word     ;   word beginning
    int 21h
    
    mov ax, word_last_index
    mov cx, word ptr [file_write_position]   
    mov dx, word ptr [file_write_position + 2]
    add dx, ax
    adc cx, 0                                                   
    mov word ptr [file_write_position], cx
    mov word ptr [file_write_position + 2], dx 
                                                     
    mov word_last_index, 0
                                                          
    popa      
    ret
endp print_word    

proc check_last_word
    pusha
       
    call check_word 
    
    mov bx, word_counter  
    
    mov ax, bx 
    mov bl, 2
    xor ah, ah  
    idiv bl      
    cmp ah, 1                       
    jne exit_check   ;    if even - save word
                     ;    if odd - delete
    
    last_word_remove:      
    mov ah, 42h   ; move read/write pointer
    mov cx, word ptr [file_write_position]     ;   cx:dx - distance
    mov dx, word ptr [file_write_position + 2]
    dec dx
    mov al, 0     ; regarding begining of file
    mov bx, file_descriptor
    int 21h
        
exit_check:                  
    mov ah, 40h 
    mov cx, 0   ;   cut file to current poiner because of cx = 0
    mov bx, file_descriptor
    mov dx, offset word
    int 21h                                                       
    popa      
    ret
endp check_last_word    
                
start:
    mov ax, @data
    mov ds, ax
    
    mov bl, es:[80h]    ;   args line length 
    add bx, 80h         ;   args line last    
    mov si, 82h         ;   args line start
    mov di, offset cmd_file_name

    cmp si, bx          
    ja wrong_args       ;   if si > bx no args      
              
    mov cl, es:[80h]    ;   filename length
    dec cl     
    
;   get filename to cmd_file_name            
get_file_path:
    mov al, es:[si]
    mov [di], al
    inc di
    inc si
    xor ch, ch                 
    loop get_file_path
     
    call manage_file
    
success:
    mov dx, offset success_msg
    call print_str
    mov ax, 4c00h
    int 21h    
    jmp exit
                                 
wrong_args:
    mov dx, offset wrong_args_msg
    call print_str
    mov ax, 4c00h
    int 21h         
exit:
    
end start