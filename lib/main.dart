
import 'package:flutter/material.dart';

import 'view/home_page.dart';

void main() => runApp(MarketList());

class MarketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: HomePage(),
    );
  }
}