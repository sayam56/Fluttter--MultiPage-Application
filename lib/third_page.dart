import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key, this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'This is the Third Page',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              data,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Go To Home Page'),
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            RaisedButton(
                child: Text(
                  'View My Profile',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue[900],
                onPressed: () {
                  _launchFacebook();
                }),
            SizedBox(
              height: 20,
            ),
            Text(
              'Reach Out',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            IconButton(
              icon: Icon(Icons.call),
              iconSize: 50,
              color: Colors.amber[900],
              onPressed: () {
                _call();
              },
            ),
            IconButton(
              icon: Icon(Icons.map),
              iconSize: 50,
              onPressed: () {
                _openMaps();
              },
              color: Colors.pink[900],
            )
          ],
        ),
      ),
    );
  }
}

void _launchFacebook() async {
  const url = 'https://www.facebook.com/aisayam';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could Not Load Profile';
  }
}

void _call() async {
  const phone = 'tel:+8801721716139';

  if (await canLaunch(phone)) {
    await launch(phone);
  } else {
    throw 'Couldnt call';
  }
}

void _openMaps() async {
  const mapUrl =
      'https://goo.gl/maps/Z1DMwvxTB3QajWTZ8';

  if (await canLaunch(mapUrl)) {
    await launch(mapUrl);
  } else {
    throw 'Couldnt open maps';
  }
}
