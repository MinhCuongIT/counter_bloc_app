import 'package:counter_bloc_app/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _counterBloc.counterStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Error:${snapshot.error.toString()}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Text(
                    'Data:${snapshot.data}',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  );
                }
                return Text(
                  'No data',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _counterBloc.increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () => _counterBloc.decrement(),
            tooltip: 'Descrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
