@interface TSDResizeKnobTrackerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxHUDDisplayString;
- (void)p_updateHUD;
@end

@implementation TSDResizeKnobTrackerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDResizeKnobTracker";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxHUDDisplayString
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDResizeKnobTrackerAccessibility *)self tsaxValueForKey:@"hudLabelText"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)p_updateHUD
{
  if (![(TSDKnobTrackerAccessibility *)self tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD])
  {
    v3.receiver = self;
    v3.super_class = (Class)TSDResizeKnobTrackerAccessibility;
    [(TSDResizeKnobTrackerAccessibility *)&v3 p_updateHUD];
  }
}

@end