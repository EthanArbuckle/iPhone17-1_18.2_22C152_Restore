@interface SBWindowSceneStatusBarAssertionManager
- (BOOL)isFrontmostStatusBarHidden;
- (BOOL)isFrontmostStatusBarPartHidden:(int64_t)a3;
- (BOOL)statusBar:(id)a3 shouldRequestStyle:(int64_t)a4 animationParameters:(id)a5 forced:(BOOL)a6;
- (BOOL)statusBar:(id)a3 shouldRequestStyleAttributes:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6;
- (BOOL)statusBar:(id)a3 shouldSetAlpha:(double)a4;
- (NSString)description;
- (SBWindowSceneStatusBarAssertionManager)initWithWindowScene:(id)a3;
- (id)_descriptionForPropertyWithAssertions:(id)a3;
- (id)_styleRequestForSettings:(id)a3;
- (id)acquireDisableAlphaChangesAssertionWithReason:(id)a3;
- (id)acquireDisableUserInteractionChangesAssertionWithReason:(id)a3;
- (id)acquireHideFrontmostStatusBarAssertionForReason:(id)a3;
- (id)currentEffectiveStatusBarStyleRequest;
- (id)currentStatusBarSettings;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)effectiveStatusBarStyleRequestForLevel:(unint64_t)a3;
- (id)effectiveStatusBarStyleRequestWithSettings:(id)a3;
- (id)newSettingsAssertionWithSettings:(id)a3 atLevel:(unint64_t)a4 reason:(id)a5;
- (id)newSettingsAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4 reason:(id)a5;
- (id)statusBar:(id)a3 effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:(id)a4;
- (id)statusBarSettingsForLevel:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)effectiveStatusBarStyleForRequestedStyle:(int64_t)a3 styleOverridesToSuppress:(unint64_t)a4;
- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (void)_addDisableWindowSceneStatusBarAlphaChangesAssertion:(id)a3;
- (void)_addDisableWindowSceneStatusBarUserInteractionChangesAssertion:(id)a3;
- (void)_addStatusBarSettingsAssertion:(id)a3;
- (void)_addStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4;
- (void)_cleanUpAllStatusBarSettingsAssertions;
- (void)_enumerateAssertionsToLevel:(unint64_t)a3 withBlock:(id)a4;
- (void)_evaluateSettingsWithStyleAnimations:(id)a3;
- (void)_modifiedStatusBarSettingsAssertion:(id)a3;
- (void)_modifiedStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4;
- (void)_removeDisableWindowSceneStatusBarAlphaChangesAssertion:(id)a3;
- (void)_removeDisableWindowSceneStatusBarUserInteractionChangesAssertion:(id)a3;
- (void)_removeStatusBarSettingsAssertion:(id)a3;
- (void)_removeStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4;
- (void)_resolveEffectiveStatusBarStyleForSettings:(id)a3;
- (void)_setStatusBarValueForPropertyWithAssertions:(id)a3 setter:(id)a4;
- (void)_statusBarUpdatedFromSettings:(id)a3 toSettings:(id)a4 withAnimations:(id)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation SBWindowSceneStatusBarAssertionManager

- (id)statusBar:(id)a3 effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:(id)a4
{
  v5 = objc_msgSend(a4, "mutableCopy", a3);
  v6 = [(SBStatusBarSettings *)self->_currentStatusBarSettings backgroundActivitiesToSuppress];
  [v5 minusSet:v6];

  return v5;
}

- (id)currentStatusBarSettings
{
  return self->_currentStatusBarSettings;
}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_4(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 168);
  v1 = *(void **)(a1 + 40);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 136) alpha];
  [v3 floatValue];
  [v1 setAlpha:v2];
}

