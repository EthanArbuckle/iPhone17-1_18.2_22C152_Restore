@interface TSUIViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent;
- (CGRect)_accessibilityFrameForSorting;
- (id)_accessibilityContainingParentForOrdering;
- (id)_tsaxParentCanvasView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_tsaxInvalidateChildrenOnParentCanvasViewEventually;
- (void)_tsaxInvalidateChildrenOnParentCanvasViewImmediately;
- (void)addSubview:(id)a3;
- (void)removeFromSuperview;
- (void)setAlpha:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)tsaxLoadAccessibilityInformation;
@end

@implementation TSUIViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)tsaxLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  [(TSUIViewAccessibility *)&v6 tsaxLoadAccessibilityInformation];
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSUIViewAccessibility *)self tsaxValueForKey:@"_accessibilityViewController"], 1, &v5);
  if (v5) {
    abort();
  }
  [v4 tsaxLoadAccessibilityInformation];
}

- (CGRect)_accessibilityFrameForSorting
{
  v19.receiver = self;
  v19.super_class = (Class)TSUIViewAccessibility;
  [(TSUIViewAccessibility *)&v19 _accessibilityFrameForSorting];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (objc_class *)objc_opt_class();
  v12 = (void *)__TSAccessibilityCastAsClass(v11, (uint64_t)[(TSUIViewAccessibility *)self tsaxValueForKey:@"superview"], 0, 0);
  if (v12)
  {
    [v12 accessibilityFrame];
    double v6 = v13;
    double v10 = v14;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_accessibilityContainingParentForOrdering
{
  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  id v3 = [(TSUIViewAccessibility *)&v6 _accessibilityContainingParentForOrdering];
  if (!v3)
  {
    id v3 = self;
    do
    {
      id v3 = [v3 superview];
      unsigned int v4 = [v3 tsaxServesAsContainingParentForOrdering];
    }
    while (v3 && !v4);
  }
  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSUIViewAccessibility;
  [(TSUIViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(TSUIViewAccessibility *)self tsaxLoadAccessibilityInformation];
}

- (id)_tsaxParentCanvasView
{
  Class v3 = NSClassFromString(@"TSDCanvasView");

  return [(TSUIViewAccessibility *)self tsaxViewAncestorOfType:v3];
}

- (void)_tsaxInvalidateChildrenOnParentCanvasViewImmediately
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_267A98;
  v2[3] = &unk_456DE0;
  v2[4] = [(TSUIViewAccessibility *)self _tsaxParentCanvasView];
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)_tsaxInvalidateChildrenOnParentCanvasViewEventually
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_267B18;
  v2[3] = &unk_456DE0;
  v2[4] = [(TSUIViewAccessibility *)self _tsaxParentCanvasView];
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  NSClassFromString(@"TSDCanvasView");
  if ((objc_opt_isKindOfClass() & 1) == 0
    && [(TSUIViewAccessibility *)self _tsaxParentCanvasView])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIViewAccessibility;
  return [(TSUIViewAccessibility *)&v4 _accessibilityShouldUseViewHierarchyForFindingScrollParent];
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(TSUIViewAccessibility *)self isAccessibilityElement];
  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  [(TSUIViewAccessibility *)&v6 setIsAccessibilityElement:v3];
  if (v5 != v3) {
    [(TSUIViewAccessibility *)self _tsaxInvalidateChildrenOnParentCanvasViewEventually];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(TSUIViewAccessibility *)self isHidden];
  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  [(TSUIViewAccessibility *)&v6 setHidden:v3];
  if (v5 != v3) {
    [(TSUIViewAccessibility *)self _tsaxInvalidateChildrenOnParentCanvasViewEventually];
  }
}

- (void)setAlpha:(double)a3
{
  [(TSUIViewAccessibility *)self alpha];
  double v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)TSUIViewAccessibility;
  [(TSUIViewAccessibility *)&v7 setAlpha:a3];
  if (a3 == 0.0 && v6 > 0.0 || a3 > 0.0 && v6 == 0.0) {
    [(TSUIViewAccessibility *)self _tsaxInvalidateChildrenOnParentCanvasViewEventually];
  }
}

- (void)addSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility addSubview:](&v5, "addSubview:");
  if (a3) {
    [(TSUIViewAccessibility *)self _tsaxInvalidateChildrenOnParentCanvasViewEventually];
  }
}

- (void)removeFromSuperview
{
  [(TSUIViewAccessibility *)self _tsaxInvalidateChildrenOnParentCanvasViewImmediately];
  v3.receiver = self;
  v3.super_class = (Class)TSUIViewAccessibility;
  [(TSUIViewAccessibility *)&v3 removeFromSuperview];
}

@end