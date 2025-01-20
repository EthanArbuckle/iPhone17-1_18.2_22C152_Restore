@interface NTKRichComplicationCircularSwiftUIView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationCircularSwiftUIView)init;
@end

@implementation NTKRichComplicationCircularSwiftUIView

- (NTKRichComplicationCircularSwiftUIView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularSwiftUIView;
  return [(NTKRichComplicationBaseCircularSwiftUIView *)&v3 initWithFamily:10];
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end