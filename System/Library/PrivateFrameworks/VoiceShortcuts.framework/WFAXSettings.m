@interface WFAXSettings
+ (BOOL)classicInvertEnabled;
+ (BOOL)colorFilersEnabled;
+ (BOOL)increaseContrastEnabled;
+ (BOOL)reduceMotionEnabled;
+ (BOOL)reduceTransparencyEnabled;
+ (BOOL)reduceWhitePointEnabled;
+ (BOOL)smartInvertEnabled;
+ (BOOL)voiceControlEnabled;
+ (BOOL)voiceOverEnabled;
+ (BOOL)zoomEnabled;
@end

@implementation WFAXSettings

+ (BOOL)reduceWhitePointEnabled
{
  return _AXSReduceWhitePointEnabled() != 0;
}

+ (BOOL)classicInvertEnabled
{
  return _AXSClassicInvertColorsEnabled() != 0;
}

+ (BOOL)increaseContrastEnabled
{
  return _AXSPointerIncreasedContrastEnabled() != 0;
}

+ (BOOL)voiceControlEnabled
{
  return _AXSCommandAndControlEnabled() != 0;
}

+ (BOOL)zoomEnabled
{
  return _AXSZoomTouchEnabled() != 0;
}

+ (BOOL)voiceOverEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

+ (BOOL)smartInvertEnabled
{
  return _AXSInvertColorsEnabled() != 0;
}

+ (BOOL)colorFilersEnabled
{
  return MADisplayFilterPrefGetCategoryEnabled() != 0;
}

+ (BOOL)reduceTransparencyEnabled
{
  return _AXSEnhanceBackgroundContrastEnabled() != 0;
}

+ (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabled() != 0;
}

@end