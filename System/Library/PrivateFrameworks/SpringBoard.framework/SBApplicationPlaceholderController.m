@interface SBApplicationPlaceholderController
+ (SBApplicationPlaceholderController)sharedInstance;
- (BOOL)hasDownloadedStoreApplication;
- (BOOL)isUsingNetwork;
- (BOOL)placeholderRepresentsNewAppInstallFromStore:(id)a3;
- (BOOL)placeholderShouldAllowPausing:(id)a3;
- (SBApplicationPlaceholderController)init;
- (id)iconManager;
- (id)placeholderForDisplayID:(id)a3;
- (id)placeholdersByDisplayID;
- (void)_addPlaceholders:(id)a3;
- (void)_finishPlaceholder:(id)a3;
- (void)_finishSwappingPlaceholderAfterCachingIcon:(id)a3;
- (void)_postPlaceholdersDidChangeForAdded:(id)a3 modified:(id)a4 removed:(id)a5;
- (void)_processPendingProxies;
- (void)_removePlaceholders:(id)a3 forInstall:(BOOL)a4;
- (void)applicationPlaceholdersAdded:(id)a3;
- (void)applicationPlaceholdersCancelled:(id)a3;
- (void)applicationPlaceholdersInstalled:(id)a3;
- (void)applicationPlaceholdersNetworkUsageChanged:(BOOL)a3;
- (void)dealloc;
- (void)iconAccessoriesDidUpdate:(id)a3;
- (void)placeholderWantsUninstall:(id)a3;
@end

@implementation SBApplicationPlaceholderController

+ (SBApplicationPlaceholderController)sharedInstance
{
  if (sharedInstance_onceToken_60 != -1) {
    dispatch_once(&sharedInstance_onceToken_60, &__block_literal_global_424);
  }
  v2 = (void *)sharedInstance___instance_13;
  return (SBApplicationPlaceholderController *)v2;
}

- (id)placeholderForDisplayID:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKey:](self->_placeholdersByBundleID, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isUsingNetwork
{
  return self->_usingNetwork;
}

uint64_t __52__SBApplicationPlaceholderController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBApplicationPlaceholderController);
  v1 = (void *)sharedInstance___instance_13;
  sharedInstance___instance_13 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBApplicationPlaceholderController)init
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)SBApplicationPlaceholderController;
  v2 = [(SBApplicationPlaceholderController *)&v33 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    placeholdersByBundleID = v2->_placeholdersByBundleID;
    v2->_placeholdersByBundleID = v3;

    uint64_t v5 = +[SBApplicationController sharedInstance];
    appController = v2->_appController;
    v2->_appController = (SBApplicationController *)v5;

    uint64_t v7 = [(SBApplicationController *)v2->_appController _appLibraryObserver];
    lsWorkspaceObserver = v2->_lsWorkspaceObserver;
    v2->_lsWorkspaceObserver = (SBApplicationLibraryObserver *)v7;

    [(SBApplicationLibraryObserver *)v2->_lsWorkspaceObserver addPlaceholderLifecycleObserver:v2];
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingAdded = v2->_pendingAdded;
    v2->_pendingAdded = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingInstalled = v2->_pendingInstalled;
    v2->_pendingInstalled = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingCancelled = v2->_pendingCancelled;
    v2->_pendingCancelled = v13;

    v15 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    removingPlaceholderProxies = v2->_removingPlaceholderProxies;
    v2->_removingPlaceholderProxies = v15;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v17 = [(SBApplicationLibraryObserver *)v2->_lsWorkspaceObserver placeholders];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v23 = [v22 bundleIdentifier];
          if (v23)
          {
            v24 = [(SBHProxiedApplicationPlaceholder *)[SBApplicationPlaceholder alloc] initWithPlaceholderProxy:v22];
            v25 = v24;
            if (v24)
            {
              [(SBHProxiedApplicationPlaceholder *)v24 setDelegate:v2];
              [(NSMutableDictionary *)v2->_placeholdersByBundleID setObject:v25 forKey:v23];
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v19);
    }

    v26 = SBLogAppPlaceholder();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(NSMutableDictionary *)v2->_placeholdersByBundleID allKeys];
      *(_DWORD *)buf = 138412290;
      v35 = v27;
      _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Placeholders @ boot time: %@", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(SBApplicationLibraryObserver *)self->_lsWorkspaceObserver removePlaceholderLifecycleObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBApplicationPlaceholderController;
  [(SBApplicationPlaceholderController *)&v3 dealloc];
}

