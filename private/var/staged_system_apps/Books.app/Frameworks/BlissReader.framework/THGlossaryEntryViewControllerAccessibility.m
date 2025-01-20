@interface THGlossaryEntryViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)loadView;
@end

@implementation THGlossaryEntryViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THGlossaryEntryViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryEntryViewControllerAccessibility;
  [(THGlossaryEntryViewControllerAccessibility *)&v4 loadView];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_29415C;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

@end