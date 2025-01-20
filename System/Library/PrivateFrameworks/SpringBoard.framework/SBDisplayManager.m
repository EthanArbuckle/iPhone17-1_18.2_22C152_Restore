@interface SBDisplayManager
- (BOOL)_shouldBlankingRemovePowerForDisplay:(id)a3;
- (FBSDisplayIdentity)mainIdentity;
- (NSArray)connectedIdentities;
- (SBDisplayManager)initWithDisplayManager:(id)a3 sceneManagerCoordinator:(id)a4 assertionCoordinator:(id)a5 powerLogReporter:(id)a6;
- (id)_createAndActivateLayoutPublisherForConnectingDisplay:(id)a3;
- (id)_signpostMetadataForController:(id)a3;
- (id)addObserver:(id)a3;
- (id)configurationForIdentity:(id)a3;
- (id)layoutPublisherForDisplay:(id)a3;
- (int64_t)windowingModeForDisplay:(id)a3;
- (void)_connectControllerWithInfo:(id)a3 toDisplay:(id)a4 configuration:(id)a5;
- (void)_connectToIdentity:(id)a3 withConfiguration:(id)a4 forDisplayManagerInit:(BOOL)a5;
- (void)_deactivateLayoutPublisher:(id)a3 forDisconnectingDisplay:(id)a4;
- (void)_setBlankingRemovesPower:(BOOL)a3 forDisplay:(id)a4;
- (void)_setCloneMirroringMode:(unint64_t)a3 forDisplay:(id)a4;
- (void)_setDisableIdleSleepReason:(id)a3 forDisplay:(id)a4;
- (void)_setDisplayArrangementItem:(id)a3 forDisplay:(id)a4;
- (void)_setPowerLogEntry:(id)a3 forDisplay:(id)a4;
- (void)assertionCoordinator:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5 forDisplay:(id)a6;
- (void)beginMonitoringForExternalDisplays:(id)a3;
- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4;
- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)registerDisplayControllerProvider:(id)a3;
- (void)updateTransformsWithCompletion:(id)a3;
@end

@implementation SBDisplayManager

- (int64_t)windowingModeForDisplay:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"-[SBDisplayManager windowingModeForDisplay:]"];
    [v9 handleFailureInFunction:v10 file:@"SBDisplayManager.m" lineNumber:222 description:@"this call must be made on the main thread"];
  }
  v5 = [(NSMutableDictionary *)self->_identityToWindowingModeMap objectForKey:v4];
  v6 = v5;
  if (v5) {
    int64_t v7 = [v5 integerValue];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = SBLogDisplayControlling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ audioSessionPlaying %d", buf, 0x12u);
  }
  v8 = [(NSMutableDictionary *)self->_rootIdentityToBlankingRemovesPower allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBDisplayManager *)self _setBlankingRemovesPower:[(SBDisplayManager *)self _shouldBlankingRemovePowerForDisplay:*(void *)(*((void *)&v13 + 1) + 8 * v12)] forDisplay:*(void *)(*((void *)&v13 + 1) + 8 * v12)];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (SBDisplayManager)initWithDisplayManager:(id)a3 sceneManagerCoordinator:(id)a4 assertionCoordinator:(id)a5 powerLogReporter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v48.receiver = self;
  v48.super_class = (Class)SBDisplayManager;
  long long v15 = [(SBDisplayManager *)&v48 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayManager, a3);
    objc_storeStrong((id *)&v16->_sceneManagerCoordinator, a4);
    objc_storeStrong((id *)&v16->_assertionCoordinator, a5);
    [(SBDisplayAssertionCoordinator *)v16->_assertionCoordinator setDelegate:v16];
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    connectedIdentityToRecordMap = v16->_connectedIdentityToRecordMap;
    v16->_connectedIdentityToRecordMap = v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    rootIdentityToLayoutPublisherMap = v16->_rootIdentityToLayoutPublisherMap;
    v16->_rootIdentityToLayoutPublisherMap = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    rootIdentityToCADisplayQueueMap = v16->_rootIdentityToCADisplayQueueMap;
    v16->_rootIdentityToCADisplayQueueMap = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    controllerToAssertionMap = v16->_controllerToAssertionMap;
    v16->_controllerToAssertionMap = (NSMapTable *)v23;

    disableIdleSleepReason = v16->_disableIdleSleepReason;
    v16->_disableIdleSleepReason = 0;

    uint64_t v26 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    factories = v16->_factories;
    v16->_factories = (NSHashTable *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    identityToControllerMap = v16->_identityToControllerMap;
    v16->_identityToControllerMap = (NSMutableDictionary *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    identityToWindowingModeMap = v16->_identityToWindowingModeMap;
    v16->_identityToWindowingModeMap = (NSMutableDictionary *)v30;

    objc_storeStrong((id *)&v16->_powerLogReporter, a6);
    v16->_lock._os_unfair_lock_opaque = 0;
    uint64_t v32 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v16->_lock_observers;
    v16->_lock_observers = (NSHashTable *)v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
    rootIdentityToDisableSleepReasons = v16->_rootIdentityToDisableSleepReasons;
    v16->_rootIdentityToDisableSleepReasons = (NSMutableDictionary *)v34;

    uint64_t v36 = [MEMORY[0x1E4F1CA60] dictionary];
    rootIdentityToDisplayArrangementItems = v16->_rootIdentityToDisplayArrangementItems;
    v16->_rootIdentityToDisplayArrangementItems = (NSMutableDictionary *)v36;

    uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
    rootIdentityToCloneMirroringMode = v16->_rootIdentityToCloneMirroringMode;
    v16->_rootIdentityToCloneMirroringMode = (NSMutableDictionary *)v38;

    uint64_t v40 = [MEMORY[0x1E4F1CA60] dictionary];
    rootIdentityToCloneMirroringModeTokens = v16->_rootIdentityToCloneMirroringModeTokens;
    v16->_rootIdentityToCloneMirroringModeTokens = (NSMutableDictionary *)v40;

    uint64_t v42 = [MEMORY[0x1E4F1CA60] dictionary];
    rootIdentityToBlankingRemovesPower = v16->_rootIdentityToBlankingRemovesPower;
    v16->_rootIdentityToBlankingRemovesPower = (NSMutableDictionary *)v42;

    v44 = +[SBAVSystemControllerCache sharedInstance];
    [v44 addObserver:v16];
    v45 = [(FBDisplayManager *)v16->_displayManager mainConfiguration];
    v46 = [v45 identity];
    [(SBDisplayManager *)v16 _connectToIdentity:v46 withConfiguration:v45 forDisplayManagerInit:1];
  }
  return v16;
}

