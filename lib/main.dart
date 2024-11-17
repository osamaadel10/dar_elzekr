import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shareedu_app/view/screens/splash/splash_screen.dart';
import 'constant/varibles/global_varible.dart';
import 'controllers/language/translation.dart';
import 'package:flutter/services.dart';

import 'models/notifcation.dart';

String mainUrl = 'https://althikr-lms.net/';
String partofmainUrl = 'althikr-lms.net';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  box = GetStorage();
  String? storedLang = await box.read('lang');
  lang = storedLang != null ? Locale(storedLang) : Get.deviceLocale;
  if (storedLang == null) {
    await box.write('lang', Get.deviceLocale.toString());
  }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp()); 
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    request_permisson();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Translation(),
          locale: lang,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}

request_permisson()async{
  if(await requestPermissionNotifcation())
  {
    FirebaseMessaging.onBackgroundMessage(firebaseMessageinginBackground);
  }
}