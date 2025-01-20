@interface SBSceneManagerCoordinator
+ (SBSceneManagerCoordinator)sharedInstance;
+ (id)mainDisplaySceneManager;
+ (id)secureMainDisplaySceneManager;
- (NSString)debugDescription;
- (NSString)description;
- (SBSceneManagerCoordinator)init;
- (UIApplicationSceneDeactivationManager)sceneDeactivationManager;
- (id)_newLayoutStateSceneIdentityProviderWithDisplayIdentity:(id)a3;
- (id)_newSceneIdentityProviderWithDisplayIdentity:(id)a3;
- (id)_referenceForDisplayIdentity:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)_sceneManagerForDisplayIdentity:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4;
- (id)sceneManagerForDisplayIdentity:(id)a3;
- (id)sceneManagerForPersistenceIdentifier:(id)a3;
- (void)_createSceneForApplication:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)addActionHandler:(id)a3 forScene:(id)a4;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)enumerateSceneManagersWithBlock:(id)a3;
- (void)registerSceneWorkspaceIdentifierToIgnore:(id)a3;
- (void)removeActionHandler:(id)a3 forScene:(id)a4;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneManager:(id)a3 clientDidConnectWithHandshake:(id)a4;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6;
- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)sceneManagerDidInvalidateForReference:(id)a3;
@end

@implementation SBSceneManagerCoordinator

- (id)_sceneManagerForDisplayIdentity:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"-[SBSceneManagerCoordinator _sceneManagerForDisplayIdentity:creatingIfNecessary:]"];
    [v18 handleFailureInFunction:v19 file:@"SBSceneManagerCoordinator.m" lineNumber:158 description:@"this call must be made on the main thread"];

    if (v7)
    {
LABEL_3:
      v8 = [(SBSceneManagerCoordinator *)self _referenceForDisplayIdentity:v7 creatingIfNecessary:v4];
      v9 = v8;
      if (!v8)
      {
        v11 = 0;
LABEL_26:

        goto LABEL_29;
      }
      v10 = [v8 manager];
      if (v10)
      {
        v11 = v10;
        if (![(SBSceneManager *)v10 isValid])
        {
          v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:a2, self, @"SBSceneManagerCoordinator.m", 166, @"attempting to access a manager that has been invalidated : manager=%@", v11 object file lineNumber description];
        }
        goto LABEL_26;
      }
      if ([v7 isMainRootDisplay])
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke;
        block[3] = &unk_1E6AF4E00;
        id v26 = v9;
        v27 = self;
        id v28 = v7;
        if (_sceneManagerForDisplayIdentity_creatingIfNecessary_____once != -1) {
          dispatch_once(&_sceneManagerForDisplayIdentity_creatingIfNecessary_____once, block);
        }
        v11 = (SBSystemShellExternalDisplaySceneManager *)(id)_sceneManagerForDisplayIdentity_creatingIfNecessary_____mainDisplayManager;

        v13 = v26;
      }
      else
      {
        if (![v7 isMainDisplay]
          || ![v7 expectsSecureRendering])
        {
          if (objc_msgSend(v7, "sb_displayWindowingMode") == 1)
          {
            v14 = [SBSystemShellExternalDisplaySceneManager alloc];
            id v15 = [(SBSceneManagerCoordinator *)self _newLayoutStateSceneIdentityProviderWithDisplayIdentity:v7];
          }
          else
          {
            if (objc_msgSend(v7, "sb_displayWindowingMode") == 2) {
              v16 = SBNonInteractiveDisplaySceneManager;
            }
            else {
              v16 = SBSceneManager;
            }
            v14 = (SBSystemShellExternalDisplaySceneManager *)[v16 alloc];
            id v15 = [(SBSceneManagerCoordinator *)self _newSceneIdentityProviderWithDisplayIdentity:v7];
          }
          v17 = v15;
          v11 = [(SBSystemShellExternalDisplaySceneManager *)v14 initWithReference:v9 sceneIdentityProvider:v15 presentationBinder:0];

          goto LABEL_25;
        }
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke_2;
        v21[3] = &unk_1E6AF4E00;
        id v22 = v9;
        v23 = self;
        id v24 = v7;
        if (_sceneManagerForDisplayIdentity_creatingIfNecessary_____once_61 != -1) {
          dispatch_once(&_sceneManagerForDisplayIdentity_creatingIfNecessary_____once_61, v21);
        }
        v11 = (SBSystemShellExternalDisplaySceneManager *)(id)_sceneManagerForDisplayIdentity_creatingIfNecessary_____secureManager;

        v13 = v22;
      }

LABEL_25:
      [v9 setManager:v11];
      goto LABEL_26;
    }
  }
  v11 = 0;
LABEL_29:

  return v11;
}

