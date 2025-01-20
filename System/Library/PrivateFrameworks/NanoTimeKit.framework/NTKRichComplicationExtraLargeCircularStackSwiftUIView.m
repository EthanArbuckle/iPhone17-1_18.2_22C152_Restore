@interface NTKRichComplicationExtraLargeCircularStackSwiftUIView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationExtraLargeCircularStackSwiftUIView)init;
@end

@implementation NTKRichComplicationExtraLargeCircularStackSwiftUIView

- (NTKRichComplicationExtraLargeCircularStackSwiftUIView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularStackSwiftUIView;
  return [(NTKRichComplicationCircularStackContentTextView *)&v3 initWithFamily:12];
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end