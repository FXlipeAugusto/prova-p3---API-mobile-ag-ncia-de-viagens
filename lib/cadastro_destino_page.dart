import 'package:flutter/material.dart';

class CadastroDestinoPage extends StatefulWidget {
  final Map<String, String>? destino;
  const CadastroDestinoPage({super.key, this.destino});

  @override
  State<CadastroDestinoPage> createState() {
    return _CadastroDestinoPageState();
  }
}

class _CadastroDestinoPageState extends State<CadastroDestinoPage> {

  final destinoController = TextEditingController();
  final paisController = TextEditingController();
  final tipodepasseioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.destino != null){
      destinoController.text = widget.destino!['Destino']??'';
      paisController.text = widget.destino!['País']??'';
      tipodepasseioController.text = widget.destino!['Tipo de passeio']??'';
    }
  }

  @override
  void dispose() {
    destinoController.dispose();
    paisController.dispose();
    tipodepasseioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastrar destino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: destinoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Destino',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              controller: paisController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              controller: tipodepasseioController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Tipo de passeio',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String destino = destinoController.text;
                String pais = paisController.text;
                String tipodepasseio = tipodepasseioController.text;

                if (destino.trim().isEmpty ||
                    pais.trim().isEmpty ||
                    tipodepasseio.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Preenche tudo ae paizão'),
                    ),
                  );
                  return;
                }

                Navigator.pop(context, {
                  'Destino': destino.trim(),
                  'País': pais.trim(),
                  'Tipo de passeio': tipodepasseio.trim(),
                });
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}