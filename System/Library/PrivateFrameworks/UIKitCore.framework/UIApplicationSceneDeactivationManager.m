@interface UIApplicationSceneDeactivationManager
- (BOOL)_areEligibleSettings:(id)a3;
- (BOOL)_isEligibleScene:(id)a3;
- (BOOL)_isEligibleScene:(id)a3 withSettings:(id)a4;
- (NSString)description;
- (UIApplicationSceneDeactivationManager)init;
- (id)assertions;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)eligibleScenes;
- (id)newAssertionWithReason:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_deactivationReasonsForScene:(id)a3 withSettings:(id)a4;
- (void)_setDeactivationReasons:(unint64_t)a3 onScene:(id)a4 withSettings:(id)a5 reason:(id)a6;
- (void)_trackScene:(id)a3;
- (void)_untrackScene:(id)a3;
- (void)_updateScenesWithTransitionContext:(id)a3 reason:(id)a4;
- (void)addAssertion:(id)a3 withTransitionContext:(id)a4;
- (void)amendSceneSettings:(id)a3 forScene:(id)a4;
- (void)beginTrackingScene:(id)a3;
- (void)removeAssertion:(id)a3;
@end

@implementation UIApplicationSceneDeactivationManager

id __83__UIApplicationSceneDeactivationManager__updateScenesWithTransitionContext_reason___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[8];
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v6 = NSString;
  uint64_t v7 = a1[6];
  id v8 = a2;
  v9 = [v6 stringWithFormat:@"updateAllScenesForBand - %@", v7];
  [v4 _setDeactivationReasons:v3 onScene:v5 withSettings:v8 reason:v9];

  v10 = (void *)a1[7];
  return v10;
}

- (void)beginTrackingScene:(id)a3
{
  id v6 = a3;
  v4 = [v6 settings];
  BOOL v5 = [(UIApplicationSceneDeactivationManager *)self _isEligibleScene:v6 withSettings:v4];

  if (v5) {
    [(UIApplicationSceneDeactivationManager *)self _trackScene:v6];
  }
}

- (BOOL)_isEligibleScene:(id)a3 withSettings:(id)a4
{
  id v6 = a4;
  if ([(UIApplicationSceneDeactivationManager *)self _isEligibleScene:a3]) {
    BOOL v7 = [(UIApplicationSceneDeactivationManager *)self _areEligibleSettings:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)removeAssertion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneDeactivation", &removeAssertion____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Removed: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [(NSHashTable *)self->_assertions removeObject:v4];
  }
  [(UIApplicationSceneDeactivationManager *)self _updateScenesWithTransitionContext:0 reason:@"Assertion removed"];
}

- (void)addAssertion:(id)a3 withTransitionContext:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneDeactivation", &addAssertion_withTransitionContext____s_category)+ 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Added: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  if (v6) {
    [(NSHashTable *)self->_assertions addObject:v6];
  }
  [(UIApplicationSceneDeactivationManager *)self _updateScenesWithTransitionContext:v7 reason:@"Assertion added"];
}

- (void)_updateScenesWithTransitionContext:(id)a3 reason:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v15 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = self->_eligibleScenes;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v11 isValid])
        {
          v12 = [v11 uiSettings];
          unint64_t v13 = [(UIApplicationSceneDeactivationManager *)self _deactivationReasonsForScene:v11 withSettings:v12];
          if (v13 != [v12 deactivationReasons])
          {
            objc_storeStrong((id *)&self->_updatingScene, v11);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __83__UIApplicationSceneDeactivationManager__updateScenesWithTransitionContext_reason___block_invoke;
            v17[3] = &unk_1E52EF5D0;
            unint64_t v20 = v13;
            v17[4] = self;
            v17[5] = v11;
            id v18 = v15;
            id v19 = v16;
            [v11 updateUISettingsWithTransitionBlock:v17];
            updatingScene = self->_updatingScene;
            self->_updatingScene = 0;
          }
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)amendSceneSettings:(id)a3 forScene:(id)a4
{
  id v7 = a3;
  id v6 = (FBScene *)a4;
  if (self->_updatingScene != v6
    && [(UIApplicationSceneDeactivationManager *)self _isEligibleScene:v6])
  {
    if ([(UIApplicationSceneDeactivationManager *)self _areEligibleSettings:v7])
    {
      [(UIApplicationSceneDeactivationManager *)self _trackScene:v6];
      [(UIApplicationSceneDeactivationManager *)self _setDeactivationReasons:[(UIApplicationSceneDeactivationManager *)self _deactivationReasonsForScene:v6 withSettings:v7] onScene:v6 withSettings:v7 reason:@"scene settings update - settings are eligible for deactivation reasons"];
    }
    else
    {
      [(UIApplicationSceneDeactivationManager *)self _deactivationReasonsForScene:v6 withSettings:v7];
      [(UIApplicationSceneDeactivationManager *)self _setDeactivationReasons:0 onScene:v6 withSettings:v7 reason:@"scene settings update - settings are NOT eligible for deactivation reasons"];
      [(UIApplicationSceneDeactivationManager *)self _untrackScene:v6];
    }
  }
}

