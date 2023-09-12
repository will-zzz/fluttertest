import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool receiveNotifications = true; // Example setting

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('Receive Notifications'),
              trailing: Switch(
                value: receiveNotifications,
                onChanged: (newValue) {
                  setState(() {
                    receiveNotifications = newValue;
                  });
                },
              ),
            ),
            // Add more settings widgets here
          ],
        ),
      ),
    );
  }
}
