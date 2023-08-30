import 'package:flutter/material.dart';
import 'package:user_management/UsersPage.dart';
import 'package:user_management/updateUser.dart'; // Make sure this import is valid

class ProfilPage extends StatefulWidget {
  final User userprofil;
  final List<User> userList;

  const ProfilPage({required this.userprofil, required this.userList});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  void _deletedConfirm(BuildContext context) async {
    final bool afficheSupprimer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletes'),
          content: Text('Do you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );

    if (afficheSupprimer == true) {
      print("Message à afficher dans la console de débogage");
      // L'utilisateur a confirmé la mise à jour, implémentez ici votre logique de mise à jour
      // Par exemple, vous pourriez naviguer vers un écran de modification de profil ou
      // afficher un formulaire pour permettre à l'utilisateur de modifier les détails de son profil.
      // Vous devrez peut-être transmettre les données de l'utilisateur à l'écran de modification du profil.
// ignore: use_build_context_synchronously

      deleteUser();

      // ignore: use_build_context_synchronously
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => UserPage()),
      // );
    }

    // Here you can use the 'afficheEditer' value if needed.
  }

  void deleteUser() {
    // Recherchez l'index de l'utilisateur dans la liste
    final int userIndex = widget.userList.indexOf(widget.userprofil);

    if (userIndex != -1) {
      // Supprimez l'utilisateur de la liste
      setState(() {
        widget.userList.removeAt(userIndex);
      });

      // Revenez à l'écran précédent
      Navigator.pop(context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userprofil.lastname),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(20),
                color: Colors.grey[300],
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.grey,
                      child:
                          Icon(Icons.person, color: Colors.black, size: 40.0),
                    ),
                    const SizedBox(height: 40),
                    Text("Nom: ${widget.userprofil.firstname}",
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 5),
                    Text(' Age: ${widget.userprofil.age} ans',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 49),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    _updatedUserConfirmDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      'Edit ${widget.userprofil.firstname}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    _deletedConfirm(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      'Delete ${widget.userprofil.firstname}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteConfirmDialog(BuildContext context) async {
    final bool afficheSupprimer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Do you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );

    if (afficheSupprimer == true) {
      // L'utilisateur a confirmé la mise à jour, implémentez ici votre logique de mise à jour
      // Par exemple, vous pourriez naviguer vers un écran de modification de profil ou
      // afficher un formulaire pour permettre à l'utilisateur de modifier les détails de son profil.
      // Vous devrez peut-être transmettre les données de l'utilisateur à l'écran de modification du profil.
// ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserPage()),
      );
    }

    // Here you can use the 'afficheEditer' value if needed.
  }

  // Define the _updatedUserConfirmDialog function if needed.
}

Future<void> _updateUserConfirmDialog(BuildContext context) async {
  final bool afficheEditer = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Do you want to update this user? '),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
  if (afficheEditer == true) {
    // L'utilisateur a confirmé la mise à jour, implémentez ici votre logique de mise à jour
    // Par exemple, vous pourriez naviguer vers un écran de modification de profil ou
    // afficher un formulaire pour permettre à l'utilisateur de modifier les détails de son profil.
    // Vous devrez peut-être transmettre les données de l'utilisateur à l'écran de modification du profil.
// ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UpdateUser()),
    );
  }

  // Here you can use the 'afficheEditer' value if needed.
}

_updatedUserConfirmDialog(BuildContext context) async {
  final bool doitMettreAJour = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm update'),
        content: Text('Do you want to update this user?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // Renvoie true si la mise à jour est confirmée
            },
            child: Text('Oui'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(false); // Renvoie false si la mise à jour est annulée
            },
            child: Text('Non'),
          ),
        ],
      );
    },
  );

  if (doitMettreAJour == true) {
    // L'utilisateur a confirmé la mise à jour, implémentez ici votre logique de mise à jour
    // Par exemple, vous pourriez naviguer vers un écran de modification de profil ou
    // afficher un formulaire pour permettre à l'utilisateur de modifier les détails de son profil.
    // Vous devrez peut-être transmettre les données de l'utilisateur à l'écran de modification du profil.
// ignore: use_build_context_synchronously
    //  deleteUser();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UpdateUser()),
    );
  }

  // Define the _updatedUserConfirmDialog function if needed.
}
