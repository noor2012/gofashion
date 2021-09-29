import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gofashion/screens/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'homePage.dart';
import 'terms_and_conditions.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String selectedValue = "ar";
  late SharedPreferences _preferences;

  @override
  void initState() {
    goToNextScreen();
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
      setState(() {
        // languageName = _preferences.getString("languageName") ?? 'ar';
      });
    });
  }
  goToNextScreen() async {
    Timer(Duration(seconds: 6) ,() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool isAccepted = (prefs.getBool('isAccepted') ?? false);
      if (!isAccepted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TermsAndCond()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF006FFF),
                Color(0xFF005FFF),
                Color(0xFF006FFF),
              ]),
        ),
        child: Center(
          child: Text(
            'Go Fashion',
            style: GoogleFonts.pacifico(
                fontSize: size.width * 0.10,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )
          ),
        ),
      ),
    );
  }
}