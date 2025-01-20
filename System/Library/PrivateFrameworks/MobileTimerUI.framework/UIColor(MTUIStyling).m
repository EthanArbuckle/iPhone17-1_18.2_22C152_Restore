@interface UIColor(MTUIStyling)
+ (id)mtui_disabledStartButtonTintColor;
+ (id)mtui_lapResetButtonTintColor;
+ (id)mtui_pauseButtonTintColor;
+ (id)mtui_startResumeButtonTintColor;
+ (id)mtui_stopButtonTintColor;
+ (uint64_t)mtui_backgroundColor;
+ (uint64_t)mtui_buttonBackgroundColor;
+ (uint64_t)mtui_cellAccessoryColor;
+ (uint64_t)mtui_cellHighlightColor;
+ (uint64_t)mtui_cellSeparatorColor;
+ (uint64_t)mtui_disabledButtonTintColor;
+ (uint64_t)mtui_disabledTextColor;
+ (uint64_t)mtui_foregroundColor;
+ (uint64_t)mtui_lapResetButtonTextColor;
+ (uint64_t)mtui_pauseButtonTextColor;
+ (uint64_t)mtui_primaryColor;
+ (uint64_t)mtui_primaryTextColor;
+ (uint64_t)mtui_quaternaryColor;
+ (uint64_t)mtui_secondaryColor;
+ (uint64_t)mtui_secondaryTextColor;
+ (uint64_t)mtui_sleepColor;
+ (uint64_t)mtui_startResumeButtonTextColor;
+ (uint64_t)mtui_stopButtonTextColor;
+ (uint64_t)mtui_stopwatchMajorTickMarkColor;
+ (uint64_t)mtui_stopwatchMinorTickMarkColor;
+ (uint64_t)mtui_switchTintColor;
+ (uint64_t)mtui_tertiaryColor;
+ (uint64_t)mtui_tertiaryTextColor;
+ (uint64_t)mtui_tintColor;
+ (uint64_t)mtui_wakeColor;
+ (uint64_t)mtui_worldClockMapLandColor;
@end

@implementation UIColor(MTUIStyling)

+ (uint64_t)mtui_disabledTextColor
{
  return [MEMORY[0x263F1C550] secondaryLabelColor];
}

+ (uint64_t)mtui_backgroundColor
{
  return [MEMORY[0x263F1C550] _systemGroupedBackgroundColor];
}

+ (uint64_t)mtui_tintColor
{
  return [MEMORY[0x263F1C550] systemOrangeColor];
}

+ (uint64_t)mtui_quaternaryColor
{
  return [MEMORY[0x263F1C550] _quaternaryLabelColor];
}

+ (uint64_t)mtui_cellHighlightColor
{
  return objc_msgSend(MEMORY[0x263F1C550], "mtui_quaternaryColor");
}

+ (uint64_t)mtui_switchTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.262745098 green:0.262745098 blue:0.270588235 alpha:1.0];
}

+ (uint64_t)mtui_primaryColor
{
  return [MEMORY[0x263F1C550] _labelColor];
}

+ (uint64_t)mtui_cellSeparatorColor
{
  return [MEMORY[0x263F1C550] _separatorColor];
}

+ (uint64_t)mtui_secondaryColor
{
  return [MEMORY[0x263F1C550] _secondaryLabelColor];
}

+ (uint64_t)mtui_tertiaryColor
{
  return [MEMORY[0x263F1C550] _tertiaryLabelColor];
}

+ (uint64_t)mtui_foregroundColor
{
  return [MEMORY[0x263F1C550] _secondarySystemGroupedBackgroundColor];
}

+ (uint64_t)mtui_cellAccessoryColor
{
  return objc_msgSend(MEMORY[0x263F1C550], "mtui_tertiaryColor");
}

+ (uint64_t)mtui_buttonBackgroundColor
{
  return [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
}

+ (uint64_t)mtui_worldClockMapLandColor
{
  return objc_msgSend(MEMORY[0x263F1C550], "mtui_tertiaryColor");
}

+ (uint64_t)mtui_primaryTextColor
{
  return [MEMORY[0x263F1C550] whiteColor];
}

+ (uint64_t)mtui_secondaryTextColor
{
  return [MEMORY[0x263F1C550] secondaryLabelColor];
}

+ (uint64_t)mtui_tertiaryTextColor
{
  return [MEMORY[0x263F1C550] tertiaryLabelColor];
}

+ (uint64_t)mtui_stopwatchMajorTickMarkColor
{
  return objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
}

+ (uint64_t)mtui_stopwatchMinorTickMarkColor
{
  return objc_msgSend(MEMORY[0x263F1C550], "mtui_tertiaryColor");
}

+ (id)mtui_startResumeButtonTintColor
{
  v0 = objc_msgSend(MEMORY[0x263F1C550], "mtui_startResumeButtonTextColor");
  v1 = [v0 colorWithAlphaComponent:0.2];

  return v1;
}

+ (uint64_t)mtui_startResumeButtonTextColor
{
  return [MEMORY[0x263F1C550] systemGreenColor];
}

+ (id)mtui_pauseButtonTintColor
{
  v0 = objc_msgSend(MEMORY[0x263F1C550], "mtui_pauseButtonTextColor");
  v1 = [v0 colorWithAlphaComponent:0.2];

  return v1;
}

+ (uint64_t)mtui_pauseButtonTextColor
{
  return [MEMORY[0x263F1C550] systemOrangeColor];
}

+ (id)mtui_stopButtonTintColor
{
  v0 = objc_msgSend(MEMORY[0x263F1C550], "mtui_stopButtonTextColor");
  v1 = [v0 colorWithAlphaComponent:0.2];

  return v1;
}

+ (uint64_t)mtui_stopButtonTextColor
{
  return [MEMORY[0x263F1C550] systemRedColor];
}

+ (id)mtui_lapResetButtonTintColor
{
  v0 = objc_msgSend(MEMORY[0x263F1C550], "mtui_lapResetButtonTextColor");
  v1 = [v0 colorWithAlphaComponent:0.2];

  return v1;
}

+ (uint64_t)mtui_lapResetButtonTextColor
{
  return objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
}

+ (uint64_t)mtui_disabledButtonTintColor
{
  return [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
}

+ (id)mtui_disabledStartButtonTintColor
{
  v0 = objc_msgSend(MEMORY[0x263F1C550], "mtui_startResumeButtonTextColor");
  v1 = [v0 colorWithAlphaComponent:0.1];

  return v1;
}

+ (uint64_t)mtui_sleepColor
{
  return objc_msgSend(MEMORY[0x263F1C550], "mtui_tintColor");
}

+ (uint64_t)mtui_wakeColor
{
  return [MEMORY[0x263F1C550] systemYellowColor];
}

@end