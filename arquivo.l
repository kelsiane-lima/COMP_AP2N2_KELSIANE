%{
#include <string.h>
%}

NUM [0-9]+\.?[0-9]*
VARS [a-z]+[0-9]*
FIM "ket_fim"
INICIO "ket_inicio"
IF "if"
ELSE "else"
WHILE "while"
PRINTF "ketoutf"
PRINTI "ketouti"
PRINTS "ketouts"
SCANINT "ketini"
SCANFLOAT "ketinf"
SCANSTRING "ketins"
INT "int"
COMENT "#"
FLOAT "float"
STRING "string"
TEXTO [a-zA-Z]
    
%%
{COMENT}.* {;}
{FIM} {return FIM;}
{INICIO} {return INICIO;}
{IF} {return IF;}
{ELSE} {return ELSE;}
{WHILE} {return WHILE;}
{PRINTS} {return PRINTS;}
{PRINTF} {return PRINTF;}
{PRINTI} {return PRINTI;}
{SCANINT} {return SCANINT;}
{SCANFLOAT} {return SCANFLOAT;}
{SCANSTRING} {return SCANSTRING;}
{STRING} {return STRING;}
{INT} {return INT;}
{FLOAT} {return FLOAT;}
{VARS} {
    strcpy(yylval.str,yytext);
    return VARS;
}

{TEXTO} {
    strcpy(yylval.str,yytext);
    return TEXTO;
}

{NUM} {
    yylval.flo = atof(yytext);
    return NUM;
    }

[-+()=/*^{};] {return *yytext;
            }
            

">" {yylval.fn = 1; return CMP; }
"<" {yylval.fn = 2; return CMP; }
"<>" {yylval.fn = 3; return CMP; }
"==" {yylval.fn = 4; return CMP; }
">=" {yylval.fn = 5; return CMP; }
"<=" {yylval.fn = 6; return CMP; }

[\ \n\t]*   {;}

. {printf("(%s) Ignorado\n",yytext);}
%%
