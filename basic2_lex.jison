
 /*  description: Basic grammar that contains a nullable A nonterminal. */

%lex
%%

\s+               {/* skip whitespace */}
[a-zA-Z_]\w*      {return 'ID';}
[+-]?[0-9]+("."[0-9]+)?\b  {return 'NUMBER';}
"="               {return yytext;}
";"               {return yytext;}

/lex
%{
var tabla = {};
%}
%%
S   : A
	   { var tabla_aux = JSON.stringify(tabla,undefined,2);
				return tabla_aux;
}
    ;
A   : /* empty */  
           {  
              $$ = 0; 
           }
    | E
    | E ';' A
    ;

B :  NUMBER
     ;
	
C:   ID 
     ;
E:   C '=' B  
           {tabla[$1] = $$ = $3;}  
     ;
  
  
