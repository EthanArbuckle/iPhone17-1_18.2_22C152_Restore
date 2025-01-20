@interface SBHSelectedApplicationDataSource
+ (id)homeScreenService;
+ (id)keyPathsForObservingInstallProgress;
- (BSInvalidatable)appInfoObserverAssertion;
- (LSApplicationWorkspace)workspace;
- (NSString)description;
- (SBHSelectedApplicationDataSource)init;
- (id)allApplicationPlaceholdersForIconModel:(id)a3;
- (id)allApplicationsForIconModel:(id)a3;
- (id)applicationPlaceholderWithBundleIdentifier:(id)a3;
- (id)applicationWithBundleIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_lock_beginObservingInstallProgress:(id)a3 forBundleIdentifier:(id)a4;
- (void)_lock_endObservingInstallProgress:(id)a3;
- (void)addApplicationsForBundleIdentifiers:(id)a3 forcePlaceholders:(BOOL)a4;
- (void)addIconModelApplicationDataSourceObserver:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)beginTrackingApplicationsWithBundleIdentifiers:(id)a3;
- (void)dealloc;
- (void)endTrackingAllApplications;
- (void)endTrackingApplicationsWithBundleIdentifiers:(id)a3;
- (void)homeScreenService:(id)a3 applicationIconInfoChangedForBundleIdentifiers:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeApplicationsForBundleIdentifiers:(id)a3;
- (void)removeIconModelApplicationDataSourceObserver:(id)a3;
- (void)setAppInfoObserverAssertion:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)uninstallApplicationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)uninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)updateStateOfPlaceholder:(id)a3 fromProgress:(id)a4;
- (void)updateStateOfPlaceholder:(id)a3 withInstallState:(unint64_t)a4 installPhase:(unint64_t)a5 installProgress:(double)a6;
@end

@implementation SBHSelectedApplicationDataSource

- (SBHSelectedApplicationDataSource)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBHSelectedApplicationDataSource;
  v2 = [(SBHSelectedApplicationDataSource *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    trackedApplicationBundleIdentifiers = v2->_trackedApplicationBundleIdentifiers;
    v2->_trackedApplicationBundleIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applications = v2->_applications;
    v2->_applications = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applicationPlaceholders = v2->_applicationPlaceholders;
    v2->_applicationPlaceholders = v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    installProgressBundleIdentifiers = v2->_installProgressBundleIdentifiers;
    v2->_installProgressBundleIdentifiers = (NSMapTable *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bundleIdentifierToInstallProgresses = v2->_bundleIdentifierToInstallProgresses;
    v2->_bundleIdentifierToInstallProgresses = v11;

    v2->_installProgressBundleIdentifiersLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_installProgressBundleIdentifiersLock = &self->_installProgressBundleIdentifiersLock;
  os_unfair_lock_lock(&self->_installProgressBundleIdentifiersLock);
  v4 = self->_installProgressBundleIdentifiers;
  installProgressBundleIdentifiers = self->_installProgressBundleIdentifiers;
  self->_installProgressBundleIdentifiers = 0;

  bundleIdentifierToInstallProgresses = self->_bundleIdentifierToInstallProgresses;
  self->_bundleIdentifierToInstallProgresses = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = v4;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SBHSelectedApplicationDataSource *)self _lock_endObservingInstallProgress:*(void *)(*((void *)&v14 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMapTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_installProgressBundleIdentifiersLock);
  [(BSInvalidatable *)self->_appInfoObserverAssertion invalidate];
  v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v12 removeObserver:self];

  v13.receiver = self;
  v13.super_class = (Class)SBHSelectedApplicationDataSource;
  [(SBHSelectedApplicationDataSource *)&v13 dealloc];
}

- (void)beginTrackingApplicationsWithBundleIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Begin tracking %@", buf, 0xCu);
  }

  BSDispatchQueueAssertMain();
  uint64_t v6 = [(NSMutableSet *)self->_trackedApplicationBundleIdentifiers count];
  v7 = (void *)[v4 mutableCopy];
  uint64_t v8 = [(NSMutableSet *)self->_trackedApplicationBundleIdentifiers allObjects];
  [v7 removeObjectsInArray:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSMutableSet addObject:](self->_trackedApplicationBundleIdentifiers, "addObject:", *(void *)(*((void *)&v18 + 1) + 8 * v13++), (void)v18);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [(SBHSelectedApplicationDataSource *)self addApplicationsForBundleIdentifiers:v9 forcePlaceholders:0];
  if (!v6)
  {
    long long v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v14 addObserver:self];

    long long v15 = [(SBHSelectedApplicationDataSource *)self appInfoObserverAssertion];

    if (!v15)
    {
      long long v16 = [(id)objc_opt_class() homeScreenService];
      long long v17 = [v16 addIconBadgeValueObserver:self];

      [(SBHSelectedApplicationDataSource *)self setAppInfoObserverAssertion:v17];
    }
  }
}

- (void)endTrackingApplicationsWithBundleIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "End tracking %@", buf, 0xCu);
  }

  BSDispatchQueueAssertMain();
  uint64_t v6 = [(NSMutableSet *)self->_trackedApplicationBundleIdentifiers count];
  [(SBHSelectedApplicationDataSource *)self removeApplicationsForBundleIdentifiers:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableSet removeObject:](self->_trackedApplicationBundleIdentifiers, "removeObject:", *(void *)(*((void *)&v14 + 1) + 8 * v11++), (void)v14);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (v6 && ![(NSMutableSet *)self->_trackedApplicationBundleIdentifiers count])
  {
    uint64_t v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v12 removeObserver:self];

    uint64_t v13 = [(SBHSelectedApplicationDataSource *)self appInfoObserverAssertion];
    [v13 invalidate];

    [(SBHSelectedApplicationDataSource *)self setAppInfoObserverAssertion:0];
  }
}

- (void)endTrackingAllApplications
{
  BSDispatchQueueAssertMain();
  id v3 = [(NSMutableSet *)self->_trackedApplicationBundleIdentifiers allObjects];
  [(SBHSelectedApplicationDataSource *)self endTrackingApplicationsWithBundleIdentifiers:v3];
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = [(NSMutableDictionary *)self->_applications objectForKey:v4];

  return v5;
}

- (id)applicationPlaceholderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = [(NSMutableDictionary *)self->_applicationPlaceholders objectForKey:v4];

  return v5;
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BSDispatchQueueAssertMain();
  if ([(NSMutableSet *)self->_trackedApplicationBundleIdentifiers containsObject:v8])
  {
    uint64_t v10 = SBLogSelectedApplicationDataSource();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Requesting uninstallation of %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2050000000;
    uint64_t v11 = (void *)getIXUninstallOptionsClass_softClass;
    uint64_t v22 = getIXUninstallOptionsClass_softClass;
    if (!getIXUninstallOptionsClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v24 = __getIXUninstallOptionsClass_block_invoke;
      uint64_t v25 = &unk_1E6AAD648;
      v26 = &v19;
      __getIXUninstallOptionsClass_block_invoke((uint64_t)&buf);
      uint64_t v11 = (void *)v20[3];
    }
    uint64_t v12 = v11;
    _Block_object_dispose(&v19, 8);
    id v13 = objc_alloc_init(v12);
    [v13 setRequestUserConfirmation:a4 & 1];
    [v13 setShowArchiveOption:(a4 >> 1) & 1];
    [v13 setShowDemotionOption:(a4 >> 2) & 1];
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2050000000;
    long long v14 = (void *)getIXAppInstallCoordinatorClass_softClass_0;
    uint64_t v22 = getIXAppInstallCoordinatorClass_softClass_0;
    if (!getIXAppInstallCoordinatorClass_softClass_0)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v24 = __getIXAppInstallCoordinatorClass_block_invoke_0;
      uint64_t v25 = &unk_1E6AAD648;
      v26 = &v19;
      __getIXAppInstallCoordinatorClass_block_invoke_0((uint64_t)&buf);
      long long v14 = (void *)v20[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v19, 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke;
    v16[3] = &unk_1E6AB2460;
    id v17 = v8;
    id v18 = v9;
    [v15 uninstallAppWithBundleID:v17 options:v13 completion:v16];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 3, 0);
  }
}

