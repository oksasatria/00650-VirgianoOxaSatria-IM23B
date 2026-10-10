import 'package:flutter/material.dart';
import 'utils/constants.dart';
import 'screens/auth/login_screen.dart'; // Import halaman login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi EO Multi-Vendor',
      debugShowCheckedModeBanner:
          false, // Menghilangkan banner "DEBUG" di pojok kanan atas
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      // Jadikan LoginScreen sebagai halaman pertama yang dimuat
      home: const LoginScreen(),
    );
  }
}