- (void)dealloc
{
  [(FBDisplayManager *)self->_displayManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDisplayManager;
  [(SBDisplayManager *)&v3 dealloc];
}

- (void)beginMonitoringForExternalDisplays:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SBDisplayManager_beginMonitoringForExternalDisplays___block_invoke;
  v6[3] = &unk_1E6AF6828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __55__SBDisplayManager_beginMonitoringForExternalDisplays___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addObserver:");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "connectedIdentities", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v8 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:v7];

        if (!v8)
        {
          uint64_t v9 = *(id **)(a1 + 32);
          uint64_t v10 = [v9[1] configurationForIdentity:v7];
          [v9 _connectToIdentity:v7 withConfiguration:v10 forDisplayManagerInit:1];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)registerDisplayControllerProvider:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v16 = [NSString stringWithUTF8String:"-[SBDisplayManager registerDisplayControllerProvider:]"];
    [v15 handleFailureInFunction:v16 file:@"SBDisplayManager.m" lineNumber:180 description:@"this call must be made on the main thread"];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 181, @"Invalid parameter not satisfying: %@", @"displayControllerFactory" object file lineNumber description];

LABEL_3:
  if ([(NSHashTable *)self->_factories containsObject:v5])
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  [(NSHashTable *)self->_factories addObject:v5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_connectedIdentityToRecordMap;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v12 = [(NSMutableDictionary *)self->_identityToControllerMap objectForKey:v11];

        if (!v12)
        {
          long long v13 = [(FBDisplayManager *)self->_displayManager configurationForIdentity:v11];
          long long v14 = [v5 displayControllerInfoForConnectingDisplay:v11 configuration:v13];
          if (v14) {
            [(SBDisplayManager *)self _connectControllerWithInfo:v14 toDisplay:v11 configuration:v13];
          }
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (id)layoutPublisherForDisplay:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SBDisplayManager layoutPublisherForDisplay:]"];
    [v8 handleFailureInFunction:v9 file:@"SBDisplayManager.m" lineNumber:198 description:@"this call must be made on the main thread"];
  }
  if (([v5 isRootIdentity] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 199, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  v6 = [(NSMutableDictionary *)self->_rootIdentityToLayoutPublisherMap objectForKey:v5];

  return v6;
}

- (id)addObserver:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ([(NSHashTable *)self->_lock_observers containsObject:v5])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 206, @"observer already registered: %@", v5 object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v7 = [NSString stringWithFormat:&stru_1F3084718];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__SBDisplayManager_addObserver___block_invoke;
  v12[3] = &unk_1E6AFA6D0;
  objc_copyWeak(&v14, &location);
  id v8 = v5;
  id v13 = v8;
  uint64_t v9 = (void *)[v6 initWithIdentifier:v7 forReason:@"displayCoordinator" invalidationBlock:v12];

  [(NSHashTable *)self->_lock_observers addObject:v8];
  os_unfair_lock_unlock(&self->_lock);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __32__SBDisplayManager_addObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained + 34;
    uint64_t v4 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 34);
    [v4[18] removeObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(v3);
    WeakRetained = (os_unfair_lock_s *)v4;
  }
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = SBLogFBDisplayManagerCallbacks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _SBFLoggingMethodProem();
    uint64_t v11 = [v8 _sbLoggingDescription];
    int v14 = 138543874;
    long long v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v14,
      0x20u);
  }
  long long v12 = [v8 hardwareIdentifier];
  if (v12) {
    goto LABEL_7;
  }
  if (([v8 isMainDisplay] & 1) == 0)
  {
    long long v12 = SBLogFBDisplayManagerCallbacks();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = _SBFLoggingMethodProem();
      int v14 = 138544130;
      long long v15 = v13;
      __int16 v16 = 2114;
      uint64_t v17 = @"connecting";
      __int16 v18 = 2114;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_error_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v14,
        0x2Au);
    }
