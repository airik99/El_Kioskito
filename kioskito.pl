atiende(dodain, lunes, 9, 15).
atiende(dodain, miercoles, 9, 15).
atiende(dodain, viernes, 9, 15).

atiende(lucas, martes, 10, 20).

atiende(juanC, sabado, 18, 22).
atiende(juanC, domingo, 18, 22).

atiende(juanFdS, jueves, 10, 20).
atiende(juanFdS, viernes, 12, 20).

atiende(leoC, lunes, 14, 18).
atiende(leoC, miercoles, 14, 18).

atiende(martu, miercoles, 23, 24).

atiende(vale, Dia, Desde, Hasta) :-
    atiende(juanC, Dia, Desde, Hasta).

atiende(vale, Dia, Desde, Hasta) :-
    atiende(dodain, Dia, Desde, Hasta).

% maiu está pensando si hace el horario de 0 a 8 los martes y miércoles
% ----------  PUNTO 2 ---------- 

quienAtiende(Persona, HoraAtiende, Dia) :-
    atiende(Persona, Dia, Desde, Hasta),
    between(Desde, Hasta, HoraAtiende).

% ----------  PUNTO 3 ---------- 

foreverAlone(Persona, Dia, HoraAtiende) :-
    quienAtiende(Persona, HoraAtiende, Dia),
    not((quienAtiende(OtraPersona, HoraAtiende, Dia), Persona \= OtraPersona)).

% ----------  PUNTO 4 ---------- 
    
% ----------  PUNTO 5 ---------- 

venta(dodain, fecha(lunes, 10, agosto), [golosinas(1200), cigarrillos([jockey]), golosinas(50)]).
venta(dodain, fecha(miercoles, 12, agosto), [bebidas(alcoholica, 8), bebidas(noAlcoholica, 1), golosinas(10)]).
venta(martu, fecha(miercoles, 12, agosto), [golosinas(1000), cigarrillos([chesterfield, colorado, parisiennes])]).
venta(lucas, fecha(martes, 11, agosto), [golosinas(600)]).
venta(lucas, fecha(martes, 18, agosto), [bebidas(noAlcoholica, 2), cigarrillos([derby])]).

vendedorSuertudo(Vendedor) :-
    venta(Vendedor, _, _),
    forall(primeraVentaDelDia(Vendedor, _, Venta), ventaImportante(Venta)).

primeraVentaDelDia(Vendedor, Dia, Venta) :-
    venta(Vendedor, Dia, Ventas),
    nth0(0, Ventas, Venta).

ventaImportante(golosinas(Plata)) :-
    Plata > 100.

ventaImportante(cigarrillos(Marcas)) :-
    length(Marcas, Cantidad),
    Cantidad >= 2.

ventaImportante(bebidas(alcoholica, _)).

ventaImportante(bebidas(noAlcoholica, Cantidad)) :-
    Cantidad >= 5.

sinRepetidos([], []).

sinRepetidos([H | T], [H | Out]) :-
    not(member(H, T)),
    sinRepetidos(T, Out).

sinRepetidos([H | T], Out) :-
    member(H, T),
    sinRepetidos(T, Out).
