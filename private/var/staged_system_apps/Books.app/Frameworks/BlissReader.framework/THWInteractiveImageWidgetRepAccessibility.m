@interface THWInteractiveImageWidgetRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxWidgetInteractionDisabledOnPage;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxShouldHideChildReps;
- (BOOL)thaxShouldIgnoreCanvasForICC:(id)a3;
- (NSArray)thaxCalloutReps;
- (THTSDCanvasViewAccessibility)thaxScrollContainerCanvasView;
- (THTSDCanvasViewAccessibility)thaxScrollContentCanvasView;
- (THWOverlayableZoomableCanvasControllerAccessibility)_thaxStageCanvasController;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)thaxCalloutInfoForDisplay;
- (void)overlayableZoomableCanvasController:(id)a3 didEndZoomingAtScale:(double)a4;
- (void)thaxSelectCallout:(id)a3;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation THWInteractiveImageWidgetRepAccessibility

- (BOOL)isAccessibilityElement
{
  return [(THWInteractiveImageWidgetRepAccessibility *)self _thaxWidgetInteractionDisabledOnPage];
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString(@"widgets.interactive");
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString(@"widgets.interactive.hint.ios");
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  v5 = [(THWInteractiveImageWidgetRepAccessibility *)self thaxScrollContentCanvasView];
  if (v5)
  {
    v6 = v5;
    [(THTSDCanvasViewAccessibility *)v5 setAccessibilityElementsHidden:1];
    [(THTSDCanvasViewAccessibility *)v6 setIsAccessibilityElement:0];
    [(THTSDCanvasViewAccessibility *)v6 setAccessibilityTraits:UIAccessibilityTraitNone];
  }
  v7.receiver = self;
  v7.super_class = (Class)THWInteractiveImageWidgetRepAccessibility;
  [(TSDRepAccessibility *)&v7 tsaxLoadChildrenIntoCollection:a3];
}

- (BOOL)thaxShouldHideChildReps
{
  return [(THWInteractiveImageWidgetRepAccessibility *)self _thaxWidgetInteractionDisabledOnPage];
}

- (void)overlayableZoomableCanvasController:(id)a3 didEndZoomingAtScale:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageWidgetRepAccessibility;
  [(THWInteractiveImageWidgetRepAccessibility *)&v5 overlayableZoomableCanvasController:a3 didEndZoomingAtScale:a4];
  [(THTSDCanvasViewAccessibility *)[(THWInteractiveImageWidgetRepAccessibility *)self thaxScrollContainerCanvasView] tsaxInvalidateChildrenEventually];
}

- (BOOL)thaxShouldIgnoreCanvasForICC:(id)a3
{
  return [(THWInteractiveImageWidgetRepAccessibility *)self _thaxWidgetInteractionDisabledOnPage];
}

- (BOOL)_thaxWidgetInteractionDisabledOnPage
{
  return [(THWInteractiveImageWidgetRepAccessibility *)self tsaxBoolValueForKey:@"p_widgetInteractionDisabledOnPage"];
}

+ (id)tsaxTargetClassName
{
  return @"THWInteractiveImageWidgetRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)thaxSelectCallout:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_295018;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (NSArray)thaxCalloutReps
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"calloutReps"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THTSDCanvasViewAccessibility)thaxScrollContainerCanvasView
{
  v2 = [(THWInteractiveImageWidgetRepAccessibility *)self _thaxStageCanvasController];

  return [(THWOverlayableZoomableCanvasControllerAccessibility *)v2 thaxScrollContainerCanvasView];
}

- (THTSDCanvasViewAccessibility)thaxScrollContentCanvasView
{
  v2 = [(THWInteractiveImageWidgetRepAccessibility *)self _thaxStageCanvasController];

  return [(THWOverlayableZoomableCanvasControllerAccessibility *)v2 thaxScrollContentCanvasView];
}

- (id)thaxCalloutInfoForDisplay
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"calloutInfoForDisplay"];
}

- (THWOverlayableZoomableCanvasControllerAccessibility)_thaxStageCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWOverlayableZoomableCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"stageCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end