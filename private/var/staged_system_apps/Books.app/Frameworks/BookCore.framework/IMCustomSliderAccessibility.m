@interface IMCustomSliderAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_imaxSliderRepresentsBookPosition;
- (double)_accessibilityIncreaseAmount:(BOOL)a3;
- (id)_imaxDelegate;
- (id)_imaxDurationStringForDuration:(double)a3;
- (id)_imaxTarget;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)bookPositionAccessibilityLabel;
- (id)bookPositionAccessibilityValue;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation IMCustomSliderAccessibility

+ (id)imaxTargetClassName
{
  return @"IMCustomSlider";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_imaxTarget
{
  char v6 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v6);
  if (v6) {
    abort();
  }

  return v4;
}

- (id)_imaxDelegate
{
  v2 = [(IMCustomSliderAccessibility *)self _imaxTarget];
  v3 = [v2 delegate];

  return v3;
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)IMCustomSliderAccessibility;
  v3 = [(IMCustomSliderAccessibility *)&v6 accessibilityLabel];
  if ([(IMCustomSliderAccessibility *)self _imaxSliderRepresentsBookPosition])
  {
    uint64_t v4 = [(IMCustomSliderAccessibility *)self bookPositionAccessibilityLabel];

    v3 = (void *)v4;
  }

  return v3;
}

- (id)accessibilityValue
{
  v6.receiver = self;
  v6.super_class = (Class)IMCustomSliderAccessibility;
  v3 = [(IMCustomSliderAccessibility *)&v6 accessibilityValue];
  if ([(IMCustomSliderAccessibility *)self _imaxSliderRepresentsBookPosition])
  {
    uint64_t v4 = [(IMCustomSliderAccessibility *)self bookPositionAccessibilityValue];

    v3 = (void *)v4;
  }

  return v3;
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(IMCustomSliderAccessibility *)self _imaxTarget];
  [v5 minimumValue];
  float v7 = v6;

  v8 = [(IMCustomSliderAccessibility *)self _imaxTarget];
  [v8 maximumValue];
  float v10 = v9;

  v11 = [(IMCustomSliderAccessibility *)self _imaxTarget];
  [v11 value];
  float v13 = v12;

  float v14 = (float)(v10 - v7) / 20.0;
  if (!v3) {
    float v14 = -v14;
  }
  return (float)(v14 + v13);
}

- (void)accessibilityIncrement
{
  BOOL v3 = [(IMCustomSliderAccessibility *)self _imaxTarget];
  unsigned int v4 = [v3 isUserInteractionEnabled];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_7A600;
    v5[3] = &unk_2C3C50;
    v5[4] = self;
    if (__IMAccessibilityPerformSafeBlock(v5)) {
      abort();
    }
  }
}

- (void)accessibilityDecrement
{
  BOOL v3 = [(IMCustomSliderAccessibility *)self _imaxTarget];
  unsigned int v4 = [v3 isUserInteractionEnabled];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_7A6B0;
    v5[3] = &unk_2C3C50;
    v5[4] = self;
    if (__IMAccessibilityPerformSafeBlock(v5)) {
      abort();
    }
  }
}

- (id)bookPositionAccessibilityLabel
{
  return IMAXLocString(@"book.position.label");
}

- (id)bookPositionAccessibilityValue
{
  v4.receiver = self;
  v4.super_class = (Class)IMCustomSliderAccessibility;
  v2 = [(IMCustomSliderAccessibility *)&v4 accessibilityValue];

  return v2;
}

- (id)_imaxDurationStringForDuration:(double)a3
{
  v5 = objc_opt_new();
  [v5 setZeroFormattingBehavior:1];
  [v5 setUnitsStyle:4];
  [v5 setAllowedUnits:224];
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
  {
    float v6 = 0;
  }
  else
  {
    float v6 = [v5 stringFromTimeInterval:a3];
  }

  return v6;
}

- (BOOL)_imaxSliderRepresentsBookPosition
{
  BOOL v3 = [(IMCustomSliderAccessibility *)self _imaxDelegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [(IMCustomSliderAccessibility *)self _imaxTarget];
    unsigned __int8 v5 = [v3 sliderIsProgressSlider:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end