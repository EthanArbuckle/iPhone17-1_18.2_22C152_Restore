@interface SBProactiveLibraryCategoryMapProviderSource
- (BOOL)_shouldRemoveRecentsPodWithLastKnownRecentApps:(id)a3;
- (NSString)sourceName;
- (SBHLibraryCategoryMapProviderSourceDelegate)delegate;
- (SBProactiveLibraryCategoryMapProviderSource)init;
- (void)handleUpdateCategoriesNotification:(id)a3;
- (void)requestLibraryCategoryMapWithOptions:(unint64_t)a3 existingLibraryCategoryMap:(id)a4 forbiddenApplicationIdentifiers:(id)a5 sessionId:(unint64_t)a6 queue:(id)a7 completion:(id)a8;
- (void)setDelegate:(id)a3;
@end

@implementation SBProactiveLibraryCategoryMapProviderSource

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    v4 = [v10 recentApps];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      v2 = [v10 recentApps];
      v6 = (void *)[v2 copy];
    }
    else
    {
      v6 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v6);
    if (v5)
    {
    }
  }
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    v7 = [v10 predictedApps];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      v2 = [v10 predictedApps];
      v9 = (void *)[v2 copy];
    }
    else
    {
      v9 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v9);
    if (v8)
    {
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)requestLibraryCategoryMapWithOptions:(unint64_t)a3 existingLibraryCategoryMap:(id)a4 forbiddenApplicationIdentifiers:(id)a5 sessionId:(unint64_t)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v79 = a4;
  id v77 = a5;
  v14 = a7;
  id v75 = a8;
  dispatch_queue_t queue = v14;
  BSDispatchQueueAssert();
  if (![(NSArray *)self->_lastKnownGoodSuggestions count])
  {
    lastKnownGoodSuggestions = self->_lastKnownGoodSuggestions;
    self->_lastKnownGoodSuggestions = 0;
  }
  if (![(NSArray *)self->_lastKnownGoodRecentApps count])
  {
    lastKnownGoodRecentApps = self->_lastKnownGoodRecentApps;
    self->_lastKnownGoodRecentApps = 0;
  }
  if (self->_lastKnownGoodSuggestions)
  {
    if (self->_lastKnownGoodRecentApps) {
      goto LABEL_25;
    }
  }
  else
  {
    v17 = [v79 categoryIdentifiers];
    v18 = getSuggestedCategoryIdentifier(v17);

    if (v18)
    {
      v19 = [v79 sortedApplicationIdentifiersForCategoryIdentifier:v18];
      v20 = (NSArray *)[v19 copy];
      v21 = self->_lastKnownGoodSuggestions;
      self->_lastKnownGoodSuggestions = v20;
    }
    if (self->_lastKnownGoodRecentApps) {
      goto LABEL_14;
    }
  }
  v22 = [v79 categoryIdentifiers];
  v23 = getRecentsCategoryIdentifier(v22);

  if (v23)
  {
    v24 = [v79 sortedApplicationIdentifiersForCategoryIdentifier:v23];
    v25 = (NSArray *)[v24 copy];
    v26 = self->_lastKnownGoodRecentApps;
    self->_lastKnownGoodRecentApps = v25;
  }
LABEL_14:
  if (![(NSArray *)self->_lastKnownGoodSuggestions count]
    || ![(NSArray *)self->_lastKnownGoodRecentApps count])
  {
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    appDirectoryClient = self->_appDirectoryClient;
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke;
    v116[3] = &unk_1E6B09260;
    v116[4] = self;
    v29 = v27;
    v117 = v29;
    [(ATXAppDirectoryClient *)appDirectoryClient predictedAppsAndRecentAppsWithShouldUseDefaultCategories:1 reply:v116];
    dispatch_time_t v30 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v29, v30))
    {
      v31 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        [(SBProactiveLibraryCategoryMapProviderSource *)a6 requestLibraryCategoryMapWithOptions:v32 existingLibraryCategoryMap:v33 forbiddenApplicationIdentifiers:v34 sessionId:v35 queue:v36 completion:v37];
      }
    }
    if (![(NSArray *)self->_lastKnownGoodSuggestions count])
    {
      v38 = self->_lastKnownGoodSuggestions;
      self->_lastKnownGoodSuggestions = (NSArray *)&unk_1F3348360;

      v39 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        [(SBProactiveLibraryCategoryMapProviderSource *)a6 requestLibraryCategoryMapWithOptions:v40 existingLibraryCategoryMap:v41 forbiddenApplicationIdentifiers:v42 sessionId:v43 queue:v44 completion:v45];
      }
    }
  }
