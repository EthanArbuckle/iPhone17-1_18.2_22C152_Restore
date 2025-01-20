@interface TSDInteractiveCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (double)tsaxSmallRepOutsetForHitTesting;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsTearingDown;
- (BOOL)tsaxCurrentlyWaitingOnThreadedLayoutAndRender;
- (BOOL)tsaxInPrintPreviewMode;
- (BOOL)tsaxIsTearingDown;
- (BOOL)tsaxKnobElementIsAccessibilityElement:(id)a3;
- (BOOL)tsaxShapeRepsAreIgnored;
- (CGPoint)tsaxConvertBoundsToUnscaledPoint:(CGPoint)a3;
- (CGPoint)tsaxConvertUnscaledToBoundsPoint:(CGPoint)a3;
- (CGRect)tsaxConvertBoundsToUnscaledRect:(CGRect)a3;
- (CGRect)tsaxConvertUnscaledRectToRulerUnits:(CGRect)a3;
- (CGRect)tsaxConvertUnscaledToBoundsRect:(CGRect)a3;
- (NSArray)tsaxTopLevelRepsForHitTesting;
- (NSSet)tsaxSelectedReps;
- (TSAccessibilityEditMenuControllerItemProvider)tsaxEditMenuItemProvider;
- (TSDCanvasAccessibility)tsaxCanvas;
- (TSDCanvasViewAccessibility)tsaxCanvasView;
- (TSDEditorControllerAccessibility)tsaxEditorController;
- (TSDKeyboardMovementManipulatorAccessibility)tsaxKeyboardMovementManipulator;
- (TSDRepAccessibility)tsaxFirstSelectedRep;
- (TSDRepAccessibility)tsaxFocusedRep;
- (TSDiOSCanvasViewControllerAccessibility)tsaxCanvasViewController;
- (double)_tsaxConvertPointToRulerValue:(double)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_tsaxElementForMovingToSelection;
- (id)_tsaxFirstSelectedRepInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4;
- (id)_tsaxSelectedRepsInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4;
- (id)tsaxActionMenuItemsForRep:(id)a3;
- (id)tsaxCanvasEditor;
- (id)tsaxCanvasSelection;
- (id)tsaxDelegate;
- (id)tsaxDescriptionOfPointValueConvertedToRulerUnit:(double)a3;
- (id)tsaxHitTestWithUnscaledPoint:(CGPoint)a3;
- (id)tsaxLocalizedRulerUnitsForCanvas;
- (id)tsaxRepForInfo:(id)a3;
- (id)tsaxRepForLayout:(id)a3;
- (id)tsaxRepsForInfo:(id)a3;
- (id)tsaxRulerUnitsInstance;
- (void)_tsaxAddSelectionActionsToArray:(id)a3 forRep:(id)a4;
- (void)_tsaxSetIsTearingDown:(BOOL)a3;
- (void)teardown;
- (void)tsaxDidFocusRep:(id)a3;
- (void)tsaxScrollToPrimarySelection;
- (void)tsaxSelectRep:(id)a3;
- (void)tsaxSelectReps:(id)a3;
@end

@implementation TSDInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDInteractiveCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxIsTearingDown
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573891);
}

- (void)_tsaxSetIsTearingDown:(BOOL)a3
{
}

- (id)tsaxDelegate
{
  return [(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"delegate"];
}

- (BOOL)tsaxCurrentlyWaitingOnThreadedLayoutAndRender
{
  return [(TSDInteractiveCanvasControllerAccessibility *)self tsaxBoolValueForKey:@"currentlyWaitingOnThreadedLayoutAndRender"];
}

- (BOOL)tsaxShapeRepsAreIgnored
{
  return 0;
}

- (TSDCanvasViewAccessibility)tsaxCanvasView
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"canvasView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDCanvasAccessibility)tsaxCanvas
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDCanvasAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"canvas"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDEditorControllerAccessibility)tsaxEditorController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDEditorControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"editorController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxCanvasEditor
{
  id v2 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"canvasEditor"];
  if (([v2 conformsToProtocol:NSProtocolFromString(@"TSDCanvasEditor")] & 1) == 0)
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Object doesn't conform to TSDCanvasEditor protocol!", v4, v5, v6, v7, v8, v10))abort(); {
    }
      }
    return 0;
  }
  return v2;
}

