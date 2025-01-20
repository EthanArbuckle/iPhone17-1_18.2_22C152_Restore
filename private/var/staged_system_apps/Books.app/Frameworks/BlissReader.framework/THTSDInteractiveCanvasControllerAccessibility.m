@interface THTSDInteractiveCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxShouldSwapHitRepsForDuplicatesInGroupWidgets;
- (BOOL)thaxIsMostOuterICC;
- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBounds:(id)a3;
- (BOOL)thaxShouldFilterOutNonVisibleReps;
- (BOOL)thaxShouldIgnoreCanvas;
- (THDocumentViewControllerAccessibility)thaxDocumentViewController;
- (THTSDCanvasViewAccessibility)thaxCanvasView;
- (id)tsaxActionMenuItemsForRep:(id)a3;
- (void)_thaxSetShouldSwapHitRepsForDuplicatesInGroupWidgets:(BOOL)a3;
@end

@implementation THTSDInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDInteractiveCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THTSDCanvasViewAccessibility)thaxCanvasView
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THTSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THTSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"canvasView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)_thaxShouldSwapHitRepsForDuplicatesInGroupWidgets
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A7C);
}

- (void)_thaxSetShouldSwapHitRepsForDuplicatesInGroupWidgets:(BOOL)a3
{
}

- (THDocumentViewControllerAccessibility)thaxDocumentViewController
{
  v3 = objc_opt_class();
  id v4 = [(THTSDInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"delegate"];

  return (THDocumentViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);
}

- (BOOL)thaxIsMostOuterICC
{
  return [(THTSDInteractiveCanvasControllerAccessibility *)self thaxDocumentViewController] != 0;
}

- (id)tsaxActionMenuItemsForRep:(id)a3
{
  return 0;
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBounds:(id)a3
{
  id v4 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxDelegate];
  if (![v4 conformsToProtocol:&OBJC_PROTOCOL___THTSDInteractiveCanvasControllerAccessibilityDelegate]|| (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }

  return [v4 thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:self];
}

- (BOOL)thaxShouldFilterOutNonVisibleReps
{
  id v3 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxDelegate];
  if (![v3 conformsToProtocol:&OBJC_PROTOCOL___THTSDInteractiveCanvasControllerAccessibilityDelegate]|| (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }

  return [v3 thaxShouldFilterOutNonVisibleRepsForICC:self];
}

- (BOOL)thaxShouldIgnoreCanvas
{
  id v3 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxDelegate];
  if (![v3 conformsToProtocol:&OBJC_PROTOCOL___THTSDInteractiveCanvasControllerAccessibilityDelegate]|| (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }

  return [v3 thaxShouldIgnoreCanvasForICC:self];
}

@end