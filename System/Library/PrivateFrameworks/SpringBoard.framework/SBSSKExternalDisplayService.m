@interface SBSSKExternalDisplayService
- (SBSSKExternalDisplayService)init;
- (SBSSKExternalDisplayService)initWithServiceListenerFactory:(id)a3 connectedDisplayInfoFactory:(id)a4 defaults:(id)a5;
- (id)_extendedModeDisplayConfigurationForHardwareIdentifier:(id)a3 error:(id *)a4;
- (void)_notifyOfPropertyChangesForDisplayConfiguration:(id)a3 requestingClient:(id)a4;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)client:(id)a3 getConnectedDisplayInfoWithCompletion:(id)a4;
- (void)client:(id)a3 setDisplayArrangement:(id)a4 forDisplay:(id)a5;
- (void)client:(id)a3 setDisplayMirroringEnabled:(id)a4 forDisplay:(id)a5;
- (void)client:(id)a3 setDisplayModeSettings:(id)a4 forDisplay:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)didConnectParticipant:(id)a3;
- (void)removeObserver:(id)a3;
- (void)willDisconnectParticipant:(id)a3;
@end

@implementation SBSSKExternalDisplayService

- (SBSSKExternalDisplayService)init
{
  v3 = objc_alloc_init(SBExternalDisplayServiceConnectionListenerFactory);
  v4 = objc_alloc_init(SBSConnectedDisplayInfoFactory);
  v5 = +[SBDefaults localDefaults];
  v6 = [v5 externalDisplayDefaults];
  v7 = [(SBSSKExternalDisplayService *)self initWithServiceListenerFactory:v3 connectedDisplayInfoFactory:v4 defaults:v6];

  return v7;
}

- (SBSSKExternalDisplayService)initWithServiceListenerFactory:(id)a3 connectedDisplayInfoFactory:(id)a4 defaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBSSKExternalDisplayService;
  v11 = [(SBSSKExternalDisplayService *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connectedDisplayInfoFactory, a4);
    objc_storeStrong((id *)&v12->_defaults, a5);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rootToConnectedParticipants = v12->_rootToConnectedParticipants;
    v12->_rootToConnectedParticipants = v13;

    uint64_t v15 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v12->_serviceQueue;
    v12->_serviceQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [v8 newExternalDisplayServiceListenerForDelegate:v12 serviceQueue:v12->_serviceQueue];
    serviceConnectionListener = v12->_serviceConnectionListener;
    v12->_serviceConnectionListener = (_SBExternalDisplayServiceConnectionListening *)v17;
  }
  return v12;
}

- (void)activate
{
}

- (void)dealloc
{
  [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSSKExternalDisplayService;
  [(SBSSKExternalDisplayService *)&v3 dealloc];
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

- (void)didConnectParticipant:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 displayConfiguration];
  v7 = [v6 identity];

  uint64_t v8 = [v7 rootIdentity];
  id v9 = (void *)v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSSKExternalDisplayService.m", 83, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SBSSKExternalDisplayService.m", 84, @"Invalid parameter not satisfying: %@", @"rootIdentity" object file lineNumber description];

LABEL_3:
  id v10 = [(NSMutableDictionary *)self->_rootToConnectedParticipants objectForKey:v9];
  uint64_t v11 = [v10 mutableCopy];

  id v12 = (id)v11;
  if (!v11) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v12 addObject:v5];
  [(NSMutableDictionary *)self->_rootToConnectedParticipants setObject:v12 forKey:v9];
  if (!v11 && [v5 isExtendedDisplayCapable])
  {
    v13 = SBLogDisplayControlling();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v20 = v7;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: connected extended display capable participant with identity: %{public}@", buf, 0xCu);
    }

    connectedDisplayInfoFactory = self->_connectedDisplayInfoFactory;
    uint64_t v15 = [v5 displayConfiguration];
    v16 = [(SBSConnectedDisplayInfoFactory *)connectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:v15 externalDisplayDefaults:self->_defaults];

    [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener notifyObserversExternalDisplayDidConnect:v16];
  }
}

- (void)willDisconnectParticipant:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 displayConfiguration];
  v7 = [v6 identity];

  uint64_t v8 = [v7 rootIdentity];
  id v9 = (void *)v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBSSKExternalDisplayService.m", 115, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBSSKExternalDisplayService.m", 116, @"Invalid parameter not satisfying: %@", @"rootIdentity" object file lineNumber description];

LABEL_3:
  id v10 = [(NSMutableDictionary *)self->_rootToConnectedParticipants objectForKey:v9];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (([v11 containsObject:v5] & 1) == 0)
  {
    objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SBSSKExternalDisplayService.m" lineNumber:120 description:@"Why are we disconnecting an participant that we aren't tracking??"];
  }
  [v11 removeObject:v5];
  uint64_t v12 = [v11 count];
  rootToConnectedParticipants = self->_rootToConnectedParticipants;
  if (v12)
  {
    [(NSMutableDictionary *)rootToConnectedParticipants setObject:v11 forKey:v9];
  }
  else
  {
    [(NSMutableDictionary *)rootToConnectedParticipants removeObjectForKey:v9];
    if ([v5 isExtendedDisplayCapable])
    {
      v14 = SBLogDisplayControlling();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v7;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: disconnected extended display capable participant with identity: %{public}@", buf, 0xCu);
      }

      connectedDisplayInfoFactory = self->_connectedDisplayInfoFactory;
      v16 = [v5 displayConfiguration];
      uint64_t v17 = [(SBSConnectedDisplayInfoFactory *)connectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:v16 externalDisplayDefaults:self->_defaults];

      [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener notifyObserversExternalDisplayWillDisconnect:v17];
    }
  }
}

