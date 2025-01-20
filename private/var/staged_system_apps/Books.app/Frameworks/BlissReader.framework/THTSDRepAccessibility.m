@interface THTSDRepAccessibility
+ (BOOL)thaxRepShouldAllowHitTestingOfChildren:(id)a3;
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityIncludeDuringContentReading;
- (BOOL)_accessibilityIsScrollable;
- (BOOL)_axAllowsSubElementHitTesting;
- (BOOL)_axBaseIsElementIgnored;
- (BOOL)_axIsFlowModeRep;
- (BOOL)_thaxIsRepExpandable;
- (BOOL)_thaxRepWantsPressAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxExpandRep;
- (BOOL)thaxIsElementIgnored;
- (BOOL)thaxIsVisibleOnPage;
- (BOOL)thaxPressRep;
- (BOOL)thaxShouldDisableElementIgnoredTest;
- (BOOL)thaxShouldHideChildReps;
- (BOOL)thaxShouldHideElement;
- (BOOL)tsaxIsReadyToLoadChildren;
- (CGRect)accessibilityFrame;
- (NSString)thaxContainingGutterRepLabel;
- (THTSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController;
- (THTSDLayoutAccessibility)tsaxLayout;
- (THTSDRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4;
- (THTSDRepAccessibility)thaxParentRep;
- (id)_axAncestorRepOfType:(Class)a3;
- (id)accessibilityHint;
- (id)thaxDuplicateRepInGroupWidgetEmbeddedCanvas;
- (id)thaxPageController;
- (id)tsaxLayoutDescription;
- (unint64_t)thaxAbsolutePageIndex;
- (void)thaxSetDuplicateRepInGroupWidgetEmbeddedCanvas:(id)a3;
- (void)thaxSetShouldDisableElementIgnoredTest:(BOOL)a3;
- (void)thaxSetShouldHideChildReps:(BOOL)a3;
- (void)thaxSetShouldHideElement:(BOOL)a3;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation THTSDRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)thaxShouldHideChildReps
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A57);
}

- (void)thaxSetShouldHideChildReps:(BOOL)a3
{
}

- (unint64_t)thaxAbsolutePageIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)thaxIsVisibleOnPage
{
  [(THTSDRepAccessibility *)self accessibilityFrame];
  if (v5 <= 0.0) {
    return 0;
  }
  double v7 = v6;
  if (v6 <= 0.0) {
    return 0;
  }
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  double v10 = v5;
  [[-[TSDCanvasViewAccessibility tsaxEnclosingScrollView](-[TSDRepAccessibility tsaxCanvasView](self, "tsaxCanvasView"), "tsaxEnclosingScrollView")] accessibilityFrame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v8;
  uint64_t v20 = v9;
  double v21 = v10;
  double v22 = v7;

  return CGRectIntersectsRect(*(CGRect *)&v19, *(CGRect *)&v12);
}

- (THTSDRepAccessibility)thaxParentRep
{
  char v5 = 0;
  uint64_t v3 = objc_opt_class();
  result = (THTSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THTSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  char v7 = 0;
  uint64_t v3 = objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)THTSDRepAccessibility;
  uint64_t v4 = [(TSDRepAccessibility *)&v6 tsaxInteractiveCanvasController];
  result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (THTSDLayoutAccessibility)tsaxLayout
{
  char v7 = 0;
  uint64_t v3 = objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)THTSDRepAccessibility;
  uint64_t v4 = [(TSDRepAccessibility *)&v6 tsaxLayout];
  result = (THTSDLayoutAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (id)tsaxLayoutDescription
{
  return 0;
}

- (THTSDRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THTSDRepAccessibility;
  uint64_t v4 = [(THTSDRepAccessibility *)&v7 initWithLayout:a3 canvas:a4];
  char v5 = v4;
  if (v4) {
    [(THTSDRepAccessibility *)v4 tsaxLoadAccessibilityInformation];
  }
  return v5;
}

- (BOOL)thaxShouldDisableElementIgnoredTest
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A88);
}

- (void)thaxSetShouldDisableElementIgnoredTest:(BOOL)a3
{
}

- (BOOL)thaxShouldHideElement
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A89);
}