LABEL_25:
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x2020000000;
  v115[3] = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  v114[3] = 0;
  v46 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  if ([v77 count])
  {
    v47 = (void *)MEMORY[0x1E4F28F60];
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_40;
    v112[3] = &unk_1E6B09288;
    id v113 = v77;
    uint64_t v48 = [v47 predicateWithBlock:v112];

    v46 = (void *)v48;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (!v79 || (a3 & 1) != 0) {
    uint64_t v50 = objc_opt_new();
  }
  else {
    uint64_t v50 = [v79 mutableCopy];
  }
  v51 = (void *)v50;
  v52 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a6;
    _os_log_impl(&dword_1D85BA000, v52, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshing proactive library category source", (uint8_t *)&buf, 0xCu);
  }

  v53 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__87;
  v123 = __Block_byref_object_dispose__87;
  id v124 = 0;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x3032000000;
  v110[3] = __Block_byref_object_copy__87;
  v110[4] = __Block_byref_object_dispose__87;
  id v111 = 0;
  v54 = (void *)MEMORY[0x1E4F1CA60];
  v55 = [NSNumber numberWithUnsignedInteger:a6];
  v56 = [v54 dictionaryWithObject:v55 forKey:*MEMORY[0x1E4FA65C0]];

  int v57 = objc_msgSend(v51, "sb_hasAppsPopulatedForCategoriesOtherThanProactive");
  if ((a3 & 0x10) != 0)
  {
    v58 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v118 = 134217984;
      unint64_t v119 = a6;
      _os_log_impl(&dword_1D85BA000, v58, OS_LOG_TYPE_DEFAULT, "(%ld) We are requesting the defaults because the passed options indicated there is no cache, so we need data fast. ", v118, 0xCu);
    }
  }
  if (!((a3 >> 2) & 1 | v57 & 1))
  {
    v59 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      [(SBProactiveLibraryCategoryMapProviderSource *)a6 requestLibraryCategoryMapWithOptions:v60 existingLibraryCategoryMap:v61 forbiddenApplicationIdentifiers:v62 sessionId:v63 queue:v64 completion:v65];
    }
  }
  if ((a3 >> 2) & 1 | v57 ^ 1u)
  {
    v66 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v118 = 134217984;
      unint64_t v119 = a6;
      _os_log_impl(&dword_1D85BA000, v66, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshing proactive library category source 'Categories'", v118, 0xCu);
    }

    CFAbsoluteTime v67 = CFAbsoluteTimeGetCurrent();
    dispatch_group_enter(v53);
    v68 = self->_appDirectoryClient;
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_45;
    v101[3] = &unk_1E6B09300;
    v106 = v114;
    CFAbsoluteTime v108 = v67;
    v102 = queue;
    p_long long buf = &buf;
    unint64_t v109 = a6;
    id v103 = v51;
    id v104 = v46;
    v105 = v53;
    [(ATXAppDirectoryClient *)v68 categoriesWithShouldUseDefault:(a3 >> 4) & 1 reply:v101];
  }
  if ((a3 & 2) != 0)
  {
    v69 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v118 = 134217984;
      unint64_t v119 = a6;
      _os_log_impl(&dword_1D85BA000, v69, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshing proactive library category source 'Suggestions/Recents/Hidden'", v118, 0xCu);
    }

    CFAbsoluteTime v70 = CFAbsoluteTimeGetCurrent();
    dispatch_group_enter(v53);
    v71 = self->_appDirectoryClient;
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_51;
    v90[3] = &unk_1E6B09350;
    v97 = v115;
    CFAbsoluteTime v99 = v70;
    v98 = v110;
    unint64_t v100 = a6;
    v91 = queue;
    v92 = self;
    id v93 = v46;
    id v94 = v51;
    id v95 = v56;
    v96 = v53;
    [(ATXAppDirectoryClient *)v71 predictedAppsAndRecentAppsWithShouldUseDefaultCategories:(a3 >> 4) & 1 reply:v90];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_55;
  block[3] = &unk_1E6B09378;
  id v81 = v51;
  id v82 = v56;
  CFAbsoluteTime v88 = Current;
  id v83 = v76;
  v84 = &buf;
  unint64_t v89 = a3;
  v85 = v114;
  v86 = v115;
  unint64_t v87 = a6;
  id v72 = v76;
  id v73 = v56;
  id v74 = v51;
  dispatch_group_notify(v53, queue, block);

  _Block_object_dispose(v110, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(v115, 8);
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_55(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v3 = [*(id *)(a1 + 32) categoryIdentifiers];
  v4 = getRecentsCategoryIdentifier(v3);
  uint64_t v5 = getSuggestedCategoryIdentifier(v3);
  uint64_t v6 = getHiddenAppsCategoryIdentifier(v3);
  v7 = [*(id *)(a1 + 32) categoryIdentifiers];
  if ([v7 containsObject:v5])
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = [*(id *)(a1 + 32) sortedApplicationIdentifiersForCategoryIdentifier:v5];
    BOOL v8 = [v9 count] != 0;
  }
  id v10 = [*(id *)(a1 + 32) categoryIdentifiers];
  if ([v10 containsObject:v4])
  {
    BOOL v11 = 1;
  }
  else
  {
    v12 = [*(id *)(a1 + 32) sortedApplicationIdentifiersForCategoryIdentifier:v4];
    BOOL v11 = [v12 count] != 0;
  }
  v13 = [*(id *)(a1 + 32) categoryIdentifiers];
  v55 = (void *)v6;
  if ([v13 containsObject:v6])
  {
    BOOL v14 = 1;
  }
  else
  {
    v15 = [*(id *)(a1 + 32) sortedApplicationIdentifiersForCategoryIdentifier:v6];
    BOOL v14 = [v15 count] != 0;
  }
  v16 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 80);
    *(_DWORD *)long long buf = 134218752;
    uint64_t v58 = v17;
    __int16 v59 = 1024;
    *(_DWORD *)uint64_t v60 = v8;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v11;
    __int16 v61 = 1024;
    BOOL v62 = v14;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "(%ld) Finished refreshing proactive library category source; hasPredictedApps: %{BOOL}d; hasRecentApps: %{BOOL}d h"
      "asHiddenApps: %{BOOL}d",
      buf,
      0x1Eu);
  }

  if (v8 || v11 || v14)
  {
    v18 = [*(id *)(a1 + 32) categoryIdentifiers];
    v19 = (void *)[v18 mutableCopy];

    v56[0] = v4;
    v56[1] = v5;
    v56[2] = v55;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
    [v19 removeObjectsInArray:v20];

    if (v11)
    {
      [v19 insertObject:v4 atIndex:0];
      v21 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v54 = v3;
        v22 = v5;
        id v23 = v2;
        uint64_t v24 = *(void *)(a1 + 80);
        v25 = [*(id *)(a1 + 32) sortedApplicationIdentifiersForCategoryIdentifier:v4];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v58 = v24;
        id v2 = v23;
        uint64_t v5 = v22;
        v3 = v54;
        __int16 v59 = 2112;
        *(void *)uint64_t v60 = v25;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched Recent apps: %@", buf, 0x16u);
      }
      if (!v8)
      {
LABEL_17:
        v26 = SBLogProactiveAppLibrary();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = *(void *)(a1 + 80);
          *(_DWORD *)long long buf = 134217984;
          uint64_t v58 = v27;
          _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "(%ld) No predicted apps...", buf, 0xCu);
        }

        [*(id *)(a1 + 32) setSortedApplicationIdentifiers:MEMORY[0x1E4F1CBF0] forCategoryIdentifier:v5];
