@interface SBUIContinuityAccessorySceneManager
+ (id)sharedInstance;
- (id)_init;
- (id)registerAccessoryScene:(id)a3;
- (id)registerPrimaryScene:(id)a3;
- (void)_configureCommonInitialSettingsForScene:(id)a3;
- (void)_primarySceneDidUpdateSettings:(id)a3 transitionContext:(id)a4;
- (void)_updateAccessoryScene:(id)a3 followingPrimaryScene:(id)a4 transitionContext:(id)a5;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation SBUIContinuityAccessorySceneManager

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_3_0);
  }
  v2 = (void *)sharedInstance___sharedInstance_1;
  return v2;
}

uint64_t __53__SBUIContinuityAccessorySceneManager_sharedInstance__block_invoke()
{
  id v0 = [[SBUIContinuityAccessorySceneManager alloc] _init];
  uint64_t v1 = sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)SBUIContinuityAccessorySceneManager;
  v2 = [(SBUIContinuityAccessorySceneManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_accessoryScenes = v3->_lock_accessoryScenes;
    v3->_lock_accessoryScenes = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_primaryScenes = v3->_lock_primaryScenes;
    v3->_lock_primaryScenes = v6;
  }
  return v3;
}

- (id)registerAccessoryScene:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  v6 = [v4 identityToken];
  v7 = [v6 stringRepresentation];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__SBUIContinuityAccessorySceneManager_registerAccessoryScene___block_invoke;
  v18[3] = &unk_1E5CCD510;
  v18[4] = self;
  id v8 = v4;
  id v19 = v8;
  objc_super v9 = (void *)[v5 initWithIdentifier:v7 forReason:@"accessory scene registration" invalidationBlock:v18];

  os_unfair_lock_lock(&self->_lock);
  v10 = [v8 settings];
  v11 = [v10 displayIdentity];

  lock_primaryScenes = self->_lock_primaryScenes;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__SBUIContinuityAccessorySceneManager_registerAccessoryScene___block_invoke_2;
  v16[3] = &unk_1E5CCD538;
  id v13 = v11;
  id v17 = v13;
  v14 = [(NSMutableArray *)lock_primaryScenes bs_firstObjectPassingTest:v16];
  [(NSMutableArray *)self->_lock_accessoryScenes addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  [(SBUIContinuityAccessorySceneManager *)self _configureCommonInitialSettingsForScene:v8];
  if (v14) {
    [(SBUIContinuityAccessorySceneManager *)self _updateAccessoryScene:v8 followingPrimaryScene:v14 transitionContext:0];
  }

  return v9;
}

void __62__SBUIContinuityAccessorySceneManager_registerAccessoryScene___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v2);
}

uint64_t __62__SBUIContinuityAccessorySceneManager_registerAccessoryScene___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 settings];
  id v4 = [v3 displayIdentity];
  uint64_t v5 = [v2 isEqual:v4];

  return v5;
}

- (id)registerPrimaryScene:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  v6 = [v4 identityToken];
  v7 = [v6 stringRepresentation];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __60__SBUIContinuityAccessorySceneManager_registerPrimaryScene___block_invoke;
  v14 = &unk_1E5CCD510;
  v15 = self;
  id v16 = v4;
  id v8 = v4;
  objc_super v9 = (void *)[v5 initWithIdentifier:v7 forReason:@"primary scene registration" invalidationBlock:&v11];

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_lock_primaryScenes, "addObject:", v8, v11, v12, v13, v14, v15);
  os_unfair_lock_unlock(&self->_lock);
  [v8 addObserver:self];
  [(SBUIContinuityAccessorySceneManager *)self _configureCommonInitialSettingsForScene:v8];
  [(SBUIContinuityAccessorySceneManager *)self _primarySceneDidUpdateSettings:v8 transitionContext:0];

  return v9;
}

uint64_t __60__SBUIContinuityAccessorySceneManager_registerPrimaryScene___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return [v2 removeObserver:v3];
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = [a4 transitionContext];
  [(SBUIContinuityAccessorySceneManager *)self _primarySceneDidUpdateSettings:v6 transitionContext:v7];
}

- (void)_primarySceneDidUpdateSettings:(id)a3 transitionContext:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = self;
  objc_super v9 = (void *)[(NSMutableArray *)self->_lock_accessoryScenes copy];
  os_unfair_lock_unlock(p_lock);
  v21 = v6;
  v10 = [v6 settings];
  uint64_t v11 = [v10 displayIdentity];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v18 = [v17 settings];
        id v19 = [v18 displayIdentity];
        int v20 = [v11 isEqual:v19];

        if (v20) {
          [(SBUIContinuityAccessorySceneManager *)v8 _updateAccessoryScene:v17 followingPrimaryScene:v21 transitionContext:v22];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
}

