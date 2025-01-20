@interface SBApplicationRestrictionController
- (BOOL)isAllowlistActiveAndTransient;
- (BOOL)isApplicationIdentifierRestricted:(id)a3;
- (SBApplicationRestrictionController)init;
- (SBApplicationRestrictionController)initWithDataSource:(id)a3;
- (id)allAllowedAppBundleIdentifiers;
- (id)allRestrictedAppBundleIdentifiers;
- (void)_postRestrictionState;
- (void)_postRestrictionStateToObservers:(uint64_t)a1;
- (void)_updateRestrictionsAndForcePost:(uint64_t)a1;
- (void)_updateVisibilityPreferences;
- (void)addObserver:(id)a3;
- (void)beginPostingChanges;
- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)dealloc;
- (void)noteApplicationIdentifiersDidChangeWithAdded:(id)a3 replaced:(id)a4 removed:(id)a5;
- (void)noteRestrictionsMayHaveChanged;
- (void)removeObserver:(id)a3;
@end

@implementation SBApplicationRestrictionController

- (BOOL)isApplicationIdentifierRestricted:(id)a3
{
  return [(NSSet *)self->_restrictedIdentifiers containsObject:a3];
}

- (SBApplicationRestrictionController)initWithDataSource:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SBApplicationRestrictionController;
  v6 = [(SBApplicationRestrictionController *)&v29 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataSource, v5);
    v8 = +[SBDefaults localDefaults];
    uint64_t v9 = [v8 applicationDefaults];
    applicationDefaults = v7->_applicationDefaults;
    v7->_applicationDefaults = (SBApplicationDefaults *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tagValidityMap = v7->_tagValidityMap;
    v7->_tagValidityMap = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    validTagsByIdentifier = v7->_validTagsByIdentifier;
    v7->_validTagsByIdentifier = v13;

    v7->_tagsNotificationToken = (MGNotificationTokenStruct *)-1;
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    enabledTags = v7->_enabledTags;
    v7->_enabledTags = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    ratingRanksByIdentifier = v7->_ratingRanksByIdentifier;
    v7->_ratingRanksByIdentifier = v17;

    v7->_hasHideNonDefaultSystemAppsCapability = MGGetBoolAnswer();
    v19 = [(id)SBApp telephonyStateProvider];
    if (!v19)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:v7 file:@"SBApplicationRestrictionController.m" lineNumber:76 description:@"SBApplicationRestrictionController is being created before the telephony state provider"];
    }
    [v19 addObserver:v7];
    v20 = v7->_applicationDefaults;
    v21 = [NSString stringWithUTF8String:"shouldShowInternalApplications"];
    v30[0] = v21;
    v22 = [NSString stringWithUTF8String:"shouldShowNonDefaultSystemApplications"];
    v30[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __57__SBApplicationRestrictionController_initWithDataSource___block_invoke;
    v27[3] = &unk_1E6AF4AC0;
    v28 = v7;
    id v24 = (id)[(SBApplicationDefaults *)v20 observeDefaults:v23 onQueue:MEMORY[0x1E4F14428] withBlock:v27];
  }
  return v7;
}

void __57__SBApplicationRestrictionController_initWithDataSource___block_invoke(uint64_t a1)
{
}

- (void)_updateVisibilityPreferences
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 80);
    *(unsigned char *)(a1 + 80) = [*(id *)(a1 + 72) shouldShowInternalApplications];
    int v3 = *(unsigned __int8 *)(a1 + 82);
    int v4 = ([*(id *)(a1 + 72) shouldShowNonDefaultSystemApplications] & 1) != 0 || *(unsigned char *)(a1 + 81) == 0;
    *(unsigned char *)(a1 + 82) = v4;
    BOOL v5 = v3 == v4 && v2 == *(unsigned __int8 *)(a1 + 80);
    if (!v5 && [*(id *)(a1 + 16) count])
    {
      v6 = *(void **)(a1 + 16);
      -[SBApplicationRestrictionController _postRestrictionStateToObservers:](a1, v6);
    }
  }
}

- (SBApplicationRestrictionController)init
{
  return [(SBApplicationRestrictionController *)self initWithDataSource:0];
}