LABEL_26:
        uint64_t v33 = [MEMORY[0x1E4F4B7F8] sharedManager];
        int v34 = [v33 isAppHidingAvailable];

        if (v34)
        {
          [v19 addObject:v55];
          uint64_t v35 = SBLogProactiveAppLibrary();
          BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v36)
            {
              uint64_t v37 = *(void *)(a1 + 80);
              v38 = [*(id *)(a1 + 32) sortedApplicationIdentifiersForCategoryIdentifier:v55];
              *(_DWORD *)long long buf = 134218242;
              uint64_t v58 = v37;
              __int16 v59 = 2112;
              *(void *)uint64_t v60 = v38;
              _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched Hidden apps: %@", buf, 0x16u);
            }
          }
          else
          {
            if (v36)
            {
              uint64_t v39 = *(void *)(a1 + 80);
              *(_DWORD *)long long buf = 134217984;
              uint64_t v58 = v39;
              _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "(%ld) No Hidden apps...", buf, 0xCu);
            }

            [*(id *)(a1 + 32) setSortedApplicationIdentifiers:MEMORY[0x1E4F1CBF0] forCategoryIdentifier:v55];
          }
        }
        [*(id *)(a1 + 32) setCategoryIdentifiers:v19];

        goto LABEL_35;
      }
    }
    else
    {
      v28 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(void *)(a1 + 80);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v58 = v29;
        _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "(%ld) No recent apps...", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setSortedApplicationIdentifiers:MEMORY[0x1E4F1CBF0] forCategoryIdentifier:v4];
      if (!v8) {
        goto LABEL_17;
      }
    }
    [v19 insertObject:v5 atIndex:0];
    dispatch_time_t v30 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 80);
      uint64_t v32 = [*(id *)(a1 + 32) sortedApplicationIdentifiersForCategoryIdentifier:v5];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v58 = v31;
      __int16 v59 = 2112;
      *(void *)uint64_t v60 = v32;
      _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched Predicted apps: %@", buf, 0x16u);
    }
    goto LABEL_26;
  }
