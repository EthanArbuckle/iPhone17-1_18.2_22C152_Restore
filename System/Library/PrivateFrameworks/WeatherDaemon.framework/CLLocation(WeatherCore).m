@interface CLLocation(WeatherCore)
- (BOOL)shiftedReferenceFrame;
@end

@implementation CLLocation(WeatherCore)

- (BOOL)shiftedReferenceFrame
{
  return [a1 referenceFrame] == 2;
}

@end