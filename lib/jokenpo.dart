import 'dart:math';

import 'package:flutter/material.dart';

class JokempoHome extends StatefulWidget {
  const JokempoHome({super.key});
  @override
  State<JokempoHome> createState() => _JokempoHomeState();
}

class _JokempoHomeState extends State<JokempoHome> {
  var _imgApp = Image.asset(
    'images/padrao.png',
    height: 100,
  );
  String _mensagem = 'Escolha uma opção';
  int numVitorias = 0;
  int numDerrotas = 0;
  int numEmpates = 0;

  void _joga(String opcaoJogador) {
    final lista_opcoes = ['pedra', 'papel', 'tesoura'];
    final opcaoApp = lista_opcoes[Random().nextInt(3)];

    setState(() {
      _imgApp = Image.asset(
        'images/$opcaoApp.png',
        height: 100,
      );
      _mensagem = _resultado(opcaoJogador, opcaoApp);
    });
  }

  String _resultado(String opcaoJogador, String opcaoApp) {
    final mensagem;

    if ((opcaoJogador == 'pedra' && opcaoApp == 'tesoura') ||
        (opcaoJogador == 'pedra' && opcaoApp == 'tesoura') ||
        (opcaoJogador == 'pedra' && opcaoApp == 'tesoura')) {
      mensagem = 'Voce ganhou';
    } else if ((opcaoJogador == opcaoApp)) {
      mensagem = 'Empatamos';
    } else {
      mensagem = 'Voce perdeu';
    }

    return mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokempo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textJokempo(_mensagem),
          const SizedBox(
            height: 20,
          ),
          _imgApp,
          const SizedBox(
            height: 30,
          ),
          textJokempo('Empatamos'),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              choiceDetector('pedra'),
              choiceDetector('papel'),
              choiceDetector('tesoura'),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numVitorias = 0;
            numDerrotas = 0;
            numDerrotas = 0;
          });
        },
        child: const Icon(Icons.settings_backup_restore_sharp),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  GestureDetector choiceDetector(String escolha) {
    return GestureDetector(
      onTap: () => _joga(escolha),
      child: Image.asset(
        'images/$escolha.png',
        height: 100,
      ),
    );
  }

  Text textJokempo(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
