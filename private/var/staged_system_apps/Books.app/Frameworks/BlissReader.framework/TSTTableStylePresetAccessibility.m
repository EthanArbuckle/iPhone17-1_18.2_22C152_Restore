@interface TSTTableStylePresetAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxPresetDescription;
- (unint64_t)_tsaxPresetIndex;
@end

@implementation TSTTableStylePresetAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableStylePreset";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxPresetDescription
{
  unint64_t v2 = [(TSTTableStylePresetAccessibility *)self _tsaxPresetIndex];
  uint64_t v3 = v2;
  if (v2 > 5) {
    v4 = 0;
  }
  else {
    v4 = TSAccessibilityLocalizedString((uint64_t)off_46BE90[v2]);
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!v4)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Preset label not provided for index: %lu", v6, v7, v8, v9, v10, v3))abort(); {
    }
      }
  }
  return v4;
}

- (unint64_t)_tsaxPresetIndex
{
  return (unint64_t)[(TSTTableStylePresetAccessibility *)self tsaxUnsignedIntegerValueForKey:@"index"];
}

@end