- (id)_referenceForDisplayIdentity:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"-[SBSceneManagerCoordinator _referenceForDisplayIdentity:creatingIfNecessary:]"];
    [v11 handleFailureInFunction:v12 file:@"SBSceneManagerCoordinator.m" lineNumber:134 description:@"this call must be made on the main thread"];

    if (v7) {
      goto LABEL_3;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  if (!v7) {
    goto LABEL_15;
  }
LABEL_3:
  v8 = [(NSMutableDictionary *)self->_displayIdentityToReferenceMap objectForKey:v7];
  if ([(SBSceneManagerReference *)v8 isDefunct])
  {
    if ([(SBSceneManagerReference *)v8 isRetaining])
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBSceneManagerCoordinator.m", 140, @"the reference is dead but we thought we were retaining it : ref=%@", v8 object file lineNumber description];
    }
    v9 = BKLogDisplay();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "purging a defunct sceneManagerReference=%{public}@", buf, 0xCu);
    }

    [(SBSceneManagerReference *)v8 setDelegate:0];
    [(NSMutableDictionary *)self->_displayIdentityToReferenceMap removeObjectForKey:v7];

    v8 = 0;
  }
  if (!v8 && v4)
  {
    v8 = [[SBSceneManagerReference alloc] initWithDisplayIdentity:v7];
    [(SBSceneManagerReference *)v8 setDelegate:self];
    [(NSMutableDictionary *)self->_displayIdentityToReferenceMap setObject:v8 forKey:v7];
    v10 = BKLogDisplay();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "creating sceneManagerReference=%{public}@", buf, 0xCu);
    }
  }
LABEL_16:

  return v8;
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 settings];
  objc_msgSend(v11, "sb_displayIdentityForSceneManagers");
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v13];
  [v12 scene:v10 didCompleteUpdateWithContext:v9 error:v8];
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 settings];
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v10];
  [v9 scene:v7 didPrepareUpdateWithContext:v6];
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 settings];
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v10];
  [v9 scene:v7 didApplyUpdateWithContext:v6];
}

- (id)sceneManagerForDisplayIdentity:(id)a3
{
  return [(SBSceneManagerCoordinator *)self _sceneManagerForDisplayIdentity:a3 creatingIfNecessary:1];
}

+ (id)mainDisplaySceneManager
{
  v2 = +[SBSceneManagerCoordinator sharedInstance];
  v3 = [MEMORY[0x1E4F62420] mainIdentity];
  BOOL v4 = [v2 _sceneManagerForDisplayIdentity:v3 creatingIfNecessary:1];

  return v4;
}

+ (SBSceneManagerCoordinator)sharedInstance
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SBSceneManagerCoordinator_sharedInstance__block_invoke;
  block[3] = &unk_1E6AF56B0;
  void block[4] = v5;
  if (sharedInstance___once_10 != -1) {
    dispatch_once(&sharedInstance___once_10, block);
  }
  id v2 = (id)sharedInstance___instance_9;
  _Block_object_dispose(v5, 8);
  return (SBSceneManagerCoordinator *)v2;
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v6 workspaceIdentifier];
  if (!v7 || ([(NSMutableSet *)self->_workspaceIdentifiersToIgnore containsObject:v7] & 1) == 0)
  {
    [v6 setDelegate:self];
    id v8 = [v6 settings];
    id v9 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");

    id v10 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v9];
    [v10 sceneManager:v12 didCreateScene:v6];
    if ([v10 _shouldTrackScenesForDeactivation])
    {
      v11 = [(SBSceneManagerCoordinator *)self sceneDeactivationManager];
      [v11 beginTrackingScene:v6];
    }
  }
}

- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 workspaceIdentifier];
  if (!v10 || ([(NSMutableSet *)self->_workspaceIdentifiersToIgnore containsObject:v10] & 1) == 0)
  {
    v11 = [v8 settings];
    id v12 = objc_msgSend(v11, "sb_displayIdentityForSceneManagers");

    id v13 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v12];
    [v13 sceneManager:v15 interceptUpdateForScene:v8 withNewSettings:v9];
    if ([v13 _shouldTrackScenesForDeactivation])
    {
      v14 = [(SBSceneManagerCoordinator *)self sceneDeactivationManager];
      [v14 amendSceneSettings:v9 forScene:v8];
    }
  }
}

- (UIApplicationSceneDeactivationManager)sceneDeactivationManager
{
  return self->_sceneDeactivationManager;
}

- (void)enumerateSceneManagersWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_displayIdentityToReferenceMap allValues];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__SBSceneManagerCoordinator_enumerateSceneManagersWithBlock___block_invoke;
    v6[3] = &unk_1E6B07DC8;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  id v4 = (void *)SBApp;
  id v5 = a4;
  id v6 = [v4 hearingTestModeCoordinator];
  [v6 addSceneExtensionIfNeeded:v5];
}

