@interface SBBacklightEnvironmentSessionProvider
- (BLSHBacklightInactiveEnvironmentSession)_currentSession;
- (NSSet)currentPresentationBundleIdentifiers;
- (SBBacklightEnvironmentSessionProvider)init;
- (id)_backlightPresentationEntries;
- (id)_buildPresentation;
- (id)createInactiveEnvironmentSession;
- (void)_notifyObserversOfPresentation;
- (void)_rebuildPresentation;
- (void)_setCurrentSession:(id)a3;
- (void)addObserver:(id)a3;
- (void)didEndInactiveEnvironmentSession:(id)a3;
- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4;
- (void)invalidateBacklightSceneHostEnvironmentsForProvider:(id)a3;
- (void)invalidateBacklightScenesForProvider:(id)a3;
- (void)registerBacklightEnvironmentSceneProvider:(id)a3;
- (void)registerBacklightSceneHostEnvironmentProvider:(id)a3;
- (void)removeObserver:(id)a3;
- (void)unregisterBacklightEnvironmentSceneProvider:(id)a3;
- (void)unregisterBacklightSceneHostEnvironmentProvider:(id)a3;
@end

@implementation SBBacklightEnvironmentSessionProvider

- (SBBacklightEnvironmentSessionProvider)init
{
  v21.receiver = self;
  v21.super_class = (Class)SBBacklightEnvironmentSessionProvider;
  v2 = [(SBBacklightEnvironmentSessionProvider *)&v21 init];
  v3 = v2;
  if (v2)
  {
    v2->_springBoardBootCompleted = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak(&location, v4);

    objc_initWeak(&from, v3);
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__102;
    v17 = __Block_byref_object_dispose__102;
    id v18 = 0;
    id v5 = objc_loadWeakRetained(&location);
    v6 = [MEMORY[0x1E4F28F08] mainQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__SBBacklightEnvironmentSessionProvider_init__block_invoke;
    v10[3] = &unk_1E6AF7970;
    objc_copyWeak(&v11, &from);
    objc_copyWeak(&v12, &location);
    v10[4] = &v13;
    uint64_t v7 = [v5 addObserverForName:@"SBBootCompleteNotification" object:0 queue:v6 usingBlock:v10];
    v8 = (void *)v14[5];
    v14[5] = v7;

    _Block_object_dispose(&v13, 8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __45__SBBacklightEnvironmentSessionProvider_init__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBBacklightEnvironmentSessionProvider_init__block_invoke_2;
  block[3] = &unk_1E6B0B748;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_copyWeak(&v4, (id *)(a1 + 48));
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v3);
}

void __45__SBBacklightEnvironmentSessionProvider_init__block_invoke_2(uint64_t a1)
{
  v2 = SBLogBacklight();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation at end of SpringBoard boot", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[48] = 1;
    [WeakRetained _rebuildPresentation];
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  [v5 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)registerBacklightEnvironmentSceneProvider:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  backlightEnvironmentSceneProviders = self->_backlightEnvironmentSceneProviders;
  if (!backlightEnvironmentSceneProviders)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_backlightEnvironmentSceneProviders;
    self->_backlightEnvironmentSceneProviders = v6;

    backlightEnvironmentSceneProviders = self->_backlightEnvironmentSceneProviders;
  }
  [(NSHashTable *)backlightEnvironmentSceneProviders addObject:v4];
  v8 = SBLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_opt_respondsToSelector()) {
      [v4 succinctDescription];
    }
    else {
    v9 = [v4 description];
    }
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after adding scene provider %@", (uint8_t *)&v10, 0xCu);
  }
  [(SBBacklightEnvironmentSessionProvider *)self _rebuildPresentation];
}

- (void)unregisterBacklightEnvironmentSceneProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSHashTable *)self->_backlightEnvironmentSceneProviders removeObject:v4];
  id v5 = SBLogBacklight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_opt_respondsToSelector()) {
      [v4 succinctDescription];
    }
    else {
    v6 = [v4 description];
    }
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after removing scene provider %@", (uint8_t *)&v7, 0xCu);
  }
  [(SBBacklightEnvironmentSessionProvider *)self _rebuildPresentation];
}

