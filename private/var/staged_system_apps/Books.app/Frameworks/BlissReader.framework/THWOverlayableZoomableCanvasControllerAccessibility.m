@interface THWOverlayableZoomableCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3;
- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3;
- (BOOL)thaxShouldIgnoreCanvasForICC:(id)a3;
- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4;
- (THTSDCanvasViewAccessibility)thaxScrollContainerCanvasView;
- (THTSDCanvasViewAccessibility)thaxScrollContentCanvasView;
- (THTSDInteractiveCanvasControllerAccessibility)thaxScrollContainerICC;
- (THTSDInteractiveCanvasControllerAccessibility)thaxScrollContentICC;
- (id)thaxDelegate;
@end

@implementation THWOverlayableZoomableCanvasControllerAccessibility

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v36.receiver = self;
  v36.super_class = (Class)THWOverlayableZoomableCanvasControllerAccessibility;
  -[THWOverlayableZoomableCanvasControllerAccessibility interactiveCanvasController:expandBoundsForHitTesting:](&v36, "interactiveCanvasController:expandBoundsForHitTesting:");
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  if (UIAccessibilityIsVoiceOverRunning()
    && [(THWOverlayableZoomableCanvasControllerAccessibility *)self thaxScrollContainerICC] == a3)
  {
    v37.origin.CGFloat x = v11;
    v37.origin.CGFloat y = v13;
    v37.size.CGFloat width = v15;
    v37.size.CGFloat height = v17;
    BOOL IsNull = CGRectIsNull(v37);
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (!IsNull)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"This class no longer sets the bounds to CGRectNull if the ICC is the scroll container ICC. We probably need to update this logic.", v20, v21, v22, v23, v24, v29[0]))abort(); {
      }
        }
    }
    if (IsNull)
    {
      uint64_t v30 = 0;
      v31 = (double *)&v30;
      uint64_t v32 = 0x4010000000;
      v33 = &unk_41622E;
      long long v34 = 0u;
      long long v35 = 0u;
      v29[0] = (uint64_t)_NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = (uint64_t)sub_28491C;
      v29[3] = (uint64_t)&unk_46B968;
      v29[4] = (uint64_t)self;
      v29[5] = (uint64_t)&v30;
      *(CGFloat *)&v29[6] = x;
      *(CGFloat *)&v29[7] = y;
      *(CGFloat *)&v29[8] = width;
      *(CGFloat *)&v29[9] = height;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v29)) {
        abort();
      }
      CGFloat v11 = v31[4];
      CGFloat v13 = v31[5];
      CGFloat v15 = v31[6];
      CGFloat v17 = v31[7];
      _Block_object_dispose(&v30, 8);
    }
  }
  double v25 = v11;
  double v26 = v13;
  double v27 = v15;
  double v28 = v17;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldIgnoreCanvasForICC:(id)a3
{
  if (![[self thaxDelegate] conformsToProtocol:&OBJC_PROTOCOL___THWOverlayableZoomableCanvasControllerAccessibilityDelegate])return 0; {
  [(THWOverlayableZoomableCanvasControllerAccessibility *)self thaxDelegate];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v5 = [(THWOverlayableZoomableCanvasControllerAccessibility *)self thaxDelegate];

  return [v5 thaxShouldIgnoreCanvasForICC:a3];
}

+ (id)tsaxTargetClassName
{
  return @"THWOverlayableZoomableCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THTSDCanvasViewAccessibility)thaxScrollContainerCanvasView
{
  v2 = [(THWOverlayableZoomableCanvasControllerAccessibility *)self thaxScrollContainerICC];

  return [(THTSDInteractiveCanvasControllerAccessibility *)v2 thaxCanvasView];
}

- (THTSDCanvasViewAccessibility)thaxScrollContentCanvasView
{
  v2 = [(THWOverlayableZoomableCanvasControllerAccessibility *)self thaxScrollContentICC];

  return [(THTSDInteractiveCanvasControllerAccessibility *)v2 thaxCanvasView];
}

- (THTSDInteractiveCanvasControllerAccessibility)thaxScrollContainerICC
{
  char v5 = 0;
  v3 = objc_opt_class();
  CGRect result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWOverlayableZoomableCanvasControllerAccessibility *)self tsaxValueForKey:@"scrollContainerICC"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THTSDInteractiveCanvasControllerAccessibility)thaxScrollContentICC
{
  char v5 = 0;
  v3 = objc_opt_class();
  CGRect result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWOverlayableZoomableCanvasControllerAccessibility *)self tsaxValueForKey:@"scrollContentICC"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)thaxDelegate
{
  return [(THWOverlayableZoomableCanvasControllerAccessibility *)self tsaxValueForKey:@"delegate"];
}

@end