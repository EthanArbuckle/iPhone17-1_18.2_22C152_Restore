@interface UICollectionViewCell(AccessibilityBridging)
- (id)ttriAccessibilityAXOutermostContainingViewOfType:()AccessibilityBridging;
- (uint64_t)_accessibilityScrollToVisible;
- (uint64_t)ttriAccessibilityAdjustScrollOffsetForFocus;
@end

@implementation UICollectionViewCell(AccessibilityBridging)

- (uint64_t)_accessibilityScrollToVisible
{
  NSClassFromString(&cfstr_Uicalendardate.isa);
  if (objc_opt_isKindOfClass())
  {
    return [a1 ttriAccessibilityAdjustScrollOffsetForFocus];
  }
  else
  {
    return [a1 _accessibilityBaseScrollToVisible];
  }
}

- (uint64_t)ttriAccessibilityAdjustScrollOffsetForFocus
{
  v2 = [a1 ttriAccessibilityAXOutermostContainingViewOfType:objc_opt_class()];
  v3 = [a1 ttriAccessibilityAXOutermostContainingViewOfType:objc_opt_class()];
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    [a1 bounds];
    objc_msgSend(a1, "convertPoint:toView:", v3);
    double v6 = v5;
    [v2 contentOffset];
    double v8 = v7;
    [v3 frame];
    double v10 = v6 + v9;
    [v2 adjustedContentInset];
    objc_msgSend(v2, "setContentOffset:animated:", 1, v8, v10 - v11);
  }

  return 0;
}

- (id)ttriAccessibilityAXOutermostContainingViewOfType:()AccessibilityBridging
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    do
    {
      if (objc_opt_isKindOfClass())
      {
        id v4 = v2;

        v3 = v4;
      }
      uint64_t v5 = [v2 superview];

      v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end