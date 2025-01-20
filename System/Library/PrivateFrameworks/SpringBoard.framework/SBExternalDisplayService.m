@interface SBExternalDisplayService
- (BOOL)_identityParticipatesInExternalDisplayService:(id)a3;
- (SBExternalDisplayService)initWithDisplayManager:(id)a3;
- (SBExternalDisplayService)initWithDisplayManager:(id)a3 serviceListenerFactory:(id)a4 connectedDisplayInfoFactory:(id)a5;
- (id)_displayInfoForDisplayIdentity:(id)a3 configuration:(id)a4;
- (id)_extendedModeDisplayConfigurationForHardwareIdentifier:(id)a3 error:(id *)a4;
- (id)preferredArrangementOfDisplay:(id)a3 relativeTo:(id)a4;
- (id)preferredArrangementOfExternalDisplay:(id)a3;
- (void)_notifyOfPropertyChangesForDisplayConfiguration:(id)a3 requestingClient:(id)a4;
- (void)addObserver:(id)a3;
- (void)client:(id)a3 getConnectedDisplayInfoWithCompletion:(id)a4;
- (void)client:(id)a3 setDisplayArrangement:(id)a4 forDisplay:(id)a5;
- (void)client:(id)a3 setDisplayMirroringEnabled:(id)a4 forDisplay:(id)a5;
- (void)client:(id)a3 setDisplayModeSettings:(id)a4 forDisplay:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayManager:(id)a3 willDisconnectIdentity:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation SBExternalDisplayService

- (SBExternalDisplayService)initWithDisplayManager:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SBExternalDisplayServiceConnectionListenerFactory);
  v6 = objc_alloc_init(SBSConnectedDisplayInfoFactory);
  v7 = [(SBExternalDisplayService *)self initWithDisplayManager:v4 serviceListenerFactory:v5 connectedDisplayInfoFactory:v6];

  return v7;
}

- (SBExternalDisplayService)initWithDisplayManager:(id)a3 serviceListenerFactory:(id)a4 connectedDisplayInfoFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBExternalDisplayService;
  v12 = [(SBExternalDisplayService *)&v23 init];
  if (v12)
  {
    v13 = +[SBDefaults localDefaults];
    uint64_t v14 = [v13 externalDisplayDefaults];
    defaults = v12->_defaults;
    v12->_defaults = (SBExternalDisplayDefaults *)v14;

    objc_storeStrong((id *)&v12->_displayManager, a3);
    objc_storeStrong((id *)&v12->_connectedDisplayInfoFactory, a5);
    uint64_t v16 = [(SBDisplayManager *)v12->_displayManager addObserver:v12];
    displayManagerObserverToken = v12->_displayManagerObserverToken;
    v12->_displayManagerObserverToken = (BSInvalidatable *)v16;

    uint64_t v18 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v12->_serviceQueue;
    v12->_serviceQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [v10 newExternalDisplayServiceListenerForDelegate:v12 serviceQueue:v12->_serviceQueue];
    serviceConnectionListener = v12->_serviceConnectionListener;
    v12->_serviceConnectionListener = (_SBExternalDisplayServiceConnectionListening *)v20;

    [(_SBExternalDisplayServiceConnectionListening *)v12->_serviceConnectionListener activate];
  }

  return v12;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_displayManagerObserverToken invalidate];
  [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayService;
  [(SBExternalDisplayService *)&v3 dealloc];
}

- (id)preferredArrangementOfExternalDisplay:(id)a3
{
  displayManager = self->_displayManager;
  id v5 = a3;
  v6 = [(SBDisplayManager *)displayManager mainIdentity];
  v7 = +[SBDisplayArrangementItem preferredArrangementOfDisplay:v5 relativeTo:v6 preferences:self->_defaults];

  return v7;
}

- (id)preferredArrangementOfDisplay:(id)a3 relativeTo:(id)a4
{
  return +[SBDisplayArrangementItem preferredArrangementOfDisplay:a3 relativeTo:a4 preferences:self->_defaults];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)client:(id)a3 getConnectedDisplayInfoWithCompletion:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __73__SBExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) connectedIdentities];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
      if (objc_msgSend(*(id *)(a1 + 32), "_identityParticipatesInExternalDisplayService:", v7, (void)v13)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = *(id **)(a1 + 32);
    id v10 = [v9[3] configurationForIdentity:v7];
    id v11 = [v9 _displayInfoForDisplayIdentity:v7 configuration:v10];

    uint64_t v8 = *(void *)(a1 + 40);
    if (!v11) {
      goto LABEL_12;
    }
    v17 = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v12, 0);
  }
  else
  {
LABEL_9:

    uint64_t v8 = *(void *)(a1 + 40);
LABEL_12:
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void)client:(id)a3 setDisplayArrangement:(id)a4 forDisplay:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v12 = a5;
  long long v13 = v8;
  id v9 = v8;
  id v10 = v12;
  id v11 = v7;
  BSDispatchMain();
}

