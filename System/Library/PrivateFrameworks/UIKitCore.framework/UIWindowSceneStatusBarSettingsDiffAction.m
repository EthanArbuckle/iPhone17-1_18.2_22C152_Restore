@interface UIWindowSceneStatusBarSettingsDiffAction
@end

@implementation UIWindowSceneStatusBarSettingsDiffAction

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 |= 2u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_3(uint64_t a1, unsigned char *a2)
{
  *a2 |= 4u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_4(uint64_t a1, unsigned char *a2)
{
  *a2 |= 8u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_5(uint64_t a1, unsigned char *a2)
{
  *a2 |= 0x10u;
}

void __80___UIWindowSceneStatusBarSettingsDiffAction_sceneSettingsStatusBarDiffInspector__block_invoke_6(uint64_t a1, unsigned char *a2)
{
  *a2 |= 0x20u;
}

void __155___UIWindowSceneStatusBarSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "level", (void)v8);
        if (v7 < 1000.0) {
          [v6 _sceneSettingsSafeAreaInsetsDidChange];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

uint64_t __124___UIWindowSceneStatusBarSettingsDiffAction__updateForcedStatusBarForegroundTransparentWithSceneSettings_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStatusBarForegroundTransparent:*(unsigned __int8 *)(a1 + 32)];
}

@end