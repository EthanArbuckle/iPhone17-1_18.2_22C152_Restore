@interface NTKWorldClockRichComplicationExtraLargeCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKWorldClockRichComplicationExtraLargeCircularView)init;
@end

@implementation NTKWorldClockRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKWorldClockRichComplicationExtraLargeCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockRichComplicationExtraLargeCircularView;
  return [(NTKWorldClockRichComplicationBaseCircularView *)&v3 initWithFamily:12];
}

@end