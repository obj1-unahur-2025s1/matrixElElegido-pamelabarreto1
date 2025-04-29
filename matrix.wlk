object nave {
 const pasajeros = [neo,morfeo,trinity] //[neo,morfeo]
method cantidadPasajeros() = pasajeros.size() 
method pasajeroDeMayorVitalidad() = 
    pasajeros.max({pasaj => pasaj.vitalidad()}) //me dice el pasajero con mayor vitalidad
method estaEquilibrada() {
    return 
    self.pasajeroDeMayorVitalidad().vitalidad()<
     self.pasajerosMenosVitalidad().vitalidad()*2
} //es mensaje de consulta se usa para un solo mensaje, llaves se usa cuando es mas de un msj

method pasajerosMenosVitalidad() =pasajeros.min({pasaj => pasaj.vitalidad()}) 
method estaEnLaNave() = pasajeros.any({p=> p.esElElegido()})
method chocar() {
  pasajeros.forEach({p => p.saltar()}) // cuando choca, los pasajeros saltan de la nave (mensaje con efecto)
  pasajeros.clear() //limpia la lista porque se va todos d la nave
}
method acelerar() {
  self.pasajerosNoSonElegidos().forEach({p=>p.saltar()})
}
method pasajerosNoSonElegidos() = pasajeros.filter({p=>!p.esElElegido()}) //! es not
}

// c.max(unTransformer) un objeto
// Devuelve el máximo de los
// elementos transformados de
// c


object neo {
  var energia=100
    
    method esElElegido() = true
    method saltar() {energia= energia/2}
    method vitalidad() = energia * 0.1
    
}

object morfeo {
  var vitalidad=8
  var estaCansado= false
method esElElegido() = false
method saltar() {  
    vitalidad = 0.max(vitalidad - 1) //vitalidad-=1
    estaCansado = ! estaCansado
    }
    method vitalidad() = vitalidad 
}

object trinity {
method vitalidad() = 0
method esLaElegida()= false
method saltar() {} //significa que no hace nada
}
