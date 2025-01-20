@interface PUITrackingReportManager
+ (BOOL)queryWithOptions:(id)a3 reply:(id)a4;
- (AnalyticsWorkspace)workspace;
- (BOOL)hadDataInLastQuery;
- (BOOL)shouldIncludeBundleID:(id)a3;
- (BOOL)trackingReportEnabled;
- (NSArray)allEntries;
- (NSDate)date;
- (NSDictionary)appsToTrackers;
- (NSDictionary)appsToTrackersInAppOnly;
- (NSDictionary)appsToWebsitesToTrackers;
- (NSDictionary)trackersToApps;
- (NSDictionary)trackersToAppsInAppOnly;
- (NSDictionary)trackersToWebsitesToTrackers;
- (PUITrackingReportManager)init;
- (UsageFeed)feed;
- (id)allEntriesFromAppsToTrackers:(id)a3;
- (id)appsIDsContactingTrackersInAppOnly:(BOOL)a3;
- (id)appsToTrackersInAppOnlyFromAppsToTrackers:(id)a3;
- (id)appsToTrackersWithoutHiddenApps:(id)a3;
- (id)appsToWebsitesDictFromAppsToTrackersDict:(id)a3;
- (id)entries:(id)a3 filtered:(id)a4;
- (id)entriesFiltered:(id)a3;
- (id)trackerDataForAppID:(id)a3 inAppOnly:(BOOL)a4;
- (id)trackerDataForAppID:(id)a3 websiteDomain:(id)a4;
- (id)trackerDataForTrackerDomain:(id)a3 inAppOnly:(BOOL)a4;
- (id)trackerDataForTrackerDomain:(id)a3 websiteDomain:(id)a4;
- (id)trackerDomainsInAppOnly:(BOOL)a3;
- (id)trackersToAppsDictFromAppsToTrackersDict:(id)a3;
- (id)trackersToWebsitesDictFromAppsToTrackersDict:(id)a3;
- (id)valuesAndCountsForKey:(id)a3 entries:(id)a4;
- (id)valuesForKey:(id)a3 withLargestValueForKey:(id)a4 entries:(id)a5;
- (id)websiteDomainsForAppID:(id)a3;
- (id)websiteDomainsForTrackerDomain:(id)a3;
- (int64_t)highestNumberOfTrackerDataPerAppInAppOnly:(BOOL)a3;
- (int64_t)highestNumberOfTrackerDataPerTrackerInAppOnly:(BOOL)a3;
- (void)dataDidChange;
- (void)exportToStream:(id)a3 error:(id *)a4;
- (void)reloadDataWithCompletion:(id)a3;
- (void)reloadEnabledWithCompletion:(id)a3;
- (void)reloadWithCompletion:(id)a3;
- (void)setAllEntries:(id)a3;
- (void)setAppsToTrackers:(id)a3;
- (void)setAppsToTrackersInAppOnly:(id)a3;
- (void)setAppsToWebsitesToTrackers:(id)a3;
- (void)setDate:(id)a3;
- (void)setFeed:(id)a3;
- (void)setTrackersToApps:(id)a3;
- (void)setTrackersToAppsInAppOnly:(id)a3;
- (void)setTrackersToWebsitesToTrackers:(id)a3;
- (void)setTrackingReportEnabled:(BOOL)a3;
- (void)setWorkspace:(id)a3;
@end

@implementation PUITrackingReportManager

