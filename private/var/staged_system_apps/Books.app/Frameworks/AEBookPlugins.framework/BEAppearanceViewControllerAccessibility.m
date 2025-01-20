@interface BEAppearanceViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (UIButton)_imaxSizeLargerButton;
- (UIButton)_imaxSizeSmallerButton;
- (UISlider)_imaxBrightnessSlider;
- (id)brightnessSlider;
- (void)viewDidLoad;
@end

@implementation BEAppearanceViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BEAppearanceViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)BEAppearanceViewControllerAccessibility;
  [(BEAppearanceViewControllerAccessibility *)&v9 viewDidLoad];
  v3 = AEAXLocString(@"brightness");
  v4 = [(BEAppearanceViewControllerAccessibility *)self _imaxBrightnessSlider];
  [v4 setAccessibilityLabel:v3];

  v5 = AEAXLocString(@"decrease.font.size");
  v6 = [(BEAppearanceViewControllerAccessibility *)self _imaxSizeSmallerButton];
  [v6 setAccessibilityLabel:v5];

  v7 = AEAXLocString(@"increase.font.size");
  v8 = [(BEAppearanceViewControllerAccessibility *)self _imaxSizeLargerButton];
  [v8 setAccessibilityLabel:v7];
}

- (id)brightnessSlider
{
  v5.receiver = self;
  v5.super_class = (Class)BEAppearanceViewControllerAccessibility;
  v2 = [(BEAppearanceViewControllerAccessibility *)&v5 brightnessSlider];
  v3 = AEAXLocString(@"brightness.slider");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (UISlider)_imaxBrightnessSlider
{
  return (UISlider *)[(BEAppearanceViewControllerAccessibility *)self imaxValueForKey:@"brightnessSlider"];
}

- (UIButton)_imaxSizeSmallerButton
{
  return (UIButton *)[(BEAppearanceViewControllerAccessibility *)self imaxValueForKey:@"sizeSmallerButton"];
}

- (UIButton)_imaxSizeLargerButton
{
  return (UIButton *)[(BEAppearanceViewControllerAccessibility *)self imaxValueForKey:@"sizeLargerButton"];
}

@end