void __96__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __96__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = SBLogSelectedApplicationDataSource();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = [*(id *)(a1 + 32) localizedDescription];
      int v11 = 138412546;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      long long v14 = v6;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported an error for uninstallation of %@: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Install coordinator reported success for uninstallation of %@", (uint8_t *)&v11, 0xCu);
  }

  if (*(void *)(a1 + 32) || (unint64_t v8 = *(void *)(a1 + 56), v8 > 4)) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = qword_1D81E71C0[v8];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v9);
  }
  return result;
}

- (void)addApplicationsForBundleIdentifiers:(id)a3 forcePlaceholders:(BOOL)a4
{
  BOOL v35 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (SBHSimpleApplication *)a3;
  id v6 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    v50 = v5;
    __int16 v51 = 1024;
    LODWORD(v52) = v35;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Will add applications for %@, force placeholders: %{BOOL}u", buf, 0x12u);
  }

  BSDispatchQueueAssertMain();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v7 = v5;
  uint64_t v8 = [(SBHSimpleApplication *)v7 countByEnumeratingWithState:&v44 objects:v53 count:16];
  v34 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    v38 = 0;
    v39 = 0;
    v37 = 0;
    uint64_t v10 = *(void *)v45;
    v32 = 0;
    os_unfair_lock_t lock = &self->_installProgressBundleIdentifiersLock;
    BOOL v11 = v35;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * v12);
        if (-[NSMutableSet containsObject:](self->_trackedApplicationBundleIdentifiers, "containsObject:", v13, v32))
        {
          long long v14 = [SBHSimpleApplication alloc];
          if (v11) {
            uint64_t v15 = [(SBHSimpleApplication *)v14 initWithBundleIdentifier:v13 forcePlaceholder:1];
          }
          else {
            uint64_t v15 = [(SBHSimpleApplication *)v14 initWithBundleIdentifier:v13 allowPlaceholder:1];
          }
          long long v16 = v15;
          [(SBHSimpleApplication *)v15 setIconModelApplicationDataSource:self];
          id v17 = SBLogSelectedApplicationDataSource();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            v50 = v16;
            __int16 v51 = 2112;
            uint64_t v52 = v13;
            _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Got app %@ for %@", buf, 0x16u);
          }

          if (v16)
          {
            if (v11 || [(SBHSimpleApplication *)v16 isPlaceholder])
            {
              id v18 = [(NSMutableDictionary *)self->_applicationPlaceholders objectForKey:v13];

              if (!v18)
              {
                uint64_t v19 = SBLogSelectedApplicationDataSource();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_DEFAULT, "Setting app as placeholder", buf, 2u);
                }

                [(NSMutableDictionary *)self->_applicationPlaceholders setObject:v16 forKey:v13];
                id v20 = v39;
                if (!v39) {
                  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                v39 = v20;
                [v20 addObject:v16];
              }
              uint64_t v21 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v13];
              uint64_t v22 = [v21 installProgress];
              if (v22)
              {
                os_unfair_lock_lock(lock);
                [(SBHSelectedApplicationDataSource *)self _lock_beginObservingInstallProgress:v22 forBundleIdentifier:v13];
                os_unfair_lock_unlock(lock);
              }

              BOOL v11 = v35;
              uint64_t v7 = v34;
            }
            else
            {
              v23 = [(NSMutableDictionary *)self->_applications objectForKey:v13];

              [(NSMutableDictionary *)self->_applications setObject:v16 forKey:v13];
              if (v23)
              {
                id v24 = v37;
                if (!v37)
                {
                  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  v37 = v24;
                }
              }
              else
              {
                id v24 = v32;
                if (!v32)
                {
                  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  v32 = v24;
                }
              }
              objc_msgSend(v24, "addObject:", v16, v32);
              uint64_t v21 = [(NSMutableDictionary *)self->_applicationPlaceholders objectForKey:v13];
              if (v21)
              {
                [(NSMutableDictionary *)self->_applicationPlaceholders removeObjectForKey:v13];
                id v25 = v38;
                if (!v38) {
                  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
                v38 = v25;
                [v25 addObject:v21];
              }
            }
          }
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v26 = [(SBHSimpleApplication *)v7 countByEnumeratingWithState:&v44 objects:v53 count:16];
      uint64_t v9 = v26;
    }
    while (v26);
  }
  else
  {
    v38 = 0;
    v39 = 0;
    v37 = 0;
    v32 = 0;
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obj = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v27 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (v32 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v31 iconModelApplicationDataSource:self applicationsAdded:v32];
        }
        if (v37 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v31 iconModelApplicationDataSource:self applicationsUpdated:v37];
        }
        if (v39 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v31 iconModelApplicationDataSource:self applicationPlaceholdersAdded:v39];
        }
        if (v38 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v31 iconModelApplicationDataSource:self applicationPlaceholdersRemoved:v38];
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v28);
  }
}

