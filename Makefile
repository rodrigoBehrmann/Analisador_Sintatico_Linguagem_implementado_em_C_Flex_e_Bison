all:
	clear
	flex lexico.l
	bison -d sintatico.y 
	g++ -o glf sintatico.tab.c -ll 
	
	 ./glf < exemplo.a

clean: 
	rm y.tab.c
	rm y.tab.h
	rm lex.yy.c
	rm glf
