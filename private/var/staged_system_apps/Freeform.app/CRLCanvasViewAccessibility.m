@interface CRLCanvasViewAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilityShouldUpdateQuickSpeakContent;
- (BOOL)_crlaxHasEnqueuedBlockToLoadChildren;
- (BOOL)_crlaxIsBeingDeallocated;
- (BOOL)accessibilityEditOperationAction:(id)a3;
- (BOOL)crlaxHitTestingShouldReplaceElement:(id)a3 withTouchContainerView:(id)a4;
- (BOOL)crlaxIsReadyToLoadChildren;
- (BOOL)crlaxShouldPreventReloadingChildren;
- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm;
- (BOOL)crlaxViewCanBeAddedToContainerElements:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CRLCanvasAccessibility)crlaxCanvas;
- (CRLCanvasInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController;
- (CRLCanvasLayerAccessibility)crlaxCanvasLayer;
- (UICoordinateSpace)coordinateSpace;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySpeakThisElementsAndStrings;
- (id)_accessibilityTextOperations;
- (id)_crlaxLeafChildren;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)commentActionTitle;
- (id)crlaxEnclosingScrollView;
- (id)focusItemsInRect:(CGRect)a3;
- (id)selectObjectsActionTitle;
- (unint64_t)accessibilityTraits;
- (void)_crlaxInsertLeafElements:(id)a3 intoArray:(id)a4;
- (void)_crlaxSetBeingDeallocated:(BOOL)a3;
- (void)_crlaxSetHasEnqueuedBlockToLoadChildren:(BOOL)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)crlaxChildWillBeRemoved:(id)a3;
- (void)crlaxDidInvalidateChildren;
- (void)crlaxLoadAccessibilityInformation;
- (void)crlaxLoadChildrenIntoCollection:(id)a3;
- (void)crlaxSetShouldPreventReloadingChildren:(BOOL)a3;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4;
- (void)sendSubviewToBack:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation CRLCanvasViewAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasView";
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

- (CRLCanvasAccessibility)crlaxCanvas
{
  v2 = [(CRLCanvasViewAccessibility *)self crlaxInteractiveCanvasController];
  id v3 = [v2 crlaxCanvas];

  return (CRLCanvasAccessibility *)v3;
}

- (CRLCanvasInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  char v8 = 0;
  v2 = [(CRLCanvasViewAccessibility *)self crlaxTarget];
  id v3 = [v2 controller];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v6;
}

- (CRLCanvasLayerAccessibility)crlaxCanvasLayer
{
  char v8 = 0;
  v2 = [(CRLCanvasViewAccessibility *)self crlaxTarget];
  id v3 = [v2 canvasLayer];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLCanvasLayerAccessibility *)v6;
}

- (id)crlaxEnclosingScrollView
{
  id v3 = [(CRLCanvasViewAccessibility *)self crlaxTarget];
  v4 = [v3 enclosingScrollView];

  if (!v4)
  {
    if ([(CRLCanvasViewAccessibility *)self crlaxRespondsToSelector:"crlaxSearchForAncestorViewOfType:" fromOptionalExtrasProtocol:&OBJC_PROTOCOL___CRLCanvasViewAccessibilityExtras])
    {
      v4 = [(CRLCanvasViewAccessibility *)self crlaxSearchForAncestorViewOfType:NSClassFromString(@"CRLScrollView")];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)crlaxLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasViewAccessibility;
  [(CRLCanvasViewAccessibility *)&v5 crlaxLoadAccessibilityInformation];
  id v3 = [(CRLCanvasViewAccessibility *)self crlaxCanvas];
  v4 = [v3 crlaxAllReps];
  [v4 makeObjectsPerformSelector:"crlaxLoadAccessibilityInformation"];
}

- (BOOL)_crlaxIsBeingDeallocated
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9678);
}

- (void)_crlaxSetBeingDeallocated:(BOOL)a3
{
}

- (BOOL)_crlaxHasEnqueuedBlockToLoadChildren
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9679);
}

- (void)_crlaxSetHasEnqueuedBlockToLoadChildren:(BOOL)a3
{
}

