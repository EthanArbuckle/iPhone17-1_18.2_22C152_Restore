@interface WBSPrivacyReportData
+ (id)cachedNumberOfTrackersOnStartPageForProfileWithIdentifier:(id)a3;
+ (id)cachedPrivacyReportDataOnStartPageForProfileWithIdentifier:(id)a3;
+ (void)_clearCachedDataWithStrategy:(int64_t)a3 profiles:(id)a4;
+ (void)clearCachedDataForProfilesWithIdentifiers:(id)a3;
+ (void)clearCachedDataForProfilesWithIdentifiersNotInSet:(id)a3;
+ (void)getKnownTrackingDomainsForWebView:(id)a3 after:(id)a4 before:(id)a5 completionHandler:(id)a6;
+ (void)setCachedNumberOfTrackersOnStartPage:(id)a3 forProfileWithIdentifier:(id)a4;
+ (void)setCachedPrivacyReportDataOnStartPage:(id)a3 forProfileWithIdentifier:(id)a4;
- (BOOL)hasData;
- (NSArray)blockedKnownTrackers;
- (NSArray)knownTrackers;
- (NSArray)knownTrackersSortDescriptors;
- (NSArray)preventedKnownTrackers;
- (NSArray)trackedFirstParties;
- (NSArray)trackedFirstPartiesSortDescriptors;
- (NSSet)histories;
- (NSSet)profileIdentifiers;
- (NSSet)trackerOwnerNames;
- (WBSKnownTrackingThirdParty)mostSeenKnownTracker;
- (WBSPrivacyReportData)initWithProfileIdentifiers:(id)a3 histories:(id)a4;
- (WKWebView)webView;
- (double)ratioOfTrackedFirstPartiesToAllVisited;
- (id)_dataWindowStartWithBlockedThirdParties:(id)a3 boundBy:(id)a4;
- (id)_dataWindowStartWithLoadedThirdParties:(id)a3 boundBy:(id)a4 earliestFirstParty:(id *)a5;
- (id)_lastHistoryVisitForHighLevelDomain:(id)a3;
- (id)getRecentFirstPartiesFromThirdParty:(id)a3;
- (void)_addPrefetchCompletionHandler:(id)a3;
- (void)_computeStatistics;
- (void)_discardPrefetchedData;
- (void)_executePrefetchCompletionHandlers;
- (void)_getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)_getResourceLoadStatisticsDataSummary:(id)a3;
- (void)_ingestPreventedThirdParties:(id)a3 blockedThirdParties:(id)a4 completionHandler:(id)a5;
- (void)_loadDataForWebViewWithCompletionHandler:(id)a3;
- (void)_loadDataWithCompletionHandler:(id)a3;
- (void)_prefetchData;
- (void)_resetKnownTrackersSortDescriptors;
- (void)_resetTrackedFirstPartiesSortDescriptors;
- (void)_sortKnownTrackers;
- (void)_sortTrackedFirstParties;
- (void)discardPrefetchedData;
- (void)loadDataFromStartDate:(id)a3 toEndDate:(id)a4 withCompletionHandler:(id)a5;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)prefetchData;
- (void)setKnownTrackersSortDescriptors:(id)a3;
- (void)setTrackedFirstPartiesSortDescriptors:(id)a3;
- (void)setWebView:(id)a3;
@end

@implementation WBSPrivacyReportData

+ (void)clearCachedDataForProfilesWithIdentifiersNotInSet:(id)a3
{
}

- (WBSPrivacyReportData)initWithProfileIdentifiers:(id)a3 histories:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSPrivacyReportData;
  v8 = [(WBSPrivacyReportData *)&v21 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    histories = v8->_histories;
    v8->_histories = (NSSet *)v9;

    uint64_t v11 = [v6 copy];
    profileIdentifiers = v8->_profileIdentifiers;
    v8->_profileIdentifiers = (NSSet *)v11;

    uint64_t v13 = objc_opt_new();
    knownTrackerFilter = v8->_knownTrackerFilter;
    v8->_knownTrackerFilter = (WBSKnownTrackerFilter *)v13;

    [(WBSPrivacyReportData *)v8 _resetKnownTrackersSortDescriptors];
    [(WBSPrivacyReportData *)v8 _resetTrackedFirstPartiesSortDescriptors];
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SafariShared.WBSPrivacyReportData.DataPrefetchQueue", 0);
    dataPrefetchQueue = v8->_dataPrefetchQueue;
    v8->_dataPrefetchQueue = (OS_dispatch_queue *)v15;

    v8->_prefetchState = 2;
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    prefetchCompletionHandlers = v8->_prefetchCompletionHandlers;
    v8->_prefetchCompletionHandlers = (NSMutableArray *)v17;

    v19 = v8;
  }

  return v8;
}

