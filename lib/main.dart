import 'package:flutter/material.dart';
import 'package:app_viagens/screens/user_settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil Viajante',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:UserSettingsScreen()
    );
  }


}
