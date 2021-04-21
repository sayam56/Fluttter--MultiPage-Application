import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key, this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              data,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            RaisedButton(
              child: Text('Go To Third Page'),
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed('/third',
                    arguments: 'Hello from the second page');
              },
            ),
            RaisedButton(
                child: Text('Google'),
                color: Colors.redAccent[100],
                onPressed: () {
                  _launchURL();
                })
          ],
        ),
      ),
    );
  }
}

void _launchURL() async {
  const url = 'https://www.google.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Couldn\'n Launch $url';
  }
}
