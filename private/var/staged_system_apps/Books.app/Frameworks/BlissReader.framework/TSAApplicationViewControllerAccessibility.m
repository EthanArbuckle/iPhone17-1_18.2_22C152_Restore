@interface TSAApplicationViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)setupToolbarForViewController:(id)a3 duration:(double)a4;
@end

@implementation TSAApplicationViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSAApplicationViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)setupToolbarForViewController:(id)a3 duration:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSAApplicationViewControllerAccessibility;
  -[TSAApplicationViewControllerAccessibility setupToolbarForViewController:duration:](&v5, "setupToolbarForViewController:duration:", a3);
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(&stru_46C0D0, a4);
}

@end