- (void)sceneManager:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F62448] sharedInstance];
  id v8 = [v6 process];
  id v9 = [v8 handle];
  id v10 = objc_msgSend(v7, "processForPID:", objc_msgSend(v9, "pid"));

  id v28 = v10;
  v11 = [v10 executionContext];
  id v12 = [v11 watchdogProvider];

  if (!v12)
  {
    id v13 = +[SBSceneWatchdogProvider defaultSceneWatchdogProvider];
    [v10 setWatchdogProvider:v13];
  }
  v25 = [MEMORY[0x1E4F62420] sharedInstance];
  v14 = [v25 connectedIdentities];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v6;
  id v15 = [v6 remnants];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v21 = [v20 lastSettings];
        id v22 = objc_msgSend(v21, "sb_displayIdentityForSceneManagers");
        if (v22 && ([v14 containsObject:v22] & 1) != 0)
        {
          v23 = [(SBSceneManagerCoordinator *)self _sceneManagerForDisplayIdentity:v22 creatingIfNecessary:1];
          id v24 = v23;
          if (v23) {
            [v23 _reconnectSceneRemnant:v20 forProcess:v28 sceneManager:v27];
          }
          [v20 invalidate];
        }
        else
        {
          [v20 invalidate];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v13 settings];
  objc_msgSend(v14, "sb_displayIdentityForSceneManagers");
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v15 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v16];
  [v15 scene:v13 didUpdateClientSettingsWithDiff:v12 oldClientSettings:v11 transitionContext:v10];
}

void __61__SBSceneManagerCoordinator_enumerateSceneManagersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 manager];
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v3 = v4;
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 settings];
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v10];
  [v9 scene:v7 didReceiveActions:v6];
}

uint64_t __43__SBSceneManagerCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  kdebug_trace();
  id v2 = objc_alloc_init(SBSceneManagerCoordinator);
  v3 = (void *)sharedInstance___instance_9;
  sharedInstance___instance_9 = (uint64_t)v2;

  uint64_t result = kdebug_trace();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (SBSceneManagerCoordinator)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = [NSString stringWithUTF8String:"-[SBSceneManagerCoordinator init]"];
    [v22 handleFailureInFunction:v23 file:@"SBSceneManagerCoordinator.m" lineNumber:95 description:@"this call must be made on the main thread"];
  }
  v30.receiver = self;
  v30.super_class = (Class)SBSceneManagerCoordinator;
  v3 = [(SBSceneManagerCoordinator *)&v30 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F62490] sharedInstance];
    sceneManager = v3->_sceneManager;
    v3->_sceneManager = (FBSceneManager *)v4;

    [(FBSceneManager *)v3->_sceneManager setDelegate:v3];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"com.apple.siri", *MEMORY[0x1E4F4F588], 0);
    workspaceIdentifiersToIgnore = v3->_workspaceIdentifiersToIgnore;
    v3->_workspaceIdentifiersToIgnore = (NSMutableSet *)v6;

    id v8 = (UIApplicationSceneDeactivationManager *)objc_alloc_init(MEMORY[0x1E4F42770]);
    sceneDeactivationManager = v3->_sceneDeactivationManager;
    v3->_sceneDeactivationManager = v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    displayIdentityToReferenceMap = v3->_displayIdentityToReferenceMap;
    v3->_displayIdentityToReferenceMap = v10;

    id v12 = [MEMORY[0x1E4F62420] sharedInstance];
    [v12 addObserver:v3];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = [v12 connectedIdentities];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v19 = [v12 configurationForIdentity:v18];
          [(SBSceneManagerCoordinator *)v3 displayMonitor:v12 didConnectIdentity:v18 withConfiguration:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v15);
    }

    v20 = v3->_sceneManager;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __33__SBSceneManagerCoordinator_init__block_invoke;
    v24[3] = &unk_1E6AF87C0;
    v25 = v3;
    [(FBSceneManager *)v20 enumerateScenesWithBlock:v24];
  }
  return v3;
}

uint64_t __33__SBSceneManagerCoordinator_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sceneManager:*(void *)(*(void *)(a1 + 32) + 8) didAddScene:a2];
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F62420] sharedInstance];
  [v3 removeObserver:self];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_displayIdentityToReferenceMap allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) manager];
        [v9 invalidate];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_displayIdentityToReferenceMap removeAllObjects];
  [(FBSceneManager *)self->_sceneManager setDelegate:0];
  v10.receiver = self;
  v10.super_class = (Class)SBSceneManagerCoordinator;
  [(SBSceneManagerCoordinator *)&v10 dealloc];
}

void __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke(uint64_t a1)
{
  id v2 = [SBMainDisplaySceneManager alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = (id)[*(id *)(a1 + 40) _newLayoutStateSceneIdentityProviderWithDisplayIdentity:*(void *)(a1 + 48)];
  uint64_t v4 = +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance];
  uint64_t v5 = [(SBMainDisplaySceneManager *)v2 initWithReference:v3 sceneIdentityProvider:v7 presentationBinder:v4];
  uint64_t v6 = (void *)_sceneManagerForDisplayIdentity_creatingIfNecessary_____mainDisplayManager;
  _sceneManagerForDisplayIdentity_creatingIfNecessary_____mainDisplayManager = v5;
}

