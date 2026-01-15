import 'dart:io';

void main() async {
  //Crear un servidor de sockets que escuche conexiones en localhost (127.0.0.1) en el puerto 3000.
  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 3000);

  // Muestra por consola la dirección IP y el puerto donde está escuchando el servidor
  print('Servidor iniciado en ${server.address.address}:${server.port}');

  // El servidor escucha nuevas conexiones entrantes de clientes, Se ejecuta cada vez que un nuevo cliente se conecta al servidor
  server.listen((Socket cliente) {
    print("Se ha conectado a un nuevo cliente");
    cliente.write("Bienvenido desde el servidor");

    // Configura un listener para recibir datos de este cliente específico
    cliente.listen(
      (List<int> data) {
        // CONVERSIÓN: Bytes → Texto
        String mensaje = String.fromCharCodes(data);

        // IMPRESIÓN: Mostrar en consola del servidor
        print(mensaje);
      },

      // CALLBACK 1: Cuando el cliente CIERRA la conexión
      onDone: () {
        print('El cliente se ha desconectado');
      },

      // CALLBACK 2: Cuando hay un ERROR en la comunicación
      onError: (error) {
        print(error);
      },
  ); // Configura un listener para recibir datos de este cliente específico
  
});
}
//Para recibir el mensaje por terminal debemos ir a la terminal y abrir el socketserve.dart y luego el socketcli.dart y ver los mensajes de cada uno.
