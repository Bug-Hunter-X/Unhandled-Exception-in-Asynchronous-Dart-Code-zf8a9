```dart
import 'dart:async';
import 'dart:math';

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
    // Handle specific exception types
    print('Error: $e');
    // Perform necessary cleanup or retry logic
  } catch (e) {
    // Handle unexpected errors
    print('Unexpected error: $e');
    // Consider logging the error for debugging
  }
}
```