// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});


var mapbox = require('sc.mapbox');

var mapView = mapbox.createView({
	map: 'control-room', //'tiles.snowcietyapp.com/snowciety',
	//map: 'geography-class',
	minZoom: 7,
	maxZoom: 12,
	zoom: 10,
	centerLatLng: [20.7972,-88.1598],
	width: Ti.UI.FILL,
	height: Ti.UI.FILL,
	hideAttribution: true  //defaults to: false. See Mapbox terms and conditions before removing
});

win.add(mapView);
win.open();


var marker = mapView.createMarker({
	latlng: [20.7972,-88.1598],
});
 
