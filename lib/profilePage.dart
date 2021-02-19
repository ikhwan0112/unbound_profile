import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unbound_profile/userDetail.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _imagePicker = ImagePicker();
  File _image;

  openCamera() async {
    PickedFile _picture = await _imagePicker.getImage(
      source: ImageSource.camera,
    );

    File _selected = File(_picture.path) ?? null;

    setState(() {
      _image = _selected;
    });
  }

  openGallery() async {
    PickedFile _gallery = await _imagePicker.getImage(
      source: ImageSource.gallery,
    );

    File _selected = File(_gallery.path) ?? null;

    setState(() {
      _image = _selected;
    });
  }

  Future<void> _optionsDialogBox(Size size, context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text('Take a picture'),
                  onTap: () async {
                    await openCamera();
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: size.height / 35,
                ),
                GestureDetector(
                  child: Text('Select from gallery'),
                  onTap: () async {
                    await openGallery();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF897F6E),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(s.height / 50),
          child: Column(
            children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    // Image User (Start)
                    Stack(
                      children: [
                        Container(
                          height: s.height / 3.5,
                          width: s.width,
                          child: _image != null
                              ? Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey[800],
                                    size: s.width / 10,
                                  ),
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _optionsDialogBox(s, context);
                              },
                              child: Container(
                                margin: EdgeInsets.all(s.width * 0.02),
                                padding: EdgeInsets.all(s.height * 0.01),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Image User (End)
                    SizedBox(
                      height: s.height / 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(s.width / 25),
                      width: s.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserDetail(
                            text1: "Username",
                            text: "User123",
                          ),
                          SizedBox(
                            height: s.height / 40,
                          ),
                          UserDetail(
                            text: "John",
                            text1: "First Name",
                          ),
                          SizedBox(
                            height: s.height / 40,
                          ),
                          UserDetail(
                            text: "Doe",
                            text1: "Last Name",
                          ),
                          SizedBox(
                            height: s.height / 40,
                          ),
                          UserDetail(
                            text: "21",
                            text1: "Age",
                          ),
                          SizedBox(
                            height: s.height / 40,
                          ),
                          UserDetail(
                            text: "+60123456789",
                            text1: "Phone Number",
                          ),
                          SizedBox(
                            height: s.height / 40,
                          ),
                          UserDetail(
                            text: "johndoe@gmail.com",
                            text1: "Email",
                          ),
                          SizedBox(
                            height: s.height / 40,
                          ),
                          UserDetail(
                            text:
                                "Gandingan Mega Sdn Bhd (693029u)\n9-3 Plaza Danau II,\nJalan4/109F, Taman Danau Desa,\nOff Jalan Klang, 58100 Kuala Lumpur",
                            text1: "Address",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: s.height / 40,
              ),
              Container(
                // color: Color(0xFF8F8069),
                width: s.width,
                child: RaisedButton(
                  color: Color(0xFF8F8069),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: s.width,
                child: RaisedButton(
                  color: Color(0xFF000000),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