- (id)placeholdersByDisplayID
{
  return self->_placeholdersByBundleID;
}

- (BOOL)hasDownloadedStoreApplication
{
  return self->_hasDownloadedFromStore;
}

- (void)applicationPlaceholdersAdded:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    placeholdersByBundleID = self->_placeholdersByBundleID;
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    v14 = placeholdersByBundleID;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "App placeholder proxies added: %@, currentlyKnownExistingPlaceholders: %@", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBApplicationPlaceholderController.m", 129, @"%s: should be called on the main thread only.", "-[SBApplicationPlaceholderController applicationPlaceholdersAdded:]");

    if (!v5) {
      goto LABEL_8;
    }
  }
  pendingAdded = self->_pendingAdded;
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [(NSMutableSet *)pendingAdded unionSet:v9];

  [(NSMutableSet *)self->_pendingCancelled minusSet:self->_pendingAdded];
  [(NSMutableSet *)self->_pendingInstalled minusSet:self->_pendingAdded];
  if ([(NSCountedSet *)self->_removingPlaceholderProxies intersectsSet:self->_pendingAdded])
  {
    do
      [(NSCountedSet *)self->_removingPlaceholderProxies minusSet:self->_pendingAdded];
    while (([(NSCountedSet *)self->_removingPlaceholderProxies intersectsSet:self->_pendingAdded] & 1) != 0);
  }
  [(SBApplicationPlaceholderController *)self _processPendingProxies];
LABEL_8:
}

- (void)applicationPlaceholdersInstalled:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "App placeholder proxies installed: %@", buf, 0xCu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBApplicationPlaceholderController.m", 148, @"%s: should be called on the main thread only.", "-[SBApplicationPlaceholderController applicationPlaceholdersInstalled:]");

    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    pendingInstalled = self->_pendingInstalled;
    v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    [(NSMutableSet *)pendingInstalled unionSet:v8];

    [(SBApplicationPlaceholderController *)self _processPendingProxies];
  }
LABEL_6:
}

- (void)applicationPlaceholdersCancelled:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "App placeholder proxies cancelled: %@", buf, 0xCu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBApplicationPlaceholderController.m", 157, @"%s: should be called on the main thread only.", "-[SBApplicationPlaceholderController applicationPlaceholdersCancelled:]");

    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    pendingCancelled = self->_pendingCancelled;
    v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    [(NSMutableSet *)pendingCancelled unionSet:v8];

    [(SBApplicationPlaceholderController *)self _processPendingProxies];
  }
LABEL_6:
}

- (void)applicationPlaceholdersNetworkUsageChanged:(BOOL)a3
{
  if (self->_usingNetwork != a3)
  {
    self->_usingNetwork = a3;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"SBApplicationPlaceholdersNetworkUsageDidChangeNotification" object:self userInfo:0];
  }
}

- (void)_processPendingProxies
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBApplicationPlaceholderController.m", 175, @"%s: should be called on the main thread only.", "-[SBApplicationPlaceholderController _processPendingProxies]");
  }
  if ([(NSMutableSet *)self->_pendingAdded count])
  {
    [(SBApplicationPlaceholderController *)self _addPlaceholders:self->_pendingAdded];
    [(NSMutableSet *)self->_pendingAdded removeAllObjects];
  }
  if ([(NSMutableSet *)self->_pendingInstalled count])
  {
    [(SBApplicationPlaceholderController *)self _removePlaceholders:self->_pendingInstalled forInstall:1];
    [(NSMutableSet *)self->_pendingInstalled removeAllObjects];
  }
  if ([(NSMutableSet *)self->_pendingCancelled count])
  {
    [(SBApplicationPlaceholderController *)self _removePlaceholders:self->_pendingCancelled forInstall:0];
    pendingCancelled = self->_pendingCancelled;
    [(NSMutableSet *)pendingCancelled removeAllObjects];
  }
}

