import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final String fullName;
  final String slackName;
  final String githubHandle;
  final String bio;
  SettingsPage({
    Key? key,
    required this.fullName,
    required this.slackName,
    required this.githubHandle,
    required this.bio,
  }) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackNameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with the current values
    fullNameController.text = widget.fullName;
    slackNameController.text = widget.slackName;
    githubHandleController.text = widget.githubHandle;
    bioController.text = widget.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: slackNameController,
              decoration: const InputDecoration(labelText: 'Slack Name'),
            ),
            TextField(
              controller: githubHandleController,
              decoration: const InputDecoration(labelText: 'GitHub Handle'),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get the updated values from the text controllers
                final updatedValues = {
                  'fullName': fullNameController.text,
                  'slackName': slackNameController.text,
                  'githubHandle': githubHandleController.text,
                  'bio': bioController.text,
                };
                Navigator.pop(context, updatedValues);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
