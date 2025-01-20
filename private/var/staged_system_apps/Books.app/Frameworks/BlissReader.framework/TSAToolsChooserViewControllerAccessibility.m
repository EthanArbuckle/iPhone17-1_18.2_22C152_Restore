@interface TSAToolsChooserViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)didSelectImageAtIndex:(unint64_t)a3;
@end

@implementation TSAToolsChooserViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSAToolsChooserViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)didSelectImageAtIndex:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSAToolsChooserViewControllerAccessibility;
  [(TSAToolsChooserViewControllerAccessibility *)&v3 didSelectImageAtIndex:a3];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

@end