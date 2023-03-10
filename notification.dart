
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:table3d/recienvednotifications.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationServices _notificationServices = NotificationServices();
  @override
  void initState() {
    _notificationServices.initialiseNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (){
                    _notificationServices.sendNotification('Instagram', 'You have 1 follow request');
              }, child: Text(
                'Show Noitification'
              )),
              ElevatedButton(
                  onPressed: (){
                    _notificationServices.scheduleNotification('scheduled', "this is scheduled notification");


                    print('hai');
                  }, child: Text(
                  'Scheduled Noitification'
              )),
              ElevatedButton(
                  onPressed: (){
                    _notificationServices.stopNotifications();
                  }, child: Text(
                  'Delete Noitification'
              )),
            ],
          ),
        ),
      ),
    );
  }
}
