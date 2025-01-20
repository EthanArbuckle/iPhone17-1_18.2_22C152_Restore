@interface POIShapeFactory
+ (id)composedWaypointPOIShapeWithMapView:(id)a3 composedWaypoint:(id)a4;
+ (id)customPOIShapeWithMapView:(id)a3 customFeatureAnnotation:(id)a4;
+ (id)searchResultWaypointPOIShapeWithMapView:(id)a3 searchResult:(id)a4;
+ (id)userLocationPOIShapeWithMapView:(id)a3;
+ (id)userLocationPOIShapeWithMapView:(id)a3 coordinate:(CLLocationCoordinate2D)a4;
@end

@implementation POIShapeFactory

+ (id)userLocationPOIShapeWithMapView:(id)a3
{
  id v3 = a3;
  v4 = -[POIShapeUserLocation initWithMapView:coordinate:]([POIShapeUserLocation alloc], "initWithMapView:coordinate:", v3, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);

  return v4;
}

+ (id)userLocationPOIShapeWithMapView:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v6 = a3;
  v7 = -[POIShapeUserLocation initWithMapView:coordinate:]([POIShapeUserLocation alloc], "initWithMapView:coordinate:", v6, latitude, longitude);

  return v7;
}

+ (id)customPOIShapeWithMapView:(id)a3 customFeatureAnnotation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[POIShapeCustomFeatureAnnotation alloc] initWithMapView:v6 customFeatureAnnotation:v5];

  return v7;
}

+ (id)composedWaypointPOIShapeWithMapView:(id)a3 composedWaypoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isCurrentLocation])
  {
    [v6 coordinate];
    [a1 userLocationPOIShapeWithMapView:v7];
    v8 = (POIShapeComposedWaypoint *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = [[POIShapeComposedWaypoint alloc] initWithMapView:v7 composedWaypoint:v6];
  }
  v9 = v8;

  return v9;
}

+ (id)searchResultWaypointPOIShapeWithMapView:(id)a3 searchResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isDynamicCurrentLocation])
  {
    [v6 coordinate];
    [a1 userLocationPOIShapeWithMapView:v7];
    v8 = (POIShapeSearchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = [[POIShapeSearchResult alloc] initWithMapView:v7 searchResult:v6];
  }
  v9 = v8;

  return v9;
}

@end