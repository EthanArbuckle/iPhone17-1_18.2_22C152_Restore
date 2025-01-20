@interface TSDCanvasAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)p_updateRepsFromLayouts;
- (BOOL)tsaxIsDoingLayout;
- (CALayer)tsaxCanvasHostingLayer;
- (CGPoint)tsaxScreenPointFromUnscaledCanvas:(CGPoint)a3;
- (CGRect)tsaxConvertUnscaledToBoundsRect:(CGRect)a3;
- (CGRect)tsaxScreenFrameFromLayerFrameInScaledCanvas:(CGRect)a3;
- (CGRect)tsaxScreenFrameFromUnscaledCanvas:(CGRect)a3;
- (NSArray)tsaxTopLevelReps;
- (NSSet)tsaxAllReps;
- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController;
- (double)tsaxViewScale;
- (id)tsaxCanvasContainerView;
- (void)_tsaxInvalidateViewChildrenEventually;
- (void)i_registerRep:(id)a3;
- (void)i_unregisterRep:(id)a3;
@end

@implementation TSDCanvasAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDCanvas";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDCanvasAccessibility *)self tsaxValueForKey:@"canvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)tsaxIsDoingLayout
{
  return [(TSDCanvasAccessibility *)self tsaxBoolValueForKey:@"mInLayout"];
}

- (NSArray)tsaxTopLevelReps
{
  if ([(TSDInteractiveCanvasControllerAccessibility *)[(TSDCanvasAccessibility *)self tsaxInteractiveCanvasController] tsaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    return 0;
  }
  char v5 = 0;
  v4 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v4, (uint64_t)[(TSDCanvasAccessibility *)self tsaxValueForKey:@"topLevelReps"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSSet)tsaxAllReps
{
  if ([(TSDInteractiveCanvasControllerAccessibility *)[(TSDCanvasAccessibility *)self tsaxInteractiveCanvasController] tsaxCurrentlyWaitingOnThreadedLayoutAndRender])
  {
    return 0;
  }
  char v5 = 0;
  v4 = (objc_class *)objc_opt_class();
  result = (NSSet *)__TSAccessibilityCastAsClass(v4, (uint64_t)[(TSDCanvasAccessibility *)self tsaxValueForKey:@"allReps"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxCanvasContainerView
{
  v2 = [(TSDCanvasAccessibility *)self tsaxInteractiveCanvasController];

  return [(TSDInteractiveCanvasControllerAccessibility *)v2 tsaxCanvasView];
}

- (CALayer)tsaxCanvasHostingLayer
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (CALayer *)__TSAccessibilityCastAsClass(v3, (uint64_t)[-[TSDCanvasAccessibility tsaxCanvasContainerView](self, "tsaxCanvasContainerView") tsaxValueForKey:@"layer"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (CGRect)tsaxScreenFrameFromUnscaledCanvas:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(TSDCanvasAccessibility *)self tsaxInteractiveCanvasController];
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!v7)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Failed to convert unscaled rect to screen rect, this canvas has no ICC.", v9, v10, v11, v12, v13, v19))abort(); {
    }
      }
  }
  v14 = [(TSDInteractiveCanvasControllerAccessibility *)v7 tsaxCanvasView];
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsRect:](v7, "tsaxConvertUnscaledToBoundsRect:", x, y, width, height);

  -[TSDCanvasViewAccessibility tsaxFrameFromBounds:](v14, "tsaxFrameFromBounds:");
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)tsaxScreenFrameFromLayerFrameInScaledCanvas:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(TSDCanvasAccessibility *)self tsaxCanvasContainerView];
  char v21 = 0;
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = __TSAccessibilityCastAsClass(v9, (uint64_t)[v8 tsaxValueForKey:@"layer"], 1, &v21);
  if (v21) {
    abort();
  }
  uint64_t v11 = (CALayer *)v10;
  uint64_t v12 = [(TSDCanvasAccessibility *)self tsaxCanvasHostingLayer];
  if (v11 != v12)
  {
    -[CALayer convertRect:fromLayer:](v11, "convertRect:fromLayer:", v12, x, y, width, height);
    double x = v13;
    double y = v14;
    double width = v15;
    double height = v16;
  }
  [v8 tsaxFrameFromBounds:x, y, width, height];
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGPoint)tsaxScreenPointFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v5 = [(TSDCanvasAccessibility *)self tsaxInteractiveCanvasController];
  v6 = [(TSDInteractiveCanvasControllerAccessibility *)v5 tsaxCanvasView];
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsPoint:](v5, "tsaxConvertUnscaledToBoundsPoint:", x, y);

  -[TSDCanvasViewAccessibility tsaxFramePointFromBoundsPoint:](v6, "tsaxFramePointFromBoundsPoint:");
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGRect)tsaxConvertUnscaledToBoundsRect:(CGRect)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  double v16 = &unk_41622E;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_26FAC0;
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
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (double)tsaxViewScale
{
  [(TSDCanvasAccessibility *)self tsaxCGFloatValueForKey:@"viewScale"];
  return result;
}

- (void)_tsaxInvalidateViewChildrenEventually
{
  v2 = [(TSDInteractiveCanvasControllerAccessibility *)[(TSDCanvasAccessibility *)self tsaxInteractiveCanvasController] tsaxCanvasView];

  [(TSDCanvasViewAccessibility *)v2 tsaxInvalidateChildrenEventually];
}

- (void)i_registerRep:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasAccessibility;
  [(TSDCanvasAccessibility *)&v4 i_registerRep:a3];
  [(TSDCanvasAccessibility *)self _tsaxInvalidateViewChildrenEventually];
}

- (void)i_unregisterRep:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasAccessibility;
  [(TSDCanvasAccessibility *)&v4 i_unregisterRep:a3];
  [(TSDCanvasAccessibility *)self _tsaxInvalidateViewChildrenEventually];
}

- (BOOL)p_updateRepsFromLayouts
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasAccessibility;
  BOOL v3 = [(TSDCanvasAccessibility *)&v5 p_updateRepsFromLayouts];
  [(TSDCanvasAccessibility *)self _tsaxInvalidateViewChildrenEventually];
  return v3;
}

@end