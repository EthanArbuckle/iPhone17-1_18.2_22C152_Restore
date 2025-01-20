@interface RAPTransitLinesAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSString)title;
- (RAPTransitLinesAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4;
@end

@implementation RAPTransitLinesAnnotation

- (RAPTransitLinesAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RAPTransitLinesAnnotation;
  v8 = [(RAPTransitLinesAnnotation *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_coordinate.CLLocationDegrees latitude = latitude;
    v8->_coordinate.CLLocationDegrees longitude = longitude;
    v10 = (NSString *)[v7 copy];
    title = v9->_title;
    v9->_title = v10;
  }
  return v9;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end