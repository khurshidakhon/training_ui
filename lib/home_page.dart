import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_ui/video_info.dart';
import '../colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          children: [
            //'Training' text and icons row
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),

            //'Your program' text and icons row
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Your program',
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),

            //'next workout' container with gradient
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              //'next workout' box decoration
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond.withOpacity(0.5),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 15,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Legs Toning\nand Glutes Workout',
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),

                    //'60 mins' and play button row
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '60 mins',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                  color: color.AppColor.gradientFirst,
                                  blurRadius: 10,
                                  offset: Offset(4, 8),
                                ),
                              ]),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => VideoInfo());
                            },
                            child: Icon(
                              Icons.play_circle_fill,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //'you are doing great container
            SizedBox(height: 5),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  //background image container
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/card.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 10),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  //girl image
                  Container(
                    margin: EdgeInsets.only(
                      right: 200,
                      bottom: 30,
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/figure.png',
                        ),
                      ),
                    ),
                  ),
                  //text part
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: EdgeInsets.only(
                      left: 150,
                      top: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'keep it up\nstick to your plan',
                          style: TextStyle(
                            color: color.AppColor.homePagePlanColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Area of focus
            Row(
              children: [
                Text(
                  'Area of focus',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: info.length.toDouble() ~/ 2,
                  itemBuilder: (_, index) {
                    return Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 5,
                          ),
                          margin:
                              EdgeInsets.only(left: 30, right: 15, bottom: 15),
                          height: 150,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                info[index]['img'],
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.1),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[index]['title'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 5,
                          ),
                          margin:
                              EdgeInsets.only(left: 15, right: 30, bottom: 15),
                          height: 150,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                info[index + 2]['img'],
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.1),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[index + 2]['title'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColor.homePageDetail,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
