@interface SBSUIInCallSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)defaultExtensions;
- (id)initialActionHandlers;
- (id)initialSettingsDiffActions;
- (id)uiSceneSessionRole;
@end

@implementation SBSUIInCallSceneSpecification

- (id)defaultExtensions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getAMUIAmbientPresentationSceneExtensionClass_softClass_0;
  uint64_t v10 = getAMUIAmbientPresentationSceneExtensionClass_softClass_0;
  if (!getAMUIAmbientPresentationSceneExtensionClass_softClass_0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_0;
    v6[3] = &unk_1E5CCC5D0;
    v6[4] = &v7;
    __getAMUIAmbientPresentationSceneExtensionClass_block_invoke_0((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v11[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  return v4;
}

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
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBSUIInCallSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v7 initialActionHandlers];
  id v3 = objc_alloc_init(SBSUIInCallWindowSceneBSActionsHandler);
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = [v2 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)initialSettingsDiffActions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBSUIInCallSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v7 initialSettingsDiffActions];
  id v3 = objc_alloc_init(SBSUIInCallWindowSceneSettingsDiffAction);
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = [v2 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)uiSceneSessionRole
{
  return @"SBSUIWindowSceneSessionRoleInCall";
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

@end