- (void)registerBacklightSceneHostEnvironmentProvider:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  backlightSceneHostEnvironmentProviders = self->_backlightSceneHostEnvironmentProviders;
  if (!backlightSceneHostEnvironmentProviders)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int v7 = self->_backlightSceneHostEnvironmentProviders;
    self->_backlightSceneHostEnvironmentProviders = v6;

    backlightSceneHostEnvironmentProviders = self->_backlightSceneHostEnvironmentProviders;
  }
  [(NSHashTable *)backlightSceneHostEnvironmentProviders addObject:v4];
  v8 = SBLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_opt_respondsToSelector()) {
      [v4 succinctDescription];
    }
    else {
    uint64_t v9 = [v4 description];
    }
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after adding environment provider %@", (uint8_t *)&v10, 0xCu);
  }
  [(SBBacklightEnvironmentSessionProvider *)self _rebuildPresentation];
}

- (void)unregisterBacklightSceneHostEnvironmentProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSHashTable *)self->_backlightSceneHostEnvironmentProviders removeObject:v4];
  id v5 = SBLogBacklight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_opt_respondsToSelector()) {
      [v4 succinctDescription];
    }
    else {
    v6 = [v4 description];
    }
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after removing environment provider %@", (uint8_t *)&v7, 0xCu);
  }
  [(SBBacklightEnvironmentSessionProvider *)self _rebuildPresentation];
}

- (void)invalidateBacklightScenesForProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogBacklight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_opt_respondsToSelector()) {
      [v4 succinctDescription];
    }
    else {
    v6 = [v4 description];
    }
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation for scene provider %@", (uint8_t *)&v7, 0xCu);
  }
  [(SBBacklightEnvironmentSessionProvider *)self _rebuildPresentation];
}

- (void)invalidateBacklightSceneHostEnvironmentsForProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogBacklight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_opt_respondsToSelector()) {
      [v4 succinctDescription];
    }
    else {
    v6 = [v4 description];
    }
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation for environment provider %@", (uint8_t *)&v7, 0xCu);
  }
  [(SBBacklightEnvironmentSessionProvider *)self _rebuildPresentation];
}

- (NSSet)currentPresentationBundleIdentifiers
{
  v2 = [(SBBacklightEnvironmentSessionProvider *)self _currentSession];
  id v3 = [v2 presentation];

  id v4 = [v3 presentationEntries];
  id v5 = objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_355);

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  int v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  return (NSSet *)v7;
}

