import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shareedu_app/data/localData/local_database.dart';
import '../../../constant/styles/colors.dart';
import '../../../constant/urls/urls.dart';
import '../start/start_screen.dart';
import '../web_view_screen/web_view_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        backgroundColor: backgroundColor,
        splash: Image.asset(
          "images/logo.png",
          fit: BoxFit.cover,
        ),
        splashIconSize: MediaQuery.sizeOf(context).width * 0.7,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: getFirstScreen(LocalDatabase.getUserIndex()),
        animationDuration: const Duration(seconds: 1),
        duration: 2,
      ),
    );
  }
}

String screen = "";
Widget getFirstScreen(int? userIndex) {
  switch (userIndex) {
    case 1:
      {
        screen = 'web';
        return WebViewScreen(
          pageUrl: AppUrls.employeePage,
          title: 'staffServices'.tr,
        );
      }
    case 2:
      {
        screen = 'web';
        return WebViewScreen(
          pageUrl: AppUrls.studentPage,
          title: 'studentServices'.tr,
        );
      }
    case 3:
      {
        screen = 'web';
        return WebViewScreen(
          pageUrl: AppUrls.parentPage,
          title: 'parentServices'.tr,
        );
      }
    case 4:
      {
        screen = 'web';
        return WebViewScreen(
          pageUrl: AppUrls.employeePage,
          title: 'staffServices'.tr,
        );
      }
    default:
      return const StartScreen();
  }
}
