@interface TSUISliderAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxShouldForceIsTracking;
- (BOOL)isTracking;
- (CGRect)accessibilityFrame;
- (TSUISliderAccessibilityDelegateForFrame)tsaxDelegateForFrame;
- (UITableViewCell)tsaxParentTableViewCell;
- (id)accessibilityLabel;
- (void)_tsaxInteractionDidStart;
- (void)_tsaxInteractionDidStop;
- (void)_tsaxPerformTargetActionsForControlEvents:(unint64_t)a3;
- (void)_tsaxSetShouldForceIsTracking:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)tsaxSetDelegateForFrame:(id)a3;
- (void)tsaxSetValue:(float)a3 andSendActions:(BOOL)a4;
@end

@implementation TSUISliderAccessibility

+ (id)tsaxTargetClassName
{
  return @"UISlider";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSUISliderAccessibilityDelegateForFrame)tsaxDelegateForFrame
{
  return (TSUISliderAccessibilityDelegateForFrame *)__TSAccessibilityGetAssociatedObject(self, &unk_5738EA);
}

- (void)tsaxSetDelegateForFrame:(id)a3
{
}

- (BOOL)_tsaxShouldForceIsTracking
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738EB);
}

- (void)_tsaxSetShouldForceIsTracking:(BOOL)a3
{
}

- (UITableViewCell)tsaxParentTableViewCell
{
  result = (UITableViewCell *)[(TSUISliderAccessibility *)self superview];
  if (result)
  {
    v3 = result;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      result = (UITableViewCell *)[(UITableViewCell *)v3 superview];
      v3 = result;
      if (!result) {
        return result;
      }
    }
    char v5 = 0;
    v4 = (objc_class *)objc_opt_class();
    result = (UITableViewCell *)__TSAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v5);
    if (v5) {
      abort();
    }
  }
  return result;
}

- (void)tsaxSetValue:(float)a3 andSendActions:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    [(TSUISliderAccessibility *)self _tsaxInteractionDidStart];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_269D50;
  v7[3] = &unk_46BF08;
  v7[4] = self;
  float v8 = a3;
  BOOL v9 = v4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  if (v4) {
    [(TSUISliderAccessibility *)self _tsaxInteractionDidStop];
  }
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)TSUISliderAccessibility;
  id v3 = [(TSUISliderAccessibility *)&v6 accessibilityLabel];
  if (![v3 length])
  {
    BOOL v4 = [(TSUISliderAccessibility *)self tsaxParentTableViewCell];
    if (v4) {
      return [(UITableViewCell *)v4 accessibilityLabel];
    }
  }
  return v3;
}

- (void)accessibilityIncrement
{
  [(TSUISliderAccessibility *)self _tsaxInteractionDidStart];
  v3.receiver = self;
  v3.super_class = (Class)TSUISliderAccessibility;
  [(TSUISliderAccessibility *)&v3 accessibilityIncrement];
  [(TSUISliderAccessibility *)self _tsaxInteractionDidStop];
}

- (void)accessibilityDecrement
{
  [(TSUISliderAccessibility *)self _tsaxInteractionDidStart];
  v3.receiver = self;
  v3.super_class = (Class)TSUISliderAccessibility;
  [(TSUISliderAccessibility *)&v3 accessibilityDecrement];
  [(TSUISliderAccessibility *)self _tsaxInteractionDidStop];
}

- (CGRect)accessibilityFrame
{
  if ([(TSUISliderAccessibility *)self tsaxDelegateForFrame])
  {
    [(TSUISliderAccessibilityDelegateForFrame *)[(TSUISliderAccessibility *)self tsaxDelegateForFrame] tsaxAccessibilityFrameForSlider:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSUISliderAccessibility;
    [(TSUISliderAccessibility *)&v7 accessibilityFrame];
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isTracking
{
  if ([(TSUISliderAccessibility *)self _tsaxShouldForceIsTracking]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUISliderAccessibility;
  return [(TSUISliderAccessibility *)&v4 isTracking];
}

- (void)_tsaxPerformTargetActionsForControlEvents:(unint64_t)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(TSUISliderAccessibility *)self allTargets];
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
        id v6 = [(TSUISliderAccessibility *)self actionsForTarget:v5 forControlEvent:a3];
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
              v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
              unsigned int v12 = [v11 hasSuffix:@":"];
              SEL v13 = NSSelectorFromString((NSString *)v11);
              if (v12) {
                [v5 performSelector:v13 withObject:self];
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

- (void)_tsaxInteractionDidStart
{
  if ([(TSUISliderAccessibility *)self _tsaxShouldForceIsTracking])
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Mismatched calls to tsaxM<Start|End>SliderInteraction", v4, v5, v6, v7, v8, v9))abort(); {
    }
      }
  }
  else
  {
    [(TSUISliderAccessibility *)self _tsaxSetShouldForceIsTracking:1];
    [(TSUISliderAccessibility *)self _tsaxPerformTargetActionsForControlEvents:1];
  }
}

- (void)_tsaxInteractionDidStop
{
  if ([(TSUISliderAccessibility *)self _tsaxShouldForceIsTracking])
  {
    [(TSUISliderAccessibility *)self _tsaxSetShouldForceIsTracking:0];
    [(TSUISliderAccessibility *)self _tsaxPerformTargetActionsForControlEvents:64];
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Mismatched calls to tsaxM<Start|End>SliderInteraction", v4, v5, v6, v7, v8, v9))abort(); {
  }
    }
}

@end