- (TSDKeyboardMovementManipulatorAccessibility)tsaxKeyboardMovementManipulator
{
  id v2 = [[self tsaxCanvasEditor] tsaxValueForKey:@"canvasEditorHelper"];
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDKeyboardMovementManipulatorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[v2 tsaxValueForKey:@"keyboardMovementManipulator"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSArray)tsaxTopLevelRepsForHitTesting
{
  if ([(TSDInteractiveCanvasControllerAccessibility *)self tsaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    return 0;
  }

  return (NSArray *)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"topLevelRepsForHitTesting"];
}

- (NSSet)tsaxSelectedReps
{
  id v3 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxCanvasEditor];

  return (NSSet *)[(TSDInteractiveCanvasControllerAccessibility *)self _tsaxSelectedRepsInCanvasEditor:v3 preferExplicitlyFocusedReps:0];
}

- (TSDRepAccessibility)tsaxFirstSelectedRep
{
  id v3 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxCanvasEditor];

  return (TSDRepAccessibility *)[(TSDInteractiveCanvasControllerAccessibility *)self _tsaxFirstSelectedRepInCanvasEditor:v3 preferExplicitlyFocusedReps:0];
}

- (id)tsaxCanvasSelection
{
  id v2 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxCanvasEditor];

  return [v2 tsaxValueForKey:@"canvasSelection"];
}

- (id)_tsaxSelectedRepsInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  BOOL v4 = a4;
  char v37 = 0;
  char v5 = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, objc_msgSend(objc_msgSend(a3, "tsaxValueForKey:", @"canvasSelection"), "tsaxValueForKey:", @"infos"), 1, &v37);
  if (v37) {
LABEL_32:
  }
    abort();
  uint64_t v6 = v5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    id obj = v6;
    uint64_t v27 = *(void *)v34;
    BOOL v25 = v4;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (!v4) {
          goto LABEL_23;
        }
        id v12 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxRepsForInfo:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        v13 = (char *)[v12 count];
        if (!v13) {
          goto LABEL_23;
        }
        if (v13 != (unsigned char *)&dword_0 + 1)
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v17 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v30;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v30 != v19) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
                char v37 = 0;
                v22 = objc_opt_class();
                Class v23 = __TSAccessibilityCastAsSafeCategory(v22, v21, 1, &v37);
                if (v37) {
                  goto LABEL_32;
                }
                Class v16 = v23;
                if ([(objc_class *)v23 tsaxWasExplicitlyFocused]) {
                  goto LABEL_12;
                }
              }
              id v18 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
              BOOL v4 = v25;
            }
            while (v18);
          }
LABEL_23:
          Class v16 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxRepForInfo:v11];
          if (!v16) {
            continue;
          }
          goto LABEL_24;
        }
        char v37 = 0;
        v14 = objc_opt_class();
        Class v15 = __TSAccessibilityCastAsSafeCategory(v14, (uint64_t)[v12 anyObject], 1, &v37);
        if (v37) {
          goto LABEL_32;
        }
        Class v16 = v15;
LABEL_12:
        BOOL v4 = v25;
        if (!v16) {
          goto LABEL_23;
        }
LABEL_24:
        if (!v9) {
          id v9 = +[NSMutableSet set];
        }
        [v9 addObject:v16];
      }
      id v8 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (!v8) {
        return v9;
      }
    }
  }
  return 0;
}

- (id)_tsaxFirstSelectedRepInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  id v4 = [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxSelectedRepsInCanvasEditor:a3 preferExplicitlyFocusedReps:a4];
  id result = [v4 count];
  if (result)
  {
    id v6 = objc_msgSend(objc_msgSend(v4, "allObjects"), "sortedArrayUsingComparator:", &stru_46B9B0);
    return [v6 firstObject];
  }
  return result;
}

- (TSDRepAccessibility)tsaxFocusedRep
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_2574CC;
  uint64_t v11 = sub_2574DC;
  uint64_t v12 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2574E8;
  v4[3] = &unk_46B9D8;
  char v5 = self;
  id v6 = &v7;
  v4[4] = NSProtocolFromString(@"TSDCanvasEditor");
  [(NSArray *)[(TSDEditorControllerAccessibility *)[(TSDInteractiveCanvasControllerAccessibility *)v5 tsaxEditorController] tsaxCurrentEditors] enumerateObjectsWithOptions:2 usingBlock:v4];
  id v2 = (TSDRepAccessibility *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v2;
}

- (BOOL)tsaxInPrintPreviewMode
{
  id v2 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"delegate"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v2 inPrintPreviewMode];
}

- (CGPoint)tsaxConvertBoundsToUnscaledPoint:(CGPoint)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v12 = &unk_41622E;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2576E4;
  v7[3] = &unk_46B940;
  v7[4] = self;
  v7[5] = &v9;
  CGPoint v8 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  double v3 = v10[4];
  double v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v5 = v3;
  double v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)tsaxConvertBoundsToUnscaledRect:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  Class v16 = &unk_41622E;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_25781C;
  v11[3] = &unk_46B968;
  v11[4] = self;
  v11[5] = &v13;
  CGRect v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  double v3 = v14[4];
  double v4 = v14[5];
  double v5 = v14[6];
  double v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)tsaxConvertUnscaledToBoundsPoint:(CGPoint)a3
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  CGRect v12 = &unk_41622E;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_257940;
  v7[3] = &unk_46B940;
  v7[4] = self;
  v7[5] = &v9;
  CGPoint v8 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  double v3 = v10[4];
  double v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v5 = v3;
  double v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)tsaxConvertUnscaledToBoundsRect:(CGRect)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  Class v16 = &unk_41622E;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_257A78;
  v11[3] = &unk_46B968;
  v11[4] = self;
  v11[5] = &v13;
  CGRect v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  double v3 = v14[4];
  double v4 = v14[5];
  double v5 = v14[6];
  double v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)tsaxRepForInfo:(id)a3
{
  if ([(TSDInteractiveCanvasControllerAccessibility *)self tsaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    return 0;
  }
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3052000000;
  CGRect v12 = sub_2574CC;
  uint64_t v13 = sub_2574DC;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_257BE8;
  v8[3] = &unk_457DA0;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  double v7 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v7, v6, 1, &v9);
  if ((_BYTE)v9) {
    abort();
  }
  return result;
}

- (id)tsaxRepsForInfo:(id)a3
{
  if ([(TSDInteractiveCanvasControllerAccessibility *)self tsaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    return 0;
  }
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3052000000;
  CGRect v12 = sub_2574CC;
  uint64_t v13 = sub_2574DC;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_257D50;
  v8[3] = &unk_457DA0;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  double v7 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v7, v6, 1, &v9);
  if ((_BYTE)v9) {
    abort();
  }
  return result;
}

- (id)tsaxRepForLayout:(id)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3052000000;
  double v10 = sub_2574CC;
  uint64_t v11 = sub_2574DC;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_257EA0;
  v6[3] = &unk_457DA0;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  double v4 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v4, v3, 1, &v7);
  if ((_BYTE)v7) {
    abort();
  }
  return result;
}

