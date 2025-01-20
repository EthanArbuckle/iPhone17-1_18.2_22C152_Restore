@interface BKFontFallbackProvider
+ (id)fallbacksForFontFamily:(id)a3 language:(id)a4;
@end

@implementation BKFontFallbackProvider

+ (id)fallbacksForFontFamily:(id)a3 language:(id)a4
{
  return sub_B00BC(a3, a4);
}

@end