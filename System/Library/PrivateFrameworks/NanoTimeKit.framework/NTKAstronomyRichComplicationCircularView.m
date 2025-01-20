@interface NTKAstronomyRichComplicationCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKAstronomyRichComplicationCircularView)init;
@end

@implementation NTKAstronomyRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKAstronomyRichComplicationCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyRichComplicationCircularView;
  return [(NTKAstronomyRichComplicationBaseCircularView *)&v3 initWithFamily:10];
}

@end