- (BOOL)crlaxShouldPreventReloadingChildren
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A967A);
}

- (void)crlaxSetShouldPreventReloadingChildren:(BOOL)a3
{
}

- (BOOL)crlaxHitTestingShouldReplaceElement:(id)a3 withTouchContainerView:(id)a4
{
  return 0;
}

- (BOOL)crlaxViewCanBeAddedToContainerElements:(id)a3
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(CRLCanvasViewAccessibility *)self crlaxChildren];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)accessibilityElements
{
  v2 = [(CRLCanvasViewAccessibility *)self crlaxChildren];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([v2 count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v7 = [v2 objectAtIndexedSubscript:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v3 addObject:v7];
        if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v6 = v5;
        }
      }
      else
      {
        [v4 addObject:v7];
      }

      ++v5;
    }
    while (v5 < (unint64_t)[v2 count]);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      char v8 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v6, [v3 count]);
      [v4 insertObjects:v3 atIndexes:v8];
      id v9 = [v4 copy];

      v2 = v9;
    }
  }

  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(CRLCanvasViewAccessibility *)self crlaxInteractiveCanvasController];
  id v4 = [v3 crlaxTarget];
  unint64_t v5 = [v4 freehandDrawingToolkit];
  unsigned __int8 v6 = [v5 isInDrawingMode];

  double v7 = -1.0;
  double v8 = -1.0;
  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLCanvasViewAccessibility;
    [(CRLCanvasViewAccessibility *)&v9 accessibilityActivationPoint];
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)crlaxIsReadyToLoadChildren
{
  id v3 = [(CRLCanvasViewAccessibility *)self crlaxInteractiveCanvasController];
  if ([v3 crlaxCurrentlyWaitingOnThreadedLayoutAndRender]) {
    LOBYTE(v4) = 0;
  }
  else {
    unsigned int v4 = ![(CRLCanvasViewAccessibility *)self crlaxShouldPreventReloadingChildren];
  }

  return v4;
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4 = a3;
  if (([(CRLCanvasViewAccessibility *)self accessibilityElementsHidden] & 1) == 0)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    char v46 = 0;
    unint64_t v5 = [(CRLCanvasViewAccessibility *)self crlaxTarget];
    unsigned __int8 v6 = [v5 subviews];

    double v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v6, 1, &v46);
    if (v46) {
LABEL_39:
    }
      abort();
    objc_super v9 = (void *)v8;

    id v10 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if (([v14 accessibilityElementsHidden] & 1) == 0
            && ([v14 isHidden] & 1) == 0)
          {
            [v14 alpha];
            if (v15 > 0.0)
            {
              if ([v14 isAccessibilityElement]) {
                [v4 addObject:v14];
              }
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v11);
    }

    v16 = [(CRLCanvasViewAccessibility *)self crlaxInteractiveCanvasController];
    v17 = [v16 crlaxFilteredTopLevelReps];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
          if (objc_opt_respondsToSelector())
          {
            id v24 = [v23 crlaxAccessibilityElement];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_26;
            }
            id v24 = v23;
          }
          v25 = v24;
          if (v24)
          {
            [v4 addObject:v24];

            continue;
          }
LABEL_26:
          if (CRLAccessibilityShouldPerformValidationChecks())
          {
            int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
            if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"crlaxAccessibilityElement must return an element!", v27, v28, v29, v30, v31, v38))goto LABEL_39; {
          }
            }
        }
        id v20 = [v18 countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v20);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v32 = v4;
    id v33 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v39;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v38 + 1) + 8 * (void)k);
          [v37 crlaxEnsureChildrenAreLoaded];
          [v37 setAccessibilityContainer:self];
        }
        id v34 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v34);
    }
  }
}

- (void)crlaxChildWillBeRemoved:(id)a3
{
}

