@interface PLQueryCircularRegion
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (PLQueryCircularRegion)initWithCenterLatitude:(double)a3 centerLongitude:(double)a4 radius:(double)a5 identifier:(id)a6;
- (PLQueryCircularRegion)initWithCoder:(id)a3;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLQueryCircularRegion

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)radius
{
  return self->_radius;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"lat - %f, lng - %f, radius - %f, identifier - %@", *(void *)&self->_latitude, *(void *)&self->_longitude, *(void *)&self->_radius, self->_identifier];
}

- (PLQueryCircularRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLQueryCircularRegion;
  v5 = [(PLQueryCircularRegion *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latitude"];
    [v6 doubleValue];
    v5->_latitude = v7;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longitude"];
    [v8 doubleValue];
    v5->_longitude = v9;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radius"];
    [v10 doubleValue];
    v5->_radius = v11;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  double latitude = self->_latitude;
  id v9 = a3;
  v6 = [v4 numberWithDouble:latitude];
  [v9 encodeObject:v6 forKey:@"latitude"];

  double v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_longitude];
  [v9 encodeObject:v7 forKey:@"longitude"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_radius];
  [v9 encodeObject:v8 forKey:@"radius"];

  [v9 encodeObject:self->_identifier forKey:@"identifier"];
}

- (PLQueryCircularRegion)initWithCenterLatitude:(double)a3 centerLongitude:(double)a4 radius:(double)a5 identifier:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLQueryCircularRegion;
  uint64_t v12 = [(PLQueryCircularRegion *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_double latitude = a3;
    v12->_longitude = a4;
    v12->_radius = a5;
    objc_storeStrong((id *)&v12->_identifier, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end