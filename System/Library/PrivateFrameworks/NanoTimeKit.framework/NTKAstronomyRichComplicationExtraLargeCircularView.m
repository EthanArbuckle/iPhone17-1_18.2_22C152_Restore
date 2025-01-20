@interface NTKAstronomyRichComplicationExtraLargeCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKAstronomyRichComplicationExtraLargeCircularView)init;
@end

@implementation NTKAstronomyRichComplicationExtraLargeCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKAstronomyRichComplicationExtraLargeCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyRichComplicationExtraLargeCircularView;
  return [(NTKAstronomyRichComplicationBaseCircularView *)&v3 initWithFamily:12];
}

@end