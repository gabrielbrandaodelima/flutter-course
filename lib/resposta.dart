import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final Function() onPressed;

  Resposta(this.texto, this.onPressed);

  // Resposta(this.texto, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: ElevatedButton (
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.blue
          ),
          child: Text(texto,
          style: TextStyle(
            color: Colors.white
          ),)),
    );
  }
}
