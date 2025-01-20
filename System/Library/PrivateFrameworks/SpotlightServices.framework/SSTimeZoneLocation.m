@interface SSTimeZoneLocation
+ (id)timeZoneWithLocation:(id)a3 timeZone:(id)a4;
+ (id)timeZoneWithLocation:(id)a3 timeZoneName:(id)a4;
- (BOOL)isCapital;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSString)countryCode;
- (NSString)countryName;
- (NSString)location;
- (NSTimeZone)timeZone;
- (SSTimeZoneLocation)initWithLocation:(id)a3 timeZone:(id)a4;
- (id)description;
- (void)setCountryCode:(id)a3;
- (void)setCountryName:(id)a3;
- (void)setIsCapital:(BOOL)a3;
- (void)setLatitude:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation SSTimeZoneLocation

+ (id)timeZoneWithLocation:(id)a3 timeZoneName:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CAF0];
  id v7 = a3;
  v8 = [v6 timeZoneWithName:a4];
  v9 = (void *)[objc_alloc((Class)a1) initWithLocation:v7 timeZone:v8];

  return v9;
}

+ (id)timeZoneWithLocation:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithLocation:v7 timeZone:v6];

  return v8;
}

- (SSTimeZoneLocation)initWithLocation:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SSTimeZoneLocation;
  v8 = [(SSTimeZoneLocation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SSTimeZoneLocation *)v8 setLocation:v6];
    [(SSTimeZoneLocation *)v9 setTimeZone:v7];
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SSTimeZoneLocation *)self location];
  v5 = [(SSTimeZoneLocation *)self timeZone];
  id v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (BOOL)isCapital
{
  return self->_isCapital;
}

- (void)setIsCapital:(BOOL)a3
{
  self->_isCapital = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end