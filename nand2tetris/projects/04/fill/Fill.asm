// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.



// Check if keyboard input is greater than 0 to see if something's been typed
(MAIN)
    // Set number of iterations here
    @KBD
    D=A
    @SCREEN
    D=D-A
    D=D+1
    @iter
    M=D
    // Set D as the value in the keyboard register
    @KBD
    D=M
    // Blacken the screen if greater than 0
    @BLACK
    D;JGT
    @WHITE
    D;JEQ

(BLACK)
    // Keep decreasing iter by 1, we reset it up in main
    @iter
    M=M-1
    // D is equal to the value stored in iter (first it will be 8191)
    D=M
    @SCREEN
    // Going backward, the screen value address will be the last one (or 24575)
    A=A+D
    // Set it to black
    M=-1
    // Go back to MAIN if iter is equal to 0
    @MAIN
    D;JEQ
    // Go back to black if iter is greater than 0
    @BLACK
    D;JGT

(WHITE)
    // Keep decreasing iter by 1, we reset it up in main
    @iter
    M=M-1
    // D is equal to iter as it moves its way down
    D=M
    @SCREEN
    // Moves backward
    A=A+D
    // Set it to white now
    M=0
    // Go back to main if D or iter is equal to 0
    @MAIN
    D;JEQ
    // Loop back to white if iter is still greater than 0
    @WHITE
    D;JGT
