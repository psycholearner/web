 import 'package:flutter/material.dart';

class UserProfile {
  bool glutenFree;
  bool lactoseFree;
  bool diabetic;

  UserProfile({
    this.glutenFree = false,
    this.lactoseFree = false,
    this.diabetic = false,
  });
}

class UserProvider with ChangeNotifier {
  UserProfile _profile = UserProfile();

  UserProfile get profile => _profile;

  void updateProfile(UserProfile newProfile) {
    _profile = newProfile;
    notifyListeners();
  }
}
