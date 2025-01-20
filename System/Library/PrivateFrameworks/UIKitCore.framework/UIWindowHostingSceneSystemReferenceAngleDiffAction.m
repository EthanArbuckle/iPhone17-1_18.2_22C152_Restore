@interface UIWindowHostingSceneSystemReferenceAngleDiffAction
@end

@implementation UIWindowHostingSceneSystemReferenceAngleDiffAction

void __68___UIWindowHostingSceneSystemReferenceAngleDiffAction_diffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __68___UIWindowHostingSceneSystemReferenceAngleDiffAction_diffInspector__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 |= 2u;
}

void __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2;
  v2[3] = &unk_1E52DA6D8;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v1, v2, 0);
}

void __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1)
{
  id v2 = +[_UISystemReferenceAngleMultiplexer sharedMultiplexer];
  [v2 systemReferenceAngleDidChange:*(void *)(a1 + 48) mode:*(void *)(a1 + 32) forWindows:*(double *)(a1 + 40)];
}

@end