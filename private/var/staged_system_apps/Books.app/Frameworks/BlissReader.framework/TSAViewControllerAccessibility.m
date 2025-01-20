@interface TSAViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)toolbarButtonItemForCoachingTipsWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation TSAViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSAViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)toolbarButtonItemForCoachingTipsWithTarget:(id)a3 action:(SEL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSAViewControllerAccessibility;
  id v4 = [(TSAViewControllerAccessibility *)&v6 toolbarButtonItemForCoachingTipsWithTarget:a3 action:a4];
  [v4 setAccessibilityLabel:TSAccessibilityLocalizedString(@"coaching.tips.button.label")];
  [v4 setAccessibilityHint:TSAccessibilityLocalizedString(@"coaching.tips.button.help.iOS")];
  return v4;
}

@end