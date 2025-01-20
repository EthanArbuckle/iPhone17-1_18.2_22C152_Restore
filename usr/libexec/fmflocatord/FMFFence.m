@interface FMFFence
- (double)latitude;
- (double)longitude;
- (double)radius;
@end

@implementation FMFFence

- (double)latitude
{
  v2 = [(FMFFence *)self location];
  [v2 coordinate];
  double v4 = v3;

  return v4;
}

- (double)longitude
{
  v2 = [(FMFFence *)self location];
  [v2 coordinate];
  double v4 = v3;

  return v4;
}

- (double)radius
{
  v2 = [(FMFFence *)self location];
  [v2 horizontalAccuracy];
  double v4 = v3;

  return v4;
}

@end