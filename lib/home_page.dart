import 'package:flutter/material.dart';
import 'package:myapp/exerc_1.dart';

import 'exerc_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Hero(
              tag: 'title',
              child: SafeArea(
                child: Text(
                  'Aplicativo Estágio Ribeirão',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                ),
              ),
            ),
            Divider(),
            Hero(
              tag: 'List-Item-1',
              child: Card(
                child: ListTile(
                  title: Text("Exercicio 1"),
                  subtitle: Text(
                    "Dado a sequência de Fibonacci, onde se inicia por 0 e 1 e o próximo valor sempre será a soma dos 2 valores anteriores (exemplo: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...), escreva um programa na linguagem que desejar onde, informado um número, ele calcule a sequência de Fibonacci e retorne uma mensagem avisando se o número informado pertence ou não a sequência.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Exerc1(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Hero(
              tag: 'List-Item-2',
              child: Card(
                child: ListTile(
                  title: Text("Exercicio 2"),
                  subtitle: Text(
                    "Escreva um programa que verifique, em uma string, a existência da letra ‘a’, seja maiúscula ou minúscula, além de informar a quantidade de vezes em que ela ocorre.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Exerc2(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
