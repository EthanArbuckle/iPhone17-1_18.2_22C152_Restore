@interface NSValue
+ (NSValue)valueWithCoordinate:(CLLocationCoordinate2D)a3;
- (CLLocationCoordinate2D)coordinateValue;
@end

@implementation NSValue

+ (NSValue)valueWithCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationCoordinate2D v5 = a3;
  v3 = +[NSValue valueWithBytes:&v5 objCType:"{CLLocationCoordinate2D=dd}"];
  return (NSValue *)v3;
}

- (CLLocationCoordinate2D)coordinateValue
{
  double v4 = 0.0;
  double v5 = 0.0;
  [(NSValue *)self getValue:&v4];
  double v2 = v4;
  double v3 = v5;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

@end