import 'package:demo/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData.dark(),
        // useMaterial3: true,
      home: const CalculatorScreen(),
      initialRoute: '/',
      routes: {
        CalculatorScreen.routeName:(context)  => const CalculatorScreen(),
      },
    );
  }
}


