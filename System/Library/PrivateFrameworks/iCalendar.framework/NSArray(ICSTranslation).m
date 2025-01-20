@interface NSArray(ICSTranslation)
- (BOOL)ICSContainsArray:()ICSTranslation;
@end

@implementation NSArray(ICSTranslation)

- (BOOL)ICSContainsArray:()ICSTranslation
{
  return +[ICSTimeZone perfectMatchForSubarray:a3 inTZChangeArray:a1];
}

@end