- (void)_statusBarUpdatedFromSettings:(id)a3 toSettings:(id)a4 withAnimations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v38 = [NSString stringWithUTF8String:"-[SBWindowSceneStatusBarAssertionManager _statusBarUpdatedFromSettings:toSettings:withAnimations:]"];
    [v37 handleFailureInFunction:v38 file:@"SBWindowSceneStatusBarAssertionManager.m" lineNumber:345 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v12 = [WeakRetained statusBarManager];
  v13 = [v12 statusBar];

  v41 = [(SBWindowSceneStatusBarAssertionManager *)self _styleRequestForSettings:v9];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke;
  v49[3] = &unk_1E6B0B070;
  v49[4] = self;
  id v14 = v13;
  id v50 = v14;
  v42 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v49);
  if (!v10)
  {
    if (![MEMORY[0x1E4F42FF0] _isInAnimationBlock])
    {
      id v10 = 0;
      if (v8) {
        goto LABEL_7;
      }
LABEL_12:
      [v14 alpha];
      char v39 = 1;
      int v40 = 1;
      goto LABEL_13;
    }
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F42E48]) initWithEmptyParameters];
    v15 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
    [v15 duration];
    objc_msgSend(v10, "setDuration:");
    [v15 delay];
    objc_msgSend(v10, "setDelay:");
    [v10 setCurve:3];
    [v10 setStyleAnimation:1];
  }
  if (!v8) {
    goto LABEL_12;
  }
LABEL_7:
  v16 = [v8 alpha];
  [v16 floatValue];
  v17 = [v9 alpha];
  [v17 floatValue];
  int v40 = BSFloatEqualToFloat() ^ 1;

  uint64_t v18 = [v8 style];
  uint64_t v19 = [v9 style];
  v20 = [v8 backgroundActivitiesToSuppress];
  v21 = [v9 backgroundActivitiesToSuppress];
  char v22 = BSEqualSets();

  if (v18 == v19)
  {
    v23 = [v8 legibilitySettings];
    v24 = [v9 legibilitySettings];
    char v25 = [v23 isEqual:v24];

    char v26 = v25 & v22 ^ 1;
  }
  else
  {
    char v26 = 1;
  }
  char v39 = v26;
  v27 = [v8 alpha];
  [v27 floatValue];

LABEL_13:
  if (BSFloatGreaterThanFloat())
  {
    v28 = [v9 alpha];
    [v28 floatValue];
    unsigned __int8 IsZero = BSFloatIsZero();
  }
  else
  {
    unsigned __int8 IsZero = 0;
  }
  if (BSFloatIsZero())
  {
    v30 = [v9 alpha];
    [v30 floatValue];
    int v31 = BSFloatGreaterThanFloat();
  }
  else
  {
    int v31 = 0;
  }
  if (BSFloatGreaterThanFloat())
  {
    v32 = [v9 alpha];
    [v32 floatValue];
    int v33 = BSFloatGreaterThanFloat();
  }
  else
  {
    int v33 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v31)
  {
    v34 = [v14 statusBar];
    [v34 reinitializeStatusBar];
  }
  if (((v31 ^ 1) & (v39 ^ 1 | IsZero) & 1) == 0)
  {
    if (v33) {
      id v35 = v10;
    }
    else {
      id v35 = 0;
    }
    ((void (**)(void, id, void *))v42)[2](v42, v35, v41);
  }
  if (v40)
  {
    disableAlphaChangeAssertions = self->_disableAlphaChangeAssertions;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_3;
    v43[3] = &unk_1E6AF7268;
    char v48 = v31;
    id v44 = v14;
    v45 = self;
    id v46 = v10;
    v47 = v42;
    [(SBWindowSceneStatusBarAssertionManager *)self _setStatusBarValueForPropertyWithAssertions:disableAlphaChangeAssertions setter:v43];
  }
}

