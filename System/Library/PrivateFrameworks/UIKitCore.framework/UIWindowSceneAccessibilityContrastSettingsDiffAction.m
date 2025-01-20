@interface UIWindowSceneAccessibilityContrastSettingsDiffAction
@end

@implementation UIWindowSceneAccessibilityContrastSettingsDiffAction

void __104___UIWindowSceneAccessibilityContrastSettingsDiffAction_sceneSettingsAccessibilityContrastDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __167___UIWindowSceneAccessibilityContrastSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "_windows", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) _updateWindowTraits];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __136___UIWindowSceneAccessibilityContrastSettingsDiffAction__animateAccessibilityContrastChangeInScene_transitionContext_applyChangesBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setWindowScene:0];
}

@end