- (id)iconManager
{
  v2 = +[SBIconController sharedInstance];
  objc_super v3 = [v2 iconManager];

  return v3;
}

- (void)_addPlaceholders:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = [(SBApplicationPlaceholderController *)self iconManager];
  long long v31 = [v32 iconModel];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v43 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      id v11 = (void *)MEMORY[0x1D948C4D0]();
      uint64_t v12 = [v10 bundleIdentifier];
      __int16 v13 = (void *)MEMORY[0x1E4F78060];
      v14 = [NSString stringWithFormat:@"Placeholder add BEGIN"];
      [v13 logStep:0 byParty:10 phase:1 success:1 forBundleID:v12 description:v14];

      uint64_t v15 = [(SBApplicationPlaceholderController *)self placeholderForDisplayID:v12];
      if (v15)
      {
        v16 = (void *)v15;
        v17 = v36;
LABEL_10:
        objc_msgSend(v17, "addObject:", v16, v31);
        goto LABEL_11;
      }
      uint64_t v18 = [(SBHProxiedApplicationPlaceholder *)[SBApplicationPlaceholder alloc] initWithPlaceholderProxy:v10];
      v16 = v18;
      if (v18)
      {
        [(SBHProxiedApplicationPlaceholder *)v18 setDelegate:self];
        [(NSMutableDictionary *)self->_placeholdersByBundleID setObject:v16 forKey:v12];
        v17 = v33;
        goto LABEL_10;
      }
LABEL_11:
      objc_msgSend(v37, "addObject:", v16, v31);
      if (!self->_hasDownloadedFromStore && [v16 isStoreDownload]) {
        self->_hasDownloadedFromStore = 1;
      }
      if ([(SBApplicationPlaceholderController *)self placeholderRepresentsNewAppInstallFromStore:v16])
      {
        id v19 = v12;

        uint64_t v7 = v19;
      }
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  }
  while (v6);
LABEL_20:

  [v32 addApplicationPlaceholders:v37];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v34 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v34);
        }
        v24 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        v25 = objc_msgSend(v24, "applicationBundleID", v31);
        v26 = (void *)MEMORY[0x1E4F78060];
        v27 = [NSString stringWithFormat:@"Created icon for placeholder."];
        [v26 logStep:1 byParty:10 phase:3 success:1 forBundleID:v25 description:v27];

        v28 = SBLogAppPlaceholder();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          v47 = v24;
          __int16 v48 = 2112;
          v49 = v25;
          _os_log_debug_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEBUG, "Created icon %p for placeholder %@", buf, 0x16u);
        }

        if (([v24 hasObserver:self] & 1) == 0) {
          [v24 addObserver:self];
        }
      }
      uint64_t v21 = [v34 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v21);
  }
  long long v29 = v31;
  if (v7)
  {
    long long v30 = [v31 applicationIconForBundleIdentifier:v7];
    if (v30)
    {
      [v32 setIconToReveal:v30 revealingPrevious:1];
      [v32 tryScrollToIconToRevealAnimated:SBWorkspaceSpringBoardIsActive()];
    }
  }
  if (objc_msgSend(v33, "count", v31) || objc_msgSend(v36, "count")) {
    [(SBApplicationPlaceholderController *)self _postPlaceholdersDidChangeForAdded:v33 modified:v36 removed:0];
  }
}