id __77__SBBacklightEnvironmentSessionProvider_currentPresentationBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (id)_backlightPresentationEntries
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (self->_springBoardBootCompleted)
  {
    id v3 = [MEMORY[0x1E4F62420] mainConfiguration];
    id v4 = [MEMORY[0x1E4F963E8] currentProcess];
    id v5 = [MEMORY[0x1E4F62490] sharedInstance];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __70__SBBacklightEnvironmentSessionProvider__backlightPresentationEntries__block_invoke;
    v81[3] = &unk_1E6B0B790;
    v53 = v3;
    v82 = v53;
    id v52 = v4;
    id v83 = v52;
    v6 = [v5 scenesPassingTest:v81];

    v51 = v6;
    int v7 = [v6 allObjects];
    v50 = objc_msgSend(v7, "bs_map:", &__block_literal_global_49_1);

    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v49 = self;
    obuint64_t j = self->_backlightEnvironmentSceneProviders;
    uint64_t v57 = [(NSHashTable *)obj countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v57)
    {
      id v55 = *(id *)v78;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(id *)v78 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v59 = v9;
          int v10 = *(void **)(*((void *)&v77 + 1) + 8 * v9);
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v11 = [v10 scenesForBacklightSession];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v88 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v74;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v74 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                v17 = [v16 backlightSceneHostEnvironment];
                id v18 = objc_alloc(MEMORY[0x1E4F4F578]);
                v19 = [v16 clientHandle];
                v20 = [v19 bundleIdentifier];
                objc_super v21 = (void *)[v18 initWithEnvironment:v17 userObject:v20];
                [v8 addObject:v21];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v73 objects:v88 count:16];
            }
            while (v13);
          }

          uint64_t v9 = v59 + 1;
        }
        while (v59 + 1 != v57);
        uint64_t v57 = [(NSHashTable *)obj countByEnumeratingWithState:&v77 objects:v89 count:16];
      }
      while (v57);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v56 = v49->_backlightSceneHostEnvironmentProviders;
    uint64_t v60 = [(NSHashTable *)v56 countByEnumeratingWithState:&v69 objects:v87 count:16];
    if (v60)
    {
      uint64_t v58 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v70 != v58) {
            objc_enumerationMutation(v56);
          }
          v23 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          v24 = [v23 sceneHostEnvironmentEntriesForBacklightSession];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v65 objects:v86 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v66;
            do
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v66 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v65 + 1) + 8 * k);
                id v30 = objc_alloc(MEMORY[0x1E4F4F578]);
                v31 = [v29 environment];
                v32 = [v29 bundleIdentifier];
                v33 = (void *)[v30 initWithEnvironment:v31 userObject:v32];
                [v8 addObject:v33];
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v65 objects:v86 count:16];
            }
            while (v26);
          }
        }
        uint64_t v60 = [(NSHashTable *)v56 countByEnumeratingWithState:&v69 objects:v87 count:16];
      }
      while (v60);
    }

    v34 = [(id)SBApp screenSleepCoordinator];
    v35 = [v34 backlightSceneHostEnvironment];

    if (v35 && (uint64_t v36 = [objc_alloc(MEMORY[0x1E4F4F578]) initWithEnvironment:v35 userObject:0]) != 0)
    {
      v37 = (void *)v36;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObject:v36];
    }
    else
    {
      v38 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v39 = [v38 arrayByAddingObjectsFromArray:v50];

    v40 = [v39 arrayByAddingObjectsFromArray:v8];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v61 objects:v85 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v62;
      do
      {
        for (uint64_t m = 0; m != v43; ++m)
        {
          if (*(void *)v62 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = [*(id *)(*((void *)&v61 + 1) + 8 * m) environment];
          objc_msgSend(v46, "setAlwaysOnEnabledForEnvironment:", objc_msgSend(v46, "clientSupportsAlwaysOn"));
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v61 objects:v85 count:16];
      }
      while (v43);
    }

    v47 = v53;
  }
  else
  {
    v47 = SBLogBacklight();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEFAULT, "Constructing empty backlight environment presentation while SpringBoard is booting", buf, 2u);
    }
    id v41 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v41;
}

BOOL __70__SBBacklightEnvironmentSessionProvider__backlightPresentationEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 settings];
  id v5 = [v4 displayConfiguration];
  if ([v5 isEqual:*(void *)(a1 + 32)])
  {
    v6 = [v3 clientHandle];
    int v7 = [v6 processHandle];
    char v8 = [v7 isEqual:*(void *)(a1 + 40)];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  int v10 = [v3 definition];
  id v11 = [v10 specification];
  uint64_t v12 = [v11 uiSceneSessionRole];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F43F38]];

  uint64_t v14 = [v3 identity];
  uint64_t v15 = [v14 workspaceIdentifier];

  BOOL v16 = 0;
  if ((v9 & 1) == 0 && v13 && !v15)
  {
    v17 = [v3 delegate];
    BOOL v16 = v17 != 0;
  }
  return v16;
}

id __70__SBBacklightEnvironmentSessionProvider__backlightPresentationEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 backlightSceneHostEnvironment];
  id v4 = objc_alloc(MEMORY[0x1E4F4F578]);
  id v5 = [v2 clientHandle];

  v6 = [v5 bundleIdentifier];
  int v7 = (void *)[v4 initWithEnvironment:v3 userObject:v6];

  return v7;
}

