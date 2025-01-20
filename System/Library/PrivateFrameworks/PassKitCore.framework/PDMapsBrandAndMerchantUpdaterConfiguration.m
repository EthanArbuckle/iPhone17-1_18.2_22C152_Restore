@interface PDMapsBrandAndMerchantUpdaterConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (PDMapsBrandAndMerchantUpdaterConfiguration)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(CLLocationCoordinate2D)a5;
- (id)description;
- (int)resultProviderID;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setResultProviderID:(int)a3;
@end

@implementation PDMapsBrandAndMerchantUpdaterConfiguration

- (PDMapsBrandAndMerchantUpdaterConfiguration)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  v10.receiver = self;
  v10.super_class = (Class)PDMapsBrandAndMerchantUpdaterConfiguration;
  result = [(PDMapsBrandAndMerchantUpdaterConfiguration *)&v10 init];
  if (result)
  {
    result->_muid = a3;
    result->_resultProviderID = a4;
    result->_coordinate.CLLocationDegrees latitude = latitude;
    result->_coordinate.CLLocationDegrees longitude = longitude;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDMapsBrandAndMerchantUpdaterConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(PDMapsBrandAndMerchantUpdaterConfiguration *)self isEqualToConfiguration:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  return a3 && self->_muid == *((void *)a3 + 2);
}

- (unint64_t)hash
{
  return PKIntegerHash();
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", @"<%@: %p; ",
         objc_opt_class(),
         self);
  objc_msgSend(v3, "appendFormat:", @"muid: %ld; ", self->_muid);
  objc_msgSend(v3, "appendFormat:", @"resultProviderID: '%ld'; ", self->_resultProviderID);
  objc_msgSend(v3, "appendFormat:", @"latitude: '%ld'; ", (uint64_t)self->_coordinate.latitude);
  objc_msgSend(v3, "appendFormat:", @"longitude: '%ld'; ", (uint64_t)self->_coordinate.longitude);
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)resultProviderID
{
  return self->_resultProviderID;
}

- (void)setResultProviderID:(int)a3
{
  self->_resultProviderID = a3;
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