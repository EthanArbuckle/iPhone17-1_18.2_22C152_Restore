@interface SPUISearchBarSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)transitionContextClass;
@end

@implementation SPUISearchBarSceneSpecification

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