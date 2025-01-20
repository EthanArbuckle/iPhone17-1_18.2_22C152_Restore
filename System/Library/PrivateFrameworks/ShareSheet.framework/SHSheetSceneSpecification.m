@interface SHSheetSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)uiSceneSessionRole;
@end

@implementation SHSheetSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)MEMORY[0x1F41817D0](SHSheetSceneClientSettings, a2);
}

- (Class)settingsClass
{
  return (Class)MEMORY[0x1F41817D0](SHSheetSceneSettings, a2);
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return @"UISceneSessionRoleShareSheet";
}

@end