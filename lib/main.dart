import 'package:flutter/material.dart';
import 'package:multi_page_app/route_generator.dart';
import './route_generator.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 300,
            floating: true,
            pinned: true,
            snap: true,
            actionsIconTheme: IconThemeData(opacity: 0.0),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
                fit: BoxFit.cover,
              ),
              title: Text(
                'First Page',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SliverFillRemaining(
              child: Center(
                  child: Stack(
            children: <Widget>[
              TestArea(),
            ],
          ))),
        ],
      ),
    ));
  }
}

class TestArea extends StatelessWidget {
  const TestArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hi From The First Page',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              child: Text('Go To Second Page'),
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed('/second',
                    arguments: 'Hello from the first page');
              },
            ),
          ],
        ));
  }
}
 