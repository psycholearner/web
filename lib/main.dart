import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consume_wise_ai/providers/user_provider.dart';
import 'package:consume_wise_ai/screens/label_scanner_screen.dart';
import 'package:consume_wise_ai/screens/user_profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConsumeWise AI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LabelScannerScreen(),
      routes: {
        '/profile': (context) => UserProfileScreen(),
      },
    );
  }
}
