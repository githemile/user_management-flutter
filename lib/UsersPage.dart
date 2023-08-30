import 'package:flutter/material.dart';
import 'package:user_management/ProfilUser.dart';
import 'package:user_management/creationUser.dart';
// import 'package:user_management/PageCreate.dart';
// import 'package:user_management/creationUser.dart';
// import 'package:user_management/notifcation.dart';

class UserPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class User {
  String firstname;
  int age;
  String lastname;

  User({required this.firstname, required this.lastname, required this.age});
}

class _HomePageState extends State<UserPage> {
  // Liste factice de noms de contacts avec les âges correspondants
  // List<Map<String, dynamic>> users = [
  //   {"name": "LOVI Emile", "age": 30},
  //   {"name": "LAWSON Georges", "age": 25},
  //   {"name": "WEOVIs Gael", "age": 28},
  // ];

  final List<User> users = [
    User(firstname: 'LOVI', lastname: 'EMILE', age: 12),
    User(firstname: 'ELKDO', lastname: 'DLKJDL', age: 52),
    User(firstname: 'DILD', lastname: 'DLDJOEI', age: 83),
    // ... Ajoutez d'autres utilisateurs ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 16, 15, 15),
                  ),
                ),
              ),
              title: Text('${users[index].lastname} ${users[index].firstname}'),
              subtitle: Text(" ${users[index].age} ans"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfilPage(userprofil: users[index], userList: users),
                    // Use userprofil instead of user
                  ),
                );
              },
              // Ajoutez d'autres widgets d'affichage pour chaque contact si nécessaire
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateUserPage()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