+ (BOOL)queryWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4FA8E10]);
  v8 = (void *)[v7 initWorkspaceWithService:*MEMORY[0x1E4FA9068]];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  id v35 = (id)[objc_alloc(MEMORY[0x1E4FA91D8]) initWithWorkspace:v8];
  uint64_t v9 = *MEMORY[0x1E4FA9008];
  v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA9008]];

  if (v10)
  {
    v11 = [v5 objectForKeyedSubscript:v9];
    v10 = (void *)[v11 integerValue];
  }
  v12 = _PUILoggingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "+[PUITrackingReportManager queryWithOptions:reply:]";
    __int16 v38 = 2048;
    v39 = v10;
    _os_log_impl(&dword_1E4AD5000, v12, OS_LOG_TYPE_DEFAULT, "%s: Starting query for NetworkDomainQueryType %ld data", buf, 0x16u);
  }

  v13 = PUILogForCategory(1uLL);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, "PUIReportAppListController.queryWithOptions");

  v15 = PUILogForCategory(1uLL);
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PUIReportAppListController.queryWithOptions", "", buf, 2u);
  }

  v17 = (void *)v31[5];
  uint64_t v18 = *MEMORY[0x1E4FA9210];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __51__PUITrackingReportManager_queryWithOptions_reply___block_invoke;
  v25[3] = &unk_1E6E9DF08;
  v28 = v10;
  os_signpost_id_t v29 = v14;
  id v19 = v6;
  id v26 = v19;
  v27 = &v30;
  char v20 = [v17 networkDomainsToDateWithOptionsFor:0 nameKind:v18 domainType:1 startTime:0 options:v5 reply:v25];
  if ((v20 & 1) == 0)
  {
    if (v19) {
      (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
    }
    v21 = _PUILoggingFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "+[PUITrackingReportManager queryWithOptions:reply:]";
      _os_log_impl(&dword_1E4AD5000, v21, OS_LOG_TYPE_DEFAULT, "%s: failed to get analytics data", buf, 0xCu);
    }

    v22 = PUILogForCategory(1uLL);
    v23 = v22;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v23, OS_SIGNPOST_INTERVAL_END, v14, "PUIReportAppListController.queryWithOptions", "", buf, 2u);
    }
  }
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __51__PUITrackingReportManager_queryWithOptions_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:@"result_count"];

  v8 = _PUILoggingFacility();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = a1[6];
      v11 = [v5 objectForKeyedSubscript:@"result_count"];
      int v19 = 136315650;
      char v20 = "+[PUITrackingReportManager queryWithOptions:reply:]_block_invoke";
      __int16 v21 = 2048;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = [v11 integerValue];
      _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "%s: Finished query for NetworkDomainQueryType %ld data. result_count = %ld", (uint8_t *)&v19, 0x20u);
    }
  }
  else if (v9)
  {
    uint64_t v12 = a1[6];
    int v19 = 136315394;
    char v20 = "+[PUITrackingReportManager queryWithOptions:reply:]_block_invoke";
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "%s: Finished query for NetworkDomainQueryType %ld data", (uint8_t *)&v19, 0x16u);
  }

  v13 = PUILogForCategory(1uLL);
  os_signpost_id_t v14 = v13;
  os_signpost_id_t v15 = a1[7];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PUIReportAppListController.queryWithOptions", "", (uint8_t *)&v19, 2u);
  }

  uint64_t v16 = a1[4];
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
  uint64_t v17 = *(void *)(a1[5] + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;
}

- (PUITrackingReportManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PUITrackingReportManager;
  v2 = [(PUITrackingReportManager *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA8E10]);
    v4 = (void *)[v3 initWorkspaceWithService:*MEMORY[0x1E4FA9068]];
    [(PUITrackingReportManager *)v2 setWorkspace:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FA91D8]);
    id v6 = [(PUITrackingReportManager *)v2 workspace];
    id v7 = (void *)[v5 initWithWorkspace:v6];
    [(PUITrackingReportManager *)v2 setFeed:v7];
  }
  return v2;
}

- (void)reloadWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PUITrackingReportManager_reloadWithCompletion___block_invoke;
  v6[3] = &unk_1E6E9D8B0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUITrackingReportManager *)self reloadEnabledWithCompletion:v6];
}

uint64_t __49__PUITrackingReportManager_reloadWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataWithCompletion:*(void *)(a1 + 40)];
}

