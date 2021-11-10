// 1-Plantas
import parcelas.*

class Planta {

	var property altura = 0.5
	var property anoDeObtencion

	method esFuerte() = self.horasDeSolToleradas() > 10
	method daSemillasNuevas() = self.esFuerte()
	method espacio()
	method horasDeSolToleradas()
	
	//4-ideales
	method esParcelaIdeal(parcela)
	
	// 5- asociación
	method seAsociaBienCon(parcela) = if(parcela.tipo() == parcelaEco){ 
		!parcela.tieneComplicaciones() and self.esParcelaIdeal(parcela)
	}
	else {
		parcela.cantidadMaximaDePlantas() == 2 and self.esFuerte()
	}

}

class Menta inherits Planta {

	override method horasDeSolToleradas() = 6
	override method daSemillasNuevas() = super() || altura > 0.4
	override method espacio() = altura * 3
	
	//4-ideales
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {

	override method horasDeSolToleradas() = if (altura > 1) {9} else if (altura.between(0.5, 1)) {7} else {6}
	
	override method daSemillasNuevas() = super() || (anoDeObtencion > 2007 && altura > 1)
	
	override method espacio() = altura / 2

	override method esParcelaIdeal(parcela) = parcela.horasDeSolRecibidas() == self.horasDeSolToleradas()
}

class Quinoa inherits Planta {

	var property horasToleradas
	override method daSemillasNuevas() = super() || anoDeObtencion < 2005
	override method espacio() = altura
	override method horasDeSolToleradas() = horasToleradas
	
	//4-ideales
	override method esParcelaIdeal(parcela) = !parcela.plantas().any({p => p.altura() > self.altura()})

}

//2-Variedades
class SojaTransgenica inherits Soja {
	override method daSemillasNuevas() = false
}

class HierbaBuena inherits Menta {
	override method espacio() = super() * 2
	
	//4-ideales
	override method esParcelaIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1
}

