@interface VKCInternalSettings
+ (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4;
+ (BOOL)addRandomArtificalAnalysisDelay;
+ (BOOL)addSubjectCropRectToPasteboard;
+ (BOOL)alwaysShowTextSelectionBorders;
+ (BOOL)debugMenuEnabled;
+ (BOOL)disableAllLiveText;
+ (BOOL)isCGImageForMadEnabled;
+ (BOOL)isOpticalFlowForTextEnabled;
+ (BOOL)isPerformingAutomatedTest;
+ (BOOL)overrideDeviceAvailability;
+ (BOOL)shareHeicsCalloutEnabled;
+ (NSUserDefaults)defaults;
+ (double)blurBlurRadius;
+ (double)blurMaxThickness;
+ (double)blurMinOpacity;
+ (double)extraWindowPointTouchOffset;
+ (double)floatForKey:(id)a3 withDefaultValue:(double)a4;
+ (double)randomDelayEndValue;
+ (double)randomDelayStartValue;
+ (double)scaleMultiplier;
+ (double)sharpBlurRadius;
+ (double)sharpMaxThickness;
+ (double)sharpMinOpacity;
+ (double)subjectAutomaticAnalysisDelay;
+ (double)subjectDragCancellationDelay;
+ (double)subjectDragLiftDelay;
+ (double)visibleTextAreaButtonThreshold;
+ (id)addRandomArtificalAnalysisDelaySettingsValue;
+ (id)addSubjectCropRectToPasteboardSettingsValue;
+ (id)alwaysShowTextSelectionBordersSettingsValue;
+ (id)blurBlurRadiusSettingsValue;
+ (id)blurMaxThicknessSettingsValue;
+ (id)blurMinOpacitySettingsValue;
+ (id)debugMenuEnabledSettingsValue;
+ (id)defaultsKeyForKey:(id)a3;
+ (id)disableAllLiveTextSettingsValue;
+ (id)extraWindowPointTouchOffsetSettingsValue;
+ (id)isCGImageForMadEnabledSettingsValue;
+ (id)isOpticalFlowForTextEnabledSettingsValue;
+ (id)isPerformingAutomatedTestSettingsValue;
+ (id)overrideDeviceAvailabilitySettingsValue;
+ (id)randomDelayEndValueSettingsValue;
+ (id)randomDelayStartValueSettingsValue;
+ (id)scaleMultiplierSettingsValue;
+ (id)settingsValueForKey:(id)a3;
+ (id)shareHeicsCalloutEnabledSettingsValue;
+ (id)sharpBlurRadiusSettingsValue;
+ (id)sharpMaxThicknessSettingsValue;
+ (id)sharpMinOpacitySettingsValue;
+ (id)subjectAutomaticAnalysisDelaySettingsValue;
+ (id)subjectDragCancellationDelaySettingsValue;
+ (id)subjectDragLiftDelaySettingsValue;
+ (id)visibleTextAreaButtonThresholdSettingsValue;
@end

@implementation VKCInternalSettings

+ (NSUserDefaults)defaults
{
  if (defaults_onceToken != -1) {
    dispatch_once(&defaults_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)defaults_sDefaults;
  return (NSUserDefaults *)v2;
}

void __31__VKCInternalSettings_defaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.VisionKit.InternalSettings"];
  v1 = (void *)defaults_sDefaults;
  defaults_sDefaults = v0;
}

+ (id)settingsValueForKey:(id)a3
{
  v4 = [a3 stringByAppendingString:@"SettingsValue"];
  SEL v5 = NSSelectorFromString(v4);
  if (objc_opt_respondsToSelector())
  {
    v6 = [a1 performSelector:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (double)scaleMultiplier
{
  [a1 floatForKey:@"scaleMultiplier" withDefaultValue:3.0];
  return result;
}

+ (double)sharpMinOpacity
{
  [a1 floatForKey:@"sharpMinOpacity" withDefaultValue:1.0];
  return result;
}

+ (double)sharpMaxThickness
{
  [a1 floatForKey:@"sharpMaxThickness" withDefaultValue:1.5];
  return result;
}

+ (double)sharpBlurRadius
{
  [a1 floatForKey:@"sharpBlurRadius" withDefaultValue:1.5];
  return result;
}

+ (double)blurMinOpacity
{
  [a1 floatForKey:@"blurMinOpacity" withDefaultValue:0.1];
  return result;
}

+ (double)blurMaxThickness
{
  [a1 floatForKey:@"blurMaxThickness" withDefaultValue:16.0];
  return result;
}

+ (double)blurBlurRadius
{
  [a1 floatForKey:@"blurBlurRadius" withDefaultValue:20.0];
  return result;
}

+ (BOOL)disableAllLiveText
{
  return [a1 BOOLForKey:@"disableAllLiveText" withDefaultValue:0];
}

+ (BOOL)isCGImageForMadEnabled
{
  return [a1 BOOLForKey:@"useCGImageForMad" withDefaultValue:1];
}

+ (BOOL)addRandomArtificalAnalysisDelay
{
  return [a1 BOOLForKey:@"addRandomArtificalAnalysisDelay" withDefaultValue:0];
}

+ (double)randomDelayStartValue
{
  [a1 floatForKey:@"randomDelayStartValue" withDefaultValue:0.0];
  return result;
}

+ (double)randomDelayEndValue
{
  [a1 floatForKey:@"randomDelayEndValue" withDefaultValue:3.0];
  return result;
}

+ (double)extraWindowPointTouchOffset
{
  [a1 floatForKey:@"extraWindowSpaceTextOffset" withDefaultValue:10.0];
  return result;
}

+ (BOOL)debugMenuEnabled
{
  return [a1 BOOLForKey:@"debugMenuEnabled" withDefaultValue:0];
}

+ (double)visibleTextAreaButtonThreshold
{
  [a1 floatForKey:@"visibleTextAreaButtonThreshold" withDefaultValue:10.0];
  return result;
}

+ (BOOL)alwaysShowTextSelectionBorders
{
  return 0;
}

+ (BOOL)overrideDeviceAvailability
{
  return [a1 BOOLForKey:@"overrideDeviceAvailability" withDefaultValue:0];
}

+ (BOOL)isPerformingAutomatedTest
{
  return [a1 BOOLForKey:@"isPerformingAutomatedTest" withDefaultValue:0];
}

+ (double)subjectDragLiftDelay
{
  [a1 floatForKey:@"subjectDragLiftDelay" withDefaultValue:0.15];
  return result;
}

+ (double)subjectDragCancellationDelay
{
  [a1 floatForKey:@"subjectDragCancellationDelay" withDefaultValue:0.55];
  return result;
}

+ (double)subjectAutomaticAnalysisDelay
{
  [a1 floatForKey:@"subjectAutomaticAnalysisDelay" withDefaultValue:1.0];
  return result;
}

+ (BOOL)addSubjectCropRectToPasteboard
{
  return [a1 BOOLForKey:@"addSubjectCropRectToPasteboard" withDefaultValue:0];
}

+ (BOOL)isOpticalFlowForTextEnabled
{
  return [a1 BOOLForKey:@"isOpticalFlowForTextEnabled" withDefaultValue:1];
}

+ (BOOL)shareHeicsCalloutEnabled
{
  return [a1 BOOLForKey:@"shareHeicsCalloutEnabled" withDefaultValue:1];
}

+ (id)scaleMultiplierSettingsValue
{
  v2 = NSNumber;
  [a1 scaleMultiplier];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)sharpMinOpacitySettingsValue
{
  v2 = NSNumber;
  [a1 sharpMinOpacity];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)sharpMaxThicknessSettingsValue
{
  v2 = NSNumber;
  [a1 sharpMaxThickness];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)sharpBlurRadiusSettingsValue
{
  v2 = NSNumber;
  [a1 sharpBlurRadius];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)blurMinOpacitySettingsValue
{
  v2 = NSNumber;
  [a1 blurMinOpacity];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)blurMaxThicknessSettingsValue
{
  v2 = NSNumber;
  [a1 blurMaxThickness];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)blurBlurRadiusSettingsValue
{
  v2 = NSNumber;
  [a1 blurBlurRadius];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)disableAllLiveTextSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 disableAllLiveText];
  return (id)[v2 numberWithBool:v3];
}

+ (id)isCGImageForMadEnabledSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 isCGImageForMadEnabled];
  return (id)[v2 numberWithBool:v3];
}

+ (id)isOpticalFlowForTextEnabledSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 isOpticalFlowForTextEnabled];
  return (id)[v2 numberWithBool:v3];
}

+ (id)addRandomArtificalAnalysisDelaySettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 addRandomArtificalAnalysisDelay];
  return (id)[v2 numberWithBool:v3];
}

+ (id)randomDelayStartValueSettingsValue
{
  v2 = NSNumber;
  [a1 randomDelayStartValue];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)randomDelayEndValueSettingsValue
{
  v2 = NSNumber;
  [a1 randomDelayEndValue];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)extraWindowPointTouchOffsetSettingsValue
{
  v2 = NSNumber;
  [a1 extraWindowPointTouchOffset];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)debugMenuEnabledSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 debugMenuEnabled];
  return (id)[v2 numberWithBool:v3];
}

+ (id)visibleTextAreaButtonThresholdSettingsValue
{
  v2 = NSNumber;
  [a1 visibleTextAreaButtonThreshold];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)alwaysShowTextSelectionBordersSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 alwaysShowTextSelectionBorders];
  return (id)[v2 numberWithBool:v3];
}

+ (id)overrideDeviceAvailabilitySettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 overrideDeviceAvailability];
  return (id)[v2 numberWithBool:v3];
}

+ (id)isPerformingAutomatedTestSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 isPerformingAutomatedTest];
  return (id)[v2 numberWithBool:v3];
}

+ (id)subjectDragLiftDelaySettingsValue
{
  v2 = NSNumber;
  [a1 subjectDragLiftDelay];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)subjectDragCancellationDelaySettingsValue
{
  v2 = NSNumber;
  [a1 subjectDragCancellationDelay];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)subjectAutomaticAnalysisDelaySettingsValue
{
  v2 = NSNumber;
  [a1 subjectAutomaticAnalysisDelay];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)addSubjectCropRectToPasteboardSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 addSubjectCropRectToPasteboard];
  return (id)[v2 numberWithBool:v3];
}

+ (id)shareHeicsCalloutEnabledSettingsValue
{
  v2 = NSNumber;
  uint64_t v3 = [a1 shareHeicsCalloutEnabled];
  return (id)[v2 numberWithBool:v3];
}

+ (id)defaultsKeyForKey:(id)a3
{
  return (id)[@"com.apple.VisionKit.InternalSettings" stringByAppendingPathExtension:a3];
}

+ (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  v6 = [a1 defaultsKeyForKey:a3];
  v7 = [a1 defaults];
  v8 = [v7 objectForKey:v6];

  if (v8) {
    a4 = [v8 BOOLValue];
  }

  return a4;
}

+ (double)floatForKey:(id)a3 withDefaultValue:(double)a4
{
  v6 = [a1 defaultsKeyForKey:a3];
  v7 = [a1 defaults];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    [v8 floatValue];
    a4 = v9;
  }

  return a4;
}

@end