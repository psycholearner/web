import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consume_wise_ai/providers/user_provider.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Gluten Free'),
              value: userProvider.profile.glutenFree,
              onChanged: (value) {
                userProvider.updateProfile(
                  UserProfile(
                    glutenFree: value,
                    lactoseFree: userProvider.profile.lactoseFree,
                    diabetic: userProvider.profile.diabetic,
                  ),
                );
              },
            ),
            SwitchListTile(
              title: Text('Lactose Free'),
              value: userProvider.profile.lactoseFree,
              onChanged: (value) {
                userProvider.updateProfile(
                  UserProfile(
                    glutenFree: userProvider.profile.glutenFree,
                    lactoseFree: value,
                    diabetic: userProvider.profile.diabetic,
                  ),
                );
              },
            ),
            SwitchListTile(
              title: Text('Diabetic'),
              value: userProvider.profile.diabetic,
              onChanged: (value) {
                userProvider.updateProfile(
                  UserProfile(
                    glutenFree: userProvider.profile.glutenFree,
                    lactoseFree: userProvider.profile.lactoseFree,
                    diabetic: value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
