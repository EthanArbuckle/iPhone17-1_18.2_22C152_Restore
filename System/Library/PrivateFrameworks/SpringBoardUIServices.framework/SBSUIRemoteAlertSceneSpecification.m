@interface SBSUIRemoteAlertSceneSpecification
- (Class)uiSceneMinimumClass;
- (id)defaultExtensions;
- (id)initialSettingsDiffActions;
- (id)uiSceneSessionRole;
@end

@implementation SBSUIRemoteAlertSceneSpecification

- (id)defaultExtensions
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)initialSettingsDiffActions
{
  v6.receiver = self;
  v6.super_class = (Class)SBSUIRemoteAlertSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v6 initialSettingsDiffActions];
  v3 = objc_opt_new();
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)uiSceneSessionRole
{
  return @"SBSUIWindowSceneSessionRoleRemoteAlert";
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

@end