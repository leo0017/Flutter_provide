import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'models/switcher.dart';
import 'models/counter.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Provide<Counter>(
              builder: (context, child, counter) {
                return Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            Provide<Switcher>(
              builder: (context, child, switcher) {
                return Switch(
                    value: switcher.status,
                    onChanged: (newValue) {
                      switcher.changeStatus();
                    });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondScreen()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
