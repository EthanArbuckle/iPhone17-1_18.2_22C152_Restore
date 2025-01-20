@interface SBSceneSettingsUpdater
+ (void)__updateSceneInsetSettings:(id)a3 forDisplayConfiguration:(id)a4;
+ (void)__updateSceneSettings:(id)a3 forDisplayConfiguration:(id)a4 updateGeometry:(BOOL)a5;
+ (void)safeUpdateScene:(id)a3 withBlock:(id)a4;
+ (void)safeUpdateScene:(id)a3 withDisplayConfiguration:(id)a4;
+ (void)safeUpdateScene:(id)a3 withDisplayConfiguration:(id)a4 updateGeometry:(BOOL)a5;
+ (void)safeUpdateScene:(id)a3 withSceneLevel:(double)a4;
+ (void)safeUpdateScene:(id)a3 withUserInterfaceStyle:(int64_t)a4;
- (BOOL)isActive;
- (BOOL)isForeground;
- (BOOL)updatesGeometry;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBScene)scene;
- (NSString)scenePersistentIdentifier;
- (NSString)traitsRole;
- (SBSceneSettingsUpdater)initWithScene:(id)a3 persistentIdentifier:(id)a4 level:(double)a5 updatesGeometry:(BOOL)a6;
- (SBTraitsSceneParticipantDelegate)sceneTraitsDelegate;
- (double)level;
- (id)addObserver:(id)a3;
- (unint64_t)initialSupportedInterfaceOrientations;
- (void)__setupTraitsParticipantWithRole:(id)a3 displayIdentity:(id)a4;
- (void)_createTraitsParticipantIfNeededWithRole:(id)a3;
- (void)_setPersistenceIdentifier:(id)a3;
- (void)dealloc;
- (void)setActive:(BOOL)a3 withTransitionContext:(id)a4;
- (void)setDisplayConfiguration:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setLevel:(double)a3;
- (void)setTraitsRole:(id)a3;
@end

@implementation SBSceneSettingsUpdater

+ (void)safeUpdateScene:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"SBSceneSettingsUpdater.m", 163, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

    if (!v7) {
      goto LABEL_11;
    }
  }
  if ([v7 isValid])
  {
    if ([v7 isActive])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke;
      v14[3] = &unk_1E6AFC7C8;
      v15 = v8;
      [v7 performUpdate:v14];
      v9 = v15;
    }
    else
    {
      v10 = [v7 clientProcess];

      if (v10)
      {
        v9 = SBLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[SBSceneSettingsUpdater safeUpdateScene:withBlock:]((uint64_t)v7, v9);
        }
      }
      else
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_30;
        v12[3] = &unk_1E6AFC818;
        v13 = v8;
        [v7 configureParameters:v12];
        v9 = v13;
      }
    }
  }
LABEL_11:
}

uint64_t __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SBSceneSettingsUpdater)initWithScene:(id)a3 persistentIdentifier:(id)a4 level:(double)a5 updatesGeometry:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSceneSettingsUpdater.m", 32, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)SBSceneSettingsUpdater;
  v13 = [(SBSceneSettingsUpdater *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_scene, v11);
    objc_storeStrong((id *)&v14->_scenePersistentIdentifier, a4);
    v14->_updatesGeometry = a6;
    [(SBSceneSettingsUpdater *)v14 setLevel:a5];
    [(SBSceneSettingsUpdater *)v14 _setPersistenceIdentifier:v12];
  }

  return v14;
}

- (void)dealloc
{
  [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate invalidate];
  sceneTraitsDelegate = self->_sceneTraitsDelegate;
  self->_sceneTraitsDelegate = 0;

  [(TRAParticipant *)self->_traitsParticipant invalidate];
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSceneSettingsUpdater;
  [(SBSceneSettingsUpdater *)&v5 dealloc];
}

- (NSString)traitsRole
{
  return self->_traitsRole;
}

- (void)setTraitsRole:(id)a3
{
  objc_storeStrong((id *)&self->_traitsRole, a3);
  id v5 = a3;
  [(SBSceneSettingsUpdater *)self _createTraitsParticipantIfNeededWithRole:v5];
}

