male(charles).
male(andrew).
male(edward).
female(elizabeth).
female(ann).
offspring(charles,elizabeth).
offspring(andrew,elizabeth).
offspring(ann,elizabeth).
offspring(edward,elizabeth).
elder_than(charles,ann).
elder_than(ann,andrew).
elder_than(andrew,edward).

%%declare new predicate to propagate birth order
is_older(X,Y):- elder_than(X,Y).
is_older(X,Y):- elder_than(X,Z),is_older(Z,Y).

%%Original order by gender
precedes(X,Y):- male(X),male(Y),is_older(X,Y).
precedes(X,Y):- male(X),female(Y), Y\=elizabeth.
precedes(X,Y):- female(X), female(Y),is_older(X,Y).

%%Sorting algorithm
%insert(A,[B|C],[B|D]):- not(precedes(A,B)),!,insert(A,C,D).
%%New succession rule "insert"
insert(A,[B|C],[B|D]):- not(is_older(A,B)),!,insert(A,C,D).
insert(A,C,[A|C]).
succession_sort([A|B],SortList):- succession_sort(B,Tail), insert(A,Tail,SortList).
succession_sort([],[]).

successionList(X,SuccessionList):- findall(Y,offspring(Y,X),ChildNodes),succession_sort(ChildNodes,SuccessionList).
