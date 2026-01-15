import 'dart:convert';
import 'dart:io';

void main() async {
  // Crea un socket y establece conexión con el servidor en localhost:3000
  final socket = await Socket.connect('127.0.0.1', 3000);

  // Envía un mensaje de texto al servidor a través del socket
  socket.write("Mensaje desde el cliente");

  // Configura un listener para recibir datos entrantes a través del socket y manda el mensaje
socket.listen(
  (List<int> data) {
    // CONVERSIÓN: Bytes del socket → Texto legible
    String mensaje = String.fromCharCodes(data);
    
    // SALIDA: Muestra el mensaje en la consola local (del CLIENTE)
    print(mensaje);
  },
  
  // CALLBACK cuando el SERVIDOR cierra la conexión
  onDone: () {
    print('El servidor se ha desconectado');
  },
  
  // CALLBACK cuando hay errores en la comunicación
  onError: (error) {
    // Muestra el error en la consola del cliente
    print(error);
  }
);

stdin
    // Aplica un transformador que convierte bytes a texto UTF-8
    .transform(utf8.decoder) // Convierte bytes a String
    
    // Configura un listener para procesar cada texto recibido
    .listen((String texto) {
        // Envía el texto al socket (conexión de red)
        socket.write(texto); // Dart convierte automáticamente
    });
}
