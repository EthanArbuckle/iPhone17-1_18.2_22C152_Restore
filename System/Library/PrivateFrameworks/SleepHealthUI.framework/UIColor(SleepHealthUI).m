@interface UIColor(SleepHealthUI)
+ (id)hkshui_sleepModeButtonSelectedColor;
@end

@implementation UIColor(SleepHealthUI)

+ (id)hkshui_sleepModeButtonSelectedColor
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  v1 = HKSHUIBundle();
  v2 = [v0 colorNamed:@"sleep_control_center_color" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

@end