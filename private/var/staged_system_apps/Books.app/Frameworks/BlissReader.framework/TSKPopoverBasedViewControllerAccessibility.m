@interface TSKPopoverBasedViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSKPopoverControllerAccessibility)tsaxPopoverController;
- (id)p_newCloseImageBarButtonWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation TSKPopoverBasedViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKPopoverBasedViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSKPopoverControllerAccessibility)tsaxPopoverController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSKPopoverControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSKPopoverBasedViewControllerAccessibility *)self tsaxValueForKey:@"mPopoverController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)p_newCloseImageBarButtonWithTarget:(id)a3 action:(SEL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSKPopoverBasedViewControllerAccessibility;
  id v4 = [(TSKPopoverBasedViewControllerAccessibility *)&v6 p_newCloseImageBarButtonWithTarget:a3 action:a4];
  [v4 setAccessibilityLabel:TSAccessibilityLocalizedString(@"done.button")];
  return v4;
}

@end