void __81__SBSceneManagerCoordinator__sceneManagerForDisplayIdentity_creatingIfNecessary___block_invoke_2(uint64_t a1)
{
  id v2 = [SBSecureMainDisplaySceneManager alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = (id)[*(id *)(a1 + 40) _newSceneIdentityProviderWithDisplayIdentity:*(void *)(a1 + 48)];
  uint64_t v4 = +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance];
  uint64_t v5 = [(SBSceneManager *)v2 initWithReference:v3 sceneIdentityProvider:v7 presentationBinder:v4];
  uint64_t v6 = (void *)_sceneManagerForDisplayIdentity_creatingIfNecessary_____secureManager;
  _sceneManagerForDisplayIdentity_creatingIfNecessary_____secureManager = v5;
}

- (id)_newSceneIdentityProviderWithDisplayIdentity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SBSceneIdentityProvider alloc] initWithDisplayIdentity:v3];

  return v4;
}

- (id)_newLayoutStateSceneIdentityProviderWithDisplayIdentity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SBLayoutStateSceneIdentityProvider alloc] initWithDisplayIdentity:v3];

  return v4;
}

+ (id)secureMainDisplaySceneManager
{
  id v2 = +[SBSceneManagerCoordinator sharedInstance];
  id v3 = objc_msgSend(MEMORY[0x1E4F62420], "sb_secureMainIdentity");
  uint64_t v4 = [v2 _sceneManagerForDisplayIdentity:v3 creatingIfNecessary:1];

  return v4;
}

- (id)sceneManagerForPersistenceIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_displayIdentityToReferenceMap allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      objc_super v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) manager];
      long long v11 = [v10 existingSceneHandleForPersistenceIdentifier:v4];

      if (v11) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    objc_super v10 = 0;
  }

  return v10;
}

- (void)registerSceneWorkspaceIdentifierToIgnore:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBSceneManagerCoordinator.m", 251, @"Invalid parameter not satisfying: %@", @"workspaceID" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_workspaceIdentifiersToIgnore addObject:v5];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __40__SBSceneManagerCoordinator_description__block_invoke;
  objc_super v10 = &unk_1E6AF5290;
  id v11 = v3;
  long long v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:&v7];
  id v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return (NSString *)v5;
}

void __40__SBSceneManagerCoordinator_description__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 16) allValues];
  [v1 appendArraySection:v2 withName:0 skipIfEmpty:1 objectTransformer:&__block_literal_global_265];
}

uint64_t __40__SBSceneManagerCoordinator_description__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 succinctDescription];
}

- (NSString)debugDescription
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __45__SBSceneManagerCoordinator_debugDescription__block_invoke;
  objc_super v10 = &unk_1E6AF5290;
  id v11 = v3;
  long long v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:&v7];
  id v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return (NSString *)v5;
}

void __45__SBSceneManagerCoordinator_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) allValues];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__SBSceneManagerCoordinator_debugDescription__block_invoke_2;
  v4[3] = &unk_1E6B07E10;
  id v5 = *(id *)(a1 + 32);
  [v2 appendArraySection:v3 withName:0 skipIfEmpty:1 objectTransformer:v4];
}

id __45__SBSceneManagerCoordinator_debugDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 activeMultilinePrefix];
  id v5 = [v3 debugDescriptionWithMultilinePrefix:v4];

  return v5;
}

- (void)sceneManager:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  long long v12 = [a5 handle];
  if (!v12)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2 object:self file:@"SBSceneManagerCoordinator.m" lineNumber:310 description:@"Can't find process handle"];
  }
  long long v13 = [v12 identity];
  long long v14 = [MEMORY[0x1E4F62448] sharedInstance];
  long long v15 = objc_msgSend(v14, "processForPID:", objc_msgSend(v12, "pid"));

  uint64_t v16 = objc_opt_class();
  uint64_t v17 = SBSafeCast(v16, v10);
  uint64_t v18 = [(id)SBApp systemUIScenesCoordinator];
  if ([(id)objc_opt_class() shouldHandleSceneRequestsForProcess:v12 withOptions:v17])
  {
    [v18 activateSceneForProcessIdentity:v13 withHandle:v12 options:v17 completion:v11];
    goto LABEL_37;
  }
  if ([v15 isApplicationProcess])
  {
    v19 = +[SBApplicationController sharedInstance];
    v20 = objc_msgSend(v19, "applicationWithPid:", objc_msgSend(v15, "pid"));

    if (v20)
    {
      [(SBSceneManagerCoordinator *)self _createSceneForApplication:v20 withOptions:v10 completion:v11];
    }
    else
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v59 = *MEMORY[0x1E4F28228];
      v60[0] = @"Scene creation failed, invalid application";
      long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
      long long v27 = [v25 errorWithDomain:@"SBSceneManagerDomain" code:1 userInfo:v26];
      v11[2](v11, 0, v27);
    }
