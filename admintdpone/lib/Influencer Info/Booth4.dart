import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoothFourInfo extends StatefulWidget {
  const BoothFourInfo({super.key});

  @override
  State<BoothFourInfo> createState() => _BoothFourInfoState();
}

class _BoothFourInfoState extends State<BoothFourInfo> {
  final CollectionReference _reference =
  FirebaseFirestore.instance.collection('booth4');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        title: const Text(
          'Influencer Info Booth 4',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 20, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _reference.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  List<String> influencerSelections = [];
                  for (var doc in snapshot.data!.docs) {
                    influencerSelections.add(doc['leaderOne']);
                    influencerSelections.add(doc['leaderTwo']);
                    influencerSelections.add(doc['leaderThree']);
                  }

                  Map<String, int> influencerCount = {};
                  for (var selection in influencerSelections) {
                    if (selection.isNotEmpty) {
                      influencerCount[selection] =
                          (influencerCount[selection] ?? 0) + 1;
                    }
                  }

                  List<MapEntry<String, int>> sortedInfluencers =
                  influencerCount.entries.toList()
                    ..sort((a, b) => b.value.compareTo(a.value));

                  // Create rows for the DataTable
                  List<DataRow> rows = [];
                  for (var i = 0; i < sortedInfluencers.length; i++) {
                    rows.add(
                      DataRow(
                        cells: [
                          DataCell(Text('${i + 1}')),
                          // S.NO
                          DataCell(Text(sortedInfluencers[i].key)),
                          // Name
                          DataCell(Text('${sortedInfluencers[i].value}')),
                          // Count
                        ],
                      ),
                    );
                  }

                  // Create the DataTable
                  DataTable table = DataTable(
                    columns: const [
                      DataColumn(label: Text('S.NO')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Count')),
                    ],
                    rows: rows,
                  );

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.orange[600],
                      child: SingleChildScrollView(
                        child: table,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
