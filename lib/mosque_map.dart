import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/widgets.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late Position currentPosition;

  Completer<GoogleMapController> _controller = Completer();

  final List<Marker> _marker = <Marker>[];

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission().then((value) {});
    return await Geolocator.getCurrentPosition();
  }

  getAllNearbyMosques() async {
    getUserLocation().then((value) async {
      LatLng latLng = LatLng(value.latitude, value.longitude);
      Location location = Location(lat: latLng.latitude, lng: latLng.longitude);

      //  These Lines of code provide the mosque near by me ......................
      final places = GoogleMapsPlaces(apiKey: "Your_ApiKey");
      PlacesSearchResponse response =
          await places.searchNearbyWithRadius(location, 1000, type: "mosque");
      // print("Starts here");
      // print(response.errorMessage);
      // print(response.status);
      // print(response.results.length);
      // print(response.results[1]);
      // print("Ends here");
      // for (var place in response.results) {
      //   print(place.name);
      //   print(LatLng(place.geometry!.location.lat, place.geometry!.location.lng));
      //   print(_marker.length);
      //   print(place.id);
      // }
      final BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)),
        'images/night.png',
      );
      for (var place in response.results) {
        setState(() {
          //print("asalaam");
          _marker.add(Marker(
            markerId: MarkerId(place.name),
            visible: true,
            draggable: false,
            position: LatLng(
                place.geometry!.location.lat, place.geometry!.location.lng),
            icon: customIcon,
            infoWindow: InfoWindow(
              title: place.name,
              snippet: place.vicinity,
            ),

            //position: LatLng(value.latitude,
            //  value.longitude)
          ));
        });
      }
      // print(_marker.length);
    });
  }

  Image myImage = Image.asset(
    'images/night.png',
    height: 60,
    width: 60,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNearbyMosques();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          title: Text("Mosque Near Me"),
          actions: <Widget>[
            IconButton(
              iconSize: 80,
              icon: myImage,
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: GoogleMap(
          compassEnabled: true,
          initialCameraPosition:
              CameraPosition(target: LatLng(33.6417, 72.9836), zoom: 5),
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) async {
            _controller.complete(controller);
            setState(() {
              getUserLocation().then((value) async {
                _marker.add(Marker(
                    markerId: MarkerId("1"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(title: "My Location")));
              });
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              getUserLocation().then((value) async {
                _marker.add(Marker(
                    markerId: MarkerId("1"),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(title: "My Location")));
                CameraPosition cameraPosition = CameraPosition(
                    zoom: 15, target: LatLng(value.latitude, value.longitude));
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
            backgroundColor: Colors.green,
            child: Icon(
              Icons.my_location_sharp,
            )));
  }
}
