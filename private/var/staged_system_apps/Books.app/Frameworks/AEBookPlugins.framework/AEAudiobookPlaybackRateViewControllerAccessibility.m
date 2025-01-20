@interface AEAudiobookPlaybackRateViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
@end

@implementation AEAudiobookPlaybackRateViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"AEAudiobookPlaybackRateViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityPerformEscape
{
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
  return 1;
}

@end