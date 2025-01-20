@interface AEAudioNoHitPinningViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
@end

@implementation AEAudioNoHitPinningViewAccessibility

+ (id)imaxTargetClassName
{
  return @"AEAudioNoHitPinningView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end