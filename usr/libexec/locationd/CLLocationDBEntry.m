@interface CLLocationDBEntry
- (CLLocationDBEntry)init;
- (double)elevation;
- (double)interpPressure;
- (double)latitude;
- (double)longitude;
- (double)timestamp;
- (double)verticalAccuracy;
- (void)setElevation:(double)a3;
- (void)setInterpPressure:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation CLLocationDBEntry

- (CLLocationDBEntry)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLLocationDBEntry;
  result = [(CLLocationDBEntry *)&v4 init];
  if (result)
  {
    int64x2_t v3 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&result->_timestamp = v3;
    *(int64x2_t *)&result->_verticalAccuracy = v3;
    *(int64x2_t *)&result->_latitude = v3;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)elevation
{
  return self->_elevation;
}

- (void)setElevation:(double)a3
{
  self->_elevation = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (double)interpPressure
{
  return self->_interpPressure;
}

- (void)setInterpPressure:(double)a3
{
  self->_interpPressure = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

@end