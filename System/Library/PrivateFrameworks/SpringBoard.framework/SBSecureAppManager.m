@interface SBSecureAppManager
+ (SBSecureAppManager)sharedInstance;
- (BOOL)hasSecureApp;
- (BOOL)hasSecureAppOfType:(unint64_t)a3;
- (BOOL)hasWakeDestination;
- (NSHashTable)observers;
- (NSHashTable)wakeDestinationProviders;
- (NSMutableArray)remoteAlertActions;
- (NSMutableDictionary)secureAppActions;
- (SBLayoutStateTransitionCoordinator)secureAppTransitionCoordinator;
- (SBSecureAppManager)init;
- (SBWakeDestination)wakeDestination;
- (id)_applicationForAction:(id)a3;
- (id)_applicationSceneEntityForAction:(id)a3;
- (id)newApplicationSceneEntityForCurrentSecureApp;
- (id)newHostableEntityForCurrentSecureApp;
- (id)secureAppAction;
- (void)_addRemoteAlertLockScreenContentAction:(id)a3;
- (void)_addSecureAppAction:(id)a3;
- (void)_enumerateSecureAppActionsByPriorityUsingBlock:(id)a3;
- (void)_enumerateSecureAppActionsOfType:(unint64_t)a3 usingBlock:(id)a4;
- (void)addLockScreenContentAction:(id)a3;
- (void)addObserver:(id)a3;
- (void)addWakeDestinationProvider:(id)a3;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeWakeDestinationProvider:(id)a3;
- (void)setObservers:(id)a3;
- (void)setRemoteAlertActions:(id)a3;
- (void)setSecureAppActions:(id)a3;
- (void)setSecureAppTransitionCoordinator:(id)a3;
- (void)setWakeDestinationProviders:(id)a3;
@end

@implementation SBSecureAppManager

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(SBSecureAppManager *)self secureAppAction];
  if ([v5 isComplete]
    && [v6 automaticallyInvalidatesOnSecureAppUserDismissal])
  {
    v18 = v6;
    v7 = SBSecureAppBundleIdentifierForSecureAppType([v6 secureAppType]);
    id v20 = v5;
    [v5 toLayoutState];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v19 = long long v24 = 0u;
    v8 = [v19 elements];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v21 + 1) + 8 * v12) workspaceEntity];
          v14 = [(id)v13 applicationSceneEntity];
          v15 = [v14 sceneHandle];
          v16 = [v15 application];
          v17 = [v16 bundleIdentifier];

          LOBYTE(v13) = [v17 isEqualToString:v7];
          if (v13)
          {

            v6 = v18;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v6 = v18;
    [v18 invalidate];
LABEL_13:

    id v5 = v20;
  }
}

- (id)secureAppAction
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__79;
  uint64_t v9 = __Block_byref_object_dispose__79;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SBSecureAppManager_secureAppAction__block_invoke;
  v4[3] = &unk_1E6B06A18;
  v4[4] = &v5;
  [(SBSecureAppManager *)self _enumerateSecureAppActionsByPriorityUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (SBSecureAppManager)sharedInstance
{
  if (sharedInstance_onceToken_32 != -1) {
    dispatch_once(&sharedInstance_onceToken_32, &__block_literal_global_239);
  }
  id v2 = (void *)sharedInstance_sharedInstance_6;
  return (SBSecureAppManager *)v2;
}

- (void)_enumerateSecureAppActionsByPriorityUsingBlock:(id)a3
{
  for (uint64_t i = 1; i != 14; ++i)
    [(SBSecureAppManager *)self _enumerateSecureAppActionsOfType:i usingBlock:a3];
}

- (void)_enumerateSecureAppActionsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, uint64_t, char *))a4;
  secureAppActions = self->_secureAppActions;
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = [(NSMutableDictionary *)secureAppActions objectForKey:v8];

  if (v9)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        char v16 = 0;
        v6[2](v6, v15, &v16);
        if (v16) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

void __36__SBSecureAppManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBSecureAppManager);
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = (uint64_t)v0;
}

