// This is for the individual location detail
import 'package:firstproject/mocks/mock_location.dart';
import 'package:flutter/material.dart';
import 'models/location.dart';
import 'mocks/mock_location.dart';
import 'styles.dart';

class LocationDetail extends StatelessWidget{
  // parameter that gets passed to StatelessWidget. 'Location' from 'location.dart' model
  final int locationID;

  // What gets passed to 'this.location' goes to 'location' above
  LocationDetail(this.locationID);

  @override
  Widget build(BuildContext context){
    var location = MockLocation.fetch(this.locationID);

    return Scaffold(
        appBar: AppBar(
          title: Text(location.name, style: Styles.navBarTitle)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
      ));
  }

  // Render Widgets
  // Renders whole body
  List<Widget> _renderBody(BuildContext context, Location location){
    var result = <Widget>[];
    // banner image with url and height
    result.add(_bannerImage(location.url, 170.0));
    // 'addAll' takes list
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location){
    var result = <Widget>[];
    for ( int i = 0; i < location.facts.length; i++){
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }
 
  // Widgets
  Widget _sectionTitle(String text){
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(text,
      textAlign: TextAlign.left, style:
      Styles.headerLarge));
  }

  Widget _sectionText(String text){
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
      child: Text(text, style: Styles.textDefault)
    );
  }

  Widget _bannerImage(String url, double height){
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      // full width always
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }
}