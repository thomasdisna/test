import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AllProject.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _projectNmae = TextEditingController();
  final _projectId = TextEditingController();

  getPrjectName() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString("projectName");
  }
  getPrjectId() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString("projectId");
  }
  setNmae(String ProjectNmae) async {
    print("############# project Nme ############" + ProjectNmae.toString());
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString("projectName", _projectNmae.text);

  }
  setId(String projectId) async {
    print("############# project ID ############" + projectId.toString());
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString("projectName", _projectId.text);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.blue[200],
        leading: Icon(
          Icons.drag_handle_outlined,
          color: Colors.white,
          size: 40,
        ),
        title: Center(
            child: Text(
          "Add Project",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: h / 1.6,
                width: w / 2.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 1,
                          spreadRadius: 1),
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: _projectNmae,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: "project Name"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: _projectId,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: "project id"),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: () {

                        setNmae(_projectNmae.text).toString();
                        setId(_projectId.text).toString();


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AllProject(ProjectName: _projectNmae.text,
                                  ProjectId: _projectId.text,
                                  EditedDate: "12-03-2020",
                                  SelectedDate: "13-04-2020",)),
                        );
                      },
                      height: 20,
                      minWidth: 30,
                      hoverColor: Colors.blue,
                      splashColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0,right: 20,top:10,bottom: 10),
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
