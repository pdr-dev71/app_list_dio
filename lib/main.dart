import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "farofa",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  void initState() {
    super.initState();
    contatos.add(Contato(
        nome: "Joao", telefone: "9991-92922", tipo: ContatoType.CELULAR));

    contatos.add(Contato(
        nome: "Carlos", telefone: "8998191-9191", tipo: ContatoType.FAVORITO));

    contatos.add(Contato(
        nome: "Cesar", telefone: "8998888-8888", tipo: ContatoType.CELULAR));

    contatos.add(Contato(
        nome: "Lucas", telefone: "3343-9999", tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: "Marcos", telefone: "3443-6767", tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: "Felipe", telefone: "7676-8989", tipo: ContatoType.TRABALHO));

    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemBuilder: (context, index) {
        var contato = contatos[index];
        return ListTile(
            leading: CircleAvatar(
              child: ContatoHelper.getIconByContatoType(contato.tipo),
              backgroundColor: Colors.blue[200],
            ),
            title: Text(contato.nome),
            subtitle: Text(contato.telefone),
            trailing: IconButton(
              icon: Icon(Icons.call),
              onPressed: () => {},
            ));
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: contatos.length,
    ));
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