- (void)reloadEnabledWithCompletion:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PUITrackingReportManager *)self feed];
  uint64_t v20 = *MEMORY[0x1E4FA9040];
  v21[0] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke;
  v13 = &unk_1E6E9DF58;
  objc_copyWeak(&v16, &location);
  os_signpost_id_t v14 = self;
  id v7 = (void (**)(void))v4;
  id v15 = v7;
  char v8 = [v5 getNetworkDomainsOptions:v6 reply:&v10];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = _PUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v19 = "-[PUITrackingReportManager reloadEnabledWithCompletion:]";
      _os_log_impl(&dword_1E4AD5000, v9, OS_LOG_TYPE_DEFAULT, "%s: failed to refresh analytics value", buf, 0xCu);
    }

    [(PUITrackingReportManager *)self dataDidChange];
    if (v7) {
      v7[2](v7);
    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6E9DF30;
  id v7 = v3;
  id v4 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v5 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v10);
}

uint64_t __56__PUITrackingReportManager_reloadEnabledWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _PUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v13 = 136315394;
    os_signpost_id_t v14 = "-[PUITrackingReportManager reloadEnabledWithCompletion:]_block_invoke_2";
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1E4AD5000, v2, OS_LOG_TYPE_DEFAULT, "%s: reply: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v4 = *MEMORY[0x1E4FA9040];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4FA9040]];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA9050]];
  uint64_t v7 = [v6 BOOLValue];

  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FA9048]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setDate:v9];

  uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v11 setBool:v7 forKey:@"PSUITrackerAnalyticsEnabledKey"];

  [*(id *)(a1 + 40) dataDidChange];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reloadDataWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  if ([(PUITrackingReportManager *)self trackingReportEnabled])
  {
    objc_initWeak(&location, self);
    id v5 = _PUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[PUITrackingReportManager reloadDataWithCompletion:]";
      _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "%s: Starting query for SFNetworkDomainTracker data", buf, 0xCu);
    }

    id v6 = PUILogForCategory(1uLL);
    uint64_t v7 = (char *)os_signpost_id_make_with_pointer(v6, "PUITrackingReportManager.reloadDataWithCompletion");

    uint64_t v8 = PUILogForCategory(1uLL);
    id v9 = v8;
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "PUITrackingReportManager.reloadDataWithCompletion", "", buf, 2u);
    }

    id v10 = [(PUITrackingReportManager *)self feed];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke;
    v17[3] = &unk_1E6E9DFA8;
    objc_copyWeak(v19, &location);
    uint64_t v11 = *MEMORY[0x1E4FA9210];
    v17[4] = self;
    uint64_t v12 = v4;
    id v18 = v12;
    v19[1] = v7;
    LOBYTE(v11) = [v10 networkDomainsToDateWithOptionsFor:0 nameKind:v11 domainType:1 startTime:0 options:0 reply:v17];

    if ((v11 & 1) == 0)
    {
      if (v12) {
        v12[2](v12);
      }
      int v13 = _PUILoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v22 = "-[PUITrackingReportManager reloadDataWithCompletion:]";
        _os_log_impl(&dword_1E4AD5000, v13, OS_LOG_TYPE_DEFAULT, "%s: failed to get analytics data", buf, 0xCu);
      }

      os_signpost_id_t v14 = PUILogForCategory(1uLL);
      __int16 v15 = v14;
      if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v15, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v7, "PUITrackingReportManager.reloadDataWithCompletion", "", buf, 2u);
      }
    }
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v16 = _PUILoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[PUITrackingReportManager reloadDataWithCompletion:]";
      _os_log_impl(&dword_1E4AD5000, v16, OS_LOG_TYPE_DEFAULT, "%s: did not query, tracker analytics is off.", buf, 0xCu);
    }

    if (v4) {
      v4[2](v4);
    }
  }
}

