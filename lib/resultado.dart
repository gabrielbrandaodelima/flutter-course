import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  Resultado(this.pontuacao, this.onReset);

  final int pontuacao;
  final void Function() onReset;

  String get fraseResultado{
    if(pontuacao < 8) {
      return 'Parabens';
    }
    else
      if (pontuacao <12 ) {
        return 'Vc eh top';
      }
      else if(pontuacao < 26) {
        return 'Impressionante';
      }else{
        return 'Jedi';
      }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style:
                TextStyle(fontSize: 29, decorationStyle: TextDecorationStyle.solid),
          ),
        ),
        TextButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 20),

          ),
          onPressed: onReset,
        )
      ],
    );
  }
}