LABEL_36:

    goto LABEL_37;
  }
  if ([v15 hasEntitlement:@"com.apple.springboard.requestScene-daemon"])
  {
    v21 = [v10 identifier];
    id v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      long long v28 = [MEMORY[0x1E4F29128] UUID];
      id v23 = [v28 UUIDString];
    }
    long long v29 = [MEMORY[0x1E4F62490] sharedInstance];
    uint64_t v54 = (uint64_t)v23;
    objc_super v30 = [v29 sceneWithIdentifier:v23];

    if (v30)
    {
      long long v31 = [v30 clientProcess];

      if (v31 == v15)
      {
        v20 = v23;
LABEL_33:
        if (v11) {
          ((void (**)(id, void *, void *))v11)[2](v11, v30, 0);
        }

        goto LABEL_36;
      }

      uint64_t v32 = SBLogCommon();
      v20 = (void *)v54;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[SBSceneManagerCoordinator sceneManager:didReceiveSceneRequestWithOptions:fromProcess:completion:]((uint64_t)v15, v54, v32);
      }
      objc_super v30 = 0;
    }
    else
    {
      v33 = [v10 initialClientSettings];
      uint64_t v34 = v33;
      if (v33) {
        v35 = v33;
      }
      else {
        v35 = objc_opt_new();
      }
      v36 = v35;
      v53 = v35;

      uint64_t v37 = [v36 preferredInterfaceOrientation];
      if ((unint64_t)(v37 - 1) >= 4) {
        uint64_t v38 = 1;
      }
      else {
        uint64_t v38 = v37;
      }
      [v36 preferredLevel];
      double v40 = v39;
      v41 = [MEMORY[0x1E4F62420] mainConfiguration];
      v42 = [MEMORY[0x1E4F629C0] settings];
      [v42 setDisplayConfiguration:v41];
      v52 = v41;
      [v41 bounds];
      objc_msgSend(v42, "setFrame:");
      [v42 setLevel:v40];
      [v42 setInterfaceOrientation:v38];
      [v42 setForeground:1];
      v43 = (void *)MEMORY[0x1E4F629B8];
      v44 = [MEMORY[0x1E4F62AB0] specification];
      v45 = [v43 parametersForSpecification:v44];

      v51 = v42;
      [v45 setSettings:v42];
      [v45 setClientSettings:v53];
      v46 = [MEMORY[0x1E4F62490] sharedInstance];
      v47 = [v15 workspace];
      v50 = v45;
      objc_super v30 = [v46 createSceneWithIdentifier:v54 parameters:v45 clientProvider:v47 transitionContext:0];

      v48 = SBLogCommon();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v56 = v15;
        __int16 v57 = 2114;
        v58 = v30;
        _os_log_impl(&dword_1D85BA000, v48, OS_LOG_TYPE_INFO, "process (%{public}@) requested scene creation -> %{public}@", buf, 0x16u);
      }

      uint64_t v32 = v53;
      v20 = (void *)v54;
    }

    goto LABEL_33;
  }
  id v24 = SBLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[SBSceneManagerCoordinator sceneManager:didReceiveSceneRequestWithOptions:fromProcess:completion:]((uint64_t)v15, v24);
  }

  if (v11) {
    v11[2](v11, 0, 0);
  }
LABEL_37:
}

- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 workspaceIdentifier];
  if (v6 && ([(NSMutableSet *)self->_workspaceIdentifiersToIgnore containsObject:v6] & 1) != 0)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 clientProcess];
    if ([v8 isApplicationProcess] && (objc_msgSend(v8, "isCurrentProcess") & 1) == 0)
    {
      id v10 = [v5 definition];
      id v11 = [v10 specification];
      id v7 = objc_alloc_init((Class)[v11 transitionContextClass]);

      if (!v7) {
        id v7 = objc_alloc_init(MEMORY[0x1E4F42790]);
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v6 workspaceIdentifier];
  if (!v7 || ([(NSMutableSet *)self->_workspaceIdentifiersToIgnore containsObject:v7] & 1) == 0)
  {
    uint64_t v8 = [v6 settings];
    uint64_t v9 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");

    id v10 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v9];
    [v10 sceneManager:v12 willDestroyScene:v6];

    id v11 = [(SBSceneManagerCoordinator *)self sceneDeactivationManager];
    [v11 endTrackingScene:v6];
  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 workspaceIdentifier];
  if (!v7 || ([(NSMutableSet *)self->_workspaceIdentifiersToIgnore containsObject:v7] & 1) == 0)
  {
    uint64_t v8 = [v6 settings];
    uint64_t v9 = objc_msgSend(v8, "sb_displayIdentityForSceneManagers");

    id v10 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v9];
    [v10 sceneManager:v11 didDestroyScene:v6];
  }
}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 settings];
  uint64_t v8 = objc_msgSend(v7, "sb_displayIdentityForSceneManagers");

  uint64_t v9 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v8];
  if (objc_opt_respondsToSelector()) {
    [v9 addActionHandler:v10 forScene:v6];
  }
}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 settings];
  uint64_t v8 = objc_msgSend(v7, "sb_displayIdentityForSceneManagers");

  uint64_t v9 = [(SBSceneManagerCoordinator *)self sceneManagerForDisplayIdentity:v8];
  if (objc_opt_respondsToSelector()) {
    [v9 removeActionHandler:v10 forScene:v6];
  }
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v10 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SBSceneManagerCoordinator displayMonitor:didConnectIdentity:withConfiguration:]"];
    [v8 handleFailureInFunction:v9 file:@"SBSceneManagerCoordinator.m" lineNumber:512 description:@"this call must be made on the main thread"];
  }
  id v6 = [(SBSceneManagerCoordinator *)self _referenceForDisplayIdentity:v10 creatingIfNecessary:1];
  [v6 setDisplayIsConnected:1];
  id v7 = [v6 manager];
  [v7 setHidden:0];
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [NSString stringWithUTF8String:"-[SBSceneManagerCoordinator displayMonitor:willDisconnectIdentity:]"];
    [v10 handleFailureInFunction:v11 file:@"SBSceneManagerCoordinator.m" lineNumber:521 description:@"this call must be made on the main thread"];
  }
  id v6 = [(SBSceneManagerCoordinator *)self _referenceForDisplayIdentity:v5 creatingIfNecessary:0];
  id v7 = v6;
  if (v6)
  {
    [v6 setDisplayIsConnected:0];
    uint64_t v8 = [v7 manager];
    [v8 setHidden:1];
    if (!v8 && ([v7 isRetaining] & 1) == 0)
    {
      uint64_t v9 = BKLogDisplay();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 138543362;
        long long v13 = v7;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "purging disconnected sceneManagerReference=%{public}@", (uint8_t *)&v12, 0xCu);
      }

      [v7 setDelegate:0];
      [(NSMutableDictionary *)self->_displayIdentityToReferenceMap removeObjectForKey:v5];
    }
  }
}