- (void)_resetTrackedFirstPartiesSortDescriptors
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"trackers.@count" ascending:0];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  trackedFirstPartiesSortDescriptors = self->_trackedFirstPartiesSortDescriptors;
  self->_trackedFirstPartiesSortDescriptors = v4;

  [(WBSPrivacyReportData *)self _sortTrackedFirstParties];
}

- (void)_sortTrackedFirstParties
{
  v3 = [(NSArray *)self->_trackedFirstParties sortedArrayUsingDescriptors:self->_trackedFirstPartiesSortDescriptors];
  trackedFirstParties = self->_trackedFirstParties;
  self->_trackedFirstParties = v3;
}

- (void)_resetKnownTrackersSortDescriptors
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"firstParties.@count" ascending:0];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  knownTrackersSortDescriptors = self->_knownTrackersSortDescriptors;
  self->_knownTrackersSortDescriptors = v4;

  [(WBSPrivacyReportData *)self _sortKnownTrackers];
}

- (void)_sortKnownTrackers
{
  v3 = [(NSArray *)self->_knownTrackers sortedArrayUsingDescriptors:self->_knownTrackersSortDescriptors];
  knownTrackers = self->_knownTrackers;
  self->_knownTrackers = v3;

  v5 = [(NSArray *)self->_preventedKnownTrackers sortedArrayUsingDescriptors:self->_knownTrackersSortDescriptors];
  preventedKnownTrackers = self->_preventedKnownTrackers;
  self->_preventedKnownTrackers = v5;

  id v7 = [(NSArray *)self->_blockedKnownTrackers sortedArrayUsingDescriptors:self->_knownTrackersSortDescriptors];
  blockedKnownTrackers = self->_blockedKnownTrackers;
  self->_blockedKnownTrackers = v7;
}

+ (id)cachedNumberOfTrackersOnStartPageForProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  v5 = [v4 objectForKey:*MEMORY[0x1E4F98780]];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v3 isEqualToString:*MEMORY[0x1E4F984B8]]) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      id v7 = v6;
    }
    else
    {
      id v7 = [v5 objectForKey:v3];
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v7 = [v6 dateByAddingUnit:16 value:-30 toDate:v5 options:0];

  v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__WBSPrivacyReportData__loadDataWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5E40990;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v15 = v4;
  id v9 = v4;
  id v10 = v8;
  id v11 = v7;
  [(WBSPrivacyReportData *)self _loadDataForWebViewWithCompletionHandler:v12];
}

- (void)_loadDataForWebViewWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5E40940;
    id v8 = WeakRetained;
    id v9 = self;
    id v10 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __55__WBSPrivacyReportData__loadDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadDataFromStartDate:*(void *)(a1 + 40) toEndDate:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 56)];
}

- (void)loadDataFromStartDate:(id)a3 toEndDate:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_dataWindowEndDate, a4);
  id v11 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_DEFAULT, "Loading data from %{public}@ to %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5E40990;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

- (void)_getResourceLoadStatisticsDataSummary:(id)a3
{
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Loading all resource load statistics summaries", buf, 2u);
  }
  id v6 = (void *)MEMORY[0x1E4F46710];
  profileIdentifiers = self->_profileIdentifiers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke;
  v9[3] = &unk_1E5E42B10;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v6, "safari_fetchExistingDataStoresForProfilesWithIdentifiers:completionHandler:", profileIdentifiers, v9);
}

void __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Loading resource load statistics summary", buf, 2u);
  }
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_64;
  v4[3] = &unk_1E5E41570;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _getResourceLoadStatisticsDataSummary:v4];
}

