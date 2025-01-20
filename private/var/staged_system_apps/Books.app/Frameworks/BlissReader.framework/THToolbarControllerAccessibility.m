@interface THToolbarControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxAllowsToolbarHideRequests;
- (id)_thaxDelegate;
- (void)setCenterTitle:(id)a3;
- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6;
- (void)thaxForceSetToolbarHidden:(BOOL)a3;
@end

@implementation THToolbarControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THToolbarController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)thaxForceSetToolbarHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)THToolbarControllerAccessibility;
  [(THToolbarControllerAccessibility *)&v3 setToolbarHidden:a3 animated:0 duration:0 completion:0.0];
}

- (void)setCenterTitle:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)THToolbarControllerAccessibility;
  [(THToolbarControllerAccessibility *)&v8 setCenterTitle:a3];
  id v4 = objc_msgSend(objc_msgSend(-[THToolbarControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"toolbar"), "tsaxValueForKey:", @"centerItem"), "tsaxValueForKey:", @"customView");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 subviews];
    if ([v5 count] == (char *)&dword_0 + 1)
    {
      id v6 = [v5 lastObject];
      unint64_t v7 = (unint64_t)[v6 accessibilityTraits];
      [v6 setAccessibilityTraits:UIAccessibilityTraitSummaryElement | v7 | TSAccessibilityTraitHeader];
    }
  }
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    if (!UIAccessibilityIsSwitchControlRunning() || !v9) {
      goto LABEL_7;
    }
LABEL_6:
    if (![(THToolbarControllerAccessibility *)self _thaxAllowsToolbarHideRequests]) {
      return;
    }
    goto LABEL_7;
  }
  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)THToolbarControllerAccessibility;
  [(THToolbarControllerAccessibility *)&v11 setToolbarHidden:v9 animated:v8 duration:a6 completion:a5];
  [self tsaxValueForKey:@"toolbar" setAccessibilityElementsHidden:v9];
}

- (BOOL)_thaxAllowsToolbarHideRequests
{
  objc_super v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, [self _thaxDelegate] tsaxValueForKey:@"documentViewController");

  return [(objc_class *)v4 thaxAllowsToolbarHideRequests];
}

- (id)_thaxDelegate
{
  return [(THToolbarControllerAccessibility *)self tsaxValueForKey:@"delegate"];
}

@end