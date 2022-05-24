// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:interviews/models/allintrview.dart';
import 'package:interviews/models/myinterviews.dart';
import 'package:interviews/screens/add_Interview_screen.dart';

class InterviewsScreen extends StatefulWidget {
  InterviewsScreen({Key? key}) : super(key: key);

  @override
  State<InterviewsScreen> createState() => _InterviewsScreenState();
}

class _InterviewsScreenState extends State<InterviewsScreen> {
  late List<MyInterviews> myinterviews;
  int? sortColumnIndex;
  bool isAcsending = false;
  String dropdownValue = 'All';
  String dropdownValue2 = 'All';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.myinterviews = List.of(interviewList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'interview',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  MaterialButton(
                    color: Colors.blueAccent,
                    child: Text('ADD interview'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddInterviewScreen(),));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * (1 / 5),
                  decoration: BoxDecoration(
                      color: Color(0xFF2A2D3E),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              'What are you looking for..?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Text(
                              'Company',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.13,
                            ),
                            Text(
                              'Vacant',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              child: TextField(),
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),

                              elevation: 16,
                              // style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,

                                //   color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'All',
                                'Google',
                                'face',
                                'twitter'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.12,
                            ),
                            DropdownButton<String>(
                              value: dropdownValue2,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              // style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                //   color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                              items: <String>[
                                'All',
                                'Google',
                                'face',
                                'twitter'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            MaterialButton(
                                child: Text('Search'),
                                color: Colors.blueAccent,
                                onPressed: () {})
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: buildDataTble())),
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    color: Color(0xFF2A2D3E),
                    borderRadius: BorderRadius.circular(25)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDataTble() {
    final List<String> columns = [
      'interview',
      'name',
      'company',
      'vacant',
      'employee1',
      'employee2',
      'employee3',
      'model',
      'Date',
      'result'
    ];
    return DataTable(
      // sortAscending: isAcsending,
      // sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(myinterviews),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) =>
          DataColumn(/* onSort: onSort */ label: Text(column)))
      .toList();

  List<DataRow> getRows(List<MyInterviews> myinterviews) =>
      myinterviews.map((MyInterviews my) {
        final cells = [
          my.interviewid,
          my.name,
          my.companyName,
          my.vacant,
          my.employee1,
          my.employee2,
          my.employee3,
          my.model,
          my.Date,
          my.result
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  /*     void onSort(int columnIndex, bool ascending){
        setState(() {
          this.sortColumnIndex=columnIndex;
          this.isAcsending=ascending;
        });
      } */
}
