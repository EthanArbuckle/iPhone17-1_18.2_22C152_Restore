@interface SBCaptureButtonAppConfigurationCoordinator
- (NSSet)eligibleApps;
- (NSString)associatedAppBundleIdentifier;
- (SBCaptureButtonAppConfigurationCoordinator)init;
- (void)_notifyObserversOfConfigurationUpdates;
- (void)_reevaluateCurrentAssociatedApp;
- (void)_setAssociatedAppBundleIdentifier:(id)a3;
- (void)_setAssociatedAppBundleIdentifier:(id)a3 shouldPersistToDefaults:(BOOL)a4;
- (void)_setAssociatedAppBundleIdentifierFromDefaults;
- (void)_setEligibleApps:(id)a3;
- (void)_updateLaunchActionsAssertionForAssociatedAppBundleIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)captureApplicationCenter:(id)a3 didUpdateKnownApplications:(id)a4;
- (void)captureButtonAppConfigurationServer:(id)a3 setCurrentAssociatedAppUsingBundleIdentifier:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation SBCaptureButtonAppConfigurationCoordinator

- (SBCaptureButtonAppConfigurationCoordinator)init
{
  v32.receiver = self;
  v32.super_class = (Class)SBCaptureButtonAppConfigurationCoordinator;
  v2 = [(SBCaptureButtonAppConfigurationCoordinator *)&v32 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = +[SBDefaults localDefaults];
    uint64_t v6 = [v5 captureButtonDefaults];
    captureButtonDefaults = v2->_captureButtonDefaults;
    v2->_captureButtonDefaults = (SBCaptureButtonDefaults *)v6;

    objc_initWeak(&location, v2);
    v8 = v2->_captureButtonDefaults;
    v9 = [NSString stringWithUTF8String:"captureButtonAssociatedAppBundleIdentifier"];
    uint64_t v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __50__SBCaptureButtonAppConfigurationCoordinator_init__block_invoke;
    v29 = &unk_1E6AF4B10;
    objc_copyWeak(&v30, &location);
    id v12 = (id)[(SBCaptureButtonDefaults *)v8 observeDefault:v9 onQueue:v10 withBlock:&v26];

    v13 = [(SBCaptureButtonDefaults *)v2->_captureButtonDefaults captureButtonAssociatedAppBundleIdentifier];
    LODWORD(v8) = [v13 isEqualToString:@"none"];

    if (v8)
    {
      associatedAppBundleIdentifier = v2->_associatedAppBundleIdentifier;
      v2->_associatedAppBundleIdentifier = 0;

      v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      eligibleApps = v2->_eligibleApps;
      v2->_eligibleApps = v15;
    }
    else
    {
      uint64_t v17 = [(SBCaptureButtonDefaults *)v2->_captureButtonDefaults captureButtonAssociatedAppBundleIdentifier];
      v18 = v2->_associatedAppBundleIdentifier;
      v2->_associatedAppBundleIdentifier = (NSString *)v17;

      v19 = (void *)MEMORY[0x1E4F1CAD0];
      eligibleApps = (NSSet *)[objc_alloc(MEMORY[0x1E4FA6A40]) initWithBundleIdentifier:v2->_associatedAppBundleIdentifier cameraTCCIsAuthorized:1];
      uint64_t v20 = [v19 setWithObject:eligibleApps];
      v21 = v2->_eligibleApps;
      v2->_eligibleApps = (NSSet *)v20;
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4FA6A38]) initWithAssociatedAppBundleIdentifier:v2->_associatedAppBundleIdentifier eligibleApps:v2->_eligibleApps delegate:v2];
    server = v2->_server;
    v2->_server = (SBSCaptureButtonAppConfigurationServer *)v22;

    [(SBSCaptureButtonAppConfigurationServer *)v2->_server startServer];
    v24 = +[SBCaptureApplicationCenter sharedInstance];
    [v24 addObserver:v2];

    [(SBCaptureButtonAppConfigurationCoordinator *)v2 _updateLaunchActionsAssertionForAssociatedAppBundleIdentifier:v2->_associatedAppBundleIdentifier];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __50__SBCaptureButtonAppConfigurationCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setAssociatedAppBundleIdentifierFromDefaults];
    id WeakRetained = v2;
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
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)captureButtonAppConfigurationServer:(id)a3 setCurrentAssociatedAppUsingBundleIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Coordinator %p set current associated app to %{public}@ from server %{public}@", buf, 0x20u);
  }

  id v9 = v7;
  BSDispatchMain();
}

uint64_t __127__SBCaptureButtonAppConfigurationCoordinator_captureButtonAppConfigurationServer_setCurrentAssociatedAppUsingBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAssociatedAppBundleIdentifier:*(void *)(a1 + 40) shouldPersistToDefaults:1];
}

- (void)captureApplicationCenter:(id)a3 didUpdateKnownApplications:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4FA6A40]);
        id v15 = [v13 bundleIdentifier];
        uint64_t v16 = [v13 attributes];
        uint64_t v17 = objc_msgSend(v14, "initWithBundleIdentifier:cameraTCCIsAuthorized:", v15, objc_msgSend(v16, "cameraTCCStatus") == 4);

        [v7 addObject:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v10);
  }

  v18 = SBLogCameraCaptureAppConfiguration();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v25 = self;
    __int16 v26 = 2114;
    uint64_t v27 = v7;
    __int16 v28 = 2114;
    id v29 = v19;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Coordinator %p received updated eligible apps bundle identifiers %{public}@ according to source %{public}@", buf, 0x20u);
  }

  [(SBCaptureButtonAppConfigurationCoordinator *)self _setEligibleApps:v7];
  [(SBCaptureButtonAppConfigurationCoordinator *)self _reevaluateCurrentAssociatedApp];
}

