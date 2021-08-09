import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';

class AllProject extends StatefulWidget {
  AllProject({
    this.ProjectName,
    this.ProjectId,
    this.SelectedDate,
    this.EditedDate
});
  String ProjectName;
  String ProjectId;
  String SelectedDate;
  String EditedDate;
  @override
  _AllProjectState createState() => _AllProjectState();
}

class _AllProjectState extends State<AllProject> {
  Future setNmae(String ProjectNmae) async {
    print("############# project Nme ############" + ProjectNmae.toString());
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString("projectName", widget. ProjectName.toString());

  }


  @override
  void initState() {
    // TODO: implement initState
    print(widget.ProjectName.toString());
    print(widget.ProjectId.toString());
    print(widget.EditedDate.toString());
    print(widget.SelectedDate.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton:
      InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Login()),
          );
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration( shape: BoxShape.circle),
          child: Image.asset("assets/fab_icon.png",height: 20,width: 20,),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: w,
            color: Colors.blue[200],
            child: Column(
              children: [
                Container(
                  width: w,
                  height: 100,
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/side_menu_icon.png",
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                            Text(
                              "Add Project",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Image.asset(
                              "assets/settings_menu_icon.png",
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Container(
                          height: 20,
                          width: w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.00),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "serch for product title or ID",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Image.asset(
                                  "assets/search_home_icon.png",
                                  height: 10,
                                  width: 10,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        width: w,
                        height: 4.toDouble() * 150,
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 30.0, right: 30),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 19.0),
                                      child: Container(
                                        // height:150,
                                        decoration: BoxDecoration(
                                            color: index == 0
                                                ? Color(0xFF599dca)
                                                : index == 1
                                                    ? Color(0xFF345b86)
                                                    : index == 2
                                                        ? Color(0xFF655c93)
                                                        : index == 3
                                                            ? Color(0xFF4d3b55)
                                                            : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0,
                                                  left: 40,
                                                  bottom: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Project :"+widget.ProjectName,
                                                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  Text("Created :"+widget.SelectedDate,
                                                      style: TextStyle(fontWeight: FontWeight.w500,
                                                          color: Colors.white)),
                                                  Text("Edited :"+widget.EditedDate,
                                                      style: TextStyle(fontWeight: FontWeight.w500,
                                                          color: Colors.white)),
                                                  Text("ID# :"+widget.ProjectId,
                                                      style: TextStyle(fontWeight: FontWeight.w500,
                                                          color: Colors.white)),
                                                  Text("Records :10",
                                                      style: TextStyle(fontWeight: FontWeight.w500,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/project_menu1.png",
                                              height: 40,
                                              width: 40,
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Image.asset(
                                        "assets/project_img1.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
