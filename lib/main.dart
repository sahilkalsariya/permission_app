import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main(){
  runApp(
    MaterialApp(
     debugShowCheckedModeBanner: false,
     home: myApp(),
    )
  );
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  snackBar() async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await Permission.camera.status).toString()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission App", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(
              child: const Text("Camera Permission"),
              onPressed: () async {
                var status = await Permission.camera.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("Storage Permission"),
              onPressed: () async {
                var status = await Permission.storage.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("Location Permission"),
              onPressed: () async {
                var status = await Permission.location.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("Photos Permission"),
              onPressed: () async {
                var status = await Permission.photos.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("Contacts Permission"),
              onPressed: () async {
                var status = await Permission.contacts.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("SMS Permission"),
              onPressed: () async {
                var status = await Permission.sms.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("Phone Permission"),
              onPressed: () async {
                var status = await Permission.phone.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("Calendar Permission"),
              onPressed: () async {
                var status = await Permission.calendar.request();
                if(status.isGranted) {
                  snackBar();
                }
              },
            ),
            ElevatedButton(
              child: const Text("All Permission"),
              onPressed: () async {
                Map<Permission, PermissionStatus> _permission = await [
                  Permission.location,
                  Permission.storage,
                  Permission.phone,
                  Permission.camera,
                  Permission.audio,
                  Permission.bluetooth,
                  Permission.calendar,
                  Permission.contacts,
                  Permission.videos,
                  Permission.speech,
                  Permission.sms,
                  Permission.photos,
                  Permission.notification
                ].request();
                if(_permission[0]!.isGranted || _permission[1]!.isGranted || _permission[2]!.isGranted || _permission[3]!.isGranted || _permission[4]!.isGranted
                    || _permission[5]!.isGranted || _permission[6]!.isGranted || _permission[7]!.isGranted || _permission[8]!.isGranted || _permission[9]!.isGranted
                    || _permission[10]!.isGranted || _permission[11]!.isGranted || _permission[12]!.isGranted) {
                  print("Multiple Permission is Successfully Done.....");
                  snackBar();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
