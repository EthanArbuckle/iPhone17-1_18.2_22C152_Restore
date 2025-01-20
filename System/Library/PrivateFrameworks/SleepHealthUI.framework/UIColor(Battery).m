@interface UIColor(Battery)
+ (id)hkshui_batteryColorForFillFraction:()Battery;
+ (uint64_t)hkshui_lowBatteryColor;
+ (uint64_t)hkshui_lowPowerModeColor;
+ (uint64_t)hkshui_normalBatteryColor;
@end

@implementation UIColor(Battery)

+ (id)hkshui_batteryColorForFillFraction:()Battery
{
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  int v5 = [v4 isLowPowerModeEnabled];

  if (v5)
  {
    v6 = objc_msgSend(a1, "hkshui_lowPowerModeColor");
  }
  else
  {
    if (a2 <= 0.200000003) {
      objc_msgSend(a1, "hkshui_lowBatteryColor");
    }
    else {
    v6 = objc_msgSend(a1, "hkshui_normalBatteryColor");
    }
  }
  return v6;
}

+ (uint64_t)hkshui_normalBatteryColor
{
  return [MEMORY[0x1E4FB1618] systemGreenColor];
}

+ (uint64_t)hkshui_lowBatteryColor
{
  return [MEMORY[0x1E4FB1618] systemRedColor];
}

+ (uint64_t)hkshui_lowPowerModeColor
{
  return [MEMORY[0x1E4FB1618] systemYellowColor];
}

@end