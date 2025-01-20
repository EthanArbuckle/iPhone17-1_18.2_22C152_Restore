@interface TSUIPopoverPresentationControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)presentationTransitionDidEnd:(BOOL)a3;
@end

@implementation TSUIPopoverPresentationControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIPopoverPresentationController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSUIPopoverPresentationControllerAccessibility;
  [(TSUIPopoverPresentationControllerAccessibility *)&v7 presentationTransitionDidEnd:a3];
  id v4 = [[self tsaxValueForKey:@"presentedViewController"] tsaxValueForKey:@"view"];
  if ([v4 tsaxValueForKey:@"window"])
  {
    id v5 = [v4 tsaxValueForKey:@"_accessibleSubviews"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v5 count])
      {
        id v6 = [objc_msgSend(v5 sortedArrayUsingSelector:NSSelectorFromString(@"accessibilityCompareGeometry:")), "firstObject"];
        NSClassFromString(@"_UIRemoteView");
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:v6];
        }
      }
    }
  }
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end