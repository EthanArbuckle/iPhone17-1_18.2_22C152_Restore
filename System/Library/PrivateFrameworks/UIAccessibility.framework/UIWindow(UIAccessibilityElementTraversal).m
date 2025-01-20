@interface UIWindow(UIAccessibilityElementTraversal)
- (uint64_t)_accessibilityIsModalWithKeyboard;
@end

@implementation UIWindow(UIAccessibilityElementTraversal)

- (uint64_t)_accessibilityIsModalWithKeyboard
{
  return 0;
}

@end