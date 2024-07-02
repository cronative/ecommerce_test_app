import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileScreen extends StatelessWidget {
  final _storage = FlutterSecureStorage();

  Future<Map<String, String?>> _loadUserData() async {
    String? email = await _storage.read(key: 'email');
    String? name = await _storage.read(key: 'name');
    return {'email': email, 'name': name};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: FutureBuilder<Map<String, String?>>(
        future: _loadUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ${snapshot.data?['email']}',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Text('Name: ${snapshot.data?['name']}',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                    child: Text('Edit Profile'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
