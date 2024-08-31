import 'package:flutter/material.dart';

import 'home_page.dart';

class Exerc2 extends StatefulWidget {
  const Exerc2({super.key});

  @override
  State<Exerc2> createState() => _Exerc2State();
}

int verificarString(String text) {
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    if (text[i].toLowerCase() == 'a') {
      count++;
    }
  }
  return count;
}

class _Exerc2State extends State<Exerc2> {
  TextEditingController string_value = TextEditingController();
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
                tag: 'List-Item-2',
                child: Card(
                  child: ListTile(
                    title: Text("Exercicio 2"),
                    subtitle: Text(
                      "Escreva um programa que verifique, em uma string, a existência da letra ‘a’, seja maiúscula ou minúscula, além de informar a quantidade de vezes em que ela ocorre.",
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
                    controller: string_value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite um texto',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .05),
                child: ElevatedButton(
                  onPressed: () {
                    if (string_value.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Digite um texto válido!"),
                        ),
                      );
                    } else {
                      int result = verificarString(string_value.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "A quantidade de 'a' na palavra ${string_value.text} é : $result"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(),
                  ),
                  child: Text("Verificar texto"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