- (void)sceneManagerDidInvalidateForReference:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SBSceneManagerCoordinator sceneManagerDidInvalidateForReference:]"];
    [v8 handleFailureInFunction:v9 file:@"SBSceneManagerCoordinator.m" lineNumber:541 description:@"this call must be made on the main thread"];
  }
  id v5 = [v4 displayIdentity];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_displayIdentityToReferenceMap objectForKey:v5];

    if (v6 == v4)
    {
      id v7 = BKLogDisplay();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543362;
        id v11 = v4;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "purging invalidated sceneManagerReference=%{public}@", (uint8_t *)&v10, 0xCu);
      }

      [v4 setDelegate:0];
      [(NSMutableDictionary *)self->_displayIdentityToReferenceMap removeObjectForKey:v5];
    }
  }
}

- (void)_createSceneForApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SBSceneManagerCoordinator.m", 567, @"Invalid parameter not satisfying: %@", @"application" object file lineNumber description];
  }
  uint64_t v12 = objc_opt_class();
  id v13 = v10;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  if (!v15)
  {
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"SBSceneManagerCoordinator.m" lineNumber:569 description:@"Invalid scene request options class"];
  }
  uint64_t v16 = [(id)SBApp windowSceneManager];
  uint64_t v17 = [v15 sourceIdentifier];
  uint64_t v18 = [v16 windowSceneForPersistentIdentifier:v17];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [v16 activeDisplayWindowScene];
  }
  v21 = v20;

  id v22 = +[SBWorkspace mainWorkspace];
  id v23 = [v21 _fbsDisplayConfiguration];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke;
  v30[3] = &unk_1E6AF5F80;
  id v31 = v15;
  id v32 = v21;
  id v33 = v9;
  id v34 = v11;
  id v24 = v11;
  id v25 = v9;
  id v26 = v21;
  id v27 = v15;
  [v22 requestTransitionWithOptions:0 displayConfiguration:v23 builder:v30 validator:0];
}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke(id *a1, void *a2)
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([a1[4] requestCenterSlot]
    && ([a1[4] interactionIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [v3 setSource:55];
    if ([a1[4] requestFullscreen])
    {
      [v3 setCenterConfiguration:2];
      id v5 = [a1[4] sourceIdentifier];
      [v3 setCenterWindowSourceSceneID:v5];
    }
  }
  else
  {
    [v3 setSource:35];
  }
  [v3 setEventLabel:@"SceneCreationRequest"];
  id v6 = [a1[4] identifier];
  double v40 = [a1[4] sourceIdentifier];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  char v62 = [a1[4] requestBackground];
  id v7 = [a1[5] sceneManager];
  if (!__sb__runningInSpringBoard())
  {
    uint64_t v14 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v15 = [v14 userInterfaceIdiom] == 1;

    if (v15) {
      goto LABEL_8;
    }
LABEL_13:
    id v8 = [v7 existingSceneHandleForPersistenceIdentifier:v6];
    if (!v8)
    {
      id v16 = a1[6];
      uint64_t v17 = [v7 sceneIdentityForApplication:v16];
      uint64_t v18 = [v7 displayIdentity];
      v19 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v16 sceneIdentity:v17 displayIdentity:v18];

      id v8 = [v7 fetchOrCreateApplicationSceneHandleForRequest:v19];
    }
    *((unsigned char *)v60 + 24) = 1;
    goto LABEL_19;
  }
  if (SBFEffectiveDeviceClass() != 2) {
    goto LABEL_13;
  }
LABEL_8:
  if (v6)
  {
    id v8 = [v7 existingSceneHandleForPersistenceIdentifier:v6];
    if (!v8)
    {
      id v34 = [a1[6] _sceneIdentifierForStoredPersistenceIdentifier:v6];
      if (!v34)
      {
        double v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v63 = *MEMORY[0x1E4F28588];
        v64[0] = @"Invalid persistenceIdentifier specified";
        id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
        id v27 = [v39 errorWithDomain:@"SBSceneManagerDomain" code:1 userInfo:v32];
        id v28 = 0;
        id v29 = 0;
        goto LABEL_23;
      }
      id v35 = a1[6];
      v36 = [MEMORY[0x1E4F62A60] identityForIdentifier:v34];
      uint64_t v37 = [v7 displayIdentity];
      uint64_t v38 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v35 sceneIdentity:v36 displayIdentity:v37];

      id v8 = [v7 fetchOrCreateApplicationSceneHandleForRequest:v38];

      if (!v8)
      {
        id v27 = 0;
        id v28 = 0;
        id v29 = 0;
        goto LABEL_24;
      }
    }
    if ([a1[4] preserveLayout])
    {
      id v9 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      id v10 = [v9 _recentAppLayoutsController];

      id v11 = [a1[6] bundleIdentifier];
      uint64_t v12 = [v10 recentsForBundleIdentifier:v11 includingHiddenAppLayouts:0];

      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_2;
      v57[3] = &unk_1E6AF4B60;
      id v8 = v8;
      id v58 = v8;
      id v13 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v57);
    }
    else
    {
      id v13 = 0;
    }
