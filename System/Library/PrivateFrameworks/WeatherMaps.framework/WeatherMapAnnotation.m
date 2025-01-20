@interface WeatherMapAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSString)title;
- (_TtC11WeatherMaps20WeatherMapAnnotation)init;
@end

@implementation WeatherMapAnnotation

- (NSString)title
{
  v2 = self;
  sub_20A388748();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_20A38B5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = self;
  double v3 = sub_20A388890();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.longitude = v7;
  result.latitude = v6;
  return result;
}

- (_TtC11WeatherMaps20WeatherMapAnnotation)init
{
}

- (void).cxx_destruct
{
}

@end