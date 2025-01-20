@interface IMViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)_transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6;
@end

@implementation IMViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"IMViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)IMViewControllerAccessibility;
  v6 = [(IMViewControllerAccessibility *)&v9 _transitionFromViewController:a3 toViewController:a4 transition:a5 reverse:a6];
  dispatch_time_t v7 = dispatch_time(0, 250000000);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_2C8400);

  return v6;
}

@end