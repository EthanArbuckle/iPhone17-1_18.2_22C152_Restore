@interface NSObject(SAUISystemApertureViewControllerTransitioning)
- (BOOL)_isSystemApertureTransitioningOptionEnabled:()SAUISystemApertureViewControllerTransitioning;
- (uint64_t)isPerformingSystemApertureCustomContentTransition;
- (uint64_t)isPerformingSystemApertureInertTransition;
- (uint64_t)setPerformingSystemApertureCustomContentTransition:()SAUISystemApertureViewControllerTransitioning;
- (uint64_t)setPerformingSystemApertureInertTransition:()SAUISystemApertureViewControllerTransitioning;
- (void)_setSystemApertureTransitioningOption:()SAUISystemApertureViewControllerTransitioning enabled:;
@end

@implementation NSObject(SAUISystemApertureViewControllerTransitioning)

- (BOOL)_isSystemApertureTransitioningOptionEnabled:()SAUISystemApertureViewControllerTransitioning
{
  v4 = objc_getAssociatedObject(a1, "com.apple.SystemApertureUI.viewControllerTransitioningOptions");
  BOOL v5 = ([v4 unsignedIntegerValue] & a3) != 0;

  return v5;
}

- (void)_setSystemApertureTransitioningOption:()SAUISystemApertureViewControllerTransitioning enabled:
{
  v7 = objc_getAssociatedObject(a1, "com.apple.SystemApertureUI.viewControllerTransitioningOptions");
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = 0;
  if (a4 && v8 | a3)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v8 | a3, 0);
  }
  id v10 = v9;
  objc_setAssociatedObject(a1, "com.apple.SystemApertureUI.viewControllerTransitioningOptions", v9, (void *)3);
}

- (uint64_t)isPerformingSystemApertureCustomContentTransition
{
  return [a1 _isSystemApertureTransitioningOptionEnabled:1];
}

- (uint64_t)setPerformingSystemApertureCustomContentTransition:()SAUISystemApertureViewControllerTransitioning
{
  return [a1 _setSystemApertureTransitioningOption:1 enabled:a3];
}

- (uint64_t)isPerformingSystemApertureInertTransition
{
  return [a1 _isSystemApertureTransitioningOptionEnabled:2];
}

- (uint64_t)setPerformingSystemApertureInertTransition:()SAUISystemApertureViewControllerTransitioning
{
  return [a1 _setSystemApertureTransitioningOption:2 enabled:a3];
}

@end