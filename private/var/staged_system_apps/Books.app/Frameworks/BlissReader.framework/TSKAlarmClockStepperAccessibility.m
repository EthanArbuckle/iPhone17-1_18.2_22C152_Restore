@interface TSKAlarmClockStepperAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation TSKAlarmClockStepperAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKAlarmClockStepper";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v4.receiver = self;
  v4.super_class = (Class)TSKAlarmClockStepperAccessibility;
  id result = [(TSKAlarmClockStepperAccessibility *)&v4 accessibilityLabel];
  if (!result) {
    return objc_msgSend(objc_msgSend(-[TSKAlarmClockStepperAccessibility tsaxViewAncestorOfType:](self, "tsaxViewAncestorOfType:", objc_opt_class()), "textLabel"), "text");
  }
  return result;
}

- (id)accessibilityValue
{
  id v2 = [(TSKAlarmClockStepperAccessibility *)self tsaxValueForKey:@"mValueLabel"];

  return [v2 accessibilityLabel];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
  [(TSKAlarmClockStepperAccessibility *)self handleUpButtonTouchDownEvent:0];

  [(TSKAlarmClockStepperAccessibility *)self handleUpButtonTouchUpInsideEvent:0];
}

- (void)accessibilityDecrement
{
  [(TSKAlarmClockStepperAccessibility *)self handleDownButtonTouchDownEvent:0];

  [(TSKAlarmClockStepperAccessibility *)self handleDownButtonTouchUpInsideEvent:0];
}

@end