- (SBSecureAppManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBSecureAppManager;
  id v2 = [(SBSecureAppManager *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    secureAppActions = v2->_secureAppActions;
    v2->_secureAppActions = v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    remoteAlertActions = v2->_remoteAlertActions;
    v2->_remoteAlertActions = v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    wakeDestinationProviders = v2->_wakeDestinationProviders;
    v2->_wakeDestinationProviders = (NSHashTable *)v9;
  }
  return v2;
}

- (BOOL)hasWakeDestination
{
  id v2 = [(SBSecureAppManager *)self wakeDestination];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SBWakeDestination)wakeDestination
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(SBSecureAppManager *)self hasSecureApp])
  {
    BOOL v3 = objc_alloc_init(SBWakeDestination);
    [(SBWakeDestination *)v3 setType:1];
    v4 = [(SBSecureAppManager *)self secureAppAction];
    SBSecureAppBundleIdentifierForSecureAppType([(NSHashTable *)v4 secureAppType]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(SBWakeDestination *)v3 setIdentifier:v5];
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if ([(NSMutableArray *)self->_remoteAlertActions count])
  {
    v4 = [(NSMutableArray *)self->_remoteAlertActions lastObject];
    v6 = [(NSHashTable *)v4 configurationObject];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v5 = v9;

    if (v5)
    {
      BOOL v3 = objc_alloc_init(SBWakeDestination);
      [(SBWakeDestination *)v3 setType:2];
      [(SBWakeDestination *)v3 setRemoteAlertDefinition:v5];
    }
    else
    {
      BOOL v3 = 0;
    }
    goto LABEL_23;
  }
  if ([(NSHashTable *)self->_wakeDestinationProviders count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = self->_wakeDestinationProviders;
    BOOL v3 = (SBWakeDestination *)[(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v3)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (SBWakeDestination *)((char *)i + 1))
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "wakeDestinationHandler", (void)v14);
          if (v12)
          {
            id v5 = (id)v12;
            BOOL v3 = objc_alloc_init(SBWakeDestination);
            [(SBWakeDestination *)v3 setType:3];
            [(SBWakeDestination *)v3 setWakeHandler:v5];
            goto LABEL_23;
          }
        }
        BOOL v3 = (SBWakeDestination *)[(NSHashTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
    goto LABEL_24;
  }
  BOOL v3 = 0;
LABEL_25:
  return v3;
}

- (void)addLockScreenContentAction:(id)a3
{
  id v6 = a3;
  v4 = [v6 slot];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4FA7028]];

  if (v5) {
    [(SBSecureAppManager *)self _addSecureAppAction:v6];
  }
  else {
    [(SBSecureAppManager *)self _addRemoteAlertLockScreenContentAction:v6];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (!v5)
    {
      [(NSHashTable *)self->_observers addObject:v6];
      id v4 = v6;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (v5)
    {
      [(NSHashTable *)self->_observers removeObject:v6];
      id v4 = v6;
    }
  }
}

- (void)addWakeDestinationProvider:(id)a3
{
}

- (void)removeWakeDestinationProvider:(id)a3
{
}

- (BOOL)hasSecureApp
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SBSecureAppManager_hasSecureApp__block_invoke;
  v4[3] = &unk_1E6B06A18;
  v4[4] = &v5;
  [(SBSecureAppManager *)self _enumerateSecureAppActionsByPriorityUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __34__SBSecureAppManager_hasSecureApp__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isValid];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)hasSecureAppOfType:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SBSecureAppManager_hasSecureAppOfType___block_invoke;
  v5[3] = &unk_1E6B06A18;
  v5[4] = &v6;
  [(SBSecureAppManager *)self _enumerateSecureAppActionsOfType:a3 usingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SBSecureAppManager_hasSecureAppOfType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isValid];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)newApplicationSceneEntityForCurrentSecureApp
{
  char v3 = [(SBSecureAppManager *)self secureAppAction];
  id v4 = [(SBSecureAppManager *)self _applicationSceneEntityForAction:v3];

  return v4;
}

- (id)newHostableEntityForCurrentSecureApp
{
  char v2 = [(SBSecureAppManager *)self secureAppAction];
  if ([v2 isInProcessAction])
  {
    char v3 = [v2 hostableEntity];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

void __37__SBSecureAppManager_secureAppAction__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 isValid])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)setSecureAppTransitionCoordinator:(id)a3
{
  uint64_t v5 = (SBLayoutStateTransitionCoordinator *)a3;
  secureAppTransitionCoordinator = self->_secureAppTransitionCoordinator;
  if (secureAppTransitionCoordinator != v5)
  {
    uint64_t v7 = v5;
    [(SBLayoutStateTransitionCoordinator *)secureAppTransitionCoordinator removeObserver:self];
    objc_storeStrong((id *)&self->_secureAppTransitionCoordinator, a3);
    [(SBLayoutStateTransitionCoordinator *)self->_secureAppTransitionCoordinator addObserver:self];
    uint64_t v5 = v7;
  }
}

