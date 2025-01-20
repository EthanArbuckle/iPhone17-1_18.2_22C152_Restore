@interface SharedTripUserAnnotation
- (BOOL)showsBalloonCallout;
- (CLLocationCoordinate2D)coordinate;
- (GEOSharedNavState)state;
- (NSString)title;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setState:(id)a3;
@end

@implementation SharedTripUserAnnotation

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
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
  return (NSString *)&stru_101324E70;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (GEOSharedNavState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end