LABEL_7:
  }
  [(SBDisplayManager *)self _connectToIdentity:v7 withConfiguration:v8 forDisplayManagerInit:0];
}

- (void)_connectToIdentity:(id)a3 withConfiguration:(id)a4 forDisplayManagerInit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(NSMutableDictionary *)self->_connectedIdentityToRecordMap objectForKey:v9];
  long long v12 = [v10 hardwareIdentifier];
  if (v12)
  {

    goto LABEL_4;
  }
  if ([v10 isMainDisplay])
  {
LABEL_4:
    if ([v11 didConnectAtInit])
    {
      id v13 = SBLogDisplayControlling();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v76 = v9;
LABEL_22:
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
        goto LABEL_59;
      }
    }
    else
    {
      if (v11)
      {
        long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 249, @"told an identity is connecting when we're already tracking it. is frontboard telling us things out of order?: %@", v9 object file lineNumber description];
      }
      __int16 v16 = [[_SBDisplayIdentityRecord alloc] initWithIdentity:v9 connectedAtInit:v5];

      [(NSMutableDictionary *)self->_connectedIdentityToRecordMap setObject:v16 forKey:v9];
      int v17 = [v9 isRootIdentity];
      if (v17)
      {
        [(SBDisplayAssertionCoordinator *)self->_assertionCoordinator rootDisplayDidConnect:v9];
        __int16 v18 = [(NSMutableDictionary *)self->_rootIdentityToLayoutPublisherMap objectForKey:v9];

        if (!v18)
        {
          id v19 = [(SBDisplayManager *)self _createAndActivateLayoutPublisherForConnectingDisplay:v9];
          [(NSMutableDictionary *)self->_rootIdentityToLayoutPublisherMap setObject:v19 forKey:v9];
        }
        __int16 v20 = [(NSMutableDictionary *)self->_rootIdentityToCADisplayQueueMap objectForKey:v9];

        if (!v20)
        {
          id v21 = [NSString stringWithFormat:@"%@:%@:CADisplayMutation", objc_opt_class(), v9];
          uint64_t v22 = [MEMORY[0x1E4F4F730] serial];
          uint64_t v23 = [v22 serviceClass:25];
          int v24 = v17;
          v25 = a2;
          uint64_t v26 = (void *)BSDispatchQueueCreate();

          [(NSMutableDictionary *)self->_rootIdentityToCADisplayQueueMap setObject:v26 forKey:v9];
          a2 = v25;
          int v17 = v24;
        }
        v27 = [(NSMutableDictionary *)self->_rootIdentityToBlankingRemovesPower objectForKey:v9];

        if (!v27) {
          [(SBDisplayManager *)self _setBlankingRemovesPower:[(SBDisplayManager *)self _shouldBlankingRemovePowerForDisplay:v9] forDisplay:v9];
        }
        uint64_t v28 = SBLogDisplayControlling();
        if (os_signpost_enabled(v28))
        {
          *(_DWORD *)buf = 138543362;
          id v76 = v9;
          _os_signpost_emit_with_name_impl(&dword_1D85BA000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_MANAGER_ROOT_DISPLAY_CONNECTED", "%{public}@", buf, 0xCu);
        }

        if ([v9 isExternal])
        {
          dispatch_time_t v29 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __79__SBDisplayManager__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke;
          block[3] = &unk_1E6AF59B8;
          v68 = v16;
          id v69 = v10;
          v70 = self;
          id v71 = v9;
          dispatch_after(v29, MEMORY[0x1E4F14428], block);
        }
        else
        {
          [(SBDisplayAssertionCoordinator *)self->_assertionCoordinator activateAssertionsForDisplay:v9];
        }
      }
      v54 = v16;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v30 = self->_factories;
      uint64_t v31 = [(NSHashTable *)v30 countByEnumeratingWithState:&v63 objects:v74 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        int v52 = v17;
        SEL v51 = a2;
        id v13 = 0;
        uint64_t v33 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v64 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = [*(id *)(*((void *)&v63 + 1) + 8 * i) displayControllerInfoForConnectingDisplay:v9 configuration:v10];
            if (v35)
            {
              if (v13)
              {
                v37 = [MEMORY[0x1E4F28B00] currentHandler];
                objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v51, self, @"SBDisplayManager.m", 294, @"multiple factories want to provide a controller for the same display: %@; how it started: %@; how it's going: %@",
                  v9,
                  v13,
                  v35);
              }
              uint64_t v36 = v35;

              id v13 = v36;
            }
          }
          uint64_t v32 = [(NSHashTable *)v30 countByEnumeratingWithState:&v63 objects:v74 count:16];
        }
        while (v32);

        int v17 = v52;
        if (v13) {
          [(SBDisplayManager *)self _connectControllerWithInfo:v13 toDisplay:v9 configuration:v10];
        }
      }
      else
      {

        id v13 = 0;
      }
      os_unfair_lock_assert_not_owner(&self->_lock);
      os_unfair_lock_lock(&self->_lock);
      uint64_t v38 = (void *)[(NSHashTable *)self->_lock_observers copy];
      os_unfair_lock_unlock(&self->_lock);
      if (v17)
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v53 = v38;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v59 objects:v73 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v60 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              if (objc_opt_respondsToSelector()) {
                [v44 displayManager:self didConnectToRootDisplay:v9];
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v59 objects:v73 count:16];
          }
          while (v41);
        }

        uint64_t v38 = v53;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v45 = v38;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v55 objects:v72 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v47; ++k)
          {
            if (*(void *)v56 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v55 + 1) + 8 * k);
            if (objc_opt_respondsToSelector()) {
              [v50 displayManager:self didConnectIdentity:v9 withConfiguration:v10];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v55 objects:v72 count:16];
        }
        while (v47);
      }

      uint64_t v11 = v54;
    }
    goto LABEL_59;
  }
  id v13 = SBLogDisplayControlling();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v76 = v9;
    int v14 = "got a connect for an external display that is missing its hardwareIdentifier. ignoring: %{public}@";
    goto LABEL_22;
  }
