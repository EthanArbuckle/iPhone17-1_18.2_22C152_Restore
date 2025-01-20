@interface GEOURLCamera
- (MKMapCamera)mapCamera;
@end

@implementation GEOURLCamera

- (MKMapCamera)mapCamera
{
  id v3 = objc_alloc_init((Class)MKMapCamera);
  [(GEOURLCamera *)self latitude];
  CLLocationDegrees v5 = v4;
  [(GEOURLCamera *)self longitude];
  CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(v5, v6);
  [v3 setCenterCoordinate:v7.latitude, v7.longitude];
  [(GEOURLCamera *)self heading];
  [v3 setHeading:];
  [(GEOURLCamera *)self pitch];
  [v3 setPitch:];
  [(GEOURLCamera *)self altitude];
  [v3 setAltitude:];

  return (MKMapCamera *)v3;
}

@end