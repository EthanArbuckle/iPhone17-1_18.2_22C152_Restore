@interface AEAudiobookSleepViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
@end

@implementation AEAudiobookSleepViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"AEAudiobookSleepViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityPerformEscape
{
  char v7 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  if (v7) {
    abort();
  }
  v5 = v4;
  [v4 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

@end