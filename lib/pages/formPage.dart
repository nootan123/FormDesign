import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:forms/customInputForm.dart';
import 'package:forms/fileLists.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String dropDownValue = 'A';

  Widget _buildFilePicker(String key) {
    return ElevatedButton(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        // if file found, get file map
        if (result != null) {
          PlatformFile file = result.files.first;
          int index = files.indexWhere((element) => element["key"] == key);
          List<Map<String, dynamic>> tempFileList = files;
          tempFileList[index]["file"] = file;
          setState(() {
            files = tempFileList;
          });
        } else {}
      },
      child: Text(
        'Choose File',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Apply Now",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Note: * fields are mandatory please input carefully",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customInputForm('First Name', '', '', true),
                        customInputForm('Middle Name', '', '', true),
                        customInputForm('Last Name', '', '', true),
                        customDropDown('Gender', true),
                        customInputForm(
                            'Date of Birth', 'yyyy-mm-dd', '', true),
                        customDropDown('Emirates', true),
                        customInputForm('Contact Number', '', '', true),
                        customInputForm('Emirates ID Number', '', '', true),
                        customInputForm(
                            'EID Expiry Date', 'yyyy-mm-dd', '', true),
                        customDropDown('Resident Type', true),
                        customInputForm(
                            'Company/Business/Sponser', '', '', true),
                        customInputForm('Profession/Designation', '', '', true),
                        customInputForm('Your Expertise', '', '', true),
                        customDropDown('District in Nepal', true),
                        customDropDown('Address in Nepal', true),
                        customDropDown('Emergency Contact Name', true),
                        customDropDown('Emergency Contact Number', true),
                        customDropDown('Passport Number', true),
                        customDropDown('Passport Expiry Date', true),
                        customFilePicker("1"),
                        customFilePicker("2"),
                        customFilePicker("3"),
                        customFilePicker("4"),
                        customDropDown('Membership Type ', true),
                        customDropDown('Payment Method', true),
                        customDropDown('Refrence', true),
                        customFilePicker("5"),
                        customInputForm(
                            'Email Address',
                            '',
                            "We'll never share your email with anyone else",
                            true),
                        customInputForm('Create Password', '',
                            "Password should be minimum 8 characters", true),
                        customInputForm('confirm Password', '', '', true),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 120,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Submit'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customFilePicker(String key) {
    int targetIndex = files.indexWhere((file) => file["key"] == key);

    if (targetIndex == -1) return SizedBox();
    Map<String, dynamic> fileData = files[targetIndex];

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  fileData["label"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                (fileData["required"] == true)
                    ? Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Row(
                children: [
                  _buildFilePicker(key),
                  SizedBox(width: 30),
                  Container(
                    width: 150,
                    child: Text(
                      fileData["file"] == null
                          ? "Select File"
                          : fileData["file"].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding customDropDown(String label, bool required) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                (required == true)
                    ? Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              // value: dropDownValue,
              hint: Text('----Select----'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue = newValue!;
                });
              },
              items: <String>['A', 'B', 'C']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
