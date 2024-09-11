import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shareedu_app/data/local_database.dart';
import 'package:shareedu_app/view/screens/fingerprint/finger_auth.dart';
import '../../../constant/styles/colors.dart';
import '../../../constant/urls/urls.dart';
import '../start/start_screen.dart';
import '../web_view_screen/web_view_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        backgroundColor: backgroundColor,
        splash: Image.asset(
          "images/logo.png",
          fit: BoxFit.cover,
        ),
        splashIconSize: MediaQuery.sizeOf(context).width * 0.6,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: (LocalDatabase.isUserAuthenticated())?const FingerAuth(): const StartScreen(),
        animationDuration: const Duration(milliseconds: 600),
        duration: 600,
      ),
    );
  }
}

Widget getFirstScreen(int? userIndex) {
  switch (userIndex) {
    case 1:
      {
        return WebViewScreen(
          pageUrl: AppUrls.employeePage,
          title: 'staffServices'.tr,
        );
      }
    case 2:
      {
        return WebViewScreen(
          pageUrl: AppUrls.studentPage,
          title: 'studentServices'.tr,
        );
      }
    case 3:
      {
        return WebViewScreen(
          pageUrl: AppUrls.parentPage,
          title: 'parentServices'.tr,
        );
      }
    case 4:
      {
        return WebViewScreen(
          pageUrl: AppUrls.employeePage,
          title: 'staffServices'.tr,
        );
      }
    default:
      return const StartScreen();
  }
}
