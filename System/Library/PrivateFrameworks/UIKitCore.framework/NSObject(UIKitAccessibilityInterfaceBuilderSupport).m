@interface NSObject(UIKitAccessibilityInterfaceBuilderSupport)
- (uint64_t)defaultAccessibilityTraits;
- (uint64_t)isAccessibilityElementByDefault;
- (uint64_t)isElementAccessibilityExposedToInterfaceBuilder;
- (void)setAccessibilityIdentifier:()UIKitAccessibilityInterfaceBuilderSupport;
@end

@implementation NSObject(UIKitAccessibilityInterfaceBuilderSupport)

- (void)setAccessibilityIdentifier:()UIKitAccessibilityInterfaceBuilderSupport
{
}

- (uint64_t)defaultAccessibilityTraits
{
  return 0;
}

- (uint64_t)isAccessibilityElementByDefault
{
  return 0;
}

- (uint64_t)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

@end