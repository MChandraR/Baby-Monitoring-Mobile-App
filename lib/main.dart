import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:babymonitoring/baby.dart';
import 'package:babymonitoring/parent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Mengambil daftar kamera yang tersedia di perangkat
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(camera: firstCamera),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  final CameraDescription camera;

  const HomeScreen({super.key, required this.camera});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(camera: camera),
                  ),
                );
              },
              child: const Text('Go to Camera'),
            ),
           
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoStreamViewer(),
                  ),
                );
              },
              child: const Text('Go to Video Stream Viewer'),
            ),
          ],
        ),
      ),
    );
  }
}