- (void)dealloc
{
  int v3 = [(id)SBApp telephonyStateProvider];
  [v3 removeObserver:self];

  if (self->_tagsNotificationToken != (MGNotificationTokenStruct *)-1) {
    MGCancelNotifications();
  }
  v4.receiver = self;
  v4.super_class = (Class)SBApplicationRestrictionController;
  [(SBApplicationRestrictionController *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBApplicationRestrictionController.m" lineNumber:104 description:@"observer cannot be nil"];

    id v5 = 0;
  }
  if (![(NSHashTable *)self->_observers containsObject:v5])
  {
    observers = self->_observers;
    if (!observers)
    {
      v7 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:16];
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v11];
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    -[SBApplicationRestrictionController _postRestrictionStateToObservers:]((uint64_t)self, v9);
  }
}

- (void)_postRestrictionStateToObservers:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 84))
  {
    *(unsigned char *)(a1 + 83) = [(id)a1 isAllowlistActiveAndTransient];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v9 applicationRestrictionControllerWillPostAppVisibilityUpdate:a1];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v6);
    }
    id v25 = v3;

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(a1 + 48)];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(a1 + 64)];
    [v11 addObject:@"hidden"];
    if (*(unsigned char *)(a1 + 80)) {
      [v10 addObject:@"SBInternalAppTag"];
    }
    if (*(unsigned char *)(a1 + 82)) {
      [v10 addObject:@"SBNonDefaultSystemAppTag"];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v13 = [WeakRetained bundleIdentifiersWithVisibilityOverrideHidden];
    [v11 unionSet:v13];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * j) applicationRestrictionController:a1 didUpdateVisibleTags:v10 hiddenTags:v11];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v16);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = v14;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v26 + 1) + 8 * k);
          if (objc_opt_respondsToSelector()) {
            [v24 applicationRestrictionControllerDidPostAppVisibilityUpdate:a1];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }

    id v3 = v25;
  }
}

- (void)removeObserver:(id)a3
{
}

- (id)allAllowedAppBundleIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = (void *)[(NSSet *)self->_restrictedIdentifiers copy];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v6 = [WeakRetained allBundleIdentifiers];
  uint64_t v7 = [v5 setWithArray:v6];

  [v7 minusSet:v4];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [WeakRetained alwaysAvailableApplicationBundleIdentifiers];
  v10 = [v8 setWithArray:v9];

  [v7 minusSet:v10];
  id v11 = (void *)[v7 copy];

  return v11;
}

- (id)allRestrictedAppBundleIdentifiers
{
  int v2 = (void *)[(NSSet *)self->_restrictedIdentifiers copy];
  return v2;
}

- (BOOL)isAllowlistActiveAndTransient
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  id v3 = [v2 effectiveWhitelistedAppBundleIDs];

  int v4 = [v2 BOOLRestrictionForFeature:@"SpringBoardShouldConsiderAppAllowlistAsTransient"];
  if (v3) {
    BOOL v5 = v4 == 1;
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = v5;

  return v6;
}

