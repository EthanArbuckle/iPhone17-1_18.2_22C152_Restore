@interface MKMapCamera
- (GEOURLCamera)geoCamera;
@end

@implementation MKMapCamera

- (GEOURLCamera)geoCamera
{
  id v3 = objc_alloc_init((Class)GEOURLCamera);
  [(MKMapCamera *)self centerCoordinate];
  [v3 setLatitude:];
  [(MKMapCamera *)self centerCoordinate];
  [v3 setLongitude:v4];
  [(MKMapCamera *)self heading];
  [v3 setHeading:];
  [(MKMapCamera *)self pitch];
  [v3 setPitch:];
  [(MKMapCamera *)self altitude];
  [v3 setAltitude:];
  [v3 latitude];
  [v3 longitude];
  [v3 heading];
  [v3 pitch];
  [v3 altitude];
  id v5 = v3;

  return (GEOURLCamera *)v5;
}

@end