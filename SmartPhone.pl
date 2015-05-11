company(sumSum).
company(appy).
smartPhoneTech(galacticaS3).
develop(galacticaS3,sumSum).
boss(stevey).
competitor(sumSum,appy).
stole(stevey,galacticaS3,sumSum).

rival(X) :- competitor(X,appy).
business(X) :- smartPhoneTech(X).
unethical(X):- boss(X), business(Y), company(Z),rival(Z), stole(X,Y,Z).

