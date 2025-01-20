@interface CRLCanvasKnobTrackerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxKnobTrackerWithRep:(id)a3 knob:(id)a4;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD;
- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob;
- (CGRect)crlaxCurrentBoundsForStandardKnobs;
- (CRLCanvasKnobAccessibility)crlaxKnob;
- (NSString)crlaxHUDDisplayString;
- (void)_crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:(BOOL)a3;
- (void)crlaxAnnounceString:(id)a3;
- (void)crlaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:(id)a3;
- (void)endMovingKnob;
@end

@implementation CRLCanvasKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasKnobTracker";
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

- (BOOL)_crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9B38);
}

- (void)_crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:(BOOL)a3
{
}

+ (id)crlaxKnobTrackerWithRep:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10044614C;
  v21 = sub_10044615C;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100446164;
  v12[3] = &unk_1014EDE08;
  v15 = &v17;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12)) {
    abort();
  }

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (CRLCanvasKnobAccessibility)crlaxKnob
{
  char v8 = 0;
  v2 = [(CRLCanvasKnobTrackerAccessibility *)self crlaxTarget];
  id v3 = [v2 knob];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  id v6 = (void *)v5;

  return (CRLCanvasKnobAccessibility *)v6;
}

- (CGRect)crlaxCurrentBoundsForStandardKnobs
{
  v2 = [(CRLCanvasKnobTrackerAccessibility *)self crlaxTarget];
  [v2 currentBoundsForStandardKnobs];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)crlaxHUDDisplayString
{
  return 0;
}

- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob
{
  return 0;
}

- (void)crlaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:(id)a3
{
  double v4 = (void (**)(void))a3;
  if ([(CRLCanvasKnobTrackerAccessibility *)self _crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD])
  {
    v4[2]();
  }
  else
  {
    [(CRLCanvasKnobTrackerAccessibility *)self _crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:1];
    v4[2]();
    [(CRLCanvasKnobTrackerAccessibility *)self _crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:0];
  }
}

- (void)crlaxAnnounceString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    CRLAccessibilityPostAnnouncementNotification(0, v3);
  }
}

- (void)endMovingKnob
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasKnobTrackerAccessibility;
  [(CRLCanvasKnobTrackerAccessibility *)&v5 endMovingKnob];
  if ([(CRLCanvasKnobTrackerAccessibility *)self crlaxShouldAnnounceValueUponEndMovingKnob])
  {
    id v3 = [(CRLCanvasKnobTrackerAccessibility *)self crlaxKnob];
    double v4 = [v3 crlaxValue];
    [(CRLCanvasKnobTrackerAccessibility *)self crlaxAnnounceString:v4];
  }
}

@end