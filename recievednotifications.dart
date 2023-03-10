import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{
  var id=0;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings('insta');

  void initialiseNotification()async{
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title,String body)async{

    AndroidNotificationDetails androidNotificationDetails=
    AndroidNotificationDetails(
        "channelId",
        "channelName",
    priority: Priority.high,
    importance: Importance.max);

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      id,
        title,
        body,
        notificationDetails,);
    id ++;
  }

  void scheduleNotification(String title,String body)async{

    AndroidNotificationDetails androidNotificationDetails=
    AndroidNotificationDetails(
        "channelId",
        "channelName",
        priority: Priority.high,
        importance: Importance.max);

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        title,
        body,
        RepeatInterval.everyMinute,
        notificationDetails,);
  }

  void stopNotifications()async{
    _flutterLocalNotificationsPlugin.cancelAll();

  }

}