- (unint64_t)_deactivationReasonsForScene:(id)a3 withSettings:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_assertions;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = 1 << objc_msgSend(v14, "reason", (void)v19);
        if ((v11 & v15) == 0)
        {
          uint64_t v16 = [v14 predicate];
          v17 = (void *)v16;
          if (!v16 || (*(unsigned int (**)(uint64_t, id, id))(v16 + 16))(v16, v6, v7)) {
            v11 |= v15;
          }
        }
      }
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)_isEligibleScene:(id)a3
{
  id v3 = a3;
  id v4 = [v3 settings];
  if ([v4 isUISubclass])
  {
    BOOL v5 = [v3 definition];
    id v6 = [v5 clientIdentity];
    int v7 = [v6 isLocal] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_trackScene:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_eligibleScenes containsObject:v4] & 1) == 0)
  {
    BOOL v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneDeactivation", &_trackScene____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Now tracking: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [(NSMutableSet *)self->_eligibleScenes addObject:v4];
  }
}

- (void)_setDeactivationReasons:(unint64_t)a3 onScene:(id)a4 withSettings:(id)a5 reason:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 deactivationReasons] != a3)
  {
    [v11 setDeactivationReasons:a3];
    unint64_t v13 = *(id *)(__UILogGetCategoryCachedImpl("SceneDeactivation", &_setDeactivationReasons_onScene_withSettings_reason____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v10 identifier];
      if (a3)
      {
        int v6 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents(a3);
        uint64_t v15 = [v6 componentsJoinedByString:@", "];
      }
      else
      {
        uint64_t v15 = @"(none)";
      }
      int v16 = 138543874;
      id v17 = v14;
      __int16 v18 = 2114;
      long long v19 = v15;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting deactivation reasons to: '%{public}@' for reason: %{public}@.", (uint8_t *)&v16, 0x20u);
      if (a3)
      {
      }
    }
  }
}

- (BOOL)_areEligibleSettings:(id)a3
{
  return [a3 isForeground];
}

- (id)newAssertionWithReason:(int64_t)a3
{
  BOOL v5 = [UIApplicationSceneDeactivationAssertion alloc];
  return [(UIApplicationSceneDeactivationAssertion *)v5 initWithReason:a3 manager:self];
}

- (UIApplicationSceneDeactivationManager)init
{
  if (pthread_main_np() != 1)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[UIApplicationSceneDeactivationManager init]"];
    [v9 handleFailureInFunction:v10 file:@"UIApplicationSceneDeactivationManager.m" lineNumber:39 description:@"this call must be made on the main thread"];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIApplicationSceneDeactivationManager;
  id v3 = [(UIApplicationSceneDeactivationManager *)&v11 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    assertions = v3->_assertions;
    v3->_assertions = (NSHashTable *)v4;

    int v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    eligibleScenes = v3->_eligibleScenes;
    v3->_eligibleScenes = v6;
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)[(UIApplicationSceneDeactivationManager *)self descriptionWithMultilinePrefix:0];
}

- (id)eligibleScenes
{
  return (id)[(NSMutableSet *)self->_eligibleScenes allObjects];
}

- (id)assertions
{
  return [(NSHashTable *)self->_assertions allObjects];
}

- (void)_untrackScene:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_eligibleScenes containsObject:v4])
  {
    BOOL v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneDeactivation", &_untrackScene____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "No longer tracking: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [(NSMutableSet *)self->_eligibleScenes removeObject:v4];
  }
}

- (id)succinctDescription
{
  v2 = [(UIApplicationSceneDeactivationManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UIApplicationSceneDeactivationManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIApplicationSceneDeactivationManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__UIApplicationSceneDeactivationManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __79__UIApplicationSceneDeactivationManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) allObjects];
  [v2 appendArraySection:v3 withName:@"assertions" skipIfEmpty:0];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 16) allObjects];
  [v4 appendArraySection:v5 withName:@"eligibleScenes" skipIfEmpty:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatingScene, 0);
  objc_storeStrong((id *)&self->_eligibleScenes, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end