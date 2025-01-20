@interface SBAppProtectionCoordinator
+ (BOOL)isEnabled;
- (APSystemAppOutlet)systemAppOutlet;
- (BOOL)shouldSuppressHiding;
- (NSMutableDictionary)bundleIdentifiersToAssistants;
- (SBAppProtectionCoordinator)init;
- (id)acquireSuppressHidingAppsAssertionForReason:(id)a3;
- (id)assistantForApplication:(id)a3;
- (void)_updateShouldHide;
- (void)appProtectionAssistantShouldHideDidChange:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)applicationsChanged:(id)a3;
- (void)dealloc;
- (void)noteAllScenesDismissedForAssistant:(id)a3;
- (void)noteSceneWillBecomeForegroundVisibleForAssistant:(id)a3;
- (void)setSystemAppOutlet:(id)a3;
@end

@implementation SBAppProtectionCoordinator

+ (BOOL)isEnabled
{
  if (APCoreFunctionalityEnabled()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

- (void)noteSceneWillBecomeForegroundVisibleForAssistant:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogAppProtection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    systemAppOutlet = self->_systemAppOutlet;
    v7 = [v4 appProtectionApplication];
    int v10 = 138543618;
    v11 = systemAppOutlet;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Informing %{public}@ that %@ will become foreground visible", (uint8_t *)&v10, 0x16u);
  }
  v8 = self->_systemAppOutlet;
  v9 = [v4 appProtectionApplication];
  [(APSystemAppOutlet *)v8 noteSceneWillBecomeForegroundVisibleForApplication:v9];
}

- (id)assistantForApplication:(id)a3
{
  id v4 = a3;
  bundleIdentifiersToAssistants = self->_bundleIdentifiersToAssistants;
  if (!bundleIdentifiersToAssistants)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = self->_bundleIdentifiersToAssistants;
    self->_bundleIdentifiersToAssistants = v6;

    bundleIdentifiersToAssistants = self->_bundleIdentifiersToAssistants;
  }
  v8 = [v4 bundleIdentifier];
  v9 = [(NSMutableDictionary *)bundleIdentifiersToAssistants objectForKey:v8];

  if (v4 && !v9)
  {
    v9 = [[SBApplicationAppProtectionAssistant alloc] initWithApplication:v4];
    [(SBApplicationAppProtectionAssistant *)v9 setOwningCoordinator:self];
    systemAppOutlet = self->_systemAppOutlet;
    v11 = [(SBApplicationAppProtectionAssistant *)v9 appProtectionApplication];
    [(SBApplicationAppProtectionAssistant *)v9 setShouldShield:[(APSystemAppOutlet *)systemAppOutlet shouldShieldLaunchOfApplication:v11]];

    [(SBApplicationAppProtectionAssistant *)v9 addObserver:self];
    __int16 v12 = self->_bundleIdentifiersToAssistants;
    v13 = [v4 bundleIdentifier];
    [(NSMutableDictionary *)v12 setObject:v9 forKey:v13];
  }
  return v9;
}

- (SBAppProtectionCoordinator)init
{
  v21.receiver = self;
  v21.super_class = (Class)SBAppProtectionCoordinator;
  v2 = [(SBAppProtectionCoordinator *)&v21 init];
  if (v2)
  {
    v3 = objc_alloc_init(_SBAppProtectionPlugin);
    [(_SBAppProtectionPlugin *)v3 set_owningCoordinator:v2];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F4B808]) initWithSystemAppInterface:v3];
    systemAppOutlet = v2->_systemAppOutlet;
    v2->_systemAppOutlet = (APSystemAppOutlet *)v4;

    [(APSystemAppOutlet *)v2->_systemAppOutlet resume];
    v6 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    id v7 = (id)[v6 addMonitor:v2 subjectMask:2];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_applicationsChanged_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];

    objc_initWeak(&location, v2);
    v9 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __34__SBAppProtectionCoordinator_init__block_invoke;
    v18 = &unk_1E6AF92D8;
    objc_copyWeak(&v19, &location);
    uint64_t v10 = [v9 assertionWithIdentifier:@"Suppress hiding hidden apps" stateDidChangeHandler:&v15];
    suppressHidingAssertions = v2->_suppressHidingAssertions;
    v2->_suppressHidingAssertions = (BSCompoundAssertion *)v10;

    __int16 v12 = v2->_suppressHidingAssertions;
    v13 = SBLogAppProtection();
    -[BSCompoundAssertion setLog:](v12, "setLog:", v13, v15, v16, v17, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__SBAppProtectionCoordinator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateShouldHide];
}

- (void)dealloc
{
  [(APSystemAppOutlet *)self->_systemAppOutlet invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAppProtectionCoordinator;
  [(SBAppProtectionCoordinator *)&v3 dealloc];
}

- (void)applicationsChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  v5 = [v4 objectForKey:@"SBInstalledApplicationsRemovedBundleIDs"];

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          __int16 v12 = -[NSMutableDictionary objectForKey:](self->_bundleIdentifiersToAssistants, "objectForKey:", v11, (void)v13);
          [v12 invalidate];

          [(NSMutableDictionary *)self->_bundleIdentifiersToAssistants removeObjectForKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (id)acquireSuppressHidingAppsAssertionForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_suppressHidingAssertions acquireForReason:a3];
}

- (BOOL)shouldSuppressHiding
{
  return [(BSCompoundAssertion *)self->_suppressHidingAssertions isActive];
}

- (void)noteAllScenesDismissedForAssistant:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogAppProtection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    systemAppOutlet = self->_systemAppOutlet;
    uint64_t v7 = [v4 appProtectionApplication];
    int v10 = 138543618;
    uint64_t v11 = systemAppOutlet;
    __int16 v12 = 2112;
    long long v13 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Informing %{public}@ that %@ will become background as far as we know", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = self->_systemAppOutlet;
  uint64_t v9 = [v4 appProtectionApplication];
  [(APSystemAppOutlet *)v8 noteAllScenesDismissedForApplication:v9];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int v10 = [MEMORY[0x1E4F4B800] hiddenMetaSubject];
        LODWORD(v9) = [v9 isEqual:v10];

        if (v9) {
          BSDispatchMain();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

uint64_t __75__SBAppProtectionCoordinator_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateShouldHide];
}

- (void)appProtectionAssistantShouldHideDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"SBAppProtectionCoordinatorHiddenAppsDidChange" object:self];
  [v5 postNotification:v4];
}

- (void)_updateShouldHide
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_bundleIdentifiersToAssistants allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _updateShouldHide];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (APSystemAppOutlet)systemAppOutlet
{
  return self->_systemAppOutlet;
}

- (void)setSystemAppOutlet:(id)a3
{
}

- (NSMutableDictionary)bundleIdentifiersToAssistants
{
  return self->_bundleIdentifiersToAssistants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersToAssistants, 0);
  objc_storeStrong((id *)&self->_systemAppOutlet, 0);
  objc_storeStrong((id *)&self->_suppressHidingAssertions, 0);
}

@end