LABEL_59:
}

uint64_t __79__SBDisplayManager__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    uint64_t v3 = SBLogDisplayAssertions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "activating assertions for configuration: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    return [*(id *)(*(void *)(a1 + 48) + 24) activateAssertionsForDisplay:*(void *)(a1 + 56)];
  }
  return result;
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = SBLogFBDisplayManagerCallbacks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = _SBFLoggingMethodProem();
    uint64_t v11 = [v8 _sbLoggingDescription];
    int v20 = 138543874;
    id v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    id v25 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v20,
      0x20u);
  }
  long long v12 = [v8 hardwareIdentifier];
  if (!v12)
  {
    if ([v8 isMainDisplay]) {
      goto LABEL_8;
    }
    long long v12 = SBLogFBDisplayManagerCallbacks();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v19 = _SBFLoggingMethodProem();
      int v20 = 138544130;
      id v21 = v19;
      __int16 v22 = 2114;
      uint64_t v23 = @"updating";
      __int16 v24 = 2114;
      id v25 = v7;
      __int16 v26 = 2114;
      id v27 = v8;
      _os_log_error_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v20,
        0x2Au);
    }
  }

LABEL_8:
  id v13 = [(NSMutableDictionary *)self->_connectedIdentityToRecordMap objectForKey:v7];
  if (v13)
  {
    int v14 = [(NSMutableDictionary *)self->_identityToControllerMap objectForKey:v7];
    if (v14)
    {
      long long v15 = SBLogDisplayControlling();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __int16 v16 = _SBFLoggingMethodProem();
        if (objc_opt_respondsToSelector())
        {
          [v14 signpostDescription];
        }
        else
        {
          int v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
        }
        __int16 v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v20 = 138543874;
        id v21 = v16;
        __int16 v22 = 2114;
        uint64_t v23 = v18;
        __int16 v24 = 2114;
        id v25 = v8;
        _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ => %{public}@", (uint8_t *)&v20, 0x20u);
      }
      [v14 displayIdentityDidUpdate:v7 configuration:v8];
    }
  }
  else
  {
    int v14 = SBLogDisplayControlling();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      id v21 = v7;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "got an update for an identity that we aren't tracking. ignoring update: %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(FBDisplayManager *)self->_displayManager configurationForIdentity:v6];
  id v8 = SBLogFBDisplayManagerCallbacks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = _SBFLoggingMethodProem();
    id v10 = [v7 _sbLoggingDescription];
    *(_DWORD *)buf = 138543874;
    id v48 = v9;
    __int16 v49 = 2114;
    v50 = v10;
    __int16 v51 = 2114;
    id v52 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      buf,
      0x20u);
  }
  uint64_t v11 = [v7 hardwareIdentifier];
  if (!v11)
  {
    if ([v7 isMainDisplay]) {
      goto LABEL_8;
    }
    uint64_t v11 = SBLogFBDisplayManagerCallbacks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138544130;
      id v48 = v33;
      __int16 v49 = 2114;
      v50 = @"disconnecting";
      __int16 v51 = 2114;
      id v52 = v6;
      __int16 v53 = 2114;
      v54 = v7;
      _os_log_error_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        buf,
        0x2Au);
    }
  }

