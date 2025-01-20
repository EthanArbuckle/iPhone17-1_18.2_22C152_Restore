@interface SafariClearBrowsingDataController
- (NSArray)availableIntervals;
- (SafariClearBrowsingDataController)init;
- (TabGroupProvider)tabGroupProvider;
- (int64_t)_analyticsClearBrowsingIntervalForDate:(id)a3;
- (unint64_t)clearHistoryViewController:(id)a3 numberOfTabsToBeClosedForProfilesWithIdentifiers:(id)a4;
- (void)_clearAllScribbleEdits;
- (void)_clearBrowsingDataAddedAfterDate:(id)a3 profileIdentifiers:(id)a4 closeAllTabs:(BOOL)a5;
- (void)clearDataAddedAfterDate:(id)a3 beforeDate:(id)a4 profileIdentifier:(id)a5 clearAllProfiles:(BOOL)a6 closeTabs:(BOOL)a7;
- (void)clearHistoryViewController:(id)a3 clearHistoryVisitsAddedAfterDate:(id)a4 beforeDate:(id)a5 profileIdentifier:(id)a6 clearAllProfiles:(BOOL)a7 closeAllTabs:(BOOL)a8;
- (void)setTabGroupProvider:(id)a3;
- (void)showClearHistoryMenuFromViewController:(id)a3;
- (void)showClearHistoryMenuFromViewController:(id)a3 profileIdentifier:(id)a4;
@end

@implementation SafariClearBrowsingDataController

- (SafariClearBrowsingDataController)init
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)SafariClearBrowsingDataController;
  v2 = [(SafariClearBrowsingDataController *)&v19 init];
  if (v2)
  {
    v3 = [SafariClearBrowsingDataInterval alloc];
    v4 = _WBSLocalizedString();
    v5 = [(SafariClearBrowsingDataInterval *)v3 initWithDescription:v4 dateAfterWhichDataShouldBeClearedBlock:&__block_literal_global_36];

    v6 = [SafariClearBrowsingDataInterval alloc];
    v7 = _WBSLocalizedString();
    v8 = [(SafariClearBrowsingDataInterval *)v6 initWithDescription:v7 dateAfterWhichDataShouldBeClearedBlock:&__block_literal_global_39];

    v9 = [SafariClearBrowsingDataInterval alloc];
    v10 = _WBSLocalizedString();
    v11 = [(SafariClearBrowsingDataInterval *)v9 initWithDescription:v10 dateAfterWhichDataShouldBeClearedBlock:&__block_literal_global_44_0];

    v12 = [SafariClearBrowsingDataInterval alloc];
    v13 = _WBSLocalizedString();
    v14 = [(SafariClearBrowsingDataInterval *)v12 initWithDescription:v13 dateAfterWhichDataShouldBeClearedBlock:&__block_literal_global_49_0];

    [(SafariClearBrowsingDataInterval *)v5 setClearBrowsingDataInterval:0];
    [(SafariClearBrowsingDataInterval *)v8 setClearBrowsingDataInterval:1];
    [(SafariClearBrowsingDataInterval *)v11 setClearBrowsingDataInterval:2];
    [(SafariClearBrowsingDataInterval *)v14 setClearBrowsingDataInterval:3];
    v20[0] = v5;
    v20[1] = v8;
    v20[2] = v11;
    v20[3] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
    availableIntervals = v2->_availableIntervals;
    v2->_availableIntervals = (NSArray *)v15;

    v17 = v2;
  }

  return v2;
}

uint64_t __41__SafariClearBrowsingDataController_init__block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-3600.0];
}

id __41__SafariClearBrowsingDataController_init__block_invoke_2()
{
  return dateRepresentingMidnightFromNumberOfDaysAgo(0);
}

id __41__SafariClearBrowsingDataController_init__block_invoke_3()
{
  return dateRepresentingMidnightFromNumberOfDaysAgo(1);
}