void __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 6);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained appsToTrackersWithoutHiddenApps:v4];

  id v7 = objc_loadWeakRetained(v3);
  uint64_t v8 = [v7 appsToTrackersInAppOnlyFromAppsToTrackers:v6];

  id v9 = objc_loadWeakRetained(v3);
  v31 = [v9 trackersToAppsDictFromAppsToTrackersDict:v8];

  id v10 = objc_loadWeakRetained(v3);
  uint64_t v30 = [v10 trackersToAppsDictFromAppsToTrackersDict:v6];

  id v11 = objc_loadWeakRetained(v3);
  uint64_t v12 = [v11 appsToWebsitesDictFromAppsToTrackersDict:v6];

  id v13 = objc_loadWeakRetained(v3);
  os_signpost_id_t v14 = [v13 trackersToWebsitesDictFromAppsToTrackersDict:v6];

  id v15 = objc_loadWeakRetained(v3);
  uint64_t v16 = [v15 allEntriesFromAppsToTrackers:v6];

  id v17 = objc_loadWeakRetained(v3);
  id v18 = [v17 appsToTrackers];
  LOBYTE(v9) = [v6 isEqualToDictionary:v18] ^ 1;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E6E9DF80;
  objc_copyWeak(v42, v3);
  id v33 = v6;
  id v34 = v8;
  id v35 = v30;
  id v36 = v31;
  id v37 = v12;
  id v38 = v14;
  char v43 = (char)v9;
  uint64_t v19 = a1[4];
  uint64_t v20 = (void *)a1[5];
  id v39 = v16;
  uint64_t v40 = v19;
  id v21 = v20;
  uint64_t v22 = (void *)a1[7];
  id v41 = v21;
  v42[1] = v22;
  id v23 = v16;
  id v24 = v14;
  id v25 = v12;
  id v26 = v31;
  id v27 = v30;
  id v28 = v8;
  id v29 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v42);
}

void __53__PUITrackingReportManager_reloadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 104);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  [WeakRetained setAppsToTrackers:v2];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = objc_loadWeakRetained(v3);
  [v6 setAppsToTrackersInAppOnly:v5];

  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = objc_loadWeakRetained(v3);
  [v8 setTrackersToApps:v7];

  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = objc_loadWeakRetained(v3);
  [v10 setTrackersToAppsInAppOnly:v9];

  uint64_t v11 = *(void *)(a1 + 64);
  id v12 = objc_loadWeakRetained(v3);
  [v12 setAppsToWebsitesToTrackers:v11];

  uint64_t v13 = *(void *)(a1 + 72);
  id v14 = objc_loadWeakRetained(v3);
  [v14 setTrackersToWebsitesToTrackers:v13];

  uint64_t v15 = *(void *)(a1 + 80);
  id v16 = objc_loadWeakRetained(v3);
  [v16 setAllEntries:v15];

  id v17 = objc_loadWeakRetained(v3);
  id v18 = [v17 appsToTrackers];
  uint64_t v19 = [v18 allKeys];
  BOOL v20 = [v19 count] != 0;

  id v21 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v21 setBool:v20 forKey:@"PSUITrackerHasDataKey"];

  if (*(unsigned char *)(a1 + 120)) {
    [*(id *)(a1 + 88) dataDidChange];
  }
  uint64_t v22 = *(void *)(a1 + 96);
  if (v22) {
    (*(void (**)(void))(v22 + 16))();
  }
  id v23 = _PUILoggingFacility();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315138;
    id v28 = "-[PUITrackingReportManager reloadDataWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1E4AD5000, v23, OS_LOG_TYPE_DEFAULT, "%s: Finished query for SFNetworkDomainTracker data", (uint8_t *)&v27, 0xCu);
  }

  id v24 = PUILogForCategory(1uLL);
  id v25 = v24;
  os_signpost_id_t v26 = *(void *)(a1 + 112);
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PUITrackingReportManager.reloadDataWithCompletion", "", (uint8_t *)&v27, 2u);
  }
}

- (void)dataDidChange
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PSUITrackingReportDataHasChanged" object:0];
}

- (BOOL)shouldIncludeBundleID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  id v6 = [v5 appTags];
  char v7 = [v6 containsObject:@"hidden"] ^ 1;

  return v7;
}