LABEL_35:
  [*(id *)(a1 + 32) setMetadata:*(void *)(a1 + 40)];
  double Current = CFAbsoluteTimeGetCurrent();
  double v41 = *(double *)(a1 + 88);
  uint64_t v42 = *(void *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(void, void, id))(v42 + 16))(*(void *)(a1 + 48), 0, v2);
    uint64_t v43 = v55;
  }
  else
  {
    uint64_t v44 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, void *, void))(v42 + 16))(v42, v44, 0);

    uint64_t v45 = *(void *)(a1 + 96);
    uint64_t v43 = v55;
    if ((v45 & 4) != 0)
    {
      v46 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = *(void *)(a1 + 80);
        uint64_t v48 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v58 = v47;
        __int16 v59 = 2048;
        *(void *)uint64_t v60 = v48;
        _os_log_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_DEFAULT, "(%ld) Query response time for proactive library category source 'Categories' time: %f seconds ", buf, 0x16u);
      }

      uint64_t v45 = *(void *)(a1 + 96);
    }
    if ((v45 & 2) != 0)
    {
      v49 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = *(void *)(a1 + 80);
        uint64_t v51 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        *(_DWORD *)long long buf = 134218240;
        uint64_t v58 = v50;
        __int16 v59 = 2048;
        *(void *)uint64_t v60 = v51;
        _os_log_impl(&dword_1D85BA000, v49, OS_LOG_TYPE_DEFAULT, "(%ld) Query response time for proactive library category source 'Suggestions/Recents' time: %f seconds", buf, 0x16u);
      }
    }
  }
  v52 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v53 = *(void *)(a1 + 80);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v58 = v53;
    __int16 v59 = 2048;
    *(double *)uint64_t v60 = Current - v41;
    _os_log_impl(&dword_1D85BA000, v52, OS_LOG_TYPE_DEFAULT, "(%ld) Total query response time for proactive library queries time: %f seconds", buf, 0x16u);
  }
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v2);
    v3 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52_cold_3();
    }
  }
  int v4 = [*(id *)(a1 + 40) _shouldRemoveRecentsPodWithLastKnownRecentApps:*(void *)(*(void *)(a1 + 40) + 24)];
  uint64_t v5 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 88);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v98 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%ld) Finished refreshing proactive library category source 'Suggestions/Recents/Hidden'", buf, 0xCu);
  }

  v7 = [*(id *)(a1 + 32) recentApps];
  uint64_t v8 = [v7 count];
  v9 = SBLogProactiveAppLibrary();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 88);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v98 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "(%ld) Attempting _lastKnownGoodRecentApps update", buf, 0xCu);
    }

    if ([v7 isEqual:*(void *)(*(void *)(a1 + 40) + 24)])
    {
      v12 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 88);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v98 = v13;
        BOOL v14 = "(%ld) _lastKnownGoodRecentApps is same; skipping update";
LABEL_19:
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v16 = [v7 copy];
      uint64_t v17 = *(void *)(a1 + 40);
      v18 = *(void **)(v17 + 24);
      *(void *)(v17 + 24) = v16;

      v12 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 88);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v98 = v19;
        BOOL v14 = "(%ld) Updated _lastKnownGoodRecentApps";
        goto LABEL_19;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v10)
  {
    uint64_t v15 = *(void *)(a1 + 88);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v98 = v15;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched recents apps has no apps; using last known good recent apps",
      buf,
      0xCu);
  }

  if ((v4 & 1) == 0)
  {
    v12 = v7;
    v7 = *(id *)(*(void *)(a1 + 40) + 24);
    goto LABEL_20;
  }
