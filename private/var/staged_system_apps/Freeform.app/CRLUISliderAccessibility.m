@interface CRLUISliderAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxShouldForceIsTracking;
- (BOOL)isTracking;
- (CGRect)accessibilityFrame;
- (CRLUISliderAccessibilityDelegateForFrame)crlaxDelegateForFrame;
- (UITableViewCell)crlaxParentTableViewCell;
- (id)accessibilityLabel;
- (void)_crlaxInteractionDidStart;
- (void)_crlaxInteractionDidStop;
- (void)_crlaxPerformTargetActionsForControlEvents:(unint64_t)a3;
- (void)_crlaxSetShouldForceIsTracking:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)crlaxSetDelegateForFrame:(id)a3;
- (void)crlaxSetValue:(float)a3 andSendAction:(BOOL)a4;
@end

@implementation CRLUISliderAccessibility

+ (id)crlaxTargetClassName
{
  return @"UISlider";
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

- (CRLUISliderAccessibilityDelegateForFrame)crlaxDelegateForFrame
{
  return (CRLUISliderAccessibilityDelegateForFrame *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_1016A9D91);
}

- (void)crlaxSetDelegateForFrame:(id)a3
{
}

- (BOOL)_crlaxShouldForceIsTracking
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9D92);
}

- (void)_crlaxSetShouldForceIsTracking:(BOOL)a3
{
}

- (UITableViewCell)crlaxParentTableViewCell
{
  id v2 = [(CRLUISliderAccessibility *)self superview];
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v3 = [v2 superview];

      id v2 = v3;
      if (!v3) {
        goto LABEL_8;
      }
    }
    char v7 = 0;
    id v2 = v2;
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v7);
    if (v7) {
      abort();
    }
    id v3 = (void *)v5;
  }
  else
  {
    id v3 = 0;
  }
LABEL_8:

  return (UITableViewCell *)v3;
}

- (void)crlaxSetValue:(float)a3 andSendAction:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    [(CRLUISliderAccessibility *)self _crlaxInteractionDidStart];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004BCED4;
  v7[3] = &unk_1014FF550;
  v7[4] = self;
  float v8 = a3;
  BOOL v9 = v4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  if (v4) {
    [(CRLUISliderAccessibility *)self _crlaxInteractionDidStop];
  }
}

- (id)accessibilityLabel
{
  v8.receiver = self;
  v8.super_class = (Class)CRLUISliderAccessibility;
  id v3 = [(CRLUISliderAccessibility *)&v8 accessibilityLabel];
  if (![v3 length])
  {
    BOOL v4 = [(CRLUISliderAccessibility *)self crlaxParentTableViewCell];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 accessibilityLabel];

      id v3 = (void *)v6;
    }
  }

  return v3;
}

- (void)accessibilityIncrement
{
  [(CRLUISliderAccessibility *)self _crlaxInteractionDidStart];
  v3.receiver = self;
  v3.super_class = (Class)CRLUISliderAccessibility;
  [(CRLUISliderAccessibility *)&v3 accessibilityIncrement];
  [(CRLUISliderAccessibility *)self _crlaxInteractionDidStop];
}

- (void)accessibilityDecrement
{
  [(CRLUISliderAccessibility *)self _crlaxInteractionDidStart];
  v3.receiver = self;
  v3.super_class = (Class)CRLUISliderAccessibility;
  [(CRLUISliderAccessibility *)&v3 accessibilityDecrement];
  [(CRLUISliderAccessibility *)self _crlaxInteractionDidStop];
}

- (CGRect)accessibilityFrame
{
  objc_super v3 = [(CRLUISliderAccessibility *)self crlaxDelegateForFrame];

  if (v3)
  {
    BOOL v4 = [(CRLUISliderAccessibility *)self crlaxDelegateForFrame];
    [v4 crlaxAccessibilityFrameForSlider:self];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)CRLUISliderAccessibility;
    [(CRLUISliderAccessibility *)&v21 accessibilityFrame];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)isTracking
{
  if ([(CRLUISliderAccessibility *)self _crlaxShouldForceIsTracking]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLUISliderAccessibility;
  return [(CRLUISliderAccessibility *)&v4 isTracking];
}

- (void)_crlaxPerformTargetActionsForControlEvents:(unint64_t)a3
{
  objc_super v3 = self;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CRLUISliderAccessibility *)v3 allTargets];
  id v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        double v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        double v6 = [(CRLUISliderAccessibility *)v3 actionsForTarget:v5 forControlEvent:a3];
        id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              double v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
              unsigned int v12 = [v11 hasSuffix:@":"];
              SEL v13 = NSSelectorFromString((NSString *)v11);
              if (v12) {
                [v5 performSelector:v13 withObject:v3];
              }
              else {
                [v5 performSelector:v13];
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v17);
  }
}

- (void)_crlaxInteractionDidStart
{
  if ([(CRLUISliderAccessibility *)self _crlaxShouldForceIsTracking])
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Mismatched calls to crlaxM<Start|End>SliderInteraction", v4, v5, v6, v7, v8, v9))abort(); {
    }
      }
  }
  else
  {
    [(CRLUISliderAccessibility *)self _crlaxSetShouldForceIsTracking:1];
    [(CRLUISliderAccessibility *)self _crlaxPerformTargetActionsForControlEvents:1];
  }
}

- (void)_crlaxInteractionDidStop
{
  if ([(CRLUISliderAccessibility *)self _crlaxShouldForceIsTracking])
  {
    [(CRLUISliderAccessibility *)self _crlaxSetShouldForceIsTracking:0];
    [(CRLUISliderAccessibility *)self _crlaxPerformTargetActionsForControlEvents:64];
  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Mismatched calls to crlaxM<Start|End>SliderInteraction", v4, v5, v6, v7, v8, v9))abort(); {
  }
    }
}

@end