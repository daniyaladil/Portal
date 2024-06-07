import 'package:flutter/material.dart';
import 'package:portal/Admin/Admin_Home/Admin_Activities/manage_classes.dart';
import 'package:portal/Faculty/Faculty_Home/Faculty_Activities/change_faculty_password.dart';
import 'package:portal/Faculty/Faculty_Home/Faculty_Activities/mark_attendance.dart';
import 'package:portal/Faculty/Faculty_Home/Faculty_Profile/faculty_profile.dart';

import 'Faculty_Activities/manage_classes.dart';

class FacultyHomeScreen extends StatefulWidget {
  final String id;
  final String password;
  const FacultyHomeScreen({super.key, required this.id, required this.password});

  @override
  State<FacultyHomeScreen> createState() => _FacultyHomeScreenState();
}

class _FacultyHomeScreenState extends State<FacultyHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
            "Faculty Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey.shade200, // Change the color here
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade700,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 12,
                    )
                  ],
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=600'),
                ),
                accountName: const Text("Amir Malik"),
                accountEmail: const Text("amirmalik778@gmail.com"),
              ),
              ListTile(
                onTap: (){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const StudentHomeScreen()));
                },
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
              ),
              buildDivider(),
              const ListTile(
                leading: Icon(Icons.pin_end_rounded),
                title: Text("Mark attendance"),
              ),
              buildDivider(),
              ListTile(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const StudentAttendanceScreen()));
                },
                leading: const Icon(Icons.co_present_outlined),
                title: const Text("Mark Grades"),
              ),
              buildDivider(),
              const ListTile(
                leading: Icon(Icons.more_time_sharp),
                title: Text("Surveys"),
              ),
              buildDivider(),
              const ListTile(
                leading: Icon(Icons.account_balance),
                title: Text("Accounts"),
              ),
              buildDivider(),
              ListTile(
                onTap: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangeFacultyPasswordScreen(id: widget.id,password: widget.password,)));
                  });
                },
                leading: const Icon(Icons.lock),
                title: const Text("Change Password"),
              ),
              buildDivider(),
              ListTile(
                onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                },
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FacultyProfileScreen(
                  id: widget.id,
                  password: widget.password,
                )));
              },
              leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
              ),
              title: Text("Imran Khan",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              subtitle: Text("See your profile",style: TextStyle(color: Colors.white70)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,bottom: 25),
              child: SizedBox(
                height: 10,
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15,left: 15,bottom: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MarkAttendanceScreen(teacherId: widget.id)));
                          },
                          child: buildSection("images/attendance.png", "Mark Attendance"))
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap:(){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddFacultyScreen()));
                          },
                          child: buildSection("images/exam.png", "Manage Exams")
                      )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15,left: 15,bottom: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ManageMyClassesScreen(teacherId: widget.id,)));
                          },
                          child: buildSection("images/classroom.png", "My Classes"))
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangeFacultyPasswordScreen(id: widget.id,password: widget.password,)));
                          },
                          child: buildSection("images/password.png", "Change Password")
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey.shade700,
    );
  }

  Widget buildSection(String url,String title) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                blurRadius: 3
            )
          ]
      ),
      child:  Padding(
        padding: const EdgeInsets.only(left: 10,top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 50,
                child: Image(image:  AssetImage(url),
                  fit: BoxFit.cover,
                  color: Colors.blueGrey.shade700,
                )
            ),
            const SizedBox(height: 5,),
            Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ],
        ),
      ),
    );
  }

  Widget buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}
