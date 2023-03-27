// ignore_for_file: avoid_print

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'detection_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.cameras, Key? key}) : super(key: key);

  final List<CameraDescription> cameras;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Red box detection'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 15, 110, 0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 30),
                ),
                onPressed: () {
                  // Action à effectuer lors du clic sur le bouton "Prendre une photo"
                  print('Prendre une photo');
                },
                child: const Text('Take a picture'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 30),
                ),
                onPressed: () {
                  // Action à effectuer lors du clic sur le bouton "Choisir une photo dans la pellicule"
                  print('Choisir une photo dans la pellicule');
                },
                child: const Text('Chose from gallery'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 30),
                  backgroundColor: const Color.fromARGB(255, 15, 110, 0)
                ),
                onPressed: () {
                  // Action à effectuer lors du clic sur le bouton "Détection en direct"
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DetectionPage(cameras: cameras)),
                  );
                },
                child: const Text('Live detection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

