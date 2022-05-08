import 'package:flutter/material.dart';

Widget customInputForm(
  String label,
  String hintText,
  String info,
  bool required,
) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(
      // width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          Text(
            info,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
