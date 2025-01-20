@interface UIWindowScene
@end

@implementation UIWindowScene

uint64_t __92__UIWindowScene_UIAccessibilityElementTraversal___accessibilityTraversalWindowsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 level];
  double v6 = v5;
  [v4 level];
  double v8 = v7;

  if (v8 <= v6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v8 < v6) {
    return 1;
  }
  else {
    return v9;
  }
}

@end