;Adrineh Khodaverdian
;CS/IS165
;Lab 1 simple calculator
BR main 

value: .WORD 0
result: .WORD 0
option: .BLOCK 1


intro: .ASCII "------------SIMPLE CALCULATOR-------------\x00\x0A\x0A\x00" 
vPrompt: .ASCII "\x0Ainput number: \x00"
prompt: .ASCII "\x0Ainput option: \x00"
newline: .ASCII "\x0AAns = \x00"
invalid: .ASCII "\x0AINVALID INPUT\x00"
quiting: .ASCII "\x0AQUIT!\x00"
menu: .ASCII "\x0A\x0AMENU\x0AA)ADD\x0AS)SUB\x0AN)NEG\x0AQ)QUIT\x0A\x00"




main:  STRO intro,d      ;print the title
     
       
do:    STRO menu,d      ;print the menu
       STRO prompt,d    ;ask for char input
       LDBA charIn,d    ;get char input
       STBA option,d    ;store character
     
      
   

if:    CPBA 'A',i     
       BRNE elIf1     ;if option not A go to next else if condition
       STRO vPrompt,d  ;insert num input
       DECI value,d    ;gettting value input
       LDWA result,d   ;load byte result
       ADDA value,d    ;add to result
       STWA result,d
       STRO newline,d   ;print answer
       DECO result,d
       BR   do
        

elIf1: CPBA 'S',i
       BRNE elIf2     ;if not S continue to next else if
       STRO vPrompt,d
       DECI value,d   ;input value
       LDWA result,d  ;load byte result
       SUBA value,d   ;subtract value
       STWA result,d  ;store in result
       STRO newline,d
       DECO result,d  ;output result
       BR  do         ;back to main menu 

elIf2: LDBA charIn,d  ;eat the newline
       LDBA option,d  
       CPBA 'N',i
       BRNE while 
       LDWA result,d    ;load byte value
       NEGA            ;negate the value
       STWA result,d 
       STRO newline,d
       DECO result,d
       BR do


else:  STRO invalid, d;print error
       BR do

while: CPBA 'Q', i ; if (ch =='Q')
       BRNE else
       STRO quiting,d 
       STOP      

   

.END 