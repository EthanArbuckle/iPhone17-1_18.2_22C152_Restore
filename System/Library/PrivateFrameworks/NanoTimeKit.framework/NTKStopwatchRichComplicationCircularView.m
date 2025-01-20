@interface NTKStopwatchRichComplicationCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKStopwatchRichComplicationCircularView)init;
@end

@implementation NTKStopwatchRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKStopwatchRichComplicationCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKStopwatchRichComplicationCircularView;
  return [(NTKStopwatchRichComplicationBaseCircularView *)&v3 initWithFamily:10];
}

@end