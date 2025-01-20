@interface UIColor(AccessibilityBridging)
- (uint64_t)ttriAccessibilityColorDescription;
@end

@implementation UIColor(AccessibilityBridging)

- (uint64_t)ttriAccessibilityColorDescription
{
  return [a1 _accessibilityColorDescriptionWithOptions:1];
}

@end