- (id)appsToTrackersWithoutHiddenApps:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[PUITrackingReportManager shouldIncludeBundleID:](self, "shouldIncludeBundleID:", v11, (void)v14))
        {
          id v12 = [v6 objectForKeyedSubscript:v11];
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)allEntriesFromAppsToTrackers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v4 addObject:*(void *)(*((void *)&v18 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  long long v16 = (void *)[v4 copy];
  return v16;
}

- (id)entriesFiltered:(id)a3
{
  id v4 = a3;
  id v5 = [(PUITrackingReportManager *)self allEntries];
  uint64_t v6 = [(PUITrackingReportManager *)self entries:v5 filtered:v4];

  return v6;
}

- (id)entries:(id)a3 filtered:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (unsigned int (**)(id, void))a4;
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (v6[2](v6, v13)) {
            objc_msgSend(v7, "addObject:", v13, (void)v16);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    id v14 = (id)[v7 copy];
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

- (id)valuesAndCountsForKey:(id)a3 entries:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v25 = *(void *)v27;
    uint64_t v24 = *MEMORY[0x1E4FA8FB0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:v5];
        uint64_t v13 = [v7 objectForKeyedSubscript:v12];

        if (v13)
        {
          id v14 = (void *)MEMORY[0x1E4F28ED0];
          long long v15 = [v11 objectForKeyedSubscript:v5];
          long long v16 = [v7 objectForKeyedSubscript:v15];
          uint64_t v17 = [v16 integerValue];
          long long v18 = [v11 objectForKeyedSubscript:v24];
          long long v19 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v18, "integerValue") + v17);
          long long v20 = [v11 objectForKeyedSubscript:v5];
          [v7 setObject:v19 forKeyedSubscript:v20];
        }
        else
        {
          long long v15 = [v11 objectForKeyedSubscript:v24];
          long long v16 = [v11 objectForKeyedSubscript:v5];
          [v7 setObject:v15 forKeyedSubscript:v16];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  uint64_t v21 = (void *)[v7 copy];
  return v21;
}

- (id)valuesForKey:(id)a3 withLargestValueForKey:(id)a4 entries:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v32 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v15 = [v14 objectForKeyedSubscript:v8];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          uint64_t v17 = [v14 objectForKeyedSubscript:v7];
          long long v18 = [v10 objectForKeyedSubscript:v17];

          if (!v18) {
            goto LABEL_9;
          }
          long long v19 = [v14 objectForKeyedSubscript:v7];
          long long v20 = [v10 objectForKeyedSubscript:v19];
          [v14 objectForKeyedSubscript:v8];
          id v21 = v8;
          uint64_t v22 = v12;
          long long v23 = v10;
          v25 = id v24 = v7;
          uint64_t v31 = [v20 compare:v25];

          id v7 = v24;
          uint64_t v10 = v23;
          uint64_t v12 = v22;
          id v8 = v21;

          if (v31 == 1)
          {
LABEL_9:
            long long v26 = [v14 objectForKeyedSubscript:v8];
            long long v27 = [v14 objectForKeyedSubscript:v7];
            [v10 setObject:v26 forKeyedSubscript:v27];
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }

  long long v28 = (void *)[v10 copy];
  return v28;
}

- (id)appsToTrackersInAppOnlyFromAppsToTrackers:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v3;
  uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    uint64_t v5 = *MEMORY[0x1E4FA8FB8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v6;
        uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * v6);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = objc_msgSend(obj, "objectForKeyedSubscript:", v7, v20);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              id v14 = [v13 objectForKeyedSubscript:v5];
              int v15 = [v14 isEqualToString:@"AppInitiated"];

              if (v15)
              {
                char v16 = [v4 objectForKeyedSubscript:v7];

                if (!v16)
                {
                  uint64_t v17 = objc_opt_new();
                  [v4 setObject:v17 forKeyedSubscript:v7];
                }
                long long v18 = [v4 objectForKeyedSubscript:v7];
                [v18 addObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v23 + 1;
      }
      while (v23 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }

  return v4;
}

