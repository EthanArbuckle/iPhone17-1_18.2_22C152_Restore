@interface NSObject(UIAccessibilityAction)
- (id)accessibilityCustomActions;
- (uint64_t)accessibilityActivate;
- (uint64_t)accessibilityPerformEscape;
- (uint64_t)accessibilityPerformMagicTap;
- (uint64_t)accessibilityScroll:()UIAccessibilityAction;
- (uint64_t)accessibilityZoomInAtPoint:()UIAccessibilityAction;
- (uint64_t)accessibilityZoomOutAtPoint:()UIAccessibilityAction;
- (void)setAccessibilityCustomActions:()UIAccessibilityAction;
@end

@implementation NSObject(UIAccessibilityAction)

- (void)setAccessibilityCustomActions:()UIAccessibilityAction
{
}

- (uint64_t)accessibilityZoomInAtPoint:()UIAccessibilityAction
{
  return 0;
}

- (uint64_t)accessibilityZoomOutAtPoint:()UIAccessibilityAction
{
  return 0;
}

- (uint64_t)accessibilityScroll:()UIAccessibilityAction
{
  return 0;
}

- (uint64_t)accessibilityPerformEscape
{
  return 0;
}

- (uint64_t)accessibilityPerformMagicTap
{
  return 0;
}

- (uint64_t)accessibilityActivate
{
  if (accessibilityActivate_onceToken != -1) {
    dispatch_once(&accessibilityActivate_onceToken, &__block_literal_global_336);
  }
  return 0;
}

- (id)accessibilityCustomActions
{
  return objc_getAssociatedObject(a1, &AXCustomActionsIdentifier);
}

@end