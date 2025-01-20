@interface THWInteractiveImageCalloutRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_thaxWasSelectedPriorToAccessibilityActivate;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxAnyCalloutIsSelected;
- (BOOL)thaxIsAnimatingCallouts;
- (BOOL)thaxIsVisibleOnPage;
- (BOOL)thaxShouldHideChildReps;
- (BOOL)tsaxIsSelectable;
- (BOOL)tsaxIsSelected;
- (BOOL)tsaxSelect;
- (NSString)thaxDescription;
- (NSString)thaxTitle;
- (THWInteractiveImageWidgetRepAccessibility)_thaxHost;
- (id)_thaxCalloutInfo;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)tsaxInfo;
- (void)_thaxSetWasSelectedPriorToAccessibilityActivate:(BOOL)a3;
- (void)updateFromLayout;
@end

@implementation THWInteractiveImageCalloutRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWInteractiveImageCalloutRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxTitle
{
  id v2 = [[self _thaxCalloutInfo] tsaxValueForKey:@"titleStorage"];
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[v2 tsaxValueForKey:@"string"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxDescription
{
  id v2 = [[self _thaxCalloutInfo] tsaxValueForKey:@"descriptionStorage"];
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[v2 tsaxValueForKey:@"string"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)thaxIsAnimatingCallouts
{
  return [(THWInteractiveImageCalloutRepAccessibility *)self tsaxBoolValueForKey:@"p_animatingCallouts"];
}

- (BOOL)thaxAnyCalloutIsSelected
{
  return [(THWInteractiveImageWidgetRepAccessibility *)[(THWInteractiveImageCalloutRepAccessibility *)self _thaxHost] thaxCalloutInfoForDisplay] != 0;
}

- (BOOL)thaxIsVisibleOnPage
{
  [(TSDRepAccessibility *)self tsaxFrameInScreenSpace];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(-[TSDCanvasViewAccessibility tsaxEnclosingScrollView](-[THWInteractiveImageWidgetRepAccessibility thaxScrollContentCanvasView](-[THWInteractiveImageCalloutRepAccessibility _thaxHost](self, "_thaxHost"), "thaxScrollContentCanvasView"), "tsaxEnclosingScrollView")) accessibilityFrame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;

  return CGRectIntersectsRect(*(CGRect *)&v19, *(CGRect *)&v12);
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

- (BOOL)tsaxIsSelected
{
  id v3 = [(THWInteractiveImageWidgetRepAccessibility *)[(THWInteractiveImageCalloutRepAccessibility *)self _thaxHost] thaxCalloutInfoForDisplay];
  return v3 == [(THWInteractiveImageCalloutRepAccessibility *)self tsaxInfo];
}

- (BOOL)tsaxSelect
{
  return 1;
}

- (BOOL)tsaxIsSelectable
{
  return 1;
}

- (id)tsaxInfo
{
  id v2 = [(TSDRepAccessibility *)self tsaxLayout];

  return [(TSDLayoutAccessibility *)v2 tsaxValueForKey:@"calloutInfo"];
}

- (THWInteractiveImageWidgetRepAccessibility)_thaxHost
{
  char v5 = 0;
  id v3 = objc_opt_class();
  result = (THWInteractiveImageWidgetRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"p_host"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxCalloutInfo
{
  id v2 = [(TSDRepAccessibility *)self tsaxValueForKey:@"layout"];

  return [v2 tsaxValueForKey:@"calloutInfo"];
}

- (BOOL)_thaxWasSelectedPriorToAccessibilityActivate
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A77);
}

- (void)_thaxSetWasSelectedPriorToAccessibilityActivate:(BOOL)a3
{
}

- (void)updateFromLayout
{
  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageCalloutRepAccessibility;
  [(THWInteractiveImageCalloutRepAccessibility *)&v4 updateFromLayout];
  if (![(THWInteractiveImageCalloutRepAccessibility *)self thaxIsAnimatingCallouts])
  {
    if ([(THWInteractiveImageCalloutRepAccessibility *)self thaxAnyCalloutIsSelected]
      || ![(THWInteractiveImageCalloutRepAccessibility *)self _thaxWasSelectedPriorToAccessibilityActivate])
    {
      unsigned __int8 v3 = [(THWInteractiveImageCalloutRepAccessibility *)self tsaxIsSelected];
      if (!self || (v3 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else if (!self)
    {
      goto LABEL_9;
    }
    TSAccessibilityPostLayoutChangedNotification(self);
LABEL_9:
    [(THWInteractiveImageCalloutRepAccessibility *)self _thaxSetWasSelectedPriorToAccessibilityActivate:0];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unsigned int v3 = [(THWInteractiveImageCalloutRepAccessibility *)self tsaxIsSelected];
  id result = [(THWInteractiveImageCalloutRepAccessibility *)self thaxTitle];
  id v5 = result;
  if (v3)
  {
    uint64_t v6 = [(THWInteractiveImageCalloutRepAccessibility *)self thaxDescription];
    return __TSAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }
  return result;
}

- (id)accessibilityHint
{
  if ([(THWInteractiveImageCalloutRepAccessibility *)self tsaxIsSelected]) {
    CFStringRef v2 = @"interactive.image.callout.hint.selected.ios";
  }
  else {
    CFStringRef v2 = @"interactive.image.callout.hint.unselected.ios";
  }

  return THAccessibilityLocalizedString((uint64_t)v2);
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

@end