LABEL_22:
    objc_super v30 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:v8];
    id v31 = [a1[4] actions];
    [(SBApplicationSceneEntity *)v30 addActions:v31];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_3;
    v45[3] = &unk_1E6B07E38;
    id v32 = v30;
    v46 = v32;
    v56 = &v59;
    id v47 = a1[6];
    id v29 = v13;
    id v48 = v29;
    id v49 = v7;
    id v50 = a1[4];
    id v51 = v40;
    id v52 = v6;
    id v53 = a1[5];
    id v54 = v3;
    id v28 = v8;
    id v55 = v28;
    [v54 modifyApplicationContext:v45];

    id v27 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v20 = a1[6];
  v21 = (void *)[v7 newSceneIdentityForApplication:v20];
  id v22 = [v7 displayIdentity];
  id v23 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v20 sceneIdentity:v21 displayIdentity:v22];

  if ([a1[4] requestQuickLookScene])
  {
    id v24 = [v23 sceneDefinition];
    id v25 = (void *)[v24 mutableCopy];

    id v26 = [MEMORY[0x1E4F42D30] specification];
    [v25 setSpecification:v26];

    [v23 setSceneDefinition:v25];
  }
  id v8 = [v7 fetchOrCreateApplicationSceneHandleForRequest:v23];

LABEL_19:
  id v13 = 0;
  id v27 = 0;
  id v28 = 0;
  id v29 = 0;
  if (v8) {
    goto LABEL_22;
  }
LABEL_24:
  if (a1[7])
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_5;
    v41[3] = &unk_1E6AF71F0;
    id v42 = v28;
    id v44 = a1[7];
    id v43 = v27;
    id v33 = (id)[v3 addCompletionHandler:v41];
  }
  _Block_object_dispose(&v59, 8);
}

