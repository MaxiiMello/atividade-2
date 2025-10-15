import 'package:flutter/material.dart';
import 'package:atividade2/widgetDados.dart';
import 'package:atividade2/clases.dart';

class Paginaprincipal extends StatefulWidget {
  const Paginaprincipal({super.key});

  @override
  State<Paginaprincipal> createState() => _telaprincipalState();
}

class _telaprincipalState extends State<Paginaprincipal>
    with SingleTickerProviderStateMixin {
  final dados = Dados();

  final distanciaController = TextEditingController();
  final precoController = TextEditingController();
  final consumoController = TextEditingController();
  final velocidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
      appBar: AppBar(
        title: const Text(
          "Custo e Tempo de Viagem Objetivo",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      body: Container(
        child: Column(
          children: [
            Widgetdados(
              controller: distanciaController,
              label: "Distancia:",
              hint: "Distância (km)",
              icon: Icons.map,
            ),
            const SizedBox(height: 12),

            Widgetdados(
              controller: precoController,
              label: "Preço:",
              hint: "Preço do combustivel (R/L)",
              icon: Icons.monetization_on,
            ),

            Widgetdados(
              controller: consumoController,
              label: "Consumo:",
              hint: "Consumo do veículo (km/L)",
              icon: Icons.local_gas_station,
            ),

            Widgetdados(
              controller: velocidadeController,
              label: "Velocidade:",
              hint: "Velocidade média (km/h)",
              icon: Icons.speed,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                double distancia =
                    double.tryParse(distanciaController.text) ?? 0.0;
                double preco = double.tryParse(precoController.text) ?? 0.0;
                double consumo = double.tryParse(consumoController.text) ?? 0.0;
                double velocidade =
                    double.tryParse(velocidadeController.text) ?? 0.0;

                if (distancia < 0 ||
                    preco < 0 ||
                    consumo <= 0 ||
                    velocidade <= 0) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Erro'),
                      content: const Text(
                        'Por favor, insira valores positivos.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  return;
                }

                setState(() {
                  dados.distancia = distancia;
                  dados.preco = preco;
                  dados.consumo = consumo;
                  dados.velocidade = velocidade;

                });

                print('Distancia: $distancia, Preco: $preco, Consumo: $consumo, Velocidade: $velocidade');
print('Custo: ${dados.custo}, Tempo: ${dados.tempo_horas}');

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Resultados'),
                    content: Text(
                      'Custo: R\$ ${dados.custo.toStringAsFixed(2)}\n'
                      'Tempo: ${dados.tempo_horas.toStringAsFixed(2)} horas',
                    ),
                  ),
                );
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