LABEL_8:
  uint64_t v12 = [(NSMutableDictionary *)self->_connectedIdentityToRecordMap objectForKey:v6];
  id v13 = (void *)v12;
  if (v12)
  {
    SEL v35 = a2;
    uint64_t v36 = (void *)v12;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    int v14 = (void *)[(NSHashTable *)self->_lock_observers copy];
    os_unfair_lock_unlock(&self->_lock);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          int v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v20 displayManager:self willDisconnectIdentity:v6];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v17);
    }

    id v21 = [(NSMutableDictionary *)self->_identityToControllerMap objectForKey:v6];
    if (v21)
    {
      __int16 v22 = [(NSMapTable *)self->_controllerToAssertionMap objectForKey:v21];
      [(SBDisplayAssertionCoordinator *)self->_assertionCoordinator invalidateAssertionForDerivedDisplayDisconnect:v22];
      [v21 displayIdentityDidDisconnect:v6];
      uint64_t v23 = SBLogDisplayControlling();
      if (os_signpost_enabled(v23))
      {
        __int16 v24 = [(SBDisplayManager *)self _signpostMetadataForController:v21];
        *(_DWORD *)buf = 138543362;
        id v48 = v24;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_MANAGER_CONTROLLER_TAKES_THE_WHEEL", "%{public}@", buf, 0xCu);
      }
      [(NSMutableDictionary *)self->_identityToControllerMap removeObjectForKey:v6];
      [(NSMutableDictionary *)self->_identityToWindowingModeMap removeObjectForKey:v6];
      [(NSMapTable *)self->_controllerToAssertionMap removeObjectForKey:v21];
    }
    if ([v6 isRootIdentity])
    {
      [(SBDisplayAssertionCoordinator *)self->_assertionCoordinator rootDisplayDidDisconnect:v6];
      id v25 = [(NSMutableDictionary *)self->_rootIdentityToLayoutPublisherMap objectForKey:v6];
      if (!v25)
      {
        uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:v35, self, @"SBDisplayManager.m", 383, @"we don't have a publisher for a disconnecting display: %@", v6 object file lineNumber description];
      }
      [(SBDisplayManager *)self _deactivateLayoutPublisher:v25 forDisconnectingDisplay:v6];
      [(NSMutableDictionary *)self->_rootIdentityToLayoutPublisherMap removeObjectForKey:v6];
      [(NSMutableDictionary *)self->_rootIdentityToCADisplayQueueMap removeObjectForKey:v6];
      [(NSMutableDictionary *)self->_rootIdentityToBlankingRemovesPower removeObjectForKey:v6];
    }
    [v36 invalidate];
    [(NSMutableDictionary *)self->_connectedIdentityToRecordMap removeObjectForKey:v6];
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    __int16 v26 = (void *)[(NSHashTable *)self->_lock_observers copy];

    os_unfair_lock_unlock(&self->_lock);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v27 = v26;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v32 displayManager:self didDisconnectIdentity:v6];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v29);
    }

    id v13 = v36;
  }
  else
  {
    id v27 = SBLogDisplayControlling();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v48 = v6;
      _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "got a disconnect for an identity that we aren't tracking. ignoring disconnect: %{public}@", buf, 0xCu);
    }
  }
}

- (void)assertionCoordinator:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5 forDisplay:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  id v9 = a4;
  id v10 = SBLogDisplayControlling();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = _SBFLoggingMethodProem();
    int v17 = 138543362;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. reevaluating", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v12 = [v9 powerLogEntry];
  [(SBDisplayManager *)self _setPowerLogEntry:v12 forDisplay:v8];

  id v13 = [v9 displayArrangement];
  [(SBDisplayManager *)self _setDisplayArrangementItem:v13 forDisplay:v8];

  -[SBDisplayManager _setCloneMirroringMode:forDisplay:](self, "_setCloneMirroringMode:forDisplay:", [v9 cloneMirroringMode], v8);
  int v14 = [v9 disableSystemIdleSleepReason];

  [(SBDisplayManager *)self _setDisableIdleSleepReason:v14 forDisplay:v8];
  id v15 = SBLogDisplayControlling();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = _SBFLoggingMethodProem();
    int v17 = 138543362;
    uint64_t v18 = v16;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. done reevaluating", (uint8_t *)&v17, 0xCu);
  }
}

- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogDisplayControlling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ activeAudioRoute %@", buf, 0x16u);
  }
  id v8 = [(NSMutableDictionary *)self->_rootIdentityToBlankingRemovesPower allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBDisplayManager *)self _setBlankingRemovesPower:[(SBDisplayManager *)self _shouldBlankingRemovePowerForDisplay:*(void *)(*((void *)&v13 + 1) + 8 * v12)] forDisplay:*(void *)(*((void *)&v13 + 1) + 8 * v12)];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)_shouldBlankingRemovePowerForDisplay:(id)a3
{
  if ([a3 isExternal])
  {
    uint64_t v3 = +[SBAVSystemControllerCache sharedInstance];
    int v4 = [v3 isAudioSessionPlaying];
    id v5 = [v3 activeAudioRoute];
    id v6 = v5;
    if (v4)
    {
      if ([v5 isEqual:@"HDMI"]) {
        LOBYTE(v7) = 0;
      }
      else {
        int v7 = [v6 isEqual:@"HDMIOutput"] ^ 1;
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_setBlankingRemovesPower:(BOOL)a3 forDisplay:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 isExternal])
  {
    int v7 = [(NSMutableDictionary *)self->_rootIdentityToBlankingRemovesPower objectForKey:v6];
    id v8 = v7;
    if (!v7 || [v7 BOOLValue] != v4)
    {
      rootIdentityToBlankingRemovesPower = self->_rootIdentityToBlankingRemovesPower;
      uint64_t v10 = [NSNumber numberWithBool:v4];
      [(NSMutableDictionary *)rootIdentityToBlankingRemovesPower setObject:v10 forKey:v6];

      uint64_t v11 = [(FBDisplayManager *)self->_displayManager configurationForIdentity:v6];
      uint64_t v12 = [v11 hardwareIdentifier];
      long long v13 = SBLogDisplayControlling();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = _SBFLoggingMethodProem();
        int v15 = 138544898;
        long long v16 = v14;
        __int16 v17 = 2114;
        id v18 = v6;
        __int16 v19 = 2114;
        __int16 v20 = v12;
        __int16 v21 = 1024;
        int v22 = [v6 isMainDisplay];
        __int16 v23 = 1024;
        int v24 = [v6 isExternal];
        __int16 v25 = 1024;
        int v26 = [v6 isRootIdentity];
        __int16 v27 = 1024;
        BOOL v28 = v4;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ identity %{public}@ UUID %{public}@ main %d external %d root %d blankingRemovesPower %d", (uint8_t *)&v15, 0x38u);
      }
      BKSDisplayServicesSetBlankingRemovesPower();
    }
  }
}

