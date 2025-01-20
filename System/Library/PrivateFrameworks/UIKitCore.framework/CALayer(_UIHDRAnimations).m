@interface CALayer(_UIHDRAnimations)
- (id)_ui_animationForHDRHeadroomUsageEnabled:()_UIHDRAnimations;
- (void)_ui_configureForHDRHeadroomUsageEnabled:()_UIHDRAnimations;
@end

@implementation CALayer(_UIHDRAnimations)

- (void)_ui_configureForHDRHeadroomUsageEnabled:()_UIHDRAnimations
{
  +[_UIHDRUsageCoordinator sharedInstance]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    double v5 = 0.0;
    if (a3) {
      double v5 = 1.0;
    }
    [a1 setContentsEDRStrength:v5];
  }
}

- (id)_ui_animationForHDRHeadroomUsageEnabled:()_UIHDRAnimations
{
  double v5 = +[_UIHDRUsageCoordinator sharedInstance]();
  id v6 = -[_UIHDRUsageCoordinator animationForHDRHeadroomUsage:layer:]((uint64_t)v5, a3, a1);

  return v6;
}

@end