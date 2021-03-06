/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ScMapboxView.h"
#import "Mapbox.h"
#import <RMOpenStreetMapSource.h>


@implementation ScMapboxView

-(void)createView {
	NSLog(@"[Mapbox] createView");
    
   // RMGenericMapSource *mapSource = [[RMGenericMapSource alloc] initWithHost:host tileCacheKey:@"snowcietyTiles" minZoom:minZoom maxZoom:maxZoom];
    
    //use offline map stored locally
    RMMBTilesSource *mapSource = [[RMMBTilesSource alloc] initWithTileSetResource:host ofType:@"mbtiles"];
    
    mapView = [[RMMapView alloc] initWithFrame:[self frame] andTilesource:mapSource];
    
    [mapView setZoom:zoom];
    [mapView setMaxZoom:maxZoom];

    NSLog(@"zoom %f", zoom);
    NSLog(@"minZoom %f", minZoom);
    NSLog(@"maxZoom %f", maxZoom);
    
    //mapView.zoom = zoom;
    //mapView.minZoom = minZoom;
    //mapView.maxZoom = maxZoom;
    
    mapView.centerCoordinate = CLLocationCoordinate2DMake(centerLat, centerLng);
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    mapView.hideAttribution = hideAttribution;
    
    [self addSubview:mapView];
}

-(RMPointAnnotation *)createMarker:(id)args {
    NSLog(@"[Mapbox] createMarker");
    
    RMPointAnnotation *annotation = [RMPointAnnotation annotationWithMapView:mapView coordinate:mapView.centerCoordinate andTitle:@"Hello, Erik!"];
    
    [mapView addAnnotation:annotation];
    
    return annotation;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (mapView!=nil)
    {
        [TiUtils setView:mapView positionRect:bounds];
    }
}

-(void)setMap_:(id)_host {
    host = _host;
}

-(void)setCenterLatLng_:(id)_center {
    centerLat = [TiUtils floatValue:[_center objectAtIndex:0]];
    centerLng = [TiUtils floatValue:[_center objectAtIndex:1]];
}

-(void)setHideAttribution_:(id)_hideAttribution {
    hideAttribution = [TiUtils boolValue:_hideAttribution def:false];
}

-(void)setMinZoom_:(id)_minZoom {
    minZoom = [TiUtils floatValue:_minZoom];
}

-(void)setMaxZoom_:(id)_maxZoom {
    maxZoom = [TiUtils floatValue:_maxZoom];
}

-(void)setZoom_:(id)_zoom {
    zoom = [TiUtils floatValue:_zoom];
    NSLog(@"setZoom %@", _zoom);
}

@end