- (void)_configureCommonInitialSettingsForScene:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__SBUIContinuityAccessorySceneManager__configureCommonInitialSettingsForScene___block_invoke;
  v5[3] = &unk_1E5CCD560;
  id v6 = v3;
  id v4 = v3;
  [v4 updateSettings:v5];
}

void __79__SBUIContinuityAccessorySceneManager__configureCommonInitialSettingsForScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetOfEventDeferringEnvironments:0];
  [v3 setInterfaceOrientationMode:100];
  [v3 setInterfaceOrientation:1];
  [v3 setEnhancedWindowingEnabled:1];
  _SBUIApplyDisplayEdgeInfo(v3);
  id v8 = [v3 displayConfiguration];

  id v4 = [*(id *)(a1 + 32) _keyboardHostComponent];
  id v5 = [v8 hardwareIdentifier];
  [v4 setHardwareKeyboardExclusivityIdentifier:v5];

  id v6 = [*(id *)(a1 + 32) systemShellHostingEnvironment];
  id v7 = SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration(v8);
  [v6 setSystemShellHostingSpaceIdentifier:v7];
}

- (void)_updateAccessoryScene:(id)a3 followingPrimaryScene:(id)a4 transitionContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 uiSettings];
  uint64_t v11 = [v10 userInterfaceStyle];

  id v12 = [v9 renderingEnvironment];
  LOBYTE(v10) = [v12 isCapturingContentForAdditionalRenderingDestination];

  uint64_t v13 = [v9 renderingEnvironment];
  uint64_t v14 = [v13 systemDisplayIdentifier];

  uint64_t v15 = [v9 systemShellHostingEnvironment];
  id v16 = [v15 systemShellHostingSpaceIdentifier];

  id v17 = [v9 settings];

  v18 = [v17 displayConfiguration];
  id v19 = [v18 hardwareIdentifier];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __101__SBUIContinuityAccessorySceneManager__updateAccessoryScene_followingPrimaryScene_transitionContext___block_invoke;
  v33[3] = &unk_1E5CCD588;
  uint64_t v38 = v11;
  id v20 = v7;
  id v34 = v20;
  char v39 = (char)v10;
  id v21 = v14;
  id v35 = v21;
  id v22 = v16;
  id v36 = v22;
  id v23 = v19;
  id v37 = v23;
  long long v24 = (void *)MEMORY[0x1AD0CF1C0](v33);
  if ([v20 isActive])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __101__SBUIContinuityAccessorySceneManager__updateAccessoryScene_followingPrimaryScene_transitionContext___block_invoke_2;
    v30[3] = &unk_1E5CCD5B0;
    long long v25 = &v32;
    v32 = v24;
    id v31 = v8;
    id v26 = v24;
    [v20 performUpdate:v30];
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__SBUIContinuityAccessorySceneManager__updateAccessoryScene_followingPrimaryScene_transitionContext___block_invoke_3;
    v28[3] = &unk_1E5CCD5D8;
    long long v25 = &v29;
    v29 = v24;
    id v27 = v24;
    [v20 updateSettings:v28];
  }
}

void __101__SBUIContinuityAccessorySceneManager__updateAccessoryScene_followingPrimaryScene_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  [a2 setUserInterfaceStyle:*(void *)(a1 + 64)];
  id v3 = [*(id *)(a1 + 32) renderingEnvironment];
  [v3 setIsCapturingContentForAdditionalRenderingDestination:*(unsigned __int8 *)(a1 + 72)];

  id v4 = [*(id *)(a1 + 32) renderingEnvironment];
  [v4 setSystemDisplayIdentifier:*(void *)(a1 + 40)];

  id v5 = [*(id *)(a1 + 32) systemShellHostingEnvironment];
  [v5 setSystemShellHostingSpaceIdentifier:*(void *)(a1 + 48)];

  id v6 = [*(id *)(a1 + 32) _keyboardHostComponent];
  [v6 setHardwareKeyboardExclusivityIdentifier:*(void *)(a1 + 56)];
}

void __101__SBUIContinuityAccessorySceneManager__updateAccessoryScene_followingPrimaryScene_transitionContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = [*(id *)(a1 + 32) animationSettings];
  if (v4) {
    [v6 setAnimationSettings:v4];
  }
  id v5 = [*(id *)(a1 + 32) animationFence];
  if (v5) {
    [v6 setAnimationFence:v5];
  }
}

uint64_t __101__SBUIContinuityAccessorySceneManager__updateAccessoryScene_followingPrimaryScene_transitionContext___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_primaryScenes, 0);
  objc_storeStrong((id *)&self->_lock_accessoryScenes, 0);
}

@end