- (id)tsaxHitTestWithUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = 0;
  HIBYTE(v26) = 0;
  uint64_t v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility hitKnobAtPoint:returningRep:](self, "hitKnobAtPoint:returningRep:", &v27, x, y), 1, (unsigned char *)&v26 + 7);
  if (HIBYTE(v26)) {
    goto LABEL_18;
  }
  Class v8 = v7;
  if (v7)
  {
    int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    double v10 = v27;
    if (ShouldPerformValidationChecks && !v27)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"A knob was hit, but no rep returned!", v12, v13, v14, v15, v16, v26))goto LABEL_18; {
      double v10 = v27;
      }
    }
    id v17 = [v10 tsaxKnobElementForTag:[objc_class tsaxKnobTag]];
    if (!TSAccessibilityShouldPerformValidationChecks()
      || v17
      || (int v18 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
          !__TSAccessibilityHandleValidationErrorWithDescription(v18, 0, @"Knob element not found!", v19, v20, v21, v22, v23, v26)))
    {
      if ([(TSDInteractiveCanvasControllerAccessibility *)self tsaxRespondsToSelector:"tsaxKnobElementIsAccessibilityElement:" fromExtrasProtocol:&OBJC_PROTOCOL___TSDInteractiveCanvasControllerAccessibilityExtras]&& [(TSDInteractiveCanvasControllerAccessibility *)self tsaxKnobElementIsAccessibilityElement:v17]&& v17)
      {
        return v17;
      }
      goto LABEL_13;
    }
LABEL_18:
    abort();
  }
LABEL_13:
  if (objc_opt_respondsToSelector()) {
    return -[TSDInteractiveCanvasControllerAccessibility hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y);
  }
  else {
    return -[TSDInteractiveCanvasControllerAccessibility hitRep:](self, "hitRep:", x, y);
  }
}

- (void)tsaxSelectRep:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2580BC;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)tsaxSelectReps:(id)a3
{
  double v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    Class v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        Class v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 0, 0);
        if ([(objc_class *)v13 tsaxIsSelectable])
        {
          id v14 = [(objc_class *)v13 tsaxInfo];
          if (v14)
          {
            [v5 addObject:v14];
            if (!v8) {
              Class v8 = v13;
            }
          }
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    Class v8 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2582B8;
  v15[3] = &unk_456E38;
  v15[4] = self;
  v15[5] = v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v15)) {
    abort();
  }

  [(TSDInteractiveCanvasControllerAccessibility *)self tsaxDidFocusRep:v8];
}

- (void)tsaxDidFocusRep:(id)a3
{
  id v5 = [a3 tsaxInfo];
  if (v5)
  {
    id v6 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxRepsForInfo:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          char v14 = 0;
          uint64_t v12 = objc_opt_class();
          Class v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 1, &v14);
          if (v14) {
            abort();
          }
          [(objc_class *)v13 tsaxSetWasExplicitlyFocused:[(objc_class *)v13 isEqual:a3]];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

- (void)tsaxScrollToPrimarySelection
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2584B0;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (BOOL)tsaxIsTearingDown
{
  return [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxIsTearingDown];
}

+ (double)tsaxSmallRepOutsetForHitTesting
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25858C;
  v4[3] = &unk_4573D8;
  v4[4] = a1;
  void v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)tsaxLocalizedRulerUnitsForCanvas
{
  id v2 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxRulerUnitsInstance];

  return [v2 tsaxLocalizedCompatibleRulerUnitsForCanvas];
}

- (CGRect)tsaxConvertUnscaledRectToRulerUnits:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxConvertPointToRulerValue:a3.origin.x];
  double v8 = v7;
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxConvertPointToRulerValue:y];
  double v10 = v9;
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxConvertPointToRulerValue:width];
  double v12 = v11;
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxConvertPointToRulerValue:height];
  double v14 = v13;
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.size.double height = v14;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)tsaxDescriptionOfPointValueConvertedToRulerUnit:(double)a3
{
  id v5 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxRulerUnitsInstance];
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxConvertPointToRulerValue:a3];
  id v6 = TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString(@"ruler.formatter.general %@ %@"), v6, [v5 tsaxLocalizedCompatibleRulerUnitsForCanvas]);
}

