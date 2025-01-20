@interface SBKeyboardFocusSceneSettingPolicyEnforcer
- (FBScene)sbWindowSceneAncestorForTargetScene;
- (FBScene)targetSceneForKeyboardFocusDeferring;
- (SBKeyboardFocusSceneSettingPolicyEnforcer)initWithSceneProvider:(id)a3;
- (void)_moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:(id)a3 withSBAncestor:(id)a4 toScene:(id)a5 withSBAncestor:(id)a6 target:(id)a7 activeDisplayChanging:(BOOL)a8;
- (void)enforce:(id)a3;
- (void)invalidate;
- (void)setSbWindowSceneAncestorForTargetScene:(id)a3;
- (void)setTargetSceneForKeyboardFocusDeferring:(id)a3;
- (void)stopEnforcing;
@end

@implementation SBKeyboardFocusSceneSettingPolicyEnforcer

void __53__SBKeyboardFocusSceneSettingPolicyEnforcer_enforce___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = [*(id *)(a1 + 72) keyboardFocusTarget];
  [v2 _moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:v3 withSBAncestor:v4 toScene:v5 withSBAncestor:v6 target:v7 activeDisplayChanging:*(unsigned __int8 *)(a1 + 80)];
}

- (void)_moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:(id)a3 withSBAncestor:(id)a4 toScene:(id)a5 withSBAncestor:(id)a6 target:(id)a7 activeDisplayChanging:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v13)
  {
    v16 = [v13 identityToken];
    v17 = [v14 identityToken];
    int v18 = [v16 isEqual:v17];
  }
  else
  {
    int v18 = 0;
  }
  if (v12)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke;
    v35[3] = &unk_1E6B00FF8;
    id v36 = v12;
    [v36 updateUISettingsWithBlock:v35];
  }
  if (v13)
  {
    v19 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    if (((!v8 | v18) & 1) == 0)
    {
      v20 = [v14 uiSettings];
      id v21 = [v20 targetOfEventDeferringEnvironments];

      if (([v21 containsObject:v19] & 1) == 0)
      {
        if (v21)
        {
          v22 = [v21 setByAddingObject:v19];
        }
        else
        {
          v22 = [MEMORY[0x1E4F1CAD0] setWithObject:v19];
        }
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_9;
        v32[3] = &unk_1E6B01020;
        id v33 = v14;
        id v21 = v22;
        id v34 = v21;
        [v33 updateUISettingsWithBlock:v32];
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_10;
      v28[3] = &unk_1E6B01070;
      id v29 = v14;
      id v30 = v21;
      id v31 = v19;
      id v24 = v21;
      [v29 updateUISettingsWithBlock:v28];
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_2;
    v25[3] = &unk_1E6B01020;
    id v26 = v13;
    id v27 = v19;
    v23 = v19;
    [v26 updateUISettingsWithBlock:v25];
  }
  else
  {
    v23 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusSceneSettingPolicyEnforcer _moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:withSBAncestor:toScene:withSBAncestor:target:activeDisplayChanging:]((uint64_t)v15, v23);
    }
  }
}

