import 'package:flutter/material.dart';
import '../../data_classes/vehicle.dart';
import '../../data_from_server/initData.dart';

class VehicleListView extends StatelessWidget {
  final VehicleList vehicleList;


  String convertToDirectLink(String googleDriveLink) {
    // Extract the file ID from the Google Drive link
    RegExp regExp = RegExp(r"/file/d/(.*?)/");
    String fileId = regExp.firstMatch(googleDriveLink)?.group(1) ?? '';

    // Construct the direct link
    String directLink = 'https://drive.google.com/uc?id=$fileId';

    return directLink;
  }

  VehicleListView({required this.vehicleList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          vehicleList.arrayLength(),
              (index) {
            final vehicle = vehicleList.getVehicle(index);
            return _buildVehicleItem(vehicle);
          },
        ),
      ),
    );
  }

  Widget _buildVehicleItem(Vehicle vehicle) {
    return Container(
      // height: 100,
      width: 225,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:Colors.grey[50],
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.network(
              convertToDirectLink(vehicle.imageUrl), // Assuming imageUrl is available in the Vehicle class
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              vehicle.type,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              vehicle.model,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
