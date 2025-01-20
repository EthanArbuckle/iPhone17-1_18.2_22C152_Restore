@interface MKMapSnapshotOptions(Weather)
- (uint64_t)configureForWeather;
- (uint64_t)configureForWeatherWind;
@end

@implementation MKMapSnapshotOptions(Weather)

- (uint64_t)configureForWeather
{
  return [a1 setMapType:109];
}

- (uint64_t)configureForWeatherWind
{
  return [a1 setMapType:110];
}

@end