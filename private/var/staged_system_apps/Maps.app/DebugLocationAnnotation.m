@interface DebugLocationAnnotation
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (double)course;
- (int64_t)navType;
- (unsigned)locationType;
- (void)setLocation:(id)a3;
- (void)setLocationType:(unsigned int)a3;
- (void)setNavType:(int64_t)a3;
@end

@implementation DebugLocationAnnotation

- (CLLocationCoordinate2D)coordinate
{
  unsigned int locationType = self->_locationType;
  location = self->_location;
  if (locationType) {
    [(CLLocation *)location coordinate];
  }
  else {
    [(CLLocation *)location rawCoordinate];
  }
  result.longitude = v5;
  result.latitude = v4;
  return result;
}

- (double)course
{
  unsigned int locationType = self->_locationType;
  location = self->_location;
  if (locationType) {
    [(CLLocation *)location course];
  }
  else {
    [(CLLocation *)location rawCourse];
  }
  return result;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unsigned int)a3
{
  self->_unsigned int locationType = a3;
}

- (int64_t)navType
{
  return self->_navType;
}

- (void)setNavType:(int64_t)a3
{
  self->_navType = a3;
}

- (void).cxx_destruct
{
}

@end