@interface UIWindowSceneUserInterfaceStyleSettingsDiffAction
@end

@implementation UIWindowSceneUserInterfaceStyleSettingsDiffAction

void __98___UIWindowSceneUserInterfaceStyleSettingsDiffAction_sceneSettingsUserInterfaceStyleDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __164___UIWindowSceneUserInterfaceStyleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  [v2 _updateSceneTraitsAndPushTraitsToScreen:1 callParentWillTransitionToTraitCollection:1];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIWindowSceneDidUpdateSystemUserInterfaceStyle" object:*(void *)(a1 + 32)];
}

uint64_t __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __130___UIWindowSceneUserInterfaceStyleSettingsDiffAction__animateUserInterfaceStyleChangeInScene_transitionContext_applyChangesBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 setWindowScene:0];
}

@end