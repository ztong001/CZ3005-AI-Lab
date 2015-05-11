brother(peter,warren).
brother(jerry,karen).
brother(jerry,stuart).
male(stuart).
male(peter).
male(warren).
male(jerry).
male(juan).
female(karen).
female(maryalice).
female(ann).
female(maria).
sister(karen,jerry).
sister(ann,maryalice).
parent_of(maryalice,jerry).
parent_of(warren,jerry).
parent_of(maria,warren).
parent_of(juan,warren).

parent_of(X,Z):- brother(Y,Z),(father(X,Y);mother(X,Y)).
father(X,Y) :-  parent_of(X,Y), male(X).
mother(X,Y) :-  parent_of(X,Y), female(X).
son(X,Y) :- parent_of(Y,X), male(X).
daughter(X,Y) :- parent_of(Y,X), female(Y).
sibling(X,Y):- brother(X,Y); sister(X,Y).
grandfather(X,Y) :- parent_of(Z,Y), father(X,Z).
aunt(X,Y):- parent_of(Z,Y), sister(X,Z).
uncle(X,Y):- parent_of(Z,Y), brother(X,Z).
cousin(X,Y):- (uncle(Z,Y);aunt(Z,Y)), parent_of(Z,X).
spouse(X,Y):- father(X,Z), mother(Y,Z).