- (void)_reevaluateCurrentAssociatedApp
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)SBApp authenticationController];
  char v4 = [v3 hasAuthenticatedAtLeastOnceSinceBoot];

  if (v4)
  {
    *(void *)buf = 0;
    __int16 v12 = buf;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    eligibleApps = self->_eligibleApps;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__SBCaptureButtonAppConfigurationCoordinator__reevaluateCurrentAssociatedApp__block_invoke;
    v10[3] = &unk_1E6AFE3D8;
    v10[4] = self;
    v10[5] = buf;
    [(NSSet *)eligibleApps enumerateObjectsUsingBlock:v10];
    if (v12[24])
    {
      id v6 = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults captureButtonAssociatedAppBundleIdentifier];
      [(SBCaptureButtonAppConfigurationCoordinator *)self _setAssociatedAppBundleIdentifier:v6 shouldPersistToDefaults:0];
    }
    else
    {
      [(SBCaptureButtonAppConfigurationCoordinator *)self _setAssociatedAppBundleIdentifier:0 shouldPersistToDefaults:0];
    }
    id v8 = SBLogCameraCaptureAppConfiguration();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      associatedAppBundleIdentifier = self->_associatedAppBundleIdentifier;
      *(_DWORD *)id v15 = 134218242;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      v18 = associatedAppBundleIdentifier;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Coordinator %p reevaluated current associated app to %{public}@", v15, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v7 = SBLogCameraCaptureAppConfiguration();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Before first unlock, we should always use the user's selection(stored in defaults) to attempt to launch.", buf, 2u);
    }
  }
}

void __77__SBCaptureButtonAppConfigurationCoordinator__reevaluateCurrentAssociatedApp__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 bundleIdentifier];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 16) captureButtonAssociatedAppBundleIdentifier];
  if (BSEqualStrings())
  {
    int v5 = [v7 cameraTCCIsAuthorized];

    id v6 = v7;
    if (v5) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {

    id v6 = v7;
  }
}

- (void)_setAssociatedAppBundleIdentifierFromDefaults
{
  associatedAppBundleIdentifier = (__CFString *)self->_associatedAppBundleIdentifier;
  if (!associatedAppBundleIdentifier) {
    associatedAppBundleIdentifier = @"none";
  }
  id v8 = associatedAppBundleIdentifier;
  char v4 = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults captureButtonAssociatedAppBundleIdentifier];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    id v6 = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults captureButtonAssociatedAppBundleIdentifier];
    id v7 = self->_associatedAppBundleIdentifier;
    self->_associatedAppBundleIdentifier = v6;

    [(SBCaptureButtonAppConfigurationCoordinator *)self _notifyObserversOfConfigurationUpdates];
    [(SBSCaptureButtonAppConfigurationServer *)self->_server setAssociatedAppBundleIdentifier:self->_associatedAppBundleIdentifier];
  }
  [(SBCaptureButtonAppConfigurationCoordinator *)self _updateLaunchActionsAssertionForAssociatedAppBundleIdentifier:v8];
}

- (void)_setAssociatedAppBundleIdentifier:(id)a3 shouldPersistToDefaults:(BOOL)a4
{
  BOOL v4 = a4;
  p_associatedAppBundleIdentifier = &self->_associatedAppBundleIdentifier;
  id v10 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, a3);
    id v8 = (__CFString *)*p_associatedAppBundleIdentifier;
    if (!*p_associatedAppBundleIdentifier) {
      id v8 = @"none";
    }
    uint64_t v9 = v8;
    if (v4) {
      [(SBCaptureButtonDefaults *)self->_captureButtonDefaults setCaptureButtonAssociatedAppBundleIdentifier:v9];
    }
    [(SBCaptureButtonAppConfigurationCoordinator *)self _notifyObserversOfConfigurationUpdates];
    [(SBSCaptureButtonAppConfigurationServer *)self->_server setAssociatedAppBundleIdentifier:v10];
  }
  [(SBCaptureButtonAppConfigurationCoordinator *)self _updateLaunchActionsAssertionForAssociatedAppBundleIdentifier:v10];
}

- (void)_setEligibleApps:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_eligibleApps, a3);
    [(SBCaptureButtonAppConfigurationCoordinator *)self _notifyObserversOfConfigurationUpdates];
    [(SBSCaptureButtonAppConfigurationServer *)self->_server setEligibleApps:v5];
  }
}

- (void)_notifyObserversOfConfigurationUpdates
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) captureButtonAppConfigurationUpdated:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateLaunchActionsAssertionForAssociatedAppBundleIdentifier:(id)a3
{
  id v8 = a3;
  [(BSInvalidatable *)self->_captureApplicationLaunchActionsAssertion invalidate];
  if (v8)
  {
    uint64_t v4 = +[SBCaptureApplicationCenter sharedInstance];
    uint64_t v5 = [v4 captureApplicationForBundleIdentifier:v8];

    uint64_t v6 = [v5 acquireLaunchPrewarmAssertionForReason:@"associated to capture button"];
    captureApplicationLaunchActionsAssertion = self->_captureApplicationLaunchActionsAssertion;
    self->_captureApplicationLaunchActionsAssertion = v6;
  }
  else
  {
    uint64_t v5 = self->_captureApplicationLaunchActionsAssertion;
    self->_captureApplicationLaunchActionsAssertion = 0;
  }
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)_setAssociatedAppBundleIdentifier:(id)a3
{
}

- (NSSet)eligibleApps
{
  return self->_eligibleApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleApps, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_captureApplicationLaunchActionsAssertion, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_captureButtonDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end