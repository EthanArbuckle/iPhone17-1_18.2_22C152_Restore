@interface TSDCanvasViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsBeingDeallocated;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxCanMoveAXFocusIntoContent;
- (BOOL)tsaxHitTestingShouldReplaceElement:(id)a3 withTouchContainerView:(id)a4;
- (BOOL)tsaxIsReadyToLoadChildren;
- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm;
- (BOOL)tsaxViewCanBeAddedToContainerElements:(id)a3;
- (CALayer)tsaxCanvasLayer;
- (TSDCanvasAccessibility)tsaxCanvas;
- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (id)tsaxEnclosingScrollView;
- (id)tsaxTarget;
- (int64_t)accessibilityContainerType;
- (void)_tsaxSetBeingDeallocated:(BOOL)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4;
- (void)sendSubviewToBack:(id)a3;
- (void)tsaxChildWillBeRemoved:(id)a3;
- (void)tsaxDidInvalidateChildren;
- (void)tsaxLoadAccessibilityInformation;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation TSDCanvasViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDCanvasView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxTarget
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDCanvasAccessibility)tsaxCanvas
{
  v2 = [(TSDCanvasViewAccessibility *)self tsaxInteractiveCanvasController];

  return [(TSDInteractiveCanvasControllerAccessibility *)v2 tsaxCanvas];
}

- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDCanvasViewAccessibility *)self tsaxValueForKey:@"controller"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (CALayer)tsaxCanvasLayer
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (CALayer *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDCanvasViewAccessibility *)self tsaxValueForKey:@"layer"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxEnclosingScrollView
{
  id result = [(TSDCanvasViewAccessibility *)self tsaxValueForKey:@"enclosingScrollView"];
  if (!result)
  {
    if ([(TSDCanvasViewAccessibility *)self tsaxRespondsToSelector:"tsaxSearchForAncestorViewOfType:" fromOptionalExtrasProtocol:&OBJC_PROTOCOL___TSDCanvasViewAccessibilityExtras])
    {
      Class v4 = NSClassFromString(@"TSKScrollView");
      return [(TSDCanvasViewAccessibility *)self tsaxSearchForAncestorViewOfType:v4];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasViewAccessibility;
  [(TSDCanvasViewAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(NSSet *)[(TSDCanvasAccessibility *)[(TSDCanvasViewAccessibility *)self tsaxCanvas] tsaxAllReps] makeObjectsPerformSelector:"tsaxLoadAccessibilityInformation"];
}

- (BOOL)_tsaxIsBeingDeallocated
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A30);
}

- (void)_tsaxSetBeingDeallocated:(BOOL)a3
{
}

- (BOOL)tsaxCanMoveAXFocusIntoContent
{
  if (!self) {
    return 1;
  }
  v2 = self;
  do
  {
    unsigned __int8 v3 = [(TSDCanvasViewAccessibility *)v2 accessibilityElementsHidden];
    if (v3) {
      break;
    }
    v2 = (TSDCanvasViewAccessibility *)[(TSDCanvasViewAccessibility *)v2 accessibilityContainer];
  }
  while (v2);
  return v3 ^ 1;
}

- (BOOL)tsaxHitTestingShouldReplaceElement:(id)a3 withTouchContainerView:(id)a4
{
  return 0;
}

- (BOOL)tsaxViewCanBeAddedToContainerElements:(id)a3
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return ![(TSDInteractiveCanvasControllerAccessibility *)[(TSDCanvasViewAccessibility *)self tsaxInteractiveCanvasController] tsaxCurrentlyWaitingOnThreadedLayoutAndRender];
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  if (([(TSDCanvasViewAccessibility *)self accessibilityElementsHidden] & 1) == 0)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    char v39 = 0;
    char v5 = (objc_class *)objc_opt_class();
    v6 = (void *)__TSAccessibilityCastAsClass(v5, (uint64_t)[(TSDCanvasViewAccessibility *)self tsaxValueForKey:@"subviews"], 1, &v39);
    if (v39) {
LABEL_34:
    }
      abort();
    v7 = v6;
    id v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v41;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (([v12 accessibilityElementsHidden] & 1) == 0
            && ([v12 isHidden] & 1) == 0)
          {
            [v12 alpha];
            if (v13 > 0.0)
            {
              if ([v12 isAccessibilityElement]) {
                [a3 addObject:v12];
              }
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v9);
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v14 = [(TSDCanvasAccessibility *)[(TSDCanvasViewAccessibility *)self tsaxCanvas] tsaxTopLevelReps];
    id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) tsaxAccessibilityElement];
          if (v19)
          {
            [a3 addObject:v19];
          }
          else if (TSAccessibilityShouldPerformValidationChecks())
          {
            int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
            if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"tsaxAccessibilityElement must return an element!", v21, v22, v23, v24, v25, v31))goto LABEL_34; {
          }
            }
        }
        id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v16);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = [a3 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v32;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(a3);
          }
          v30 = *(void **)(*((void *)&v31 + 1) + 8 * (void)k);
          [v30 tsaxEnsureChildrenAreLoaded];
          [v30 setAccessibilityContainer:self];
        }
        id v27 = [a3 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v27);
    }
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
}

