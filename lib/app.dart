import 'package:flutter/material.dart';
import 'package:flutter_user_list_cubit/user_list/user_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromARGB(255, 7, 228, 248),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 131, 32, 65),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color.fromARGB(255, 125, 91, 102),
        ),
      ),
      home: const UserListPage(),
    );
  }

}