import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  static const USERNAMEKEY = 'username';
  static const USERAGEKEY = 'user_age';
  static const USERTRIPKEY = 'usertrip';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _tripController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _nameController.text = prefs.getString(USERNAMEKEY) ?? "";
      _ageController.text = prefs.getInt(USERAGEKEY)?.toString() ?? "";
      _tripController.text = prefs.getString(USERTRIPKEY) ?? "";
    });
  }

  void _saveUserData() async {
    String name = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;
    String trip = _tripController.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(USERNAMEKEY, name);
    await prefs.setInt(USERAGEKEY, age);
    await prefs.setString(USERTRIPKEY, trip);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Dados Salvos!")));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
