```dart
import 'dart:async';

Future<void> main() async {
  final completer = Completer<int>();

  // Simulate an asynchronous operation that might fail.
  Timer(const Duration(seconds: 2), () {
    final random = Random();
    if (random.nextBool()) {
      completer.complete(10);
    } else {
      completer.completeError(Exception('Operation failed'));
    }
  });

  try {
    final result = await completer.future;
    print('Result: $result');
  } on Exception catch (e) {
    print('Error: $e');
  } catch (e) {
    print('Unexpected error: $e');
  }
}
```