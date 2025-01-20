@interface SBSUIRemoteAlertSceneDiffAction
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation SBSUIRemoteAlertSceneDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v22 = v11;
  v15 = [v22 delegate];
  if ([v14 isInvalidatedForHostInvalidation])
  {
    if (objc_opt_respondsToSelector()) {
      [v15 remoteAlertSceneDidInvalidateForRemoteAlertServiceInvalidation:v22];
    }
  }
  else
  {
    v16 = [v14 remoteAlertActivationContext];

    if (v16)
    {
      v17 = objc_msgSend(v12, "SBSUI_remoteAlertComponent");
      v18 = [v14 remoteAlertActivationContext];
      [v17 setActivationContext:v18];

      if (objc_opt_respondsToSelector()) {
        [v15 remoteAlertSceneDidUpdateActivationContext:v22];
      }
    }
    v19 = [v14 buttonActions];
    if (v19 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v15 remoteAlertScene:v22 handleButtonActions:v19];
    }
    if ([v13 containsProperty:sel_isAttachedToWindowedAccessory]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v20 = [v12 settings];
      uint64_t v21 = [v20 isAttachedToWindowedAccessory];
      [v20 windowedAccessoryCutoutFrameInScreen];
      objc_msgSend(v15, "remoteAlertScene:didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v22, v21);
    }
  }
}

@end