- (void)_setDisplayArrangementItem:(id)a3 forDisplay:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_rootIdentityToDisplayArrangementItems objectForKey:v7];
  if (([(id)v8 isEqual:v6] & 1) == 0 && v6 | v8)
  {
    rootIdentityToDisplayArrangementItems = self->_rootIdentityToDisplayArrangementItems;
    id v30 = v7;
    if (v6) {
      [(NSMutableDictionary *)rootIdentityToDisplayArrangementItems setObject:v6 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)rootIdentityToDisplayArrangementItems removeObjectForKey:v7];
    }
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_rootIdentityToDisplayArrangementItems, "count", v8));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = self->_rootIdentityToDisplayArrangementItems;
    uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v33 = *(void *)v35;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v35 != v33) {
            objc_enumerationMutation(obj);
          }
          long long v13 = [(FBDisplayManager *)self->_displayManager configurationForIdentity:*(void *)(*((void *)&v34 + 1) + 8 * v12)];
          long long v14 = [v13 hardwareIdentifier];
          displayManager = self->_displayManager;
          long long v16 = [(id)v6 relativeDisplayIdentity];
          __int16 v17 = [(FBDisplayManager *)displayManager configurationForIdentity:v16];

          id v18 = [v17 hardwareIdentifier];
          if (v14)
          {
            id v19 = objc_alloc(MEMORY[0x1E4F4F248]);
            uint64_t v20 = [(id)v6 edge];
            [(id)v6 offset];
            __int16 v21 = objc_msgSend(v19, "initWithDisplayUUID:relativeToDisplayUUID:alongEdge:atOffset:", v14, v18, v20);
            [v32 addObject:v21];
          }
          else
          {
            __int16 v21 = SBLogDisplayControlling();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              int v22 = _SBFLoggingMethodProem();
              *(_DWORD *)buf = 138544386;
              long long v39 = v22;
              __int16 v40 = 2114;
              long long v41 = v13;
              __int16 v42 = 2114;
              unint64_t v43 = 0;
              __int16 v44 = 2114;
              id v45 = v17;
              __int16 v46 = 2114;
              uint64_t v47 = v18;
              _os_log_fault_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_FAULT, "%{public}@ got nil displayUUIDs, which shouldn't be happening for newly active assertions. rootDisplayConfig: %{public}@; rootDisplayUUID: %{public}@; relativeDisplayConfig: %{public}@; relativeDisplayUUID: %{public}@",
                buf,
                0x34u);
            }
          }

          ++v12;
        }
        while (v11 != v12);
        uint64_t v11 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v11);
    }

    __int16 v23 = SBLogDisplayControlling();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      id v7 = v30;
      if (v24)
      {
        __int16 v25 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138544130;
        long long v39 = v25;
        __int16 v40 = 2114;
        long long v41 = v30;
        __int16 v42 = 2114;
        unint64_t v43 = v6;
        __int16 v44 = 2114;
        id v45 = v32;
        int v26 = "%{public}@ %{public}@ display arrangement item changed: %{public}@\n"
              "updating backboard with global arrangement: %{public}@";
        __int16 v27 = v23;
        uint32_t v28 = 42;
LABEL_22:
        _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
    else
    {
      id v7 = v30;
      if (v24)
      {
        __int16 v25 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543874;
        long long v39 = v25;
        __int16 v40 = 2114;
        long long v41 = v30;
        __int16 v42 = 2114;
        unint64_t v43 = (unint64_t)v32;
              "updating backboard with global arrangement: %{public}@";
        __int16 v27 = v23;
        uint32_t v28 = 32;
        goto LABEL_22;
      }
    }

    BKSDisplayServicesSetArrangement();
    uint64_t v8 = v29;
  }
}

- (void)_setPowerLogEntry:(id)a3 forDisplay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isRootIdentity])
  {
    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 502, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];

    if (v7) {
      goto LABEL_6;
    }
  }
  uint64_t v9 = SBLogDisplayControlling();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SBDisplayManager _setPowerLogEntry:forDisplay:]((uint64_t)self, (uint64_t)a2, v9);
  }

  uint64_t v10 = [(FBDisplayManager *)self->_displayManager configurationForIdentity:v8];
  id v7 = +[SBDisplayPowerLogEntry forDisplay:v10 mode:0 zoom:0];

LABEL_6:
  [(SBDisplayPowerLogReporter *)self->_powerLogReporter reportPowerLogEntry:v7];
}

