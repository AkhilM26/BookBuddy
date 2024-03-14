import 'package:flutter/material.dart';
import 'package:akhil_book_buddy/pages/home_page.dart';
import 'package:akhil_book_buddy/pages/signin_page.dart';
import 'package:akhil_book_buddy/pages/profile_page.dart';


void main() => runApp (MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SignInPage(),
      '/home': (context) => HomePage(),
      '/profile': (context) => ProfilePage(userName: 'Akhil',language: 'English',changeLanguage: FlutterError.demangleStackTrace,),
    }
));

