@interface CRLUIViewAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent;
- (BOOL)accessibilityPerformEscape;
- (CGRect)_accessibilityFrameForSorting;
- (id)_accessibilityContainingParentForOrdering;
- (id)_crlaxParentCanvasView;
- (id)accessibilityContainer;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_crlaxInvalidateChildrenOnParentCanvasView;
- (void)addSubview:(id)a3;
- (void)crlaxLoadAccessibilityInformation;
- (void)removeFromSuperview;
- (void)setAlpha:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
@end

@implementation CRLUIViewAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIView";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (void)crlaxLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CRLUIViewAccessibility;
  [(CRLUIViewAccessibility *)&v8 crlaxLoadAccessibilityInformation];
  char v7 = 0;
  id v3 = [(CRLUIViewAccessibility *)self crlaxValueForKey:@"_accessibilityViewController"];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v7);
  if (v7) {
    abort();
  }
  v6 = (void *)v5;

  [v6 crlaxLoadAccessibilityInformation];
}

- (CGRect)_accessibilityFrameForSorting
{
  v20.receiver = self;
  v20.super_class = (Class)CRLUIViewAccessibility;
  [(CRLUIViewAccessibility *)&v20 _accessibilityFrameForSorting];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (objc_class *)objc_opt_class();
  v12 = [(CRLUIViewAccessibility *)self crlaxValueForKey:@"superview"];
  v13 = __CRLAccessibilityCastAsClass(v11, (uint64_t)v12, 0, 0);

  if (v13)
  {
    [v13 accessibilityFrame];
    double v6 = v14;
    double v10 = v15;
  }

  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  v16.receiver = self;
  v16.super_class = (Class)CRLUIViewAccessibility;
  if ([(CRLUIViewAccessibility *)&v16 accessibilityPerformEscape])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    char v15 = 0;
    double v4 = self;
    double v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v15);
    if (v15) {
      goto LABEL_9;
    }
    double v7 = (void *)v6;

    char v15 = 0;
    double v8 = [v7 nextResponder];
    double v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v15);
    if (v15) {
LABEL_9:
    }
      abort();
    v11 = (void *)v10;

    v12 = [v11 miniFormatterPresenter];
    unsigned int v3 = [v12 isPresentingMiniFormatter];

    if (v3)
    {
      v13 = [v11 miniFormatterPresenter];
      [v13 dismissMiniFormatter];
    }
  }
  return v3;
}

- (id)_accessibilityContainingParentForOrdering
{
  v6.receiver = self;
  v6.super_class = (Class)CRLUIViewAccessibility;
  unsigned int v3 = [(CRLUIViewAccessibility *)&v6 _accessibilityContainingParentForOrdering];
  if (!v3)
  {
    unsigned int v3 = self;
    do
    {
      double v4 = v3;
      unsigned int v3 = [(CRLUIViewAccessibility *)v3 superview];
    }
    while (([(CRLUIViewAccessibility *)v3 crlaxServesAsContainingParentForOrdering] & 1) == 0&& v3);
  }

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLUIViewAccessibility;
  [(CRLUIViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CRLUIViewAccessibility *)self crlaxLoadAccessibilityInformation];
}

- (id)_crlaxParentCanvasView
{
  Class v3 = NSClassFromString(@"CRLCanvasView");

  return [(CRLUIViewAccessibility *)self crlaxViewAncestorOfType:v3];
}

- (void)_crlaxInvalidateChildrenOnParentCanvasView
{
  [(CRLUIViewAccessibility *)self _crlaxParentCanvasView];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003E12CC;
  v3[3] = &unk_1014CBBB0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v2;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  NSClassFromString(@"CRLCanvasView");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    Class v3 = [(CRLUIViewAccessibility *)self _crlaxParentCanvasView];

    if (v3) {
      return 1;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLUIViewAccessibility;
  return [(CRLUIViewAccessibility *)&v5 _accessibilityShouldUseViewHierarchyForFindingScrollParent];
}

- (id)accessibilityContainer
{
  NSClassFromString(@"CRLCanvasView");
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  uint64_t v3 = [(CRLUIViewAccessibility *)self _crlaxParentCanvasView];
  if (!v3) {
    goto LABEL_10;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [(CRLUIViewAccessibility *)self superview];
  objc_super v6 = (void *)v5;
  if (v5 && (void *)v5 != v4)
  {
    do
    {
      double v7 = v6;
      unsigned int v8 = [v4 crlaxViewCanBeAddedToContainerElements:v6];
      objc_super v6 = [v6 superview];
    }
    while (v6 && v6 != v4 && !v8);
    if (v8)
    {

LABEL_10:
      v10.receiver = self;
      v10.super_class = (Class)CRLUIViewAccessibility;
      id v4 = [(CRLUIViewAccessibility *)&v10 accessibilityContainer];
      goto LABEL_12;
    }
  }

LABEL_12:

  return v4;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CRLUIViewAccessibility *)self isAccessibilityElement];
  v6.receiver = self;
  v6.super_class = (Class)CRLUIViewAccessibility;
  [(CRLUIViewAccessibility *)&v6 setIsAccessibilityElement:v3];
  if (v5 != v3) {
    [(CRLUIViewAccessibility *)self _crlaxInvalidateChildrenOnParentCanvasView];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CRLUIViewAccessibility *)self isHidden];
  v6.receiver = self;
  v6.super_class = (Class)CRLUIViewAccessibility;
  [(CRLUIViewAccessibility *)&v6 setHidden:v3];
  if (v5 != v3) {
    [(CRLUIViewAccessibility *)self _crlaxInvalidateChildrenOnParentCanvasView];
  }
}

- (void)setAlpha:(double)a3
{
  [(CRLUIViewAccessibility *)self alpha];
  double v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)CRLUIViewAccessibility;
  [(CRLUIViewAccessibility *)&v7 setAlpha:a3];
  if (a3 == 0.0 && v6 > 0.0 || a3 > 0.0 && v6 == 0.0) {
    [(CRLUIViewAccessibility *)self _crlaxInvalidateChildrenOnParentCanvasView];
  }
}

- (void)addSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility addSubview:](&v5, "addSubview:");
  if (a3) {
    [(CRLUIViewAccessibility *)self _crlaxInvalidateChildrenOnParentCanvasView];
  }
}

- (void)removeFromSuperview
{
  [(CRLUIViewAccessibility *)self _crlaxInvalidateChildrenOnParentCanvasView];
  v3.receiver = self;
  v3.super_class = (Class)CRLUIViewAccessibility;
  [(CRLUIViewAccessibility *)&v3 removeFromSuperview];
}

@end