- (void)_addSecureAppAction:(id)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[v4 secureAppType];
  id v6 = secureAppTypeName();
  v37 = [v4 identifier];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __42__SBSecureAppManager__addSecureAppAction___block_invoke;
  v53[3] = &unk_1E6B06A40;
  id v7 = v4;
  id v54 = v7;
  v55 = &v56;
  [(SBSecureAppManager *)self _enumerateSecureAppActionsOfType:v5 usingBlock:v53];
  if (!*((unsigned char *)v57 + 24))
  {
    objc_initWeak(&location, v7);
    objc_initWeak(&from, self);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __42__SBSecureAppManager__addSecureAppAction___block_invoke_12;
    v46[3] = &unk_1E6B06A68;
    objc_copyWeak(&v49, &location);
    v46[4] = self;
    v50[1] = v5;
    objc_copyWeak(v50, &from);
    id v14 = v6;
    id v47 = v14;
    id v15 = v37;
    id v48 = v15;
    [v7 setInvalidationHandler:v46];
    if (![v7 isValid])
    {
LABEL_32:

      objc_destroyWeak(v50);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_33;
    }
    secureAppActions = self->_secureAppActions;
    long long v17 = [NSNumber numberWithUnsignedInteger:v5];
    long long v18 = [(NSMutableDictionary *)secureAppActions objectForKey:v17];

    if (v18)
    {
      uint64_t v19 = SBLogCoverSheet();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v18 count];
        *(_DWORD *)buf = 134218498;
        id v62 = (id)(v20 + 1);
        __int16 v63 = 2112;
        id v64 = v14;
        __int16 v65 = 2112;
        id v66 = v15;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "add content action (app) #%lu with type: %@ and identifier: %@", buf, 0x20u);
      }

      [v18 addObject:v7];
      long long v21 = self->_secureAppActions;
      uint64_t v22 = [NSNumber numberWithUnsignedInteger:v5];
      [(NSMutableDictionary *)v21 setObject:v18 forKey:v22];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v23 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v60 count:16];
      if (!v24) {
        goto LABEL_31;
      }
      v36 = v18;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v27 secureAppOfTypeDidTakeNewAssertion:v5];
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v60 count:16];
      }
      while (v24);
    }
    else
    {
      v28 = SBLogCoverSheet();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v62 = v14;
        __int16 v63 = 2112;
        id v64 = v15;
        _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "add content action (app) new with type: %@ and identifier: %@", buf, 0x16u);
      }

      v29 = self->_secureAppActions;
      v30 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
      v31 = [NSNumber numberWithUnsignedInteger:v5];
      [(NSMutableDictionary *)v29 setObject:v30 forKey:v31];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v23 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v32 = [v23 countByEnumeratingWithState:&v42 objects:v67 count:16];
      if (!v32) {
        goto LABEL_31;
      }
      v36 = 0;
      uint64_t v33 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(v23);
          }
          v35 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v35 secureAppOfTypeDidBegin:v5];
          }
        }
        uint64_t v32 = [v23 countByEnumeratingWithState:&v42 objects:v67 count:16];
      }
      while (v32);
    }
    long long v18 = v36;
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v8 = [NSString stringWithFormat:@"SBSecureAppManager cannot accept action %@ with type %@ because it already has one ", v7, v6];
  char v9 = SBLogCoverSheet();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SBSecureAppManager _addSecureAppAction:]((uint64_t)v8, v9);
  }

  uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v68 = *MEMORY[0x1E4F28568];
  v69[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
  uint64_t v12 = [v10 errorWithDomain:*MEMORY[0x1E4FA7180] code:1 userInfo:v11];

  uint64_t v13 = [MEMORY[0x1E4F4F678] responseForError:v12];
  [v7 sendResponse:v13];

LABEL_33:
  _Block_object_dispose(&v56, 8);
}

void __42__SBSecureAppManager__addSecureAppAction___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 supportedInterfaceOrientations];
  uint64_t v7 = [*(id *)(a1 + 32) supportedInterfaceOrientations];
  uint64_t v8 = [v5 type];
  uint64_t v9 = [*(id *)(a1 + 32) type];
  int v10 = [v5 isValid];

  if (v10 && v6 == v7 && v8 == v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __42__SBSecureAppManager__addSecureAppAction___block_invoke_12(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__SBSecureAppManager__addSecureAppAction___block_invoke_2;
  v3[3] = &unk_1E6B06A68;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  char v2 = *(void **)(a1 + 72);
  v3[4] = *(void *)(a1 + 32);
  v7[1] = v2;
  objc_copyWeak(v7, (id *)(a1 + 64));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], v3);

  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

