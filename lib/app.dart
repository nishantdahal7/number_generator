import 'package:flutter/material.dart';
import 'package:number_generator/view/num_generator_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pick The Greater Number ',
      initialRoute: '/',
      routes: {
        '/': (context) => const NumberGeneratorScreen(),
      },
    );
  }
}
