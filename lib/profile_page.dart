import 'package:flutter/material.dart';
import 'package:hng_stage_2/settings_page.dart';

class ProfilePage extends StatefulWidget {
  String fullName = "Confidence Etah";
  String slackName = "Confidence Etah";
  String githubHandle = "centurionCent1";
  String bio = "A passionate developer.";
  ProfilePage(
      {Key? key,
      required this.fullName,
      required this.slackName,
      required this.githubHandle,
      required this.bio})
      : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name: ${widget.fullName}'),
            Text('Slack Name: ${widget.slackName}'),
            Text('GitHub Handle: ${widget.githubHandle}'),
            Text('Bio: ${widget.bio}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(
                      fullName: widget.fullName,
                      slackName: widget.slackName,
                      githubHandle: widget.githubHandle,
                      bio: widget.bio,
                    ),
                  ),
                ).then((updatedValues) {
                  if (updatedValues != null) {
                    setState(() {
                      // Update the profile information with new values
                      widget.fullName = updatedValues['fullName'];
                      widget.slackName = updatedValues['slackName'];
                      widget.githubHandle = updatedValues['githubHandle'];
                      widget.bio = updatedValues['bio'];
                    });
                  }
                });
              },
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
