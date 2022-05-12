import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:iide_project/model/size_config.dart';

import 'view/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(
              builder: (BuildContext context2, Orientation orientation) {
                SizeConfig.init(constraints, orientation);
                return GetMaterialApp(
                  title: "GridApp",
                  useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  defaultTransition:
                  GetPlatform.isIOS ? Transition.cupertino : Transition.rightToLeft,
                  home: const HomeScreen(),
                );
              });
        });
  }
}