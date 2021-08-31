import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDemo extends StatefulWidget {
  VideoDemo() : super();

  final String title = "Video Demo";

  @override
  VideoDemoState createState() => VideoDemoState();
}

class VideoDemoState extends State<VideoDemo> {
  //
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://www.youtube.com/watch?v=FOdprHw6C9Q&list=PLU12uITxBEPHNoYbCmMQpzQefMciam_5D");
    // _controller = VideoPlayerController.asset("assets/HTML Sinhala 2.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Demo"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'broadcast_page.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _channelName = TextEditingController();
//   String check = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 height: MediaQuery.of(context).size.height * 0.2,
//                 child: TextFormField(
//                   controller: _channelName,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                     hintText: 'Channel Name',
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => onJoin(isBroadcaster: false),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'Just Watch  ',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Icon(
//                       Icons.remove_red_eye,
//                     )
//                   ],
//                 ),
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   primary: Colors.pink,
//                 ),
//                 onPressed: () => onJoin(isBroadcaster: true),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'Broadcast    ',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Icon(Icons.live_tv)
//                   ],
//                 ),
//               ),
//               Text(
//                 check,
//                 style: TextStyle(color: Colors.red),
//               )
//             ],
//           ),
//         ));
//   }

//   Future<void> onJoin({bool isBroadcaster}) async {
//     await [Permission.camera, Permission.microphone].request();

//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => BroadcastPage(
//           channelName: _channelName.text,
//           isBroadcaster: isBroadcaster,
//         ),
//       ),
//     );
//   }
// }
