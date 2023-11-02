import 'package:flutter/material.dart';

void main() => runApp(TipCalculatorApp());

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TipCalculatorHomePage(),
    );
  }
}

class TipCalculatorHomePage extends StatefulWidget {
  @override
  _TipCalculatorHomePageState createState() => _TipCalculatorHomePageState();
}

class _TipCalculatorHomePageState extends State<TipCalculatorHomePage> {
  double _billAmount = 0.0;
  bool _greatService = false;
  double _tipAmount = 0.0;

  void _calculateTip() {
    setState(() {
      if (_greatService) {
        _tipAmount = _billAmount * 0.15; // 15% tip for great service
      } else {
        _tipAmount = _billAmount * 0.10; // 10% tip otherwise
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Bill Amount',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _billAmount = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text('Great Service?'),
                Switch(
                  value: _greatService,
                  onChanged: (value) {
                    setState(() {
                      _greatService = value;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _calculateTip,
              child: Text('Calculate Tip'),
            ),
            SizedBox(height: 20.0),
            Text('Total Tip: $_tipAmount'),
          ],
        ),
      ),
    );
  }
}
