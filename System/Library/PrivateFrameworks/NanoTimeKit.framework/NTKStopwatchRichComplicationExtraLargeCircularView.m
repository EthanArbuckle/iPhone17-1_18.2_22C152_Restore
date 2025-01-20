@interface NTKStopwatchRichComplicationExtraLargeCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKStopwatchRichComplicationExtraLargeCircularView)init;
@end

@implementation NTKStopwatchRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKStopwatchRichComplicationExtraLargeCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKStopwatchRichComplicationExtraLargeCircularView;
  return [(NTKStopwatchRichComplicationBaseCircularView *)&v3 initWithFamily:12];
}

@end