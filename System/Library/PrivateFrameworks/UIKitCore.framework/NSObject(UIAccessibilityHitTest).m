@interface NSObject(UIAccessibilityHitTest)
- (uint64_t)accessibilityHitTest:()UIAccessibilityHitTest withEvent:;
@end

@implementation NSObject(UIAccessibilityHitTest)

- (uint64_t)accessibilityHitTest:()UIAccessibilityHitTest withEvent:
{
  return 0;
}

@end