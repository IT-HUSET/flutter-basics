import 'package:flutter/material.dart';

void main() {
  runApp(const ABetterCounterApp());
}

/// Out fabolous and improved version of the standard Counter App!
class ABetterCounterApp extends StatelessWidget {
  const ABetterCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrapping everytiung in a CounterProvider, for easy access to the Counter from anywhere.
    return CounterProvider(
      counter: Counter(),
      child: MaterialApp(
        title: 'CounterApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        home: CounterPage(title: 'CounterApp'),
      ),
    );
  }
}

/// InheritedWidget class that provides the [Counter] to its descendants, and rebuilds them when the [Counter] changes.
class CounterProvider extends InheritedNotifier {
  const CounterProvider({
    Key? key,
    required this.counter,
    required Widget child,
  }) : super(key: key, notifier: counter, child: child);

  final Counter counter;

  @override
  bool updateShouldNotify(CounterProvider oldWidget) => counter != oldWidget.counter;
}

/// A simple [ChangeNotifier] that keeps track of a counter value, and notifies its listeners when it changes.
class Counter extends ChangeNotifier {
  static Counter of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!.counter;
  }

  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

/// Basically the same CounterPage as in the standard Counter App, but with a few improvements:
class CounterPage extends StatefulWidget {
  CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  void _incrementCounter() {
    final counter = Counter.of(context);
    counter.increment();
    if (counter.value == 10) {
      _showToast();
    }
  }

  void _showToast() {
    final snackBar = SnackBar(backgroundColor: Colors.purple, content: Text('Counter incremented! 🚀🤯'));
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
        child: CounterWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Counter.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('You have pushed the button this many times:', style: Theme.of(context).textTheme.headlineSmall),
        Text(
          '${counter.value}',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
