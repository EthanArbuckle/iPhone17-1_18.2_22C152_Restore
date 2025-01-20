@interface NTKSolarRichComplicationExtraLargeCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKSolarRichComplicationExtraLargeCircularView)init;
@end

@implementation NTKSolarRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKSolarRichComplicationExtraLargeCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSolarRichComplicationExtraLargeCircularView;
  return [(NTKSolarRichComplicationBaseCircularView *)&v3 initWithFamily:12];
}

@end