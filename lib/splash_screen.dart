

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printer_app/screen/home_page.dart';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:io' show Platform;

import 'constants/colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () async {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    print("current width is " + MediaQuery.of(context).size.width.toString());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.blueColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'Printing',
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,

                        ),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ],
              ),
            ),
            Spacer(),
            Transform.rotate(
              alignment: Alignment.bottomCenter,
              angle: pi / 23,
              child: Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Image.asset("assets/images/background.png",
                    fit: BoxFit.scaleDown),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
