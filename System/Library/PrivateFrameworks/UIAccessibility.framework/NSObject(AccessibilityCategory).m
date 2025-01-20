@interface NSObject(AccessibilityCategory)
+ (uint64_t)accessibilityBundles;
@end

@implementation NSObject(AccessibilityCategory)

+ (uint64_t)accessibilityBundles
{
  return 0;
}

@end