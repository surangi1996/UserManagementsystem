import 'package:flutter/material.dart';
import 'package:my_app/screens/video_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    String channel =
        'https://www.youtube.com/watch?v=FOdprHw6C9Q&list=PLU12uITxBEPHNoYbCmMQpzQefMciam_5D';
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            // backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Live Stream',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '10',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(String video) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => VideoScreen(id: video.1),
      //   ),
      // ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(
                  'https://www.google.com/search?q=image&sxsrf=ALeKk01l1y-2_KmGbV5zla4Sp4rNdrcVdg:1629866286995&tbm=isch&source=iu&ictx=1&fir=kHu-cVawhtD_aM%252CoxYcxozQtnyEfM%252C_&vet=1&usg=AI4_-kSXP_xPwgOdnYp8tSKBfJgLyADvNw&sa=X&ved=2ahUKEwjA8MSIrcvyAhUTgUsFHU8uB6UQ9QF6BAgOEAE#imgrc=kHu-cVawhtD_aM'),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                'Video',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _loadMoreVideos() async {
  //   _isLoading = true;
  //   List<Video> moreVideos = await APIService.instance
  //       .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
  //   List<Video> allVideos = _channel.videos..addAll(moreVideos);
  //   setState(() {
  //     _channel.videos = allVideos;
  //   });
  //   _isLoading = false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Channel'),
      ),
      // body: _channel != null
      //     ? NotificationListener<ScrollNotification>(
      //         onNotification: (ScrollNotification scrollDetails) {
      //           if (!_isLoading &&
      //               _channel.videos.length != int.parse(_channel.videoCount) &&
      //               scrollDetails.metrics.pixels ==
      //                   scrollDetails.metrics.maxScrollExtent) {
      //             // _loadMoreVideos();
      //           }
      //           return false;
      //         },
      //         child: ListView.builder(
      //           itemCount: 1 + _channel.videos.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             if (index == 0) {
      //               return _buildProfileInfo();
      //             }
      //             Video video = _channel.videos[index - 1];
      //             return _buildVideo(video);
      //           },
      //         ),
      //       )
      //     : Center(
      //         child: CircularProgressIndicator(
      //           valueColor: AlwaysStoppedAnimation<Color>(
      //             Theme.of(context).primaryColor, // Red
      //           ),
      //         ),
      //       ),
    );
  }
}