void __68__SBExternalDisplayService_client_setDisplayArrangement_forDisplay___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v3;
    __int16 v29 = 2114;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ is setting displayArrangement for display: %{public}@", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v25 = 0;
  id v7 = [v5 _extendedModeDisplayConfigurationForHardwareIdentifier:v6 error:&v25];
  id v8 = v25;
  if (v7)
  {
    uint64_t v9 = [*(id *)(a1 + 56) edge];
    [*(id *)(a1 + 56) offset];
    double v11 = v10;
    if (v9 != [*(id *)(*(void *)(a1 + 48) + 32) arrangementEdge]
      || ([*(id *)(*(void *)(a1 + 48) + 32) arrangementOffset], v11 != v12))
    {
      [*(id *)(*(void *)(a1 + 48) + 32) setArrangementEdge:v9];
      [*(id *)(*(void *)(a1 + 48) + 32) setArrangementOffset:v11];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v13 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 56), "copy", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * v17++) externalDisplayServiceDidUpdatePreferredDisplayArrangement:*(void *)(a1 + 48)];
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v15);
      }

      [*(id *)(a1 + 48) _notifyOfPropertyChangesForDisplayConfiguration:v7 requestingClient:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v18 = SBLogDisplayControlling();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v19;
      __int16 v29 = 2114;
      uint64_t v30 = v20;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ cannot set display arrangement for display: %{public}@ due to error: %{public}@", buf, 0x20u);
    }
  }
}

- (void)client:(id)a3 setDisplayMirroringEnabled:(id)a4 forDisplay:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  BSDispatchMain();
}

void __73__SBExternalDisplayService_client_setDisplayMirroringEnabled_forDisplay___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) BOOLValue];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v3;
    __int16 v21 = 1024;
    int v22 = v4;
    __int16 v23 = 2114;
    uint64_t v24 = v5;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ is setting mirroringEnabled %{BOOL}u for display: %{public}@", buf, 0x1Cu);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v18 = 0;
  id v8 = [v6 _extendedModeDisplayConfigurationForHardwareIdentifier:v7 error:&v18];
  id v9 = v18;
  if (v8)
  {
    uint64_t v10 = [*(id *)(a1 + 40) BOOLValue];
    if (v10 != [*(id *)(*(void *)(a1 + 56) + 32) isMirroringEnabled])
    {
      id v11 = SBLogDisplayControlling();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = v10;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: setting mirroringEnabled to: %{BOOL}u", buf, 8u);
      }

      id v12 = +[SBDefaults localDefaults];
      long long v13 = [v12 appSwitcherDefaults];
      [v13 setShouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates:0];

      [*(id *)(*(void *)(a1 + 56) + 32) setMirroringEnabled:v10];
      [*(id *)(a1 + 56) _notifyOfPropertyChangesForDisplayConfiguration:v8 requestingClient:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v14 = SBLogDisplayControlling();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = [*(id *)(a1 + 40) BOOLValue];
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v15;
      __int16 v21 = 1024;
      int v22 = v16;
      __int16 v23 = 2114;
      uint64_t v24 = v17;
      __int16 v25 = 2114;
      id v26 = v9;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ cannot set mirroringEnabled %{BOOL}u for display: %{public}@ due to error: %{public}@", buf, 0x26u);
    }
  }
}

- (void)client:(id)a3 setDisplayModeSettings:(id)a4 forDisplay:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v18 = v11;
  id v19 = a5;
  uint64_t v20 = v12;
  id v21 = a6;
  id v22 = a7;
  id v13 = v22;
  id v14 = v21;
  id v15 = v12;
  id v16 = v19;
  id v17 = v11;
  BSDispatchMain();
}