void __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = dispatch_group_create();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = v10;
          id v12 = [v9 identifier];
          *(_DWORD *)buf = 138543362;
          v29 = v12;
          _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_DEFAULT, "Loading resource load statistics summary from %{public}@", buf, 0xCu);
        }
        dispatch_group_enter(v4);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_96;
        v20[3] = &unk_1E5E42CD0;
        id v21 = v3;
        id v22 = v9;
        uint64_t v23 = v4;
        [v9 _getResourceLoadStatisticsDataSummary:v20];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_97;
  block[3] = &unk_1E5E423E8;
  id v13 = *(id *)(a1 + 32);
  id v18 = v3;
  id v19 = v13;
  id v14 = v3;
  dispatch_group_notify(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __54__WBSPrivacyReportData_loadDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v1 == 1) {
    return [*(id *)(a1 + 32) _addPrefetchCompletionHandler:*(void *)(a1 + 40)];
  }
  if (v1) {
    return [*(id *)(a1 + 32) _loadDataWithCompletionHandler:*(void *)(a1 + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dataPrefetchQueue = self->_dataPrefetchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WBSPrivacyReportData_loadDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E420C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dataPrefetchQueue, v7);
}

+ (void)_clearCachedDataWithStrategy:(int64_t)a3 profiles:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v7 = *MEMORY[0x1E4F98780];
  id v8 = [v6 objectForKey:*MEMORY[0x1E4F98780]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = v7;
    id v20 = v8;
    id v9 = (void *)[v8 mutableCopy];
    uint64_t v18 = *MEMORY[0x1E4F98778];
    id v10 = objc_msgSend(v6, "dictionaryForKey:");
    id v11 = (void *)[v10 mutableCopy];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [v9 allKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if (([v5 containsObject:v17] ^ 1) == a3)
          {
            [v9 setObject:0 forKeyedSubscript:v17];
            [v11 setObject:0 forKeyedSubscript:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [v6 setObject:v9 forKey:v19];
    [v6 setObject:v11 forKey:v18];

    id v8 = v20;
  }
  else
  {
    [v6 removeObjectForKey:v7];
  }
}

+ (void)setCachedNumberOfTrackersOnStartPage:(id)a3 forProfileWithIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v5, "safari_browserDefaults");
  uint64_t v9 = *MEMORY[0x1E4F98780];
  id v10 = [v8 objectForKey:*MEMORY[0x1E4F98780]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 mutableCopy];
LABEL_6:
    uint64_t v13 = (void *)v11;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    goto LABEL_6;
  }
  uint64_t v14 = *MEMORY[0x1E4F984B8];
  v15[0] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v13 = (void *)[v12 mutableCopy];

LABEL_7:
  [v13 setObject:v7 forKeyedSubscript:v6];

  [v8 setObject:v13 forKey:v9];
}

+ (id)cachedPrivacyReportDataOnStartPageForProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v5 = [v4 dictionaryForKey:*MEMORY[0x1E4F98778]];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKey:v3];
    id v8 = [[WBSPrivacyReportMetrics alloc] initWithDictionaryRepresentation:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)setCachedPrivacyReportDataOnStartPage:(id)a3 forProfileWithIdentifier:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v13 = v5;
    id v6 = (void *)MEMORY[0x1E4F1CB18];
    id v7 = a4;
    id v8 = objc_msgSend(v6, "safari_browserDefaults");
    uint64_t v9 = *MEMORY[0x1E4F98778];
    id v10 = [v8 dictionaryForKey:*MEMORY[0x1E4F98778]];
    uint64_t v11 = (void *)[v10 mutableCopy];

    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v12 = [v13 dictionaryRepresentation];
    [v11 setObject:v12 forKeyedSubscript:v7];

    [v8 setObject:v11 forKey:v9];
    id v5 = v13;
  }
}

+ (void)clearCachedDataForProfilesWithIdentifiers:(id)a3
{
}

- (void)setKnownTrackersSortDescriptors:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    if (![(NSArray *)self->_knownTrackersSortDescriptors isEqualToArray:v4])
    {
      id v5 = (NSArray *)[v7 copy];
      knownTrackersSortDescriptors = self->_knownTrackersSortDescriptors;
      self->_knownTrackersSortDescriptors = v5;

      [(WBSPrivacyReportData *)self _sortKnownTrackers];
    }
  }
  else
  {
    [(WBSPrivacyReportData *)self _resetKnownTrackersSortDescriptors];
  }
}

- (void)setTrackedFirstPartiesSortDescriptors:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    if (![(NSArray *)self->_trackedFirstPartiesSortDescriptors isEqualToArray:v4])
    {
      id v5 = (NSArray *)[v7 copy];
      trackedFirstPartiesSortDescriptors = self->_trackedFirstPartiesSortDescriptors;
      self->_trackedFirstPartiesSortDescriptors = v5;

      [(WBSPrivacyReportData *)self _sortTrackedFirstParties];
    }
  }
  else
  {
    [(WBSPrivacyReportData *)self _resetTrackedFirstPartiesSortDescriptors];
  }
}

- (id)_dataWindowStartWithLoadedThirdParties:(id)a3 boundBy:(id)a4 earliestFirstParty:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v8 timeIntervalSince1970];
  double v10 = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v11 timeIntervalSince1970];
  double v13 = v12;

  if (a5) {
    *a5 = 0;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
    uint64_t v31 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v20 = [v19 underFirstParties];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v33;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v33 != v23) {
                objc_enumerationMutation(v20);
              }
              long long v25 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              [v25 timeLastUpdated];
              if (v26 < v10)
              {
                id v29 = v8;

                goto LABEL_23;
              }
              [v25 timeLastUpdated];
              if (v27 < v13)
              {
                [v25 timeLastUpdated];
                double v13 = v28;
                if (a5) {
                  *a5 = v25;
                }
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        uint64_t v17 = v31;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v16);
  }

  id v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13];