- (BOOL)statusBar:(id)a3 shouldSetAlpha:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F29060];
  id v7 = a3;
  if (([v6 isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = [NSString stringWithUTF8String:"-[SBWindowSceneStatusBarAssertionManager statusBar:shouldSetAlpha:]"];
    [v13 handleFailureInFunction:v14 file:@"SBWindowSceneStatusBarAssertionManager.m" lineNumber:184 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v9 = [WeakRetained statusBarManager];
  id v10 = [v9 statusBar];

  if (v10 != v7 || self->_changingStatusBarAlpha) {
    return 1;
  }
  v12 = SBLogStatusBarish();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v15 = 134217984;
    double v16 = a4;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "Status bar alpha changed outside of SBWindowSceneStatusBarSettingsAssertion. Rejecting change to set alpha to: %f", (uint8_t *)&v15, 0xCu);
  }

  return self->_changingStatusBarAlpha;
}

- (BOOL)statusBar:(id)a3 shouldRequestStyle:(int64_t)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  id v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = a3;
  if (([v7 isMainThread] & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    int v15 = [NSString stringWithUTF8String:"-[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyle:animationParameters:forced:]"];
    [v14 handleFailureInFunction:v15 file:@"SBWindowSceneStatusBarAssertionManager.m" lineNumber:212 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v10 = [WeakRetained statusBarManager];
  id v11 = [v10 statusBar];

  if (v11 == v8 && !self->_changingStatusBarStyle)
  {
    v12 = SBLogStatusBarish();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyleAttributes:animationParameters:forced:](v12);
    }
  }
  return 1;
}

- (id)_styleRequestForSettings:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FA9970];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = _SBStatusBarStyleFromLegacyStyle([v4 style]);
  id v7 = [v4 legibilitySettings];

  id v8 = [v7 primaryColor];
  id v9 = (void *)[v5 initWithResolvedStyle:v6 foregroundColor:v8];

  return v9;
}

- (void)_setStatusBarValueForPropertyWithAssertions:(id)a3 setter:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    id v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(SBWindowSceneStatusBarAssertionManager *)self _descriptionForPropertyWithAssertions:v6];
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Suppressing status bar %{public}@ change due to outstanding disablement assertions: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) forgetEitherSideHistory];
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 161) = 1;
  float v2 = (void *)MEMORY[0x1E4F42E48];
  uint64_t v3 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_4;
  v8[3] = &unk_1E6AF5290;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v9 = vextq_s8(v5, v5, 8uLL);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_5;
  v6[3] = &unk_1E6AF5AA0;
  v6[4] = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  [v2 animateWithParameters:v3 fromCurrentState:1 animations:v8 completion:v6];
  *(unsigned char *)(*(void *)(a1 + 40) + 161) = 0;
}

uint64_t __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStyleRequest:*(void *)(a1 + 40)];
}

void __68__SBWindowSceneStatusBarAssertionManager_statusBarSettingsForLevel___block_invoke(uint64_t a1, void *a2)
{
  float v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 settings];
  [v2 applySettings:v3];
}

- (void)_addStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = &self->super.isa + [v6 level];
  Class v10 = v8[4];
  int8x16_t v9 = (id *)(v8 + 4);
  id v11 = v10;
  if (!v11)
  {
    id v11 = (objc_class *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:514];
    objc_storeStrong(v9, v11);
  }
  __int16 v12 = SBLogStatusBarish();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v6;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "adding status bar settings assertion: %{public}@", buf, 0xCu);
  }

  [(objc_class *)v11 addPointer:v6];
  uint64_t v19 = v7;
  [(SBWindowSceneStatusBarAssertionManager *)self _evaluateSettingsWithStyleAnimations:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v20 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector()) {
          [v18 statusBarAssertionManager:self addStatusBarSettingsAssertion:v6];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)_evaluateSettingsWithStyleAnimations:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v6 = [WeakRetained statusBarManager];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__97;
  int v33 = __Block_byref_object_dispose__97;
  v34 = objc_alloc_init(SBMutableStatusBarSettings);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__SBWindowSceneStatusBarAssertionManager__evaluateSettingsWithStyleAnimations___block_invoke;
  v28[3] = &unk_1E6B0B048;
  v28[4] = &v29;
  [(SBWindowSceneStatusBarAssertionManager *)self _enumerateAssertionsToLevel:12 withBlock:v28];
  id v7 = SBLogStatusBarish();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [(id)v30[5] alpha];
    [v15 floatValue];
    float v17 = v16;
    uint64_t v18 = [(SBStatusBarSettings *)self->_currentStatusBarSettings alpha];
    [v18 floatValue];
    float v20 = v19;
    long long v21 = [v6 statusBar];
    [v21 alpha];
    *(_DWORD *)buf = 134349568;
    double v37 = v17;
    __int16 v38 = 2050;
    double v39 = v20;
    __int16 v40 = 2050;
    uint64_t v41 = v22;
    _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "Evaluate status bar settings. new: %{public}.2f, current: %{public}.2f, actual: %{public}.2f", buf, 0x20u);
  }
  id v8 = self->_currentStatusBarSettings;
  if (![(SBStatusBarSettings *)self->_currentStatusBarSettings isEqual:v30[5]])
  {
    objc_storeStrong((id *)&self->_currentStatusBarSettings, (id)v30[5]);
    [(SBWindowSceneStatusBarAssertionManager *)self _statusBarUpdatedFromSettings:v8 toSettings:v30[5] withAnimations:v4];
    id v23 = v4;
    int8x16_t v9 = v6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    Class v10 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            [v14 statusBarAssertionManager:self statusBarSettingsDidChange:self->_currentStatusBarSettings];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v35 count:16];
      }
      while (v11);
    }

    id v6 = v9;
    id v4 = v23;
  }

  _Block_object_dispose(&v29, 8);
}

