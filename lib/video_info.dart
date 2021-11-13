import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  static const routeName = '/video-info';
  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool _playArea = false;
  VideoPlayerController? _controller;
  List videoInfo = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
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
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(
                color: color.AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: EdgeInsets.only(
                      top: 50,
                      left: 30,
                      right: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //back icon and info icon
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),

                        //Legs toning text
                        SizedBox(height: 30),
                        Text(
                          'Legs Toning\nand Glutes Workout',
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        SizedBox(height: 50),
                        //details. 60 mins and so on
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '60 mins',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              padding: EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Resistent band, Kettlebell',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(
                            top: 50,
                            left: 30,
                            right: 30,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.loopColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '3 steps',
                              style: TextStyle(
                                fontSize: 15,
                                color: color.AppColor.setsColor,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        )
                      ],
                    ),
                    Expanded(child: _listView()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _controlView(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () async {},
          child: Icon(
            Icons.fast_rewind,
            size: 36,
            color: Colors.white,
          ),
        ),
        FlatButton(
          onPressed: () async {},
          child: Icon(
            Icons.play_arrow,
            size: 36,
            color: Colors.white,
          ),
        ),
        FlatButton(
          onPressed: () async {},
          child: Icon(
            Icons.fast_forward,
            size: 36,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Initializing, pls wait",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  _onTapVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]['videoUrl']);
    _controller = controller;
    setState(() {});
    controller.initialize().then((_) {
      controller.play();
      setState(() {});
    });
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      itemCount: videoInfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index));
      },
    );
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      child: Column(
        children: [
          //video thumbnail and title
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      videoInfo[index]['thumbnail'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    videoInfo[index]['time'],
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              )
            ],
          ),
          //dashed line and rest time
          SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                  style: TextStyle(
                    color: Color(0xFF839fed),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
