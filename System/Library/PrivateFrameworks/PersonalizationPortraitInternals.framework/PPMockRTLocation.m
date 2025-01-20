@interface PPMockRTLocation
- (double)latitude;
- (double)longitude;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation PPMockRTLocation

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)latitude
{
  return self->_latitude;
}

@end