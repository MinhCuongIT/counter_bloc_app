import 'dart:async';

class CounterBloc {
  CounterBloc({this.current = 0});

  int current;
  StreamController controller = StreamController<int>();

  Stream get counterStream => controller.stream;

  void increment() {
    current++;
    if (current > 10) {
      current = 10;
      controller.sink.addError('The couter is higher than ten!');
      return;
    }
    controller.sink.add(current);
  }

  void decrement() {
    current--;
    if (current < 0) {
      current = 0;
      controller.sink.addError('The couter is lowwer than zero!');
      return;
    }
    controller.sink.add(current);
  }

  void dispose() {
    controller.close();
  }
}
