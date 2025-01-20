@interface UIApplicationExternalScreenSceneSpecification
- (id)baseSceneComponentClassDictionary;
- (id)connectionHandlers;
- (id)disconnectionHandlers;
- (id)initialSettingsDiffActions;
- (id)uiSceneSessionRole;
@end

@implementation UIApplicationExternalScreenSceneSpecification

- (id)initialSettingsDiffActions
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v10[0] = v2;
  v3 = objc_opt_new();
  v10[1] = v3;
  v4 = objc_opt_new();
  v10[2] = v4;
  v5 = objc_opt_new();
  v10[3] = v5;
  v6 = objc_opt_new();
  v10[4] = v6;
  v7 = objc_opt_new();
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (id)connectionHandlers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = _Block_copy(&__block_literal_global_20);
    v5[0] = v3;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  return v2;
}

- (id)disconnectionHandlers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)baseSceneComponentClassDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)uiSceneSessionRole
{
  return @"UIWindowSceneSessionRoleExternalDisplayNonInteractive";
}

@end