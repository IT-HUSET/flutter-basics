// ignore_for_file: unused_local_variable, avoid_function_literals_in_foreach_calls

void main() {
  //variables();
  strings();
}


/// -------------------------------------------------
/// --- Variables -----------------------------------
/// -------------------------------------------------
///
/// See more:
/// * https://dart.dev/guides/language/language-tour#variables

void variables() {
  /// Mutable variable, type inferred
  var a = 42;
  a = 4711;
  print('a: $a');

  /// Mutable variable with explicit type
  String b = '42';
  print('b: $b');

  /// Immutable "variable" with inferred type
  final c = DateTime.now();
  //c = DateTime.parse('2021-06-08'); // Error - can only be set once
  print('c: $c');

  /// Compile time constant, with explicit type
  const int d = 42;
  //d = 4711; // Error - constant variables can't be assigned a value

  print('d: $d');
}


/// -------------------------------------------------
/// --- Strings -------------------------------------
/// -------------------------------------------------
///
/// See also:
/// * https://dart.dev/codelabs/dart-cheatsheet#string-interpolation
/// * https://dart.dev/guides/language/language-tour#strings

void strings() {
  /// String literals
  final string1 = 'Preferred'; // Preferred according to standard Dart linting rules
  final string2 = "Also valid"; // Frowned upon

  /// Expressions in strings
  int theAnswer = 42;
  // Expressions (i.e. more than a simple variable) must be surrounded by
  // { and }
  print('The answer is $theAnswer, is that odd: ${theAnswer.isOdd}?');

  /// Concatenation (not recommended)
  // ignore: prefer_interpolation_to_compose_strings
  final concatenatedString = 'The answer is ' + theAnswer.toString();
  print('ConcatenatedString: $concatenatedString');

  /// Multiline
  final multiLine = '''
  Lorem ipsum
  Bacon ipsum
  Pirate ipsum
  ''';
  print('MultiLine: $multiLine');

  /// Raw string
  final raw = r'Lorem ipsum\nBacon ipsum\nPirate ipsum';
  print('Raw: $raw');
}


/// -------------------------------------------------
/// --- Control flow --------------------------------
/// -------------------------------------------------
///
/// See also:
/// * https://dart.dev/guides/language/language-tour#control-flow-statements

void controlFlow() {
  final args = ['a', 'b', 'c', 'd', 'e'];
  assert(args.isNotEmpty); // Throws error in debug mode

  if (args.length < 4) {
    // Expression must be of type bool (unlike JS for instance)
    switch (args.length) {
      case 1:
        print('One little piggy');
        break;
      case 2:
        print('Hello number two');
        break;
      case 3:
        print('Three is the magig number...'); // Fall through
      default:
        print('Default');
    }
  } else {
    for (var arg in args) {
      print(arg);
    }
    for (var i = 0; i < 10; i++) {
      print('☀️');
    }
  }
}


/// -------------------------------------------------
/// --- Operators -----------------------------------
/// -------------------------------------------------
///
/// See also:
/// * https://dart.dev/guides/language/language-tour#operators

class SomeBuilder {
  var someField = '';
  void configureStuff() {/**/}
}

void operators() {
  /** The usual suspects, and some more interesting stuff: **/

  /// Null coalescing
  String? oprionalString;
  var result = oprionalString ?? 'Default';

  /// Spead operator
  final list = ['Austin', 'Dr Evil'];
  var more = [...list, 'Number Two'];

  /// Builder / cascade operator
  final builder = SomeBuilder()
    ..configureStuff()
    ..someField = 'stuff';
}


/// -------------------------------------------------
/// *** Functions ***
/// -------------------------------------------------
///
/// See also:
/// * https://dart.dev/guides/language/language-tour#functions
/// * https://dart.dev/codelabs/dart-cheatsheet#optional-positional-parameters
/// * https://dart.dev/codelabs/dart-cheatsheet#named-parameters

void plainOldFunction() {/* body */}

/// Arrow function
void arrowFunc() => 'The result';

/// Anonymous function / lambda / closure
var lambda1 = (int arg) => 'The answer is: $arg';
var lambda2 = (int arg) {
  return 'The answer is: $arg';
};

/// Function with positional arguments
void functionWithArgs1(String arg1, bool arg2) {/* body */}

/// Function with optional positional arguments
void functionWithArgs2(String arg1, [bool? arg2]) {/* body */}

/// Function with positional and named arguments
void functionWithArgs3(String arg1, {bool? arg2}) {/* body */}

/// Function with named arguments and default values
void functionWithDefaultValues({String arg1 = '', bool arg2 = false}) {/* body */}

void functions() {
  functionWithArgs1('', false);

  functionWithArgs2('');

  functionWithArgs3('', arg2: true);

  functionWithDefaultValues(arg1: 'Hello', arg2: true);
}


