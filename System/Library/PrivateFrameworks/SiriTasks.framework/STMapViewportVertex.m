@interface STMapViewportVertex
+ (BOOL)supportsSecureCoding;
- (STMapViewportVertex)initWithCoder:(id)a3;
- (double)latitude;
- (double)longitude;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation STMapViewportVertex

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

- (STMapViewportVertex)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STMapViewportVertex;
  v5 = [(STMapViewportVertex *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_latitude"];
    v5->_latitude = v6;
    [v4 decodeDoubleForKey:@"_longitude"];
    v5->_longitude = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude = self->_latitude;
  id v5 = a3;
  [v5 encodeDouble:@"_latitude" forKey:latitude];
  [v5 encodeDouble:@"_longitude" forKey:self->_longitude];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end