LABEL_23:

  return v29;
}

- (id)_dataWindowStartWithBlockedThirdParties:(id)a3 boundBy:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 timeIntervalSince1970];
  double v8 = v7;
  double v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v12 = [v5 allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v31;
          while (2)
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              [v23 lastSeen];
              if (v24 < v8)
              {
                id v27 = v6;

                goto LABEL_20;
              }
              [v23 lastSeen];
              if (v25 < v11)
              {
                [v23 lastSeen];
                double v11 = v26;
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        uint64_t v15 = v29;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v14);
  }

  id v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v11];
LABEL_20:

  return v27;
}

- (void)prefetchData
{
  dataPrefetchQueue = self->_dataPrefetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__WBSPrivacyReportData_prefetchData__block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_async(dataPrefetchQueue, block);
}

uint64_t __36__WBSPrivacyReportData_prefetchData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prefetchData];
}

- (void)_prefetchData
{
  self->_prefetchState = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__WBSPrivacyReportData__prefetchData__block_invoke;
  v2[3] = &unk_1E5E40968;
  v2[4] = self;
  [(WBSPrivacyReportData *)self _loadDataWithCompletionHandler:v2];
}

void __37__WBSPrivacyReportData__prefetchData__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__WBSPrivacyReportData__prefetchData__block_invoke_2;
  block[3] = &unk_1E5E40968;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __37__WBSPrivacyReportData__prefetchData__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 16) == 1)
  {
    *(void *)(v1 + 16) = 0;
    return [*(id *)(result + 32) _executePrefetchCompletionHandlers];
  }
  return result;
}

- (void)_executePrefetchCompletionHandlers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_prefetchCompletionHandlers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_addPrefetchCompletionHandler:(id)a3
{
  prefetchCompletionHandlers = self->_prefetchCompletionHandlers;
  id v4 = (id)MEMORY[0x1AD115160](a3, a2);
  [(NSMutableArray *)prefetchCompletionHandlers addObject:v4];
}

- (void)discardPrefetchedData
{
  dataPrefetchQueue = self->_dataPrefetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__WBSPrivacyReportData_discardPrefetchedData__block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_async(dataPrefetchQueue, block);
}

uint64_t __45__WBSPrivacyReportData_discardPrefetchedData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _discardPrefetchedData];
}

- (void)_discardPrefetchedData
{
  self->_prefetchState = 2;
  [(NSMutableArray *)self->_prefetchCompletionHandlers removeAllObjects];
}

void __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v17 = 0;
  uint64_t v6 = [v4 _dataWindowStartWithLoadedThirdParties:v3 boundBy:v5 earliestFirstParty:&v17];
  id v7 = v17;
  v15[0] = 0;
  v15[1] = v15;
  void v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__19;
  v15[4] = __Block_byref_object_dispose__19;
  id v8 = v3;
  id v16 = v8;
  long long v9 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_DEFAULT, "Loading content blocker statistics", buf, 2u);
  }
  id v10 = *(id *)(a1 + 40);
  id v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 56);
  WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties();

  _Block_object_dispose(v15, 8);
}

