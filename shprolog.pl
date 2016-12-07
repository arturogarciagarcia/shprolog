/*Adivinador de super heroes de DC comics
Para empezar el juego escribe: ?- start. no olvides 
el punto.*/

start :- 
nl, 
write('Piensa en un super heroe de DC comics, '),
nl,
write('Responde las siguientes preguntas con s o n siendo s si y n no'),
nl,
nl,
sera(Superheroe),

/*cuando llegue a una hoja del arbol, habremos encontrado la respuesta*/

nl,
nl,
write('************************'),
nl,
write('creo que tu heroe es'),
write(Superheroe),
nl,
write('************************'),
nl,
nl,



/*reglas para saber el super heroe/*

sera(batman) :- batman, !.

sera(superman) :- superman, !.

sera(mujer_maravilla) :- mujer_maravilla, !.

sera(detective_marciano) :- detective_marciano, !.

sera(aquaman) :- aquaman, !.

sera(flecha_verde) :- flecha_verde, !.


/*metodo para verificar el super heroe*/
batman :- verificar(logo_de_murcielago).

superman :- verificar(s_de_logo).

detective_marciano :- verificar(piel_verde).

aquaman :- verificar(respira_bajo_el_agua).

mujer_maravilla :- verificar(es_mujer).

flecha verde :- verificar(usa_flechas).


logo_de_murcielago :- verificar(su_logo_es_un_murcielago).

s_de_logo :- verificar(su_logo_es_una_s).

es_mujer :- verificar(es_mujer).

respira_bajo_el_agua :- verificar(respira_bajo_el_agua).

usa_flechas :- verificar(dispara_flechas).

piel_verde :- verificar(piel_verde).



/*como saber si adivino el super heroe*/
write('¿He adivinado? (s/n) '),
read(Respuesta),
nl,


/*Ofrecemos la oportunidad de volver a jugar otra vez*/

write('¿Quieres seguir jugando? '),

read(Respuesta3),

( (Respuesta3 == s)

->

start ;

nl,

nl,

write('ESPERO QUE HAYAS DISFRUTADO JUGANDO CONMIGO'),

nl,

nl,

write('ADIOS'),

nl).

/*Hace dinámicas las funciones que se van a añadir con assert*/

:- dynamic cumple/1,no_cumple/1,sera/1,verificar/1.

/* Borramos todos los valores almacenados con assert que indican el

camino seguido en el árbol */

borrar :- retract(cumple(_)),fail.

borrar :- retract(no_cumple(_)),fail.

borrar.
