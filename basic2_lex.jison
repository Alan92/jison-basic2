
 /*  description: Basic grammar that contains a nullable A nonterminal. */

%lex
%%

\s+               {/* skip whitespace */}
[a-zA-Z_]\w*      {return 'x';}
[+-]?[0-9]+("."[0-9]+)?\b  {return 'NUMBER';}
"="               {return '=';}
";"               {return ';';}
/lex
%rigth '='
%%

S   : A
	   { return $$; }
    ;
A   : /* empty */  
           { 
              console.log("starting"); 
              $$ = 0; 
           }
    | C '=' B ';' A
	    { 
               $$ = $1 + $2 + $3 + $5;  
              console.log($$)
	    }
    ;

B :	NUMBER
	    {$$ = "Valor " + yytext ;};
	
C: 	x 
	    {$$ = "Clave " + yytext;}  
    ;
  