- (void)_enumerateAssertionsToLevel:(unint64_t)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void))a4;
  if (a3 >= 0xD)
  {
    float v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBWindowSceneStatusBarAssertionManager.m", 318, @"Invalid parameter not satisfying: %@", @"level < SBWindowSceneStatusBarSettingsLevelNumberOfLevels" object file lineNumber description];
  }
  unint64_t v8 = 0;
  statusBarSettingsAssertionsByLevel = self->_statusBarSettingsAssertionsByLevel;
  do
  {
    Class v10 = statusBarSettingsAssertionsByLevel[v8];
    uint64_t v11 = v10;
    if (v10)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v12 = [(NSPointerArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            v7[2](v7, *(void *)(*((void *)&v17 + 1) + 8 * v15++));
          }
          while (v13 != v15);
          uint64_t v13 = [(NSPointerArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }

    ++v8;
  }
  while (v8 <= a3);
}

void __79__SBWindowSceneStatusBarAssertionManager__evaluateSettingsWithStyleAnimations___block_invoke(uint64_t a1, void *a2)
{
  float v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 settings];
  [v2 applySettings:v3];
}

- (void)_modifiedStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4
{
}

- (id)newSettingsAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4 reason:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [[SBWindowSceneStatusBarSettingsAssertion alloc] _initWithWindowSceneStatusBarAssertionManager:self statusBarHidden:v6 atLevel:a4 reason:v8];

  return v9;
}

- (id)effectiveStatusBarStyleRequestForLevel:(unint64_t)a3
{
  id v4 = [(SBWindowSceneStatusBarAssertionManager *)self statusBarSettingsForLevel:a3];
  int8x16_t v5 = [(SBWindowSceneStatusBarAssertionManager *)self _styleRequestForSettings:v4];

  return v5;
}

- (id)statusBarSettingsForLevel:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__97;
  uint64_t v12 = __Block_byref_object_dispose__97;
  uint64_t v13 = objc_alloc_init(SBMutableStatusBarSettings);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SBWindowSceneStatusBarAssertionManager_statusBarSettingsForLevel___block_invoke;
  v7[3] = &unk_1E6B0B048;
  v7[4] = &v8;
  [(SBWindowSceneStatusBarAssertionManager *)self _enumerateAssertionsToLevel:a3 withBlock:v7];
  [(SBWindowSceneStatusBarAssertionManager *)self _resolveEffectiveStatusBarStyleForSettings:v9[5]];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_resolveEffectiveStatusBarStyleForSettings:(id)a3
{
  id v8 = a3;
  if ([v8 style] == -1) {
    uint64_t v4 = SBDefaultStatusBarStyle();
  }
  else {
    uint64_t v4 = [v8 style];
  }
  uint64_t v5 = v4;
  BOOL v6 = [v8 backgroundActivitiesToSuppress];
  int64_t v7 = [(SBWindowSceneStatusBarAssertionManager *)self effectiveStatusBarStyleForRequestedStyle:v5 styleOverridesToSuppress:STUIStyleOverridesForBackgroundActivityIdentifiers()];

  [v8 setStyle:v7];
}