LABEL_21:
  v20 = (void *)MEMORY[0x1E4F1CAA0];
  id v95 = v7;
  v21 = [v7 filteredArrayUsingPredicate:*(void *)(a1 + 48)];
  v22 = [v20 orderedSetWithArray:v21];

  id v23 = [*(id *)(a1 + 56) categoryIdentifiers];
  uint64_t v24 = getRecentsCategoryIdentifier(v23);
  v96 = v2;
  if ([v22 count])
  {
    v25 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 88);
      *(_DWORD *)long long buf = 134218242;
      uint64_t v98 = v26;
      __int16 v99 = 2112;
      unint64_t v100 = v22;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "(%ld) Received recent apps: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 4);
    [*(id *)(a1 + 56) addCategoryIdentifier:v24];
    uint64_t v27 = *(void **)(a1 + 56);
    v28 = [v22 array];
    [v27 setSortedApplicationIdentifiers:v28 forCategoryIdentifier:v24];
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 4);
      uint64_t v29 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 88);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v98 = v30;
        _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "(%ld) Removing Recents Pod as the last known recents app is now hidden)", buf, 0xCu);
      }
    }
    v28 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52_cold_2(a1, v28, v31, v32, v33, v34, v35, v36);
    }
  }

  uint64_t v37 = getSuggestedCategoryIdentifier(v23);
  v38 = [*(id *)(a1 + 32) predictedApps];
  uint64_t v39 = [v38 count];
  uint64_t v40 = SBLogProactiveAppLibrary();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  id v93 = (void *)v24;
  id v94 = v22;
  if (v39)
  {
    if (v41)
    {
      uint64_t v42 = *(void *)(a1 + 88);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v98 = v42;
      _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "(%ld) Attempting _lastKnownGoodSuggestions update", buf, 0xCu);
    }

    if ([v38 isEqual:*(void *)(*(void *)(a1 + 40) + 16)])
    {
      uint64_t v43 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = *(void *)(a1 + 88);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v98 = v44;
        uint64_t v45 = "(%ld) _lastKnownGoodSuggestions is same; skipping update";
LABEL_44:
        _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, v45, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v50 = [v38 copy];
      uint64_t v51 = *(void *)(a1 + 40);
      v52 = *(void **)(v51 + 16);
      *(void *)(v51 + 16) = v50;

      uint64_t v43 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = *(void *)(a1 + 88);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v98 = v53;
        uint64_t v45 = "(%ld) Updated _lastKnownGoodSuggestions";
        goto LABEL_44;
      }
    }
LABEL_45:

    uint64_t v43 = v38;
    goto LABEL_46;
  }
  if (v41)
  {
    uint64_t v46 = *(void *)(a1 + 88);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v98 = v46;
    _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "(%ld) Fetched predicted apps has no apps; using last known good recent apps",
      buf,
      0xCu);
  }

  uint64_t v43 = *(id *)(*(void *)(a1 + 40) + 16);
  uint64_t v47 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  if (v47)
  {
    uint64_t v48 = v47;
    char v49 = [v47 BOOLValue];

    if ((v49 & 1) == 0)
    {
      v38 = 0;
      goto LABEL_45;
    }
  }
