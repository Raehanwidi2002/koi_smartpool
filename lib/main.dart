import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:koi_smartpool/app/controllers/auth_controller.dart';
import 'package:koi_smartpool/app/utils/loading.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.active){
        return GetMaterialApp(
        title: "Aplication",
        initialRoute: Routes.HOME,
        getPages: AppPages.routes,
      );
        }
      return LoadingView();
    }
    );
  }
}