- (double)level
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v3 = [WeakRetained settings];
  [v3 level];
  double v5 = v4;

  return v5;
}

- (void)setLevel:(double)a3
{
  [(SBSceneSettingsUpdater *)self level];
  if (v5 != a3)
  {
    v6 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    [v6 safeUpdateScene:WeakRetained withSceneLevel:a3];
  }
}

- (void)setDisplayConfiguration:(id)a3
{
  id v10 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    double v4 = (FBSDisplayConfiguration *)[v10 copy];
    displayConfiguration = self->_displayConfiguration;
    self->_displayConfiguration = v4;

    [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate invalidate];
    [(TRAParticipant *)self->_traitsParticipant invalidate];
    sceneTraitsDelegate = self->_sceneTraitsDelegate;
    self->_sceneTraitsDelegate = 0;

    traitsParticipant = self->_traitsParticipant;
    self->_traitsParticipant = 0;

    id v8 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    [v8 safeUpdateScene:WeakRetained withDisplayConfiguration:v10 updateGeometry:self->_updatesGeometry];

    [(SBSceneSettingsUpdater *)self _createTraitsParticipantIfNeededWithRole:self->_traitsRole];
    [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate setOrientationActuationAnimatable:v10 != 0];
  }
}

- (BOOL)isForeground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v3 = [WeakRetained settings];
  char v4 = [v3 isForeground];

  return v4;
}

- (void)setForeground:(BOOL)a3
{
  if ([(SBSceneSettingsUpdater *)self isForeground] != a3)
  {
    double v5 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__SBSceneSettingsUpdater_setForeground___block_invoke;
    v7[3] = &__block_descriptor_33_e73_v24__0__UIMutableApplicationSceneSettings_8__FBSSceneTransitionContext_16l;
    BOOL v8 = a3;
    [v5 safeUpdateScene:WeakRetained withBlock:v7];
  }
}

uint64_t __40__SBSceneSettingsUpdater_setForeground___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  char v3 = [WeakRetained isActive];

  return v3;
}

- (void)setActive:(BOOL)a3 withTransitionContext:(id)a4
{
  BOOL v4 = a3;
  p_scene = &self->_scene;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_scene);
  id v8 = WeakRetained;
  if (v4) {
    [WeakRetained activateWithTransitionContext:v6];
  }
  else {
    [WeakRetained deactivateWithTransitionContext:v6];
  }
}

- (id)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSceneSettingsUpdater.m", 112, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  if ([(NSHashTable *)self->_observers containsObject:v5])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBSceneSettingsUpdater.m", 113, @"observer was already added: %@", v5 object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__SBSceneSettingsUpdater_addObserver___block_invoke;
  v15[3] = &unk_1E6AFA6D0;
  objc_copyWeak(&v17, &location);
  id v7 = v5;
  id v16 = v7;
  id v8 = (void *)[v6 initWithIdentifier:@"SBSceneSettingsUpdater" forReason:@"observer" invalidationBlock:v15];
  observers = self->_observers;
  if (!observers)
  {
    id v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v11 = self->_observers;
    self->_observers = v10;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __38__SBSceneSettingsUpdater_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v3 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

+ (void)safeUpdateScene:(id)a3 withSceneLevel:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SBSceneSettingsUpdater_safeUpdateScene_withSceneLevel___block_invoke;
  v4[3] = &__block_descriptor_40_e73_v24__0__UIMutableApplicationSceneSettings_8__FBSSceneTransitionContext_16l;
  *(double *)&v4[4] = a4;
  [a1 safeUpdateScene:a3 withBlock:v4];
}

uint64_t __57__SBSceneSettingsUpdater_safeUpdateScene_withSceneLevel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLevel:*(double *)(a1 + 32)];
}

+ (void)safeUpdateScene:(id)a3 withDisplayConfiguration:(id)a4
{
}

+ (void)safeUpdateScene:(id)a3 withDisplayConfiguration:(id)a4 updateGeometry:(BOOL)a5
{
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__SBSceneSettingsUpdater_safeUpdateScene_withDisplayConfiguration_updateGeometry___block_invoke;
    v11[3] = &unk_1E6AFC780;
    SEL v13 = a2;
    id v14 = a1;
    id v12 = v9;
    BOOL v15 = a5;
    [a1 safeUpdateScene:a3 withBlock:v11];
  }
}

