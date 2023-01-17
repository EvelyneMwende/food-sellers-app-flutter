import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/authentication/auth_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{
  startTimer(){
    Timer(const Duration(seconds: 3), () async {
      //Send user to auth screen
      Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));

    });
  }

  //whenever the splash screen is started this function is called/executed
  @override
  void initState() {
    super.initState();

    //call function to start splash screen timer
    startTimer();

  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("images/splash.jpg"),
              ),

              const SizedBox(height: 10,),

              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Sell Food Online",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40,
                    fontFamily: "Signatra",
                    letterSpacing: 3,
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
