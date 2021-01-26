import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Picture extends StatefulWidget {
  @override
  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {

  Future<File> imageFile;

  pickImageFromGallery(ImageSource source){
    setState(() {
      // ignore: deprecated_member_use
      imageFile=ImagePicker.pickImage(source: source);
    });
  }

  Widget ShowImage(){
    return FutureBuilder<File>(

      future: imageFile,builder: (BuildContext context,AsyncSnapshot<File> snapshot){
        if(snapshot.connectionState == ConnectionState.done && snapshot.data != null){
          return Image.file(snapshot.data,height: 300,width: 300,);
        }else if(snapshot.error !=null){
          return const Text('error picking image',textAlign: TextAlign.center,);
        }else {
          return const Text('No image selected',textAlign: TextAlign.center,);
        }
    },


    );
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShowImage(),
          RaisedButton(child: Text("Selected Image"),onPressed: (){

            pickImageFromGallery(ImageSource.gallery);


          },),
        ],
        ),
      ),
    ));
  }
}
