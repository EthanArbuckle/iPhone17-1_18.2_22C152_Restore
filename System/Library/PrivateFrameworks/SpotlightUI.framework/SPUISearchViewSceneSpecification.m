@interface SPUISearchViewSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)transitionContextClass;
@end

@implementation SPUISearchViewSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

@end