- (id)trackersToAppsDictFromAppsToTrackersDict:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    uint64_t v5 = *MEMORY[0x1E4FA8FA8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v6;
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * v6);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = objc_msgSend(obj, "objectForKeyedSubscript:", v7, v19);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              id v14 = [v13 objectForKeyedSubscript:v5];
              int v15 = [v4 objectForKeyedSubscript:v14];

              if (!v15)
              {
                char v16 = objc_opt_new();
                [v4 setObject:v16 forKeyedSubscript:v14];
              }
              uint64_t v17 = [v4 objectForKeyedSubscript:v14];
              [v17 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v22 + 1;
      }
      while (v22 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  return v4;
}

- (id)appsToWebsitesDictFromAppsToTrackersDict:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v3;
  uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v36;
    uint64_t v5 = *MEMORY[0x1E4FA8FA0];
    uint64_t v30 = *MEMORY[0x1E4FA8FB8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v6;
        uint64_t v7 = *(void *)(*((void *)&v35 + 1) + 8 * v6);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v7, v25);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v32 != v10) {
                objc_enumerationMutation(v29);
              }
              uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v13 = [v12 objectForKeyedSubscript:v5];
              if ([v13 length])
              {
                id v14 = [v12 objectForKeyedSubscript:v30];
                int v15 = [v14 isEqualToString:@"NonAppInitiated"];

                if (v15)
                {
                  char v16 = [v4 objectForKeyedSubscript:v7];

                  if (!v16)
                  {
                    uint64_t v17 = objc_opt_new();
                    [v4 setObject:v17 forKeyedSubscript:v7];
                  }
                  long long v18 = [v4 objectForKeyedSubscript:v7];
                  uint64_t v19 = [v18 objectForKeyedSubscript:v13];

                  if (!v19)
                  {
                    uint64_t v20 = objc_opt_new();
                    uint64_t v21 = [v4 objectForKeyedSubscript:v7];
                    [v21 setObject:v20 forKeyedSubscript:v13];
                  }
                  uint64_t v22 = [v4 objectForKeyedSubscript:v7];
                  long long v23 = [v22 objectForKeyedSubscript:v13];
                  [v23 addObject:v12];
                }
              }
            }
            uint64_t v9 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v26);
  }

  return v4;
}

- (id)trackersToWebsitesDictFromAppsToTrackersDict:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v3;
  uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v38;
    uint64_t v32 = *MEMORY[0x1E4FA8FA0];
    uint64_t v5 = *MEMORY[0x1E4FA8FA8];
    uint64_t v31 = *MEMORY[0x1E4FA8FB8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        uint64_t v7 = *(void *)(*((void *)&v37 + 1) + 8 * v6);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v30 = [obj objectForKeyedSubscript:v7];
        uint64_t v8 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v34 != v10) {
                objc_enumerationMutation(v30);
              }
              uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v13 = [v12 objectForKeyedSubscript:v32];
              id v14 = [v12 objectForKeyedSubscript:v5];
              if ([v13 length])
              {
                int v15 = [v12 objectForKeyedSubscript:v31];
                int v16 = [v15 isEqualToString:@"NonAppInitiated"];

                if (v16)
                {
                  uint64_t v17 = [v4 objectForKeyedSubscript:v14];

                  if (!v17)
                  {
                    long long v18 = objc_opt_new();
                    [v4 setObject:v18 forKeyedSubscript:v14];
                  }
                  uint64_t v19 = [v4 objectForKeyedSubscript:v14];
                  uint64_t v20 = [v19 objectForKeyedSubscript:v13];

                  if (!v20)
                  {
                    uint64_t v21 = objc_opt_new();
                    uint64_t v22 = [v4 objectForKeyedSubscript:v14];
                    [v22 setObject:v21 forKeyedSubscript:v13];
                  }
                  long long v23 = [v4 objectForKeyedSubscript:v14];
                  long long v24 = [v23 objectForKeyedSubscript:v13];
                  [v24 addObject:v12];
                }
              }
            }
            uint64_t v9 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v29 + 1;
      }
      while (v29 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v27);
  }

  return v4;
}

- (BOOL)hadDataInLastQuery
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PSUITrackerHasDataKey"];

  return v3;
}

- (BOOL)trackingReportEnabled
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PSUITrackerAnalyticsEnabledKey"];

  return v3;
}