void __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_dataWindowStartWithBlockedThirdParties:boundBy:");
  id v27 = v3;
  if ([*(id *)(a1 + 48) compare:v3] == -1) {
    id v3 = *(void **)(a1 + 48);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v3);
  id v4 = *(void **)(a1 + 56);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v4 firstPartyDomain];
    id v7 = [v5 _lastHistoryVisitForHighLevelDomain:v6];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F1C9C8];
      [v7 visitTime];
      long long v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
      id v10 = [*(id *)(*(void *)(a1 + 32) + 48) earlierDate:v9];
      uint64_t v11 = [v10 laterDate:*(void *)(a1 + 40)];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 48);
      *(void *)(v12 + 48) = v11;
    }
  }
  uint64_t v14 = a1;
  double v26 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v30 allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v21 = [v30 objectForKeyedSubscript:v20];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_2;
        v35[3] = &unk_1E5E43DD8;
        v35[4] = *(void *)(v14 + 32);
        uint64_t v22 = objc_msgSend(v21, "safari_mapAndFilterObjectsUsingBlock:", v35);

        [v15 setObject:v22 forKeyedSubscript:v20];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v17);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5E43E00;
  void block[4] = *(void *)(v14 + 32);
  id v32 = v26;
  id v33 = v15;
  *(_OWORD *)obja = *(_OWORD *)(v14 + 64);
  id v23 = obja[0];
  long long v34 = *(_OWORD *)obja;
  id v24 = v15;
  id v25 = v26;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 lastSeen];
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 48) timeIntervalSince1970];
  if (v5 >= v6
    && ([v3 lastSeen],
        double v8 = v7,
        [*(id *)(*(void *)(a1 + 32) + 56) timeIntervalSince1970],
        v8 <= v9))
  {
    id v10 = [v3 domain];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __78__WBSPrivacyReportData_loadDataFromStartDate_toEndDate_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v35 != v4) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v7 = [*(id *)(a1 + 32) getRecentFirstPartiesFromThirdParty:v6];
        double v8 = *(void **)(a1 + 40);
        double v9 = [v6 thirdPartyDomain];
        id v10 = [v8 objectForKeyedSubscript:v9];

        uint64_t v11 = *(void **)(a1 + 40);
        uint64_t v12 = [v6 thirdPartyDomain];
        if (v10)
        {
          id v13 = [v11 objectForKeyedSubscript:v12];
          uint64_t v14 = [v13 arrayByAddingObjectsFromArray:v7];
          uint64_t v15 = *(void **)(a1 + 40);
          uint64_t v16 = [v6 thirdPartyDomain];
          [v15 setObject:v14 forKeyedSubscript:v16];
        }
        else
        {
          [v11 setObject:v7 forKeyedSubscript:v12];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v3);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:v22];

        if (v23)
        {
          id v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:v22];
          id v25 = [v24 arrayByAddingObject:*(void *)(*(void *)(a1 + 32) + 64)];
          [*(id *)(a1 + 40) setObject:v25 forKeyedSubscript:v22];
        }
        else
        {
          uint64_t v38 = *(void *)(*(void *)(a1 + 32) + 64);
          id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
          [*(id *)(a1 + 40) setObject:v24 forKeyedSubscript:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v19);
  }

  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  id v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = 0;

  return [*(id *)(a1 + 32) _ingestPreventedThirdParties:*(void *)(a1 + 40) blockedThirdParties:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E5E43E50;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = *(id *)(a1 + 48);
  [v2 _loadedSubresourceDomainsFor:v3 completionHandler:v5];
}

void __65__WBSPrivacyReportData__loadDataForWebViewWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
  id v9 = a2;
  int8x16_t v4 = [*(id *)(a1 + 40) URL];
  double v5 = [v4 host];
  uint64_t v6 = objc_msgSend(v5, "safari_highLevelDomainFromHost");
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_ingestPreventedThirdParties:(id)a3 blockedThirdParties:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 allKeys];
  uint64_t v12 = [v9 allKeys];
  id v13 = [v11 arrayByAddingObjectsFromArray:v12];

  uint64_t v14 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v14, OS_LOG_TYPE_DEFAULT, "Loading known trackers", buf, 2u);
  }
  knownTrackerFilter = self->_knownTrackerFilter;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke;
  v20[3] = &unk_1E5E43EC8;
  void v20[4] = self;
  id v21 = v13;
  id v22 = v9;
  id v23 = v8;
  id v24 = v10;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v19 = v13;
  [(WBSKnownTrackerFilter *)knownTrackerFilter getKnownTrackersFromHighLevelDomains:v19 completionHandler:v20];
}

void __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEFAULT, "Loading history", buf, 2u);
  }
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[6];
  uint64_t v7 = v5[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_71;
  v9[3] = &unk_1E5E43EA0;
  void v9[4] = v5;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v8 = v3;
  [v5 _getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate:v6 beforeDate:v7 completionHandler:v9];
}