- (void)removeApplicationsForBundleIdentifiers:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v35 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Will remove applications for %@", buf, 0xCu);
  }

  BSDispatchQueueAssertMain();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_applications objectForKey:v12];
        if (v13)
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v9 addObject:v13];
          long long v14 = SBLogSelectedApplicationDataSource();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v35 = v13;
            _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "Found non-placeholder app to remove: %@", buf, 0xCu);
          }
        }
        uint64_t v15 = [(NSMutableDictionary *)self->_applicationPlaceholders objectForKey:v12];

        if (v15)
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v8 addObject:v15];
          long long v16 = SBLogSelectedApplicationDataSource();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v35 = v15;
            _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "Found placeholder app to remove: %@", buf, 0xCu);
          }
        }
        [(NSMutableDictionary *)self->_applications removeObjectForKey:v12];
        [(NSMutableDictionary *)self->_applicationPlaceholders removeObjectForKey:v12];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v22 iconModelApplicationDataSource:self applicationsRemoved:v9];
        }
        if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v22 iconModelApplicationDataSource:self applicationPlaceholdersRemoved:v8];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }
}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken_0 != -1) {
    dispatch_once(&homeScreenService_onceToken_0, &__block_literal_global_52);
  }
  uint64_t v2 = (void *)homeScreenService__homeScreenService_0;
  return v2;
}

void __53__SBHSelectedApplicationDataSource_homeScreenService__block_invoke()
{
  if ((__sb__runningInSpringBoard() & 1) == 0)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4FA6AC8]);
    v1 = (void *)homeScreenService__homeScreenService_0;
    homeScreenService__homeScreenService_0 = (uint64_t)v0;
  }
}

+ (id)keyPathsForObservingInstallProgress
{
  return &unk_1F300F1F8;
}

- (void)_lock_beginObservingInstallProgress:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  installProgressBundleIdentifiers = self->_installProgressBundleIdentifiers;
  if (installProgressBundleIdentifiers)
  {
    id v9 = [(NSMapTable *)installProgressBundleIdentifiers objectForKey:v6];

    if (!v9)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v10 = [(id)objc_opt_class() keyPathsForObservingInstallProgress];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v34;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v33 + 1) + 8 * v14++) options:0 context:305926858];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v12);
      }

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v15 = [MEMORY[0x1E4F28F90] keyPathsForValuesAffectingInstallState];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v30;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v29 + 1) + 8 * v19++) options:0 context:305926858];
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v17);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F90], "keyPathsForValuesAffectingInstallPhase", 0);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v26;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v26 != v23) {
              objc_enumerationMutation(v20);
            }
            [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v25 + 1) + 8 * v24++) options:0 context:305926858];
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
        }
        while (v22);
      }

      [(NSMapTable *)self->_installProgressBundleIdentifiers setObject:v7 forKey:v6];
      [(NSMutableDictionary *)self->_bundleIdentifierToInstallProgresses setObject:v6 forKey:v7];
    }
  }
}

