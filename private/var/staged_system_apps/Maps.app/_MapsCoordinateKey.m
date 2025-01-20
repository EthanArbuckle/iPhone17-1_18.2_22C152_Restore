@interface _MapsCoordinateKey
+ (id)coordinateKeyFromCoordinate:(CLLocationCoordinate2D)a3;
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (id)description;
- (unint64_t)hash;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation _MapsCoordinateKey

+ (id)coordinateKeyFromCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setCoordinate:latitude, longitude];

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p %f, %f>", objc_opt_class(), self, *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double latitude = self->_coordinate.latitude;
    [v5 coordinate];
    if (vabdd_f64(latitude, v7) <= 0.000000999999997)
    {
      double longitude = self->_coordinate.longitude;
      [v5 coordinate];
      BOOL v8 = vabdd_f64(longitude, v10) <= 0.000000999999997;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)self->_coordinate.longitude ^ (unint64_t)self->_coordinate.latitude;
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

@end