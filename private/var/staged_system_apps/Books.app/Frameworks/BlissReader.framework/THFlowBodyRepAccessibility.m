@interface THFlowBodyRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_accessibilityScrollLeftPage;
@end

@implementation THFlowBodyRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THFlowBodyRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityScrollLeftPage
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_293C8C;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
  UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, &stru_46D7E8);
}

@end