loop :-grusswort(_,Y),random(0,Y,I),gruss(B,I),gethostname(N),writeln((B,N)),repeat,read_line(X),echo(X), !.
echo(X) :- string_lower(X,Y),last_input(Y),verabschiedung(_,E),random(0,E,I),verabsch(B,I),writeln(B), !. % Abbruch
echo(X) :- split(X,Y), rule(Y,Z),konk(Z,Ö), writeln(Ö), fail.

last_input("ende").


split(X,Y):- string_lower(X,A),split_string(A, " ", ",", Y).

%Begrüßungen
rule(X,Y):-gruss(A,_),member(A,X),grusswort(_,C),random(0,C,E),gruss(L,E),Y=[L],!.
rule(["ich","habe"|B],["warum","hast","du"|Y]):-append(B,["?"],Y),!.
rule(X,Y):-member(Z,X),kauskonj(Z),random(0,2,A),konjvar(A,Y),!.
rule(X,Y):-member("roboter",X),append(A,["roboter"|B],X),append(A,["mensch"|B],Y),!.
%Notfallantworten
rule(X,Y):-member("du",X),split("Lass uns bitte bei dir bleiben",Y),!.
rule(_,X):-random(0,3,Y),rulez(Y,X).

konjvar(0,Y):-split("Das kann ich nachvollziehen",Y).
konjvar(1,Y):-split("Ich glaube da stecken noch andere Gründe dahinter",Y).
rulez(2,X):-split("Da weiß nicht einmal ich, was ich sagen soll",X),!.
rulez(0,X):-split("Das interessiert mich nicht",X),!.
rulez(1,["...", "1,000,000", "............", "10000000", "years", "later",">>","42", "<<", "(last", "release", "gives", "the", "question)"]):-!.


%Gedöns
kauskonj(X):-member(X,["weil","da"]).
grusswort(X,Y):-X=["hallo","hi","hey","guten morgen","guten tag","guten abend","moin"],length(X,D),Y is D+1.
verabschiedung(X,Y):-X=["tschüß","auf wiedersehen","bis bald","ciao"],length(X,D),Y is D+1.
gruss(X,I):-grusswort(A,_),nth0(I,A,X).
verabsch(X,I):-verabschiedung(A,_),nth0(I,A,X).
%emotion(X):-
%Liste von Strings zu String
konk([H],H):-string(H),!.
konk([H|T],F):-string_concat(H," ",I),konk(T,S),string_concat(I,S,F).

read_line(String) :-
    current_input(Input),
    read_string(Input, "\n", "\r", _, String).



