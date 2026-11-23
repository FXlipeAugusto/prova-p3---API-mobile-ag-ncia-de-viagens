import 'package:flutter/material.dart';
import 'cadastro_destino_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final List<Map<String, String>> destinos = [
  {'Destino': 'Nova Déli', 'País': 'India', 'Tipo de passeio': 'Tour gastronômico'},
  {'Destino': 'Xique-Xique', 'País': 'Brasil', 'Tipo de passeio': 'City Tour'},
  {'Destino': 'Chernobyl', 'País': 'Ucrania', 'Tipo de passeio': 'Tour pela usina'},
  {'Destino': 'Titanic', 'País': 'New Foundland - Canadá', 'Tipo de passeio': 'Passeio de submarino'},
];

class DestinoPage extends StatefulWidget {
  const DestinoPage({super.key});

  @override
  State<DestinoPage> createState() => _DestinoPageState();
}

class _DestinoPageState extends State<DestinoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Destino'),
      ),
      body: ListView.builder(
        itemCount: destinos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              final destinoEditado = await Navigator.push<Map<String, String>>(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroDestinoPage(
                    destino: destinos[index],
                  ),
                ),
              );

              if (destinoEditado != null) {
                setState(() {
                  destinos[index] = destinoEditado; // substitui, não adiciona
                });
              }
            },
            leading: const Icon(Icons.person),
            title: Text(destinos[index]['Destino']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(destinos[index]['País']!),
                Text(destinos[index]['Tipo de passeio']!),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.orange),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Excluir destino? :/'),
                    content: Text(destinos[index]['Destino']!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            destinos.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Excluir'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novoDestino = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => const CadastroDestinoPage(),
            ),
          );

          if (novoDestino != null) {
            setState(() {
              destinos.add(novoDestino); // só o botão + adiciona
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void mainAntigo() {
  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Agencia'),
        ),
        body: ListView.builder(
          itemCount: destinos.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                final destinoEditado = await Navigator.push<Map<String, String>>(
                  navigatorKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => CadastroDestinoPage(
                      destino: destinos[index],
                    ),
                  ),
                );

                if (destinoEditado != null) {
                  destinos[index] = destinoEditado;
                }
              },
              leading: const Icon(Icons.person),
              title: Text(destinos[index]['Destino']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(destinos[index]['País']!),
                  Text(destinos[index]['Tipo de passeio']!),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.blue),
                onPressed: () {
                  destinos.removeAt(index);
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final novoDestino = await Navigator.push<Map<String, String>>(
              navigatorKey.currentContext!,
              MaterialPageRoute(
                builder: (context) => const CadastroDestinoPage(),
              ),
            );
            debugPrint('Destino recebido: $novoDestino');
            if (novoDestino != null) {
              destinos.add(novoDestino);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    ),
  );
}

void main() {
  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const DestinoPage(),
    ),
  );
}