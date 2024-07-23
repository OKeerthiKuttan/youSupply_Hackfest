import 'package:flutter/material.dart';
import 'package:frontend/delAgents/MapView.dart';
import 'package:frontend/utilities.dart';

class DeliveryDetails {
  final String fromLoc;
  final double distanceFromDelAgent;

  const DeliveryDetails({
    required this.fromLoc,
    required this.distanceFromDelAgent,
  });
}

class DeliveryDetailsWidget extends StatelessWidget {
  final DeliveryDetails deliveryDetails;

  const DeliveryDetailsWidget({super.key, required this.deliveryDetails});

  @override
  Widget build(BuildContext context) {
    //random data
    List<String> toLocations = [
      '456 Elm St, Shelbyville',
      '789 Oak St, Capital City',
      '321 Pine St, Springfield',
    ];
    List<String> resourcesToCollect = [
      '5 Bags of Rice',
      '10 Bottles of Water',
      '3 Boxes of Canned Goods',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7, 10, 7, 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${deliveryDetails.fromLoc}',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.directions,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Pickup within ',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${deliveryDetails.distanceFromDelAgent} km',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapView(
                      toLocations: toLocations,
                      resourcesToCollect: resourcesToCollect,
                    ),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                backgroundColor: Color.fromARGB(255, 0, 225, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(30, 35),
              ),
              child: Text(
                'View',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class available extends StatefulWidget {
  final List<DeliveryDetails> deliveryDetailsList;

  const available({
    super.key,
    required this.deliveryDetailsList,
  });

  @override
  State<available> createState() => _availableState();
}

class _availableState extends State<available> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Available Deliveries',
          style: TextStyle(
            letterSpacing: 1.5,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                child: Container(
                  height: 300,
                  width: 410,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Map",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ...widget.deliveryDetailsList
                  .map(
                    (details) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 2),
                      child: DeliveryDetailsWidget(deliveryDetails: details),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