void __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v4 = [v3 setByAddingObject:v3];
  }
  else
  {
    uint64_t v4 = objc_msgSend(v3, "copy", v3);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v57 = [MEMORY[0x1E4F1CA48] array];
  v56 = [MEMORY[0x1E4F1CA48] array];
  v55 = [MEMORY[0x1E4F1CA80] set];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v7 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v69;
    uint64_t v53 = *(void *)v69;
    uint64_t v54 = a1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v69 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        id v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
        if (v12)
        {
          id v13 = [*(id *)(a1 + 56) objectForKeyedSubscript:v11];

          uint64_t v14 = 56;
          if (!v13) {
            uint64_t v14 = 64;
          }
          uint64_t v15 = [*(id *)(a1 + v14) objectForKeyedSubscript:v11];
          id v16 = [MEMORY[0x1E4F1CA60] dictionary];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_2;
          v65[3] = &unk_1E5E43E78;
          id v17 = v16;
          uint64_t v18 = *(void *)(a1 + 32);
          id v66 = v17;
          uint64_t v67 = v18;
          id v19 = objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", v65);
          if ([v19 count])
          {
            v59 = [v19 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
            uint64_t v20 = objc_msgSend(v59, "safari_mapObjectsUsingBlock:", &__block_literal_global_31);
            id v21 = [(WBSTrackingCapableThirdParty *)[WBSKnownTrackingThirdParty alloc] initWithDomain:v11 firstParties:v20];
            [v12 objectForKeyedSubscript:@"OwnerName"];
            id v22 = v15;
            v24 = uint64_t v23 = v8;
            [(WBSKnownTrackingThirdParty *)v21 setOwnerName:v24];

            id v25 = [(WBSKnownTrackingThirdParty *)v21 ownerName];
            [v55 addObject:v25];

            uint64_t v8 = v23;
            uint64_t v15 = v22;
            if (v13) {
              uint64_t v26 = v56;
            }
            else {
              uint64_t v26 = v57;
            }
            [v26 addObject:v21];

            uint64_t v9 = v53;
            a1 = v54;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v8);
  }

  uint64_t v27 = [v57 copy];
  uint64_t v28 = *(void *)(a1 + 32);
  uint64_t v29 = *(void **)(v28 + 88);
  *(void *)(v28 + 88) = v27;

  uint64_t v30 = [v56 copy];
  uint64_t v31 = *(void *)(a1 + 32);
  long long v32 = *(void **)(v31 + 96);
  *(void *)(v31 + 96) = v30;

  long long v33 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v34 = [v57 arrayByAddingObjectsFromArray:v56];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        uint64_t v40 = [v39 domain];
        uint64_t v41 = [v33 objectForKeyedSubscript:v40];
        uint64_t v42 = [v41 thirdPartyCoalescedWithThirdParty:v39];
        v43 = (void *)v42;
        if (v42) {
          v44 = (void *)v42;
        }
        else {
          v44 = v39;
        }
        [v33 setObject:v44 forKeyedSubscript:v40];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v36);
  }

  uint64_t v45 = [v33 allValues];
  uint64_t v46 = *(void *)(a1 + 32);
  v47 = *(void **)(v46 + 80);
  *(void *)(v46 + 80) = v45;

  [*(id *)(a1 + 32) _sortKnownTrackers];
  uint64_t v48 = [v55 copy];
  uint64_t v49 = *(void *)(a1 + 32);
  v50 = *(void **)(v49 + 136);
  *(void *)(v49 + 136) = v48;

  [*(id *)(a1 + 32) _computeStatistics];
  v51 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v51, OS_LOG_TYPE_DEFAULT, "Finished loading data", buf, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

id __91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (v4)
  {
  }
  else if ([*(id *)(*(void *)(a1 + 40) + 40) containsObject:v3])
  {
    [*(id *)(a1 + 32) setObject:&unk_1F0341508 forKeyedSubscript:v3];
    id v5 = v3;
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_6:

  return v5;
}

WBSTrackingCapableFirstParty *__91__WBSPrivacyReportData__ingestPreventedThirdParties_blockedThirdParties_completionHandler___block_invoke_77(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WBSTrackingCapableFirstParty alloc] initWithDomain:v2];

  return v3;
}

- (void)_computeStatistics
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSArray *)self->_knownTrackers firstObject];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v45 = self;
  uint64_t v4 = self->_knownTrackers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v10 = [v3 firstParties];
        unint64_t v11 = [v10 count];
        id v12 = [v9 firstParties];
        unint64_t v13 = [v12 count];

        if (v11 < v13)
        {
          id v14 = v9;

          id v3 = v14;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v6);
  }

  v44 = v3;
  objc_storeStrong((id *)&v45->_mostSeenKnownTracker, v3);
  uint64_t v15 = mapTrackersByFirstPartyDomain(v45->_blockedKnownTrackers);
  id v16 = mapTrackersByFirstPartyDomain(v45->_preventedKnownTrackers);
  id v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = v15;
  uint64_t v18 = [v15 allKeys];
  uint64_t v48 = v16;
  id v19 = [v16 allKeys];
  uint64_t v20 = [v18 arrayByAddingObjectsFromArray:v19];
  id v21 = [v17 setWithArray:v20];

  v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v47 = *(void *)v52;
    id v24 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v52 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v51 + 1) + 8 * j);
        uint64_t v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"domain" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
        v59 = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];

        uint64_t v29 = [v48 objectForKeyedSubscript:v26];
        uint64_t v30 = [v29 sortedArrayUsingDescriptors:v28];
        uint64_t v31 = (void *)v30;
        if (v30) {
          long long v32 = (void *)v30;
        }
        else {
          long long v32 = v24;
        }
        id v33 = v32;

        long long v34 = [v49 objectForKeyedSubscript:v26];
        uint64_t v35 = [v34 sortedArrayUsingDescriptors:v28];
        uint64_t v36 = (void *)v35;
        if (v35) {
          uint64_t v37 = (void *)v35;
        }
        else {
          uint64_t v37 = v24;
        }
        id v38 = v37;

        long long v39 = [[WBSTrackedFirstParty alloc] initWithDomain:v26 blockedTrackers:v38 preventedTrackers:v33];
        [v50 addObject:v39];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v23);
  }

  uint64_t v40 = [v50 copy];
  trackedFirstParties = v45->_trackedFirstParties;
  v45->_trackedFirstParties = (NSArray *)v40;

  [(WBSPrivacyReportData *)v45 _sortTrackedFirstParties];
  if ([(NSSet *)v45->_firstPartiesFromHistory count])
  {
    double v42 = (double)[(NSArray *)v45->_trackedFirstParties count];
    double v43 = v42 / (double)[(NSSet *)v45->_firstPartiesFromHistory count];
  }
  else
  {
    double v43 = 0.0;
  }
  v45->_ratioOfTrackedFirstPartiesToAllVisited = v43;
}