- (void)setTrackingReportEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setBool:0 forKey:@"PSUITrackerHasDataKey"];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setBool:v3 forKey:@"PSUITrackerAnalyticsEnabledKey"];

  objc_initWeak(&location, self);
  uint64_t v7 = [(PUITrackingReportManager *)self feed];
  uint64_t v17 = *MEMORY[0x1E4FA9038];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  v18[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke;
  v12[3] = &unk_1E6E9DFF8;
  objc_copyWeak(&v13, &location);
  char v10 = [v7 setNetworkDomainsOptions:v9 reply:v12];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = _PUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[PUITrackingReportManager setTrackingReportEnabled:]";
      _os_log_impl(&dword_1E4AD5000, v11, OS_LOG_TYPE_DEFAULT, "%s: failed to set analytics value", buf, 0xCu);
    }
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke_2;
  v5[3] = &unk_1E6E9DFD0;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v7);
}

void __53__PUITrackingReportManager_setTrackingReportEnabled___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _PUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[PUITrackingReportManager setTrackingReportEnabled:]_block_invoke_2";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1E4AD5000, v2, OS_LOG_TYPE_DEFAULT, "%s: reply: %@", (uint8_t *)&v5, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dataDidChange];
}

- (void)exportToStream:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  [(PUITrackingReportManager *)self allData];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
  id v5 = 0;
  if (v22)
  {
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v6;
        uint64_t v7 = *(void *)(*((void *)&v35 + 1) + 8 * v6);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v7, v21);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = [v26 countByEnumeratingWithState:&v31 objects:v45 count:16];
        if (v29)
        {
          uint64_t v28 = *(void *)v32;
          do
          {
            uint64_t v8 = 0;
            uint64_t v9 = v5;
            do
            {
              if (*(void *)v32 != v28) {
                objc_enumerationMutation(v26);
              }
              char v10 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
              uint64_t v11 = (void *)MEMORY[0x1E4E884F0]();
              uint64_t v12 = (void *)[v10 mutableCopy];
              [v12 setObject:@"networkActivity" forKeyedSubscript:@"type"];
              id v30 = v9;
              id v13 = v27;
              id v14 = +[PUIJSONSerialization dataWithJSONObject:v12 options:0 error:&v30];
              int v15 = v14;
              if (v14
                && (id v16 = v14,
                    id v17 = v13,
                    LODWORD(v16) = PUIWriteBytesToStream(v17, [v16 bytes], objc_msgSend(v16, "length"), &v30), v17, v16))
              {
                id v18 = v17;
                BOOL v19 = PUIWriteBytesToStream(v18, [@"\n" UTF8String], objc_msgSend(@"\n", "lengthOfBytesUsingEncoding:", 4), &v30);
              }
              else
              {
                BOOL v19 = 0;
              }

              id v5 = v30;
              if (!v19)
              {
                uint64_t v20 = _PUILoggingFacility();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  long long v40 = "-[PUITrackingReportManager exportToStream:error:]";
                  __int16 v41 = 2112;
                  id v42 = v5;
                  __int16 v43 = 2112;
                  v44 = v10;
                  _os_log_error_impl(&dword_1E4AD5000, v20, OS_LOG_TYPE_ERROR, "%s: Error writing to stream: %@, for object %@", buf, 0x20u);
                }

                *a4 = v5;
              }

              ++v8;
              uint64_t v9 = v5;
            }
            while (v29 != v8);
            uint64_t v29 = [v26 countByEnumeratingWithState:&v31 objects:v45 count:16];
          }
          while (v29);
        }

        uint64_t v6 = v24 + 1;
      }
      while (v24 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v22);
  }
}

