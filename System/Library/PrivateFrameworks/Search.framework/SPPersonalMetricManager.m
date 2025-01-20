@interface SPPersonalMetricManager
+ (id)sharedInstance;
- (SPGeoPersonalizationEngagementMetric)metric;
- (SPPersonalMetricManager)init;
- (void)_clearState;
- (void)_populateMetricWithFirstResult:(id)a3;
- (void)_sendCAMetrics;
- (void)_updateTrialInfo;
- (void)didEngageResult:(id)a3;
- (void)didRankSections:(id)a3;
- (void)resultsDidBecomeVisible:(id)a3;
- (void)searchViewDidDisappear:(id)a3;
- (void)setMetric:(id)a3;
@end

@implementation SPPersonalMetricManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_manager;

  return v2;
}

uint64_t __41__SPPersonalMetricManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_manager;
  sharedInstance_manager = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (SPPersonalMetricManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SPPersonalMetricManager;
  v2 = [(SPPersonalMetricManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.searchd.personalMetricManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    parsecRanker = v2->_parsecRanker;
    v2->_parsecRanker = (PRSMapsParsecRanker *)v6;

    [(SPPersonalMetricManager *)v2 _clearState];
  }
  return v2;
}

- (void)_updateTrialInfo
{
  SSDefaultsGetResources();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v5 getTrialTreatmentId];
  [(SPGeoPersonalizationEngagementMetric *)self->_metric setTrialTreatmentId:v3];

  dispatch_queue_t v4 = [v5 getTrialExperimentId];
  [(SPGeoPersonalizationEngagementMetric *)self->_metric setTrialExperimentId:v4];
}

- (void)_populateMetricWithFirstResult:(id)a3
{
  id v34 = a3;
  if ([v34 containsPersonalResult]
    && ([v34 mapsPersonalizationResult],
        dispatch_queue_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v34, "didRerankPersonalResult"));
    [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultWasReranked:v5];

    uint64_t v6 = NSNumber;
    v7 = [v34 mapsPersonalizationResult];
    v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "resultType"));
    [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultPersonalizationType:v8];

    objc_super v9 = [v34 mapsPersonalizationResult];
    v10 = [v9 entityRelevanceScore];
    [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultEntityRelevanceScore:v10];

    parsecRanker = self->_parsecRanker;
    if (parsecRanker)
    {
      v12 = NSNumber;
      v13 = [v34 mapsPersonalizationResult];
      v14 = objc_msgSend(v12, "numberWithBool:", -[PRSMapsParsecRanker isResultCandidateForPromotion:](parsecRanker, "isResultCandidateForPromotion:", v13));
      [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultIsCandidateForPromotion:v14];
    }
    v15 = [v34 mapsPersonalizationResult];
    v16 = [v15 numberOfVisits];
    [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultNumberOfVisits:v16];

    v17 = [v34 mapsPersonalizationResult];
    v18 = [v17 numberOfVisitsGivenLocation];
    [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultNumberOfVisitsGivenLocation:v18];

    v19 = [v34 mapsPersonalizationResult];
    v20 = [v19 dateOfLastVisit];
    if (v20)
    {
      v21 = NSNumber;
      v22 = [v34 mapsPersonalizationResult];
      v23 = [v22 dateOfLastVisit];
      [v23 timeIntervalSinceNow];
      v25 = [v21 numberWithDouble:v24 / -3600.0];
      [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultTimeSinceLastVisit:v25];
    }
    else
    {
      [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultTimeSinceLastVisit:0];
    }

    v27 = [v34 mapsPersonalizationResult];
    v28 = [v27 startEventDate];
    if (v28)
    {
      v29 = NSNumber;
      v30 = [v34 mapsPersonalizationResult];
      v31 = [v30 startEventDate];
      [v31 timeIntervalSinceNow];
      v33 = [v29 numberWithDouble:v32 / 3600.0];
      [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultTimeUntilUpcomingEvent:v33];
    }
    else
    {
      [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultTimeUntilUpcomingEvent:0];
    }
  }
  else
  {
    uint64_t v26 = MEMORY[0x263EFFA80];
    [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultWasReranked:MEMORY[0x263EFFA80]];
    [(SPGeoPersonalizationEngagementMetric *)self->_metric setFirstGeoResultIsCandidateForPromotion:v26];
  }
}

