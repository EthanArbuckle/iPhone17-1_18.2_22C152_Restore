@interface NTKSolarRichComplicationCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKSolarRichComplicationCircularView)init;
@end

@implementation NTKSolarRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKSolarRichComplicationCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSolarRichComplicationCircularView;
  return [(NTKSolarRichComplicationBaseCircularView *)&v3 initWithFamily:10];
}

@end