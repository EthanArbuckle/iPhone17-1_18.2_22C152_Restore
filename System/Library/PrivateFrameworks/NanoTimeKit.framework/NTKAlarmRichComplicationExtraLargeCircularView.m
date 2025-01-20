@interface NTKAlarmRichComplicationExtraLargeCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKAlarmRichComplicationExtraLargeCircularView)init;
- (int64_t)_backgroundFilterStyle;
- (int64_t)_foregroundFilterStyle;
@end

@implementation NTKAlarmRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKAlarmRichComplicationExtraLargeCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAlarmRichComplicationExtraLargeCircularView;
  return [(NTKAlarmRichComplicationBaseCircularView *)&v3 initWithFamily:12];
}

- (int64_t)_backgroundFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)_foregroundFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 0;
  }
  else {
    return 2;
  }
}

@end