- (int64_t)effectiveStatusBarStyleForRequestedStyle:(int64_t)a3 styleOverridesToSuppress:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int64_t v7 = [WeakRetained statusBarManager];
  id v8 = [v7 statusBar];
  uint64_t v9 = [v8 styleOverrides];

  uint64_t v10 = (void *)MEMORY[0x1E4F42E28];
  return [v10 defaultStyleForRequestedStyle:a3 styleOverrides:v9 & ~a4];
}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_5(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 168);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 136) alpha];
  [v4 floatValue];
  if (BSFloatIsZero())
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 168);

    if (v2) {
      return;
    }
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) _styleRequestForSettings:*(void *)(*(void *)(a1 + 32) + 136)];
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 160) = 1;
  if (a2)
  {
    [*(id *)(a1 + 40) setStyleRequest:v5 animationParameters:a2];
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x1E4F42FF0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __98__SBWindowSceneStatusBarAssertionManager__statusBarUpdatedFromSettings_toSettings_withAnimations___block_invoke_2;
    v7[3] = &unk_1E6AF5290;
    id v8 = *(id *)(a1 + 40);
    id v9 = v5;
    [v6 performWithoutAnimation:v7];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 160) = 0;
}

- (SBWindowSceneStatusBarAssertionManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBWindowSceneStatusBarAssertionManager;
  id v5 = [(SBWindowSceneStatusBarAssertionManager *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    disableAlphaChangeAssertions = v5->_disableAlphaChangeAssertions;
    v5->_disableAlphaChangeAssertions = (NSHashTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    disableUserInteractionChangeAssertions = v5->_disableUserInteractionChangeAssertions;
    v5->_disableUserInteractionChangeAssertions = (NSHashTable *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
    hideStatusBarAssertions = v5->_hideStatusBarAssertions;
    v5->_hideStatusBarAssertions = (NSHashTable *)v10;

    objc_storeWeak((id *)&v5->_windowScene, v4);
    objc_initWeak(&location, v5);
    id v12 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v16, &location);
    uint64_t v13 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v5->_stateCaptureAssertion;
    v5->_stateCaptureAssertion = (BSInvalidatable *)v13;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v5;
}

id __62__SBWindowSceneStatusBarAssertionManager_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(SBWindowSceneStatusBarAssertionManager *)self _cleanUpAllStatusBarSettingsAssertions];
  v3.receiver = self;
  v3.super_class = (Class)SBWindowSceneStatusBarAssertionManager;
  [(SBWindowSceneStatusBarAssertionManager *)&v3 dealloc];
}

- (id)effectiveStatusBarStyleRequestWithSettings:(id)a3
{
  currentStatusBarSettings = self->_currentStatusBarSettings;
  id v5 = a3;
  uint64_t v6 = (void *)[(SBStatusBarSettings *)currentStatusBarSettings mutableCopy];
  [v6 applySettings:v5];

  [(SBWindowSceneStatusBarAssertionManager *)self _resolveEffectiveStatusBarStyleForSettings:v6];
  int64_t v7 = [(SBWindowSceneStatusBarAssertionManager *)self _styleRequestForSettings:v6];

  return v7;
}

- (id)currentEffectiveStatusBarStyleRequest
{
  return [(SBWindowSceneStatusBarAssertionManager *)self _styleRequestForSettings:self->_currentStatusBarSettings];
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  uint64_t v6 = [(SBStatusBarSettings *)self->_currentStatusBarSettings backgroundActivitiesToSuppress];
  unint64_t v7 = a5 & ~STUIStyleOverridesForBackgroundActivityIdentifiers();

  return v7;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      unint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (NSString)description
{
  return (NSString *)[(SBWindowSceneStatusBarAssertionManager *)self descriptionWithMultilinePrefix:0];
}

- (id)acquireDisableAlphaChangesAssertionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [[SBDisableWindowSceneStatusBarAlphaChangesAssertion alloc] _initWithWindowSceneStatusBarAssertionManager:self reason:v4];

  return v5;
}

- (id)acquireDisableUserInteractionChangesAssertionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [[SBDisableWindowSceneStatusBarUserInteractionChangesAssertion alloc] _initWithWindowSceneStatusBarAssertionManager:self reason:v4];

  return v5;
}

- (id)newSettingsAssertionWithSettings:(id)a3 atLevel:(unint64_t)a4 reason:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[SBWindowSceneStatusBarSettingsAssertion alloc] _initWithWindowSceneStatusBarAssertionManager:self settings:v9 atLevel:a4 reason:v8];

  return v10;
}