- (void)crlaxDidInvalidateChildren
{
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 applicationState];

  if (![(CRLCanvasViewAccessibility *)self _crlaxHasEnqueuedBlockToLoadChildren]
    && ![(CRLCanvasViewAccessibility *)self _crlaxIsBeingDeallocated]
    && ![(CRLCanvasViewAccessibility *)self crlaxShouldPreventReloadingChildren]
    && v4 != (id)2)
  {
    unint64_t v5 = [(CRLCanvasViewAccessibility *)self crlaxInteractiveCanvasController];
    unsigned __int8 v6 = [v5 crlaxCanvas];
    double v7 = [v6 crlaxTarget];

    [(CRLCanvasViewAccessibility *)self _crlaxSetHasEnqueuedBlockToLoadChildren:1];
    [v7 i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10032405C;
    v8[3] = &unk_1014CBF60;
    objc_copyWeak(&v9, &location);
    [v7 afterLayoutIncludingLayers:1 performBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  CRLAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[CRLCanvasViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    uint64_t v8 = self;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v9 = [(CRLCanvasViewAccessibility *)v8 subviews];
    id v10 = [v9 countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v71;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v71 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v70 + 1) + 8 * v13);
        [v14 convertPoint:v8 fromView:x, y];
        double v15 = [v14 __accessibilityHitTest:v7];
        if (([v15 isAccessibilityElement] & 1) != 0
          || (unint64_t v16 = (unint64_t)[v15 accessibilityTraits],
              (CRLAccessibilityTraitTouchContainer & v16) != 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ([v15 isHidden] & 1) == 0) {
            break;
          }
        }

        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v70 objects:v77 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      unsigned __int8 v17 = [v15 isAccessibilityElement];

      if (v17) {
        goto LABEL_71;
      }
    }
    else
    {
LABEL_13:

      double v15 = 0;
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v18 = [(CRLCanvasViewAccessibility *)v8 subviews];
    id v19 = [v18 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v67;
LABEL_18:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v67 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v66 + 1) + 8 * v22);
        [v23 convertPoint:v8 fromView:x, y];
        id v24 = [v23 __accessibilityHitTest:v7];
        if ([v24 isAccessibilityElement])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v24 isHidden]) {
            break;
          }
        }

        if (v20 == (id)++v22)
        {
          id v20 = [v18 countByEnumeratingWithState:&v66 objects:v76 count:16];
          if (v20) {
            goto LABEL_18;
          }
          goto LABEL_26;
        }
      }
    }
    else
    {
LABEL_26:

      v25 = [(CRLCanvasViewAccessibility *)v8 crlaxCanvas];
      v26 = [v25 crlaxMiniFormatterElements];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v18 = v26;
      id v27 = [v18 countByEnumeratingWithState:&v62 objects:v75 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v63;
        while (2)
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v63 != v29) {
              objc_enumerationMutation(v18);
            }
            uint64_t v31 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            char v61 = 0;
            id v32 = v31;
            id v33 = (objc_class *)objc_opt_class();
            uint64_t v34 = __CRLAccessibilityCastAsClass(v33, (uint64_t)v32, 1, &v61);
            if (v61) {
LABEL_76:
            }
              abort();
            id v35 = (id)v34;

            if (v35)
            {
              [v35 convertPoint:v8 fromView:x, y];
              id v24 = [v35 __accessibilityHitTest:v7];
              if ([v24 isAccessibilityElement])
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0 || ![v24 isHidden])
                {
                  v37 = v18;
                  goto LABEL_68;
                }
              }
            }
          }
          id v28 = [v18 countByEnumeratingWithState:&v62 objects:v75 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }

      v36 = [(CRLCanvasViewAccessibility *)v8 crlaxCanvas];
      v37 = [v36 crlaxMiniFormatterView];

      if (v37 && ([v37 frame], v79.x = x, v79.double y = y, CGRectContainsPoint(v80, v79)))
      {
        id v24 = 0;
      }
      else
      {
        long long v38 = [(CRLCanvasViewAccessibility *)v8 crlaxCanvas];
        long long v39 = [v38 crlaxTopLevelRepsOmittingMiniFormatterElements];

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v35 = v39;
        id v40 = [v35 countByEnumeratingWithState:&v57 objects:v74 count:16];
        if (v40)
        {
          id v41 = v40;
          uint64_t v56 = *(void *)v58;
          while (2)
          {
            for (j = 0; j != v41; j = (char *)j + 1)
            {
              if (*(void *)v58 != v56) {
                objc_enumerationMutation(v35);
              }
              long long v43 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
              char v61 = 0;
              id v44 = v43;
              long long v45 = (objc_class *)objc_opt_class();
              uint64_t v46 = __CRLAccessibilityCastAsClass(v45, (uint64_t)v44, 1, &v61);
              if (v61) {
                goto LABEL_76;
              }
              long long v47 = (void *)v46;

              if (v47)
              {
                [v47 convertPoint:v8 fromView:x, y];
                id v24 = [v47 __accessibilityHitTest:v7];
                if ([v24 isAccessibilityElement])
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v24 isHidden])
                  {
                    long long v48 = v35;
                    v37 = v55;
                    goto LABEL_67;
                  }
                }
              }
            }
            id v41 = [v35 countByEnumeratingWithState:&v57 objects:v74 count:16];
            if (v41) {
              continue;
            }
            break;
          }
        }

        long long v48 = [(CRLCanvasViewAccessibility *)v8 crlaxInteractiveCanvasController];
        long long v49 = [v48 _accessibilityHitTest:v7 withEvent:x, y];
        long long v50 = v49;
        if (v49
          && (([v49 isAccessibilityElement] & 1) != 0
           || (unint64_t v51 = (unint64_t)[v50 accessibilityTraits],
               (CRLAccessibilityTraitTouchContainer & v51) != 0))
          || (-[CRLCanvasViewAccessibility __accessibilityHitTest:withEvent:](v8, "__accessibilityHitTest:withEvent:", v7, x, y), long long v47 = objc_claimAutoreleasedReturnValue(), v50, (v50 = v47) != 0))
        {
          v52 = v50;

          long long v47 = v52;
        }
        else
        {
          v52 = v8;
        }
        v37 = v55;
        if (v15
          && (!v52
           || [(CRLCanvasViewAccessibility *)v8 crlaxHitTestingShouldReplaceElement:v52 withTouchContainerView:v15]))
        {
          v53 = v15;

          v52 = v53;
        }
        uint64_t v8 = v52;
        id v24 = v8;