- (void)_removePlaceholders:(id)a3 forInstall:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v43 = +[SBIconController sharedInstance];
  long long v41 = [v43 iconManager];
  v46 = [(SBApplicationController *)self->_appController allBundleIdentifiers];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v6;
  uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v58;
    unint64_t v8 = 0x1E4F78000uLL;
    unint64_t v9 = 0x1E4F29000uLL;
    BOOL v44 = v4;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v58 != v48) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v12 = [v11 bundleIdentifier];
        __int16 v13 = *(void **)(v8 + 96);
        v14 = [*(id *)(v9 + 24) stringWithFormat:@"Placeholder remove BEGIN"];
        [v13 logStep:4 byParty:10 phase:1 success:1 forBundleID:v12 description:v14];

        uint64_t v15 = [(SBApplicationPlaceholderController *)self placeholderForDisplayID:v12];
        unint64_t v16 = v9;
        v17 = (void *)v15;
        if (v15)
        {
          uint64_t v18 = (void *)MEMORY[0x1D948C4D0]([v7 addObject:v15]);
          if (v4)
          {
            id v19 = [(SBApplicationController *)self->_appController _appLibrary];
            uint64_t v20 = [v19 installedApplicationWithBundleIdentifier:v12];

            if (v20)
            {
              [v43 _setIgnoreMutatingIconListsOnApplicationInstall:1];
              appController = self->_appController;
              v62 = v20;
              uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
              [(SBApplicationController *)appController applicationsAdded:v22];

              [v43 _setIgnoreMutatingIconListsOnApplicationInstall:0];
            }
            else
            {
              v26 = SBLogAppPlaceholder();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v12;
                _os_log_error_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_ERROR, "No app info found for supposedly installed placeholder for %{public}@", buf, 0xCu);
              }
            }
            BOOL v4 = v44;
          }
          v27 = [(SBApplicationController *)self->_appController applicationWithBundleIdentifier:v12];
          uint64_t v28 = [v11 installType];
          if (v28 == 1)
          {
            if (![v46 containsObject:v12]) {
              goto LABEL_23;
            }
          }
          else
          {
            if (v28 != 3)
            {
LABEL_23:

              unint64_t v8 = 0x1E4F78000;
              goto LABEL_24;
            }
            if (([v46 containsObject:v12] & 1) == 0)
            {
              [v27 markNewlyInstalled];
              goto LABEL_23;
            }
          }
          [v27 markRecentlyUpdated];
          goto LABEL_23;
        }
        v23 = *(void **)(v8 + 96);
        v24 = [*(id *)(v16 + 24) stringWithFormat:@"State mismatch -- no model placeholder found matching."];
        [v23 logStep:4 byParty:10 phase:2 success:0 forBundleID:v12 description:v24];

        v25 = SBLogAppPlaceholder();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v64 = v12;
          _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "*** No placeholder exists for placeholderProxy with bundleID: %{public}@. Ignoring this removal.", buf, 0xCu);
        }

LABEL_24:
        unint64_t v9 = 0x1E4F29000;
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v50);
  }

  v51 = [v41 iconImageCache];
  long long v45 = [v41 rootViewController];
  long long v42 = [v45 traitCollection];
  v49 = objc_msgSend(MEMORY[0x1E4F42F80], "sbh_iconImageAppearanceFromTraitCollection:");
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v29 = v7;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v54 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = *(void **)(*((void *)&v53 + 1) + 8 * j);
        v35 = [v34 placeholderProxy];
        id v36 = [v34 applicationBundleID];
        if (v36)
        {
          id v37 = [(SBApplicationController *)self->_appController applicationWithBundleIdentifier:v36];
          [(NSCountedSet *)self->_removingPlaceholderProxies addObject:v35];
          [(SBApplicationPlaceholderController *)self _finishPlaceholder:v34];
          if (v37
            && (long long v38 = [(SBHApplicationIcon *)[SBApplicationIcon alloc] initWithApplication:v37]) != 0)
          {
            long long v39 = v38;
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __69__SBApplicationPlaceholderController__removePlaceholders_forInstall___block_invoke;
            v52[3] = &unk_1E6B0EEF8;
            v52[4] = self;
            v52[5] = v34;
            id v40 = (id)[v51 cacheImageForIcon:v38 imageAppearance:v49 options:5 completionHandler:v52];
          }
          else
          {
            [(SBApplicationPlaceholderController *)self _finishSwappingPlaceholderAfterCachingIcon:v34];
          }
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v31);
  }
}

uint64_t __69__SBApplicationPlaceholderController__removePlaceholders_forInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishSwappingPlaceholderAfterCachingIcon:*(void *)(a1 + 40)];
}

