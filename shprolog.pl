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
