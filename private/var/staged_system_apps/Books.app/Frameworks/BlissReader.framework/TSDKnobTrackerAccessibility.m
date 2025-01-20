@interface TSDKnobTrackerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxKnobTrackerWithRep:(id)a3 knob:(id)a4;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD;
- (CGRect)tsaxCurrentBoundsForStandardKnobs;
- (NSString)tsaxHUDDisplayString;
- (TSDKnobAccessibility)tsaxKnob;
- (void)_tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:(BOOL)a3;
- (void)tsaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:(id)a3;
@end

@implementation TSDKnobTrackerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDKnobTracker";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573892);
}

- (void)_tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:(BOOL)a3
{
}

+ (id)tsaxKnobTrackerWithRep:(id)a3 knob:(id)a4
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_258B84;
  v11 = sub_258B94;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_258BA0;
  v6[3] = &unk_46BA00;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (TSDKnobAccessibility)tsaxKnob
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDKnobAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDKnobTrackerAccessibility *)self tsaxValueForKey:@"knob"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (CGRect)tsaxCurrentBoundsForStandardKnobs
{
  [(TSDKnobTrackerAccessibility *)self tsaxCGRectValueForKey:@"currentBoundsForStandardKnobs"];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)tsaxHUDDisplayString
{
  return 0;
}

- (void)tsaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:(id)a3
{
  if ([(TSDKnobTrackerAccessibility *)self _tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD])
  {
    double v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    double v5 = self;
    [(TSDKnobTrackerAccessibility *)self _tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSDKnobTrackerAccessibility *)self _tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:0];
  }
}

@end