LABEL_46:
  v54 = (void *)MEMORY[0x1E4F1CAA0];
  v55 = [v43 filteredArrayUsingPredicate:*(void *)(a1 + 48)];
  v56 = [v54 orderedSetWithArray:v55];

  uint64_t v57 = [v56 count];
  uint64_t v58 = SBLogProactiveAppLibrary();
  __int16 v59 = v58;
  v92 = (void *)v37;
  if (v57)
  {
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = *(void *)(a1 + 88);
      *(_DWORD *)long long buf = 134218242;
      uint64_t v98 = v60;
      __int16 v99 = 2112;
      unint64_t v100 = v56;
      _os_log_impl(&dword_1D85BA000, v59, OS_LOG_TYPE_DEFAULT, "(%ld) Received predicted apps: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 3);
    [*(id *)(a1 + 56) addCategoryIdentifier:v37];
    __int16 v61 = *(void **)(a1 + 56);
    BOOL v62 = [v56 array];
    [v61 setSortedApplicationIdentifiers:v62 forCategoryIdentifier:v37];
    goto LABEL_50;
  }
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
    __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52_cold_1(a1, v59, v79, v80, v81, v82, v83, v84);
  }

  v85 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  if (v85)
  {
    v86 = v85;
    char v87 = [v85 BOOLValue];

    if ((v87 & 1) == 0)
    {
      BOOL v62 = [*(id *)(a1 + 56) categoryIdentifiers];
      CFAbsoluteTime v88 = getSuggestedCategoryIdentifier(v62);
      [*(id *)(a1 + 56) removeCategoryIdentifier:v88];
      [*(id *)(a1 + 56) setSortedApplicationIdentifiers:MEMORY[0x1E4F1CBF0] forCategoryIdentifier:v88];

LABEL_50:
    }
  }
  uint64_t v63 = getHiddenAppsCategoryIdentifier(v23);
  uint64_t v64 = [*(id *)(a1 + 32) hiddenAppsCategory];
  uint64_t v65 = [v64 appBundleIDs];
  v66 = (void *)MEMORY[0x1E4F1CAA0];
  CFAbsoluteTime v67 = [v65 filteredArrayUsingPredicate:*(void *)(a1 + 48)];
  v68 = [v66 orderedSetWithArray:v67];

  v69 = [MEMORY[0x1E4F4B7F8] sharedManager];
  char v70 = [v69 isAppHidingAvailable];

  if (v70)
  {
    uint64_t v71 = [v68 count];
    id v72 = SBLogProactiveAppLibrary();
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    if (v71)
    {
      if (v73)
      {
        uint64_t v74 = *(void *)(a1 + 88);
        *(_DWORD *)long long buf = 134218242;
        uint64_t v98 = v74;
        __int16 v99 = 2112;
        unint64_t v100 = v68;
        _os_log_impl(&dword_1D85BA000, v72, OS_LOG_TYPE_DEFAULT, "(%ld) Received hidden apps: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 7);
      [*(id *)(a1 + 56) addCategoryIdentifier:v63];
      id v75 = *(void **)(a1 + 56);
      v76 = [v68 array];
      [v75 setSortedApplicationIdentifiers:v76 forCategoryIdentifier:v63];
    }
    else
    {
      if (v73)
      {
        uint64_t v89 = *(void *)(a1 + 88);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v98 = v89;
        _os_log_impl(&dword_1D85BA000, v72, OS_LOG_TYPE_DEFAULT, "(%ld) No hidden apps received!", buf, 0xCu);
      }

      v90 = [*(id *)(a1 + 56) categoryIdentifiers];
      v91 = getHiddenAppsCategoryIdentifier(v90);
      [*(id *)(a1 + 56) removeCategoryIdentifier:v91];
      [*(id *)(a1 + 56) addCategoryIdentifier:v91];
      [*(id *)(a1 + 56) setSortedApplicationIdentifiers:MEMORY[0x1E4F1CBF0] forCategoryIdentifier:v91];
    }
  }
  else
  {
    id v77 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v78 = *(void *)(a1 + 88);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v98 = v78;
      _os_log_impl(&dword_1D85BA000, v77, OS_LOG_TYPE_DEFAULT, "(%ld) Removing hidden pod because app protection says hiding isn't available", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "sb_removeCategoryWithIdentifier:", 7);
  }
  [*(id *)(a1 + 64) setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FA65B8]];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (BOOL)_shouldRemoveRecentsPodWithLastKnownRecentApps:(id)a3
{
  id v3 = a3;
  if ([v3 count] != 1) {
    goto LABEL_4;
  }
  int v4 = (void *)MEMORY[0x1E4F4B7E0];
  uint64_t v5 = [v3 firstObject];
  uint64_t v6 = [v4 applicationWithBundleIdentifier:v5];

  LOBYTE(v5) = [v6 isHidden];
  if (v5) {
    BOOL v7 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v7 = 0;

  return v7;
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_51(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = CFAbsoluteTimeGetCurrent()
                                                                      - *(double *)(a1 + 96);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52;
  v9[3] = &unk_1E6B09328;
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v16 = *(void *)(a1 + 88);
  uint64_t v17 = v4;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = *(void **)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v7;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 72);
  id v8 = v3;
  dispatch_async(v6, v9);
}

- (SBProactiveLibraryCategoryMapProviderSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBProactiveLibraryCategoryMapProviderSource;
  id v2 = [(SBProactiveLibraryCategoryMapProviderSource *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AEB8] sharedInstance];
    appDirectoryClient = v2->_appDirectoryClient;
    v2->_appDirectoryClient = (ATXAppDirectoryClient *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:v2 selector:sel_handleUpdateCategoriesNotification_ name:*MEMORY[0x1E4F4B468] object:0 suspensionBehavior:4];
  }
  return v2;
}

- (NSString)sourceName
{
  return (NSString *)@"proactive";
}

uint64_t __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_40(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CFAbsoluteTimeGetCurrent()
                                                                      - *(double *)(a1 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2;
  block[3] = &unk_1E6B092D8;
  uint64_t v7 = *(void *)(a1 + 72);
  id v13 = v6;
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v18 = v7;
  uint64_t v19 = v8;
  v9 = *(NSObject **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v2);
    uint64_t v3 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sb_stripCategoriesThatArentFromProactive");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_46;
    v7[3] = &unk_1E6B092B0;
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v8 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 40);
    [v4 enumerateObjectsUsingBlock:v7];
    id v5 = SBLogProactiveAppLibrary();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 80);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%ld) Refreshed proactive library category source 'Categories'", buf, 0xCu);
    }

    uint64_t v3 = v8;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_46(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA70];
  id v18 = v5;
  uint64_t v7 = [v5 appBundleIDs];
  uint64_t v8 = [v7 filteredArrayUsingPredicate:*(void *)(a1 + 32)];
  id v9 = [v6 orderedSetWithArray:v8];

  if ([v9 count])
  {
    id v10 = objc_alloc(MEMORY[0x1E4FA62D8]);
    uint64_t v11 = [v18 categoryID];
    uint64_t v12 = objc_msgSend(v18, "localizedStringForCategoryID:", objc_msgSend(v18, "categoryID"));
    id v13 = (void *)[v10 initWithPredictionCategoryID:v11 categoryIndex:a3 localizedDisplayName:v12 localizedDisplayNameKey:0];

    [*(id *)(a1 + 40) addCategoryIdentifier:v13];
    id v14 = *(void **)(a1 + 40);
    id v15 = [v9 array];
    [v14 setSortedApplicationIdentifiers:v15 forCategoryIdentifier:v13];

    id v16 = *(void **)(a1 + 40);
    id v17 = [v13 localizedDisplayName];
    [v16 setLocalizedCategoryName:v17 forCategoryIdentifier:v13];
  }
}