- (int64_t)highestNumberOfTrackerDataPerAppInAppOnly:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [(PUITrackingReportManager *)self appsToTrackersInAppOnly];
  }
  else {
    [(PUITrackingReportManager *)self appsToTrackers];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        uint64_t v10 = [v9 count];

        if (v10 > v6) {
          int64_t v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)highestNumberOfTrackerDataPerTrackerInAppOnly:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [(PUITrackingReportManager *)self trackersToAppsInAppOnly];
  }
  else {
    [(PUITrackingReportManager *)self trackersToApps];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        uint64_t v10 = [v9 count];

        if (v10 > v6) {
          int64_t v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)appsIDsContactingTrackersInAppOnly:(BOOL)a3
{
  if (a3) {
    [(PUITrackingReportManager *)self appsToTrackersInAppOnly];
  }
  else {
  id v3 = [(PUITrackingReportManager *)self appsToTrackers];
  }
  uint64_t v4 = [v3 allKeys];

  return v4;
}

- (id)trackerDataForAppID:(id)a3 inAppOnly:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [(PUITrackingReportManager *)self appsToTrackersInAppOnly];
  }
  else {
  uint64_t v7 = [(PUITrackingReportManager *)self appsToTrackers];
  }
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (id)trackerDomainsInAppOnly:(BOOL)a3
{
  if (a3) {
    [(PUITrackingReportManager *)self trackersToAppsInAppOnly];
  }
  else {
  id v3 = [(PUITrackingReportManager *)self trackersToApps];
  }
  uint64_t v4 = [v3 allKeys];

  return v4;
}

- (id)trackerDataForTrackerDomain:(id)a3 inAppOnly:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [(PUITrackingReportManager *)self trackersToAppsInAppOnly];
  }
  else {
  uint64_t v7 = [(PUITrackingReportManager *)self trackersToApps];
  }
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (id)websiteDomainsForAppID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUITrackingReportManager *)self appsToWebsitesToTrackers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 allKeys];

  return v7;
}

- (id)trackerDataForAppID:(id)a3 websiteDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUITrackingReportManager *)self appsToWebsitesToTrackers];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v9 objectForKeyedSubscript:v6];

  return v10;
}

- (id)websiteDomainsForTrackerDomain:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUITrackingReportManager *)self trackersToWebsitesToTrackers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 allKeys];

  return v7;
}

- (id)trackerDataForTrackerDomain:(id)a3 websiteDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUITrackingReportManager *)self trackersToWebsitesToTrackers];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v9 objectForKeyedSubscript:v6];

  return v10;
}

- (UsageFeed)feed
{
  return self->_feed;
}

- (void)setFeed:(id)a3
{
}

- (AnalyticsWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (NSDictionary)appsToTrackers
{
  return self->_appsToTrackers;
}

- (void)setAppsToTrackers:(id)a3
{
}

- (NSDictionary)trackersToApps
{
  return self->_trackersToApps;
}

- (void)setTrackersToApps:(id)a3
{
}

- (NSDictionary)appsToTrackersInAppOnly
{
  return self->_appsToTrackersInAppOnly;
}

- (void)setAppsToTrackersInAppOnly:(id)a3
{
}

- (NSDictionary)trackersToAppsInAppOnly
{
  return self->_trackersToAppsInAppOnly;
}

- (void)setTrackersToAppsInAppOnly:(id)a3
{
}

- (NSDictionary)appsToWebsitesToTrackers
{
  return self->_appsToWebsitesToTrackers;
}

- (void)setAppsToWebsitesToTrackers:(id)a3
{
}

- (NSDictionary)trackersToWebsitesToTrackers
{
  return self->_trackersToWebsitesToTrackers;
}

- (void)setTrackersToWebsitesToTrackers:(id)a3
{
}

- (NSArray)allEntries
{
  return self->_allEntries;
}

- (void)setAllEntries:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_allEntries, 0);
  objc_storeStrong((id *)&self->_trackersToWebsitesToTrackers, 0);
  objc_storeStrong((id *)&self->_appsToWebsitesToTrackers, 0);
  objc_storeStrong((id *)&self->_trackersToAppsInAppOnly, 0);
  objc_storeStrong((id *)&self->_appsToTrackersInAppOnly, 0);
  objc_storeStrong((id *)&self->_trackersToApps, 0);
  objc_storeStrong((id *)&self->_appsToTrackers, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_feed, 0);
}

@end