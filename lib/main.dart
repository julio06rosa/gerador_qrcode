import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerador de QR Code',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const GeradorQrPage(),
    );
  }
}

class GeradorQrPage extends StatefulWidget {
  const GeradorQrPage({super.key});

  @override
  State<GeradorQrPage> createState() {
    return _GeradorQrPageState();
  }
}

class _GeradorQrPageState extends State<GeradorQrPage> {
  final TextEditingController controlador = TextEditingController();

  String textoQr = '';

  void gerarQrCode() {
    setState(() {
      textoQr = controlador.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de QR Code'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Digite um texto ou link',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: controlador,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex: https://www.google.com',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: gerarQrCode,
              child: const Text('Gerar QR Code'),
            ),

            const SizedBox(height: 30),

            if (textoQr.isNotEmpty)
              QrImageView(data: textoQr, version: QrVersions.auto, size: 220),
          ],
        ),
      ),
    );
  }
}
