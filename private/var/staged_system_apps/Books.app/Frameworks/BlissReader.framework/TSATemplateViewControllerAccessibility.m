@interface TSATemplateViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_cancel;
@end

@implementation TSATemplateViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSATemplateViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_cancel
{
  v2.receiver = self;
  v2.super_class = (Class)TSATemplateViewControllerAccessibility;
  [(TSATemplateViewControllerAccessibility *)&v2 _cancel];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end