import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);

  List<Map<String, dynamic>> notifications = [
    {"name": "EMILE UPDATED", "date": "12:15"},
    {"name": "EMILE CREATED", "date": "16:23"},
    {"name": "EMILE DELETED", "date": "18:30"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifcations'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(4),
        itemCount: notifications.length,
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
                  Icons.notifications,
                  color: Color.fromARGB(255, 16, 15, 15),
                ),
              ),
            ), // Remplacez ceci par votre propre image
            title: Text(notifications[index]["name"]),
            trailing: Text(" ${notifications[index]["date"]} "),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //     // ajout d'icone
      //     hoverColor: const Color.fromARGB(137, 59, 58, 58),
      //     backgroundColor: const Color.fromARGB(137, 59, 58, 58),

      //     // quand la personne apuie onpressed
      //     onPressed: () {
      //       // TODO NAVIGUER VERS PAGE CREATE
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const CreateUserPage()));
      //     },
      //     // ajout d'icone
      //     child: const Icon(Icons.add))
    );
  }
}