- (void)_setCloneMirroringMode:(unint64_t)a3 forDisplay:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (([v7 isRootIdentity] & 1) == 0)
  {
    __int16 v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 514, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  id v8 = [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringMode objectForKey:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (!a3)
  {
    uint64_t v12 = SBLogDisplayControlling();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = _SBFLoggingMethodProem();
      long long v14 = SBDisplayCloneMirroringModeDescription(0);
      *(_DWORD *)buf = 138543618;
      id v30 = v13;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
    }
    int v15 = [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringModeTokens objectForKey:v7];
    [v15 invalidate];
    [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringMode removeObjectForKey:v7];
    goto LABEL_18;
  }
  if (v9 != a3)
  {
    rootIdentityToCloneMirroringMode = self->_rootIdentityToCloneMirroringMode;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)rootIdentityToCloneMirroringMode setObject:v11 forKey:v7];

    if (a3 != 1 && a3 != 2)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBDisplayManager.m", 535, @"unexpected mirroring mode: %lu", a3);
    }
    if ([v7 isMainDisplay])
    {
      int v15 = SBLogDisplayControlling();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = _SBFLoggingMethodProem();
        id v18 = SBDisplayCloneMirroringModeDescription(v9);
        id v19 = SBDisplayCloneMirroringModeDescription(a3);
        *(_DWORD *)buf = 138543874;
        id v30 = v17;
        __int16 v31 = 2114;
        uint64_t v32 = v18;
        __int16 v33 = 2114;
        long long v34 = v19;
      }
    }
    else
    {
      int v15 = [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringModeTokens objectForKey:v7];
      uint32_t v28 = [(FBDisplayManager *)self->_displayManager configurationForIdentity:v7];
      uint64_t v20 = [v28 hardwareIdentifier];
      __int16 v21 = BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay();
      int v22 = SBLogDisplayControlling();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = _SBFLoggingMethodProem();
        BOOL v24 = SBDisplayCloneMirroringModeDescription(v9);
        __int16 v25 = SBDisplayCloneMirroringModeDescription(a3);
        int v26 = NSStringFromBKSDisplayServicesCloneMirroringMode();
        *(_DWORD *)buf = 138544130;
        id v30 = v23;
        __int16 v31 = 2114;
        uint64_t v32 = v24;
        __int16 v33 = 2114;
        long long v34 = v25;
        __int16 v35 = 2114;
        long long v36 = v26;
      }
      [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringModeTokens setObject:v21 forKey:v7];
      [v15 invalidate];
    }
LABEL_18:
  }
}

- (void)_setDisableIdleSleepReason:(id)a3 forDisplay:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (unint64_t)a3;
  id v8 = a4;
  if (([v8 isRootIdentity] & 1) == 0)
  {
    BOOL v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 558, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_rootIdentityToDisableSleepReasons objectForKey:v8];
  if (([(id)v9 isEqualToString:v7] & 1) == 0 && v7 | v9)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_rootIdentityToDisableSleepReasons count];
    rootIdentityToDisableSleepReasons = self->_rootIdentityToDisableSleepReasons;
    if (v7) {
      [(NSMutableDictionary *)rootIdentityToDisableSleepReasons setObject:v7 forKey:v8];
    }
    else {
      [(NSMutableDictionary *)rootIdentityToDisableSleepReasons removeObjectForKey:v8];
    }
    uint64_t v12 = [(NSMutableDictionary *)self->_rootIdentityToDisableSleepReasons count];
    long long v13 = [(NSMutableDictionary *)self->_rootIdentityToDisableSleepReasons allValues];
    long long v14 = [v13 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    int v15 = [v14 componentsJoinedByString:@"|"];
    long long v16 = [MEMORY[0x1E4F624C8] sharedInstance];
    __int16 v17 = v16;
    if (v12) {
      [v16 setSystemIdleSleepDisabled:1 forReason:v15];
    }
    if (v10) {
      [v17 setSystemIdleSleepDisabled:0 forReason:self->_disableIdleSleepReason];
    }
    id v18 = SBLogDisplayControlling();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v19 = v12 != 0;
      uint64_t v20 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138544130;
      int v26 = v20;
      if (v9) {
        int v22 = (__CFString *)v9;
      }
      else {
      __int16 v27 = 2114;
      }
      if (v15) {
        __int16 v21 = (__CFString *)v15;
      }
      uint32_t v28 = v22;
      __int16 v29 = 2114;
      id v30 = v21;
      __int16 v31 = 1024;
      BOOL v32 = v19;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ idle sleep reason changed from %{public}@ to %{public}@; idle sleep disabled: %{BOOL}u",
        buf,
        0x26u);
    }
    disableIdleSleepReason = self->_disableIdleSleepReason;
    self->_disableIdleSleepReason = v15;
  }
}

