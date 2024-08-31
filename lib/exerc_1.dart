import 'package:flutter/material.dart';

import 'home_page.dart';

class Exerc1 extends StatefulWidget {
  const Exerc1({super.key});

  @override
  State<Exerc1> createState() => _Exerc1State();
}

bool verificarNumero(int num) {
  int actualFibonacci = 0;
  int nextFibonacci = 1;
  while (num > actualFibonacci) {
    int temp = actualFibonacci;
    actualFibonacci = nextFibonacci;
    nextFibonacci = temp + nextFibonacci;
  }
  if (num == actualFibonacci) {
    return true;
  }
  return false;
}

class _Exerc1State extends State<Exerc1> {
  TextEditingController num_value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.only(top: 25),
                    alignment: Alignment.center,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.red,
                    ),
                  ),
                  Hero(
                    tag: 'title',
                    child: SafeArea(
                      child: Text(
                        'Aplicativo Estágio Ribeirão',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                      ),
                    ),
                  ),
                ],
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
                      maxLines: 10,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .05),
                child: Text(
                  "Aplicação:",
                  textScaler: TextScaler.linear(1.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .05),
                child: SizedBox(
                  width: width * .8,
                  child: TextField(
                    controller: num_value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite um número',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .05),
                child: ElevatedButton(
                  onPressed: () {
                    if (num_value.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Digite um número válido!"),
                        ),
                      );
                    } else {
                      bool result = verificarNumero(int.parse(num_value.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result
                              ? 'Número pertence a sequência'
                              : 'Número não pertence a sequência'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(),
                  ),
                  child: Text("Verificar número"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