void __82__SBSceneSettingsUpdater_safeUpdateScene_withDisplayConfiguration_updateGeometry___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isUISubclass] & 1) == 0)
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"SBSceneSettingsUpdater.m" lineNumber:146 description:@"Settings must be an UI subclass"];
  }
  objc_msgSend(*(id *)(a1 + 48), "__updateSceneSettings:forDisplayConfiguration:updateGeometry:", v4, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
}

+ (void)safeUpdateScene:(id)a3 withUserInterfaceStyle:(int64_t)a4
{
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__SBSceneSettingsUpdater_safeUpdateScene_withUserInterfaceStyle___block_invoke;
    v4[3] = &__block_descriptor_56_e73_v24__0__UIMutableApplicationSceneSettings_8__FBSSceneTransitionContext_16l;
    v4[4] = a2;
    void v4[5] = a1;
    v4[6] = a4;
    [a1 safeUpdateScene:a3 withBlock:v4];
  }
}

void __65__SBSceneSettingsUpdater_safeUpdateScene_withUserInterfaceStyle___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  if (([v4 isUISubclass] & 1) == 0)
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[4] object:a1[5] file:@"SBSceneSettingsUpdater.m" lineNumber:155 description:@"Settings must be an UI subclass"];
  }
  [v4 setUserInterfaceStyle:a1[6]];
}

void __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_30(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_2;
  v3[3] = &unk_1E6AFC7F0;
  id v4 = *(id *)(a1 + 32);
  [a2 updateSettingsWithBlock:v3];
}

uint64_t __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SBSceneSettingsUpdater__setPersistenceIdentifier___block_invoke;
  v8[3] = &unk_1E6AF8970;
  id v9 = v4;
  id v7 = v4;
  [v5 safeUpdateScene:WeakRetained withBlock:v8];
}

uint64_t __52__SBSceneSettingsUpdater__setPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPersistenceIdentifier:*(void *)(a1 + 32)];
}

- (void)_createTraitsParticipantIfNeededWithRole:(id)a3
{
  id v11 = a3;
  id v4 = [(TRAParticipant *)self->_traitsParticipant role];
  char v5 = [v11 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate invalidate];
    [(TRAParticipant *)self->_traitsParticipant invalidate];
    sceneTraitsDelegate = self->_sceneTraitsDelegate;
    self->_sceneTraitsDelegate = 0;

    traitsParticipant = self->_traitsParticipant;
    self->_traitsParticipant = 0;
  }
  id v8 = v11;
  if (v11)
  {
    if (!self->_traitsParticipant)
    {
      displayConfiguration = self->_displayConfiguration;
      if (displayConfiguration)
      {
        id v10 = [(FBSDisplayConfiguration *)displayConfiguration identity];
        [(SBSceneSettingsUpdater *)self __setupTraitsParticipantWithRole:v11 displayIdentity:v10];

        id v8 = v11;
      }
    }
  }
}

- (void)__setupTraitsParticipantWithRole:(id)a3 displayIdentity:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBSceneSettingsUpdater.m", 216, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];
  }
  if (!self->_traitsParticipant && SBTraitsArbiterOrientationActuationEnabledForRole(v7))
  {
    if ([v8 expectsSecureRendering])
    {
      id v9 = [MEMORY[0x1E4F62420] sharedInstance];
      id v10 = [v9 mainIdentity];
    }
    else
    {
      id v10 = v8;
    }
    id v11 = [(id)SBApp windowSceneManager];
    id v12 = [v11 windowSceneForDisplayIdentity:v10];

    SEL v13 = [v12 traitsArbiter];
    id v14 = [SBTraitsSceneParticipantDelegate alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    id v16 = [(SBTraitsSceneParticipantDelegate *)v14 initWithScene:WeakRetained];
    sceneTraitsDelegate = self->_sceneTraitsDelegate;
    self->_sceneTraitsDelegate = v16;

    [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate setOrientationActuationAnimatable:self->_displayConfiguration != 0];
    v18 = [v13 acquireParticipantWithRole:v7 delegate:self->_sceneTraitsDelegate];
    traitsParticipant = self->_traitsParticipant;
    self->_traitsParticipant = v18;

    [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate setArbiter:v13];
    [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate setParticipant:self->_traitsParticipant];
    [(SBTraitsSceneParticipantDelegate *)self->_sceneTraitsDelegate setInitialSupportedOrientationsOverride:[(SBSceneSettingsUpdater *)self initialSupportedInterfaceOrientations]];
    [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"Setup"];
    [(TRAParticipant *)self->_traitsParticipant updatePreferencesIfNeeded];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v20 = self->_observers;
    uint64_t v21 = [(NSHashTable *)v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v24++) didUpdateSceneTraitsDelegate:self->_sceneTraitsDelegate];
        }
        while (v22 != v24);
        uint64_t v22 = [(NSHashTable *)v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v22);
    }
  }
}