/// -------------------------------------------------
/// --- Collections ---------------------------------
/// -------------------------------------------------
///
/// See also:
/// * https://dart.dev/guides/language/language-tour#lists
/// * https://dart.dev/guides/language/language-tour#maps
/// * https://dart.dev/guides/language/language-tour#sets
/// * https://dart.dev/guides/language/language-tour#using-collection-literals
/// * https://dart.dev/guides/language/language-tour#generic-collections-and-the-types-they-contain

void collections() {
  /// List declaration
  List<String> list;

  /// List literal
  list = ['Hello', 'World'];

  /// Some list functions
  list.add('!!!');
  list.first;
  list.indexOf('Hello');
  list.join(' ');

  /// Map declaration
  Map<String, int> map;

  /// Map literal
  map = {'The answer': 42};

  /// Some map functions
  map['The answer'];
  map['The answer'] = 4711;
  map.containsKey('key');
  map.keys.first;

  /// Set declaration
  Set<String> set;

  /// Set literal
  set = {'Hello', 'World'};

  /// Some set functions
  set.add('!!!');
  set.contains('Hello');
  set.first;
}

void listHigherOrderFunctions(List<String> list) {
  /// Find an element/// Often called 'find' in other languages
  list.firstWhere((element) => element == 'Hello');

  /// Iterate over elements
  list.forEach((element) => print(element));

  /// Created a new filtered list/// Often called 'filter' in other languages
  list.where((element) => false);

  /// Created a new list with transformed elements
  list.map((element) => element.toUpperCase());
}


/// -------------------------------------------------
/// --- Classes and constructors --------------------
/// -------------------------------------------------
/// 
/// See also:
/// * https://dart.dev/guides/language/language-tour#classes
/// * https://dart.dev/codelabs/dart-cheatsheet#named-constructors
/// * https://dart.dev/codelabs/dart-cheatsheet#factory-constructors
/// * https://dart.dev/codelabs/dart-cheatsheet#redirecting-constructors
/// * https://dart.dev/codelabs/dart-cheatsheet#const-constructors

class FictionalCharacter {
  final String name;

  /// Constructor, directly assigning field
  FictionalCharacter(this.name);
}

/// Create a new instance of FictionalCharacter
final austin = FictionalCharacter('Austin Powers');
/// New instance optional 'new' keyword - not recommended
final drEvil = new FictionalCharacter('Dr Evil');


class FictionalCharacter1 {
  final String name;
  final int _age; // Private field

  /// Manually assigned final field (after ':')
  FictionalCharacter1(this.name) : _age = 85;
  // 'this' refers to current instance
}

class FictionalCharacter2 {
  final String name;
  final String alias;

  /// Constructor with optional parameters
  FictionalCharacter2(this.name, {String? alias})
      : this.alias = alias ?? 'Spy'
  {
    // Optional constructor body
    print('Watch out, here is $name!');
  }

  /// Additional, named constructor
  FictionalCharacter2.coolestCharacter() :
        this.name = 'Austin Powers',
        this.alias = 'International man of mystery';
}

void classes() {
  /// Create a new instance of FictionalCharacter
  final austin = FictionalCharacter1('Austin Powers');
  print(austin.name);
  print(austin._age); // Not visible outside source file

  /// Using named constructor
  final coolest = FictionalCharacter2.coolestCharacter();
}


/// *** More about classes ***

/// Interface / protocol - implemented with abstract class
abstract class SomeInterface {
  void interfaceMethod();
}

/// Abstract classes can contain concrete methods
abstract class SomeBaseClass {
  bool someField = true;
  void abstractMethod();
  void inheritedMethod() { /* Implementation */ }
}

/// Mixins - another way of reusing functionality
mixin SomeTrait on SomeBaseClass { // Optionally limit use with 'on'
  bool mixedInField = true;
  void someUsefulMethod() { /* Implementation */ }
}

/// Putting it to use
class AwesomeClass extends SomeBaseClass with SomeTrait implements SomeInterface {
  void interfaceMethod() { /* Implementation */ }
  void abstractMethod() { /* Implementation */ }
}


/// *** Casting and type checking ***

void castingAndTypeChecking() } {
  Object austin = FictionalCharacter('Austin');

  /// Will throw exception if invalid
  var name = (austin as FictionalCharacter).name;

  /// Safer
  if (austin is FictionalCharacter) {
    var name = austin.name;
  }
}


/// -------------------------------------------------
/// --- Sound null safety ---------------------------
/// -------------------------------------------------
/// 
/// See also:
/// * https://dart.dev/codelabs/dart-cheatsheet#nullable-variables
/// * https://dart.dev/codelabs/dart-cheatsheet#null-aware-operators

void soundNullSafety() {
  // String string = null; // INVALID in null-safe Dart.

  /// Null safety is enabled by default in Dart. 
  /// '?' is used to mark nullable types. 
  String? string;
  print(string?.length); // prints 'null'

  if (string != null) {
    print(string.length); // '?' no longer needed
  }

  string ??= 'Hello'; // Assign if null
}


class LazyClass {
  late final int myInt;
  LazyClass() {
    myInt = 42;
  }
}
