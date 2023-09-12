import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  bool scanning = false;
  String scannedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Scanned Data: $scannedData',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: scanning ? null : () => _startScanning(),
                child: Text(scanning ? 'Scanning...' : 'Start Scanning'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        String? scannedData = scanData.code;
        // Process the scanned data and update the app accordingly
        // For example, navigate to the next clue or perform an action
      });
    });
  }

  void _startScanning() {
    setState(() {
      scanning = true;
    });
    controller.resumeCamera();
  }
}
