@interface MapsRippleAnnotation
- (CLLocationCoordinate2D)coordinate;
- (MapsRippleAnnotation)init;
- (MapsRippleView)rippleView;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation MapsRippleAnnotation

- (MapsRippleAnnotation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsRippleAnnotation;
  v2 = [(MapsRippleAnnotation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    rippleView = v2->_rippleView;
    v2->_rippleView = (MapsRippleView *)v3;

    [(MapsRippleView *)v2->_rippleView setLooping:1];
  }
  return v2;
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

- (MapsRippleView)rippleView
{
  return self->_rippleView;
}

- (void).cxx_destruct
{
}

@end