- (BOOL)statusBar:(id)a3 shouldRequestStyleAttributes:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  unint64_t v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = a3;
  if (([v7 isMainThread] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyleAttributes:animationParameters:forced:]"];
    [v14 handleFailureInFunction:v15 file:@"SBWindowSceneStatusBarAssertionManager.m" lineNumber:198 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v10 = [WeakRetained statusBarManager];
  id v11 = [v10 statusBar];

  if (v11 == v8 && !self->_changingStatusBarStyle)
  {
    id v12 = SBLogStatusBarish();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBWindowSceneStatusBarAssertionManager statusBar:shouldRequestStyleAttributes:animationParameters:forced:](v12);
    }
  }
  return 1;
}

- (void)_addDisableWindowSceneStatusBarAlphaChangesAssertion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = SBLogStatusBarish();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Adding status bar disable alpha change assertion: %@", (uint8_t *)&v6, 0xCu);
    }

    [(NSHashTable *)self->_disableAlphaChangeAssertions addObject:v4];
  }
}

- (void)_removeDisableWindowSceneStatusBarAlphaChangesAssertion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = SBLogStatusBarish();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Removing status bar disable alpha change assertion: %@", (uint8_t *)&v6, 0xCu);
    }

    [(NSHashTable *)self->_disableAlphaChangeAssertions removeObject:v4];
    if (![(NSHashTable *)self->_disableAlphaChangeAssertions count]) {
      [(SBWindowSceneStatusBarAssertionManager *)self _statusBarUpdatedFromSettings:0 toSettings:self->_currentStatusBarSettings withAnimations:0];
    }
  }
}

- (void)_addDisableWindowSceneStatusBarUserInteractionChangesAssertion:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_disableUserInteractionChangeAssertions, "addObject:");
  }
}

- (void)_removeDisableWindowSceneStatusBarUserInteractionChangesAssertion:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_disableUserInteractionChangeAssertions, "removeObject:");
  }
}

- (void)_addStatusBarSettingsAssertion:(id)a3
{
}

- (void)_removeStatusBarSettingsAssertion:(id)a3
{
}

- (void)_removeStatusBarSettingsAssertion:(id)a3 withAnimationParameters:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 level];
  statusBarSettingsAssertionsByLevel = self->_statusBarSettingsAssertionsByLevel;
  id v10 = self->_statusBarSettingsAssertionsByLevel[v8];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [(NSPointerArray *)v10 count];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      while ([(NSPointerArray *)v11 pointerAtIndex:v14] != v6)
      {
        if (v13 == ++v14) {
          goto LABEL_13;
        }
      }
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = SBLogStatusBarish();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [MEMORY[0x1E4F1C9C8] date];
          long long v17 = [v6 timestamp];
          [v16 timeIntervalSinceDate:v17];
          *(_DWORD *)buf = 134218242;
          uint64_t v33 = v18;
          __int16 v34 = 2114;
          id v35 = v6;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "removing status bar settings assertion after %f seconds: %{public}@", buf, 0x16u);
        }
        [(NSPointerArray *)v11 removePointerAtIndex:v14];
        if (![(NSPointerArray *)v11 count])
        {
          long long v19 = statusBarSettingsAssertionsByLevel[v8];
          statusBarSettingsAssertionsByLevel[v8] = 0;
        }
        [(SBWindowSceneStatusBarAssertionManager *)self _evaluateSettingsWithStyleAnimations:v7];
      }
    }
  }
LABEL_13:
  long long v26 = v7;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v20 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v25 statusBarAssertionManager:self removeStatusBarSettingsAssertion:v6];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }
}

- (void)_modifiedStatusBarSettingsAssertion:(id)a3
{
}

- (void)_cleanUpAllStatusBarSettingsAssertions
{
  uint64_t v2 = 0;
  statusBarSettingsAssertionsByLevel = self->_statusBarSettingsAssertionsByLevel;
  do
  {
    id v4 = statusBarSettingsAssertionsByLevel[v2];
    statusBarSettingsAssertionsByLevel[v2] = 0;

    ++v2;
  }
  while (v2 != 13);
}