- (void)_connectControllerWithInfo:(id)a3 toDisplay:(id)a4 configuration:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  identityToControllerMap = self->_identityToControllerMap;
  id v36 = a5;
  uint64_t v12 = [(NSMutableDictionary *)identityToControllerMap objectForKey:v10];
  if (v12)
  {
    long long v13 = [(NSMutableDictionary *)self->_identityToWindowingModeMap objectForKey:v10];
    unint64_t v14 = [v13 unsignedIntegerValue];

    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v16 = SBDisplayWindowingModeDescription(v14);
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBDisplayManager.m", 589, @"already have a controller for display: %@; existing: %@; existingWindowingMode: %@; new: %@",
      v10,
      v12,
      v16,
      v9);
  }
  uint64_t v37 = (void *)v12;
  uint64_t v17 = [v9 priorityLevel];
  if (!SBDisplayAssertionLevelIsValid(v17))
  {
    long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v35 = SBDisplayAssertionLevelDescription(v17);
    [v34 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 593, @"invalid priorityLevel: %@", v35 object file lineNumber description];
  }
  id v18 = [v9 displayController];
  uint64_t v19 = [v9 windowingMode];
  uint64_t v20 = [v9 deactivationReasons];
  [(NSMutableDictionary *)self->_identityToControllerMap setObject:v18 forKey:v10];
  identityToWindowingModeMap = self->_identityToWindowingModeMap;
  int v22 = [NSNumber numberWithInteger:v19];
  [(NSMutableDictionary *)identityToWindowingModeMap setObject:v22 forKey:v10];

  __int16 v23 = [(SBSceneManagerCoordinator *)self->_sceneManagerCoordinator sceneManagerForDisplayIdentity:v10];
  rootIdentityToCADisplayQueueMap = self->_rootIdentityToCADisplayQueueMap;
  __int16 v25 = [v10 rootIdentity];
  int v26 = [(NSMutableDictionary *)rootIdentityToCADisplayQueueMap objectForKey:v25];

  assertionCoordinator = self->_assertionCoordinator;
  uint32_t v28 = [v10 rootIdentity];
  __int16 v29 = [(SBDisplayAssertionCoordinator *)assertionCoordinator acquireAssertionForDisplay:v28 level:v17 deactivationReasons:v20 delegate:v18];

  [(NSMapTable *)self->_controllerToAssertionMap setObject:v29 forKey:v18];
  id v30 = SBLogDisplayControlling();
  if (os_signpost_enabled(v30))
  {
    __int16 v31 = [(SBDisplayManager *)self _signpostMetadataForController:v18];
    *(_DWORD *)buf = 138543362;
    long long v39 = v31;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_MANAGER_CONTROLLER_TAKES_THE_WHEEL", "%{public}@", buf, 0xCu);
  }
  BOOL v32 = SBLogDisplayControlling();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    long long v39 = v33;
    __int16 v40 = 2114;
    id v41 = v9;
    _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ connecting new controllerInfo: %{public}@", buf, 0x16u);
  }
  [v18 connectToDisplayIdentity:v10 configuration:v36 displayManager:self sceneManager:v23 caDisplayQueue:v26 assertion:v29];
}

- (id)_createAndActivateLayoutPublisherForConnectingDisplay:(id)a3
{
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 612, @"Invalid parameter not satisfying: %@", @"[connectingDisplay isRootIdentity]" object file lineNumber description];
  }
  if ([v5 isMainDisplay])
  {
    unint64_t v6 = [MEMORY[0x1E4F62438] sharedInstance];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F62968]);
    [v7 setDomainIdentifier:@"com.apple.frontboard"];
    id v8 = SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay();
    [v7 setInstanceIdentifier:v8];

    unint64_t v6 = [MEMORY[0x1E4F62960] publisherWithConfiguration:v7];
    if (!v6)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 619, @"failed to create publisher with config: %@", v7 object file lineNumber description];
    }
    [v6 activate];
  }
  return v6;
}

- (void)_deactivateLayoutPublisher:(id)a3 forDisconnectingDisplay:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (([v7 isRootIdentity] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 629, @"Invalid parameter not satisfying: %@", @"[disconnectingDisplay isRootIdentity]" object file lineNumber description];
  }
  if (([v7 isMainDisplay] & 1) == 0)
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v13;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v11 = v10;

    [v11 invalidate];
  }
}

- (id)_signpostMetadataForController:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 signpostDescription];
  }
  else {
  BOOL v4 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v3];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIdentityToBlankingRemovesPower, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_identityToWindowingModeMap, 0);
  objc_storeStrong((id *)&self->_identityToControllerMap, 0);
  objc_storeStrong((id *)&self->_factories, 0);
  objc_storeStrong((id *)&self->_powerLogReporter, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringModeTokens, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringMode, 0);
  objc_storeStrong((id *)&self->_rootIdentityToDisplayArrangementItems, 0);
  objc_storeStrong((id *)&self->_rootIdentityToDisableSleepReasons, 0);
  objc_storeStrong((id *)&self->_disableIdleSleepReason, 0);
  objc_storeStrong((id *)&self->_controllerToAssertionMap, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCADisplayQueueMap, 0);
  objc_storeStrong((id *)&self->_rootIdentityToLayoutPublisherMap, 0);
  objc_storeStrong((id *)&self->_connectedIdentityToRecordMap, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_sceneManagerCoordinator, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
}

- (void)updateTransformsWithCompletion:(id)a3
{
}

- (NSArray)connectedIdentities
{
  return (NSArray *)[(NSMutableDictionary *)self->_connectedIdentityToRecordMap allKeys];
}

- (FBSDisplayIdentity)mainIdentity
{
  return (FBSDisplayIdentity *)[(FBDisplayManager *)self->_displayManager mainIdentity];
}

- (id)configurationForIdentity:(id)a3
{
  return (id)[(FBDisplayManager *)self->_displayManager configurationForIdentity:a3];
}

- (void)_setPowerLogEntry:(NSObject *)a3 forDisplay:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  unint64_t v6 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ creating invalid PowerLog entry as we're probably going away", (uint8_t *)&v5, 0xCu);
}

@end