- (id)tsaxRulerUnitsInstance
{
  id v2 = [NSClassFromString(@"TSKRulerUnits") tsaxValueForKey:@"instance"];
  char v5 = 0;
  uint64_t v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (double)_tsaxConvertPointToRulerValue:(double)a3
{
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_258854;
  v6[3] = &unk_458E98;
  v6[4] = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxRulerUnitsInstance];
  v6[5] = &v7;
  *(double *)&v6[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return round(v4 * 10.0) / 10.0;
}

- (void)teardown
{
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxSetIsTearingDown:1];
  v3.receiver = self;
  v3.super_class = (Class)TSDInteractiveCanvasControllerAccessibility;
  [(TSDInteractiveCanvasControllerAccessibility *)&v3 teardown];
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxSetIsTearingDown:0];
}

- (TSDiOSCanvasViewControllerAccessibility)tsaxCanvasViewController
{
  char v5 = 0;
  objc_super v3 = objc_opt_class();
  id result = (TSDiOSCanvasViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"layerHost"), "tsaxValueForKey:", @"asiOSCVC"), 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_tsaxElementForMovingToSelection
{
  char v6 = 0;
  objc_super v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"textInputResponder"], 1, &v6);
  if (v6) {
    abort();
  }
  id result = [(objc_class *)v4 tsaxFocusedElement];
  if (!result) {
    return [(TSDRepAccessibility *)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxFocusedRep] tsaxFocusedElement];
  }
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](self, "tsaxConvertBoundsToUnscaledPoint:");
  id v8 = -[TSDInteractiveCanvasControllerAccessibility tsaxHitTestWithUnscaledPoint:](self, "tsaxHitTestWithUnscaledPoint:");
  if (([v8 isAccessibilityElement] & 1) == 0)
  {
    id v9 = [v8 _accessibilityHitTest:a4 withEvent:x, y];
    if ([v9 isAccessibilityElement]) {
      return v9;
    }
    else {
      return 0;
    }
  }
  return v8;
}

- (TSAccessibilityEditMenuControllerItemProvider)tsaxEditMenuItemProvider
{
  id result = (TSAccessibilityEditMenuControllerItemProvider *)__TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___TSAccessibilityEditMenuControllerItemProvider, [(TSDEditorControllerAccessibility *)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxEditorController] tsaxTextInputEditor], 0, 0);
  if (!result)
  {
    Class v4 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxCanvasViewController];
    return (TSAccessibilityEditMenuControllerItemProvider *)__TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___TSAccessibilityEditMenuControllerItemProvider, v4, 0, 0);
  }
  return result;
}

- (id)tsaxActionMenuItemsForRep:(id)a3
{
  id v5 = +[NSMutableArray array];
  [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxAddSelectionActionsToArray:v5 forRep:a3];
  return v5;
}

- (void)_tsaxAddSelectionActionsToArray:(id)a3 forRep:(id)a4
{
  if (([a4 tsaxIsSelected] & 1) == 0)
  {
    id v7 = [(TSDInteractiveCanvasControllerAccessibility *)self _tsaxElementForMovingToSelection];
    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_2782B8;
      v10[3] = &unk_45A908;
      v10[4] = v7;
      +[TSAccessibilityBlockBasedCustomAction addActionToArray:a3 withName:TSAccessibilityLocalizedString(@"move.to.selected.element.action.title") actionBlock:v10];
    }
    id v8 = [a4 tsaxRepForSelecting];
    if (v8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_2782D8;
      v9[3] = &unk_46C2E8;
      v9[4] = v8;
      v9[5] = a4;
      +[TSAccessibilityBlockBasedCustomAction addActionToArray:a3 withName:TSAccessibilityLocalizedString(@"select.action.title") actionBlock:v9];
    }
  }
}

- (BOOL)tsaxKnobElementIsAccessibilityElement:(id)a3
{
  return [a3 isAccessibilityElement];
}

@end