- (id)_descriptionForPropertyWithAssertions:(id)a3
{
  if (self->_disableAlphaChangeAssertions == a3) {
    return @"alpha";
  }
  if (self->_disableUserInteractionChangeAssertions == a3) {
    return @"user interaction";
  }
  return 0;
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBWindowSceneStatusBarAssertionManager *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBWindowSceneStatusBarAssertionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWindowSceneStatusBarAssertionManager *)self succinctDescriptionBuilder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E6AF4E00;
  id v7 = v5;
  id v12 = v7;
  id v13 = WeakRetained;
  uint64_t v14 = self;
  id v8 = WeakRetained;
  [v7 appendBodySectionWithName:0 multilinePrefix:v4 block:v11];

  id v9 = v7;
  return v9;
}

void __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 40) _sceneIdentifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"windowScene identifier"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) statusBarManager];
  id v7 = [v6 statusBar];
  [v7 alpha];
  id v8 = (id)objc_msgSend(v5, "appendFloat:withName:", @"statusBarAlpha");

  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 48) + 136) withName:@"currentSettings"];
  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(*(void *)(a1 + 48) + 8) allObjects];
  [v10 appendArraySection:v11 withName:@"disableAlphaChangeAssertions" skipIfEmpty:1];

  id v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(*(void *)(a1 + 48) + 16) allObjects];
  [v12 appendArraySection:v13 withName:@"disableUserInteractionChangeAssertions" skipIfEmpty:1];

  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = [v14 activeMultilinePrefix];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  uint64_t v21 = &unk_1E6AF5290;
  uint64_t v22 = *(void *)(a1 + 48);
  id v23 = *(id *)(a1 + 32);
  [v14 appendBodySectionWithName:@"statusBarSettingsByAssertionLevel" multilinePrefix:v15 block:&v18];

  id v16 = *(void **)(a1 + 32);
  long long v17 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "allObjects", v18, v19, v20, v21, v22);
  [v16 appendArraySection:v17 withName:@"Hiding Frontmost Status Bar Assertions" skipIfEmpty:1];
}

void __80__SBWindowSceneStatusBarAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  for (unint64_t i = 0; i != 13; ++i)
  {
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 8 * i + 32);
    if (v3)
    {
      id v4 = *(void **)(a1 + 40);
      id v5 = v3;
      id v6 = [v5 allObjects];
      id v7 = NSString;
      id v8 = [NSNumber numberWithUnsignedInteger:i];
      id v9 = [v8 description];
      id v10 = SBWindowSceneStatusBarSettingsLevelDescription(i);
      id v11 = [v7 stringWithFormat:@"%@ - (%@)", v9, v10];
      id v12 = [*(id *)(a1 + 40) activeMultilinePrefix];
      [v4 appendArraySection:v6 withName:v11 multilinePrefix:v12 skipIfEmpty:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_currentStatusBarSettings, 0);
  for (uint64_t i = 128; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertions, 0);
  objc_storeStrong((id *)&self->_disableUserInteractionChangeAssertions, 0);
  objc_storeStrong((id *)&self->_disableAlphaChangeAssertions, 0);
}

- (BOOL)isFrontmostStatusBarHidden
{
  return [(SBWindowSceneStatusBarAssertionManager *)self isFrontmostStatusBarPartHidden:0xFFFFLL];
}

