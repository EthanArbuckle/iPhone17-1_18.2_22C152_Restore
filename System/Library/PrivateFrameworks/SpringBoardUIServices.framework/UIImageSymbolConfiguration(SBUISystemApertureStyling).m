@interface UIImageSymbolConfiguration(SBUISystemApertureStyling)
+ (uint64_t)sbui_systemApertureControlConfiguration;
+ (uint64_t)sbui_systemApertureDefaultConfiguration;
@end

@implementation UIImageSymbolConfiguration(SBUISystemApertureStyling)

+ (uint64_t)sbui_systemApertureDefaultConfiguration
{
  return [a1 configurationWithPointSize:4 weight:-1 scale:32.0];
}

+ (uint64_t)sbui_systemApertureControlConfiguration
{
  return [a1 configurationWithPointSize:6 weight:3 scale:19.0];
}

@end