- (void)thaxSetShouldHideElement:(BOOL)a3
{
}

- (id)thaxDuplicateRepInGroupWidgetEmbeddedCanvas
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A8A);
}

- (void)thaxSetDuplicateRepInGroupWidgetEmbeddedCanvas:(id)a3
{
}

+ (BOOL)thaxRepShouldAllowHitTestingOfChildren:(id)a3
{
  unsigned __int8 v5 = [+[TSAccessibility sharedInstance] needsAccessibilityElements];
  if ([a1 accessibilityElementsHidden]) {
    LOBYTE(v6) = 0;
  }
  else {
    unsigned int v6 = [a3 thaxShouldHideChildReps] ^ 1;
  }
  return v5 ^ 1 | v6;
}

- (BOOL)thaxPressRep
{
  LODWORD(v3) = [(THTSDRepAccessibility *)self thaxIsRepPressable];
  if (v3)
  {
    LODWORD(v3) = [(THTSDRepAccessibility *)self _thaxRepWantsPressAction];
    if (v3)
    {
      uint64_t v4 = objc_opt_class();
      Class v3 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[(THTSDRepAccessibility *)self tsaxInteractiveCanvasController], 0, 0);
      if (v3)
      {
        [(objc_class *)v3 thaxPressableRepWasPressedAtActivationPoint:self];
        LOBYTE(v3) = 1;
      }
    }
  }
  return (char)v3;
}

- (BOOL)_thaxRepWantsPressAction
{
  unsigned int v3 = [(THTSDRepAccessibility *)self conformsToProtocol:NSProtocolFromString(@"THWPressableRep")];
  if (v3)
  {
    LOBYTE(v3) = [(THTSDRepAccessibility *)self tsaxBoolValueForKey:@"wantsPressAction"];
  }
  return v3;
}

- (id)thaxPageController
{
  id v2 = [(TSDInteractiveCanvasControllerAccessibility *)[(THTSDRepAccessibility *)self tsaxInteractiveCanvasController] tsaxDelegate];

  return __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___THAccessibilityPageController, v2, 0, 0);
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  if (![(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDRepAccessibility *)self tsaxInteractiveCanvasController] thaxShouldFilterOutNonVisibleReps])return 1; {

  }
  return [(THTSDRepAccessibility *)self thaxIsVisibleOnPage];
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  if (![(THTSDRepAccessibility *)self thaxShouldHideChildReps])
  {
    unsigned __int8 v5 = objc_opt_new();
    v21.receiver = self;
    v21.super_class = (Class)THTSDRepAccessibility;
    [(TSDRepAccessibility *)&v21 tsaxLoadChildrenIntoCollection:v5];
    if ([(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDRepAccessibility *)self tsaxInteractiveCanvasController] thaxShouldFilterOutNonVisibleReps])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v18;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v18 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v11 = (objc_class *)objc_opt_class();
            uint64_t v12 = __TSAccessibilityCastAsClass(v11, v10, 0, 0);
            if (!v12) {
              goto LABEL_11;
            }
            uint64_t v13 = (void *)v12;
            char v16 = 0;
            uint64_t v14 = objc_opt_class();
            Class v15 = __TSAccessibilityCastAsSafeCategory(v14, (uint64_t)[v13 rep], 1, &v16);
            if (v16) {
              abort();
            }
            if ([(objc_class *)v15 thaxIsVisibleOnPage]) {
LABEL_11:
            }
              [a3 addObject:v10];
          }
          id v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v7);
      }
    }
    else
    {
      [a3 addObjectsFromArray:v5];
    }
  }
}

- (BOOL)isAccessibilityElement
{
  v5.receiver = self;
  v5.super_class = (Class)THTSDRepAccessibility;
  BOOL v3 = [(TSDRepAccessibility *)&v5 isAccessibilityElement];
  if (v3)
  {
    if ([(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDRepAccessibility *)self tsaxInteractiveCanvasController] thaxShouldFilterOutNonVisibleReps])
    {
      LOBYTE(v3) = [(THTSDRepAccessibility *)self thaxIsVisibleOnPage];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)accessibilityHint
{
  return 0;
}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return [(THTSDRepAccessibility *)self thaxPressRep];
}

