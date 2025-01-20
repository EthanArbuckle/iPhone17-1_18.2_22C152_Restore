@interface TestPLClusterable
+ (id)clusterableWithLatitude:(double)a3 longitude:(double)a4 time:(double)a5;
- (CLLocationCoordinate2D)pl_coordinate;
- (NSDate)pl_date;
- (NSString)description;
- (NSString)pl_uuid;
- (TestPLClusterable)initWithLatitude:(double)a3 longitude:(double)a4 time:(double)a5;
- (double)pl_gpsHorizontalAccuracy;
@end

@implementation TestPLClusterable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pl_uuid, 0);
  objc_storeStrong((id *)&self->_pl_date, 0);
}

- (NSString)pl_uuid
{
  return self->_pl_uuid;
}

- (NSDate)pl_date
{
  return self->_pl_date;
}

- (double)pl_gpsHorizontalAccuracy
{
  return self->_pl_gpsHorizontalAccuracy;
}

- (CLLocationCoordinate2D)pl_coordinate
{
  double latitude = self->_pl_coordinate.latitude;
  double longitude = self->_pl_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)description
{
  v2 = NSString;
  CLLocationDegrees latitude = self->_pl_coordinate.latitude;
  CLLocationDegrees longitude = self->_pl_coordinate.longitude;
  v5 = [(TestPLClusterable *)self pl_date];
  v6 = [v2 stringWithFormat:@"(%20.20f,%20.20f) at %@", *(void *)&latitude, *(void *)&longitude, v5];

  return (NSString *)v6;
}

- (TestPLClusterable)initWithLatitude:(double)a3 longitude:(double)a4 time:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TestPLClusterable;
  v8 = [(TestPLClusterable *)&v12 init];
  if (v8)
  {
    v8->_pl_coordinate = CLLocationCoordinate2DMake(a3, a4);
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:a5];
    pl_date = v8->_pl_date;
    v8->_pl_date = (NSDate *)v9;

    v8->_pl_gpsHorizontalAccuracy = -1.0;
  }
  return v8;
}

+ (id)clusterableWithLatitude:(double)a3 longitude:(double)a4 time:(double)a5
{
  v5 = [[TestPLClusterable alloc] initWithLatitude:a3 longitude:a4 time:a5];
  return v5;
}

@end