- (void)client:(id)a3 getConnectedDisplayInfoWithCompletion:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __76__SBSSKExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__82;
  uint64_t v12 = __Block_byref_object_dispose__82;
  id v13 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SBSSKExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke_22;
  v7[3] = &unk_1E6B07368;
  v7[4] = v2;
  v7[5] = &v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v9[5];
  if (v5)
  {
    v14[0] = v9[5];
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v6, 0);
  if (v5) {

  }
  _Block_object_dispose(&v8, 8);
}

void __76__SBSSKExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke_22(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "isExtendedDisplayCapable", (void)v17))
        {
          uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 16);
          id v13 = [v11 displayConfiguration];
          uint64_t v14 = [v12 connectedDisplayInfoForDisplayConfiguration:v13 externalDisplayDefaults:*(void *)(*(void *)(a1 + 32) + 32)];
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
          v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (void)client:(id)a3 setDisplayArrangement:(id)a4 forDisplay:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v12 = a5;
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  id v11 = v7;
  BSDispatchMain();
}

void __71__SBSSKExternalDisplayService_client_setDisplayArrangement_forDisplay___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v3;
    __int16 v29 = 2114;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ is setting displayArrangement for display: %{public}@", buf, 0x16u);
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
      id v13 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 48), "copy", 0);
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
    long long v18 = SBLogDisplayControlling();
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
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ cannot set display arrangement for display: %{public}@ due to error: %{public}@", buf, 0x20u);
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

void __76__SBSSKExternalDisplayService_client_setDisplayMirroringEnabled_forDisplay___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogDisplayControlling();
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
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ is setting mirroringEnabled %{BOOL}u for display: %{public}@", buf, 0x1Cu);
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
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: setting mirroringEnabled to: %{BOOL}u", buf, 8u);
      }

      id v12 = +[SBDefaults localDefaults];
      id v13 = [v12 appSwitcherDefaults];
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
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ cannot set mirroringEnabled %{BOOL}u for display: %{public}@ due to error: %{public}@", buf, 0x26u);
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

void __98__SBSSKExternalDisplayService_client_setDisplayModeSettings_forDisplay_options_completionHandler___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogDisplayControlling();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v3;
    __int16 v25 = 2114;
    uint64_t v26 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ is setting displayMode settings for display: %{public}@", buf, 0x16u);
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
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService  : client %{public}@ cannot set displayMode settings for display: %{public}@ due to error: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v21 = *(void *)(a1 + 72);
  if (v21) {
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v8);
  }
}

- (id)_extendedModeDisplayConfigurationForHardwareIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__82;
  v36 = __Block_byref_object_dispose__82;
  id v37 = 0;
  rootToConnectedParticipants = self->_rootToConnectedParticipants;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __92__SBSSKExternalDisplayService__extendedModeDisplayConfigurationForHardwareIdentifier_error___block_invoke;
  v29[3] = &unk_1E6B07390;
  uint64_t v7 = (__CFString *)v5;
  uint64_t v30 = v7;
  __int16 v31 = &v32;
  [(NSMutableDictionary *)rootToConnectedParticipants enumerateKeysAndObjectsUsingBlock:v29];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = (id)v33[5];
  id v9 = 0;
  uint64_t v10 = (void *)[v8 countByEnumeratingWithState:&v25 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 displayConfiguration];
        id v15 = [v14 identity];
        BOOL v16 = objc_msgSend(v15, "sb_displayWindowingMode") == 1;

        if (v16)
        {
          uint64_t v10 = [v13 displayConfiguration];
          goto LABEL_13;
        }
        if ([v13 isExtendedDisplayCapable])
        {
          uint64_t v17 = [v13 displayConfiguration];

          id v9 = (void *)v17;
        }
      }
      uint64_t v10 = (void *)[v8 countByEnumeratingWithState:&v25 objects:v40 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (a4 && !v10)
  {
    if (v7) {
      id v18 = v7;
    }
    else {
      id v18 = @"<nil>";
    }
    v38 = @"displayHardwareIdentifier";
    v39 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    if (v33[5])
    {
      if (v9)
      {
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v20 = 1;
    }
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA6FD0] code:v20 userInfo:v19];
    goto LABEL_23;
  }
LABEL_24:
  if (v10) {
    uint64_t v21 = v10;
  }
  else {
    uint64_t v21 = v9;
  }
  id v22 = v21;

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __92__SBSSKExternalDisplayService__extendedModeDisplayConfigurationForHardwareIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  uint64_t v7 = [v11 firstObject];
  id v8 = [v7 displayConfiguration];

  if (v8)
  {
    id v9 = [v8 hardwareIdentifier];
    int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
      *a4 = 1;
    }
  }
}

- (void)_notifyOfPropertyChangesForDisplayConfiguration:(id)a3 requestingClient:(id)a4
{
  connectedDisplayInfoFactory = self->_connectedDisplayInfoFactory;
  defaults = self->_defaults;
  id v8 = a4;
  id v9 = [(SBSConnectedDisplayInfoFactory *)connectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:a3 externalDisplayDefaults:defaults];
  [(_SBExternalDisplayServiceConnectionListening *)self->_serviceConnectionListener notifyObserversExternalDisplayDidUpdateProperties:v9 requestingClient:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rootToConnectedParticipants, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connectedDisplayInfoFactory, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
}

@end