@interface _UIFluidNavigationTransitionsDomain
+ (Class)rootSettingsClass;
+ (_UIFluidParallaxTransitionSettings)parallaxSettings;
+ (id)domainGroupName;
+ (id)domainName;
@end

@implementation _UIFluidNavigationTransitionsDomain

+ (_UIFluidParallaxTransitionSettings)parallaxSettings
{
  v2 = [a1 rootSettings];
  v3 = [v2 parallaxSettings];

  return (_UIFluidParallaxTransitionSettings *)v3;
}

+ (id)domainName
{
  return @"Fluid Navigation Transitions";
}

+ (id)domainGroupName
{
  return @"UIKit";
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end