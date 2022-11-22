%{
#include <iostream>
#include <string>
#include <sstream>


#define YYSTYPE atributos

using namespace std;

int var_temp_qnt;

struct atributos
{
	string label;
	string traducao;
};

int yylex(void);
void yyerror(string);
string gentempcode();

%}

%token TK_IF
%token TK_THEN
%token TK_WHILE
%token TK_DO
%token TK_BEGIN
%token TK_END
%token TK_VAR
%token TK_PRINT
%token TK_ATRIBUICAO
%token TK_DIFERENTE
%token TK_MENOR
%token TK_MENOR_IGUAL
%token TK_MAIOR_IGUAL
%token TK_MAIOR
%token TK_DIVISAO
%token TK_CONST
%token TK_DIGIT
%token TK_ID
%token FIM_CODIGO


%start program
%left '+'

%%

program: block FIM_CODIGO
;

block: CONST VAR statement ;

CONST:     TK_CONST TK_ID '=' TK_DIGIT A ';'
    |	
	;

A:     ',' TK_ID '=' TK_DIGIT A  	
    |	
    ;	

VAR:     TK_VAR TK_ID L ';' 	
	|	
    ;

L:     ',' TK_ID L  	
	|	
    ;

statement: TK_ID TK_ATRIBUICAO expression ';'	
	  
	| TK_BEGIN statement E TK_END
	  
	| TK_IF condition TK_THEN statement
	  
	| TK_WHILE condition TK_DO statement
	  
	| TK_PRINT expression  ';' 
    ;

E:  statement E 	
   |       
   ;

condition: expression '=' expression 
	   
	| expression TK_DIFERENTE expression
	   
	| expression TK_MENOR expression
	   
	| expression TK_MENOR_IGUAL expression
	   
	| expression TK_MAIOR_IGUAL expression
	   
	| expression TK_MAIOR expression	   
    ;

expression: term '+' term			
	| term '-' term 			
	| term 	
	; 

term: factor '*' factor 			
	| factor '/' factor			
	| factor 	
	;

factor: '-' final
	| final	
	;

final: '(' expression ')'	
	| TK_DIGIT			
	| TK_ID			
	;
%%


#include "lex.yy.c"

int yyparse();

int main(int argc, char* argv[])
{
	
	yyparse();
	cout<<"ANALISE SINTATICA : OK"<<endl;
	return 0;
}

void yyerror(string MSG)
{
	cout << MSG << endl;
	cout<<"ANALISE SINTATICA : FAIL"<<endl;
	exit(0);
}