@interface UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction
@end

@implementation UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction

void __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setIsRespondingToLifecycleEvent:1];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = [v2 _effectiveSettings];
  _UISceneLifecycleSettingsUpdateBlockWithCanvasAndTransitionContext(v2, v3, v4, *(void **)(a1 + 48));
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  if (v6) {
    v6[2]();
  }
  v5 = +[_UISceneLifecycleMultiplexer sharedInstance];
  [v5 uiScene:*(void *)(a1 + 32) transitionedFromState:*(void *)(a1 + 40) withTransitionContext:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) _setIsRespondingToLifecycleEvent:0];
}

void __127___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction_sceneSettingsApplicationLifecycleEventDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __127___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction_sceneSettingsApplicationLifecycleEventDiffInspector__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 |= 2u;
}

void __186___UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_100(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _alertControllerStackManager];
  id v3 = v2;
  if (*(unsigned char *)(a1 + 40)) {
    [v2 _showHiddenStackedAlertControllers];
  }
  else {
    [v2 _hideStackedAlertControllers];
  }
  if (*(unsigned char *)(a1 + 40) && (*(unsigned char *)(UIApp + 177) & 0x20) != 0) {
    [(id)UIApp _stopDeactivatingForReason:13];
  }
}

@end