@interface PBUIWallpaperWindowSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)initialActionHandlers;
- (id)initialSettingsDiffActions;
- (id)uiSceneSessionRole;
@end

@implementation PBUIWallpaperWindowSceneSpecification

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
  v6.super_class = (Class)PBUIWallpaperWindowSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v6 initialActionHandlers];
  v3 = objc_alloc_init(PBUIWallpaperWindowSceneBSActionHandler);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)initialSettingsDiffActions
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PBUIWallpaperWindowSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v8 initialSettingsDiffActions];
  v3 = objc_opt_new();
  v9[0] = v3;
  v4 = objc_opt_new();
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  objc_super v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)uiSceneSessionRole
{
  return @"PBUIWallpaperSceneSessionRoleWallpaper";
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

@end