- (BOOL)isFrontmostStatusBarPartHidden:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v6 = [WeakRetained statusBarManager];
  if (![v6 isStatusBarEffectivelyHidden]) {
    goto LABEL_40;
  }
  id v7 = [WeakRetained lockScreenManager];
  if (![v7 isUILocked]
    || ([(SBWindowSceneStatusBarAssertionManager *)self currentStatusBarSettings],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 alpha],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqual:&unk_1F334B228],
        v9,
        v8,
        !v10))
  {
    id v12 = [WeakRetained transientOverlayPresenter];
    if ([v12 hasActivePresentation])
    {
      int v11 = [v12 hasVisibleStatusBar] ^ 1;

      goto LABEL_41;
    }
    id v13 = [WeakRetained switcherController];
    uint64_t v14 = [v13 layoutStatePrimaryElement];
    uint64_t v15 = [v14 workspaceEntity];
    id v16 = [v15 applicationSceneEntity];
    long long v17 = [v16 sceneHandle];

    uint64_t v18 = [v13 layoutStateSideElement];
    uint64_t v19 = [v18 workspaceEntity];
    long long v20 = [v19 applicationSceneEntity];
    v32 = [v20 sceneHandle];

    if (!v17)
    {
      LOBYTE(v11) = 1;
      goto LABEL_39;
    }
    uint64_t v21 = [v17 application];
    if ([v21 isClassic]
      && !objc_msgSend(v21, "includesStatusBarInClassicJailForInterfaceOrientation:", objc_msgSend(v17, "activationInterfaceOrientationForCurrentOrientation")))
    {
      LOBYTE(v11) = 0;
LABEL_38:

LABEL_39:
      if (v17) {
        goto LABEL_41;
      }
LABEL_40:
      LOBYTE(v11) = [v6 isStatusBarEffectivelyHidden];
      goto LABEL_41;
    }
    uint64_t v22 = [WeakRetained switcherController];
    if ([v22 isInAppStatusBarHidden])
    {
      LOBYTE(v11) = 1;
LABEL_37:

      goto LABEL_38;
    }
    if (a3 <= 3)
    {
      if (a3 != 1)
      {
        if (a3 != 2) {
          goto LABEL_36;
        }
        if ([v22 windowManagementStyle] == 1 && v32)
        {
          id v23 = v32;
          goto LABEL_23;
        }
      }
LABEL_22:
      id v23 = v17;
LABEL_23:
      long long v24 = [v23 sceneIfExists];
      if (v24)
      {
LABEL_24:
        long long v25 = objc_msgSend(v24, "uiClientSettings", v24);
        if ([v25 statusBarHidden])
        {
          LOBYTE(v11) = 1;
        }
        else
        {
          [v25 statusBarAlpha];
          LOBYTE(v11) = BSFloatIsZero();
        }

        goto LABEL_37;
      }
LABEL_36:
      LOBYTE(v11) = [v22 unlockedEnvironmentMode] == 2;
      goto LABEL_37;
    }
    if (a3 != 4)
    {
      if (a3 != 0xFFFF) {
        goto LABEL_36;
      }
      goto LABEL_22;
    }
    long long v26 = [v22 layoutState];
    long long v27 = [v26 appLayout];

    unint64_t v28 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration([v27 configuration]);
    if (v28 >= 2)
    {
      if (v28 == 2)
      {
        long long v29 = v32;
        goto LABEL_33;
      }
      if (v28 != 4)
      {
        long long v24 = 0;
LABEL_35:

        if (v24) {
          goto LABEL_24;
        }
        goto LABEL_36;
      }
    }
    long long v29 = v17;
LABEL_33:
    long long v24 = [v29 sceneIfExists];
    goto LABEL_35;
  }

  LOBYTE(v11) = 1;
LABEL_41:

  return v11;
}

- (id)acquireHideFrontmostStatusBarAssertionForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWindowSceneStatusBarAssertionManager *)self newSettingsAssertionWithStatusBarHidden:1 atLevel:7 reason:v4];
  [v5 acquire];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v7 = [WeakRetained switcherController];
  id v8 = [v7 requestInAppStatusBarHiddenAssertionForReason:v4 animated:0];

  id v9 = [WeakRetained transientOverlayPresenter];
  int v10 = (void *)[v9 newContentStatusBarHiddenAssertionWithReason:@"com.springboard.SBStatusBarManager.hideStatusBarAssertion"];
  id v11 = objc_alloc(MEMORY[0x1E4F4F838]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__SBWindowSceneStatusBarAssertionManager_FrontmostStatusBarVisibility__acquireHideFrontmostStatusBarAssertionForReason___block_invoke;
  v17[3] = &unk_1E6B05B60;
  id v18 = v5;
  id v19 = v8;
  id v20 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v5;
  uint64_t v15 = (void *)[v11 initWithIdentifier:@"com.springboard.SBStatusBarManager.hideStatusBarAssertion" forReason:v4 queue:MEMORY[0x1E4F14428] invalidationBlock:v17];

  [(NSHashTable *)self->_hideStatusBarAssertions addObject:v15];
  return v15;
}

uint64_t __120__SBWindowSceneStatusBarAssertionManager_FrontmostStatusBarVisibility__acquireHideFrontmostStatusBarAssertionForReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) invalidate];
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 invalidate];
}

- (void)statusBar:(os_log_t)log shouldRequestStyleAttributes:animationParameters:forced:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Style change requested outside of SBWindowSceneStatusBarSettingsAssertion", v1, 2u);
}

@end