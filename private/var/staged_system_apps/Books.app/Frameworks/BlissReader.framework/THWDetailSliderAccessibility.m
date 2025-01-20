@interface THWDetailSliderAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (float)_thaxStepValue;
- (float)thaxDuration;
- (id)accessibilityValue;
- (void)_thaxUpdateValuePercent:(float)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation THWDetailSliderAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWDetailSlider";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (float)thaxDuration
{
  [(THWDetailSliderAccessibility *)self tsaxDoubleValueForKey:@"availableDuration"];
  return v2;
}

- (id)accessibilityValue
{
  v3.receiver = self;
  v3.super_class = (Class)THWDetailSliderAccessibility;
  return [(THUISliderAccessibility *)&v3 accessibilityValue];
}

- (void)accessibilityIncrement
{
  [(THUISliderAccessibility *)self thaxValue];
  float v4 = v3;
  [(THWDetailSliderAccessibility *)self _thaxStepValue];
  *(float *)&double v5 = v4 + *(float *)&v5;

  [(THWDetailSliderAccessibility *)self _thaxUpdateValuePercent:v5];
}

- (void)accessibilityDecrement
{
  [(THUISliderAccessibility *)self thaxValue];
  float v4 = v3;
  [(THWDetailSliderAccessibility *)self _thaxStepValue];
  *(float *)&double v5 = v4 - *(float *)&v5;

  [(THWDetailSliderAccessibility *)self _thaxUpdateValuePercent:v5];
}

- (void)_thaxUpdateValuePercent:(float)a3
{
  [(THUISliderAccessibility *)self thaxMaximumValue];
  if (v5 < a3) {
    a3 = v5;
  }
  [(THUISliderAccessibility *)self thaxMinimumValue];
  v7[1] = 3221225472;
  v7[0] = _NSConcreteStackBlock;
  v7[2] = sub_28A7AC;
  v7[3] = &unk_46C478;
  if (v6 < a3) {
    float v6 = a3;
  }
  v7[4] = self;
  float v8 = v6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
}

- (float)_thaxStepValue
{
  [(THUISliderAccessibility *)self thaxMaximumValue];
  float v4 = v3;
  [(THUISliderAccessibility *)self thaxMinimumValue];
  return (float)(v4 - v5) * 0.05;
}

@end