- (id)getRecentFirstPartiesFromThirdParty:(id)a3
{
  dataWindowStartDate = self->_dataWindowStartDate;
  id v5 = a3;
  [(NSDate *)dataWindowStartDate timeIntervalSince1970];
  uint64_t v7 = v6;
  [(NSDate *)self->_dataWindowEndDate timeIntervalSince1970];
  uint64_t v9 = v8;
  id v10 = [v5 underFirstParties];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__WBSPrivacyReportData_getRecentFirstPartiesFromThirdParty___block_invoke;
  v14[3] = &__block_descriptor_48_e45_B16__0___WKResourceLoadStatisticsFirstParty_8l;
  v14[4] = v7;
  v14[5] = v9;
  unint64_t v11 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v14);

  id v12 = objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_93);

  return v12;
}

BOOL __60__WBSPrivacyReportData_getRecentFirstPartiesFromThirdParty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timeLastUpdated];
  if (v4 >= *(double *)(a1 + 32))
  {
    [v3 timeLastUpdated];
    BOOL v5 = v6 <= *(double *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __60__WBSPrivacyReportData_getRecentFirstPartiesFromThirdParty___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 firstPartyDomain];
}

- (BOOL)hasData
{
  return [(NSArray *)self->_knownTrackers count] != 0;
}

+ (void)getKnownTrackingDomainsForWebView:(id)a3 after:(id)a4 before:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  unint64_t v13 = [v12 URL];
  id v14 = [v13 host];
  uint64_t v15 = objc_msgSend(v14, "safari_highLevelDomainFromHost");

  id v16 = objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke;
  v21[3] = &unk_1E5E41570;
  id v22 = v9;
  id v23 = v10;
  id v24 = v15;
  id v25 = v11;
  id v17 = v11;
  id v18 = v15;
  id v19 = v10;
  id v20 = v9;
  [v16 _loadedSubresourceDomainsFor:v12 completionHandler:v21];
}

void __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 56);
  id v4 = v3;
  WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties();
}

void __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 allKeys];
  double v6 = [v4 arrayByAddingObjectsFromArray:v5];

  uint64_t v7 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_3;
  v9[3] = &unk_1E5E43F30;
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  id v8 = v3;
  [v7 getKnownTrackersFromHighLevelDomains:v6 completionHandler:v9];
}

