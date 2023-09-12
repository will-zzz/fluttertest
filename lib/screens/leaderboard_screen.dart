import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  // Sample leaderboard data (you can replace this with your actual data)
  final List<Map<String, dynamic>> leaderboardData = [
    {'name': 'User 1', 'score': 100},
    {'name': 'User 2', 'score': 90},
    {'name': 'User 3', 'score': 80},
    // Add more leaderboard data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: leaderboardData.length,
        itemBuilder: (context, index) {
          final user = leaderboardData[index];
          return ListTile(
            leading: Text('${index + 1}.'),
            title: Text(user['name']),
            subtitle: Text('Score: ${user['score']}'),
          );
        },
      ),
    );
  }
}