- (void)handleUpdateCategoriesNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogProactiveAppLibrary();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Proactive is requesting a refresh all because of notification: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(SBProactiveLibraryCategoryMapProviderSource *)self delegate];
  [v6 requestLibraryCategoryMapUpdateWithRefreshOptions:6 source:self];
}

- (SBHLibraryCategoryMapProviderSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHLibraryCategoryMapProviderSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastKnownGoodRecentApps, 0);
  objc_storeStrong((id *)&self->_lastKnownGoodSuggestions, 0);
  objc_storeStrong((id *)&self->_appDirectoryClient, 0);
}

- (void)requestLibraryCategoryMapWithOptions:(uint64_t)a3 existingLibraryCategoryMap:(uint64_t)a4 forbiddenApplicationIdentifiers:(uint64_t)a5 sessionId:(uint64_t)a6 queue:(uint64_t)a7 completion:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    "en one wasn't explicitly requested. ",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)requestLibraryCategoryMapWithOptions:(uint64_t)a3 existingLibraryCategoryMap:(uint64_t)a4 forbiddenApplicationIdentifiers:(uint64_t)a5 sessionId:(uint64_t)a6 queue:(uint64_t)a7 completion:(uint64_t)a8 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestLibraryCategoryMapWithOptions:(uint64_t)a3 existingLibraryCategoryMap:(uint64_t)a4 forbiddenApplicationIdentifiers:(uint64_t)a5 sessionId:(uint64_t)a6 queue:(uint64_t)a7 completion:(uint64_t)a8 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_31();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "(%ld) Error refreshing proactive library category source 'Categories': %@");
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __170__SBProactiveLibraryCategoryMapProviderSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2_52_cold_3()
{
  OUTLINED_FUNCTION_1_31();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "(%ld) Error refreshing proactive library category source 'Suggestions/Recents/Hidden': %@");
}

@end