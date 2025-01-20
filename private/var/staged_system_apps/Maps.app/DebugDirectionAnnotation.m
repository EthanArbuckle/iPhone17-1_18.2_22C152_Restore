@interface DebugDirectionAnnotation
- (CGSize)size;
- (CLLocationCoordinate2D)coordinate;
- (UIColor)color;
- (double)direction;
- (double)fov;
- (void)setColor:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDirection:(double)a3;
- (void)setFov:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation DebugDirectionAnnotation

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

- (double)direction
{
  return self->_direction;
}

- (void)setDirection:(double)a3
{
  self->_direction = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)fov
{
  return self->_fov;
}

- (void)setFov:(double)a3
{
  self->_fov = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end