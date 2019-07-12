import 'package:a_tpa/models/non_video_model.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  final NonVideoModel nonVideoModel;
  PlayVideo({Key key, this.nonVideoModel}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
// Explicit
  NonVideoModel nonVideoModel;
  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  String urlVideo;

// Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      nonVideoModel = widget.nonVideoModel;
      urlVideo = nonVideoModel.pathVideo;

      videoPlayerController = VideoPlayerController.network(urlVideo);
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
      );
    });
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Video ${nonVideoModel.name}'),
      ),
      body: Center(child: Chewie(controller: chewieController,),),
    );
  }
}
