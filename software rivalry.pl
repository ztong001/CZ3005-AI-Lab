competitor(webscape, macrosoft).
software(mozilla).
developed(webscape, mozilla).
steal(bill, X, webscape):-software(X), developed(webscape, X).
ceo(bill).
immoral(X):-ceo(X), business(Y), company(Z), rival(Z), steal(X,Y,Z).
rival(X):-competitor(X, macrosoft).
business(X):-software(X).
company(webscape).
company(macrosoft).