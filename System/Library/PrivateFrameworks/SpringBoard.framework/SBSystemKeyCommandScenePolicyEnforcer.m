@interface SBSystemKeyCommandScenePolicyEnforcer
- (BSInvalidatable)spotlightSystemShortcutFocusRule;
- (SBSystemKeyCommandScenePolicyEnforcer)initWithSceneProvider:(id)a3 debugName:(id)a4 deliveryManager:(id)a5;
- (void)enforce:(id)a3;
- (void)setSpotlightSystemShortcutFocusRule:(id)a3;
- (void)stopEnforcing;
@end

@implementation SBSystemKeyCommandScenePolicyEnforcer

- (void)enforce:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [(SBKeyboardFocusSceneProviding *)self->_sceneProvider spotlightScene];
  v6 = +[SBKeyboardFocusTarget targetForFBScene:v5];
  int v7 = _os_feature_enabled_impl();
  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || ([v4 keyboardFocusTarget],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v6 isEqual:v9],
        v9,
        !v10))
  {
    if (self->_spotlightSystemShortcutFocusRule)
    {
      v21 = SBLogKeyboardFocus();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
        *(_DWORD *)buf = 138543362;
        v36 = v22;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "rules: (systemKeyCommandOverlay) Spotlight is no longer focused, dropping (%{public}@) -> spotlight", buf, 0xCu);
      }
      [(BSInvalidatable *)self->_spotlightSystemShortcutFocusRule invalidate];
      spotlightSystemShortcutFocusRule = self->_spotlightSystemShortcutFocusRule;
      self->_spotlightSystemShortcutFocusRule = 0;
      goto LABEL_13;
    }
  }
  else if (!self->_spotlightSystemShortcutFocusRule)
  {
    spotlightSystemShortcutFocusRule = [v4 sbWindowSceneAncestor];
    v12 = (void *)[MEMORY[0x1E4F4F358] new];
    v13 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
    v34 = v12;
    [v12 setEnvironment:v13];

    v14 = [spotlightSystemShortcutFocusRule _FBSScene];
    v15 = [v14 settings];
    v16 = objc_msgSend(v15, "sb_displayConfigurationForSceneManagers");
    char v17 = [v16 isExternal];
    v18 = (void *)MEMORY[0x1E4F4F2D0];
    if (v17)
    {
      v19 = [v16 hardwareIdentifier];
      v20 = [v18 displayWithHardwareIdentifier:v19];
    }
    else
    {
      v20 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
    }

    [v34 setDisplay:v20];
    v23 = [spotlightSystemShortcutFocusRule _FBSScene];
    v24 = [v23 identityToken];

    v25 = (void *)MEMORY[0x1E4F4F290];
    v26 = [v24 stringRepresentation];
    v27 = [v25 tokenForString:v26];
    [v34 setToken:v27];

    v28 = [v4 keyboardFocusTarget];
    v29 = -[SBKeyboardFocusTarget deferringTarget]((uint64_t)v28);

    v30 = [(BKSHIDEventDeliveryManager *)self->_deliveryManager deferEventsMatchingPredicate:v34 toTarget:v29 withReason:@"SpringBoard: systemKeyCommandOverlayEnvironment outbound to Spotlight"];
    v31 = self->_spotlightSystemShortcutFocusRule;
    self->_spotlightSystemShortcutFocusRule = v30;

    v32 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
      *(_DWORD *)buf = 138543618;
      v36 = v33;
      __int16 v37 = 2114;
      v38 = v29;
      _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "rules: (systemKeyCommandOverlay) Spotlight is focused, deferring (%{public}@) -> %{public}@", buf, 0x16u);
    }
LABEL_13:
  }
}

- (SBSystemKeyCommandScenePolicyEnforcer)initWithSceneProvider:(id)a3 debugName:(id)a4 deliveryManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSystemKeyCommandScenePolicyEnforcer;
  v12 = [(SBSystemKeyCommandScenePolicyEnforcer *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deliveryManager, a5);
    uint64_t v14 = [v10 copy];
    debugName = v13->_debugName;
    v13->_debugName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_sceneProvider, a3);
  }

  return v13;
}

- (void)stopEnforcing
{
  [(BSInvalidatable *)self->_spotlightSystemShortcutFocusRule invalidate];
  spotlightSystemShortcutFocusRule = self->_spotlightSystemShortcutFocusRule;
  self->_spotlightSystemShortcutFocusRule = 0;
}

- (BSInvalidatable)spotlightSystemShortcutFocusRule
{
  return self->_spotlightSystemShortcutFocusRule;
}

- (void)setSpotlightSystemShortcutFocusRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightSystemShortcutFocusRule, 0);
  objc_storeStrong((id *)&self->_sceneProvider, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end