- (void)didRankSections:(id)a3
{
  id v4 = a3;
  id v5 = SPPersonalMetricManagerTransactionCreate(@"didRank");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SPPersonalMetricManager_didRankSections___block_invoke;
  block[3] = &unk_2644B2B40;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

id __43__SPPersonalMetricManager_didRankSections___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPPersonalMetricManager: didRankSections", buf, 2u);
  }

  [*(id *)(a1 + 32) _clearState];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v4;

  [*(id *)(a1 + 32) _updateTrialInfo];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [*(id *)(a1 + 40) sections];
  uint64_t v7 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v7)
  {
    uint64_t v10 = 0;
    goto LABEL_34;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v51;
  uint64_t v12 = *MEMORY[0x263F790F8];
  uint64_t v42 = *MEMORY[0x263F79078];
  uint64_t v37 = *MEMORY[0x263F790F8];
  uint64_t v38 = *(void *)v51;
  do
  {
    uint64_t v13 = 0;
    uint64_t v39 = v8;
    do
    {
      uint64_t v14 = v11;
      if (*(void *)v51 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v43 = v13;
      v15 = [*(id *)(*((void *)&v50 + 1) + 8 * v13) section];
      v16 = [v15 bundleIdentifier];
      uint64_t v17 = v12;
      int v18 = [v16 isEqualToString:v12];

      v19 = v15;
      v20 = [v15 bundleIdentifier];
      char v21 = [v20 isEqualToString:v42];

      char v44 = v21;
      if ((v21 & 1) == 0 && !v18)
      {
        uint64_t v11 = v14;
        uint64_t v12 = v17;
        goto LABEL_30;
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v41 = v19;
      id v45 = [v19 results];
      uint64_t v22 = [v45 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (!v22) {
        goto LABEL_29;
      }
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v45);
          }
          uint64_t v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v27 = [v26 identifier];
          if ([v27 length])
          {
            if (v18)
            {
              [*(id *)(*(void *)(a1 + 32) + 24) addObject:v27];
              v28 = *(void **)(*(void *)(a1 + 32) + 48);
              if ((v44 & 1) == 0)
              {
                [v28 setGeoResultWasTopHit:0];
                goto LABEL_27;
              }
              [v28 setGeoResultWasTopHit:1];
            }
            unsigned int v29 = [v26 containsPersonalResult];
            if (!v9) {
              [*(id *)(a1 + 32) _populateMetricWithFirstResult:v26];
            }
            v10 += v29;
            v30 = *(void **)(*(void *)(a1 + 32) + 8);
            v31 = [NSNumber numberWithUnsignedInteger:v9];
            [v30 setObject:v31 forKey:v27];

            ++v9;
          }
          else
          {
            double v32 = SPLogForSPLogCategoryDefault();
            os_log_type_t v33 = 2 * (gSPLogDebugAsDefault == 0);
            if (os_log_type_enabled(v32, v33))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21E5D7000, v32, v33, "SPPersonalMetricManager: Ignoring ranked result with empty identifier.", buf, 2u);
            }
          }
LABEL_27:
        }
        uint64_t v23 = [v45 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v23);
LABEL_29:

      uint64_t v12 = v37;
      uint64_t v11 = v38;
      uint64_t v8 = v39;
      v19 = v41;
LABEL_30:

      uint64_t v13 = v43 + 1;
    }
    while (v43 + 1 != v8);
    uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  }
  while (v8);
LABEL_34:

  [*(id *)(*(void *)(a1 + 32) + 48) setNumberOfPersonalGeoResults:v10];
  if (![*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    id v34 = SPLogForSPLogCategoryDefault();
    os_log_type_t v35 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v34, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E5D7000, v34, v35, "SPPersonalMetricManager: didRankSections: No geo results were found!", buf, 2u);
    }
  }
  id result = *(id *)(a1 + 48);
  if (result) {
    return self;
  }
  return result;
}

- (void)resultsDidBecomeVisible:(id)a3
{
  uint64_t v4 = SPPersonalMetricManagerTransactionCreate(@"didBecomeVisible");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SPPersonalMetricManager_resultsDidBecomeVisible___block_invoke;
  block[3] = &unk_2644B2A50;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

id __51__SPPersonalMetricManager_resultsDidBecomeVisible___block_invoke(uint64_t a1)
{
  v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPPersonalMetricManager: resultsDidBecomeVisible", v5, 2u);
  }

  id result = *(id *)(a1 + 32);
  if (result) {
    return self;
  }
  return result;
}

- (void)didEngageResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SPPersonalMetricManagerTransactionCreate(@"didEngageResult");
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SPPersonalMetricManager_didEngageResult___block_invoke;
  block[3] = &unk_2644B2B40;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(queue, block);
}