- (void)noteApplicationIdentifiersDidChangeWithAdded:(id)a3 replaced:(id)a4 removed:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v56 = a4;
  id v8 = a5;
  v55 = [MEMORY[0x1E4F1CAD0] setWithSet:self->_enabledTags];
  v61 = [MEMORY[0x1E4F1CA80] set];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v9 = [(NSMutableDictionary *)self->_validTagsByIdentifier allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v87 != v11) {
          objc_enumerationMutation(v9);
        }
        [v61 addObjectsFromArray:*(void *)(*((void *)&v86 + 1) + 8 * i)];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v86 objects:v96 count:16];
    }
    while (v10);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (v13)
  {
    int v62 = 0;
    uint64_t v14 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v82 + 1) + 8 * j);
        [(NSMutableDictionary *)self->_validTagsByIdentifier removeObjectForKey:v16];
        uint64_t v17 = [(NSMutableDictionary *)self->_ratingRanksByIdentifier objectForKey:v16];
        BOOL v18 = v17 == 0;

        if (!v18)
        {
          [(NSMutableDictionary *)self->_ratingRanksByIdentifier removeObjectForKey:v16];
          int v62 = 1;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
    }
    while (v13);
  }
  else
  {
    int v62 = 0;
  }

  id v19 = [MEMORY[0x1E4F1CA80] setWithSet:v57];
  [v19 unionSet:v56];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v58 = v19;
  uint64_t v20 = [v58 countByEnumeratingWithState:&v78 objects:v94 count:16];
  if (v20)
  {
    uint64_t v60 = *(void *)v79;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v79 != v60) {
          objc_enumerationMutation(v58);
        }
        uint64_t v22 = *(void *)(*((void *)&v78 + 1) + 8 * k);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        id v24 = [WeakRetained applicationWithBundleIdentifier:v22];

        id v25 = [v24 info];
        long long v26 = [v25 tags];

        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke;
        v77[3] = &unk_1E6B0DCB8;
        v77[4] = self;
        long long v27 = [v26 indexesOfObjectsPassingTest:v77];
        if ([v27 count])
        {
          uint64_t v28 = [v27 count];
          if (v28 != [v26 count])
          {
            uint64_t v29 = [v26 objectsAtIndexes:v27];

            long long v26 = (void *)v29;
          }
          [(NSMutableDictionary *)self->_validTagsByIdentifier setObject:v26 forKey:v22];
        }
        else
        {
          [(NSMutableDictionary *)self->_validTagsByIdentifier removeObjectForKey:v22];
        }
        long long v30 = [(NSMutableDictionary *)self->_ratingRanksByIdentifier objectForKey:v22];
        if ([v24 isSystemApplication])
        {
          if (v30)
          {
            [(NSMutableDictionary *)self->_ratingRanksByIdentifier removeObjectForKey:v22];
            int v62 = 1;
          }
        }
        else
        {
          long long v31 = NSNumber;
          long long v32 = [v24 info];
          long long v33 = objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "ratingRank"));

          if (([v33 isEqual:v30] & 1) == 0)
          {
            [(NSMutableDictionary *)self->_ratingRanksByIdentifier setObject:v33 forKey:v22];
            int v62 = 1;
          }
        }
      }
      uint64_t v20 = [v58 countByEnumeratingWithState:&v78 objects:v94 count:16];
    }
    while (v20);
  }

  long long v34 = [MEMORY[0x1E4F1CA80] set];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v35 = [(NSMutableDictionary *)self->_validTagsByIdentifier allValues];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v73 objects:v93 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v74;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v74 != v37) {
          objc_enumerationMutation(v35);
        }
        [v34 addObjectsFromArray:*(void *)(*((void *)&v73 + 1) + 8 * m)];
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v73 objects:v93 count:16];
    }
    while (v36);
  }

  if (self->_tagsNotificationToken != (MGNotificationTokenStruct *)-1)
  {
    if ([v34 isEqualToSet:v61]) {
      goto LABEL_64;
    }
    if (self->_tagsNotificationToken != (MGNotificationTokenStruct *)-1)
    {
      MGCancelNotifications();
      self->_tagsNotificationTokeuint64_t n = (MGNotificationTokenStruct *)-1;
    }
  }
  [(NSMutableSet *)self->_enabledTags removeAllObjects];
  if ([v34 count])
  {
    objc_initWeak(&from, self);
    [v34 allObjects];
    id v39 = MEMORY[0x1E4F14428];
    uint64_t v67 = MEMORY[0x1E4F143A8];
    uint64_t v68 = 3221225472;
    v69 = __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke_2;
    v70 = &unk_1E6B010D8;
    objc_copyWeak(&v71, &from);
    self->_tagsNotificationTokeuint64_t n = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    [v34 allObjects];
    v40 = (void *)MGCopyMultipleAnswers();
    uint64_t v41 = SBLogAppLibrary();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v91 = v40;
      _os_log_impl(&dword_1D85BA000, v41, OS_LOG_TYPE_INFO, " *|MGReset|* response=%@", buf, 0xCu);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v42 = v40;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v92 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v64;
      do
      {
        for (uint64_t n = 0; n != v43; ++n)
        {
          if (*(void *)v64 != v44) {
            objc_enumerationMutation(v42);
          }
          v46 = *(const void **)(*((void *)&v63 + 1) + 8 * n);
          Value = CFDictionaryGetValue((CFDictionaryRef)v42, v46);
          CFTypeID v48 = CFGetTypeID(Value);
          if (v48 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)Value)) {
            [(NSMutableSet *)self->_enabledTags addObject:v46];
          }
        }
        uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v92 count:16];
      }
      while (v43);
    }

    if (v42) {
      CFRelease(v42);
    }
    objc_destroyWeak(&v71);
    objc_destroyWeak(&from);
  }