uint64_t __41__SafariClearBrowsingDataController_init__block_invoke_4()
{
  return [MEMORY[0x1E4F1C9C8] distantPast];
}

- (void)showClearHistoryMenuFromViewController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F78240];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = +[Application sharedApplication];
  v8 = [v7 tabGroupManager];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  v10 = [WeakRetained activeProfileIdentifier];
  id v12 = (id)[v6 initWithTabGroupManager:v8 activeProfileIdentifier:v10];

  [v12 setDelegate:self];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v12];
  [v5 presentViewController:v11 animated:1 completion:0];
}

- (void)showClearHistoryMenuFromViewController:(id)a3 profileIdentifier:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    id v8 = [WeakRetained activeProfileIdentifier];
  }
  id v10 = objc_alloc(MEMORY[0x1E4F78240]);
  v11 = +[Application sharedApplication];
  id v12 = [v11 tabGroupManager];
  v13 = (void *)[v10 initWithTabGroupManager:v12 activeProfileIdentifier:v8];

  [v13 setDelegate:self];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v13];
  [v15 presentViewController:v14 animated:1 completion:0];
}

- (int64_t)_analyticsClearBrowsingIntervalForDate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];

  if (v4 == v3)
  {
    int64_t v7 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "safari_dateOfMidnightNumberOfDaysAgo:", 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v3)
    {
      int64_t v7 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1C9C8], "safari_dateOfMidnightNumberOfDaysAgo:", 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      int64_t v7 = v6 == v3;
    }
  }

  return v7;
}

- (void)_clearAllScribbleEdits
{
  v2 = +[Application sharedApplication];
  id v3 = [v2 userDefinedContentBlockerManagerForPrivateBrowsing];
  [v3 deleteAllContentBlockersWithCompletionHandler:&__block_literal_global_56_1];

  id v5 = +[Application sharedApplication];
  id v4 = [v5 userDefinedContentBlockerManager];
  [v4 deleteAllContentBlockersWithCompletionHandler:&__block_literal_global_58];
}

void __59__SafariClearBrowsingDataController__clearAllScribbleEdits__block_invoke_2()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v0 = +[Application sharedApplication];
  v1 = [v0 browserControllers];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * v5) tabController];
        int64_t v7 = [v6 activeTabDocument];
        id v8 = [v7 sfScribbleControllerIfLoaded];
        [v8 reloadData];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)clearDataAddedAfterDate:(id)a3 beforeDate:(id)a4 profileIdentifier:(id)a5 clearAllProfiles:(BOOL)a6 closeTabs:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  if ([v11 isEqual:v13])
  {
    if (v8)
    {
    }
    else
    {
      char v14 = [v12 isEqualToString:*MEMORY[0x1E4F980C8]];

      if ((v14 & 1) == 0) {
        goto LABEL_9;
      }
    }
    [(SafariClearBrowsingDataController *)self _clearAllScribbleEdits];
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    [(SafariClearBrowsingDataController *)self _clearBrowsingDataAddedAfterDate:v11 profileIdentifiers:v21 closeAllTabs:v7];

    goto LABEL_10;
  }

  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  id v15 = +[Application sharedApplication];
  v16 = [v15 tabGroupManager];
  v17 = [v16 allProfileIdentifiers];
  v18 = (void *)[v17 mutableCopy];

  objc_super v19 = (void *)MEMORY[0x1E4F46710];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __117__SafariClearBrowsingDataController_clearDataAddedAfterDate_beforeDate_profileIdentifier_clearAllProfiles_closeTabs___block_invoke;
  v26 = &unk_1E6D7B858;
  id v27 = v18;
  v28 = self;
  id v29 = v11;
  BOOL v30 = v7;
  id v20 = v18;
  [v19 _fetchAllIdentifiers:&v23];

LABEL_10:
  v22 = objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", v23, v24, v25, v26);
  objc_msgSend(v22, "didClearBrowsingDataFromInterval:withMethod:", -[SafariClearBrowsingDataController _analyticsClearBrowsingIntervalForDate:](self, "_analyticsClearBrowsingIntervalForDate:", v11), 0);
}