uint64_t __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sceneIdentifier];
  uint64_t v5 = [v3 containsItemWithUniqueIdentifier:v4];

  return v5;
}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = 1;
  [v3 setWaitsForSceneUpdates:1];
  [v3 setAlwaysRunsWatchdog:1];
  [v3 _setRequestedFrontmostEntity:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setFlag:1 forActivationSetting:56];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    uint64_t v5 = [*(id *)(a1 + 40) bundleIdentifier];
    id v6 = [v3 previousApplicationSceneEntityForBundleID:v5];

    if (v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
    }

    int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  }
  [v3 setBackground:v4 != 0];
  id v7 = *(void **)(a1 + 48);
  if (v7)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_4;
    v39[3] = &unk_1E6AF4F20;
    id v40 = *(id *)(a1 + 56);
    id v41 = v3;
    [v7 enumerate:v39];

    goto LABEL_12;
  }
  if ([*(id *)(a1 + 64) requestFullscreen]
    && ![*(id *)(a1 + 64) requestCenterSlot]
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)
    || [*(id *)(a1 + 72) isEqualToString:*(void *)(a1 + 80)])
  {
    [v3 setActivatingEntity:*(void *)(a1 + 32)];
    goto LABEL_12;
  }
  id v8 = [*(id *)(a1 + 88) switcherController];
  uint64_t v9 = [v8 windowManagementStyle];

  id v10 = [v3 previousLayoutState];
  id v11 = v10;
  if (v9 == 1 && ([v10 layoutContainsRole:2] & 1) == 0) {
    [v3 setRequestedSpaceConfiguration:3];
  }
  if ([*(id *)(a1 + 64) requestCenterSlot])
  {
    uint64_t v12 = [*(id *)(a1 + 40) _dataStore];
    id v13 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v14 = [v12 sceneStoreForIdentifier:v13 creatingIfNecessary:0];
    if (v14)
    {
      BOOL v15 = [NSNumber numberWithBool:*(void *)(a1 + 80) == 0];
      [v14 setObject:v15 forKey:@"originatedInCenterWindow"];

      id v16 = [*(id *)(a1 + 96) centerWindowSourceSceneID];
      if (v16)
      {
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v16 forKey:v13];
        [v14 setObject:v17 forKey:@"sourceSceneIdentifier"];
      }
    }
    uint64_t v18 = 4;
    v19 = [v11 elementWithRole:3];
    id v20 = v19;
    if (v19)
    {
      v21 = [v19 uniqueIdentifier];
      id v22 = v21;
      if (*(void *)(a1 + 72) && objc_msgSend(v21, "containsString:")) {
        uint64_t v18 = 3;
      }
    }
    [v3 setEntity:*(void *)(a1 + 32) forLayoutRole:v18];
    [v3 _setRequestedFrontmostEntity:*(void *)(a1 + 32)];

    goto LABEL_29;
  }
  if (v9 == 2)
  {
    v43[0] = *(void *)(a1 + 32);
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    id v13 = +[SBWorkspaceEntity entity];
    uint64_t v14 = +[SBWorkspaceEntity entity];
    [v3 setEntities:v12 withPolicy:1 centerEntity:v13 floatingEntity:v14];
LABEL_29:

    goto LABEL_30;
  }
  if (v9 == 1)
  {
    id v29 = [v11 elementWithRole:2];
    objc_super v30 = [v29 workspaceEntity];

    uint64_t v31 = objc_opt_class();
    id v32 = __BSSafeCast(v30, v31);
    id v33 = [v32 sceneHandle];
    id v34 = [v33 persistenceIdentifier];
    int v35 = [v34 isEqualToString:*(void *)(a1 + 72)];

    v36 = *(void **)(a1 + 32);
    if (v35)
    {
      [v3 setEntity:v36 forLayoutRole:1];
      v36 = v30;
    }
    [v3 setEntity:v36 forLayoutRole:2];

    goto LABEL_31;
  }
  uint64_t v42 = *(void *)(a1 + 32);
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  uint64_t v37 = +[SBWorkspaceEntity entity];
  uint64_t v38 = +[SBWorkspaceEntity entity];
  [v3 setEntities:v12 startingAtLayoutRole:1 withPolicy:0 centerEntity:v37 floatingEntity:v38];

LABEL_30:
LABEL_31:
  id v23 = [*(id *)(a1 + 64) interactionIdentifier];
  if (v23)
  {
    uint64_t v24 = objc_opt_class();
    id v25 = [*(id *)(a1 + 88) switcherController];
    id v26 = [v25 contentViewController];
    id v27 = SBSafeCast(v24, v26);

    if (v27)
    {
      id v28 = [*(id *)(a1 + 104) sceneIdentifier];
      [v27 associateCenterWindowInteractionIdentifier:v23 withSceneIdentifier:v28];
    }
  }

LABEL_12:
}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  uint64_t v5 = +[SBApplicationController sharedInstance];
  id v6 = [v13 bundleIdentifier];
  id v7 = [v5 applicationWithBundleIdentifier:v6];

  if (v7)
  {
    id v8 = [SBDeviceApplicationSceneEntity alloc];
    uint64_t v9 = [v13 uniqueIdentifier];
    id v10 = *(void **)(a1 + 32);
    id v11 = [v10 displayIdentity];
    uint64_t v12 = [(SBDeviceApplicationSceneEntity *)v8 initWithApplication:v7 uniqueIdentifier:v9 sceneHandleProvider:v10 displayIdentity:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  [*(id *)(a1 + 40) setEntity:v12 forLayoutRole:a2];
}

void __79__SBSceneManagerCoordinator__createSceneForApplication_withOptions_completion___block_invoke_5(uint64_t a1, int a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a2
    && ([*(id *)(a1 + 32) sceneIfExists],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 32) scene];
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 40))
    {
      id v6 = *(void (**)(uint64_t, void))(v5 + 16);
      uint64_t v7 = *(void *)(a1 + 48);
      v6(v7, 0);
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28588];
      v13[0] = @"Scene creation failed";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v10 = [v8 errorWithDomain:@"SBSceneManagerCoordinatorDomain" code:1 userInfo:v9];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v10);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDeactivationManager, 0);
  objc_storeStrong((id *)&self->_workspaceIdentifiersToIgnore, 0);
  objc_storeStrong((id *)&self->_displayIdentityToReferenceMap, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)sceneManager:(os_log_t)log didReceiveSceneRequestWithOptions:fromProcess:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "process (%{public}@) requested scene creation with identifier \"%@\" but a scene with that identifier already exists", (uint8_t *)&v3, 0x16u);
}

- (void)sceneManager:(uint64_t)a1 didReceiveSceneRequestWithOptions:(NSObject *)a2 fromProcess:completion:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "process (%{public}@) requested scene creation but is not a daemon or lacks the entitlement", (uint8_t *)&v2, 0xCu);
}

@end