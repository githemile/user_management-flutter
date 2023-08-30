import 'dart:io';

import 'package:flutter/material.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  String? _selectedImagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Créer un utilisateur'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
          child: GestureDetector(
            onTap: () async {},
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          // après pour selectionner l'image
                          image: _selectedImagePath != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(_selectedImagePath!)))
                              : null,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.black),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                buildFFF(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }
}

Widget buildForm(BuildContext context) {
  const obligatoire = "*";
  String a = obligatoire.toString();
  final firstnameController = TextEditingController();
  // ignore: non_constant_identifier_names
  final LastnameController = TextEditingController();
  final ageController = TextEditingController();

  void _createUser() {
    // Ici, vous pouvez ajouter la logique pour traiter les données de l'utilisateur
    // par exemple, vous pourriez les afficher dans un message pop-up.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nouvel Utilisateur'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Nom: $Firstname'),
              // Text('Email: $Lastname'),
              // Text('Email: $age'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  return Form(
    child: Column(
      children: [
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            // ignore: prefer_interpolation_to_compose_strings
            labelText: 'Nom  $obligatoire',

            border: OutlineInputBorder(),
          ),
          controller: firstnameController,
          autofocus: true,
          autocorrect: true,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            // ignore: prefer_interpolation_to_compose_strings
            labelText: 'Prenom   $obligatoire',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          autocorrect: true,
          controller: LastnameController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Age',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          autocorrect: true,
          controller: ageController,
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            height: 35.0,
            child: ElevatedButton(
              onPressed: _createUser,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.black, // Couleur de fond du bouton
              ),
              child: const Text(
                'SAVE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ), // Couleur du texte du bouton
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildForms(BuildContext context) {
  const obligatoire = "*";
  String a = obligatoire.toString();
  final firstnameController = TextEditingController();
  // ignore: non_constant_identifier_names
  final LastnameController = TextEditingController();
  final ageController = TextEditingController();

  void _createUser() {
    // Ici, vous pouvez ajouter la logique pour traiter les données de l'utilisateur
    // par exemple, vous pourriez les afficher dans un message pop-up.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nouvel Utilisateur'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Nom: $Firstname'),
              // Text('Email: $Lastname'),
              // Text('Email: $age'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  return Form(
    child: Column(
      children: [
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            // ignore: prefer_interpolation_to_compose_strings
            labelText: 'Nom  $obligatoire',

            border: OutlineInputBorder(),
          ),
          controller: firstnameController,
          autofocus: true,
          autocorrect: true,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            // ignore: prefer_interpolation_to_compose_strings
            labelText: 'Prenom   $obligatoire',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          autocorrect: true,
          controller: LastnameController,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Age',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          autocorrect: true,
          controller: ageController,
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            height: 35.0,
            child: ElevatedButton(
              onPressed: _createUser,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.black, // Couleur de fond du bouton
              ),
              child: const Text(
                'SAVE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ), // Couleur du texte du bouton
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildFFF(BuildContext context) {
  // ignore: unused_local_variable
  final firstNameField = TextField(
    style: const TextStyle(fontSize: 20.0),
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Lastname",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  // ignore: unused_local_variable, non_constant_identifier_names
  final LastnameField = TextField(
    style: const TextStyle(fontSize: 20.0),
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Firsname",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final AgeField = TextField(
    style: const TextStyle(fontSize: 20.0),
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Age",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final loginButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: const Color.fromARGB(255, 0, 0, 0),
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {},
      child: const Text("Valider",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold)),
    ),
  );

  return Form(
    child: Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.1,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20.0),
              LastnameField,
              const SizedBox(height: 20.0),
              firstNameField,
              const SizedBox(height: 20.0),
              AgeField,
              const SizedBox(
                height: 25.0,
              ),
              loginButton,
              const SizedBox(
                height: 4.0,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