- (void)_lock_endObservingInstallProgress:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [(id)objc_opt_class() keyPathsForObservingInstallProgress];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 removeObserver:self forKeyPath:*(void *)(*((void *)&v29 + 1) + 8 * v9++) context:305926858];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [MEMORY[0x1E4F28F90] keyPathsForValuesAffectingInstallState];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        [v4 removeObserver:self forKeyPath:*(void *)(*((void *)&v25 + 1) + 8 * v14++) context:305926858];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F90], "keyPathsForValuesAffectingInstallPhase", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [v4 removeObserver:self forKeyPath:*(void *)(*((void *)&v21 + 1) + 8 * v19++) context:305926858];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  uint64_t v20 = [(NSMapTable *)self->_installProgressBundleIdentifiers objectForKey:v4];
  if (v20) {
    [(NSMutableDictionary *)self->_bundleIdentifierToInstallProgresses removeObjectForKey:v20];
  }
  [(NSMapTable *)self->_installProgressBundleIdentifiers removeObjectForKey:v4];
}

- (void)updateStateOfPlaceholder:(id)a3 fromProgress:(id)a4
{
  id v6 = a4;
  id v11 = a3;
  uint64_t v7 = [v6 installState];
  uint64_t v8 = [v6 installPhase];
  [v6 fractionCompleted];
  double v10 = v9;

  [(SBHSelectedApplicationDataSource *)self updateStateOfPlaceholder:v11 withInstallState:v7 installPhase:v8 installProgress:v10];
}

- (void)updateStateOfPlaceholder:(id)a3 withInstallState:(unint64_t)a4 installPhase:(unint64_t)a5 installProgress:(double)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a4 - 3 >= 2)
  {
    if (a4 != 2)
    {
      if (a4 == 5 && (BSFloatIsOne() & 1) != 0)
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
      }
      else if ((a5 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        unint64_t v12 = a5 - 1;
        BOOL v13 = a5 == 3;
        uint64_t v10 = 0;
        if (v12 >= 2) {
          uint64_t v11 = v13;
        }
        else {
          uint64_t v11 = 2;
        }
      }
      else
      {
        uint64_t v10 = 0;
        if (BSFloatIsZero()) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = 2;
        }
      }
      goto LABEL_13;
    }
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = 1;
LABEL_13:
  uint64_t v14 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v9 bundleIdentifier];
    int v16 = 138413058;
    uint64_t v17 = v15;
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    __int16 v20 = 2048;
    double v21 = a6;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "Updating install progress for %@: state: %li, progress: %f, paused: %{BOOL}u", (uint8_t *)&v16, 0x26u);
  }
  [v9 updateProgressState:v11 progressPercent:v10 progressPaused:a6];
}

- (void)applicationInstallsDidStart:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v12 = [v11 bundleIdentifier];
        BOOL v13 = (void *)[v12 copy];

        uint64_t v14 = [v11 installProgress];
        uint64_t v15 = (void *)v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          [v4 addObject:v13];
          [v5 setObject:v15 forKey:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v4 count])
  {
    id v17 = v5;
    id v18 = v4;
    BSDispatchMain();
  }
}

uint64_t __64__SBHSelectedApplicationDataSource_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBHSelectedApplicationDataSource_applicationInstallsDidStart___block_invoke_2;
  v6[3] = &unk_1E6AB2488;
  uint64_t v2 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  id v3 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Application installs did start: %@", buf, 0xCu);
  }

  return [*(id *)(a1 + 32) addApplicationsForBundleIdentifiers:*(void *)(a1 + 48) forcePlaceholders:1];
}

