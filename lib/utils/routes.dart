import 'package:app_eatures_exma/views/adddatapage/add_datapage.dart';
import 'package:app_eatures_exma/views/detailpage/detailpage.dart';
import 'package:app_eatures_exma/views/hamepage/homepage.dart';
import 'package:flutter/material.dart';

class Routes {
  static String homePage = '/';
  static String detailPage = 'detailpage';
  static String addDatapage = 'Adddatapage';
}

Map<String, Widget Function(BuildContext context)> routes = {
  Routes.homePage: (context) => const Homepage(),
  Routes.detailPage: (context) => const Detailpage(),
  Routes.addDatapage: (context) => const Adddatapage(),
};
