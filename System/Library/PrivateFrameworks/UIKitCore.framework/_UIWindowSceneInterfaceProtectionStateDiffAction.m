@interface _UIWindowSceneInterfaceProtectionStateDiffAction
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation _UIWindowSceneInterfaceProtectionStateDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v13 || [v13 containsProperty:sel_underAppProtection])
  {
    v16 = [v12 settings];
    v17 = [v19 _interfaceProtectionSceneComponent];
    -[_UIInterfaceProtectionSceneComponent setUnderAppProtection:]((uint64_t)v17, [v16 underAppProtection]);

    v18 = [v19 _interfaceProtectionSceneComponent];
    -[_UIInterfaceProtectionSceneComponent _invalidateTraitOverrides]((uint64_t)v18);
  }
}

@end