- (void)tsaxDidInvalidateChildren
{
  if (![(TSDCanvasViewAccessibility *)self _tsaxIsBeingDeallocated]) {
    [(TSDCanvasViewAccessibility *)self tsaxEnsureChildrenAreLoaded];
  }

  TSAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (!-[TSDCanvasViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:")) {
    return 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [(TSDCanvasViewAccessibility *)self subviews];
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
      [v13 convertPoint:self x:y];
      v14 = [v13 __accessibilityHitTest:a4];
      if ([(TSDCanvasViewAccessibility *)v14 isAccessibilityElement]
        || (int *)[(TSDCanvasViewAccessibility *)v14 accessibilityContainerType] == &dword_4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([(TSDCanvasViewAccessibility *)v14 isHidden] & 1) == 0)
        {
          break;
        }
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v10) {
          goto LABEL_4;
        }
        goto LABEL_13;
      }
    }
    id v15 = v14;
    if ([(TSDCanvasViewAccessibility *)v14 isAccessibilityElement]) {
      return v15;
    }
  }
  else
  {
LABEL_13:
    v14 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = [(TSDCanvasViewAccessibility *)self subviews];
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
LABEL_18:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v26 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
      [v21 convertPoint:self x:y];
      id v15 = [(TSDCanvasViewAccessibility *)[v21 __accessibilityHitTest:a4] withEvent:a4];
      if ([(TSDCanvasViewAccessibility *)v15 isAccessibilityElement])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ![(TSDCanvasViewAccessibility *)v15 isHidden])
        {
          break;
        }
      }
      if (v18 == (id)++v20)
      {
        id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v18) {
          goto LABEL_18;
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    uint64_t v22 = -[TSDInteractiveCanvasControllerAccessibility _accessibilityHitTest:withEvent:]([(TSDCanvasViewAccessibility *)self tsaxInteractiveCanvasController], "_accessibilityHitTest:withEvent:", a4, x, y);
    if (!v22
      || (id v15 = v22, ![(TSDCanvasViewAccessibility *)v22 isAccessibilityElement])
      && (int *)[(TSDCanvasViewAccessibility *)v15 accessibilityContainerType] != &dword_4)
    {
      uint64_t v23 = (TSDCanvasViewAccessibility *)-[TSDCanvasViewAccessibility __accessibilityHitTest:withEvent:](self, "__accessibilityHitTest:withEvent:", a4, x, y);
      if (v23) {
        id v15 = v23;
      }
      else {
        id v15 = self;
      }
    }
    if (v14
      && (!v15
       || [(TSDCanvasViewAccessibility *)self tsaxHitTestingShouldReplaceElement:v15 withTouchContainerView:v14]))
    {
      return v14;
    }
  }
  return v15;
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString(@"canvas.general.description");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  [(TSDCanvasViewAccessibility *)&v4 didAddSubview:a3];
  [(TSDCanvasViewAccessibility *)self tsaxInvalidateChildrenEventually];
}

- (void)willRemoveSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  [(TSDCanvasViewAccessibility *)&v4 willRemoveSubview:a3];
  [(TSDCanvasViewAccessibility *)self tsaxInvalidateChildrenEventually];
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasViewAccessibility;
  [(TSDCanvasViewAccessibility *)&v5 exchangeSubviewAtIndex:a3 withSubviewAtIndex:a4];
  [(TSDCanvasViewAccessibility *)self tsaxInvalidateChildrenEventually];
}

- (void)bringSubviewToFront:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  [(TSDCanvasViewAccessibility *)&v4 bringSubviewToFront:a3];
  [(TSDCanvasViewAccessibility *)self tsaxInvalidateChildrenEventually];
}

- (void)sendSubviewToBack:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasViewAccessibility;
  [(TSDCanvasViewAccessibility *)&v4 sendSubviewToBack:a3];
  [(TSDCanvasViewAccessibility *)self tsaxInvalidateChildrenEventually];
}

- (void)dealloc
{
  [(TSDCanvasViewAccessibility *)self _tsaxSetBeingDeallocated:1];
  [(TSDCanvasViewAccessibility *)self tsaxInvalidateChildrenImmediately];
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasViewAccessibility;
  [(TSDCanvasViewAccessibility *)&v3 dealloc];
}

@end