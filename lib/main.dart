import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return const MaterialApp(
debugShowCheckedModeBanner: false,
home: Scaffold(
body: SafeArea(
child: SingleChildScrollView(
physics: BouncingScrollPhysics(),
child: BioDataWidget(),
),
),
),
);
}
}

class BioDataWidget extends StatefulWidget {
const BioDataWidget({super.key});

@override
State<BioDataWidget> createState() => _BioDataWidgetState();
}

class _BioDataWidgetState extends State<BioDataWidget> {
final TextEditingController _nameController =
TextEditingController(text: 'Justin Mike Acupan');
final TextEditingController _mobileController =
TextEditingController(text: '09935884973');
final TextEditingController _emailController =
TextEditingController(text: 'justinmikeacupan@gmail.com');
final TextEditingController _genderController =
TextEditingController(text: 'Male');
final TextEditingController _fatherNameController =
TextEditingController(text: 'Jay S. Acupan');
final TextEditingController _dobController =
TextEditingController(text: '10/25/05');
final TextEditingController _educationController =
TextEditingController(text: 'Information Technology');
final TextEditingController _experienceController =
TextEditingController(text: 'Global Reciprocal Colleges');
final TextEditingController _maritalStatusController =
TextEditingController(text: 'Single');
final TextEditingController _religionController =
TextEditingController(text: 'Catholic');
final TextEditingController _bloodGroupController =
TextEditingController(text: 'A');
final TextEditingController _siblingsController =
TextEditingController(text: '3 siblings');
final TextEditingController _addressController =
TextEditingController(text: 'Baseco Port Area Barangay 649 Zone 67');

Map<String, String> _savedData = {};

@override
void dispose() {
_nameController.dispose();
_mobileController.dispose();
_emailController.dispose();
_genderController.dispose();
_fatherNameController.dispose();
_dobController.dispose();
_educationController.dispose();
_experienceController.dispose();
_maritalStatusController.dispose();
_religionController.dispose();
_bloodGroupController.dispose();
_siblingsController.dispose();
_addressController.dispose();
super.dispose();
}

void _saveData() {
setState(() {
_savedData = {
'Name': _nameController.text,
'Mobile': _mobileController.text,
'Email': _emailController.text,
'Gender': _genderController.text,
'Father\'s Name': _fatherNameController.text,
'Date of Birth': _dobController.text,
'Education': _educationController.text,
'Experience': _experienceController.text,
'Marital Status': _maritalStatusController.text,
'Religion': _religionController.text,
'Blood Group': _bloodGroupController.text,
'Siblings': _siblingsController.text,
'Address': _addressController.text,
};
});

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Bio-Data Saved Successfully!')),
);
}

Widget _buildTextField(String label, TextEditingController controller) {
return Padding(
padding: const EdgeInsets.only(bottom: 12.0),
child: TextField(
controller: controller,
decoration: InputDecoration(
labelText: label,
border: const OutlineInputBorder(),
isDense: true,
),
),
);
}

@override
Widget build(BuildContext context) {
return Center(
child: ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 700),
child: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
const Text(
'BIO-DATA',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
),
const SizedBox(height: 20),

_buildTextField('Name', _nameController),
_buildTextField('Mobile', _mobileController),
_buildTextField('Email ID', _emailController),
_buildTextField('Gender', _genderController),
_buildTextField('Father\'s Name', _fatherNameController),
_buildTextField('Date of Birth', _dobController),
_buildTextField('Education', _educationController),
_buildTextField('Experience', _experienceController),
_buildTextField('Marital Status', _maritalStatusController),
_buildTextField('Religion', _religionController),
_buildTextField('Blood Group', _bloodGroupController),
_buildTextField('Siblings', _siblingsController),
_buildTextField('Address', _addressController),

const SizedBox(height: 12),

ElevatedButton(
onPressed: _saveData,
child: const Text('Save Bio-Data'),
),

const SizedBox(height: 24),
if (_savedData.isNotEmpty) ...[
const Text(
'Saved Bio-Data Information:',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
const SizedBox(height: 10),
..._savedData.entries.map(
(entry) => Padding(
padding: const EdgeInsets.symmetric(vertical: 2.0),
child: Text(
'${entry.key}: ${entry.value}',
style: const TextStyle(fontSize: 14),
),
),
),
],
],
),
),
),
);
}
}