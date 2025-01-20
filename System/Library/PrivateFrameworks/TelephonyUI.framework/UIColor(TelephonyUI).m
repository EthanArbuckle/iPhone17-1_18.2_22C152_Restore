@interface UIColor(TelephonyUI)
+ (id)_tp_bluePillColor;
+ (id)_tp_greenPillColor;
+ (uint64_t)dynamicBackgroundColor;
+ (uint64_t)dynamicCarFocusedColor;
+ (uint64_t)dynamicCarFocusedLabelColor;
+ (uint64_t)dynamicCarFocusedPrimaryLabelColor;
+ (uint64_t)dynamicCarFocusedSecondaryLabelColor;
+ (uint64_t)dynamicCarPrimaryColor;
+ (uint64_t)dynamicCarQuaternaryColor;
+ (uint64_t)dynamicCarSecondaryColor;
+ (uint64_t)dynamicCarTertiaryColor;
+ (uint64_t)dynamicLabelColor;
+ (uint64_t)dynamicQuaternaryLabelColor;
+ (uint64_t)dynamicSecondaryLabelColor;
+ (uint64_t)dynamicTertiaryLabelColor;
@end

@implementation UIColor(TelephonyUI)

+ (uint64_t)dynamicSecondaryLabelColor
{
  return [MEMORY[0x1E4FB1618] _secondaryLabelColor];
}

+ (uint64_t)dynamicTertiaryLabelColor
{
  return [MEMORY[0x1E4FB1618] _tertiaryLabelColor];
}

+ (uint64_t)dynamicLabelColor
{
  return [MEMORY[0x1E4FB1618] _labelColor];
}

+ (id)_tp_greenPillColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    double v0 = 0.411764706;
    double v1 = 0.137254902;
  }
  else
  {
    double v0 = 0.8;
    double v1 = 0.278431373;
  }
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:v0 blue:v1 alpha:1.0];
  return v2;
}

+ (id)_tp_bluePillColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    [MEMORY[0x1E4FB1618] systemDarkBlueColor];
  }
  else {
  double v0 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  return v0;
}

+ (uint64_t)dynamicQuaternaryLabelColor
{
  return [MEMORY[0x1E4FB1618] _quaternaryLabelColor];
}

+ (uint64_t)dynamicBackgroundColor
{
  return [MEMORY[0x1E4FB1618] _systemBackgroundColor];
}

+ (uint64_t)dynamicCarPrimaryColor
{
  return [MEMORY[0x1E4FB1618] _carSystemPrimaryColor];
}

+ (uint64_t)dynamicCarSecondaryColor
{
  return [MEMORY[0x1E4FB1618] _carSystemSecondaryColor];
}

+ (uint64_t)dynamicCarTertiaryColor
{
  return [MEMORY[0x1E4FB1618] _carSystemTertiaryColor];
}

+ (uint64_t)dynamicCarQuaternaryColor
{
  return [MEMORY[0x1E4FB1618] _carSystemQuaternaryColor];
}

+ (uint64_t)dynamicCarFocusedColor
{
  return [MEMORY[0x1E4FB1618] _carSystemFocusColor];
}

+ (uint64_t)dynamicCarFocusedLabelColor
{
  return [MEMORY[0x1E4FB1618] _carSystemFocusLabelColor];
}

+ (uint64_t)dynamicCarFocusedPrimaryLabelColor
{
  return [MEMORY[0x1E4FB1618] _carSystemFocusPrimaryColor];
}

+ (uint64_t)dynamicCarFocusedSecondaryLabelColor
{
  return [MEMORY[0x1E4FB1618] _carSystemFocusSecondaryColor];
}

@end