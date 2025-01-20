@interface BKUISliderAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_accessibilityServesAsFirstElement;
- (id)accessibilityLabel;
@end

@implementation BKUISliderAccessibility

+ (id)imaxTargetClassName
{
  return @"UISlider";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  v3 = [(BKUISliderAccessibility *)self imaxIdentification];
  unsigned __int8 v4 = [v3 isEqualToString:@"BrightnessSlider"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)BKUISliderAccessibility;
  return [(BKUISliderAccessibility *)&v6 _accessibilityServesAsFirstElement];
}

- (id)accessibilityLabel
{
  v3 = [(BKUISliderAccessibility *)self accessibilityIdentifier];
  unsigned int v4 = [v3 isEqualToString:@"BrightnessSlider"];

  if (v4)
  {
    v5 = [(BKUISliderAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKUISliderAccessibility;
    v5 = [(BKUISliderAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

@end