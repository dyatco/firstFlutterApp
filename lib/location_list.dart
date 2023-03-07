// This is for the list of all locations
import 'package:firstproject/location_detail.dart';
import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationList extends StatelessWidget{
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
          title: Text("Locations", style: Styles.navBarTitle)),
          body: ListView.builder(
            itemCount: this.locations.length,
            // ItemBuilder is a callback 
            itemBuilder: _listViewItemBuilder
          ),
    );
  }

// ItemBuilder follows the footprint below. Returning a widget, taking in a context and index
 Widget _listViewItemBuilder(BuildContext context, int index){
    var location = this.locations[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemThumbnail(this.locations[index]),
      title: _itemTitle(this.locations[index]),
      onTap: () => _navigationToLocationDetail(context, index));;
  }

  void _navigationToLocationDetail(BuildContext context, int locationID){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => 
        LocationDetail(locationID), 
      ));
  }

  Widget _itemThumbnail(Location location){
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(Location location){
    return Text('${location.name}', style: Styles.textDefault);
  }
}