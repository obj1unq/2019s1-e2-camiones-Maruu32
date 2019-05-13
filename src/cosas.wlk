object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() { return 2 }
}

object paqueteDeLadrillos {
	var property cantLadrillos = 0
	
	method agregarLadrillos(cant) { cantLadrillos += cant }
	method sacarLadirillos(cant) { cantLadrillos -= cant }
	method peso() { return cantLadrillos * 5 }
	method nivelPeligrosidad() { return 2 }
	method bultos(){
		if (cantLadrillos <= 100){ return 1 }
		else if ((cantLadrillos > 100 && cantLadrillos < 300)){ return 2 }
		else{ return 3 }
	}
}

object arenaAGranel {
	var property peso =  0 
	
	method agregarPeso (kilogramo) { peso += kilogramo }
	method sacarPeso (kilogramo) { peso -= kilogramo }
	method nivelPeligrosidad() { return 1 }
	method bultos(){ return 1 } 
}

object bateriaAntiaerea {
	var estaConMisiles = false
	
	method peso (){
		if (estaConMisiles) { return 300 } else { return 200 } }
	
	method nivelPeligrosidad(){
		if (estaConMisiles) { return 100 } else { return 0 } }
	
	method tieneMisiles(){ estaConMisiles = not estaConMisiles }

	method bultos(){
		if (estaConMisiles) { return 2 } else { return 1 }
	}
}

object contenedorPortuario {
	const property contenido = []
	
	method cargar (cosa) { contenido.add(cosa) }
	method sacar (cosa) { contenido.remove(cosa) }
	method peso() { return 100 + contenido.sum { cosa => cosa.peso() } } 
 	method nivelPeligrosidad() { 
 		if (contenido.isEmpty()) { return 0 } 
 			else { return contenido.max({ cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() }
 	} 
 	method bultos(){ return 1 + self.bultosCosas() }
 	method bultosCosas(){ return contenido.sum{ cosa => cosa.bultos() }  }

}

object residuosRadioactivos {
	var property peso = 0 
	
	method agregarPeso (kilogramo) { peso += kilogramo }
	method sacarPeso (kilogramo) { peso -= kilogramo }
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	method bultos() { return 1 }
	
}

object embalajeDeSeguridad {
	var peso = null 
	var peligrosidad = null 
	
	method embalar(cosa){
		peso = cosa.peso()
		peligrosidad = cosa.nivelPeligrosidad() / 2
	}
	
	method peso () { return peso }
	
	method nivelPeligrosidad() { return peligrosidad }
	
	method bultos() { return 2 }
}




























