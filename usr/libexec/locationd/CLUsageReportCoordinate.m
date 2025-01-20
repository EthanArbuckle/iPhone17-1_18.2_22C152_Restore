@interface CLUsageReportCoordinate
+ (BOOL)supportsSecureCoding;
- (CLUsageReportCoordinate)initWithCoder:(id)a3;
- (CLUsageReportCoordinate)initWithLatitude:(double)a3 longitude:(double)a4;
- (double)latitude;
- (double)longitude;
- (void)encodeWithCoder:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation CLUsageReportCoordinate

- (CLUsageReportCoordinate)initWithLatitude:(double)a3 longitude:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLUsageReportCoordinate;
  v6 = [(CLUsageReportCoordinate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CLUsageReportCoordinate *)v6 setLatitude:a3];
    [(CLUsageReportCoordinate *)v7 setLongitude:a4];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLUsageReportCoordinate)initWithCoder:(id)a3
{
  [a3 decodeDoubleForKey:@"CL2dLocationLatCodingKey"];
  double v6 = v5;
  [a3 decodeDoubleForKey:@"CL2dLocationLonCodingKey"];

  return [(CLUsageReportCoordinate *)self initWithLatitude:v6 longitude:v7];
}

- (void)encodeWithCoder:(id)a3
{
  [(CLUsageReportCoordinate *)self latitude];
  [a3 encodeDouble:@"CL2dLocationLatCodingKey" forKey:@"CL2dLocationLatCodingKey"];
  [(CLUsageReportCoordinate *)self longitude];

  [a3 encodeDouble:@"CL2dLocationLonCodingKey" forKey:@"CL2dLocationLonCodingKey"];
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