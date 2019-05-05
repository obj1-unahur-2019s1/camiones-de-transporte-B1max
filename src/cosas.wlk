object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}
object paqueteDeLadrillos{
	var property cantidad = 1
	method peso() { return 2000 * cantidad}
	method nivelPeligrosidad(){return 2}
}
object arenaAGranel{
	method peso() { return 20 }
	method nivelPeligrosidad(){return 1}
}
object bateriaAntiaerea{
	var misiles = true
	method peso() { return 300 }
	method nivelPeligrosidad(){if (misiles){return 100}else{return 0}}
}
object contenedorPortuario{
	var property cosas=[]
	method peso() { return 100 + cosas.sum({c=>c.peso()}) }
	method nivelPeligrosidad(){
		if(cosas.size()>0){
			return 0
		}else{
			return cosas.max({c=>c.peligrosidad()})
		}
	}
}

object residuosRadioactivos{
	var property peso = 0
	method peso(){return peso}
	method nivelPeligrosidad(){return 200}
}
object embalajeDeSeguridad{
	var property cosa
	method peso(){return cosa.peso()}
	method nivelPeligrosidad(){return cosa.nivelPeligrosidad()/2}
}
