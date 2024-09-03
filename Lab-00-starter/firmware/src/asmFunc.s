/*** asmFunc.s   ***/

#include <xc.h>
 
# Tell the assembler that what follows is in instruction memory    
.text
.align

# Tell the assembler to allow both 16b and 32b extended Thumb instructions
.syntax unified

    
/********************************************************************
function name: asmFunc
function description:
     output = asmFunc ( input )
     
where:
     input:  an integer value passed in from the C program
     output: the integer value returned to the C function
     
     function description: The C call pases in an integer value by placing
                           it in register 0 (r0).
                           asmFunc adds 42 to that value.
                           It returns the value to the C call by storing it
                           in r0 (so the original value is overwritten).
     
     notes:
        None
     
     
********************************************************************/    
.global asmFunc
.type asmFunc,%function
asmFunc:   

    # save the caller's registers, as required by the ARM calling convention
    push {r4-r11,LR}
    
    # add 42 to the current value of r0, and place the result in r0
    ADD r0, r0, 42
    
    # restore the caller's registers, as required by the ARM calling convention
    pop {r4-r11,LR}

    mov pc, lr	 /* asmFunc return to caller */
   

/**********************************************************************/   
.end  /* The assembler will not process anything after this directive!!! */
           




