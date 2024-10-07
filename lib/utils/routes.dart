import 'package:app_eatures_exma/views/detailpage/detailpage.dart';
import 'package:app_eatures_exma/views/hamepage/homepage.dart';
import 'package:flutter/material.dart';

class Routes {
  static String homePage = '/';
  static String detailPage = 'detailpage';
}

Map<String, Widget Function(BuildContext context)> routes = {
  Routes.homePage: (context) => const Homepage(),
  Routes.detailPage: (context) => const Detailpage(),
};
