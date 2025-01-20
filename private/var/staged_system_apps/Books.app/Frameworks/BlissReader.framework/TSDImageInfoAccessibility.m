@interface TSDImageInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxDescription;
- (id)_tsaxFriendlyFilename;
- (id)_tsaxImageData;
@end

@implementation TSDImageInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDImageInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxDescription
{
  v3 = [(TSDDrawableInfoAccessibility *)self tsaxUserProvidedDescription];
  if (![(NSString *)v3 length]) {
    v3 = [(TSDImageInfoAccessibility *)self _tsaxFriendlyFilename];
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (![(NSString *)v3 length])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No usable image description was generated.", v5, v6, v7, v8, v9, v11))abort(); {
    }
      }
  }
  return v3;
}

- (id)_tsaxFriendlyFilename
{
  id v2 = [(TSDImageInfoAccessibility *)self _tsaxImageData];

  return [v2 tsaxFriendlyFilename];
}

- (id)_tsaxImageData
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDImageInfoAccessibility *)self tsaxValueForKey:@"imageData"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end