LABEL_67:

LABEL_68:
      }
    }
    double v15 = v24;
LABEL_71:
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (id)accessibilityLabel
{
  v2 = [(CRLCanvasViewAccessibility *)self crlaxInteractiveCanvasController];
  unsigned int v3 = [v2 crlaxShouldLabelCanvas];

  if (v3)
  {
    id v4 = +[NSBundle mainBundle];
    unint64_t v5 = [v4 localizedStringForKey:@"Canvas" value:0 table:0];

    uint64_t v12 = __CRLAccessibilityStringForVariables(1, v5, v6, v7, v8, v9, v10, v11, @"__CRLAccessibilityStringForVariablesSentinel");
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasViewAccessibility;
  unint64_t v3 = [(CRLCanvasViewAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(CRLCanvasViewAccessibility *)self isAccessibilityElement];
  uint64_t v5 = CRLAccessibilityTraitTouchContainer;
  if (v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  return 1;
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasViewAccessibility;
  v2 = [(CRLCanvasViewAccessibility *)&v5 _accessibilitySpeakThisElementsAndStrings];
  unint64_t v3 = [v2 crl_arrayOfObjectsPassingTest:&stru_1014EE498];

  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  [(CRLCanvasViewAccessibility *)self crlaxCGRectValueForKey:@"_accessibilityVisibleFrame"];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CRLCanvasViewAccessibility *)self crlaxTarget];
  [v11 convertRect:0 fromView:v4, v6, v8, v10];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  id v20 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  uint64_t v21 = +[NSBundle mainBundle];
  uint64_t v22 = [v21 localizedStringForKey:@"Drop Item" value:0 table:0];
  double v23 = sub_100065738(v13, v15, v17, v19);
  double v25 = v24;
  v26 = [(CRLCanvasViewAccessibility *)self crlaxTarget];
  id v27 = [v20 initWithName:v22 point:v26 inView:v23];

  id v30 = v27;
  id v28 = +[NSArray arrayWithObjects:&v30 count:1];

  return v28;
}

- (id)_accessibilityTextOperations
{
  double v3 = +[NSMutableArray array];
  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasViewAccessibility;
  double v4 = [(CRLCanvasViewAccessibility *)&v7 _accessibilityTextOperations];
  [v3 crlaxAddObjectsFromArrayIfNotNil:v4];

  double v5 = [(CRLCanvasViewAccessibility *)self selectObjectsActionTitle];
  [v3 addObject:v5];

  return v3;
}

- (BOOL)accessibilityEditOperationAction:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLCanvasViewAccessibility *)self selectObjectsActionTitle];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    objc_super v7 = [(CRLCanvasViewAccessibility *)self crlaxInteractiveCanvasController];
    double v8 = [v7 crlaxCanvasEditor];
    [v8 enterQuickSelectMode:0];

    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLCanvasViewAccessibility;
    BOOL v9 = [(CRLCanvasViewAccessibility *)&v11 accessibilityEditOperationAction:v4];
  }

  return v9;
}

