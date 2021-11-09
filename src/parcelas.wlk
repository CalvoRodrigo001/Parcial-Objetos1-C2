import plantas.*

//3-Parcelas
class Parcela {

	var property ancho
	var property largo
	var property horasDeSolRecibidas
	const plantas = []

   //5 - asociacion
	var property tipo

	method superficie() = ancho * largo

	method cantidadMaximaDePlantas() = if (ancho > largo) {self.superficie() / 5} else {self.superficie() / 3 + largo}

	method tieneComplicaciones() = plantas.any({ p => p.horasDeSolToleradas() < horasDeSolRecibidas })

	method seSuperaCantidadMaxima() = plantas.size() + 1 > self.cantidadMaximaDePlantas()

	method hsRecibidasSuperanLasToleradasPorDos(planta) = horasDeSolRecibidas > planta.horasDeSolToleradas() and (horasDeSolRecibidas - planta.horasDeSolToleradas()) >= 2

	method plantar(planta) {
		if (self.seSuperaCantidadMaxima() || self.hsRecibidasSuperanLasToleradasPorDos(planta)) {self.error("Esta planta no puede ser plantada aqui")} else {plantas.add(planta)}
	}
	
    /*method laParcelaEsDeTipo(nuevoTipo){ tipo = nuevoTipo}
	  method tipoDeParcela() = tipo */
	
	
}


// 5- asociación 

object parcelaEco{}

object parcelaIndustrial{}

// 6-INTA
object inta{
	
	var parcelas = []
	
	method promedioDePlantas() = parcelas.sum({p=>p.plantas().size()}) / parcelas.size()
	
	method parcelaMasAutoSustentable() = self.parcelasConMasDe(4).parcelaConMasAsociadas()
	
	method parcelasConMasDe(numero) = parcelas.filter({p => p.plantas().size() > numero })
	
	method parcelaConMasAsociadas() = true

}