LABEL_64:
  v49 = [MEMORY[0x1E4F74230] sharedConnection];
  v50 = [v49 effectiveWhitelistedAppBundleIDs];

  if (v50)
  {
    if ([v57 count]) {
      BOOL v51 = 1;
    }
    else {
      BOOL v51 = [obj count] != 0;
    }
  }
  else
  {
    BOOL v51 = 0;
  }
  char v52 = [(NSMutableSet *)self->_enabledTags isEqualToSet:v55];
  char v53 = v52;
  if ((v62 | v51))
  {
    v54 = SBLogAppLibrary();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v91 = v62 & 1;
      *(_WORD *)&v91[4] = 1024;
      *(_DWORD *)&v91[6] = v51;
      _os_log_impl(&dword_1D85BA000, v54, OS_LOG_TYPE_INFO, "restriction update: installed change - rankChange=%{BOOL}u allowedAppsFilterChange=%{BOOL}u", buf, 0xEu);
    }

    -[SBApplicationRestrictionController _updateRestrictionsAndForcePost:]((uint64_t)self, v53 ^ 1);
  }
  else if ((v52 & 1) == 0)
  {
    -[SBApplicationRestrictionController _postRestrictionState]((uint64_t)self);
  }
}

uint64_t __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v3];
  if (!v4)
  {
    int v4 = [NSNumber numberWithBool:MGIsQuestionValid()];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKey:v3];
  }
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

void __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = (const void *)MGCopyAnswer();
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v6 = SBLogAppLibrary();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [WeakRetained[6] containsObject:a2];
    int v9 = 138412802;
    uint64_t v10 = a2;
    __int16 v11 = 1024;
    int v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, " *|MGUpdate|* tag=%@ old=%i new=%@", (uint8_t *)&v9, 0x1Cu);
  }

  if (v4)
  {
    CFTypeID v8 = CFGetTypeID(v4);
    if (v8 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4)) {
      [WeakRetained[6] addObject:a2];
    }
    else {
      [WeakRetained[6] removeObject:a2];
    }
    CFRelease(v4);
  }
  -[SBApplicationRestrictionController _postRestrictionState]((uint64_t)WeakRetained);
}

- (void)_postRestrictionState
{
  if (a1 && [*(id *)(a1 + 16) count])
  {
    int v2 = *(void **)(a1 + 16);
    -[SBApplicationRestrictionController _postRestrictionStateToObservers:](a1, v2);
  }
}