void __43__SPPersonalMetricManager_didEngageResult___block_invoke(uint64_t a1)
{
  v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPPersonalMetricManager: didEngageResult", buf, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 48) && [*(id *)(v4 + 8) count])
  {
    uint64_t v5 = [*(id *)(a1 + 48) result];
    id v6 = [v5 sectionBundleIdentifier];
    int v7 = [v6 isEqualToString:*MEMORY[0x263F79078]];

    id v8 = [v5 identifier];
    if ([v8 length])
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v8];
      id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "containsObject:", v8));
      [*(id *)(*(void *)(a1 + 32) + 48) setEngagedResultWasTopHit:v10];

      if (v9) {
        int v11 = v7;
      }
      else {
        int v11 = 0;
      }
      if (v11 == 1)
      {
        [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultPosition:v9];
        if ([v5 containsPersonalResult]
          && ([v5 mapsPersonalizationResult],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              v12,
              v12))
        {
          uint64_t v13 = [v5 mapsPersonalizationResult];
          uint64_t v14 = [v13 entityRelevanceScore];
          [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultEntityRelevanceScore:v14];

          v15 = [v5 mapsPersonalizationResult];
          v16 = [v15 numberOfVisits];
          [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultNumberOfVisits:v16];

          uint64_t v17 = [v5 mapsPersonalizationResult];
          int v18 = [v17 numberOfVisitsGivenLocation];
          [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultNumberOfVisitsGivenLocation:v18];

          v19 = NSNumber;
          v20 = [v5 mapsPersonalizationResult];
          char v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "resultType"));
          [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultPersonalizationType:v21];

          uint64_t v22 = [v5 mapsPersonalizationResult];
          uint64_t v23 = [v22 dateOfLastVisit];
          if (v23)
          {
            uint64_t v24 = NSNumber;
            v25 = [v5 mapsPersonalizationResult];
            uint64_t v26 = [v25 dateOfLastVisit];
            [v26 timeIntervalSinceNow];
            v28 = [v24 numberWithDouble:v27 / -3600.0];
            [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultTimeSinceLastVisit:v28];
          }
          else
          {
            [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultTimeSinceLastVisit:0];
          }

          os_log_type_t v35 = [v5 mapsPersonalizationResult];
          v36 = [v35 startEventDate];
          if (v36)
          {
            uint64_t v37 = NSNumber;
            uint64_t v38 = [v5 mapsPersonalizationResult];
            uint64_t v39 = [v38 startEventDate];
            [v39 timeIntervalSinceNow];
            v41 = [v37 numberWithDouble:v40 / 3600.0];
            [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultTimeUntilUpcomingEvent:v41];
          }
          else
          {
            [*(id *)(*(void *)(a1 + 32) + 48) setEngagedGeoResultTimeUntilUpcomingEvent:0];
          }

          int v42 = [v5 didRerankPersonalResult];
          double v32 = *(void **)(*(void *)(a1 + 32) + 48);
          if (v42) {
            uint64_t v33 = 1;
          }
          else {
            uint64_t v33 = 2;
          }
        }
        else
        {
          double v32 = *(void **)(*(void *)(a1 + 32) + 48);
          uint64_t v33 = 3;
        }
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    double v32 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v33 = 4;
LABEL_21:
    [v32 setInteraction:v33];
    [*(id *)(a1 + 32) _sendCAMetrics];
    [*(id *)(a1 + 32) _clearState];
    if (*(void *)(a1 + 40)) {
      id v34 = self;
    }

    return;
  }
  unsigned int v29 = SPLogForSPLogCategoryDefault();
  os_log_type_t v30 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v29, v30))
  {
    *(_WORD *)uint64_t v43 = 0;
    _os_log_impl(&dword_21E5D7000, v29, v30, "SPPersonalMetricManager: Missing ranked feedback. Exiting early.", v43, 2u);
  }

  if (*(void *)(a1 + 40)) {
    id v31 = self;
  }
}

- (void)searchViewDidDisappear:(id)a3
{
  uint64_t v4 = SPPersonalMetricManagerTransactionCreate(@"didDisappear");
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SPPersonalMetricManager_searchViewDidDisappear___block_invoke;
  v7[3] = &unk_2644B2990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

id __50__SPPersonalMetricManager_searchViewDidDisappear___block_invoke(uint64_t a1)
{
  v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPPersonalMetricManager: searchViewDidDisappear", buf, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 48) && [*(id *)(v4 + 8) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setInteraction:5];
    [*(id *)(a1 + 32) _sendCAMetrics];
    [*(id *)(a1 + 32) _clearState];
  }
  else
  {
    uint64_t v5 = SPLogForSPLogCategoryDefault();
    os_log_type_t v6 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E5D7000, v5, v6, "SPPersonalMetricManager: Missing ranked feedback. Exiting early.", v8, 2u);
    }
  }
  id result = *(id *)(a1 + 40);
  if (result) {
    return self;
  }
  return result;
}

- (void)_sendCAMetrics
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_type_t v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v3, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v5 = [(SPGeoPersonalizationEngagementMetric *)self->_metric serializedMetric];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_21E5D7000, v3, v4, "SPPersonalMetricManager: _sendCAMetrics: %@", (uint8_t *)&v8, 0xCu);
  }
  metric = self->_metric;
  if (metric)
  {
    int v7 = [(SPGeoPersonalizationEngagementMetric *)metric serializedMetric];
    AnalyticsSendEvent();
  }
}

- (void)_clearState
{
  metric = self->_metric;
  self->_metric = 0;

  os_log_type_t v4 = (NSMutableSet *)objc_opt_new();
  topHitIdentifiers = self->_topHitIdentifiers;
  self->_topHitIdentifiers = v4;

  os_log_type_t v6 = (NSMutableDictionary *)objc_opt_new();
  rankedPosition = self->_rankedPosition;
  self->_rankedPosition = v6;

  self->_lastQueryId = -1;
}

- (SPGeoPersonalizationEngagementMetric)metric
{
  return (SPGeoPersonalizationEngagementMetric *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetric:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_parsecRanker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_topHitIdentifiers, 0);

  objc_storeStrong((id *)&self->_rankedPosition, 0);
}

@end