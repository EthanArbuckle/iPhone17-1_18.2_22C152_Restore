@interface CircleAnnotation
- (CLLocationCoordinate2D)coordinate;
- (CircleAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)radius;
- (double)red;
- (void)setColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setRadius:(double)a3;
@end

@implementation CircleAnnotation

- (CircleAnnotation)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  v6.receiver = self;
  v6.super_class = (Class)CircleAnnotation;
  result = [(CircleAnnotation *)&v6 init];
  if (result)
  {
    result->_coordinate.CLLocationDegrees latitude = latitude;
    result->_coordinate.CLLocationDegrees longitude = longitude;
  }
  return result;
}

- (void)setColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  self->_color[0] = a3;
  self->_color[1] = a4;
  self->_color[2] = a5;
  self->_color[3] = a6;
}

- (double)red
{
  return self->_color[0];
}

- (double)green
{
  return self->_color[1];
}

- (double)blue
{
  return self->_color[2];
}

- (double)alpha
{
  return self->_color[3];
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

@end