- (void)_updateRestrictionsAndForcePost:(uint64_t)a1
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v4 = [MEMORY[0x1E4F74230] sharedConnection];
    [v4 invalidateRestrictionCache];
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v7 = [v4 restrictedAppBundleIDs];
    if (v7) {
      [v5 unionSet:v7];
    }
    v54 = (void *)v7;
    v55 = [v4 effectiveWhitelistedAppBundleIDs];
    if (v55 && ([v4 isInSingleAppMode] & 1) == 0)
    {
      CFTypeID v8 = [WeakRetained allBundleIdentifiers];
      int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v8];
      [v9 minusSet:v55];
      [v5 unionSet:v9];
    }
    [v4 effectiveValueForSetting:*MEMORY[0x1E4F740B0]];
    id v57 = WeakRetained;
    id v56 = v58 = v4;
    if (v56)
    {
      char v52 = a2;
      int v10 = [v56 intValue];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v11 = *(id *)(a1 + 56);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v70 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v69 + 1) + 8 * i);
            uint64_t v17 = [*(id *)(a1 + 56) objectForKey:v16];
            int v18 = [v17 intValue];

            if (v18 > v10) {
              [v5 addObject:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v69 objects:v77 count:16];
        }
        while (v13);
      }

      id WeakRetained = v57;
      int v4 = v58;
      a2 = v52;
    }
    id v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = [WeakRetained alwaysAvailableApplicationBundleIdentifiers];
    uint64_t v21 = [v19 setWithArray:v20];

    char v53 = (void *)v21;
    [v5 minusSet:v21];
    uint64_t v22 = +[SBTelephonyManager sharedTelephonyManager];
    v23 = [v22 carrierDisabledApplicationIDs];

    if (v23) {
      [v5 unionSet:v23];
    }
    BOOL v51 = v23;
    if (([v4 isAppClipsAllowed] & 1) == 0)
    {
      char v24 = a2;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v25 = [WeakRetained allApplications];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v65 objects:v76 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v66 != v28) {
              objc_enumerationMutation(v25);
            }
            long long v30 = *(void **)(*((void *)&v65 + 1) + 8 * j);
            long long v31 = [v30 info];
            int v32 = [v31 isAppClip];

            if (v32)
            {
              long long v33 = [v30 bundleIdentifier];
              [v5 addObject:v33];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v65 objects:v76 count:16];
        }
        while (v27);
      }

      id WeakRetained = v57;
      a2 = v24;
      v23 = v51;
    }
    if (([*(id *)(a1 + 64) isEqualToSet:v5] & 1) == 0)
    {
      long long v34 = SBLogCommon();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v75 = v5;
        _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "New list of restricted identifiers: %@", buf, 0xCu);
      }

      uint64_t v35 = [v5 copy];
      uint64_t v36 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v35;

      uint64_t v37 = +[SBApplicationController sharedInstanceIfExists];
      v38 = [MEMORY[0x1E4F1CA80] set];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v39 = [(id)SBApp windowSceneManager];
      v40 = [v39 connectedWindowScenes];

      uint64_t v41 = [v40 countByEnumeratingWithState:&v61 objects:v73 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v62;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v62 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = [*(id *)(*((void *)&v61 + 1) + 8 * k) sceneManager];
            v46 = [v45 externalApplicationSceneHandlesForBundleIdentifiers:v5];
            [v38 unionSet:v46];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v61 objects:v73 count:16];
        }
        while (v42);
      }

      a2 = 1;
      v47 = SBApplicationSceneEntityDestructionMakeIntent(1, 1);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke;
      v59[3] = &unk_1E6AFDDB0;
      v59[4] = a1;
      id v60 = v37;
      id v48 = v37;
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v38, v47, v59);

      id WeakRetained = v57;
      v23 = v51;
    }
    int v49 = *(unsigned __int8 *)(a1 + 83);
    int v50 = [(id)a1 isAllowlistActiveAndTransient];
    if ((a2 & 1) != 0 || v49 != v50)
    {
      if ([*(id *)(a1 + 16) count]) {
        -[SBApplicationRestrictionController _postRestrictionStateToObservers:](a1, *(void **)(a1 + 16));
      }
    }
  }
}

- (void)noteRestrictionsMayHaveChanged
{
}

- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  uint64_t v5 = SBLogAppLibrary();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "restriction update: carrier change", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SBApplicationRestrictionController_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__SBApplicationRestrictionController_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
}

- (void)beginPostingChanges
{
  if (!self->_canPostRestrictionState)
  {
    -[SBApplicationRestrictionController _updateVisibilityPreferences]((uint64_t)self);
    if (!self->_restrictedIdentifiers) {
      -[SBApplicationRestrictionController _updateRestrictionsAndForcePost:]((uint64_t)self, 0);
    }
    self->_canPostRestrictionState = 1;
    -[SBApplicationRestrictionController _postRestrictionState]((uint64_t)self);
  }
}

void __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke_2;
  v2[3] = &unk_1E6B0DCE0;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

void __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) applicationWithBundleIdentifier:v3];
  uint64_t v5 = [v4 processState];
  int v6 = [v5 isRunning];

  if (v6)
  {
    uint64_t v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      int v10 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Killing %@ because it has been disabled", (uint8_t *)&v9, 0xCu);
    }

    SBWorkspaceKillApplication(v4, 1, @"app has been disabled/restricted", 0);
  }
  if ([v3 isEqualToString:@"com.apple.AppStore"])
  {
    CFTypeID v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "App for rdar://67699908 is restricted", (uint8_t *)&v9, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationDefaults, 0);
  objc_storeStrong((id *)&self->_restrictedIdentifiers, 0);
  objc_storeStrong((id *)&self->_ratingRanksByIdentifier, 0);
  objc_storeStrong((id *)&self->_enabledTags, 0);
  objc_storeStrong((id *)&self->_validTagsByIdentifier, 0);
  objc_storeStrong((id *)&self->_tagValidityMap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end