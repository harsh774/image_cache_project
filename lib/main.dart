import 'dart:html' as html; // Import HTML library for Flutter web
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Cache Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageCachePage(),
    );
  }
}

class ImageCachePage extends StatefulWidget {
  @override
  _ImageCachePageState createState() => _ImageCachePageState();
}

class _ImageCachePageState extends State<ImageCachePage> {
  String imageUrl = 'https://i.ibb.co/dtr9ZnS/8007075227-dc958c1fe6-z.jpg';
  // Replace with a valid image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Cache Demo for Web'),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          // Add cache headers for the browser to cache the image
          headers: const {'Cache-Control': 'max-age=300'},
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return CircularProgressIndicator();
          },
          errorBuilder: (context, error, stackTrace) {
            return Text('Failed to load image');
          },
        ),
      ),
    );
  }
}