void __95__SBExternalDisplayService_client_setDisplayModeSettings_forDisplay_options_completionHandler___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v3;
    __int16 v25 = 2114;
    uint64_t v26 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ is setting displayMode settings for display: %{public}@", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v22 = 0;
  uint64_t v7 = [v5 _extendedModeDisplayConfigurationForHardwareIdentifier:v6 error:&v22];
  id v8 = v22;
  if (v7)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4FA5E58], "withDisplay:useNativeSize:", v7, objc_msgSend(*(id *)(*(void *)(a1 + 48) + 32), "chamois"));
    uint64_t v10 = [v9 supportedScales];

    [*(id *)(a1 + 56) scale];
    if ((SBSDisplayScaleMaskFromScale() & ~v10) != 0)
    {
      id v16 = @"<nil>";
      if (*(void *)(a1 + 40)) {
        id v16 = *(__CFString **)(a1 + 40);
      }
      __int16 v29 = @"displayHardwareIdentifier";
      v30[0] = v16;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA6FD0] code:3 userInfo:v14];

      id v8 = (id)v17;
    }
    else
    {
      char v11 = [*(id *)(a1 + 64) integerValue];
      id v12 = (void *)MEMORY[0x1E4F1CA80];
      id v13 = [MEMORY[0x1E4FA5E50] forDisplay:v7];
      id v14 = [v12 setWithObject:v13];

      if ((v11 & 2) != 0)
      {
        id v15 = objc_msgSend(MEMORY[0x1E4FA5E50], "forDisplaysSimilarToDisplay:useNativeSize:", v7, objc_msgSend(*(id *)(*(void *)(a1 + 48) + 32), "chamois"));
        [v14 addObject:v15];
      }
      [*(id *)(*(void *)(a1 + 48) + 32) setDisplayModeSettings:*(void *)(a1 + 56) forDisplaysMatchingPredicates:v14];
      [*(id *)(a1 + 48) _notifyOfPropertyChangesForDisplayConfiguration:v7 requestingClient:*(void *)(a1 + 32)];
    }
  }
  if (v8)
  {
    id v18 = SBLogDisplayControlling();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      id v28 = v8;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ cannot set displayMode settings for display: %{public}@ due to error: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v21 = *(void *)(a1 + 72);
  if (v21) {
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v8);
  }
}

- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if ([(SBExternalDisplayService *)self _identityParticipatesInExternalDisplayService:v9])
  {
    id v8 = [(SBExternalDisplayService *)self _displayInfoForDisplayIdentity:v9 configuration:v7];
    [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener notifyObserversExternalDisplayDidConnect:v8];
  }
}

- (void)displayManager:(id)a3 willDisconnectIdentity:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(SBExternalDisplayService *)self _identityParticipatesInExternalDisplayService:v6])
  {
    id v7 = [v9 configurationForIdentity:v6];
    id v8 = [(SBExternalDisplayService *)self _displayInfoForDisplayIdentity:v6 configuration:v7];

    [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener notifyObserversExternalDisplayWillDisconnect:v8];
  }
}

- (BOOL)_identityParticipatesInExternalDisplayService:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 isExternal]
    && ([v3 isContinuityDisplay] & 1) == 0
    && objc_msgSend(v3, "sb_displayWindowingMode") == 1;

  return v4;
}

- (id)_displayInfoForDisplayIdentity:(id)a3 configuration:(id)a4
{
  return [(SBSConnectedDisplayInfoFactory *)self->_connectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:a4 externalDisplayDefaults:self->_defaults];
}

- (id)_extendedModeDisplayConfigurationForHardwareIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(SBDisplayManager *)self->_displayManager connectedIdentities];
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    uint64_t v21 = a4;
    char v8 = 0;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = -[SBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v11, v21);
        id v13 = [v12 hardwareIdentifier];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          if (objc_msgSend(v11, "sb_displayWindowingMode") == 1)
          {
            id v15 = v11;
            LOBYTE(v7) = 1;
            a4 = v21;
            goto LABEL_14;
          }
          char v8 = 1;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    id v12 = 0;
    id v15 = 0;
    a4 = v21;
    LOBYTE(v7) = v8;
  }
  else
  {
    id v12 = 0;
    id v15 = 0;
  }
LABEL_14:

  if (a4 && !v12)
  {
    if (v6) {
      id v16 = v6;
    }
    else {
      id v16 = @"<nil>";
    }
    __int16 v27 = @"displayHardwareIdentifier";
    id v28 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    if (v7) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    if (v15) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = v18;
    }
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA6FD0] code:v19 userInfo:v17];
  }
  return v12;
}

- (void)_notifyOfPropertyChangesForDisplayConfiguration:(id)a3 requestingClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [v7 identity];
  id v9 = [(SBExternalDisplayService *)self _displayInfoForDisplayIdentity:v8 configuration:v7];

  [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener notifyObserversExternalDisplayDidUpdateProperties:v9 requestingClient:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_connectedDisplayInfoFactory, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
}

@end