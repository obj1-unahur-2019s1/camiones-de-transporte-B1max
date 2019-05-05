import cosas.*

object camion {
	const property cosas = []
	const property tara =1000
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method  descargar(cosa) {
		cosas.remove(cosa)
	}
	method  pesoTotal() {return tara + cosas.sum({p=> p.peso()})}
	method  excedidoDePeso(){ return self.pesoTotal() > 2500}
	method  objetosPeligrosos(nivel) {cosas.filter({c=>c.peligrosidad()>nivel})}
	method  objetosMasPeligrososQue(cosa) {return cosas.filter({c=>c.peligrosidad()>cosa.peligrosidad()})}
	method  puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return cosas.count({c=>c.peligrosidad()> nivelMaximoPeligrosidad })==0
	}
	method  tieneAlgoQuePesaEntre(min, max) {
		return cosas.count({c=>c.peso()>min and c.peso()<max})>0
	}
	method  cosaMasPesada() {cosas.max({c=>c.peso()})}
	method  totalBultos(){
		var bultos = 0
		if (cosas.any(knightRider) and cosas.any(arenaAGranel)and cosas.any(residuosRadioactivos)){bultos+=1}
		if (cosas.any(bumblebee)and cosas.any(embalajeDeSeguridad)){bultos+=2}
		return bultos
	}
}