- (void)enforce:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetSceneForKeyboardFocusDeferring);
  id v6 = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestorForTargetScene);
  sceneProvider = self->_sceneProvider;
  BOOL v8 = [v4 keyboardFocusTarget];
  v9 = [(SBKeyboardFocusSceneProviding *)sceneProvider sceneForFocusTarget:v8];

  v10 = self->_sceneProvider;
  v11 = [v4 sbWindowSceneAncestor];
  id v12 = +[SBKeyboardFocusTarget targetForSBWindowScene:v11];
  id v13 = [(SBKeyboardFocusSceneProviding *)v10 sceneForFocusTarget:v12];

  id v14 = [WeakRetained identityToken];
  id v15 = [v9 identityToken];
  int v16 = BSEqualObjects();

  v17 = [v6 identityToken];
  int v18 = [v13 identityToken];
  int v19 = BSEqualObjects();

  if (v9)
  {
    if ((v16 & v19 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__SBKeyboardFocusSceneSettingPolicyEnforcer_enforce___block_invoke;
      block[3] = &unk_1E6B00FD0;
      block[4] = self;
      id v24 = WeakRetained;
      id v25 = v6;
      id v20 = v9;
      id v26 = v20;
      id v21 = v13;
      id v27 = v21;
      id v28 = v4;
      char v29 = v19 ^ 1;
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_storeWeak((id *)&self->_targetSceneForKeyboardFocusDeferring, v20);
      objc_storeWeak((id *)&self->_sbWindowSceneAncestorForTargetScene, v21);
    }
  }
  else
  {
    v22 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      [(SBKeyboardFocusSceneSettingPolicyEnforcer *)v4 enforce:v22];
    }
  }
}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) identifier];
    int v7 = 138543362;
    BOOL v8 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) ADDED keyboardFocus environment to scene: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  [v3 setTargetOfEventDeferringEnvironments:v6];
}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) identifier];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) REMOVED keyboardFocus environment from scene: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [v3 setTargetOfEventDeferringEnvironments:0];
}

- (SBKeyboardFocusSceneSettingPolicyEnforcer)initWithSceneProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusSceneSettingPolicyEnforcer;
  int v6 = [(SBKeyboardFocusSceneSettingPolicyEnforcer *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sceneProvider, a3);
  }

  return v7;
}

- (void)stopEnforcing
{
  id v4 = [NSString stringWithFormat:@"Not implemented"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    objc_super v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = @"SBKeyboardFocusSceneSettingPolicyEnforcer.m";
    __int16 v16 = 1024;
    int v17 = 72;
    __int16 v18 = 2114;
    int v19 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)invalidate
{
  id v4 = [NSString stringWithFormat:@"Not implemented"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    objc_super v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = @"SBKeyboardFocusSceneSettingPolicyEnforcer.m";
    __int16 v16 = 1024;
    int v17 = 79;
    __int16 v18 = 2114;
    int v19 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) temporarily added keyboardFocus environment to SpringBoard scene: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [v3 setTargetOfEventDeferringEnvironments:*(void *)(a1 + 40)];
}

void __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogKeyboardFocus();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "rules: (scene setting) immediately removed keyboardFocus environment from SpringBoard scene: %{public}@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_11;
  v8[3] = &unk_1E6B01048;
  int v6 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  int v7 = [v6 objectsPassingTest:v8];
  [v3 setTargetOfEventDeferringEnvironments:v7];
}

uint64_t __172__SBKeyboardFocusSceneSettingPolicyEnforcer__moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene_withSBAncestor_toScene_withSBAncestor_target_activeDisplayChanging___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (FBScene)targetSceneForKeyboardFocusDeferring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetSceneForKeyboardFocusDeferring);
  return (FBScene *)WeakRetained;
}

- (void)setTargetSceneForKeyboardFocusDeferring:(id)a3
{
}

- (FBScene)sbWindowSceneAncestorForTargetScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowSceneAncestorForTargetScene);
  return (FBScene *)WeakRetained;
}

- (void)setSbWindowSceneAncestorForTargetScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowSceneAncestorForTargetScene);
  objc_destroyWeak((id *)&self->_targetSceneForKeyboardFocusDeferring);
  objc_storeStrong((id *)&self->_sceneProvider, 0);
}

- (void)enforce:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 keyboardFocusTarget];
  int v6 = [a2 identityToken];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  __int16 v10 = v6;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "rules: (scene setting) couldn't find scene with target: %{public}@, leaving scene setting on %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_moveKeyboardFocusDeferringEnvironmentSceneSettingFromScene:(uint64_t)a1 withSBAncestor:(NSObject *)a2 toScene:withSBAncestor:target:activeDisplayChanging:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "rules: (scene setting) keyboardFocus environment scene not found for target: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end