- (void)_finishSwappingPlaceholderAfterCachingIcon:(id)a3
{
  id v16 = a3;
  uint64_t v5 = [v16 placeholderProxy];
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBApplicationPlaceholderController.m" lineNumber:353 description:@"We already checked that this had a non-nil placeholderProxy"];
  }
  id v6 = [v16 applicationBundleID];
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBApplicationPlaceholderController.m" lineNumber:356 description:@"We already checked that this had a non-nil applicationBundleID"];
  }
  int v7 = [(NSCountedSet *)self->_removingPlaceholderProxies containsObject:v5];
  unint64_t v8 = [(SBApplicationController *)self->_appController applicationWithBundleIdentifier:v6];
  if (v7)
  {
    unint64_t v9 = [(SBApplicationPlaceholderController *)self iconManager];
    v10 = v9;
    if (v8)
    {
      id v11 = (id)[v9 replaceApplicationPlaceholderWithApplication:v8];
    }
    else
    {
      uint64_t v12 = [v9 iconModel];
      __int16 v13 = [v12 applicationIconsForBundleIdentifier:v6];
      [v12 removeIcons:v13];
    }
  }
  [(NSCountedSet *)self->_removingPlaceholderProxies removeObject:v5];
}

- (void)_finishPlaceholder:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 invalidate];
  uint64_t v5 = [v4 applicationBundleID];
  if (v5) {
    [(NSMutableDictionary *)self->_placeholdersByBundleID removeObjectForKey:v5];
  }
  v7[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(SBApplicationPlaceholderController *)self _postPlaceholdersDidChangeForAdded:0 modified:0 removed:v6];
}

- (void)_postPlaceholdersDidChangeForAdded:(id)a3 modified:(id)a4 removed:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] || objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v8 count]) {
      [v11 setObject:v8 forKey:@"__placeholdersAdded"];
    }
    if ([v9 count]) {
      [v11 setObject:v9 forKey:@"__placeholdersModified"];
    }
    if ([v10 count]) {
      [v11 setObject:v10 forKey:@"__placeholdersRemoved"];
    }
    uint64_t v12 = SBLogAppPlaceholder();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Placeholders added: %@, modified: %@, removed: %@", (uint8_t *)&v14, 0x20u);
    }

    __int16 v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"SBApplicationPlaceholdersDidChangeNotification" object:self userInfo:v11];
  }
}

- (BOOL)placeholderShouldAllowPausing:(id)a3
{
  objc_super v3 = +[SBIconController sharedInstance];
  id v4 = [v3 iconManager];
  char v5 = [v4 isEditingAllowed];

  return v5;
}

- (void)placeholderWantsUninstall:(id)a3
{
  id v3 = a3;
  id v6 = +[SBApplicationController sharedInstance];
  id v4 = [v3 applicationBundleID];

  char v5 = [v6 applicationWithBundleIdentifier:v4];

  if (v5) {
    [v6 uninstallApplication:v5];
  }
}

- (BOOL)placeholderRepresentsNewAppInstallFromStore:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isStoreDownload];
  char v5 = [v3 applicationBundleIdentifier];

  id v6 = +[SBApplicationController sharedInstance];
  int v7 = [v6 applicationWithBundleIdentifier:v5];

  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v4;
  }

  return v8;
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = +[SBIconController sharedInstance];
  char v5 = [v4 iconManager];
  if ([v5 isEditing]) {
    char v6 = [v4 isUninstallSupportedForIcon:v3];
  }
  else {
    char v6 = 0;
  }
  int v7 = +[SBAlertItemsController sharedInstance];
  BOOL v8 = [v7 alertItemsOfClass:objc_opt_class()];

  if ((v6 & 1) == 0 && [v8 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(v14, "icon", (void)v16);
          id v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15 == v3) {
            [v14 deactivate];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removingPlaceholderProxies, 0);
  objc_storeStrong((id *)&self->_pendingCancelled, 0);
  objc_storeStrong((id *)&self->_pendingInstalled, 0);
  objc_storeStrong((id *)&self->_pendingAdded, 0);
  objc_storeStrong((id *)&self->_placeholdersByBundleID, 0);
  objc_storeStrong((id *)&self->_lsWorkspaceObserver, 0);
  objc_storeStrong((id *)&self->_appController, 0);
}

@end