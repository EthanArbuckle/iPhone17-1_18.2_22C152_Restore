@interface UIView(UIFocusAnimationConfiguration)
+ (_SMUIFocusAnimationConfiguration)smu_animationConfigurationForStyle:()UIFocusAnimationConfiguration;
@end

@implementation UIView(UIFocusAnimationConfiguration)

+ (_SMUIFocusAnimationConfiguration)smu_animationConfigurationForStyle:()UIFocusAnimationConfiguration
{
  return +[_UIFocusAnimationConfiguration configurationWithStyle:](_SMUIFocusAnimationConfiguration, "configurationWithStyle:");
}

@end