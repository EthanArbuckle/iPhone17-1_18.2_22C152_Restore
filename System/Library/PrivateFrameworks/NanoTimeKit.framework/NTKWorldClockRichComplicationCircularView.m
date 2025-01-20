@interface NTKWorldClockRichComplicationCircularView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKWorldClockRichComplicationCircularView)init;
@end

@implementation NTKWorldClockRichComplicationCircularView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKWorldClockRichComplicationCircularView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockRichComplicationCircularView;
  return [(NTKWorldClockRichComplicationBaseCircularView *)&v3 initWithFamily:10];
}

@end