uint64_t __117__SafariClearBrowsingDataController_clearDataAddedAfterDate_beforeDate_profileIdentifier_clearAllProfiles_closeTabs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_62);
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  return [v5 _clearBrowsingDataAddedAfterDate:v6 profileIdentifiers:v7 closeAllTabs:v8];
}

uint64_t __117__SafariClearBrowsingDataController_clearDataAddedAfterDate_beforeDate_profileIdentifier_clearAllProfiles_closeTabs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (void)_clearBrowsingDataAddedAfterDate:(id)a3 profileIdentifiers:(id)a4 closeAllTabs:(BOOL)a5
{
  BOOL v63 = a5;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v64 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  long long v9 = [v8 linkPresentationMetadataProvider];
  [v9 emptyCaches];

  long long v10 = +[Application sharedApplication];
  v67 = [v10 historyController];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v79 objects:v85 count:16];
  obuint64_t j = v11;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v66 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v80 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v79 + 1) + 8 * i);
        v16 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreForProfileWithIdentifierIfExists:", v15);
        v17 = objc_msgSend(MEMORY[0x1E4F46710], "safari_allDataTypes");
        [v16 removeDataOfTypes:v17 modifiedSince:v6 completionHandler:&__block_literal_global_69];

        v18 = [v67 frequentlyVisitedSitesControllerForProfileIdentifier:v15 loadIfNeeded:1];
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __102__SafariClearBrowsingDataController__clearBrowsingDataAddedAfterDate_profileIdentifiers_closeAllTabs___block_invoke_2;
        v77[3] = &unk_1E6D77E20;
        id v19 = v18;
        id v78 = v19;
        id v20 = (void *)MEMORY[0x1E4E42950](v77);
        v21 = [v67 historyForProfileIdentifier:v15 loadIfNeeded:1];
        v22 = [MEMORY[0x1E4F1C9C8] distantPast];
        int v23 = [v6 isEqual:v22];

        if (v23)
        {
          [v21 clearHistoryWithCompletionHandler:v20];
          [MEMORY[0x1E4F98AB8] deleteAllUsageHistoryWithProfileIdentifier:v15];
        }
        else
        {
          [v21 clearHistoryVisitsAddedAfterDate:v6 beforeDate:v64 completionHandler:v20];
          [MEMORY[0x1E4F98AB8] deleteUsageHistoryFromDate:v6 toDate:v64 profileIdentifier:v15];
        }
        uint64_t v24 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
        [v24 clearRecentlyClosedTabsForProfileWithIdentifier:v15];

        v25 = [MEMORY[0x1E4F98BB8] sharedController];
        [v25 removeIgnoredSiriSuggestedSitesInProfile:v15 afterDate:v6];
      }
      id v11 = obj;
      uint64_t v13 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v13);
  }

  if (v63)
  {
    v26 = +[Application sharedApplication];
    id v27 = [v26 tabGroupManager];
    [v27 closeAllTabsInProfilesWithIdentifiers:v11];
  }
  WBSContentBlockerStatisticsStoreClearStoresForProfilesWithIdentifiers();
  v28 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v29 = [v6 isEqual:v28];

  BOOL v30 = +[RecentWebSearchesController sharedController];
  v31 = v30;
  if (v29) {
    [v30 clearRecentSearches];
  }
  else {
    [v30 clearRecentSearchesAddedAfterDate:v6];
  }

  if ([v11 containsObject:*MEMORY[0x1E4F980C8]])
  {
    v32 = [MEMORY[0x1E4F1C9C8] distantPast];
    int v33 = [v6 isEqual:v32];

    v34 = [MEMORY[0x1E4FB1F38] sharedPolicyDecider];
    v35 = v34;
    if (v33)
    {
      [v34 clearCache];

      v36 = [MEMORY[0x1E4F98D50] sharedController];
      [v36 clearWithCompletionHandler:0];

      v76 = 0;
      if (!SecTrustFlushResponseCache())
      {
        v37 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[SafariClearBrowsingDataController _clearBrowsingDataAddedAfterDate:profileIdentifiers:closeAllTabs:](v37, v76);
        }
      }
      v38 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
      v39 = [v38 linkPresentationIconCache];
      [v39 emptyCaches];

      v40 = [MEMORY[0x1E4F3AFA0] sharedManager];
      [v40 removeAllTemporaryPermissions];
    }
    else
    {
      [v34 clearAuthorizationsAddedBetween:v6 and:v64];

      v41 = [MEMORY[0x1E4F98D50] sharedController];
      [v41 removeProvidersAddedAfterDate:v6 beforeDate:v64];

      v40 = [MEMORY[0x1E4F3AFA0] sharedManager];
      [v40 removeTemporaryPermissionsAddedAfterDate:v6 completionHandler:0];
    }

    v42 = [MEMORY[0x1E4F98A08] sharedManager];
    [v42 clearCertificateBypassesCreatedAfterDate:v6];

    v43 = [MEMORY[0x1E4F3AF68] sharedManager];
    [v43 removeDownloadsStartedAfterDate:v6];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v44 = +[Application sharedApplication];
    v45 = [v44 browserControllers];

    uint64_t v46 = [v45 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v73 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          v51 = [v50 tabController];
          v52 = [v51 allTabDocuments];

          uint64_t v53 = [v52 countByEnumeratingWithState:&v68 objects:v83 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v69;
            do
            {
              for (uint64_t k = 0; k != v54; ++k)
              {
                if (*(void *)v69 != v55) {
                  objc_enumerationMutation(v52);
                }
                [*(id *)(*((void *)&v68 + 1) + 8 * k) clearBackForwardListKeepingCurrentItem];
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v68 objects:v83 count:16];
            }
            while (v54);
          }

          v57 = [v50 undoManager];
          [v57 removeAllActions];

          v58 = [v50 browserWindowController];
          [v58 saveCloudTabs];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v47);
    }

    v59 = [MEMORY[0x1E4F97F78] sharedStore];
    [v59 synchronousyClearIdentifiersAddedAfterDate:v6];

    v60 = [MEMORY[0x1E4F97EB8] sharedStore];
    [v60 synchronouslyRemoveGeneratedPasswordsNewerThanDate:v6];

    v61 = [MEMORY[0x1E4F989B0] sharedManager];
    [v61 clearEventsDonatedSinceDate:v6];

    v62 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v62 removeObjectForKey:*MEMORY[0x1E4F789B8]];

    id v11 = obj;
  }
}

uint64_t __102__SafariClearBrowsingDataController__clearBrowsingDataAddedAfterDate_profileIdentifiers_closeAllTabs___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearFrequentlyVisitedSites];
}

- (void)clearHistoryViewController:(id)a3 clearHistoryVisitsAddedAfterDate:(id)a4 beforeDate:(id)a5 profileIdentifier:(id)a6 clearAllProfiles:(BOOL)a7 closeAllTabs:(BOOL)a8
{
}

- (unint64_t)clearHistoryViewController:(id)a3 numberOfTabsToBeClosedForProfilesWithIdentifiers:(id)a4
{
  id v4 = a4;
  uint64_t v5 = +[Application sharedApplication];
  id v6 = [v5 tabGroupManager];
  unint64_t v7 = [v6 numberOfTabsToBeClosedForProfilesWithIdentifiers:v4];

  return v7;
}

- (NSArray)availableIntervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  return (TabGroupProvider *)WeakRetained;
}

- (void)setTabGroupProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_storeStrong((id *)&self->_availableIntervals, 0);
}

- (void)_clearBrowsingDataAddedAfterDate:(void *)a1 profileIdentifiers:(void *)a2 closeAllTabs:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Clearing OCSP cache failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end