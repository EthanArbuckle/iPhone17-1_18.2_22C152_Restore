@interface CLLocation
- (id)distanceFromLat:(id)a3 andLon:(id)a4;
- (id)getLatitude;
- (id)getLongitude;
@end

@implementation CLLocation

- (id)distanceFromLat:(id)a3 andLon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)CLLocation);
  [v7 floatValue];
  float v10 = v9;

  [v6 floatValue];
  float v12 = v11;

  id v13 = [v8 initWithLatitude:v10 longitude:v12];
  [(CLLocation *)self distanceFromLocation:v13];
  v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v14;
}

- (id)getLatitude
{
  [(CLLocation *)self coordinate];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (id)getLongitude
{
  [(CLLocation *)self coordinate];

  return +[NSNumber numberWithDouble:v2];
}

@end