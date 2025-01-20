@interface RCPlatterMinimalWaveformView
- (unint64_t)numberOfSlices;
@end

@implementation RCPlatterMinimalWaveformView

- (unint64_t)numberOfSlices
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 platterMinimalViewSliceCount];

  return (unint64_t)v3;
}

@end