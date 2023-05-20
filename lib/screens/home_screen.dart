import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/widgets/header_widget.dart';

import '../widgets/general_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    globalController.getIcalLink(
        "https://kudos.chu.cam.ac.uk/kudos/rest/iCal?authuser=yg410&authsecret=d9d12e46-8db5-42f5-9e12-f20910318a96");
    return Scaffold(
        body: SafeArea(
      child: Obx(() => globalController.checkLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(scrollDirection: Axis.vertical, children: [
              const SizedBox(
                height: 20,
              ),
              const HeaderWidget(),
              GeneralWeatherWidget(
                  weatherDataGeneral:
                      globalController.getData().getGeneralWeatherData()),
            ])),
    ));
  }
}
