@interface GEOMapRegion
+ (id)_maps_offlineCoverageRegionForRouteBounds:(id)a3;
+ (id)_maps_offlineDownloadRegionForRouteBounds:(id)a3;
+ (id)_mapstest_mapRegionWithCenterLatitude:(double)a3 longitude:(double)a4 size:(double)a5;
@end

@implementation GEOMapRegion

+ (id)_mapstest_mapRegionWithCenterLatitude:(double)a3 longitude:(double)a4 size:(double)a5
{
  id v8 = objc_alloc_init((Class)GEOMapRegion);
  double v9 = a5 * 0.5;
  [v8 setWestLng:fmin(fmax(a4 - v9, -180.0), 180.0)];
  [v8 setEastLng:fmin(fmax(v9 + a4, -180.0), 180.0)];
  [v8 setSouthLat:fmin(fmax(a3 - v9, -90.0), 90.0)];
  [v8 setNorthLat:fmin(fmax(v9 + a3, -90.0), 90.0)];

  return v8;
}

+ (id)_maps_offlineDownloadRegionForRouteBounds:(id)a3
{
  GEOMapRectForMapRegion();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v19.x = v4 + v8 * 0.5;
  v19.y = v6 + v10 * 0.5;
  MKCoordinateForMapPoint(v19);
  GEOConfigGetDouble();
  MKMapRectMakeWithRadialDistance();
  v22.origin.x = v12;
  v22.origin.y = v13;
  v22.size.width = v14;
  v22.size.height = v15;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  MKMapRect v21 = MKMapRectUnion(v20, v22);
  id v16 = [objc_alloc((Class)a1) initWithMapRect:v21.origin.x, v21.origin.y, v21.size.width, v21.size.height];

  return v16;
}

+ (id)_maps_offlineCoverageRegionForRouteBounds:(id)a3
{
  return a3;
}

@end