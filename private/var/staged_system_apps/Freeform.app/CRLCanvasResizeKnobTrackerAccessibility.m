@interface CRLCanvasResizeKnobTrackerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (id)crlaxHUDDisplayString;
- (void)p_updateHUD;
@end

@implementation CRLCanvasResizeKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLResizeKnobTracker";
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

- (id)crlaxHUDDisplayString
{
  char v8 = 0;
  v2 = [(CRLCanvasResizeKnobTrackerAccessibility *)self crlaxTarget];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v8);
  if (v8) {
    abort();
  }
  v5 = (void *)v4;

  v6 = [v5 crlaxHudLabelText];

  return v6;
}

- (void)p_updateHUD
{
  if (![(CRLCanvasKnobTrackerAccessibility *)self crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD])
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLCanvasResizeKnobTrackerAccessibility;
    [(CRLCanvasResizeKnobTrackerAccessibility *)&v3 p_updateHUD];
  }
}

@end