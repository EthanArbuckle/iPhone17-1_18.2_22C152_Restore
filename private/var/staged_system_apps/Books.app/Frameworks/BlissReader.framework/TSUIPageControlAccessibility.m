@interface TSUIPageControlAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_accessibilityCurrentPageDidChange;
@end

@implementation TSUIPageControlAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIPageControl";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityCurrentPageDidChange
{
  if ([(TSUIPageControlAccessibility *)self tsaxPageChangeCausesLayoutChange])
  {
    TSAccessibilityPostLayoutChangedNotification(0);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TSUIPageControlAccessibility;
    [(TSUIPageControlAccessibility *)&v3 _accessibilityCurrentPageDidChange];
  }
}

@end