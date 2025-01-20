@interface STGenericIntentLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isLatLong;
- (NSString)name;
- (STGenericIntentLocation)initWithCoder:(id)a3;
- (STGenericIntentLocation)initWithName:(id)a3 latitude:(double)a4 longitude:(double)a5;
- (double)latitude;
- (double)longitude;
- (void)encodeWithCoder:(id)a3;
- (void)setIsLatLong:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setName:(id)a3;
@end

@implementation STGenericIntentLocation

- (void).cxx_destruct
{
}

- (void)setIsLatLong:(BOOL)a3
{
  self->_isLatLong = a3;
}

- (BOOL)isLatLong
{
  return self->_isLatLong;
}

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

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (STGenericIntentLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STGenericIntentLocation;
  v5 = [(STGenericIntentLocation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    [v4 decodeDoubleForKey:@"_latitude"];
    v5->_latitude = v8;
    [v4 decodeDoubleForKey:@"_longitude"];
    v5->_longitude = v9;
    v5->_isLatLong = [v4 decodeBoolForKey:@"_isLatLong"];
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"_name"];
  [v5 encodeDouble:@"_latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"_longitude" forKey:self->_longitude];
  [v5 encodeBool:self->_isLatLong forKey:@"_isLatLong"];
}

- (STGenericIntentLocation)initWithName:(id)a3 latitude:(double)a4 longitude:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STGenericIntentLocation;
  v10 = [(STGenericIntentLocation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_latitude = a4;
    v11->_longitude = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end