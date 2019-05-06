import cosas.*

object camion {
	const property cosas = [contenedorPortuario]
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
		var bulto1 = #{knightRider,arenaAGranel,residuosRadioactivos}
		var bulto2 = #{bumblebee,embalajeDeSeguridad}
		if (cosas.asSet().difference(cosas.asSet().difference(bulto1))==bulto1){bultos += 1}
		if (cosas.asSet().difference(cosas.asSet().difference(bulto2))==bulto2){bultos += 2}
		if (cosas.contains(paqueteDeLadrillos)){
			if(paqueteDeLadrillos.cantidad()<=100){bultos += 1}
			if(paqueteDeLadrillos.cantidad()>100 and paqueteDeLadrillos.cantidad()<=300){bultos += 2}
			if(paqueteDeLadrillos.cantidad()>301){bultos += 3}
		}
		if (cosas.contains(bateriaAntiaerea)){
			if (bateriaAntiaerea.misiles()){bultos+=2}else{bultos+=1}
		}
		if (cosas.contains(contenedorPortuario)){bultos+= 1 + contenedorPortuario.cosas().size()}
		return bultos
	}
	method pesos(){return cosas.map({c=>c.peso()})}
}
