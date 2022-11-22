%{
	#include<stdio.h>
	#include<string>
%}


CONST [-][0-9]+
DIGIT [0-9]+
ID [a-zA-Z][a-zA-Z0-9]*
ESPACO[ \t]

DELIM{ESPACO}+

%%

"IF"      {return TK_IF;}
"THEN"    {return TK_THEN;}
"WHILE"   {return TK_WHILE;}
"DO"      {return TK_DO;}
"BEGIN"   {return TK_BEGIN;}
"END"     {return TK_END;}
"VAR"     {return TK_VAR;}
"PRINT"   {return TK_PRINT;}


[()[\];,] {return *yytext;}
[+\-*/]   {return *yytext;}
"="       {return '=';}

"\n"      {}
{DELIM}   {}


":=" {return TK_ATRIBUICAO;}
'#'  {return TK_DIFERENTE;}
'<'  {return TK_MENOR;}
'>'  {return TK_MAIOR;}
"<=" {return TK_MENOR_IGUAL;}
">=" {return TK_MAIOR_IGUAL;}

{CONST} {yylval.label = yytext; return TK_CONST;}
{DIGIT} {yylval.label = yytext; return TK_DIGIT;}
{ID}    {yylval.label = yytext; return TK_ID;}


"." {return FIM_CODIGO;}


%%   
