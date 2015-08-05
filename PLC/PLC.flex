import java_cup.runtime.*;

%%

/* Code (tag handling) */

%{
	public static int actualTag = 0;

	public static String newTag(){
		return "L"+(actualTag++);	
	}
%}

/*  Declarations */ 
   
%cup 

%%   

/* Expresions and rules */

/* Operators */
    "+"                  		{ return new Symbol(sym.MAS); }
    "-"                  		{ return new Symbol(sym.MENOS); }
    "*"                  		{ return new Symbol(sym.POR); }
    "/"                  		{ return new Symbol(sym.DIV); }
/* Precedence */
    "("                  		{ return new Symbol(sym.AP); }
    ")"                  		{ return new Symbol(sym.CP); }
    "{"                  		{ return new Symbol(sym.ALL); }
    "}"                  		{ return new Symbol(sym.CLL); }
/* Delimiter */
    ";"                  		{ return new Symbol(sym.PYC); }
/* Assignations */
    "="                  		{ return new Symbol(sym.ASIG); }
/* Comparisons */
    "=="                 		{ return new Symbol(sym.EQ); }
    "!="                 		{ return new Symbol(sym.NEQ); }
    "<"                  		{ return new Symbol(sym.LOW); }
    "<="                 		{ return new Symbol(sym.LOE); }
    ">"                  		{ return new Symbol(sym.GRE); }
    ">="                 		{ return new Symbol(sym.GOE); }
/* Logical */
    "!"                  		{ return new Symbol(sym.NOT); }
    "&&"                 		{ return new Symbol(sym.AND); }
    "||"                 		{ return new Symbol(sym.OR); }
/* Code */   
    "if"                 		{ return new Symbol(sym.IF, newTag()); }
    "else"               		{ return new Symbol(sym.ELSE); }
    "while"              		{ return new Symbol(sym.WHILE, newTag()); }
    "do"                 		{ return new Symbol(sym.DO, newTag()); }
    "for"                		{ return new Symbol(sym.FOR, newTag()); }
    "print"              		{ return new Symbol(sym.PRINT); }
/* Numbers */
    0|[1-9][0-9]*        		{ return new Symbol(sym.ENTERO, new Integer(yytext()) ); }
/* Identifiers */
    [_a-zA-Z$][_a-zA-Z0-9$]*	        { return new Symbol(sym.IDENT, yytext()); }
/* Others */
    \ |\t\f              		{  }  
    [^]                  		{ /*throw new Error("Illegal character <"+yytext()+">");*/ }
