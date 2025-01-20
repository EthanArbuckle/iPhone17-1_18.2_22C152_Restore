@interface SBUIBackgroundContentSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)initialActionHandlers;
- (id)uiSceneSessionRole;
@end

@implementation SBUIBackgroundContentSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)self;
}

- (Class)settingsClass
{
  return (Class)self;
}

- (id)initialActionHandlers
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIBackgroundContentSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v6 initialActionHandlers];
  v3 = objc_alloc_init(SBUIBackgroundContentActionHandler);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)uiSceneSessionRole
{
  return @"SBUIBackgroundContentSceneSessionRole";
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_class();
}

@end