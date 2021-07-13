import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';
import './questao.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;
  final _questions = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 2},
        {'texto': 'Vermelho', 'nota': 1},
        {'texto': 'Verde', 'nota': 4},
        {'texto': 'Branco', 'nota': 5},
      ]
    },
    {
      'texto': 'Qual seu animal favorito ?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 22},
        {'texto': 'Cobra', 'nota': 3},
        {'texto': 'Elefante', 'nota': 42},
        {'texto': 'Leão', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual seu esporte favorito ?',
      'respostas': [
        {'texto': 'Tenis', 'nota': 21},
        {'texto': 'Basquete', 'nota': 11},
        {'texto': 'Voley', 'nota': 14},
        {'texto': 'Futebol', 'nota': 15},
      ]
    },
  ];

  void _answer(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }


  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _questions,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _answer,
              )
            : Resultado(_notaTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
