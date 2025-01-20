@interface THDisplaySettingsViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation THDisplaySettingsViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THDisplaySettingsViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THDisplaySettingsViewControllerAccessibility;
  [(THDisplaySettingsViewControllerAccessibility *)&v7 viewDidAppear:a3];
  id v4 = [[-[THDisplaySettingsViewControllerAccessibility view](self, "view") _accessibilityLeafDescendantsWithOptions:[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions")] firstObject];
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_29CB60;
  block[3] = &unk_456DE0;
  block[4] = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end