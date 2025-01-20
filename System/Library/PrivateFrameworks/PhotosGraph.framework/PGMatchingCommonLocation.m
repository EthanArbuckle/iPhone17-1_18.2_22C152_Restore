@interface PGMatchingCommonLocation
+ (id)matchingCommonLocationWithLabel:(id)a3 coordinate:(CLLocationCoordinate2D)a4 forAddressCoordinate:(CLLocationCoordinate2D)a5;
- (CLLocationCoordinate2D)addressCoordinate;
- (CLLocationCoordinate2D)coordinate;
- (NSString)label;
- (double)distanceBetweenCoordinates;
- (void)setAddressCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLabel:(id)a3;
@end

@implementation PGMatchingCommonLocation

- (void).cxx_destruct
{
}

- (void)setAddressCoordinate:(CLLocationCoordinate2D)a3
{
  self->_addressCoordinate = a3;
}

- (CLLocationCoordinate2D)addressCoordinate
{
  double latitude = self->_addressCoordinate.latitude;
  double longitude = self->_addressCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

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

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (double)distanceBetweenCoordinates
{
  double result = self->_distance;
  if (result == 1.79769313e308)
  {
    CLLocationCoordinate2DGetDistanceFrom();
    self->_distance = result;
  }
  return result;
}

+ (id)matchingCommonLocationWithLabel:(id)a3 coordinate:(CLLocationCoordinate2D)a4 forAddressCoordinate:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  double v7 = a4.longitude;
  double v8 = a4.latitude;
  id v9 = a3;
  objc_opt_class();
  v10 = objc_opt_new();
  [v10 setLabel:v9];

  objc_msgSend(v10, "setCoordinate:", v8, v7);
  objc_msgSend(v10, "setAddressCoordinate:", latitude, longitude);
  v10[1] = 0x7FEFFFFFFFFFFFFFLL;
  return v10;
}

@end