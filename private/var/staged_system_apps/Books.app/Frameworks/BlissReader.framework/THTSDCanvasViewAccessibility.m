@interface THTSDCanvasViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THTSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController;
- (id)_accessibilityElementsInContainerIncludingContainers:(BOOL)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_tsaxDirectChildForElement:(id)a3;
- (id)accessibilityLabel;
- (id)thaxDocumentViewController;
- (int64_t)accessibilityContainerType;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation THTSDCanvasViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDCanvasView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THTSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  char v7 = 0;
  v3 = objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)THTSDCanvasViewAccessibility;
  v4 = [(TSDCanvasViewAccessibility *)&v6 tsaxInteractiveCanvasController];
  result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  if (([(THTSDCanvasViewAccessibility *)self accessibilityElementsHidden] & 1) == 0
    && ![(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDCanvasViewAccessibility *)self tsaxInteractiveCanvasController] thaxShouldIgnoreCanvas])
  {
    v5 = objc_opt_new();
    v21.receiver = self;
    v21.super_class = (Class)THTSDCanvasViewAccessibility;
    [(TSDCanvasViewAccessibility *)&v21 tsaxLoadChildrenIntoCollection:v5];
    if ([(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDCanvasViewAccessibility *)self tsaxInteractiveCanvasController] thaxShouldFilterOutNonVisibleReps])
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
            v11 = (objc_class *)objc_opt_class();
            uint64_t v12 = __TSAccessibilityCastAsClass(v11, v10, 0, 0);
            if (!v12) {
              goto LABEL_12;
            }
            v13 = (void *)v12;
            char v16 = 0;
            v14 = objc_opt_class();
            Class v15 = __TSAccessibilityCastAsSafeCategory(v14, (uint64_t)[v13 rep], 1, &v16);
            if (v16) {
              abort();
            }
            if ([(objc_class *)v15 thaxIsVisibleOnPage]) {
LABEL_12:
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

- (id)thaxDocumentViewController
{
  id v2 = [self tsaxValueForKey:@"controller" tsaxValueForKey:@"delegate"];
  NSClassFromString(@"THDocumentViewController");
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)accessibilityLabel
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (([(THTSDCanvasViewAccessibility *)self accessibilityElementsHidden] & 1) != 0
    || [(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDCanvasViewAccessibility *)self tsaxInteractiveCanvasController] thaxShouldIgnoreCanvas])
  {
    return 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)THTSDCanvasViewAccessibility;
  id v8 = -[TSDCanvasViewAccessibility _accessibilityHitTest:withEvent:](&v13, "_accessibilityHitTest:withEvent:", a4, x, y);
  if ([v8 isAccessibilityElement])
  {
    NSClassFromString(@"TSDRep");
    if (objc_opt_isKindOfClass())
    {
      if ([v8 tsaxBoolValueForKey:@"_axAllowsSubElementHitTesting"])
      {
        [(THTSDCanvasViewAccessibility *)self tsaxValueForKey:@"controller"];
        if (objc_opt_respondsToSelector())
        {
          [self tsaxValueForKey:@"controller" convertBoundsToUnscaledPoint:x y:y];
        }
        else
        {
          double v10 = CGPointZero.x;
          double v11 = CGPointZero.y;
        }
        id v12 = [v8 _accessibilityHitTest:a4 withEvent:v10 v11];
        if ([v12 isAccessibilityElement]) {
          return v12;
        }
      }
    }
  }
  return v8;
}

- (id)_accessibilityElementsInContainerIncludingContainers:(BOOL)a3
{
  BOOL v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)THTSDCanvasViewAccessibility;
  id v5 = -[THTSDCanvasViewAccessibility _accessibilityElementsInContainerIncludingContainers:](&v26, "_accessibilityElementsInContainerIncludingContainers:");
  if (!v3) {
    goto LABEL_5;
  }
  if ([-[THTSDCanvasViewAccessibility thaxDocumentViewController](self, "thaxDocumentViewController") tsaxBoolValueForKey:@"inFlowMode"])goto LABEL_5; {
  if (![v5 count])
  }
    goto LABEL_5;
  if ([v5 lastObject] != self) {
    goto LABEL_5;
  }
  [self tsaxEnclosingScrollView].accessibilityFrame;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  id v16 = [(THTSDCanvasViewAccessibility *)self tsaxValueForKey:@"subviews"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    id v18 = v17;
    id v6 = 0;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_super v21 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v21 accessibilityContainerType] == &dword_4)
        {
          [v21 accessibilityFrame];
          v29.origin.double x = v9;
          v29.origin.double y = v11;
          v29.size.width = v13;
          v29.size.height = v15;
          if (CGRectIntersectsRect(v28, v29))
          {
            if (!v6) {
              id v6 = [v5 mutableCopy];
            }
            [v6 addObject:v21];
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v18);
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }
  if (v6) {
    return v6;
  }
  else {
    return v5;
  }
}

- (int64_t)accessibilityContainerType
{
  v5.receiver = self;
  v5.super_class = (Class)THTSDCanvasViewAccessibility;
  id v3 = [(TSDCanvasViewAccessibility *)&v5 accessibilityContainerType];
  if ([(THTSDInteractiveCanvasControllerAccessibility *)[(THTSDCanvasViewAccessibility *)self tsaxInteractiveCanvasController] thaxIsMostOuterICC])
  {
    return (int64_t)v3;
  }
  else
  {
    return 0;
  }
}

- (id)_tsaxDirectChildForElement:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    [a3 setAccessibilityContainer:self];
  }
  return a3;
}

@end