
import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: "John Doe", email: "johndoe@example.com", phoneNumber: "1234567890"),
    Contact(name: "Jane Smith", email: "janesmith@example.com", phoneNumber: "45668787324"),
    Contact(name: "Alice Johnson", email: "alicejohnson@example.com", phoneNumber: "55555324345"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(contacts: contacts),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts;

  ContactListScreen({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ContactDetailsSheet(contact: contact);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetailsSheet extends StatelessWidget {
  final Contact contact;

  ContactDetailsSheet({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
          'Task Details',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
            Text('Name: ${contact.name}'),
            SizedBox(height: 8),
            Text('Email: ${contact.email}'),
            SizedBox(height: 8),
            Text('Phone Number: ${contact.phoneNumber}'),
          ],
        ),
      ),
    );
  }
}
