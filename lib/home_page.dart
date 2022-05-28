// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<File> createPdf(
      String empName,
      String empID,
      String empRole,
      String empAddress,
      String empBloodGroup,
      String empDOB,
      String empContactNo,
      String empFatherContact) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: pw.EdgeInsets.all(20),
          child: pw.Container(
            width: double.infinity,
            color: PdfColors.white,
            child: pw.Column(children: [
              pw.Text(
                'SANTI\nSOLUTIONS',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontSize: 50,
                    color: PdfColors.blue,
                    fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 50),
              pw.Container(
                color: PdfColors.blue,
                height: 200,
                width: 200,
              ),
              pw.SizedBox(height: 50),
              pw.Text(
                empName,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontSize: 40,
                    color: PdfColors.red,
                    fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                empRole,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontSize: 40,
                    color: PdfColors.blue700,
                    fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'EMP ID: $empID',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 35,
                  color: PdfColors.black,
                ),
              )
            ]),
          ),
        );
      },
    ));
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: pw.EdgeInsets.all(15),
          child: pw.Container(
            color: PdfColors.purple,
            child: pw.Padding(
              padding: pw.EdgeInsets.all(5),
              child: pw.Container(
                height: 700,
                width: double.infinity,
                color: PdfColors.white,
                child: pw.Padding(
                  padding: pw.EdgeInsets.all(20),
                  child: pw.Column(children: [
                    pw.SizedBox(height: 50),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'ADDRESS : ',
                          style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 6,
                        child: pw.Text(
                          empAddress,
                          style: pw.TextStyle(
                              color: PdfColors.purple,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'BLOOD GROUP : ',
                          style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 6,
                        child: pw.Text(
                          empBloodGroup,
                          style: pw.TextStyle(
                              color: PdfColors.purple,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'DOB : ',
                          style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 6,
                        child: pw.Text(
                          empDOB,
                          style: pw.TextStyle(
                              color: PdfColors.purple,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'CONTACT NO. : ',
                          style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 6,
                        child: pw.Text(
                          empContactNo,
                          style: pw.TextStyle(
                              color: PdfColors.purple,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'FATHER\'S NO. : ',
                          style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 6,
                        child: pw.Text(
                          empFatherContact,
                          style: pw.TextStyle(
                              color: PdfColors.purple,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 100),
                    pw.Text(
                      'SANTI SOLUTION PVT LTD',
                      style: pw.TextStyle(color: PdfColors.green, fontSize: 22),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'ADDRESS : ',
                          style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 6,
                        child: pw.Text(
                          'B4, Saathveeka Apartments,\nIlango St, EB Colony,\nIyer Bungalow, Madurai,\nTamil Nadu 625014.',
                          style: pw.TextStyle(
                              color: PdfColors.purple,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          'Phone No. : ',
                          style: pw.TextStyle(
                              color: PdfColors.red,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 6,
                        child: pw.Text(
                          '0452 268 1137,\n0452 498 5365.',
                          style: pw.TextStyle(
                              color: PdfColors.purple,
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]),
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    ));
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/OfferLetter');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  TextEditingController eName = TextEditingController();
  TextEditingController eID = TextEditingController();
  TextEditingController eRole = TextEditingController();
  TextEditingController eAddress = TextEditingController();
  TextEditingController eBloodGroup = TextEditingController();
  TextEditingController eDOB = TextEditingController();
  TextEditingController eContactNo = TextEditingController();
  TextEditingController eFathersContact = TextEditingController();
  bool isUploaded = false;
  bool validate1 = false;
  bool validate2 = false;
  bool validate3 = false;
  bool validate4 = false;
  bool validate5 = false;
  bool validate6 = false;
  bool validate7 = false;
  bool validate8 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Generator'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: eName,
                  decoration: InputDecoration(
                    hintText: 'Enter employee name',
                    errorText: validate1 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eID,
                  decoration: InputDecoration(
                    hintText: 'Enter employee ID',
                    errorText: validate2 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eRole,
                  decoration: InputDecoration(
                    hintText: 'Enter employee role/position',
                    errorText: validate8 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eAddress,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    errorText: validate3 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eBloodGroup,
                  decoration: InputDecoration(
                    hintText: 'Blood group',
                    errorText: validate4 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eDOB,
                  decoration: InputDecoration(
                    hintText: 'Date of Birth',
                    errorText: validate5 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eContactNo,
                  decoration: InputDecoration(
                    hintText: 'Contact no.',
                    errorText: validate6 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: eFathersContact,
                  decoration: InputDecoration(
                    hintText: 'Father\'s contact no.',
                    errorText: validate7 ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () async {
                        // final ImagePicker _picker = ImagePicker();
                        // final XFile? image = await _picker.pickImage(
                        //     source: ImageSource.gallery);
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image == null) {
                          setState(() {
                            isUploaded = false;
                          });
                        } else {
                          setState(() {
                            isUploaded = true;
                          });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      child: Text(isUploaded == false
                          ? 'Upload Picture from Gallery'
                          : 'Re-upload image')),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text("Generate ID Card"),
                  onPressed: () async {
                    setState(() {
                      eName.text.isEmpty ? validate1 = true : validate1 = false;
                      eID.text.isEmpty ? validate2 = true : validate2 = false;
                      eRole.text.isEmpty ? validate8 = true : validate8 = false;
                      eAddress.text.isEmpty
                          ? validate3 = true
                          : validate3 = false;
                      eBloodGroup.text.isEmpty
                          ? validate4 = true
                          : validate4 = false;
                      eDOB.text.isEmpty ? validate5 = true : validate5 = false;
                      eContactNo.text.isEmpty
                          ? validate6 = true
                          : validate6 = false;
                      eFathersContact.text.isEmpty
                          ? validate7 = true
                          : validate7 = false;
                    });
                    if (validate1 == false &&
                        validate2 == false &&
                        validate3 == false &&
                        validate4 == false &&
                        validate5 == false &&
                        validate6 == false &&
                        validate7 == false &&
                        validate8 == false) {
                      final data = await createPdf(
                          eName.text,
                          eID.text,
                          eRole.text,
                          eAddress.text,
                          eBloodGroup.text,
                          eDOB.text,
                          eContactNo.text,
                          eFathersContact.text);
                      openFile(data);
                    }
                    // savePdf("OfferLetter", data);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
