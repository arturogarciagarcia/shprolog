/* Piensa en un super heroe de DC comics

Para empezar el juego, escribe: " ?- start." */

/*Comienza el juego*/

/*Para implementar el juego partiremos de un árbol en el que tendremos

todos los animales que podemos adivinar y las relaciones entre ellos*/

start :-

nl,

write('Piensa en un super heroe de DComics, '),

nl,

write('Responde las siguientes preguntas'),

nl,

nl,

sera(Superheroe),


/*Cuando lleguemos a una hoja del árbol, habremos encontrado la

respuesta*/

nl,

nl,

write('****************************************'),

nl,

write('Creo que el superheroe es '),

write(Superheroe),

nl,

write('****************************************'),

nl,

nl,

/*Aprendizaje de nuestro programa*/

/*Comprobamos si hemos acertado el super heroe*/

write('¿He acertado? (s/n) '),

read(Respuesta),

nl,

/*En el caso de no haber acertado, intentamos introducir una

regla para su aprendizaje*/

( (Respuesta == s)

->

borrar,

seguir_jugando ;

write('¿cual superheroe es? '),

read(Respuesta1),

nl,

write('Dime una pregunta para '),

write(Respuesta1),

write(' que lo diferencie de '),

write(Superheroe),

write(': '),

read(Respuesta2),

nl,

nl,

asserta( (sera(Respuesta1) :- Superheroe, verificar(Respuesta2)) ) ,

borrar,

seguir_jugando).

/* Hipótesis de superheroe que se van a comprobar */

sera(batman) :- batman, !.

sera(superman) :- superman, !.

sera(mujer_maravilla) :- mujer_maravilla, !.

sera(detective_marciano) :- detective_marciano, !.

sera(aquaman) :- aquaman, !.

sera(riven) :- riven, !.

sera(flecha_verde) :- flecha_verde, !.

sera(flash) :- flash, !.

sera(cyborg) :- cyborg, !.

/* Reglas con las que identificaremos los distintos super heroes */

/*capa*/

batman :- verificar(logo_de_murcielago).

superman :- verificar(s_de_logo).

detective_marciano :- verificar(piel_verde).


/*aquaman*/

aquaman :- verificar(respira_bajo_el_agua).


/*wonder woman*/
mujer_maravilla :- verificar(es_mujer).

/*flecha verde*/

flecha_verde :- verificar(usa_flechas).

/*riven*/

riven :- verificar(su_papa_es_un_demonio).

/*flash*/
flash :- verificar(corre_rapido).

/*cyborg*/
cyborg :- verificar(es_mitad_robot).




/* diferenciar a cada super heroe */

logo_de_murcielago :- verificar(su_logo_es_un_murcielago).

s_de_logo :- verificar(su_logo_es_una_s).

es_mujer :- verificar(es_mujer).

respira_bajo_el_agua :- verificar(respira_bajo_el_agua).

esa_flechas :- verificar(dispara_flechas).

su_papa_es_un_demonio :- verificar(su_papa_es_un_demonio).

piel_verde :- verificar(piel_verde).

usa_flechas :- verificar(usa_flechas).

corre_rapido :- verificar(corre_rapido).

es_mitad_robot :- verificar(es_mitad_robot).

/* Función verificar, desde aquí llamaremos a la función que

preguntara por cada característica */

verificar(S) :-

(cumple(S)

->

true ;

(no_cumple(S)

->

fail ;

preguntar(S))).

/* Para avanzar por el árbol, se irán realizando preguntas con las

distintas características. Esto lo haremos con la función preguntar*/

preguntar(Pregunta) :-

write('¿Tiene el superheroe la siguiente característica: '),

write(Pregunta),

write('? (s/n) '),

read(Respuesta),

nl,

/*Avanzamos en función de la respuesta a la característica, hacia

una rama u otra del árbol */

/*Con assert, guardamos el camino seguido */

( (Respuesta == s)

->

assert(cumple(Pregunta)) ;

assert(no_cumple(Pregunta)), fail).

seguir_jugando :-

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

