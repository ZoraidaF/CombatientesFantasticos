!classDefinition: #Arthas category: 'CombatientesFantasticosPaso1Zor'!
DenotativeObject subclass: #Arthas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticosPaso1Zor'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arthas class' category: 'CombatientesFantasticosPaso1Zor'!
Arthas class
	instanceVariableNames: 'enemigos danioAinfligir foco'!

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/15/2023 11:52:42'!
atacar
	| enemigoElegido |
       enemigos isEmpty ifTrue: [^self].
	
       foco = #FocoEnElMasHerido ifTrue:[ enemigoElegido := enemigos detectMin: [:enemigo | enemigo puntosDeVida] ]. 
       foco = #FocoEnElMasSano ifTrue:[		enemigoElegido := enemigos detectMax: [:enemigo | enemigo puntosDeVida] ].  
	
	self atacarA: enemigoElegido.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 16:07:10'!
atacarA: unEnemigo

	unEnemigo recibirDanio: danioAinfligir.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 15:56:38'!
danioAInfligir
	 ^danioAinfligir.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 20:56:30'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 16:00:05'!
equiparEspada
	danioAinfligir := 8! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 16:00:43'!
equiparHacha

	danioAinfligir := 10! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 22:52:44'!
focalizarEnElMasHerido
	foco := #FocoEnElMasHerido.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 23:00:54'!
focalizarEnElMasSano
	foco := #FocoEnElMasSano! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 16:00:50'!
poneDanioAInfligirEn2

	danioAinfligir := 2.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 21:11:59'!
poneEnemigosEn0
	enemigos := #().! !


!Arthas class methodsFor: '--** private fileout/in **--' stamp: 'ZoraidaF 4/17/2023 22:42:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	enemigos := #().
	danioAinfligir := 10.
	foco := #FocoEnElMasHerido.! !


!classDefinition: #CombatientesTest category: 'CombatientesFantasticosPaso1Zor'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticosPaso1Zor'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'CombatientesFantasticosPaso1Zor'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'para completar' stamp: 'ZoraidaF 4/2/2023 23:28:10'!
combatienteHumanoArthas
	^Arthas! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'ZoraidaF 4/14/2023 20:28:23'!
combatienteOrcoMankrik
	^OrcoMankrik! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'ZoraidaF 4/2/2023 23:28:37'!
combatienteOrcoOlgra
	^Olgra.! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'ZoraidaF 4/14/2023 21:10:45'!
comenzarUnNuevoCombate
	self combatienteOrcoOlgra poneTuVida20.
	self combatienteOrcoOlgra poneDanioAbsorberEn0.
	self combatienteHumanoArthas poneDanioAInfligirEn2.
	self combatienteHumanoArthas poneEnemigosEn0.
	self combatienteOrcoMankrik poneTuVida20.! !


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 05:58:49'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:50'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 3/28/2023 15:08:27'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas equiparHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 3/28/2023 15:08:35'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas equiparEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 3/28/2023 15:08:47'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas equiparEspada.
	self combatienteOrcoOlgra equiparArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 3/28/2023 15:09:04'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas equiparEspada.
	self combatienteOrcoOlgra equiparArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 3/28/2023 15:09:12'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra equiparArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 3/28/2023 15:10:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas equiparEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !


!classDefinition: #Olgra category: 'CombatientesFantasticosPaso1Zor'!
DenotativeObject subclass: #Olgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticosPaso1Zor'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Olgra class' category: 'CombatientesFantasticosPaso1Zor'!
Olgra class
	instanceVariableNames: 'puntosDeVida danioAbsorber'!

!Olgra class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 16:05:05'!
danioAbsorber
	^danioAbsorber! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 15:35:46'!
equiparArmaduraDeCuero
	danioAbsorber := 2.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 20:12:35'!
equiparArmaduraDeMetal
	danioAbsorber := 6. ! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 20:23:28'!
poneDanioAbsorberEn0
	danioAbsorber := 0.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/6/2023 17:16:55'!
poneTuVida20
	puntosDeVida := 20.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/6/2023 15:14:53'!
puntosDeVida
	^puntosDeVida! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 20:18:36'!
recibirDanio: unDanioAInfligir
	| danioADescontar |
	
	danioADescontar := (unDanioAInfligir - danioAbsorber) max:0.
	puntosDeVida := puntosDeVida - danioADescontar.! !


!Olgra class methodsFor: '--** private fileout/in **--' stamp: 'ZoraidaF 4/17/2023 22:42:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 10.
	danioAbsorber := 0.! !


!classDefinition: #OrcoMankrik category: 'CombatientesFantasticosPaso1Zor'!
DenotativeObject subclass: #OrcoMankrik
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticosPaso1Zor'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrcoMankrik class' category: 'CombatientesFantasticosPaso1Zor'!
OrcoMankrik class
	instanceVariableNames: 'puntosDeVida'!

!OrcoMankrik class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 20:44:28'!
poneTuVida20
	puntosDeVida := 20.! !

!OrcoMankrik class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 20:46:12'!
puntosDeVida
	^puntosDeVida! !

!OrcoMankrik class methodsFor: 'as yet unclassified' stamp: 'ZoraidaF 4/14/2023 22:59:02'!
recibirDanio: danioAInfligir

	puntosDeVida := puntosDeVida - danioAInfligir! !


!OrcoMankrik class methodsFor: '--** private fileout/in **--' stamp: 'ZoraidaF 4/17/2023 22:42:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 20.! !

Arthas initializeAfterFileIn!
Olgra initializeAfterFileIn!
OrcoMankrik initializeAfterFileIn!