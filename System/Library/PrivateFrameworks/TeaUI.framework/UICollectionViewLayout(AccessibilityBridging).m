@interface UICollectionViewLayout(AccessibilityBridging)
- (id)_accessibilitySortCollectionViewLogically;
- (uint64_t)setTs_sortItemsLogicallyForAccessibility:()AccessibilityBridging;
- (uint64_t)ts_sortItemsLogicallyForAccessibility;
@end

@implementation UICollectionViewLayout(AccessibilityBridging)

- (uint64_t)setTs_sortItemsLogicallyForAccessibility:()AccessibilityBridging
{
  return objc_msgSend(a1, "ts_axSetBoolValue:forKey:", a3, @"kTSUICollectionViewLayoutAccessibilityLogicalSortKey");
}

- (uint64_t)ts_sortItemsLogicallyForAccessibility
{
  return objc_msgSend(a1, "ts_axBoolValueForKey:", @"kTSUICollectionViewLayoutAccessibilityLogicalSortKey");
}

- (id)_accessibilitySortCollectionViewLogically
{
  if (objc_msgSend(a1, "ts_axHasValueForKey:", @"kTSUICollectionViewLayoutAccessibilityLogicalSortKey"))
  {
    return (id)objc_msgSend(a1, "ts_sortItemsLogicallyForAccessibility");
  }
  else
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_1F0F90400;
    return objc_msgSendSuper2(&v3, sel__accessibilitySortCollectionViewLogically);
  }
}

@end