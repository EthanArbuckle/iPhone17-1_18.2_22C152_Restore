@interface UIApplicationSceneSpecification
- (BOOL)affectsAppLifecycleIfInternal;
- (BOOL)affectsScreenOrientation;
- (BOOL)isInternal;
- (BOOL)isUIKitManaged;
- (Class)clientAgentClass;
- (Class)clientSettingsClass;
- (Class)hostAgentClass;
- (Class)lifecycleMonitorClass;
- (Class)sceneSubstrateClass;
- (Class)settingsClass;
- (Class)transitionContextClass;
- (Class)uiSceneMinimumClass;
- (id)_transitionContextHandlers;
- (id)baseSceneComponentClassDictionary;
- (id)connectionHandlers;
- (id)coreSceneComponentClassDictionary;
- (id)defaultExtensions;
- (id)disconnectionHandlers;
- (id)finalActionHandlers;
- (id)initialActionHandlers;
- (id)initialSettingsDiffActions;
- (id)uiSceneSessionRole;
@end

@implementation UIApplicationSceneSpecification

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

- (id)coreSceneComponentClassDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIKeyWindowSceneObserverComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIEventDeferringSceneComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:0x1ED130B40];
  [v2 setObject:objc_opt_class() forKeyedSubscript:0x1ED130B20];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIFocusSystemSceneComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIShareableContentSceneComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:@"_UIHomeAffordanceSceneNotifierComponentKey"];
  return v2;
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
    v3 = _Block_copy(&__block_literal_global_81);
    v5[0] = v3;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  return v2;
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)sceneSubstrateClass
{
  return (Class)objc_opt_class();
}

- (Class)hostAgentClass
{
  return (Class)objc_opt_class();
}

- (Class)clientAgentClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return @"UIWindowSceneSessionRoleApplication";
}

- (BOOL)isUIKitManaged
{
  return 1;
}

- (BOOL)isInternal
{
  return 0;
}

- (Class)lifecycleMonitorClass
{
  return (Class)self;
}

- (id)initialSettingsDiffActions
{
  v18[10] = *MEMORY[0x1E4F143B8];
  v16 = objc_opt_new();
  v18[0] = v16;
  v15 = objc_opt_new();
  v18[1] = v15;
  v14 = objc_opt_new();
  v18[2] = v14;
  v3 = objc_opt_new();
  v18[3] = v3;
  v4 = objc_opt_new();
  v18[4] = v4;
  v5 = objc_opt_new();
  v18[5] = v5;
  v6 = objc_opt_new();
  v18[6] = v6;
  v7 = objc_opt_new();
  v18[7] = v7;
  v8 = objc_opt_new();
  v18[8] = v8;
  v9 = objc_opt_new();
  v18[9] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:10];
  v17.receiver = self;
  v17.super_class = (Class)UIApplicationSceneSpecification;
  v11 = [(FBSSceneSpecification *)&v17 initialSettingsDiffActions];
  v12 = [v10 arrayByAddingObjectsFromArray:v11];

  return v12;
}

- (id)initialActionHandlers
{
  v19[1] = *MEMORY[0x1E4F143B8];
  p_cache = UITableConstants_IOS.cache;
  v9 = objc_opt_new();
  v19[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  v16 = v10;
  if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) != 0
    || [(id)UIApp _appAdoptsUICanvasLifecycle])
  {
    v15 = objc_opt_new();
    v18[0] = v15;
    v2 = objc_opt_new();
    v18[1] = v2;
    p_cache = objc_opt_new();
    v18[2] = p_cache;
    v3 = objc_opt_new();
    v18[3] = v3;
    v4 = objc_opt_new();
    v18[4] = v4;
    v5 = objc_opt_new();
    v18[5] = v5;
    v6 = objc_opt_new();
    v18[6] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:7];
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)UIApplicationSceneSpecification;
  v12 = [(FBSSceneSpecification *)&v17 initialActionHandlers];
  v13 = [v10 arrayByAddingObjectsFromArray:v12];

  if (v11)
  {
  }
  return v13;
}

- (id)finalActionHandlers
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v6[0] = v2;
  v3 = objc_opt_new();
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (BOOL)affectsScreenOrientation
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 0;
}

- (id)baseSceneComponentClassDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_opt_class(), "_statusBarManagerClass"), _UIStatusBarManagerWindowSceneComponentKey);
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UISystemAppearanceManagerWindowSceneComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIBannerManagerWindowSceneComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIAlertControllerStackManagerCanvasComponentKey];
  if (+[_UIDebugIdentifierLabelSceneComponent isEnabled])
  {
    [v2 setObject:objc_opt_class() forKeyedSubscript:0x1ED160F60];
  }
  if (_os_feature_enabled_impl()) {
    [v2 setObject:objc_opt_class() forKeyedSubscript:@"_UIContentTextExtractionSceneComponentKey"];
  }
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIRenderingEnvironmentSceneComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIHDRUsageCoordinatorSceneComponentKey];
  [v2 setObject:objc_opt_class() forKeyedSubscript:_UIInterfaceProtectionSceneComponentKey];
  return v2;
}

- (id)_transitionContextHandlers
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) != 0
    || [(id)UIApp _appAdoptsUICanvasLifecycle])
  {
    v3 = objc_opt_new();
    v9[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v8.receiver = self;
  v8.super_class = (Class)UIApplicationSceneSpecification;
  v5 = [(FBSSceneSpecification *)&v8 _transitionContextHandlers];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)defaultExtensions
{
  v11[9] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)UIApplicationSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v10 defaultExtensions];
  v3 = (void *)[v2 mutableCopy];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  v6 = v5;

  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];
  [v6 addObjectsFromArray:v7];

  objc_super v8 = (void *)[v6 copy];
  return v8;
}

- (id)disconnectionHandlers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = _Block_copy(&__block_literal_global_8_1);
    v5[0] = v3;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  return v2;
}

@end