+ (void)__updateSceneSettings:(id)a3 forDisplayConfiguration:(id)a4 updateGeometry:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v9 = a4;
  if (([v11 isUISubclass] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"SBSceneSettingsUpdater.m" lineNumber:242 description:@"Settings must be an UI subclass"];
  }
  if (__updateSceneSettings_forDisplayConfiguration_updateGeometry__onceToken != -1) {
    dispatch_once(&__updateSceneSettings_forDisplayConfiguration_updateGeometry__onceToken, &__block_literal_global_87);
  }
  objc_msgSend(v11, "setScreenReferenceDisplayModeStatus:", objc_msgSend((id)__updateSceneSettings_forDisplayConfiguration_updateGeometry____displayReferenceModeMonitor, "referenceModeStatusForDisplayWithConfiguration:", v9));
  [v11 setDisplayConfiguration:v9];
  if (v5)
  {
    [v9 bounds];
    objc_msgSend(v11, "setFrame:");
    objc_msgSend(a1, "__updateSceneInsetSettings:forDisplayConfiguration:", v11, v9);
  }
}

void __87__SBSceneSettingsUpdater___updateSceneSettings_forDisplayConfiguration_updateGeometry___block_invoke()
{
  v0 = objc_alloc_init(SBDisplayReferenceModeMonitor);
  v1 = (void *)__updateSceneSettings_forDisplayConfiguration_updateGeometry____displayReferenceModeMonitor;
  __updateSceneSettings_forDisplayConfiguration_updateGeometry____displayReferenceModeMonitor = (uint64_t)v0;
}

+ (void)__updateSceneInsetSettings:(id)a3 forDisplayConfiguration:(id)a4
{
  id v16 = a3;
  id v7 = a4;
  if (([v16 isUISubclass] & 1) == 0)
  {
    BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"SBSceneSettingsUpdater.m" lineNumber:258 description:@"Settings must be an UI subclass"];
  }
  if (([v7 isMainRootDisplay] & 1) != 0
    || ([v7 identity],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isContinuityDisplay],
        v8,
        v9))
  {
    id v10 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    objc_msgSend(v10, "sb_applyDisplayEdgeInfoToSceneSettings:", v16);
  }
  else
  {
    double v11 = *MEMORY[0x1E4F437F8];
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    objc_msgSend(v16, "setSafeAreaInsetsPortrait:", *MEMORY[0x1E4F437F8], v12, v13, v14);
    objc_msgSend(v16, "setPeripheryInsets:", v11, v12, v13, v14);
    [v16 setHomeAffordanceOverlayAllowance:0.0];
  }
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (FBScene *)WeakRetained;
}

- (NSString)scenePersistentIdentifier
{
  return self->_scenePersistentIdentifier;
}

- (SBTraitsSceneParticipantDelegate)sceneTraitsDelegate
{
  return self->_sceneTraitsDelegate;
}

- (BOOL)updatesGeometry
{
  return self->_updatesGeometry;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (unint64_t)initialSupportedInterfaceOrientations
{
  return self->_initialSupportedInterfaceOrientations;
}

- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_initialSupportedInterfaceOrientations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_sceneTraitsDelegate, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifier, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_traitsRole, 0);
}

+ (void)safeUpdateScene:(uint64_t)a1 withBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBSceneSettingsUpdater was asked to update settings on an invalidated scene: %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end