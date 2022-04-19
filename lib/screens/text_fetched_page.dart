import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import './homepage.dart';

class TextFetched extends StatelessWidget {
  // const TextFetched({Key? key}) : super(key: key);
  final routeName = '/textfetch';

  final _fileNameController = TextEditingController();
  final snackBar =
      SnackBar(content: Text('Your file is saved on DOWNLOAD Folder'));
  void saveFile(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: ctx,
        builder: (BuildContext ctx) {
          return SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(10),
                height: 130,
                width: double.infinity,
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      autocorrect: true,
                      decoration: InputDecoration(labelText: 'File Name'),
                      controller: _fileNameController,
                      scrollPadding: EdgeInsets.only(bottom: 10),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_fileNameController.text.isEmpty) {
                            return;
                          }
                          final fileName = _fileNameController.text.trim();
                          List<int> textBytes = utf8.encode(scanText);
                          Uint8List textdata = Uint8List.fromList(textBytes);
                          DocumentFileSavePlus.saveFile(
                              textdata, "$fileName.txt", "text/plain");
                          Navigator.pop(ctx);
                          Navigator.popAndPushNamed(ctx, '/');

                          ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.save),
                            Padding(padding: EdgeInsets.only(right: 10)),
                            Text('Save'),
                          ],
                        ))
                  ],
                ))),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Fetched"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
              ),
              height: 480,
              width: 320,
              child: SingleChildScrollView(
                  child: Text(
                      scanText == '' ? '-- No any Text found --' : scanText)),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                saveFile(context);
              },
              child: Container(
                child: Icon(Icons.save),
                width: 290,
              ))
        ],
      ),
    );
  }
}