- (BOOL)_accessibilityIsScrollable
{
  return 1;
}

- (BOOL)thaxExpandRep
{
  BOOL v3 = [(THTSDRepAccessibility *)self _thaxIsRepExpandable];
  if (v3)
  {
    char v7 = 0;
    uint64_t v4 = objc_opt_class();
    Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)[(THTSDRepAccessibility *)self tsaxInteractiveCanvasController] tsaxDelegate], 1, &v7);
    if (v7) {
      abort();
    }
    [(objc_class *)v5 thaxPresentRepExpanded:self];
  }
  return v3;
}

- (BOOL)_thaxIsRepExpandable
{
  BOOL v3 = NSProtocolFromString(@"THWExpandableRep");

  return [(THTSDRepAccessibility *)self conformsToProtocol:v3];
}

- (NSString)thaxContainingGutterRepLabel
{
  id v2 = [(TSDRepAccessibility *)self tsaxParentRep];
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2;
  while (1)
  {
    uint64_t v4 = objc_opt_class();
    Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);
    if (v5) {
      break;
    }
    BOOL v3 = [(TSDRepAccessibility *)v3 tsaxParentRep];
    if (!v3) {
      return 0;
    }
  }

  return (NSString *)[(objc_class *)v5 tsaxLabel];
}

- (BOOL)_axAllowsSubElementHitTesting
{
  return 0;
}

- (id)_axAncestorRepOfType:(Class)a3
{
  for (i = self; i; i = [(TSDRepAccessibility *)i tsaxValueForKey:@"parentRep"])
  {
    if (objc_opt_isKindOfClass()) {
      break;
    }
  }
  return i;
}

- (BOOL)_axIsFlowModeRep
{
  return [(THTSDRepAccessibility *)self _axAncestorRepOfType:NSClassFromString(@"THFlowPageRep")] != 0;
}

- (CGRect)accessibilityFrame
{
  v20.receiver = self;
  v20.super_class = (Class)THTSDRepAccessibility;
  [(TSDRepAccessibility *)&v20 accessibilityFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDRepAccessibility *)self tsaxInteractiveCanvasController] thaxShouldClipRepAccessibilityFrameToVisibleBounds:self])
  {
    id v11 = [(TSDCanvasViewAccessibility *)[(TSDRepAccessibility *)self tsaxCanvasView] tsaxEnclosingScrollView];
    if (v11)
    {
      [v11 accessibilityFrame];
      v24.origin.CGFloat x = v12;
      v24.origin.CGFloat y = v13;
      v24.size.CGFloat width = v14;
      v24.size.CGFloat height = v15;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGRect v22 = CGRectIntersection(v21, v24);
      CGFloat x = v22.origin.x;
      CGFloat y = v22.origin.y;
      CGFloat width = v22.size.width;
      CGFloat height = v22.size.height;
      if (CGRectIsNull(v22))
      {
        CGFloat x = CGRectZero.origin.x;
        CGFloat y = CGRectZero.origin.y;
        CGFloat width = CGRectZero.size.width;
        CGFloat height = CGRectZero.size.height;
      }
    }
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)_axBaseIsElementIgnored
{
  if (![(THTSDRepAccessibility *)self thaxShouldHideElement])
  {
    if (![(THTSDRepAccessibility *)self thaxShouldDisableElementIgnoredTest])
    {
      uint64_t v4 = [(TSDRepAccessibility *)self tsaxCanvasView];
      if (![(THTSDRepAccessibility *)self _axIsFlowModeRep])
      {
        unsigned int v3 = [[v4 tsaxEnclosingScrollView] tsaxBoolValueForKey:@"isPagingEnabled"];
        if (!v3) {
          return v3;
        }
        [(THTSDRepAccessibility *)self accessibilityFrame];
        double v7 = v5 * v6;
        if (v5 * v6 > 0.0)
        {
          [(THTSDRepAccessibility *)self accessibilityFrame];
          LOBYTE(v3) = v8 * v9 / v7 < 0.55;
          return v3;
        }
      }
    }
    LOBYTE(v3) = 0;
    return v3;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)thaxIsElementIgnored
{
  return [(THTSDRepAccessibility *)self _axBaseIsElementIgnored];
}

@end