void __64__SBHSelectedApplicationDataSource_applicationInstallsDidStart___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 8) containsObject:v6]) {
    objc_msgSend(*(id *)(a1 + 32), "_lock_beginObservingInstallProgress:forBundleIdentifier:", v5, v6);
  }
}

- (void)applicationInstallsDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@:%@", buf, 0x16u);
  }
  id v7 = v4;
  BSDispatchMain();
}

void __65__SBHSelectedApplicationDataSource_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "bundleIdentifier", (void)v11);
        if (v8)
        {
          uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v8];
          if (v9)
          {
            __int16 v10 = [v7 installProgress];
            [*(id *)(a1 + 40) updateStateOfPlaceholder:v9 fromProgress:v10];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) bundleIdentifier];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    long long v11 = SBLogSelectedApplicationDataSource();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Applications did install: %@", buf, 0xCu);
    }

    id v12 = v4;
    BSDispatchMain();
  }
}

uint64_t __59__SBHSelectedApplicationDataSource_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        if (v7) {
          objc_msgSend(*(id *)(a1 + 32), "_lock_endObservingInstallProgress:", v7);
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  return [*(id *)(a1 + 32) addApplicationsForBundleIdentifiers:*(void *)(a1 + 40) forcePlaceholders:0];
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleIdentifier];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    id v11 = v4;
    BSDispatchMain();
  }
}

uint64_t __61__SBHSelectedApplicationDataSource_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "Applications did uninstall: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) removeApplicationsForBundleIdentifiers:*(void *)(a1 + 32)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = SBLogSelectedApplicationDataSource();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138543618;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@:%@", buf, 0x16u);
  }
  if (a6 == (void *)305926858)
  {
    id v13 = v10;
    long long v14 = SBLogSelectedApplicationDataSource();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v13;
      _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "Install progress did change: %@", buf, 0xCu);
    }

    id v15 = v13;
    BSDispatchMain();
  }
}

void __83__SBHSelectedApplicationDataSource_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  id v2 = (void *)v5;
  if (v5)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v5];
    id v2 = (void *)v5;
    if (v3)
    {
      id v4 = (void *)v3;
      [*(id *)(a1 + 32) updateStateOfPlaceholder:v3 fromProgress:*(void *)(a1 + 40)];

      id v2 = (void *)v5;
    }
  }
}

- (void)homeScreenService:(id)a3 applicationIconInfoChangedForBundleIdentifiers:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

void __101__SBHSelectedApplicationDataSource_homeScreenService_applicationIconInfoChangedForBundleIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 remoteBadgeValueDidChange];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)allApplicationsForIconModel:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_applications allValues];
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  return (id)[(NSMutableDictionary *)self->_applications objectForKey:a4];
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_applicationPlaceholders allValues];
}

- (void)addIconModelApplicationDataSourceObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeIconModelApplicationDataSourceObserver:(id)a3
{
}

- (void)uninstallApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E6AB24B0;
  id v9 = v6;
  id v7 = v6;
  [(SBHSelectedApplicationDataSource *)self uninstallApplicationWithBundleIdentifier:a3 options:1 completion:v8];
}

uint64_t __88__SBHSelectedApplicationDataSource_uninstallApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(SBHSelectedApplicationDataSource *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHSelectedApplicationDataSource *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_trackedApplicationBundleIdentifiers withName:@"trackedApplicationBundleIdentifiers"];
  return v4;
}

- (id)succinctDescription
{
  id v2 = [(SBHSelectedApplicationDataSource *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (BSInvalidatable)appInfoObserverAssertion
{
  return self->_appInfoObserverAssertion;
}

- (void)setAppInfoObserverAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfoObserverAssertion, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToInstallProgresses, 0);
  objc_storeStrong((id *)&self->_installProgressBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_applicationPlaceholders, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_trackedApplicationBundleIdentifiers, 0);
}

@end