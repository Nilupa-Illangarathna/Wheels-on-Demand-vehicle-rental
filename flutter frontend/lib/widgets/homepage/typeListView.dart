import 'package:flutter/material.dart';

class TypeListView extends StatelessWidget {
  final List<String> types;

  TypeListView({required this.types});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: types.map((type) {
          return Padding(
            padding: const EdgeInsets.only(right: 36.0),
            child: _buildItem(type),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(String type) {
    return GestureDetector(
      onTap: () {
        // Call the filterByType method when the container is tapped
        // vehicleList.filterByType(type).printAllVehicleDetails();
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              type,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
