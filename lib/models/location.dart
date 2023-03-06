import './location_fact.dart';

class Location{
  // Defines location attributes. Location can have name, url, facts
  final String name;
  final String url;
  final List<LocationFact> facts;
  // Constructor. Values passed to 'this.name' goes to 'name' above 
  Location({required this.name, required this.url, required this.facts});
}