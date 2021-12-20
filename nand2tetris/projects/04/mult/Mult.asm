// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
// Initialize product to 0
@iter
M=0
@R2
M=0
// First, we are going to set the number of iterations
@R0
D=M
@iter
M=D
// Check for the jump right away actually
@iter
D=M
@END
D;JLE
// Set the number that is going to be added to answer now constantly
@R1
D=M
@R2
M=M+D
@iter
M=M-1
D=M
@12
D;JGT
@END
0;JMP