void __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_4;
  v13[3] = &unk_1E5E428E8;
  id v5 = v3;
  id v14 = v5;
  double v6 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", v13);
  uint64_t v7 = [*(id *)(a1 + 40) allKeys];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_5;
  v11[3] = &unk_1E5E428E8;
  id v12 = v5;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "safari_filterObjectsUsingBlock:", v11);

  (*(void (**)(void, void *, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6, v9, v10);
}

BOOL __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __89__WBSPrivacyReportData_getKnownTrackingDomainsForWebView_after_before_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v24 = a4;
  id v22 = a5;
  id v8 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    histories = self->_histories;
    uint64_t v10 = v8;
    *(_DWORD *)buf = 134217984;
    uint64_t v39 = [(NSSet *)histories count];
    _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_DEFAULT, "Loading data from %zu histories", buf, 0xCu);
  }
  id v11 = dispatch_group_create();
  id v12 = [MEMORY[0x1E4F1CA80] set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = self->_histories;
  uint64_t v13 = [(NSSet *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v18 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v39 = (uint64_t)v17;
          _os_log_impl(&dword_1ABB70000, v18, OS_LOG_TYPE_DEFAULT, "Loading data from history %{public}@", buf, 0xCu);
        }
        dispatch_group_enter(v11);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke;
        v29[3] = &unk_1E5E43F80;
        uint64_t v30 = v11;
        uint64_t v31 = v17;
        id v32 = v12;
        [v17 getHighLevelHTTPFamilyDomainsVisitedAfterDate:v25 beforeDate:v24 onlyFromThisDevice:1 completionHandler:v29];
      }
      uint64_t v14 = [(NSSet *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  id v19 = fetchingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_95;
  block[3] = &unk_1E5E423E8;
  id v27 = v12;
  id v28 = v22;
  id v20 = v12;
  id v21 = v22;
  dispatch_group_notify(v11, v19, block);
}

void __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(a1 + 32);
    id v5 = fetchingQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_2;
    block[3] = &unk_1E5E40D60;
    double v6 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v9 = v6;
    id v10 = v3;
    dispatch_group_async(v4, v5, block);
  }
  else
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(a1, v7);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Finished loading data from history %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) unionSet:*(void *)(a1 + 48)];
}

void __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_95(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Finished loading history", v5, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (id)_lastHistoryVisitForHighLevelDomain:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v5 = self->_histories;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "lastVisitForHighLevelDomain:", v4, (void)v18);
        id v12 = v11;
        if (v11)
        {
          if (!v8 || ([v11 visitTime], double v14 = v13, objc_msgSend(v8, "visitTime"), v14 > v15))
          {
            id v16 = v12;

            id v8 = v16;
          }
        }
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_96(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 40);
    int v5 = v3;
    uint64_t v6 = [v4 identifier];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Finished loading resource load statistics summary from %{public}@", (uint8_t *)&v7, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __62__WBSPrivacyReportData__getResourceLoadStatisticsDataSummary___block_invoke_97(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXPrivacyReport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Finished loading resource load statistics summaries", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSArray)knownTrackers
{
  return self->_knownTrackers;
}

- (NSArray)preventedKnownTrackers
{
  return self->_preventedKnownTrackers;
}

- (NSArray)blockedKnownTrackers
{
  return self->_blockedKnownTrackers;
}

- (NSArray)knownTrackersSortDescriptors
{
  return self->_knownTrackersSortDescriptors;
}

- (NSArray)trackedFirstParties
{
  return self->_trackedFirstParties;
}

- (NSArray)trackedFirstPartiesSortDescriptors
{
  return self->_trackedFirstPartiesSortDescriptors;
}

- (WBSKnownTrackingThirdParty)mostSeenKnownTracker
{
  return self->_mostSeenKnownTracker;
}

- (NSSet)trackerOwnerNames
{
  return self->_trackerOwnerNames;
}

- (double)ratioOfTrackedFirstPartiesToAllVisited
{
  return self->_ratioOfTrackedFirstPartiesToAllVisited;
}

- (NSSet)histories
{
  return self->_histories;
}

- (NSSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  return (WKWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
  objc_storeStrong((id *)&self->_histories, 0);
  objc_storeStrong((id *)&self->_trackerOwnerNames, 0);
  objc_storeStrong((id *)&self->_mostSeenKnownTracker, 0);
  objc_storeStrong((id *)&self->_trackedFirstPartiesSortDescriptors, 0);
  objc_storeStrong((id *)&self->_trackedFirstParties, 0);
  objc_storeStrong((id *)&self->_knownTrackersSortDescriptors, 0);
  objc_storeStrong((id *)&self->_blockedKnownTrackers, 0);
  objc_storeStrong((id *)&self->_preventedKnownTrackers, 0);
  objc_storeStrong((id *)&self->_knownTrackers, 0);
  objc_storeStrong((id *)&self->_webViewLoadedThirdParties, 0);
  objc_storeStrong((id *)&self->_webViewFirstPartyHighLevelDomainFromHost, 0);
  objc_storeStrong((id *)&self->_dataWindowEndDate, 0);
  objc_storeStrong((id *)&self->_dataWindowStartDate, 0);
  objc_storeStrong((id *)&self->_firstPartiesFromHistory, 0);
  objc_storeStrong((id *)&self->_knownTrackerFilter, 0);
  objc_storeStrong((id *)&self->_prefetchCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_dataPrefetchQueue, 0);
}

void __111__WBSPrivacyReportData__getHighLevelHTTPFamilyDomainsFromHistoryVisitedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Could not load data from history %{public}@", (uint8_t *)&v3, 0xCu);
}

@end