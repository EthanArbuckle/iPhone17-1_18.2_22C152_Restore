@interface TSAFirstLaunchViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_primaryButtonTapped;
- (void)_secondaryButtonTapped;
@end

@implementation TSAFirstLaunchViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSAFirstLaunchViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_primaryButtonTapped
{
  v2.receiver = self;
  v2.super_class = (Class)TSAFirstLaunchViewControllerAccessibility;
  [(TSAFirstLaunchViewControllerAccessibility *)&v2 _primaryButtonTapped];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_secondaryButtonTapped
{
  v2.receiver = self;
  v2.super_class = (Class)TSAFirstLaunchViewControllerAccessibility;
  [(TSAFirstLaunchViewControllerAccessibility *)&v2 _secondaryButtonTapped];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end