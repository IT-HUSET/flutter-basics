import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: CounterPage(title: 'CounterApp'),
    );
  }
}

class CounterPage extends StatefulWidget {
  CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int _counter;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    if (_counter == 1) {
      _showToast();
    }
  }

  void _showToast() {
    final snackBar = SnackBar(backgroundColor: Colors.purple, content: Text('Incremented! 🚀'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.red],
          ),
          border: Border.all(
            color: Colors.black38,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Offstage(child: Text('🚀')), // Preload icon
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 44),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
