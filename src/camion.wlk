import cosas.*

object camion {
	const property cosas = []
	var pesoMaximo = 2500
	
	method cargar(cosa) {
		cosas.add(cosa)
	}
	
	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method pesoTotal(){
		return 1000 + cosas.sum{cosa => cosa.peso()}
	}
	
	method excedidoDePeso(){
		return self.pesoTotal() > pesoMaximo 
	}
	
	method objetosPeligrosos(nivel){
		return cosas.filter{cosa => cosa.nivelPeligrosidad() > nivel}
	}
	
	method objetosMasPeligrososQue(unaCosa){
		return cosas.filter{cosa => cosa.nivelPelogrisidad() > unaCosa.nivelPelogrisidad()}
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all{cosa => cosa.nivelPelogrisidad() <= nivelMaximoPeligrosidad}
	}
	
	
	method tieneAlgoQuePesaEntre(min, max){
		return (cosas.any { cosa => cosa.peso().between(min, max) } )
	}
	
	
	method cosaMasPesada() {
		return (cosas.max { cosa => cosa.peso() } )
	}
	
	method totalBultos() {
		return (cosas.sum { cosa => cosa.bultos() } )
	}
	
	method pesos() {
		return (cosas.map { cosa => cosa.peso() } )
	}
	
}	


