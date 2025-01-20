@interface UINavigationItem(ScrollToEdge)
- (uint64_t)ob_applyAutomaticScrollToEdgeBehavior;
- (uint64_t)ob_applyAutomaticScrollToEdgeBehaviorWithDistance:()ScrollToEdge;
@end

@implementation UINavigationItem(ScrollToEdge)

- (uint64_t)ob_applyAutomaticScrollToEdgeBehavior
{
  return objc_msgSend(a1, "ob_applyAutomaticScrollToEdgeBehaviorWithDistance:", 16.0);
}

- (uint64_t)ob_applyAutomaticScrollToEdgeBehaviorWithDistance:()ScrollToEdge
{
  uint64_t result = [a1 _isManualScrollEdgeAppearanceEnabled];
  if ((result & 1) == 0)
  {
    [a1 _setAutoScrollEdgeTransitionDistance:a2];
    return [a1 _setManualScrollEdgeAppearanceEnabled:1];
  }
  return result;
}

@end