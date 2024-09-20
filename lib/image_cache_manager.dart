import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ImageCacheManager {
  static Future<String> cacheImage(String url) async {
    // Get the temporary directory of the device
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/cached_image.jpg';

    // Check if the image file already exists
    if (await File(filePath).exists()) {
      return filePath;
    }

    // Download the image from the URL
    final response = await http.get(Uri.parse(url));

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Save the image to the local file system
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    } else {
      throw Exception('Failed to download image');
    }
  }
}