- (UICoordinateSpace)coordinateSpace
{
  v2 = +[UIScreen mainScreen];
  double v3 = [v2 coordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = +[NSMutableArray array];
  BOOL v9 = [(CRLCanvasViewAccessibility *)self _crlaxLeafChildren];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v14 accessibilityFrame];
        v27.origin.CGFloat x = v15;
        v27.origin.CGFloat y = v16;
        v27.size.CGFloat width = v17;
        v27.size.CGFloat height = v18;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        if (CGRectContainsRect(v26, v27)
          && [v14 conformsToProtocol:&OBJC_PROTOCOL___UIFocusItem])
        {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_crlaxLeafChildren
{
  double v3 = +[NSMutableArray array];
  [(CRLCanvasViewAccessibility *)self _crlaxInsertLeafElements:self intoArray:v3];
  [v3 removeObject:self];

  return v3;
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  [(CRLCanvasViewAccessibility *)&v4 didAddSubview:a3];
  [(CRLCanvasViewAccessibility *)self crlaxInvalidateChildren];
}

- (void)willRemoveSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  [(CRLCanvasViewAccessibility *)&v4 willRemoveSubview:a3];
  [(CRLCanvasViewAccessibility *)self crlaxInvalidateChildren];
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasViewAccessibility;
  [(CRLCanvasViewAccessibility *)&v5 exchangeSubviewAtIndex:a3 withSubviewAtIndex:a4];
  [(CRLCanvasViewAccessibility *)self crlaxInvalidateChildren];
}

- (void)bringSubviewToFront:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  [(CRLCanvasViewAccessibility *)&v4 bringSubviewToFront:a3];
  [(CRLCanvasViewAccessibility *)self crlaxInvalidateChildren];
}

- (void)sendSubviewToBack:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasViewAccessibility;
  [(CRLCanvasViewAccessibility *)&v4 sendSubviewToBack:a3];
  [(CRLCanvasViewAccessibility *)self crlaxInvalidateChildren];
}

- (void)dealloc
{
  [(CRLCanvasViewAccessibility *)self _crlaxSetBeingDeallocated:1];
  [(CRLCanvasViewAccessibility *)self crlaxInvalidateChildren];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasViewAccessibility;
  [(CRLCanvasViewAccessibility *)&v3 dealloc];
}

- (void)_crlaxInsertLeafElements:(id)a3 intoArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 accessibilityElements];
  if ([v6 isAccessibilityElement])
  {
    [v7 addObject:v6];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        CGFloat v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[CRLCanvasViewAccessibility _crlaxInsertLeafElements:intoArray:](self, "_crlaxInsertLeafElements:intoArray:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), v7, (void)v14);
          CGFloat v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)selectObjectsActionTitle
{
  v2 = +[NSBundle mainBundle];
  objc_super v3 = [v2 localizedStringForKey:@"Select Objects…" value:0 table:0];

  return v3;
}

- (id)commentActionTitle
{
  v2 = +[NSBundle mainBundle];
  objc_super v3 = [v2 localizedStringForKey:@"Comment" value:0 table:0];

  return v3;
}

@end