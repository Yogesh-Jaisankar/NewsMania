import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text("News",style: TextStyle(
                color: Colors.deepOrangeAccent
            ),)
          ],
        ),
        actions: [
          Opacity (
            opacity: 0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.notifications_none))
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl ,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
