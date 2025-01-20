@interface CRLStepperAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (CRLStepperAccessibilityDelegate)crlaxDelegate;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)crlaxPerformFocusAfterDelay:(double)a3;
- (void)crlaxSetDelegate:(id)a3;
@end

@implementation CRLStepperAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLStepper";
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

- (CRLStepperAccessibilityDelegate)crlaxDelegate
{
  return (CRLStepperAccessibilityDelegate *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_1016A9AB0);
}

- (void)crlaxSetDelegate:(id)a3
{
}

- (void)crlaxPerformFocusAfterDelay:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100421474;
  v3[3] = &unk_1014CBBB0;
  v3[4] = self;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v3, a3);
}

- (BOOL)isAccessibilityElement
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 1;
  }

  return UIAccessibilityIsSwitchControlRunning();
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
  id v3 = [(CRLStepperAccessibility *)self crlaxTarget];
  v4 = [v3 i_upButton];
  [v4 sendActionsForControlEvents:1];

  id v6 = [(CRLStepperAccessibility *)self crlaxTarget];
  v5 = [v6 i_upButton];
  [v5 sendActionsForControlEvents:64];
}

- (void)accessibilityDecrement
{
  id v3 = [(CRLStepperAccessibility *)self crlaxTarget];
  v4 = [v3 i_downButton];
  [v4 sendActionsForControlEvents:1];

  id v6 = [(CRLStepperAccessibility *)self crlaxTarget];
  v5 = [v6 i_downButton];
  [v5 sendActionsForControlEvents:64];
}

- (id)accessibilityValue
{
  uint64_t v3 = [(CRLStepperAccessibility *)self crlaxDelegate];
  if (v3
    && (v4 = (void *)v3,
        [(CRLStepperAccessibility *)self crlaxDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = [(CRLStepperAccessibility *)self crlaxDelegate];
    uint64_t v8 = [v7 crlaxValueDescriptionForStepper:self];
  }
  else
  {
    v7 = CRLAccessibilityStringsDictKey(@"stroke.width.points");
    v9 = [(CRLStepperAccessibility *)self crlaxTarget];
    [v9 currentValue];
    uint64_t v11 = (uint64_t)v10;

    uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v11);
  }
  v12 = (void *)v8;

  return v12;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = [(CRLStepperAccessibility *)self crlaxDelegate];
  if (!v3) {
    return 0;
  }
  v4 = (void *)v3;
  v5 = [(CRLStepperAccessibility *)self crlaxDelegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  v7 = [(CRLStepperAccessibility *)self crlaxDelegate];
  unsigned __int8 v8 = [v7 crlaxPerformEscapeForStepper:self];

  return v8;
}

- (id)automationElements
{
  uint64_t v3 = objc_opt_new();
  v4 = [(CRLStepperAccessibility *)self crlaxTarget];
  v5 = [v4 i_upButton];
  [v3 crlaxAddObjectIfNotNilWithAssert:v5];

  char v6 = [(CRLStepperAccessibility *)self crlaxTarget];
  v7 = [v6 i_downButton];
  [v3 crlaxAddObjectIfNotNilWithAssert:v7];

  id v8 = [v3 copy];

  return v8;
}

@end