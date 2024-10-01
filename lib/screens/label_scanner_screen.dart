import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:consume_wise_ai/services/api_service.dart';
import 'package:consume_wise_ai/screens/label_details_screen.dart';

class LabelScannerScreen extends StatefulWidget {
  @override
  _LabelScannerScreenState createState() => _LabelScannerScreenState();
}

class _LabelScannerScreenState extends State<LabelScannerScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = pickedImage;
      });
      _processLabel(_imageFile!);
    }
  }

  Future<void> _takePicture() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _imageFile = pickedImage;
      });
      _processLabel(_imageFile!);
    }
  }

  Future<void> _processLabel(XFile imageFile) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final labelData = await ApiService.scanLabel(imageFile.path);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LabelDetailsScreen(labelData: labelData),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error processing label. Please try again.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConsumeWise AI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_imageFile != null)
            Image.file(File(_imageFile!.path), height: 300),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Upload Image'),
          ),
          ElevatedButton(
            onPressed: _takePicture,
            child: Text('Take Picture'),
          ),
          if (_isLoading)
            CircularProgressIndicator(),
        ],
      ),
    );
  }
}
