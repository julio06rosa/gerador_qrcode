import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:gerador_qrcode/main.dart';

void main() {
  testWidgets('Gera QR Code ao informar um texto', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    // Inicialmente não deve existir QR Code.
    expect(find.byType(QrImageView), findsNothing);

    // Digita um endereço no campo.
    await tester.enterText(find.byType(TextField), 'https://www.google.com');

    // Pressiona o botão.
    await tester.tap(find.text('Gerar QR Code'));
    await tester.pump();

    // Verifica se o QR Code apareceu.
    expect(find.byType(QrImageView), findsOneWidget);
  });
}
