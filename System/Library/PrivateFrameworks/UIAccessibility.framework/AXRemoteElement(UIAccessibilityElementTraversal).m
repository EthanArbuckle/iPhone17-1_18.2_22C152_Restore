@interface AXRemoteElement(UIAccessibilityElementTraversal)
- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:;
@end

@implementation AXRemoteElement(UIAccessibilityElementTraversal)

- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:
{
  id v8 = a4;
  id v9 = a5;
  if ([a1 onClientSide])
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1EF1A8460;
    uint64_t v10 = (uint64_t)objc_msgSendSuper2(&v12, sel__accessibilityEnumerateSiblingsWithParent_options_usingBlock_, a3, v8, v9);
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    uint64_t v10 = 1;
  }

  return v10;
}

@end