- (void)_setCurrentSession:(id)a3
{
  id v5 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  currentSession = self->_currentSession;
  if (currentSession != v5)
  {
    int v7 = v5;
    [(BLSHBacklightInactiveEnvironmentSession *)currentSession removeObserver:self];
    objc_storeStrong((id *)&self->_currentSession, a3);
    [(BLSHBacklightInactiveEnvironmentSession *)self->_currentSession addObserver:self];
    [(SBBacklightEnvironmentSessionProvider *)self _notifyObserversOfPresentation];
    id v5 = v7;
  }
}

- (void)_rebuildPresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBBacklightEnvironmentSessionProvider *)self _currentSession];
  if (v3)
  {
    id v4 = [(SBBacklightEnvironmentSessionProvider *)self _buildPresentation];
    id v5 = [v3 presentation];
    int v6 = [v4 isEqual:v5];
    int v7 = [(id)SBApp windowSceneManager];
    char v8 = [v7 embeddedDisplayWindowScene];
    char v9 = [v8 _FBSScene];

    if (v9)
    {
      int v10 = (void *)MEMORY[0x1E4FA5E68];
      id v11 = self->_presentationUpdateLiveRenderAssertion;
      uint64_t v12 = [v10 sharedInstance];
      int v13 = [v12 acquireLiveRenderingAssertionForFBSScene:v9 reason:@"updatingPresentation"];
      presentationUpdateLiveRenderAssertion = self->_presentationUpdateLiveRenderAssertion;
      self->_presentationUpdateLiveRenderAssertion = v13;

      [(BSInvalidatable *)v11 invalidate];
    }
    uint64_t v15 = SBLogBacklight();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Rebuilt inactive environment presentation: %@", (uint8_t *)&v17, 0xCu);
    }

    [v3 setPresentation:v4];
    [(SBBacklightEnvironmentSessionProvider *)self _notifyObserversOfPresentation];
    if (v6)
    {
      [(BSInvalidatable *)self->_presentationUpdateLiveRenderAssertion invalidate];
      BOOL v16 = self->_presentationUpdateLiveRenderAssertion;
      self->_presentationUpdateLiveRenderAssertion = 0;
    }
  }
  else
  {
    id v4 = SBLogBacklight();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "No active session so not rebuilding inactive environment presentation", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)_notifyObserversOfPresentation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBBacklightEnvironmentSessionProvider *)self _currentSession];
  id v4 = [v3 presentation];

  id v5 = [(SBBacklightEnvironmentSessionProvider *)self currentPresentationBundleIdentifiers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "backlightEnvironmentSessionsProvider:didUpdatePresentation:withBundleIdentifiers:", self, v4, v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4
{
}

void __92__SBBacklightEnvironmentSessionProvider_inactiveEnvironmentSession_didUpdateToPresentation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)didEndInactiveEnvironmentSession:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __74__SBBacklightEnvironmentSessionProvider_didEndInactiveEnvironmentSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _currentSession];

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 _setCurrentSession:0];
  }
}

- (id)_buildPresentation
{
  id v3 = +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance];
  id v4 = [v3 rootWindow];

  id v5 = [v4 layer];
  int v6 = [v5 context];

  uint64_t v7 = [(SBBacklightEnvironmentSessionProvider *)self _backlightPresentationEntries];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F4F560]) initWithCAContext:v6 wantsTransform:0 inverted:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F548]) initWithPresentationEntries:v7 flipbookContext:v8 expirationDate:0];

  return v9;
}

- (id)createInactiveEnvironmentSession
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBBacklightEnvironmentSessionProvider *)self _buildPresentation];
  id v4 = SBLogBacklight();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "New inactive environment presentation: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F4F558] sessionWithPresentation:v3];
  [v5 addObserver:self];
  [(SBBacklightEnvironmentSessionProvider *)self _setCurrentSession:v5];

  return v5;
}

- (BLSHBacklightInactiveEnvironmentSession)_currentSession
{
  return self->_currentSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationUpdateLiveRenderAssertion, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_backlightSceneHostEnvironmentProviders, 0);
  objc_storeStrong((id *)&self->_backlightEnvironmentSceneProviders, 0);
}

@end