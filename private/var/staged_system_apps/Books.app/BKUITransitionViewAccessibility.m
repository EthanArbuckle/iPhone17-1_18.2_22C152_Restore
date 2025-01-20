@interface BKUITransitionViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation BKUITransitionViewAccessibility

+ (id)imaxTargetClassName
{
  return @"UITransitionView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  v8.receiver = self;
  v8.super_class = (Class)BKUITransitionViewAccessibility;
  unsigned __int8 v3 = [(BKUITransitionViewAccessibility *)&v8 accessibilityViewIsModal];
  v4 = [(BKUITransitionViewAccessibility *)self accessibilityIdentifier];
  v5 = +[BKBasePresentingViewController bkaxPresentedAssetTransitionViewIdentifier];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6 | v3;
}

@end