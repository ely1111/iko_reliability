import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, String> maximoServerDomains = {
  'PROD': 'nscandacmaxapp1',
  'TEST': 'nsmaxim1app1',
  'DEV': 'nscandacmaxdev1',
};

// http://nsmaxim1app1.na.iko/maxrest/oslc/os/mxl_pm?oslc.select=pmnum,siteid&oslc.pageSize=10&oslc.where=pmnum="A0001D1INRE"%20and%20siteid="AA"&_lid=corcoop3&_lpwd=maximo

Future<bool> existPmNumberMaximo(
    String pmNumber, String siteid, String env) async {
  final url =
      'http://${maximoServerDomains[env]}.na.iko/maxrest/oslc/os/mxl_pm?oslc.select=pmnum,siteid&oslc.pageSize=10&oslc.where=pmnum="$pmNumber"%20and%20siteid="$siteid"&_lid=corcoop3&_lpwd=maximo';
  // TODO login management
  // save login in settings box
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var parsed = jsonDecode(response.body);
    if (parsed['rdf:member'] == null) {
      return true;
    }
  } else {
    print('Failed to check Maximo');
  }
  return false;
}

Future<bool> existJpNumberMaximo(String jpNumber, String env) async {
  final url =
      'http://${maximoServerDomains[env]}.na.iko/maxrest/oslc/os/mxl_jobplan?oslc.select=jpnum&oslc.pageSize=10&oslc.where=jpnum="$jpNumber"&_lid=corcoop3&_lpwd=maximo';
  // TODO login management
  // save login in settings box
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var parsed = jsonDecode(response.body);
    if (parsed['rdf:member'] == null) {
      return true;
    }
  } else {
    print('Failed to check Maximo');
  }
  return false;
}

Future<bool> existRouteNumberMaximo(
    String routeNumber, String siteid, String env) async {
  final url =
      'http://${maximoServerDomains[env]}.na.iko/maxrest/oslc/os/mxl_routes?oslc.select=route,siteid&oslc.pageSize=10&oslc.where=route="$routeNumber"%20and%20siteid="$siteid"&_lid=corcoop3&_lpwd=maximo';
  // TODO login management
  // save login in settings box
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var parsed = jsonDecode(response.body);
    if (parsed['rdf:member'] == null) {
      return true;
    }
  } else {
    print('Failed to check Maximo');
  }
  return false;
}