void __42__SBSecureAppManager__addSecureAppAction___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  id v5 = [v3 objectForKey:v4];

  if ([v5 containsObject:WeakRetained])
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v7 = [v6 observers];
    uint64_t v8 = [v7 allObjects];

    if ([v5 count] == 1)
    {
      uint64_t v9 = SBLogCoverSheet();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = v10;
        __int16 v31 = 2112;
        uint64_t v32 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "removed last content action (app) with type: %@, last had identifier: %@", buf, 0x16u);
      }

      uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
      [v12 removeObjectForKey:v13];
    }
    else
    {
      [v5 removeObject:WeakRetained];
      id v14 = SBLogCoverSheet();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v30 = v15;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        __int16 v33 = 2048;
        uint64_t v34 = [v5 count];
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "removed a content action (app) with type: %@ and identifier: %@. %lu remain.", buf, 0x20u);
      }

      long long v17 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
      [v17 setObject:v5 forKey:v13];
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v24 + 1) + 8 * v22);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v23, "secureAppOfTypeDidEnd:", *(void *)(a1 + 72), (void)v24);
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v20);
    }
  }
}

- (void)_addRemoteAlertLockScreenContentAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 secureAppType];
  id v5 = secureAppTypeName();
  id v6 = [v4 identifier];
  objc_initWeak(&location, v4);
  uint64_t v7 = SBLogCoverSheet();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "add content action (alert) with type: %@ and identifier: %@", buf, 0x16u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke;
  v10[3] = &unk_1E6AFF9F8;
  objc_copyWeak(&v14, &location);
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  uint64_t v13 = self;
  [v4 setInvalidationHandler:v10];
  [(NSMutableArray *)self->_remoteAlertActions addObject:v4];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke_2;
  v4[3] = &unk_1E6AFF9F8;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v8);
}

void __61__SBSecureAppManager__addRemoteAlertLockScreenContentAction___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = SBLogCoverSheet();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "removing content action (alert) with type: %@ and identifier: %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 48) + 24) removeObject:WeakRetained];
}

- (id)_applicationSceneEntityForAction:(id)a3
{
  id v4 = a3;
  if (![v4 isInProcessAction]
    || ([v4 applicationSceneEntity],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v4 setApplicationSceneEntity:0],
        !v5))
  {
    int v6 = [(SBSecureAppManager *)self _applicationForAction:v4];
    BOOL v7 = +[SBSecureAppPolicy shouldAlwaysShowSecureSceneForApp:v6];
    __int16 v8 = [SBDeviceApplicationSceneEntity alloc];
    if (v7) {
      uint64_t v9 = [(SBDeviceApplicationSceneEntity *)v8 initWithApplicationForMainSecureDisplay:v6];
    }
    else {
      uint64_t v9 = [(SBDeviceApplicationSceneEntity *)v8 initWithApplicationForMainDisplay:v6];
    }
    uint64_t v5 = (void *)v9;
  }
  return v5;
}

- (id)_applicationForAction:(id)a3
{
  uint64_t v3 = SBSecureAppBundleIdentifierForSecureAppType([a3 secureAppType]);
  if (v3)
  {
    id v4 = +[SBApplicationController sharedInstance];
    uint64_t v5 = [v4 applicationWithBundleIdentifier:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (SBLayoutStateTransitionCoordinator)secureAppTransitionCoordinator
{
  return self->_secureAppTransitionCoordinator;
}

- (NSMutableDictionary)secureAppActions
{
  return self->_secureAppActions;
}

- (void)setSecureAppActions:(id)a3
{
}

- (NSMutableArray)remoteAlertActions
{
  return self->_remoteAlertActions;
}

- (void)setRemoteAlertActions:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)wakeDestinationProviders
{
  return self->_wakeDestinationProviders;
}

- (void)setWakeDestinationProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeDestinationProviders, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_remoteAlertActions, 0);
  objc_storeStrong((id *)&self->_secureAppActions, 0);
  objc_storeStrong((id *)&self->_secureAppTransitionCoordinator, 0);
}

- (void)_addSecureAppAction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end