@interface RCPlatterMinimalWaveformView
- (id)accessibilityLabel;
- (unint64_t)numberOfSlices;
@end

@implementation RCPlatterMinimalWaveformView

- (unint64_t)numberOfSlices
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v2 platterMinimalViewSliceCount];

  return (unint64_t)v3;
}

- (id)accessibilityLabel
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"AX_JINDO_WAVEFORM" value:&stru_100228BC8 table:0];

  return v3;
}

@end