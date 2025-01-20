@interface MOEventBundleManager
+ (id)dateFormatterForKeyword;
+ (id)getStringValueInDictionary:(id)a3 withKey:(id)a4;
- (BOOL)enableSemanticPruning;
- (BOOL)isDataDumpEnabledForTrigger:(unint64_t)a3;
- (BOOL)persistBundlingDataWithoutRandomization;
- (MOBiomeManager)biomeManager;
- (MOBundleClusteringManager)bundleClusteringManager;
- (MOConfigurationManager)configurationManager;
- (MODataExportManager)exportManager;
- (MODefaultsManager)defaultManager;
- (MOEngagementAndSuggestionAnalyticsManager)engagementAndSuggestionAnalyticsManager;
- (MOEngagementHistoryManager)engagementHistoryManager;
- (MOEventBundleManager)initWithUniverse:(id)a3;
- (MOEventBundleRanking)eventBundleRanking;
- (MOEventBundleStore)eventBundleStore;
- (MOEventManager)eventManager;
- (MOFSMStore)fsmStore;
- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence;
- (OS_dispatch_queue)queue;
- (id)_concatenatedEventIdentifierForBundle:(id)a3;
- (id)_getMetadataForTrigger:(unint64_t)a3;
- (id)_updateIdentifiersForEventBundles:(id)a3 eventIDsToBundleIDMapping:(id)a4;
- (id)_updateIdentifiersForEvergreenBundles:(id)a3;
- (id)adjacentKeywordsForEventBundle:(id)a3;
- (id)findRehydrateEvents:(id)a3 forBundle:(id)a4;
- (id)getAllowedToPromptConfiguration;
- (id)getUnfilteredEventBundleFrom:(id)a3 with:(id)a4;
- (id)keywordForEventBundle:(id)a3;
- (id)matchedEventBundleForEventBundle:(id)a3 otherEventBundles:(id)a4;
- (id)partitionedEventBundles:(id)a3;
- (void)_annotateEventBundlesWithStartDate:(id)a3 endDate:(id)a4 allEvents:(id)a5 eventBundles:(id)a6 handler:(id)a7;
- (void)_bundleEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 submitMetricsFlg:(BOOL)a6 refreshVariant:(unint64_t)a7 handler:(id)a8;
- (void)_bundleEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)_cleanUpEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)_clearEventBundles;
- (void)_clearFSMs;
- (void)_collectTimeCorrelatedEventsWithStartDate:(id)a3 endDate:(id)a4 events:(id)a5 submitMetricsFlg:(BOOL)a6 handler:(id)a7;
- (void)_computeEngagementScoreParams;
- (void)_computeEvergreenScoreParams:(id)a3 withRankingParams:(id)a4;
- (void)_computeSensedBundleEngagementScoreParams:(id)a3 withRankingParams:(id)a4;
- (void)_fetchEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)_fetchPreviousBundlesWithDateInterval:(id)a3 handler:(id)a4;
- (void)_filterPreOnboardedVisitEvents:(id)a3 handler:(id)a4;
- (void)_generateClusterAndAnomalyBundlesWithHandler:(id)a3;
- (void)_processClusterBundles:(id)a3 withEmbeddings:(id)a4 onboardingStatus:(id)a5 result:(id)a6 andHandler:(id)a7;
- (void)_rehydrateEventBundles:(id)a3 withHandler:(id)a4;
- (void)associateEventBundles:(id)a3 effectiveInterval:(id)a4;
- (void)beginDataExport;
- (void)buildLabelsForEventBundles:(id)a3;
- (void)bundleEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)captureCurrentDBStateForTrigger:(unint64_t)a3 withFeedback:(id)a4 additionalMetadata:(id)a5 shouldUpload:(BOOL)a6 andHandler:(id)a7;
- (void)cleanUpEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)clearEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (void)fetchAndPersistBundlesForTimeInterval:(id)a3 eventsIdsToDrop:(id)a4 withHandler:(id)a5;
- (void)fetchAndPersistEventsForTimeInterval:(id)a3 withHandler:(id)a4;
- (void)fetchAndSaveBundlingDataForTrigger:(unint64_t)a3 withFeedback:(id)a4 additionalMetadata:(id)a5 shouldUpload:(BOOL)a6 andHandler:(id)a7;
- (void)fetchEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)fetchRehydratedEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4;
- (void)finalizeDataExportWithUpload:(BOOL)a3 handler:(id)a4;
- (void)persistMetadata:(id)a3;
- (void)persistRankingModel:(id)a3;
- (void)saveEventBundleDictionary:(id)a3;
- (void)saveEventBundles:(id)a3 handler:(id)a4;
- (void)saveEventBundles:(id)a3 withStartDate:(id)a4 endDate:(id)a5 handler:(id)a6;
- (void)setBiomeManager:(id)a3;
- (void)setBundleClusteringManager:(id)a3;
- (void)setEnableSemanticPruning:(BOOL)a3;
- (void)setEngagementAndSuggestionAnalyticsManager:(id)a3;
- (void)setEngagementHistoryManager:(id)a3;
- (void)setEventBundleRanking:(id)a3;
- (void)setEventBundleStore:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setExportManager:(id)a3;
- (void)setFsmStore:(id)a3;
- (void)submitEventBundleInternalAnalytics:(id)a3 withSubmissionDate:(id)a4 withRefreshVariant:(unint64_t)a5;
- (void)submitMOEventData:(id)a3 startDate:(id)a4 endDate:(id)a5 subDate:(id)a6;
- (void)submitMetricForEventBundleWithPromptMetrics:(id)a3;
- (void)updateMetaDataForRankInEventBundles:(id)a3;
- (void)updateSuggestionIDAndFirstCreationDateForNewEventBundles:(id)a3 previousEventBundles:(id)a4;
@end

@implementation MOEventBundleManager

- (BOOL)persistBundlingDataWithoutRandomization
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __73__MOEventBundleManager_DataDump__persistBundlingDataWithoutRandomization__block_invoke;
  block[3] = &unk_1002C98B8;
  block[4] = self;
  if (persistBundlingDataWithoutRandomization_onceToken != -1) {
    dispatch_once(&persistBundlingDataWithoutRandomization_onceToken, block);
  }
  return persistBundlingDataWithoutRandomization_persistWithoutRandomization;
}

void __73__MOEventBundleManager_DataDump__persistBundlingDataWithoutRandomization__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) defaultManager];
  v1 = [v2 objectForKey:@"BundlingDataPersistWithoutHashing"];
  persistBundlingDataWithoutRandomization_persistWithoutRandomization = [v1 BOOLValue];
}

- (id)getAllowedToPromptConfiguration
{
  v3 = objc_opt_new();
  v116 = objc_opt_new();
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v4 = [&off_1002F8DB0 countByEnumeratingWithState:&v117 objects:v123 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v118;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v118 != v6) {
          objc_enumerationMutation(&off_1002F8DB0);
        }
        uint64_t v8 = *(void *)(*((void *)&v117 + 1) + 8 * i);
        v9 = [(MOEventBundleManager *)self configurationManager];
        v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 getBoolSettingForKey:v8 withFallback:0]);
        [v3 setObject:v10 forKey:v8];

        v11 = [(MOEventBundleManager *)self defaultManager];
        v12 = [v11 objectForKey:v8];

        if (!v12) {
          [v116 addObject:v8];
        }
      }
      id v5 = [&off_1002F8DB0 countByEnumeratingWithState:&v117 objects:v123 count:16];
    }
    while (v5);
  }
  v13 = objc_opt_new();
  v14 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:0];
  if (v14)
  {
    v15 = [(MOEventBundleManager *)self configurationManager];
    id v16 = [v15 isAllowedToPromptEventCategory:0];

    v17 = +[NSNumber numberWithBool:v16];
    [v13 setObject:v17 forKey:v14];
  }
  v18 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:1];
  if (v18)
  {
    v19 = [(MOEventBundleManager *)self configurationManager];
    id v20 = [v19 isAllowedToPromptEventCategory:1];

    v21 = +[NSNumber numberWithBool:v20];
    [v13 setObject:v21 forKey:v18];
  }
  v22 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:2];
  if (v22)
  {
    v23 = [(MOEventBundleManager *)self configurationManager];
    id v24 = [v23 isAllowedToPromptEventCategory:2];

    v25 = +[NSNumber numberWithBool:v24];
    [v13 setObject:v25 forKey:v22];
  }
  v26 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:3];
  if (v26)
  {
    v27 = [(MOEventBundleManager *)self configurationManager];
    id v28 = [v27 isAllowedToPromptEventCategory:3];

    v29 = +[NSNumber numberWithBool:v28];
    [v13 setObject:v29 forKey:v26];
  }
  v30 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:4];
  if (v30)
  {
    v31 = [(MOEventBundleManager *)self configurationManager];
    id v32 = [v31 isAllowedToPromptEventCategory:4];

    v33 = +[NSNumber numberWithBool:v32];
    [v13 setObject:v33 forKey:v30];
  }
  v34 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:5];
  if (v34)
  {
    v35 = [(MOEventBundleManager *)self configurationManager];
    id v36 = [v35 isAllowedToPromptEventCategory:5];

    v37 = +[NSNumber numberWithBool:v36];
    [v13 setObject:v37 forKey:v34];
  }
  v38 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:6];
  if (v38)
  {
    v39 = [(MOEventBundleManager *)self configurationManager];
    id v40 = [v39 isAllowedToPromptEventCategory:6];

    v41 = +[NSNumber numberWithBool:v40];
    [v13 setObject:v41 forKey:v38];
  }
  v42 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:7];
  if (v42)
  {
    v43 = [(MOEventBundleManager *)self configurationManager];
    id v44 = [v43 isAllowedToPromptEventCategory:7];

    v45 = +[NSNumber numberWithBool:v44];
    [v13 setObject:v45 forKey:v42];
  }
  v46 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:8];
  if (v46)
  {
    v47 = [(MOEventBundleManager *)self configurationManager];
    id v48 = [v47 isAllowedToPromptEventCategory:8];

    v49 = +[NSNumber numberWithBool:v48];
    [v13 setObject:v49 forKey:v46];
  }
  v50 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:9];
  if (v50)
  {
    v51 = [(MOEventBundleManager *)self configurationManager];
    id v52 = [v51 isAllowedToPromptEventCategory:9];

    v53 = +[NSNumber numberWithBool:v52];
    [v13 setObject:v53 forKey:v50];
  }
  v54 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:10];
  if (v54)
  {
    v55 = [(MOEventBundleManager *)self configurationManager];
    id v56 = [v55 isAllowedToPromptEventCategory:10];

    v57 = +[NSNumber numberWithBool:v56];
    [v13 setObject:v57 forKey:v54];
  }
  v58 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:11];
  if (v58)
  {
    v59 = [(MOEventBundleManager *)self configurationManager];
    id v60 = [v59 isAllowedToPromptEventCategory:11];

    v61 = +[NSNumber numberWithBool:v60];
    [v13 setObject:v61 forKey:v58];
  }
  v62 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:12];
  if (v62)
  {
    v63 = [(MOEventBundleManager *)self configurationManager];
    id v64 = [v63 isAllowedToPromptEventCategory:12];

    v65 = +[NSNumber numberWithBool:v64];
    [v13 setObject:v65 forKey:v62];
  }
  v66 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:13];
  if (v66)
  {
    v67 = [(MOEventBundleManager *)self configurationManager];
    id v68 = [v67 isAllowedToPromptEventCategory:13];

    v69 = +[NSNumber numberWithBool:v68];
    [v13 setObject:v69 forKey:v66];
  }
  v70 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:14];
  if (v70)
  {
    v71 = [(MOEventBundleManager *)self configurationManager];
    id v72 = [v71 isAllowedToPromptEventCategory:14];

    v73 = +[NSNumber numberWithBool:v72];
    [v13 setObject:v73 forKey:v70];
  }
  v74 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:15];
  if (v74)
  {
    v75 = [(MOEventBundleManager *)self configurationManager];
    id v76 = [v75 isAllowedToPromptEventCategory:15];

    v77 = +[NSNumber numberWithBool:v76];
    [v13 setObject:v77 forKey:v74];
  }
  v78 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:16];
  if (v78)
  {
    v79 = [(MOEventBundleManager *)self configurationManager];
    id v80 = [v79 isAllowedToPromptEventCategory:16];

    v81 = +[NSNumber numberWithBool:v80];
    [v13 setObject:v81 forKey:v78];
  }
  v82 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:17];
  if (v82)
  {
    v83 = [(MOEventBundleManager *)self configurationManager];
    id v84 = [v83 isAllowedToPromptEventCategory:17];

    v85 = +[NSNumber numberWithBool:v84];
    [v13 setObject:v85 forKey:v82];
  }
  v86 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:18];
  if (v86)
  {
    v87 = [(MOEventBundleManager *)self configurationManager];
    id v88 = [v87 isAllowedToPromptEventCategory:18];

    v89 = +[NSNumber numberWithBool:v88];
    [v13 setObject:v89 forKey:v86];
  }
  v90 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:19];
  if (v90)
  {
    v91 = [(MOEventBundleManager *)self configurationManager];
    id v92 = [v91 isAllowedToPromptEventCategory:19];

    v93 = +[NSNumber numberWithBool:v92];
    [v13 setObject:v93 forKey:v90];
  }
  v94 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:20];
  if (v94)
  {
    v95 = [(MOEventBundleManager *)self configurationManager];
    id v96 = [v95 isAllowedToPromptEventCategory:20];

    v97 = +[NSNumber numberWithBool:v96];
    [v13 setObject:v97 forKey:v94];
  }
  v98 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:21];
  if (v98)
  {
    v99 = [(MOEventBundleManager *)self configurationManager];
    id v100 = [v99 isAllowedToPromptEventCategory:21];

    v101 = +[NSNumber numberWithBool:v100];
    [v13 setObject:v101 forKey:v98];
  }
  v102 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:22];
  if (v102)
  {
    v103 = [(MOEventBundleManager *)self configurationManager];
    id v104 = [v103 isAllowedToPromptEventCategory:22];

    v105 = +[NSNumber numberWithBool:v104];
    [v13 setObject:v105 forKey:v102];
  }
  v106 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:23];
  if (v106)
  {
    v107 = [(MOEventBundleManager *)self configurationManager];
    id v108 = [v107 isAllowedToPromptEventCategory:23];

    v109 = +[NSNumber numberWithBool:v108];
    [v13 setObject:v109 forKey:v106];
  }
  v110 = +[MOConfigurationManager getSensedEventSettingNameFromCategory:24];
  if (v110)
  {
    v111 = [(MOEventBundleManager *)self configurationManager];
    id v112 = [v111 isAllowedToPromptEventCategory:24];

    v113 = +[NSNumber numberWithBool:v112];
    [v13 setObject:v113 forKey:v110];
  }
  v121[0] = @"Settings";
  v121[1] = @"Streams";
  v122[0] = v3;
  v122[1] = v13;
  v121[2] = @"UnknownSettings";
  v122[2] = v116;
  v114 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:3];

  return v114;
}

- (void)beginDataExport
{
  if (+[MODataExportManager isServiceAvailable])
  {
    v3 = objc_alloc_init(MODataExportManager);
    [(MOEventBundleManager *)self setExportManager:v3];

    id v4 = [(MOEventBundleManager *)self exportManager];
    [v4 startDataExportSession];
  }
}

- (void)fetchAndPersistEventsForTimeInterval:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = [[MOEventFetchOptions alloc] initWithDateInterval:v6 ascending:1 limit:0];
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEvents", "", buf, 2u);
  }

  v11 = [[MOPerformanceMeasurement alloc] initWithName:@"CaptureCurrentDBFetchEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v11 startSession];
  *(void *)buf = 0;
  id v20 = buf;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  id v24 = (id)objc_opt_new();
  v12 = [(MOEventBundleManager *)self eventManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke;
  v15[3] = &unk_1002CA190;
  v15[4] = self;
  v18 = buf;
  id v13 = v7;
  id v17 = v13;
  v14 = v11;
  id v16 = v14;
  [v12 fetchEventsWithOptions:v9 CompletionHandler:v15];

  _Block_object_dispose(buf, 8);
}

void __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v6, 0);
    }
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke_2;
    v18[3] = &unk_1002CA168;
    uint64_t v9 = *(void *)(a1 + 56);
    v18[4] = *(void *)(a1 + 32);
    uint64_t v20 = v9;
    id v10 = v8;
    id v19 = v10;
    [v5 enumerateObjectsUsingBlock:v18];
    v11 = [*(id *)(a1 + 32) exportManager];

    if (v11)
    {
      v12 = [*(id *)(a1 + 32) exportManager];
      [v12 addEventsToDataExportSession:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v10);
    }
  }
  id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)id v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEvents", "", v17, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __83__MOEventBundleManager_DataDump__fetchAndPersistEventsForTimeInterval_withHandler___block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v9 = a2;
  id v4 = [v3 configurationManager];
  unsigned int v5 = [v4 isAllowedToPromptEventCategory:[v9 category]];

  if (v5)
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v9];
  }
  else
  {
    id v6 = (void *)a1[5];
    uint64_t v7 = [v9 eventIdentifier];

    uint64_t v8 = [v7 UUIDString];
    [v6 addObject:v8];

    id v9 = v7;
  }
}

- (void)fetchAndPersistBundlesForTimeInterval:(id)a3 eventsIdsToDrop:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v12 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:v8 ascending:1 limit:0 filterBundle:0];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  v25[4] = __Block_byref_object_dispose__3;
  id v26 = 0;
  uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEventBundles", "", buf, 2u);
  }

  v14 = [[MOPerformanceMeasurement alloc] initWithName:@"CaptureCurrentDBFetchEventBundles" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v14 startSession];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke;
  v18[3] = &unk_1002CA1E0;
  id v15 = v9;
  v23 = v25;
  id v19 = v15;
  uint64_t v20 = self;
  id v16 = v14;
  uint64_t v21 = v16;
  id v17 = v10;
  id v22 = v17;
  [(MOEventBundleManager *)self fetchEventBundlesWithOptions:v12 CompletionHandler:v18];

  _Block_object_dispose(v25, 8);
}

void __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v22 = a2;
  id v20 = a3;
  id v21 = a4;
  if (!v20)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7 && [v7 count])
    {
      v23 = objc_opt_new();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v8 = v22;
      id v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v33;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v33 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            *(void *)buf = 0;
            v29 = buf;
            uint64_t v30 = 0x2020000000;
            char v31 = 0;
            uint64_t v13 = [v12 events];
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke_2;
            v25[3] = &unk_1002CA1B8;
            id v26 = *(id *)(a1 + 32);
            v27 = buf;
            [v13 enumerateObjectsUsingBlock:v25];

            if (!v29[24]) {
              [v23 addObject:v12];
            }

            _Block_object_dispose(buf, 8);
          }
          id v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v9);
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v23;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    }
    [*(id *)(a1 + 40) buildLabelsForEventBundles:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    id v16 = [*(id *)(a1 + 40) exportManager];

    if (v16)
    {
      id v17 = [*(id *)(a1 + 40) exportManager];
      [v17 addBundlesToDataExportSession:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    }
  }
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDBFetchEventBundles", "", buf, 2u);
  }

  [*(id *)(a1 + 48) endSession];
  uint64_t v19 = *(void *)(a1 + 56);
  if (v19) {
    (*(void (**)(void))(v19 + 16))();
  }
}

void __100__MOEventBundleManager_DataDump__fetchAndPersistBundlesForTimeInterval_eventsIdsToDrop_withHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 eventIdentifier];
  id v7 = [v6 UUIDString];

  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)persistRankingModel:(id)a3
{
  id v6 = a3;
  id v4 = [(MOEventBundleManager *)self exportManager];

  if (v4)
  {
    unsigned int v5 = [(MOEventBundleManager *)self exportManager];
    [v5 addRankingModelToDataExportSession:v6];
  }
}

- (void)persistMetadata:(id)a3
{
  id v6 = a3;
  id v4 = [(MOEventBundleManager *)self exportManager];

  if (v4)
  {
    unsigned int v5 = [(MOEventBundleManager *)self exportManager];
    [v5 addMetadataToDataExportSession:v6];
  }
}

- (void)finalizeDataExportWithUpload:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!+[MODataExportManager isServiceAvailable])
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Data export service not available", v11, 2u);
    }
LABEL_7:

    goto LABEL_8;
  }
  id v8 = [(MOEventBundleManager *)self exportManager];

  if (v4)
  {
    if (!v8) {
      goto LABEL_8;
    }
    id v9 = [(MOEventBundleManager *)self exportManager];
    [v9 endSessionAndUploadAsync];
    goto LABEL_7;
  }
  if (v8)
  {
    uint64_t v10 = [(MOEventBundleManager *)self exportManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __71__MOEventBundleManager_DataDump__finalizeDataExportWithUpload_handler___block_invoke;
    v12[3] = &unk_1002CA208;
    id v13 = v6;
    [v10 endSessionSyncWithReply:v12];

    goto LABEL_12;
  }
LABEL_8:
  if (v6) {
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, &__NSDictionary0__struct);
  }
LABEL_12:
}

void __71__MOEventBundleManager_DataDump__finalizeDataExportWithUpload_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Sync data export completed", v9, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v5);
  }
}

+ (id)getStringValueInDictionary:(id)a3 withKey:(id)a4
{
  BOOL v4 = [a3 objectForKeyedSubscript:a4];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 performSelector:"stringValue"];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (void)buildLabelsForEventBundles:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(MOEventBundleLabelFormatter);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v8);
        v11 = +[MOEventBundleMetaDataUtility buildMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildMetaDataForEventBundle:", v9, context);
        [v9 setMetaData:v11];

        v12 = [v9 metaData];

        if (v12)
        {
          id v13 = [v9 metaData];
          uint64_t v14 = [v9 getBundleType];
          id v15 = [(MOEventBundleLabelFormatter *)v4 formattedBundleLabelsForMetaData:v13 bundleType:v14];
          [v9 setLabels:v15];

          id v16 = [v9 metaData];
          id v17 = [v9 getBundleType];
          v18 = [(MOEventBundleLabelFormatter *)v4 formattedBundlePromptsForMetaData:v16 bundleType:v17];
          [v9 setPromptLanguages:v18];

          uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            id v21 = [v9 getBundleType];
            *(_DWORD *)buf = 138412546;
            long long v32 = v9;
            __int16 v33 = 2112;
            long long v34 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "build labels, event bundle, %@, bundleType, %@", buf, 0x16u);
          }
          id v20 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[MOEventBundleManager(DataDump) buildLabelsForEventBundles:](v29, v9, &v30, v20);
          }
        }
        else
        {
          id v20 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v22 = [v9 getBundleType];
            *(_DWORD *)buf = 138412546;
            long long v32 = v9;
            __int16 v33 = 2112;
            long long v34 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "build labels, nil meta data, event bundle, %@, bundleType, %@", buf, 0x16u);
          }
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v6);
  }
}

- (MOEventBundleManager)initWithUniverse:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  id v9 = [v6 getService:v8];

  uint64_t v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [v6 getService:v11];

  id v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  id obj = [v6 getService:v14];

  id v15 = (objc_class *)objc_opt_class();
  id v16 = NSStringFromClass(v15);
  id v17 = [v6 getService:v16];

  v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v18);
  id v20 = [v6 getService:v19];

  id v21 = (objc_class *)objc_opt_class();
  id v22 = NSStringFromClass(v21);
  id v52 = [v6 getService:v22];

  v23 = (objc_class *)objc_opt_class();
  id v24 = NSStringFromClass(v23);
  long long v25 = [v6 getService:v24];

  long long v26 = (objc_class *)objc_opt_class();
  long long v27 = NSStringFromClass(v26);
  long long v28 = [v6 getService:v27];

  if (!v9)
  {
    v41 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[MODaemonClient initWithUniverse:]();
    }

    v42 = +[NSAssertionHandler currentHandler];
    char v31 = v42;
    CFStringRef v43 = @"Invalid parameter not satisfying: eventManager";
    SEL v44 = a2;
    v45 = self;
    uint64_t v46 = 200;
    goto LABEL_20;
  }
  if (!v12)
  {
    v47 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleManager initWithUniverse:]();
    }

    v42 = +[NSAssertionHandler currentHandler];
    char v31 = v42;
    CFStringRef v43 = @"Invalid parameter not satisfying: eventBundleStore";
    SEL v44 = a2;
    v45 = self;
    uint64_t v46 = 201;
    goto LABEL_20;
  }
  if (!v17)
  {
    id v48 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleManager initWithUniverse:]();
    }

    v42 = +[NSAssertionHandler currentHandler];
    char v31 = v42;
    CFStringRef v43 = @"Invalid parameter not satisfying: defaultManager";
    SEL v44 = a2;
    v45 = self;
    uint64_t v46 = 204;
    goto LABEL_20;
  }
  if (!v20)
  {
    v49 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      -[MOEventStore initWithUniverse:]();
    }

    v42 = +[NSAssertionHandler currentHandler];
    char v31 = v42;
    CFStringRef v43 = @"Invalid parameter not satisfying: configurationManager";
    SEL v44 = a2;
    v45 = self;
    uint64_t v46 = 205;
LABEL_20:
    [v42 handleFailureInMethod:v44 object:v45 file:@"MOEventBundleManager.m" lineNumber:v46 description:v43];
    id v40 = 0;
    goto LABEL_21;
  }
  v29 = (objc_class *)objc_opt_class();
  uint64_t v30 = NSStringFromClass(v29);
  char v31 = [v6 getService:v30];

  long long v32 = (objc_class *)objc_opt_class();
  __int16 v33 = NSStringFromClass(v32);
  id v51 = [v6 getService:v33];

  v54.receiver = self;
  v54.super_class = (Class)MOEventBundleManager;
  long long v34 = [(MOEventBundleManager *)&v54 init];
  if (v34)
  {
    long long v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v36 = dispatch_queue_create("MOEventBundleManager", v35);
    queue = v34->_queue;
    v34->_queue = (OS_dispatch_queue *)v36;

    objc_storeStrong((id *)&v34->_eventBundleStore, v12);
    objc_storeStrong((id *)&v34->_eventManager, v9);
    objc_storeStrong((id *)&v34->_fsmStore, obj);
    v34->_enableSemanticPruning = 0;
    objc_storeStrong((id *)&v34->_defaultManager, v17);
    objc_storeStrong((id *)&v34->_configurationManager, v20);
    objc_storeStrong((id *)&v34->_engagementHistoryManager, v52);
    objc_storeStrong((id *)&v34->_eventBundleRanking, v25);
    objc_storeStrong((id *)&v34->_bundleClusteringManager, v28);
    objc_storeStrong((id *)&v34->_onboardingAndSettingsPersistence, v31);
    v38 = [[MOBiomeManager alloc] initWithEventManager:v34->_eventManager setDefaultValues:1];
    biomeManager = v34->_biomeManager;
    v34->_biomeManager = v38;

    objc_storeStrong((id *)&v34->_engagementAndSuggestionAnalyticsManager, v51);
  }
  self = v34;

  id v40 = self;
LABEL_21:

  return v40;
}

- (void)bundleEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v8 = v7;
  unint64_t v9 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerBundleEventsWrapper", "", buf, 2u);
  }

  uint64_t v10 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsWrapper" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v10 startSession];
  v11 = [(MOEventBundleManager *)self eventBundleStore];
  v12 = [v11 persistenceManager];
  id v13 = [v12 availability];

  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v15 = v14;
  if (v13 == (id)2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "bundle events since datastore is available", buf, 2u);
    }

    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    id v17 = v16;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerBundleEvents", "", buf, 2u);
    }

    v18 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEvents" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v18 startSession];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke;
    v25[3] = &unk_1002CE058;
    unint64_t v30 = a3;
    long long v26 = v18;
    id v29 = v6;
    long long v27 = self;
    long long v28 = v10;
    uint64_t v19 = v18;
    [(MOEventBundleManager *)self _bundleEventsWithRefreshVariant:a3 andHandler:v25];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleManager bundleEventsWithRefreshVariant:andHandler:]();
    }

    if (v6)
    {
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      CFStringRef v35 = @"[bundleEventsWithRefreshVariant] database is not available";
      id v20 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      id v21 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v20];

      CFStringRef v32 = @"stateDatabaseAvailable";
      __int16 v33 = &__kCFBooleanFalse;
      id v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      (*((void (**)(id, void *, void *))v6 + 2))(v6, v21, v22);
    }
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    id v24 = v23;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerBundleEventsWrapper", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v10 endSession];
  }
}

void __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "EventBundleManagerBundleEvents", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  id v10 = [v6 mutableCopy];
  [v10 setObject:&__kCFBooleanTrue forKey:@"stateDatabaseAvailable"];
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218498;
    uint64_t v38 = v12;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant]refreshVariant %lu, bundling result %@, error %@", buf, 0x20u);
  }

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    if (v13 == 1280 || v13 == 768)
    {
      [*(id *)(a1 + 40) _computeEngagementScoreParams];
      uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      id v15 = v14;
      os_signpost_id_t v16 = *(void *)(a1 + 64);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "EventBundleManagerGenerateClusterAndAnomalyBundlesWrapper", "", buf, 2u);
      }

      id v17 = [[MOPerformanceMeasurement alloc] initWithName:@"SignPostGenerateClusterBundlesWrapper" measureRecentPeak:0];
      [(MOPerformanceMeasurement *)v17 startSession];
      v18 = *(void **)(a1 + 40);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_320;
      v30[3] = &unk_1002CE030;
      id v19 = v10;
      id v20 = *(void **)(a1 + 56);
      uint64_t v36 = *(void *)(a1 + 64);
      id v31 = v19;
      CFStringRef v32 = v17;
      id v35 = v20;
      id v21 = *(id *)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 40);
      id v33 = v21;
      uint64_t v34 = v22;
      v23 = v17;
      [v18 _generateClusterAndAnomalyBundlesWithHandler:v30];
    }
    else
    {
      uint64_t v24 = *(void *)(a1 + 56);
      if (v24) {
        (*(void (**)(uint64_t, void, id))(v24 + 16))(v24, 0, v6);
      }
      long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 134218498;
        uint64_t v38 = v26;
        __int16 v39 = 2112;
        id v40 = v6;
        __int16 v41 = 2112;
        id v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant] refreshVariant %lu, bundling result %@, error %@", buf, 0x20u);
      }

      long long v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      long long v28 = v27;
      os_signpost_id_t v29 = *(void *)(a1 + 64);
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v29, "EventBundleManagerBundleEventsWrapper", "", buf, 2u);
      }

      [*(id *)(a1 + 48) endSession];
    }
  }
}

void __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_320(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) addEntriesFromDictionary:v6];
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "EventBundleManagerGenerateClusterAndAnomalyBundlesWrapper", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant] refreshVariant %lu, clustering result %@, error %@", buf, 0x20u);
  }

  if (v5)
  {
    (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v5, *(void *)(a1 + 32), v12);
  }
  else
  {
    uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    uint64_t v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 72);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v15, "EventBundleManagerBundleEventsWrapper", "", buf, 2u);
    }

    [*(id *)(a1 + 48) endSession];
    os_signpost_id_t v16 = [*(id *)(a1 + 56) engagementAndSuggestionAnalyticsManager];
    unsigned int v17 = [v16 isReadyToSubmitAnalytics];

    if (v17)
    {
      id v19 = [*(id *)(a1 + 56) onboardingAndSettingsPersistence];
      id v20 = [v19 getSnapshotDictionaryForAnalytics];
      id v21 = +[MOEngagementAndSuggestionAnalyticsParams updateOnboardingStatusDictionaryKeys:v20];

      uint64_t v22 = [*(id *)(a1 + 56) engagementAndSuggestionAnalyticsManager];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_322;
      v25[3] = &unk_1002CE008;
      id v23 = *(id *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 72);
      id v26 = v23;
      uint64_t v27 = v24;
      [v22 submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus:v21 AndCompletionHandler:v25];
    }
    (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 0, *(void *)(a1 + 32), v18);
  }
}

void __66__MOEventBundleManager_bundleEventsWithRefreshVariant_andHandler___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) addEntriesFromDictionary:v6];
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 134218498;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[bundleEventsWithRefreshVariant] refreshVariant %lu, analytics result %@, error %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_computeEngagementScoreParams
{
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__19;
  id v14 = __Block_byref_object_dispose__19;
  id v15 = 0;
  id v3 = [(MOEventBundleManager *)self eventBundleStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __53__MOEventBundleManager__computeEngagementScoreParams__block_invoke;
  v9[3] = &unk_1002CB180;
  v9[4] = &v10;
  [v3 getRankingParamsandCompletionHandler:v9];

  BOOL v4 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Attempting to update engagement score for sensed bundles", v8, 2u);
  }

  id v5 = [(MOEventBundleManager *)self eventBundleRanking];
  [(MOEventBundleManager *)self _computeSensedBundleEngagementScoreParams:v5 withRankingParams:v11[5]];

  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to update evergreen scores", v8, 2u);
  }

  uint64_t v7 = [(MOEventBundleManager *)self eventBundleRanking];
  [(MOEventBundleManager *)self _computeEvergreenScoreParams:v7 withRankingParams:v11[5]];

  _Block_object_dispose(&v10, 8);
}

uint64_t __53__MOEventBundleManager__computeEngagementScoreParams__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    __int16 v11 = v5;
    id v5 = [v5 count];
    id v6 = v11;
    if (v5)
    {
      uint64_t v7 = [v11 objectAtIndexedSubscript:0];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      int v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = v11;
    }
  }

  return _objc_release_x1(v5, v6);
}

- (void)_computeSensedBundleEngagementScoreParams:(id)a3 withRankingParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", "", buf, 2u);
  }

  int v9 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsComputeEngagementScoreParams" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  uint64_t v10 = +[NSDate date];
  if (v7)
  {
    id v11 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:0.0];
    uint64_t v12 = [v7 engagementScoreParamsUpdateDate];
    unsigned __int8 v13 = [v12 isEqual:v11];

    if (v13)
    {
      [v7 setIsParamsUpdateOnHold:1];
      id v14 = [(MOEventBundleManager *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_335;
      block[3] = &unk_1002CD9F0;
      block[4] = self;
      id v15 = &v110;
      id v110 = v6;
      os_signpost_id_t v16 = &v111;
      id v111 = v7;
      dispatch_async(v14, block);

      unsigned int v17 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Update date for sensed bundle engagement score was not initialized. Initialize the data and skip update.", buf, 2u);
      }

      uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (!os_signpost_enabled(v18)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
LABEL_25:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", "", buf, 2u);
LABEL_26:

      [(MOPerformanceMeasurement *)v9 endSession];
      goto LABEL_27;
    }
    [v6 setRankingParamsFromRankingParamsMO:v7];
    uint64_t v22 = [v6 engagementScoreParameterDict];
    id v23 = [v22 objectForKeyedSubscript:@"longTimePeriodSinceEngagementScoreParamsUpdatedSec"];
    float v24 = (float)(int)[v23 intValue];

    long long v25 = [v7 engagementScoreParamsUpdateDate];
    [v25 timeIntervalSinceDate:v10];
    double v27 = fabs(v26);
    double v28 = v24;

    if (v27 >= v28)
    {
      [v7 setIsParamsUpdateOnHold:1];
      uint64_t v34 = [(MOEventBundleManager *)self queue];
      v112[0] = _NSConcreteStackBlock;
      v112[1] = 3221225472;
      v112[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke;
      v112[3] = &unk_1002CD9F0;
      v112[4] = self;
      id v15 = &v113;
      id v113 = v6;
      os_signpost_id_t v16 = &v114;
      id v114 = v7;
      dispatch_async(v34, v112);

      id v35 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v118 = v28;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Last sensed bundle engagement score update occurred earlier than %f from now. Add holdout period and skip update.", buf, 0xCu);
      }

      uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (!os_signpost_enabled(v18)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      goto LABEL_25;
    }

    uint64_t v29 = [v7 engagementScoreParamsUpdateDate];
    unsigned int v30 = [v10 isBeforeDate:v29];

    if (v30)
    {
      id v31 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        __int16 v32 = [v7 engagementScoreParamsUpdateDate];
        *(_DWORD *)buf = 138412546;
        double v118 = *(double *)&v10;
        __int16 v119 = 2112;
        id v120 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "current date is behind previous engage params update date %@,%@. Skip update.", buf, 0x16u);
      }
      id v33 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", "", buf, 2u);
      }

      [(MOPerformanceMeasurement *)v9 endSession];
    }
    else
    {
      v97 = v6;
      uint64_t v36 = [(MOEventBundleManager *)self engagementHistoryManager];
      v37 = [v7 engagementScoreParamsUpdateDate];
      uint64_t v38 = [v36 getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedFromStartDate:v37 toEndDate:v10 withMinimumAddedCharacters:1];

      v91 = v38;
      id v39 = [v38 mutableCopy];
      [v39 removeObjectForKey:&off_1002F5738];
      [v39 removeObjectForKey:&off_1002F5750];
      id v40 = [(MOEventBundleManager *)self engagementHistoryManager];
      [v7 engagementScoreParamsUpdateDate];
      __int16 v41 = v102 = v10;
      id v42 = [v40 getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedButNoWritingFromStartDate:v41 toEndDate:v102];

      v90 = v42;
      id v43 = [v42 mutableCopy];
      [v43 removeObjectForKey:&off_1002F5738];
      [v43 removeObjectForKey:&off_1002F5750];
      SEL v44 = [(MOEventBundleManager *)self engagementHistoryManager];
      v45 = [v7 engagementScoreParamsUpdateDate];
      uint64_t v46 = [v44 getInterfaceTypeCountForUniqueSuggestionsViewedButNotEngagedFromStartDate:v45 toEndDate:v102];

      v94 = v46;
      id v47 = [v46 mutableCopy];
      [v47 removeObjectForKey:&off_1002F5738];
      v99 = v47;
      [v47 removeObjectForKey:&off_1002F5750];
      id v48 = [(MOEventBundleManager *)self engagementHistoryManager];
      v49 = [v7 engagementScoreParamsUpdateDate];
      v50 = [v48 getInterfaceTypeCountForUniqueSuggestionsDeletedFromStartDate:v49 toEndDate:v102];

      v93 = v50;
      id v51 = [v50 mutableCopy];
      [v51 removeObjectForKey:&off_1002F5738];
      [v51 removeObjectForKey:&off_1002F5750];
      v101 = v39;
      v95 = [v39 allValues];
      id v52 = [v95 valueForKeyPath:@"@sum.self"];
      LODWORD(v50) = [v52 intValue];
      id v100 = v43;
      v53 = [v43 allValues];
      objc_super v54 = [v53 valueForKeyPath:@"@sum.self"];
      LODWORD(v39) = [v54 intValue] + v50;
      v98 = v51;
      v55 = [v51 allValues];
      id v56 = [v55 valueForKeyPath:@"@sum.self"];
      unsigned int v57 = v39 + [v56 intValue];

      v58 = [(MOEventBundleManager *)self engagementHistoryManager];
      v59 = [v7 engagementScoreParamsUpdateDate];
      id v60 = [v58 getInterfaceTypeCountForUniqueSuggestionsViewedFromStartDate:v59 toEndDate:v102];

      id v92 = v60;
      id v61 = [v60 mutableCopy];
      [v61 removeObjectForKey:&off_1002F5738];
      [v61 removeObjectForKey:&off_1002F5750];
      v62 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        v63 = [v7 engagementScoreParamsUpdateDate];
        *(_DWORD *)buf = 138413826;
        double v118 = *(double *)&v63;
        __int16 v119 = 2112;
        id v120 = v102;
        __int16 v121 = 2112;
        id v122 = v61;
        __int16 v123 = 2112;
        v124 = v101;
        __int16 v125 = 2112;
        v126 = v100;
        __int16 v127 = 2112;
        v128 = v99;
        __int16 v129 = 2112;
        v130 = v98;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Sensed bundle engagement signals collected between last engagement score update date (%@) and now(%@): TotalViewedSuggestions=%@, journalIsWritten=%@, entryCreatedWithNoWritings=%@, suggestionViewedButNotEngaged=%@, suggestionDeleted=%@", buf, 0x48u);
      }
      id v96 = v61;
      id v64 = [v61 allKeys];
      id v65 = [v64 count];

      id v6 = v97;
      v66 = [v97 engagementScoreParameterDict];
      v67 = [v66 objectForKeyedSubscript:@"minEngagementCount"];
      unsigned int v68 = [v67 intValue];

      v69 = [v97 engagementScoreParameterDict];
      v70 = [v69 objectForKeyedSubscript:@"minInterfaceTypes"];
      signed int v71 = [v70 intValue];

      if ((unint64_t)v65 < v71 || v57 < v68)
      {
        v85 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        v83 = v91;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&double v118 = (int)v57;
          __int16 v119 = 2048;
          id v120 = v65;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "Not enough engagement signals (=%lu) or uniqueViewedBundleTypes (=%lu) for sensed bundle engagement score update. Skip update. ", buf, 0x16u);
        }

        uint64_t v10 = v102;
        id v84 = v90;
        id v80 = v93;
        v79 = v94;
        v81 = v92;
      }
      else
      {
        double v72 = 0.0;
        if ([v7 isParamsUpdateOnHold])
        {
          v73 = [v97 engagementScoreParameterDict];
          v74 = [v73 objectForKeyedSubscript:@"minTimeIntervalForUpdateSec"];
          float v75 = (float)(int)[v74 intValue];

          double v72 = v75;
        }
        id v76 = [v7 engagementScoreParamsUpdateDate];
        uint64_t v10 = v102;
        [v76 timeIntervalSinceDate:v102];
        double v78 = fabs(v77);

        id v80 = v93;
        v79 = v94;
        v81 = v92;
        if (v78 >= v72)
        {
          v115[0] = @"journalWasWritten";
          v115[1] = @"journalEntryWasCreatedWithNoWriting";
          v116[0] = v101;
          v116[1] = v100;
          v115[2] = @"suggestionWasViewedButNotEngaged";
          v115[3] = @"suggestionWasDeleted";
          v116[2] = v99;
          v116[3] = v98;
          v86 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:4];
          [v97 setInterfaceTypeCountFromSuggestionEngagementDict:v86];

          [v97 updateEngagementScoreParamsUsingBFGS];
          [v7 setIsParamsUpdateOnHold:0];
          v87 = [(MOEventBundleManager *)self queue];
          v103[0] = _NSConcreteStackBlock;
          v103[1] = 3221225472;
          v103[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_343;
          v103[3] = &unk_1002CD9F0;
          v103[4] = self;
          id v104 = v97;
          id v105 = v7;
          dispatch_async(v87, v103);

          id v88 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          id v84 = v90;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "New sensed bundle engagement scores are saved.", buf, 2u);
          }

          v83 = v91;
        }
        else
        {
          v82 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
          id v84 = v90;
          v83 = v91;
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Engagement score update is in holdout period. Skip update.", buf, 2u);
          }
        }
      }
      v89 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_signpost_enabled(v89))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v89, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", "", buf, 2u);
      }

      [(MOPerformanceMeasurement *)v9 endSession];
    }
  }
  else
  {
    id v19 = [(MOEventBundleManager *)self queue];
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_336;
    v106[3] = &unk_1002CD9F0;
    v106[4] = self;
    id v107 = v6;
    id v108 = 0;
    dispatch_async(v19, v106);

    id v20 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Engagement score DB is empty. Fill in the DB with default values and skip update.", buf, 2u);
    }

    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeSensedBundleEngagementScoreParams", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v9 endSession];
  }
LABEL_27:
}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:0];
}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_335(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:0];
}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_336(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:0];
}

void __84__MOEventBundleManager__computeSensedBundleEngagementScoreParams_withRankingParams___block_invoke_343(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:0];
}

- (void)_computeEvergreenScoreParams:(id)a3 withRankingParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", "", buf, 2u);
  }

  int v9 = [[MOPerformanceMeasurement alloc] initWithName:@"ComputeEvergreenScoreParams" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  double v10 = +[NSDate date];
  if (!v7)
  {
    queue = self->_queue;
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_348;
    v71[3] = &unk_1002CD9F0;
    v71[4] = self;
    id v72 = v6;
    id v73 = 0;
    dispatch_async(queue, v71);
    id v20 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Engagement score DB is empty. Fill in the DB with default values and skip update.", buf, 2u);
    }

    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v9 endSession];
    uint64_t v22 = v72;
    goto LABEL_14;
  }
  id v11 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:0.0];
  uint64_t v12 = [v7 evergreenEngagementScoreParamsUpdateDate];
  unsigned __int8 v13 = [v12 isEqual:v11];

  if (v13)
  {
    [v7 setIsEvergreenEngagementScoreParamsUpdateOnHold:1];
    id v14 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_347;
    block[3] = &unk_1002CD9F0;
    block[4] = self;
    id v15 = &v75;
    id v75 = v6;
    os_signpost_id_t v16 = &v76;
    id v76 = v7;
    dispatch_async(v14, block);
    unsigned int v17 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Update date for evergreen score was not initialized. Initialize the data and skip update.", buf, 2u);
    }

    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (!os_signpost_enabled(v18)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
LABEL_26:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", "", buf, 2u);
LABEL_27:

    [(MOPerformanceMeasurement *)v9 endSession];
    goto LABEL_28;
  }
  [v6 setRankingParamsFromRankingParamsMO:v7];
  id v23 = [v6 engagementScoreParameterDict];
  float v24 = [v23 objectForKeyedSubscript:@"longTimePeriodSinceEngagementScoreParamsUpdatedSec"];
  float v25 = (float)(int)[v24 intValue];

  double v26 = [v7 evergreenEngagementScoreParamsUpdateDate];
  [v26 timeIntervalSinceDate:*(void *)&v10];
  double v28 = fabs(v27);
  double v29 = v25;

  if (v28 >= v29)
  {
    [v7 setIsEvergreenEngagementScoreParamsUpdateOnHold:1];
    id v35 = self->_queue;
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke;
    v77[3] = &unk_1002CD9F0;
    v77[4] = self;
    id v15 = &v78;
    id v78 = v6;
    os_signpost_id_t v16 = &v79;
    id v79 = v7;
    dispatch_async(v35, v77);
    uint64_t v36 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v81 = v29;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Last evergreen engagement score update occurred earlier than %f from now. Add holdout period and skip update.", buf, 0xCu);
    }

    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (!os_signpost_enabled(v18)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    goto LABEL_26;
  }

  unsigned int v30 = [v7 evergreenEngagementScoreParamsUpdateDate];
  unsigned int v31 = [*(id *)&v10 isBeforeDate:v30];

  if (!v31)
  {
    v37 = [(MOEventBundleManager *)self engagementHistoryManager];
    uint64_t v38 = [v7 evergreenEngagementScoreParamsUpdateDate];
    id v39 = [v37 getEvergreenTypeCountForSuggestionsWithJournalCreatedFromStartDate:v38 toEndDate:*(void *)&v10 withMinimumAddedCharacters:0];

    v67 = v39;
    id v40 = [v39 mutableCopy];
    [v40 removeObjectForKey:&stru_1002D2AC8];
    __int16 v41 = [v40 allValues];
    id v42 = [v41 valueForKeyPath:@"@sum.self"];
    *(void *)&double v43 = (int)[v42 intValue];

    SEL v44 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      double v45 = [v7 evergreenEngagementScoreParamsUpdateDate];
      *(_DWORD *)buf = 138412802;
      double v81 = v45;
      __int16 v82 = 2112;
      double v83 = v10;
      __int16 v84 = 2112;
      id v85 = v40;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Evergreen engagement signals collected between last engagement score update date (%@) and now(%@): selected %@", buf, 0x20u);
    }
    uint64_t v46 = [v6 engagementScoreParameterDict];
    id v47 = [v46 objectForKeyedSubscript:@"minEngagementCount"];
    unsigned int v48 = [v47 intValue];

    if (LODWORD(v43) >= v48)
    {
      double v53 = 0.0;
      if ([v7 isEvergreenEngagementScoreParamsUpdateOnHold])
      {
        objc_super v54 = [v6 engagementScoreParameterDict];
        v55 = [v54 objectForKeyedSubscript:@"minTimeIntervalForUpdateSec"];
        float v56 = (float)(int)[v55 intValue];

        double v53 = v56;
      }
      unsigned int v57 = [v7 evergreenEngagementScoreParamsUpdateDate];
      [v57 timeIntervalSinceDate:*(void *)&v10];
      double v59 = fabs(v58);

      if (v59 >= v53)
      {
        *(double *)&v49 = COERCE_DOUBLE(objc_opt_new());
        [v49 setObject:&off_1002F94B0 forKeyedSubscript:@"GRATITUDE"];
        [v49 setObject:&off_1002F94B0 forKeyedSubscript:@"KINDNESS"];
        [v49 setObject:&off_1002F94B0 forKeyedSubscript:@"WISDOM"];
        [v49 setObject:&off_1002F94B0 forKeyedSubscript:@"PURPOSE"];
        [v49 setObject:&off_1002F94B0 forKeyedSubscript:@"RESILIENCE"];
        [v49 setObject:&off_1002F94B0 forKeyedSubscript:@"CREATIVITY"];
        if ([v40 count] == (id)1)
        {
          id v60 = [v40 allKeys];
          id v61 = [v60 objectAtIndexedSubscript:0];

          [v49 setObject:&off_1002F94C0 forKeyedSubscript:v61];
        }
        else
        {
          id v61 = [v40 keysSortedByValueUsingComparator:&__block_literal_global_22];
          v62 = [v61 objectAtIndexedSubscript:0];
          [v49 setObject:&off_1002F94C0 forKeyedSubscript:v62];

          v63 = [v61 objectAtIndexedSubscript:1];
          [v49 setObject:&off_1002F94D0 forKeyedSubscript:v63];
        }
        [v6 setEvergreenEngagementScoreParameterDict:v49];
        [v7 setIsEvergreenEngagementScoreParamsUpdateOnHold:0];
        id v64 = self->_queue;
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_359;
        v68[3] = &unk_1002CD9F0;
        v68[4] = self;
        id v69 = v6;
        id v70 = v7;
        dispatch_async(v64, v68);
        id v65 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          double v81 = *(double *)&v49;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "New evergreen engagement scores are saved: %@", buf, 0xCu);
        }

        goto LABEL_46;
      }
      _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      *(double *)&v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v50 = "Evergreen engagement score update is in holdout period. Skip update.";
        id v51 = v49;
        uint32_t v52 = 2;
        goto LABEL_39;
      }
    }
    else
    {
      _mo_log_facility_get_os_log(&MOLogFacilityRanking);
      *(double *)&v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v81 = v43;
        v50 = "Not enough engagement signals (=%lu) for evergreen engagement score update. Skip update.";
        id v51 = v49;
        uint32_t v52 = 12;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, v50, buf, v52);
      }
    }
LABEL_46:

    v66 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v66))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v9 endSession];
    uint64_t v22 = v67;
LABEL_14:

    goto LABEL_28;
  }
  __int16 v32 = _mo_log_facility_get_os_log(&MOLogFacilityRanking);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    id v33 = [v7 evergreenEngagementScoreParamsUpdateDate];
    *(_DWORD *)buf = 138412546;
    double v81 = v10;
    __int16 v82 = 2112;
    double v83 = *(double *)&v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Current date is behind previous evergreen params update date %@,%@. Skip update.", buf, 0x16u);
  }
  uint64_t v34 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsComputeEvergreenScoreParams", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v9 endSession];
LABEL_28:
}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:1];
}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_347(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:1];
}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_348(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:1];
}

int64_t __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_355(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 integerValue];
  if ((uint64_t)v6 <= (uint64_t)[v5 integerValue])
  {
    id v8 = [v4 integerValue];
    int64_t v7 = (uint64_t)v8 < (uint64_t)[v5 integerValue];
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

void __71__MOEventBundleManager__computeEvergreenScoreParams_withRankingParams___block_invoke_359(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventBundleStore];
  [v2 storeRankingParams:*(void *)(a1 + 40) forContext:*(void *)(a1 + 48) forEvergreenScore:1];
}

- (void)_bundleEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__19;
  id v64 = __Block_byref_object_dispose__19;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  unsigned int v57 = __Block_byref_object_copy__19;
  double v58 = __Block_byref_object_dispose__19;
  id v59 = 0;
  int64_t v7 = [[MOEventRefreshHelper alloc] initWithUniverse:self->fUniverse];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke;
  v53[3] = &unk_1002CE0A0;
  v53[4] = &v60;
  v53[5] = &v54;
  [(MOEventRefreshHelper *)v7 getBundlingDatesForVariant:a3 withHandler:v53];
  if (!v61[5] || !v55[5])
  {
    NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
    CFStringRef v74 = @"[bundleEventsWithRefreshVariant] start or end date for bundling is not available";
    id v11 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    id v12 = +[NSError errorWithDomain:@"MOErrorDomain" code:18 userInfo:v11];

    v6[2](v6, v12, 0);
    goto LABEL_34;
  }
  BOOL v8 = a3 == 768;
  if (a3 == 1280) {
    BOOL v8 = 1;
  }
  BOOL v39 = v8;
  if (a3 == 1280 || a3 == 768)
  {
    int v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v67 = a3;
      double v10 = "Current refresh variant: %lu. CA and Biome analytics submissions are enabled.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
    }
  }
  else
  {
    int v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v67 = a3;
      double v10 = "Current refresh variant: %lu. CA and Biome analytics submissions are disabled.";
      goto LABEL_12;
    }
  }

  [(id)v55[5] timeIntervalSinceDate:v61[5]];
  unsigned __int8 v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, &off_1002F97E0, &off_1002F97F0, &off_1002F9800, &off_1002F9810, &off_1002F9820, &off_1002F9830, &off_1002F9840, &off_1002F9850, 0);

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v49 objects:v72 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v50;
    double v18 = 0.0;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        [v20 doubleValue];
        if (v21 > v18)
        {
          [v20 doubleValue];
          double v18 = v22;
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v49 objects:v72 count:16];
    }
    while (v16);
  }
  else
  {
    double v18 = 0.0;
  }

  if (a3 == 1280 || a3 == 768)
  {
    id v23 = [(id)v55[5] dateByAddingTimeInterval:-v18];
    id v24 = objc_alloc((Class)NSDateInterval);
    id v25 = [v24 initWithStartDate:v23 endDate:v55[5]];
  }
  else
  {
    double v26 = +[NSCalendar currentCalendar];
    id v23 = [v26 startOfDayForDate:v61[5]];

    double v27 = _mo_log_facility_get_os_log(&MOLogFacilityRefreshHelper);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      unint64_t v28 = v61[5];
      double v29 = +[NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138412802;
      unint64_t v67 = v28;
      __int16 v68 = 2112;
      id v69 = v23;
      __int16 v70 = 2112;
      signed int v71 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "extended event fetching start date from (%@) to (%@) with variant (%@)", buf, 0x20u);
    }
    id v30 = objc_alloc((Class)NSDateInterval);
    id v25 = [v30 initWithStartDate:v23 endDate:v55[5]];
  }
  unsigned int v31 = v25;

  __int16 v32 = [[MOEventFetchOptions alloc] initWithDateInterval:v31 ascending:1 limit:0];
  id v33 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v34 = v33;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerBundleEventsFetchEvents", "", buf, 2u);
  }

  id v35 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsFetchEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v35 startSession];
  eventManager = self->_eventManager;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_387;
  v40[3] = &unk_1002CE140;
  v40[4] = self;
  unint64_t v47 = a3;
  v37 = v35;
  __int16 v41 = v37;
  SEL v44 = v6;
  uint64_t v38 = v32;
  id v42 = v38;
  id v12 = v15;
  BOOL v48 = v39;
  id v43 = v12;
  double v45 = &v54;
  uint64_t v46 = &v60;
  [(MOEventManager *)eventManager fetchEventsWithOptions:v38 CompletionHandler:v40];

LABEL_34:
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_387(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2;
  block[3] = &unk_1002CE118;
  uint64_t v21 = *(void *)(a1 + 88);
  id v13 = *(id *)(a1 + 40);
  id v14 = v6;
  id v19 = *(id *)(a1 + 64);
  id v15 = v5;
  id v16 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  char v22 = *(unsigned char *)(a1 + 96);
  uint64_t v9 = *(void *)(a1 + 32);
  id v17 = v8;
  uint64_t v18 = v9;
  long long v20 = *(_OWORD *)(a1 + 72);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 104);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, v4, "EventBundleManagerBundleEventsFetchEvents", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  BOOL v5 = *(void *)(a1 + 40) == 0;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  int64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = [*(id *)(a1 + 48) count];
      id v10 = [*(id *)(a1 + 56) dateInterval];
      id v11 = [v10 startDate];
      id v12 = [*(id *)(a1 + 56) dateInterval];
      id v13 = [v12 endDate];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      id v107 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "there are %lu event(s) to bundle from start date: %@ to end date : %@", buf, 0x20u);
    }
    double v77 = +[NSString stringWithFormat:@"%@", @"startDate"];
    id v78 = +[NSString stringWithFormat:@"%@", @"endDate"];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v107 = __Block_byref_object_copy__19;
    id v108 = __Block_byref_object_dispose__19;
    id v109 = objc_alloc_init((Class)NSMutableDictionary);
    v100[0] = 0;
    v100[1] = v100;
    v100[2] = 0x3032000000;
    v100[3] = __Block_byref_object_copy__19;
    v100[4] = __Block_byref_object_dispose__19;
    id v101 = 0;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id obj = *(id *)(a1 + 64);
    id v14 = [obj countByEnumeratingWithState:&v96 objects:v105 count:16];
    id v15 = NSAssertionHandler_ptr;
    if (v14)
    {
      uint64_t v79 = *(void *)v97;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v97 != v79) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          [v17 doubleValue];
          BOOL v20 = v19 == 604800.0;
          if (v19 == 604800.0 || *(unsigned char *)(a1 + 112))
          {
            uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) dateByAddingTimeInterval:-v19];
            BOOL v81 = v20;
            char v22 = [v15[37] predicateWithFormat:@"%K >= %@", v78, v21];
            v104[0] = v22;
            id v23 = [v15[37] predicateWithFormat:@"%K <= %@", v77, *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
            v104[1] = v23;
            id v24 = +[NSArray arrayWithObjects:v104 count:2];
            uint64_t v25 = +[NSCompoundPredicate andPredicateWithSubpredicates:v24];

            double v26 = [*(id *)(a1 + 48) filteredArrayUsingPredicate:v25];
            id v82 = [v26 mutableCopy];

            double v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            unint64_t v28 = v27;
            os_signpost_id_t v29 = *(void *)(a1 + 104);
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
            {
              *(_WORD *)v95 = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "EventBundleManagerBundleEventsCollectTimeCorrelatedEvents", "", v95, 2u);
            }

            id v30 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsCollectTimeCorrelatedEvents" measureRecentPeak:0];
            [(MOPerformanceMeasurement *)v30 startSession];
            id v80 = *(void **)(a1 + 72);
            unsigned int v31 = (void *)v25;
            __int16 v32 = v18;
            id v33 = v15;
            uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
            id v35 = v14;
            uint64_t v36 = *(unsigned __int8 *)(a1 + 112);
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472;
            v88[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_410;
            v88[3] = &unk_1002CE0C8;
            BOOL v94 = v81;
            v91 = v100;
            id v92 = buf;
            id v37 = *(id *)(a1 + 48);
            uint64_t v38 = *(void *)(a1 + 104);
            id v89 = v37;
            uint64_t v93 = v38;
            BOOL v39 = v30;
            v90 = v39;
            uint64_t v40 = v34;
            id v15 = v33;
            uint64_t v18 = v32;
            uint64_t v41 = v36;
            id v14 = v35;
            [v80 _collectTimeCorrelatedEventsWithStartDate:v21 endDate:v40 events:v82 submitMetricsFlg:v41 handler:v88];
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v96 objects:v105 count:16];
      }
      while (v14);
    }

    if (*(unsigned char *)(a1 + 112))
    {
      id v42 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      id v43 = v42;
      os_signpost_id_t v44 = *(void *)(a1 + 104);
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)v95 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, v44, "EventBundleManagerBundleEventsSubmitMetrics", "", v95, 2u);
      }

      double v45 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsSubmitMetrics" measureRecentPeak:0];
      [(MOPerformanceMeasurement *)v45 startSession];
      uint64_t v46 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) dateByAddingTimeInterval:-259200.0];
      unint64_t v47 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) dateByAddingTimeInterval:-172800.0];
      BOOL v48 = +[NSDate date];
      long long v49 = [v15[37] predicateWithFormat:@"%K >= %@", v78, v46];
      v103[0] = v49;
      long long v50 = [v15[37] predicateWithFormat:@"%K <= %@", v77, v47];
      v103[1] = v50;
      long long v51 = +[NSArray arrayWithObjects:v103 count:2];
      long long v52 = +[NSCompoundPredicate andPredicateWithSubpredicates:v51];

      double v53 = [*(id *)(a1 + 48) filteredArrayUsingPredicate:v52];
      id v54 = [v53 mutableCopy];

      [*(id *)(a1 + 72) submitMOEventData:v54 startDate:v46 endDate:v47 subDate:v48];
      v55 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      uint64_t v56 = v55;
      os_signpost_id_t v57 = *(void *)(a1 + 104);
      if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_WORD *)v95 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_INTERVAL_END, v57, "EventBundleManagerBundleEventsSubmitMetrics", "", v95, 2u);
      }

      [(MOPerformanceMeasurement *)v45 endSession];
    }
    double v58 = +[NSCalendar currentCalendar];
    id v59 = [v58 startOfDayForDate:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];

    uint64_t v60 = [v15[37] predicateWithFormat:@"%K >= %@", v78, v59];
    v102[0] = v60;
    id v61 = [v15[37] predicateWithFormat:@"%K <= %@", v77, *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    v102[1] = v61;
    uint64_t v62 = +[NSArray arrayWithObjects:v102 count:2];
    v63 = +[NSCompoundPredicate andPredicateWithSubpredicates:v62];

    id v64 = [*(id *)(a1 + 48) filteredArrayUsingPredicate:v63];
    id v65 = [v64 mutableCopy];

    v66 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    unint64_t v67 = v66;
    os_signpost_id_t v68 = *(void *)(a1 + 104);
    if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
    {
      *(_WORD *)v95 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_INTERVAL_BEGIN, v68, "EventBundleManagerBundleEventsDeep", "", v95, 2u);
    }

    id v69 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeep" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v69 startSession];
    __int16 v70 = *(void **)(a1 + 72);
    uint64_t v71 = *(unsigned __int8 *)(a1 + 112);
    uint64_t v72 = *(void *)(a1 + 104);
    v83[0] = _NSConcreteStackBlock;
    int8x16_t v73 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
    uint64_t v74 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    v83[1] = 3221225472;
    v83[2] = __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_417;
    v83[3] = &unk_1002CE0F0;
    v83[4] = v70;
    int8x16_t v86 = v73;
    uint64_t v87 = v72;
    id v75 = v69;
    __int16 v84 = v75;
    id v85 = *(id *)(a1 + 80);
    [v70 _bundleEvents:v65 startDate:v59 endDate:v74 submitMetricsFlg:v71 refreshVariant:v72 handler:v83];

    _Block_object_dispose(v100, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 80);
    if (v8) {
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, *(void *)(a1 + 40), &__NSDictionary0__struct);
    }
  }
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 72))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      id v8 = v5;
      id v9 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v8;
    }
    else
    {
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) count]);
      [v10 setObject:v11 forKey:@"resultNumberOfEvents"];

      id v9 = [v6 objectForKey:@"resultNumberOfBundleEvents"];
      if (v9) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v9 forKey:@"resultNumberOfBundleEvents"];
      }
    }
  }
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 64);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)id v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v14, "EventBundleManagerBundleEventsCollectTimeCorrelatedEvents", "", v15, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_417(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) defaultManager];
    [v7 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:@"EventBundleManagerLastBundlingStartDate"];

    id v8 = [*(id *)(a1 + 32) defaultManager];
    [v8 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:@"EventBundleManagerLastBundlingEndDate"];
  }
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v11, "EventBundleManagerBundleEventsDeep", "", v13, 2u);
  }

  [*(id *)(a1 + 40) endSession];
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);
  }
}

- (void)_bundleEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 submitMetricsFlg:(BOOL)a6 refreshVariant:(unint64_t)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v16 = a8;
  id v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = [v13 count];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    long long v50 = v15;
    LOWORD(v51) = 2048;
    *(void *)((char *)&v51 + 2) = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Bundle Annotation: there are %lu event(s) to bundle.(%@ - %@), refresh variant, %lu", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  long long v50 = __Block_byref_object_copy__19;
  *(void *)&long long v51 = __Block_byref_object_dispose__19;
  *((void *)&v51 + 1) = [objc_alloc((Class)NSDateInterval) initWithStartDate:v14 endDate:v15];
  uint64_t v18 = objc_opt_new();
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__19;
  v47[4] = __Block_byref_object_dispose__19;
  id v48 = 0;
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  BOOL v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)uint64_t v46 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundles", "", v46, 2u);
  }

  uint64_t v21 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepFetchPreviousBundles" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v21 startSession];
  uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke;
  v32[3] = &unk_1002CE258;
  id v23 = v21;
  id v33 = v23;
  uint64_t v41 = v47;
  id v24 = v16;
  id v42 = buf;
  SEL v43 = a2;
  id v40 = v24;
  uint64_t v34 = self;
  id v25 = v18;
  id v35 = v25;
  unint64_t v44 = a7;
  id v26 = v14;
  id v36 = v26;
  double v27 = v15;
  id v37 = v27;
  id v28 = v19;
  id v38 = v28;
  id v29 = v13;
  id v39 = v29;
  BOOL v45 = a6;
  [(MOEventBundleManager *)self _fetchPreviousBundlesWithDateInterval:v22 handler:v32];

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(buf, 8);
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v30 = a3;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundles", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  if (v30)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a3);
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    id v28 = +[NSMutableArray arrayWithArray:v29];
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 112));
      id v7 = [v29 count];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@, previousEventBundles %lu", buf, 0x16u);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v8 = v29;
    id v9 = [v8 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v50;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = NSStringFromSelector(*(SEL *)(a1 + 112));
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v14;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@, previousEventBundles %@", buf, 0x16u);
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v9);
    }

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v54 = __Block_byref_object_copy__19;
    v55 = __Block_byref_object_dispose__19;
    id v56 = 0;
    id v15 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) ascending:1 limit:0 includeDeletedBundles:0 skipRanking:1 interfaceType:13];
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)id v48 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchTripBundlesFetchWithOptions", "", v48, 2u);
    }

    id v17 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepFetchTripBundlesFetchWithOptions" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v17 startSession];
    uint64_t v18 = *(void **)(a1 + 40);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_432;
    v32[3] = &unk_1002CE230;
    id v19 = v17;
    id v33 = v19;
    id v42 = buf;
    BOOL v20 = *(void **)(a1 + 88);
    uint64_t v43 = *(void *)(a1 + 96);
    id v21 = v20;
    uint64_t v45 = *(void *)(a1 + 112);
    uint64_t v22 = *(void *)(a1 + 40);
    id v41 = v21;
    uint64_t v34 = v22;
    id v23 = v28;
    id v35 = v23;
    id v24 = *(id *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 120);
    id v36 = v24;
    uint64_t v46 = v25;
    id v37 = *(id *)(a1 + 56);
    id v26 = *(id *)(a1 + 64);
    uint64_t v27 = *(void *)(a1 + 104);
    id v38 = v26;
    uint64_t v44 = v27;
    id v39 = *(id *)(a1 + 72);
    id v40 = *(id *)(a1 + 80);
    char v47 = *(unsigned char *)(a1 + 128);
    [v18 fetchRehydratedEventBundlesWithOptions:v15 CompletionHandler:v32];

    _Block_object_dispose(buf, 8);
  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_432(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchTripBundlesFetchWithOptions", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), a3);
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 128));
      id v11 = [v6 count];
      *(_DWORD *)buf = 138412802;
      id v37 = v10;
      __int16 v38 = 2048;
      id v39 = v11;
      __int16 v40 = 2112;
      uint64_t v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, fetched trip bundle count, %lu, error, %@", buf, 0x20u);
    }
    uint64_t v12 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:0 ascending:1 limit:0 includeDeletedBundles:0 skipRanking:1 interfaceType:10];
    id v13 = [*(id *)(a1 + 40) eventBundleStore];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_433;
    v21[3] = &unk_1002CE208;
    uint64_t v14 = *(void *)(a1 + 112);
    uint64_t v33 = *(void *)(a1 + 128);
    uint64_t v31 = v14;
    id v30 = *(id *)(a1 + 96);
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 40);
    id v22 = v15;
    uint64_t v23 = v16;
    id v17 = *(id *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 136);
    id v24 = v17;
    uint64_t v34 = v18;
    id v25 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 72);
    uint64_t v20 = *(void *)(a1 + 120);
    id v26 = v19;
    uint64_t v32 = v20;
    id v27 = *(id *)(a1 + 80);
    id v28 = *(id *)(a1 + 88);
    id v29 = v6;
    char v35 = *(unsigned char *)(a1 + 144);
    [v13 fetchEventBundleWithOptions:v12 CompletionHandler:v21];
  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_433(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 120));
    *(_DWORD *)buf = 138412802;
    id v64 = v8;
    __int16 v65 = 2048;
    id v66 = [v5 count];
    __int16 v67 = 2112;
    id v68 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, fetched photo memory bundle count, %lu, error, %@", buf, 0x20u);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a3);
    id v9 = *(void (**)(void))(*(void *)(a1 + 96) + 16);
LABEL_5:
    v9();
    goto LABEL_25;
  }
  if ([v5 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v5];
  }
  id v46 = v5;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v10 = *(id *)(a1 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v60;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v16 = [*(id *)(a1 + 40) _concatenatedEventIdentifierForBundle:v15];
        if (v16)
        {
          id v17 = *(void **)(a1 + 48);
          uint64_t v18 = [v15 bundleIdentifier];
          [v17 setObject:v18 forKey:v16];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v12);
  }

  if ((*(void *)(a1 + 128) | 0x100) != 0x300) {
    goto LABEL_20;
  }
  if ([*(id *)(a1 + 56) isBeforeDate:*(void *)(a1 + 64)])
  {
    id v19 = [objc_alloc((Class)NSDateInterval) initWithStartDate:*(void *)(a1 + 56) endDate:*(void *)(a1 + 64)];
    uint64_t v20 = *(void *)(*(void *)(a1 + 112) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

LABEL_20:
    id v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = NSStringFromSelector(*(SEL *)(a1 + 120));
      id v24 = *(void **)(a1 + 56);
      id v25 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) startDate];
      id v26 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) endDate];
      *(_DWORD *)buf = 138413058;
      id v64 = v23;
      __int16 v65 = 2112;
      id v66 = v24;
      __int16 v67 = 2112;
      id v68 = v25;
      __int16 v69 = 2112;
      __int16 v70 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@, bundling startDate, %@, adjusted startDate, %@, endDate, %@", buf, 0x2Au);
    }
    id v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundles", "", buf, 2u);
    }

    id v28 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v28 startSession];
    id v29 = *(void **)(a1 + 40);
    id v30 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) startDate];
    uint64_t v31 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) endDate];
    uint64_t v32 = *(void *)(a1 + 80);
    uint64_t v33 = *(void *)(a1 + 88);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_440;
    v47[3] = &unk_1002CE1E0;
    id v48 = v28;
    id v49 = *(id *)(a1 + 72);
    id v50 = *(id *)(a1 + 80);
    id v51 = *(id *)(a1 + 56);
    id v52 = *(id *)(a1 + 64);
    long long v44 = *(_OWORD *)(a1 + 96);
    id v34 = (id)v44;
    long long v55 = v44;
    int8x16_t v45 = *(int8x16_t *)(a1 + 32);
    id v35 = (id)v45.i64[0];
    int8x16_t v53 = vextq_s8(v45, v45, 8uLL);
    uint64_t v56 = *(void *)(a1 + 112);
    id v36 = *(id *)(a1 + 48);
    char v58 = *(unsigned char *)(a1 + 136);
    uint64_t v37 = *(void *)(a1 + 128);
    id v54 = v36;
    uint64_t v57 = v37;
    __int16 v38 = v28;
    [v29 _annotateEventBundlesWithStartDate:v30 endDate:v31 allEvents:v32 eventBundles:v33 handler:v47];

    id v5 = v46;
    goto LABEL_25;
  }
  id v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    __int16 v40 = NSStringFromSelector(*(SEL *)(a1 + 120));
    *(_DWORD *)buf = 138412290;
    id v64 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%@, skip bundling due to no valid startDate!", buf, 0xCu);
  }
  uint64_t v41 = *(void **)(a1 + 72);
  id v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 80) count]);
  [v41 setObject:v42 forKey:@"resultNumberOfEvents"];

  [*(id *)(a1 + 72) setObject:&off_1002F5768 forKey:@"resultNumberOfBundleEvents"];
  uint64_t v43 = *(void *)(a1 + 96);
  id v5 = v46;
  if (v43)
  {
    id v9 = *(void (**)(void))(v43 + 16);
    goto LABEL_5;
  }
LABEL_25:
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_440(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundles", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  id v8 = *(void **)(a1 + 40);
  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) count]);
  [v8 setObject:v9 forKey:@"resultNumberOfEvents"];

  id v10 = *(void **)(a1 + 40);
  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  [v10 setObject:v11 forKey:@"resultNumberOfBundleEvents"];

  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    id v15 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    int8x16_t v45 = v15;
    LOWORD(v46) = 2112;
    *(void *)((char *)&v46 + 2) = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_annotateEventBundlesWithStartDate, startDate, %@, endDate, %@, results, %@, error, %@", buf, 0x2Au);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a3);
    uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(a1 + 56);
      uint64_t v29 = *(void *)(a1 + 64);
      uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t))[*(id *)(a1 + 48) count];
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2048;
      int8x16_t v45 = v31;
      LOWORD(v46) = 2112;
      *(void *)((char *)&v46 + 2) = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "annotate bundle error, startDate, %@, endDate, %@, events, %lu, error, %@", buf, 0x2Au);
    }

    uint64_t v17 = *(void *)(a1 + 96);
    if (v17) {
      (*(void (**)(uint64_t, void, void))(v17 + 16))(v17, *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), *(void *)(a1 + 40));
    }
  }
  else
  {
    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarization", "", buf, 2u);
    }

    id v19 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepSummarization" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v19 startSession];
    uint64_t v20 = [[MOSummarizationManager alloc] initWithUniverse:*(void *)(*(void *)(a1 + 72) + 8)];
    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationAggregation", "", buf, 2u);
    }

    id v22 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepSummarizationAggregation" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v22 startSession];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    int8x16_t v45 = __Block_byref_object_copy__19;
    *(void *)&long long v46 = __Block_byref_object_dispose__19;
    *((void *)&v46 + 1) = 0;
    [*(id *)(a1 + 72) updateSuggestionIDAndFirstCreationDateForNewEventBundles:v5 previousEventBundles:*(void *)(a1 + 80)];
    uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_448;
    v33[3] = &unk_1002CE1B8;
    v33[4] = *(void *)(a1 + 72);
    id v34 = *(id *)(a1 + 88);
    id v24 = *(id *)(a1 + 80);
    uint64_t v25 = *(void *)(a1 + 112);
    id v35 = v24;
    uint64_t v40 = v25;
    id v26 = v22;
    id v36 = v26;
    id v37 = *(id *)(a1 + 48);
    uint64_t v41 = buf;
    id v27 = *(id *)(a1 + 96);
    char v43 = *(unsigned char *)(a1 + 128);
    uint64_t v28 = *(void *)(a1 + 120);
    id v39 = v27;
    uint64_t v42 = v28;
    id v38 = *(id *)(a1 + 40);
    [(MOSummarizationManager *)v20 aggregateEventBundles:v5 withAggregtaionDateInterval:v23 handler:v33];

    _Block_object_dispose(buf, 8);
  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_448(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 updateMetaDataForRankInEventBundles:v4];
  id v5 = [*(id *)(a1 + 32) _updateIdentifiersForEventBundles:v4 eventIDsToBundleIDMapping:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) updateSuggestionIDAndFirstCreationDateForNewEventBundles:v5 previousEventBundles:*(void *)(a1 + 48)];
  uint64_t v33 = a1;
  id v6 = [*(id *)(a1 + 32) _updateIdentifiersForEvergreenBundles:v5];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "After summarization Bundles : %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v9);
  }

  [*(id *)(v33 + 32) associateEventBundles:v7 effectiveInterval:*(void *)(*(void *)(*(void *)(v33 + 88) + 8) + 40)];
  uint64_t v14 = [*(id *)(v33 + 32) eventBundleRanking];
  id v15 = [v7 mutableCopy];
  [v14 generateBundleRanking:v15 withMinRecommendedBundleCountRequirement:0];

  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationAggregation", "", buf, 2u);
  }

  [*(id *)(v33 + 56) endSession];
  uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [*(id *)(*(void *)(*(void *)(v33 + 88) + 8) + 40) startDate];
    id v19 = [*(id *)(*(void *)(*(void *)(v33 + 88) + 8) + 40) endDate];
    id v20 = [*(id *)(v33 + 64) count];
    id v21 = [v7 count];
    *(_DWORD *)buf = 138413058;
    id v49 = v18;
    __int16 v50 = 2112;
    id v51 = v19;
    __int16 v52 = 2048;
    id v53 = v20;
    __int16 v54 = 2048;
    id v55 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "after associateEventBundles, startDate, %@, endDate, %@, events, %lu, bundles, %lu", buf, 0x2Au);
  }
  id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationRemoveEventBundles", "", buf, 2u);
  }

  uint64_t v23 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepSummarizationRemoveEventBundles" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v23 startSession];
  id v24 = [*(id *)(v33 + 32) eventBundleStore];
  v34[0] = _NSConcreteStackBlock;
  long long v25 = *(_OWORD *)(v33 + 88);
  uint64_t v26 = *(void *)(*(void *)(*(void *)(v33 + 88) + 8) + 40);
  v34[1] = 3221225472;
  v34[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_452;
  v34[3] = &unk_1002CE190;
  long long v41 = v25;
  id v27 = *(id *)(v33 + 80);
  uint64_t v28 = *(void *)(v33 + 32);
  id v35 = v23;
  uint64_t v36 = v28;
  id v40 = v27;
  id v37 = v7;
  id v29 = *(id *)(v33 + 64);
  char v43 = *(unsigned char *)(v33 + 112);
  uint64_t v30 = *(void *)(v33 + 104);
  id v38 = v29;
  uint64_t v42 = v30;
  id v39 = *(id *)(v33 + 72);
  id v31 = v7;
  uint64_t v32 = v23;
  [v24 removeEventBundlesStartedWithinInterval:v26 CompletionHandler:v34];
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_452(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) startDate];
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) endDate];
    *(_DWORD *)buf = 138413058;
    id v34 = v9;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    id v38 = v7;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "removeEventBundlesStartedWithinInterval, startDate, %@, endDate, %@, results, %@, error, %@", buf, 0x2Au);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationRemoveEventBundles", "", buf, 2u);
    }

    [*(id *)(a1 + 32) endSession];
  }
  else
  {
    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationRemoveEventBundles", "", buf, 2u);
    }

    [*(id *)(a1 + 32) endSession];
    uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationPurgeEventBundles", "", buf, 2u);
    }

    uint64_t v14 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepSummarizationPurgeEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v14 startSession];
    id v15 = [*(id *)(a1 + 40) eventBundleStore];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_456;
    v23[3] = &unk_1002CE190;
    uint64_t v30 = *(void *)(a1 + 88);
    long long v22 = *(_OWORD *)(a1 + 72);
    id v16 = (id)v22;
    long long v29 = v22;
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void **)(a1 + 48);
    id v24 = v14;
    uint64_t v25 = v17;
    id v26 = v18;
    id v19 = *(id *)(a1 + 56);
    char v32 = *(unsigned char *)(a1 + 104);
    uint64_t v20 = *(void *)(a1 + 96);
    id v27 = v19;
    uint64_t v31 = v20;
    id v28 = *(id *)(a1 + 64);
    id v21 = v14;
    [v15 purgeDeletedEventBundlesWithCompletionHandler:v23];
  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_456(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) startDate];
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) endDate];
    *(_DWORD *)buf = 138413058;
    char v32 = v9;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v7;
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "purgeDeletedEventBundlesWithCompletionHandler, startDate, %@, endDate, %@, results, %@, error, %@", buf, 0x2Au);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationPurgeEventBundles", "", buf, 2u);
    }

    [*(id *)(a1 + 32) endSession];
  }
  else
  {
    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationPurgeEventBundles", "", buf, 2u);
    }

    [*(id *)(a1 + 32) endSession];
    uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSaveEventBundles", "", buf, 2u);
    }

    uint64_t v14 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepSummarizationSaveEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v14 startSession];
    id v15 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_460;
    v20[3] = &unk_1002CE168;
    uint64_t v27 = *(void *)(a1 + 80);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 48);
    uint64_t v23 = v14;
    char v30 = *(unsigned char *)(a1 + 104);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 96);
    uint64_t v28 = *(void *)(a1 + 88);
    uint64_t v29 = v18;
    uint64_t v24 = v17;
    id v26 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 64);
    id v19 = v14;
    [v15 saveEventBundles:v16 handler:v20];
  }
}

void __96__MOEventBundleManager__bundleEvents_startDate_endDate_submitMetricsFlg_refreshVariant_handler___block_invoke_460(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) startDate];
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) endDate];
    id v11 = [*(id *)(a1 + 32) count];
    id v12 = [*(id *)(a1 + 40) count];
    int v31 = 138413570;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2048;
    id v36 = v11;
    __int16 v37 = 2048;
    id v38 = v12;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saveEventBundles, startDate, %@, endDate, %@, events, %lu, bundles, %lu, error, %@, results, %@", (uint8_t *)&v31, 0x3Eu);
  }
  uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v13))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSaveEventBundles", "", (uint8_t *)&v31, 2u);
  }

  [*(id *)(a1 + 48) endSession];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v14))
    {
      LOWORD(v31) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSubmitMetrics", "", (uint8_t *)&v31, 2u);
    }

    id v15 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepSummarizationSubmitMetrics" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v15 startSession];
    if (*(unsigned char *)(a1 + 104))
    {
      if (+[MOPlatformInfo isInternalBuild])
      {
        uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Submit internal eventBundle analytics", (uint8_t *)&v31, 2u);
        }

        uint64_t v17 = *(void **)(a1 + 56);
        uint64_t v18 = *(void *)(a1 + 40);
        id v19 = +[NSDate date];
        [v17 submitEventBundleInternalAnalytics:v18 withSubmissionDate:v19 withRefreshVariant:*(void *)(a1 + 96)];
      }
      uint64_t v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "starting biome donation.", (uint8_t *)&v31, 2u);
      }

      id v21 = [*(id *)(a1 + 56) onboardingAndSettingsPersistence];
      id v22 = [v21 getSnapshotDictionaryForAnalytics];

      uint64_t v23 = [*(id *)(a1 + 56) biomeManager];
      [v23 donateEvents:*(void *)(a1 + 32) andBundles:*(void *)(a1 + 40) andOnboardingStatus:v22];

      uint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [*(id *)(a1 + 32) count];
        id v26 = [*(id *)(a1 + 40) count];
        int v31 = 134218240;
        id v32 = v25;
        __int16 v33 = 2048;
        id v34 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "finished biome donation with %lu event candidates, and %lu bundle candidates.", (uint8_t *)&v31, 0x16u);
      }

      uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_signpost_enabled(v27))
      {
        LOWORD(v31) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepSummarizationSubmitMetrics", "", (uint8_t *)&v31, 2u);
      }

      [(MOPerformanceMeasurement *)v15 endSession];
    }
  }
  uint64_t v28 = *(void *)(a1 + 72);
  if (v28) {
    (*(void (**)(uint64_t, void, void))(v28 + 16))(v28, *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(void *)(a1 + 64));
  }
  uint64_t v29 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v29))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepSummarization", "", (uint8_t *)&v31, 2u);
  }

  char v30 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepSummarization" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v30 startSession];
}

- (void)_fetchPreviousBundlesWithDateInterval:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:v7 ascending:1 limit:0 includeDeletedBundles:1 skipRanking:1];

  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithOptions", "", buf, 2u);
  }

  uint64_t v10 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepFetchPreviousBundlesFetchWithOptions" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v10 startSession];
  id v11 = [(MOEventBundleManager *)self eventBundleStore];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke;
  v15[3] = &unk_1002CAE48;
  uint64_t v16 = v10;
  uint64_t v17 = v8;
  uint64_t v18 = self;
  id v19 = v6;
  id v12 = v8;
  id v13 = v6;
  uint64_t v14 = v10;
  [v11 fetchEventBundleWithOptions:v12 CompletionHandler:v15];
}

void __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithOptions", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  if (v6)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_9:
    v8();
    goto LABEL_10;
  }
  id v9 = [*(id *)(a1 + 40) dateInterval];
  [v9 duration];
  double v11 = v10;

  if (v11 < 604800.0)
  {
    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v5 count];
      *(_DWORD *)buf = 134217984;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "total number of previous bundle fetched, %lu", buf, 0xCu);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_9;
  }
  id v14 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F5780, &off_1002F5798, &off_1002F57B0, 0];
  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithGranularity", "", buf, 2u);
  }

  uint64_t v16 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepFetchPreviousBundlesFetchWithGranularity" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v16 startSession];
  uint64_t v17 = [*(id *)(a1 + 48) eventBundleStore];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_478;
  v22[3] = &unk_1002CE2A8;
  uint64_t v23 = v16;
  id v18 = v5;
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void **)(a1 + 56);
  id v24 = v18;
  uint64_t v25 = v19;
  id v26 = v20;
  id v21 = v16;
  [v17 fetchEventBundleWithGranularity:2 interfaceTypes:v14 CompletionHandler:v22];

LABEL_10:
}

void __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_478(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesFetchWithGranularity", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  if ([*(id *)(a1 + 40) count]) {
    [v5 addObjectsFromArray:*(void *)(a1 + 40)];
  }
  id v22 = v5;
  uint64_t v23 = a1;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v13 = [v12 action:v22];
        id v14 = [v13 actionType];

        if (v14 != (id)2)
        {
          id v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v33 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "previous summary bundle fetched, %@", buf, 0xCu);
          }

          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v9);
  }

  [v22 minusSet:v6];
  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesRemoveEventBundle", "", buf, 2u);
  }

  uint64_t v17 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepFetchPreviousBundlesRemoveEventBundle" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v17 startSession];
  id v18 = [*(id *)(v23 + 48) eventBundleStore];
  uint64_t v19 = [v6 allObjects];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_483;
  v24[3] = &unk_1002CE280;
  uint64_t v25 = v17;
  id v26 = v22;
  id v27 = *(id *)(v23 + 56);
  id v20 = v22;
  id v21 = v17;
  [v18 removeEventBundles:v19 CompletionHandler:v24];
}

void __70__MOEventBundleManager__fetchPreviousBundlesWithDateInterval_handler___block_invoke_483(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepFetchPreviousBundlesRemoveEventBundle", "", (uint8_t *)&v7, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 40) count];
    int v7 = 134217984;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "total number of previous bundle fetched (removing media, wokout and contact summary bundles), %lu", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) allObjects];
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
}

- (void)_filterPreOnboardedVisitEvents:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void *))a4;
  if (![v5 count])
  {
    v6[2](v6, &__NSArray0__struct, &__NSArray0__struct);
    goto LABEL_28;
  }
  uint64_t v25 = v6;
  int v7 = objc_opt_new();
  id v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v26 = v5;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (!v10) {
    goto LABEL_22;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v28;
  do
  {
    id v13 = 0;
    do
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
      if ([v14 category] == (id)1)
      {
        if ([v14 category] != (id)1) {
          goto LABEL_17;
        }
        id v15 = [v14 routineEvent];
        unsigned int v16 = [v15 isPreOnboardedVisit];

        uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v16)
        {
          if (v18) {
            -[MOEventBundleManager _filterPreOnboardedVisitEvents:handler:]((uint64_t)v34, (uint64_t)v14);
          }
          uint64_t v19 = v7;
          goto LABEL_16;
        }
        if (v18) {
          -[MOEventBundleManager _filterPreOnboardedVisitEvents:handler:]((uint64_t)v33, (uint64_t)v14);
        }
      }
      else
      {
        uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[MOEventBundleManager _filterPreOnboardedVisitEvents:handler:]((uint64_t)v35, (uint64_t)v14);
        }
      }
      uint64_t v19 = v8;
LABEL_16:

      [v19 addObject:v14];
LABEL_17:
      id v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    id v20 = [v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
    id v11 = v20;
  }
  while (v20);
LABEL_22:

  id v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = [v7 count];
    *(_DWORD *)buf = 134217984;
    id v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, " Found %lu pre onboarded visit events", buf, 0xCu);
  }

  uint64_t v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v5 = v26;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = [v8 count];
    *(_DWORD *)buf = 134217984;
    id v32 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, " Found %lu rest events", buf, 0xCu);
  }

  id v6 = v25;
  v25[2](v25, v7, v8);

LABEL_28:
}

- (void)_annotateEventBundlesWithStartDate:(id)a3 endDate:(id)a4 allEvents:(id)a5 eventBundles:(id)a6 handler:(id)a7
{
  id v160 = a3;
  v159 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v158 = a5;
  id v152 = a6;
  id v148 = a7;
  v147 = objc_opt_new();
  group = dispatch_group_create();
  uint64_t v342 = 0;
  v343 = &v342;
  uint64_t v344 = 0x3032000000;
  v345 = __Block_byref_object_copy__19;
  v346 = __Block_byref_object_dispose__19;
  id v347 = (id)objc_opt_new();
  uint64_t v336 = 0;
  v337 = &v336;
  uint64_t v338 = 0x3032000000;
  v339 = __Block_byref_object_copy__19;
  v340 = __Block_byref_object_dispose__19;
  id v341 = (id)objc_opt_new();
  v335[0] = _NSConcreteStackBlock;
  v335[1] = 3221225472;
  v335[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke;
  v335[3] = &unk_1002CE2D0;
  v335[4] = &v342;
  v335[5] = &v336;
  [(MOEventBundleManager *)self _filterPreOnboardedVisitEvents:v158 handler:v335];
  id v11 = +[NSArray arrayWithArray:v337[5]];
  v153 = +[NSArray arrayWithArray:v343[5]];
  uint64_t v12 = +[NSPredicate predicateWithFormat:@"startDate >= %@", v160];
  uint64_t v13 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 5];
  v156 = (void *)v12;
  v357[0] = v12;
  v357[1] = v13;
  v146 = (void *)v13;
  id v14 = +[NSArray arrayWithObjects:v357 count:2];
  id v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];
  unsigned int v16 = [v11 filteredArrayUsingPredicate:v15];

  id v17 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v356 = v17;
  BOOL v18 = +[NSArray arrayWithObjects:&v356 count:1];
  v162 = [v16 sortedArrayUsingDescriptors:v18];
  v145 = v17;

  uint64_t v19 = +[NSPredicate predicateWithFormat:@"provider != %lu", 5];
  +[NSPredicate predicateWithFormat:@"endDate >= %@", v160];
  v155 = v154 = (void *)v19;
  v355[0] = v155;
  v355[1] = v19;
  id v20 = +[NSArray arrayWithObjects:v355 count:2];
  id v21 = +[NSCompoundPredicate andPredicateWithSubpredicates:v20];
  id v22 = [v11 filteredArrayUsingPredicate:v21];

  v157 = [v22 filteredArrayUsingPredicate:v156];

  uint64_t v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = (uint64_t (*)(uint64_t, uint64_t))[v157 count];
    id v25 = [v162 count];
    id v26 = [v22 count];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v160;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v159;
    *(_WORD *)&buf[22] = 2048;
    v353 = v24;
    *(_WORD *)v354 = 2048;
    *(void *)&v354[2] = v25;
    *(_WORD *)&v354[10] = 2048;
    *(void *)&v354[12] = v26;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "annotateEventBundles startDate, %@, endDate, %@, event count, %lu, pattern event count, %lu, eventsForTimeAtHomeManager count, %lu", buf, 0x34u);
  }

  long long v333 = 0u;
  long long v334 = 0u;
  long long v331 = 0u;
  long long v332 = 0u;
  id obj = v22;
  id v27 = [obj countByEnumeratingWithState:&v331 objects:v351 count:16];
  uint64_t v28 = 0;
  if (v27)
  {
    uint64_t v29 = *(void *)v332;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v332 != v29) {
          objc_enumerationMutation(obj);
        }
        long long v31 = *(void **)(*((void *)&v331 + 1) + 8 * i);
        if ([v31 category] == (id)1 && objc_msgSend(v31, "placeUserType") == (id)1)
        {
          id v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            id v33 = (id)objc_claimAutoreleasedReturnValue();
            id v34 = [v31 startDate];
            __int16 v35 = [v31 endDate];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v33;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2112;
            v353 = v34;
            *(_WORD *)v354 = 2112;
            *(void *)&v354[2] = v35;
            _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%@,TAH home visit idx, %lu, startDate, %@, endDate, %@", buf, 0x2Au);
          }
          ++v28;
        }
      }
      id v27 = [obj countByEnumeratingWithState:&v331 objects:v351 count:16];
    }
    while (v27);
  }

  v350[0] = v155;
  v350[1] = v154;
  id v36 = +[NSArray arrayWithObjects:v350 count:2];
  __int16 v37 = +[NSCompoundPredicate andPredicateWithSubpredicates:v36];
  id v38 = [v158 filteredArrayUsingPredicate:v37];

  long long v329 = 0u;
  long long v330 = 0u;
  long long v327 = 0u;
  long long v328 = 0u;
  id v39 = v38;
  id v40 = [v39 countByEnumeratingWithState:&v327 objects:v349 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v328;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v328 != v41) {
          objc_enumerationMutation(v39);
        }
        char v43 = *(void **)(*((void *)&v327 + 1) + 8 * (void)j);
        if ([v43 category] == (id)1 && objc_msgSend(v43, "placeUserType") == (id)1)
        {
          long long v44 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            id v45 = (id)objc_claimAutoreleasedReturnValue();
            long long v46 = [v43 startDate];
            long long v47 = [v43 endDate];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v45;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2112;
            v353 = v46;
            *(_WORD *)v354 = 2112;
            *(void *)&v354[2] = v47;
            _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%@, PAH home visit idx, %lu, startDate, %@, endDate, %@", buf, 0x2Au);
          }
        }
      }
      id v40 = [v39 countByEnumeratingWithState:&v327 objects:v349 count:16];
    }
    while (v40);
  }

  id v48 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v348 = v48;
  id v49 = +[NSArray arrayWithObjects:&v348 count:1];
  aSelectora = [v157 sortedArrayUsingDescriptors:v49];
  v144 = v48;

  fUniverse = self->fUniverse;
  id v51 = (objc_class *)objc_opt_class();
  __int16 v52 = NSStringFromClass(v51);
  v161 = [(MODaemonUniverse *)fUniverse getService:v52];

  [v161 processTimeZoneEvents:aSelectora];
  id v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    id v54 = [aSelectora count];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v161;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v160;
    *(_WORD *)&buf[22] = 2112;
    v353 = v159;
    *(_WORD *)v354 = 2048;
    *(void *)&v354[2] = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "timeZoneManager, %@, startDate, %@, endDate, %@, events, %lu", buf, 0x2Au);
  }

  id v55 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v55))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPreOnboardedVisit", "", buf, 2u);
  }

  uint64_t v56 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesPreOnboardedVisit" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v56 startSession];
  dispatch_group_enter(group);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v353 = __Block_byref_object_copy__19;
  *(void *)v354 = __Block_byref_object_dispose__19;
  *(void *)&v354[8] = 0;
  uint64_t v57 = [[MOPreOnboardedVisitAnnotationManager alloc] initWithUniverse:self->fUniverse];
  char v58 = objc_opt_new();
  v323[0] = _NSConcreteStackBlock;
  v323[1] = 3221225472;
  v323[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_506;
  v323[3] = &unk_1002CA350;
  v326 = buf;
  long long v59 = group;
  v324 = v59;
  long long v60 = v56;
  v325 = v60;
  [(MOTimeContextAnnotationManager *)v57 performAnnotationWithEvents:v153 withPatternEvents:v58 handler:v323];
  long long v61 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v143 = v60;
  dispatch_group_t groupa = &v57->super.super.super;
  if (os_signpost_enabled(v61))
  {
    *(_WORD *)v317 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesVisit", "", v317, 2u);
  }

  long long v62 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesVisit" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v62 startSession];
  dispatch_group_enter(v59);
  *(void *)v317 = 0;
  v318 = v317;
  uint64_t v319 = 0x3032000000;
  v320 = __Block_byref_object_copy__19;
  v321 = __Block_byref_object_dispose__19;
  id v322 = 0;
  v63 = [[MOVisitAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v313[0] = _NSConcreteStackBlock;
  v313[1] = 3221225472;
  v313[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_511;
  v313[3] = &unk_1002CA350;
  v316 = v317;
  id v64 = v59;
  v314 = v64;
  __int16 v65 = v62;
  v315 = v65;
  [(MOTimeContextAnnotationManager *)v63 performAnnotationWithEvents:aSelectora withPatternEvents:v162 handler:v313];
  id v66 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v141 = v65;
  v142 = v63;
  if (os_signpost_enabled(v66))
  {
    *(_WORD *)v307 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrips", "", v307, 2u);
  }

  __int16 v67 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesTrips" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v67 startSession];
  dispatch_group_enter(v64);
  *(void *)v307 = 0;
  v308 = v307;
  uint64_t v309 = 0x3032000000;
  v310 = __Block_byref_object_copy__19;
  v311 = __Block_byref_object_dispose__19;
  id v312 = 0;
  id v68 = [[MOTripAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v303[0] = _NSConcreteStackBlock;
  v303[1] = 3221225472;
  v303[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_516;
  v303[3] = &unk_1002CA350;
  v306 = v307;
  __int16 v69 = v64;
  v304 = v69;
  __int16 v70 = v67;
  v305 = v70;
  [(MOTripAnnotationManager *)v68 performAnnotationWithEvents:aSelectora withPatternEvents:v162 eventBundles:v152 handler:v303];
  uint64_t v71 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v139 = v70;
  v140 = v68;
  if (os_signpost_enabled(v71))
  {
    *(_WORD *)v297 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v71, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesWorkout", "", v297, 2u);
  }

  uint64_t v72 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesWorkout" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v72 startSession];
  dispatch_group_enter(v69);
  *(void *)v297 = 0;
  v298 = v297;
  uint64_t v299 = 0x3032000000;
  v300 = __Block_byref_object_copy__19;
  v301 = __Block_byref_object_dispose__19;
  id v302 = 0;
  int8x16_t v73 = [[MOWorkoutAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v293[0] = _NSConcreteStackBlock;
  v293[1] = 3221225472;
  v293[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_521;
  v293[3] = &unk_1002CA350;
  v296 = v297;
  uint64_t v74 = v69;
  v294 = v74;
  id v75 = v72;
  v295 = v75;
  [(MOTimeContextAnnotationManager *)v73 performAnnotationWithEvents:aSelectora withPatternEvents:v162 handler:v293];
  id v76 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v137 = v75;
  v138 = v73;
  if (os_signpost_enabled(v76))
  {
    *(_WORD *)v287 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesState of Mind", "", v287, 2u);
  }

  double v77 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesMood" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v77 startSession];
  dispatch_group_enter(v74);
  *(void *)v287 = 0;
  v288 = v287;
  uint64_t v289 = 0x3032000000;
  v290 = __Block_byref_object_copy__19;
  v291 = __Block_byref_object_dispose__19;
  id v292 = 0;
  id v78 = [[MOStateOfMindAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v283[0] = _NSConcreteStackBlock;
  v283[1] = 3221225472;
  v283[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_526;
  v283[3] = &unk_1002CA350;
  v286 = v287;
  uint64_t v79 = v74;
  v284 = v79;
  v135 = v77;
  v285 = v135;
  [(MOTimeContextAnnotationManager *)v78 performAnnotationWithEvents:aSelectora withPatternEvents:v162 handler:v283];
  id v80 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v136 = v78;
  if (os_signpost_enabled(v80))
  {
    *(_WORD *)v277 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSignificantContact", "", v277, 2u);
  }

  BOOL v81 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesSignificantContact" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v81 startSession];
  dispatch_group_enter(v79);
  *(void *)v277 = 0;
  v278 = v277;
  uint64_t v279 = 0x3032000000;
  v280 = __Block_byref_object_copy__19;
  v281 = __Block_byref_object_dispose__19;
  id v282 = 0;
  id v82 = [[MOConversationAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v273[0] = _NSConcreteStackBlock;
  v273[1] = 3221225472;
  v273[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_531;
  v273[3] = &unk_1002CA350;
  v276 = v277;
  double v83 = v79;
  v274 = v83;
  v133 = v81;
  v275 = v133;
  [(MOConversationAnnotationManager *)v82 performAnnotationWithEvents:aSelectora withPatternEvents:v162 handler:v273];
  v134 = v82;
  __int16 v84 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v84))
  {
    *(_WORD *)v267 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v84, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesMedia", "", v267, 2u);
  }

  id v85 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesMedia" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v85 startSession];
  dispatch_group_enter(v83);
  *(void *)v267 = 0;
  v268 = v267;
  uint64_t v269 = 0x3032000000;
  v270 = __Block_byref_object_copy__19;
  v271 = __Block_byref_object_dispose__19;
  id v272 = 0;
  int8x16_t v86 = [[MOMediaPlayAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v263[0] = _NSConcreteStackBlock;
  v263[1] = 3221225472;
  v263[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_536;
  v263[3] = &unk_1002CA350;
  v266 = v267;
  uint64_t v87 = v83;
  v264 = v87;
  v131 = v85;
  v265 = v131;
  [(MOMediaPlayAnnotationManager *)v86 performAnnotationWithEvents:aSelectora withPatternEvents:v162 handler:v263];
  v132 = v86;
  id v88 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v88))
  {
    *(_WORD *)v257 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrends", "", v257, 2u);
  }

  id v89 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesTrends" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v89 startSession];
  dispatch_group_enter(v87);
  *(void *)v257 = 0;
  v258 = v257;
  uint64_t v259 = 0x3032000000;
  v260 = __Block_byref_object_copy__19;
  v261 = __Block_byref_object_dispose__19;
  id v262 = 0;
  v90 = [[MOTrendAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v253[0] = _NSConcreteStackBlock;
  v253[1] = 3221225472;
  v253[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_541;
  v253[3] = &unk_1002CA350;
  v256 = v257;
  v91 = v87;
  v254 = v91;
  __int16 v129 = v89;
  v255 = v129;
  [(MOTrendAnnotationManager *)v90 performAnnotationWithEvents:aSelectora withPatternEvents:v162 handler:v253];
  v130 = v90;
  id v92 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v92))
  {
    *(_WORD *)v247 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTimeHome", "", v247, 2u);
  }

  uint64_t v93 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesTimeHome" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v93 startSession];
  dispatch_group_enter(v91);
  *(void *)v247 = 0;
  v248 = v247;
  uint64_t v249 = 0x3032000000;
  v250 = __Block_byref_object_copy__19;
  v251 = __Block_byref_object_dispose__19;
  id v252 = 0;
  v245[0] = 0;
  v245[1] = v245;
  v245[2] = 0x2020000000;
  char v246 = 0;
  BOOL v94 = [[MOTimeAtHomeAnomalyManager alloc] initWithUniverse:self->fUniverse];
  v240[0] = _NSConcreteStackBlock;
  v240[1] = 3221225472;
  v240[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_546;
  v240[3] = &unk_1002CE2F8;
  v243 = v247;
  v244 = v245;
  v95 = v91;
  v241 = v95;
  __int16 v127 = v93;
  v242 = v127;
  [(MOTimeAtHomeAnomalyManager *)v94 performAnnotationWithEvents:obj withPatternEvents:v162 withBundleWindowStart:v160 withBundleWindowEnd:v159 handler:v240];
  v128 = v94;
  long long v96 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v96))
  {
    *(_WORD *)v234 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v96, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoHome", "", v234, 2u);
  }

  long long v97 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesPhotoHome" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v97 startSession];
  dispatch_group_enter(v95);
  *(void *)v234 = 0;
  v235 = v234;
  uint64_t v236 = 0x3032000000;
  v237 = __Block_byref_object_copy__19;
  v238 = __Block_byref_object_dispose__19;
  id v239 = 0;
  long long v98 = [[MOPhotosAtHomeManager alloc] initWithUniverse:self->fUniverse];
  v230[0] = _NSConcreteStackBlock;
  v230[1] = 3221225472;
  v230[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_551;
  v230[3] = &unk_1002CA350;
  v233 = v234;
  long long v99 = v95;
  v231 = v99;
  __int16 v125 = v97;
  v232 = v125;
  [(MOPhotosAtHomeManager *)v98 performAnnotationWithEvents:v39 withPatternEvents:v162 withBundleWindowStart:v160 withBundleWindowEnd:v159 handler:v230];
  v126 = v98;
  id v100 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v100))
  {
    *(_WORD *)v224 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v100, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesHostingHome", "", v224, 2u);
  }

  id v101 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesHostingHome" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v101 startSession];
  dispatch_group_enter(v99);
  *(void *)v224 = 0;
  v225 = v224;
  uint64_t v226 = 0x3032000000;
  v227 = __Block_byref_object_copy__19;
  v228 = __Block_byref_object_dispose__19;
  id v229 = 0;
  v222[0] = 0;
  v222[1] = v222;
  v222[2] = 0x2020000000;
  char v223 = 0;
  v102 = [[MOHostingAtHomeManager alloc] initWithUniverse:self->fUniverse];
  v217[0] = _NSConcreteStackBlock;
  v217[1] = 3221225472;
  v217[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_556;
  v217[3] = &unk_1002CE2F8;
  v220 = v224;
  v221 = v222;
  v103 = v99;
  v218 = v103;
  v124 = v101;
  v219 = v124;
  [(MOHostingAtHomeManager *)v102 performAnnotationWithEvents:obj withPatternEvents:v162 withBundleWindowStart:v160 withBundleWindowEnd:v159 handler:v217];
  id v104 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v104))
  {
    *(_WORD *)v211 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v104, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSharedContent", "", v211, 2u);
  }

  id v105 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesSharedContent" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v105 startSession];
  dispatch_group_enter(v103);
  *(void *)v211 = 0;
  v212 = v211;
  uint64_t v213 = 0x3032000000;
  v214 = __Block_byref_object_copy__19;
  v215 = __Block_byref_object_dispose__19;
  id v216 = 0;
  v106 = [[MOSharedContentAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v207[0] = _NSConcreteStackBlock;
  v207[1] = 3221225472;
  v207[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_561;
  v207[3] = &unk_1002CA350;
  v210 = v211;
  id v107 = v103;
  v208 = v107;
  __int16 v123 = v105;
  v209 = v123;
  [(MOSharedContentAnnotationManager *)v106 performAnnotationWithEvents:aSelectora handler:v207];
  id v108 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v108))
  {
    *(_WORD *)v201 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v108, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoMemory", "", v201, 2u);
  }

  id v109 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesPhotoMemory" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v109 startSession];
  dispatch_group_enter(v107);
  *(void *)v201 = 0;
  v202 = v201;
  uint64_t v203 = 0x3032000000;
  v204 = __Block_byref_object_copy__19;
  v205 = __Block_byref_object_dispose__19;
  id v206 = 0;
  id v110 = [[MOPhotoMemoryAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v197[0] = _NSConcreteStackBlock;
  v197[1] = 3221225472;
  v197[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_566;
  v197[3] = &unk_1002CA350;
  v200 = v201;
  id v111 = v107;
  v198 = v111;
  id v112 = v109;
  v199 = v112;
  [(MOPhotoMemoryAnnotationManager *)v110 performAnnotationWithEvents:aSelectora handler:v197];
  id v113 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  __int16 v121 = v112;
  id v122 = v110;
  if (os_signpost_enabled(v113))
  {
    *(_WORD *)v191 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v113, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesEvergreen", "", v191, 2u);
  }

  id v114 = [[MOPerformanceMeasurement alloc] initWithName:@"BundleEventsDeepAnnotateEventBundlesEvergreen" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v114 startSession];
  v115 = v102;
  dispatch_group_enter(v111);
  id v116 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v160 endDate:v159];
  *(void *)v191 = 0;
  v192 = v191;
  uint64_t v193 = 0x3032000000;
  v194 = __Block_byref_object_copy__19;
  v195 = __Block_byref_object_dispose__19;
  id v196 = 0;
  long long v117 = [[MOEvergreenAnnotationManager alloc] initWithUniverse:self->fUniverse];
  v187[0] = _NSConcreteStackBlock;
  v187[1] = 3221225472;
  v187[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_571;
  v187[3] = &unk_1002CA350;
  v190 = v191;
  double v118 = v111;
  v188 = v118;
  __int16 v119 = v114;
  v189 = v119;
  [(MOEvergreenAnnotationManager *)v117 performAnnotationWithEvents:aSelectora withPatternEvents:v162 dateInterval:v116 handler:v187];
  id v120 = [(MOEventBundleManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_573;
  block[3] = &unk_1002CE320;
  v171 = buf;
  v172 = v317;
  v173 = v307;
  v174 = v297;
  v175 = v287;
  v176 = v277;
  v177 = v267;
  v178 = v257;
  v179 = v247;
  v180 = v234;
  v181 = v224;
  v182 = v211;
  v183 = v201;
  v184 = v191;
  v185 = v222;
  v186 = v245;
  id v169 = v147;
  id v170 = v148;
  id v164 = v148;
  id v149 = v147;
  dispatch_group_notify(v118, v120, block);

  _Block_object_dispose(v191, 8);
  _Block_object_dispose(v201, 8);

  _Block_object_dispose(v211, 8);
  _Block_object_dispose(v222, 8);
  _Block_object_dispose(v224, 8);

  _Block_object_dispose(v234, 8);
  _Block_object_dispose(v245, 8);
  _Block_object_dispose(v247, 8);

  _Block_object_dispose(v257, 8);
  _Block_object_dispose(v267, 8);

  _Block_object_dispose(v277, 8);
  _Block_object_dispose(v287, 8);

  _Block_object_dispose(v297, 8);
  _Block_object_dispose(v307, 8);

  _Block_object_dispose(v317, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v336, 8);
  _Block_object_dispose(&v342, 8);
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      id v11 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, " Found %lu pre onboarded visit events", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:v5];
  }
  if ([v6 count])
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v6 count];
      int v10 = 134217984;
      id v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " Found %lu rest events", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v6];
  }
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_506(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "preOnboardedVisit manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  unsigned int v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "preOnboardedVisit manager event bundle, %@", buf, 0xCu);
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPreOnboardedVisit", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_511(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "visit manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  unsigned int v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "visit manager event bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesVisit", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_516(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "trip manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  unsigned int v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "trip manager event bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrips", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_521(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "workout manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  unsigned int v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "workout manager event bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesWorkout", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_526(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "state of mind manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  unsigned int v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "state of mind manager event bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesMood", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_531(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "conversation bundle count, %lu, error, %@", buf, 0x16u);
  }
  unsigned int v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "conversation event bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSignificantContact", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_536(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "media bundle count, %lu, error, %@", buf, 0x16u);
  }
  unsigned int v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "media event bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesMedia", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_541(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    id v11 = [v6 count];
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "trend bundle count, %lu, error, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTrends", "", (uint8_t *)&v10, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_546(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v33 = [v4 count];
    __int16 v34 = 2112;
    id v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "::: time at home manager event bundles, %lu, error, %@", buf, 0x16u);
  }

  id v26 = objc_opt_new();
  id v7 = [(id)objc_opt_new() initWithTimeIntervalSinceReferenceDate:0.0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  id v24 = v5;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "time at home event bundle, %@", buf, 0xCu);
        }

        if (objc_msgSend(v13, "bundleSubType", v24) == (id)504)
        {
          id v15 = [v13 startDate];
          unsigned int v16 = [v15 isOnOrAfter:v7];

          if (v16)
          {
            uint64_t v17 = [v13 startDate];

            id v7 = (id)v17;
          }
        }
        else
        {
          [v26 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  uint64_t v18 = +[NSArray arrayWithArray:v26];
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  long long v21 = +[NSDate date];
  [v7 timeIntervalSinceDate:v21];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = fabs(v22) <= 172800.0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v23 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesTimeHome", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_551(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v36 = [v4 count];
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "::: photos at home manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  uint64_t v23 = v5;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "::: Event Bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v7;
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        long long v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "time at home event bundle, %@", buf, 0xCu);
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  long long v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoHome", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_556(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v33 = [v4 count];
    __int16 v34 = 2112;
    id v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "::: hosting at home manager event bundles, %lu, error, %@", buf, 0x16u);
  }

  id v7 = objc_opt_new();
  id v8 = [(id)objc_opt_new() initWithTimeIntervalSinceReferenceDate:0.0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  long long v25 = v5;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
        id v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v14;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "::: Event Bundle, %@", buf, 0xCu);
        }

        if (objc_msgSend(v14, "bundleSubType", v25) == (id)504)
        {
          id v16 = [v14 startDate];
          unsigned int v17 = [v16 isOnOrAfter:v8];

          if (v17)
          {
            uint64_t v18 = [v14 startDate];

            id v8 = (id)v18;
          }
        }
        else
        {
          [v7 addObject:v14];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  uint64_t v19 = +[NSArray arrayWithArray:v7];
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  double v22 = +[NSDate date];
  [v8 timeIntervalSinceDate:v22];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = fabs(v23) <= 172800.0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesHostingHome", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_561(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "shared content annotation manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  id v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "shared content bundle, %@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesSharedContent", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_566(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v4 count];
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "photo memory annotation manager event bundles, %lu, error, %@", buf, 0x16u);
  }
  id v16 = v5;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "photo memory bundle, %@", buf, 0xCu);
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesPhotoMemory", "", buf, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

void __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_571(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    id v11 = [v6 count];
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "evergreen annotation manager event bundles, %lu, error, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerBundleEventsDeepAnnotateEventBundlesEvergreen", "", (uint8_t *)&v10, 2u);
  }

  [*(id *)(a1 + 40) endSession];
}

uint64_t __98__MOEventBundleManager__annotateEventBundlesWithStartDate_endDate_allEvents_eventBundles_handler___block_invoke_573(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) count])
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 160) + 8) + 24)
      || *(unsigned char *)(*(void *)(*(void *)(a1 + 168) + 8) + 24))
    {
      +[MOEvergreenAnnotationManager replacePromptIndicesOfEvergreen:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) isTah:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) == 0];
    }
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v25 objects:v57 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v6);
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "annotateEventBundles, event bundle, %@", buf, 0xCu);
        }

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v25 objects:v57 count:16];
    }
    while (v4);
  }

  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    id v23 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    id v22 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
    id v21 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
    id v20 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    id v19 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count];
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) count];
    id v11 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) count];
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) count];
    id v13 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) count];
    id v14 = [*(id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40) count];
    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) count];
    id v16 = [*(id *)(*(void *)(*(void *)(a1 + 152) + 8) + 40) count];
    id v17 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134221312;
    id v30 = v24;
    __int16 v31 = 2048;
    id v32 = v23;
    __int16 v33 = 2048;
    id v34 = v22;
    __int16 v35 = 2048;
    id v36 = v21;
    __int16 v37 = 2048;
    id v38 = v20;
    __int16 v39 = 2048;
    id v40 = v19;
    __int16 v41 = 2048;
    id v42 = v10;
    __int16 v43 = 2048;
    id v44 = v11;
    __int16 v45 = 2048;
    id v46 = v12;
    __int16 v47 = 2048;
    id v48 = v13;
    __int16 v49 = 2048;
    id v50 = v14;
    __int16 v51 = 2048;
    id v52 = v15;
    __int16 v53 = 2048;
    id v54 = v16;
    __int16 v55 = 2048;
    id v56 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "annotateEventBundles summary: preOnboardedVisit, %lu, visit, %lu, trip, %lu, workout, %lu, conversation, %lu, media, %lu, trend, %lu, home, %lu, pah, %lu, hah, %lu, shared content, %lu, photo memory, %lu, evergreen, %lu, total, %lu", buf, 0x8Eu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateMetaDataForRankInEventBundles:(id)a3
{
  id v3 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v28;
    *(void *)&long long v5 = 138412290;
    long long v26 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = [v9 metaDataForRank:v26];
        if (!v10) {
          goto LABEL_10;
        }
        id v11 = (void *)v10;
        id v12 = [v9 metaDataForRank];
        id v13 = [v12 objectForKey:@"LabelConfidence"];

        if (v13)
        {
          id v14 = [v9 metaDataForRank];
          id v15 = [v14 objectForKey:@"LabelConfidence"];
          [v15 doubleValue];
          double v17 = v16;

          long long v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            double v32 = v17;
            __int16 v33 = 2112;
            id v34 = v9;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "label confidence, label confidence, %f, event bundle, %@", buf, 0x16u);
          }
        }
        else
        {
LABEL_10:
          long long v18 = objc_opt_new();
          +[MOContextAnnotationUtilities labelConfidenceForEventBundle:v9];
          double v20 = v19;
          id v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            double v32 = v20;
            __int16 v33 = 2112;
            id v34 = v9;
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "label confidence, label confidence (update), %f, event bundle, %@", buf, 0x16u);
          }

          if (v20 > 0.0)
          {
            id v22 = +[NSNumber numberWithDouble:v20];
            [v18 setObject:v22 forKey:@"LabelConfidence"];

            id v23 = [v9 metaDataForRank];

            if (v23)
            {
              id v24 = [v9 metaDataForRank];
              [v18 addEntriesFromDictionary:v24];
            }
            [v9 setMetaDataForRank:v18];
          }
        }

        long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          double v32 = *(double *)&v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "annotateEventBundles, event bundle, %@", buf, 0xCu);
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v6);
  }
}

- (id)_concatenatedEventIdentifierForBundle:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 events];
  id v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v4 interfaceType]);
    [v7 addObject:v8];

    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v4 summarizationGranularity]);
    [v7 addObject:v9];

    if ([v4 interfaceType] == (id)7)
    {
      uint64_t v10 = [v4 action];
      id v11 = [v10 actionSubtype];

      if (v11 == (id)8)
      {
        id v12 = [v4 startDate];
        [v12 timeIntervalSinceReferenceDate];
        id v14 = +[NSString stringWithFormat:@"%f", v13];
        [v7 addObject:v14];
      }
    }
    id v15 = [v4 events];
    double v16 = +[NSSortDescriptor sortDescriptorWithKey:@"eventIdentifier" ascending:1];
    id v42 = v16;
    double v17 = +[NSArray arrayWithObjects:&v42 count:1];
    long long v18 = [v15 sortedArrayUsingDescriptors:v17];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = [*(id *)(*((void *)&v31 + 1) + 8 * i) eventIdentifier];
          long long v25 = [v24 UUIDString];
          [v7 addObject:v25];
        }
        id v21 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v21);
    }

    long long v26 = [v7 componentsJoinedByString:@":"];
    long long v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      long long v29 = NSStringFromSelector(a2);
      long long v30 = [v4 bundleIdentifier];
      *(_DWORD *)buf = 138412802;
      id v36 = v29;
      __int16 v37 = 2112;
      id v38 = v30;
      __int16 v39 = 2112;
      id v40 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@, bundleID, %@, concatenated eventID, %@", buf, 0x20u);
    }
  }
  else
  {
    long long v26 = 0;
  }

  return v26;
}

- (id)_updateIdentifiersForEventBundles:(id)a3 eventIDsToBundleIDMapping:(id)a4
{
  id v5 = a3;
  id v24 = a4;
  id v6 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    uint64_t v10 = &MOLogFacilityEventBundleManager;
    do
    {
      id v11 = 0;
      id v28 = v8;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v11);
        if (objc_msgSend(v12, "interfaceType", v24) == (id)11)
        {
          uint64_t v13 = 0;
        }
        else
        {
          id v14 = [(MOEventBundleManager *)self _concatenatedEventIdentifierForBundle:v12];
          if (v14)
          {
            uint64_t v13 = [v24 objectForKey:v14];
          }
          else
          {
            uint64_t v13 = 0;
          }
        }
        id v15 = _mo_log_facility_get_os_log(v10);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          double v16 = v6;
          double v17 = v10;
          NSStringFromSelector(a2);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v13) {
            CFStringRef v19 = @"YES";
          }
          else {
            CFStringRef v19 = @"NO";
          }
          id v20 = [v12 bundleIdentifier];
          id v21 = v13;
          if (!v13)
          {
            long long v25 = [v12 bundleIdentifier];
            id v21 = v25;
          }
          *(_DWORD *)buf = 138413058;
          id v35 = v18;
          __int16 v36 = 2112;
          CFStringRef v37 = v19;
          __int16 v38 = 2112;
          __int16 v39 = v20;
          __int16 v40 = 2112;
          __int16 v41 = v21;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@, update bundleID, %@, bundleID, %@, updated bundleID, %@", buf, 0x2Au);
          if (!v13) {

          }
          uint64_t v10 = v17;
          id v6 = v16;
          id v8 = v28;
        }

        if (v13)
        {
          uint64_t v22 = [[MOEventBundle alloc] initWithBundleIdentifier:v13 usingBundle:v12];
          [v6 addObject:v22];
        }
        else
        {
          [v6 addObject:v12];
        }

        id v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)_updateIdentifiersForEvergreenBundles:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    id v8 = &MOLogFacilityEventBundleManager;
    do
    {
      uint64_t v9 = 0;
      id v24 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
        if ([v10 interfaceType] == (id)11)
        {
          id v11 = [v10 suggestionID];
        }
        else
        {
          id v11 = 0;
        }
        id v12 = _mo_log_facility_get_os_log(v8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = v7;
          id v14 = v4;
          id v15 = v8;
          NSStringFromSelector(a2);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v11) {
            CFStringRef v17 = @"YES";
          }
          else {
            CFStringRef v17 = @"NO";
          }
          id v18 = [v10 bundleIdentifier];
          CFStringRef v19 = v11;
          if (!v11)
          {
            uint64_t v22 = [v10 bundleIdentifier];
            CFStringRef v19 = v22;
          }
          *(_DWORD *)buf = 138413058;
          id v31 = v16;
          __int16 v32 = 2112;
          CFStringRef v33 = v17;
          __int16 v34 = 2112;
          id v35 = v18;
          __int16 v36 = 2112;
          CFStringRef v37 = v19;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@, update bundleID for Evergreen bundle, %@, bundleID, %@, updated bundleID, %@", buf, 0x2Au);
          if (!v11) {

          }
          id v8 = v15;
          id v4 = v14;
          uint64_t v7 = v13;
          id v6 = v24;
        }

        if (v11)
        {
          id v20 = [[MOEventBundle alloc] initWithBundleIdentifier:v11 usingBundle:v10];
          [v4 addObject:v20];
        }
        else
        {
          [v4 addObject:v10];
        }

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_collectTimeCorrelatedEventsWithStartDate:(id)a3 endDate:(id)a4 events:(id)a5 submitMetricsFlg:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = (__CFString *)a4;
  id v15 = a5;
  id v16 = (void (**)(id, void, void *))a7;
  CFStringRef v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = NSStringFromSelector(a2);
    CFStringRef v19 = (void *)v18;
    CFStringRef v20 = @"NO";
    if (v8) {
      CFStringRef v20 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v41 = v18;
    __int16 v42 = 2112;
    CFStringRef v43 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@, submitMetricsFlg, %@", buf, 0x16u);
  }
  id v21 = objc_opt_new();
  if (v8)
  {
    uint64_t v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v41 = (uint64_t)v13;
      __int16 v42 = 2112;
      CFStringRef v43 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "initiate bundler with startDate: %@, endDate:  %@", buf, 0x16u);
    }

    id v23 = [[MOEventBundler alloc] initWithStartDate:v13 endDate:v14];
    id v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "bundle events", buf, 2u);
    }

    __int16 v39 = v23;
    long long v25 = [(MOEventBundler *)v23 calculateEventBundlesFromEvents:v15];
    long long v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [v25 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v41 = (uint64_t)v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "there are %lu event bundles.", buf, 0xCu);
    }

    BOOL enableSemanticPruning = self->_enableSemanticPruning;
    long long v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if (enableSemanticPruning)
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "prune events based on semantic filter", buf, 2u);
      }

      id v31 = [(MOEventBundler *)v39 pruneEventBundles:v25];
      long long v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v32 = [v31 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v41 = (uint64_t)v32;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "there are %lu pruned event bundles.", buf, 0xCu);
      }
    }
    else
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "did not prune events based on semantic filter since it's disabled", buf, 2u);
      }
      id v31 = 0;
    }

    CFStringRef v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v41 = (uint64_t)v13;
      __int16 v42 = 2112;
      CFStringRef v43 = v14;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "initiate metrics with startDate: %@, endDate:  %@", buf, 0x16u);
    }

    __int16 v34 = [[MOPromptMetrics alloc] initWithStartDate:v13 endDate:v14 EventManager:self->_eventManager];
    id v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "calculate metrics for raw events", buf, 2u);
    }

    [(MOPromptMetrics *)v34 calculateAndSetMetricsForRawEvents:v15];
    __int16 v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "calculate metrics on pre-bundles", buf, 2u);
    }

    [(MOPromptMetrics *)v34 calculateAndSetMetricsForCorrelatedEvents:v25];
    if (self->_enableSemanticPruning)
    {
      CFStringRef v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "calculate metrics on semantically pruned bundles", buf, 2u);
      }

      [(MOPromptMetrics *)v34 calculateAndSetMetricsForSemanticallyBundledEvents:v31];
    }
    __int16 v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "submit metrics", buf, 2u);
    }

    [(MOEventBundleManager *)self submitMetricForEventBundleWithPromptMetrics:v34];
    if (v16) {
      v16[2](v16, 0, v21);
    }
  }
  else if (v16)
  {
    v16[2](v16, 0, v21);
  }
}

- (void)updateSuggestionIDAndFirstCreationDateForNewEventBundles:(id)a3 previousEventBundles:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(MOEventBundleManager *)self partitionedEventBundles:a4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v27;
    *(void *)&long long v9 = 138413058;
    long long v23 = v9;
    id v24 = self;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = -[MOEventBundleManager matchedEventBundleForEventBundle:otherEventBundles:](self, "matchedEventBundleForEventBundle:otherEventBundles:", v13, v7, v23);
        id v15 = v14;
        if (v14)
        {
          id v16 = [v14 suggestionID];
          if (!v16)
          {
            id v16 = [v15 bundleIdentifier];
          }
          [v13 setSuggestionID:v16];
          CFStringRef v17 = [v15 firstCreationDate];
          if (v17) {
            [v15 firstCreationDate];
          }
          else {
          CFStringRef v19 = [v15 creationDate];
          }
          [v13 setFirstCreationDate:v19];

          CFStringRef v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v21 = [v13 suggestionID];
            uint64_t v22 = [v13 firstCreationDate];
            *(_DWORD *)buf = v23;
            id v31 = v21;
            __int16 v32 = 2112;
            CFStringRef v33 = v22;
            __int16 v34 = 2112;
            id v35 = v15;
            __int16 v36 = 2112;
            CFStringRef v37 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Suggestion ID matched, suggestion ID, %@, first creation date, %@, prev, %@, new, %@", buf, 0x2Au);

            self = v24;
          }
        }
        else
        {
          uint64_t v18 = [v13 bundleIdentifier];
          [v13 setSuggestionID:v18];

          self = v24;
          id v16 = [v13 creationDate];
          [v13 setFirstCreationDate:v16];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v10);
  }
}

- (void)associateEventBundles:(id)a3 effectiveInterval:(id)a4
{
  id v80 = a4;
  id v6 = [a3 mutableCopy];
  id v82 = self;
  uint64_t v7 = [(MOEventBundleManager *)self eventBundleRanking];
  [v7 generateBundleRanking:v6 withMinRecommendedBundleCountRequirement:0];

  id v78 = v6;
  id v8 = +[NSArray arrayWithArray:v6];
  long long v9 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v94 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Raw input bundle count for trip bundle update: %lu", buf, 0xCu);
  }

  double v77 = +[NSPredicate predicateWithFormat:@"rankingDictionary.isEligibleForTripSummarization == %@", &__kCFBooleanTrue];
  id v10 = [v8 filteredArrayUsingPredicate:];

  uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    id v94 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Filtered input bundle count for trip by isEligibleForTripSummarization: %lu.", buf, 0xCu);
  }

  id v76 = +[NSPredicate predicateWithFormat:@"%K == %lu", @"interfaceType", 13];
  id v13 = [v10 filteredArrayUsingPredicate:];
  id v14 = +[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:1];
  v102 = v14;
  +[NSArray arrayWithObjects:&v102 count:1];
  id v15 = v79 = v10;
  id v16 = [v13 sortedArrayUsingDescriptors:v15];

  uint64_t v17 = +[NSPredicate predicateWithFormat:@"%K.%K <= %lu", @"place", @"placeType", 100];
  uint64_t v18 = [v16 filteredArrayUsingPredicate:v17];
  id v75 = (void *)v17;
  CFStringRef v19 = +[NSCompoundPredicate notPredicateWithSubpredicate:v17];
  uint64_t v74 = [v16 filteredArrayUsingPredicate:v19];

  id v20 = v18;
  id v21 = +[NSPredicate predicateWithFormat:@"%K == %lu AND %K != %lu", @"bundleSuperType", 1, @"bundleSubType", 105];
  uint64_t v22 = +[NSPredicate predicateWithFormat:@"%K == %lu AND NOT (%K IN %@)", @"bundleSuperType", 2, @"bundleSubType", &off_1002F8ED0];
  long long v23 = v79;
  v101[0] = v21;
  v101[1] = v22;
  id v24 = +[NSArray arrayWithObjects:v101 count:2];
  uint64_t v25 = +[NSCompoundPredicate orPredicateWithSubpredicates:v24];

  int8x16_t v73 = (void *)v25;
  long long v26 = [v79 filteredArrayUsingPredicate:v25];
  long long v27 = +[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:1];
  id v100 = v27;
  long long v28 = +[NSArray arrayWithObjects:&v100 count:1];
  long long v29 = [v26 sortedArrayUsingDescriptors:v28];

  if ([v29 count] && objc_msgSend(v20, "count"))
  {
    BOOL v30 = [v80 startDate];
    if (v30
      || ([v29 firstObject],
          id v31 = objc_claimAutoreleasedReturnValue(),
          [v31 startDate],
          BOOL v30 = objc_claimAutoreleasedReturnValue(),
          v31,
          v30))
    {
      +[NSPredicate predicateWithFormat:@"%K < %@", @"startDate", v30];
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke;
      v90[3] = &unk_1002C9590;
      id v91 = (id)objc_claimAutoreleasedReturnValue();
      id v68 = v30;
      id v92 = v68;
      id v32 = v91;
      [v20 enumerateObjectsUsingBlock:v90];
    }
    else
    {
      id v68 = 0;
    }
    uint64_t v71 = v21;
    __int16 v69 = v29;
    CFStringRef v33 = [[MOObjectZipper alloc] initWithObjects:v29 others:v20 comparator:&__block_literal_global_629];
    while ([(MOObjectZipper *)v33 nextObjectPairWithHandler:&__block_literal_global_632])
      ;
    __int16 v67 = v33;
    __int16 v70 = v22;
    __int16 v34 = [[MOTripAnnotationManager alloc] initWithUniverse:v82->fUniverse];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v72 = v20;
    id obj = v20;
    id v35 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v83 = *(void *)v87;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v87 != v83) {
            objc_enumerationMutation(obj);
          }
          __int16 v38 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          __int16 v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            __int16 v40 = [v38 startDate];
            uint64_t v41 = [v38 endDate];
            __int16 v42 = [v38 events];
            id v43 = [v42 count];
            *(_DWORD *)buf = 138412802;
            id v94 = v40;
            __int16 v95 = 2112;
            id v96 = v41;
            __int16 v97 = 2048;
            id v98 = v43;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Update trip bundle between %@ and %@, events, %lu", buf, 0x20u);
          }
          id v44 = [v38 subBundleIDs];
          __int16 v45 = +[NSSet setWithArray:v44];

          id v46 = [v45 allObjects];
          [v38 setSubBundleIDs:v46];

          __int16 v47 = [v38 events];
          id v48 = +[NSSet setWithArray:v47];

          __int16 v49 = [v48 allObjects];
          [v38 setEvents:v49];

          id v50 = [v38 action];

          if (v50)
          {
            __int16 v51 = v34;
            id v52 = [v38 events];
            __int16 v53 = [v52 firstObject];
            id v54 = [v53 eventIdentifier];
            __int16 v55 = [v38 action];
            [v55 setSourceEventIdentifier:v54];

            id v56 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              uint64_t v57 = [v38 action];
              char v58 = [v57 sourceEventIdentifier];
              *(_DWORD *)buf = 138412290;
              id v94 = v58;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from updating event bundles", buf, 0xCu);
            }
            __int16 v34 = v51;
          }
          long long v59 = [v38 events];
          [(MOTripAnnotationManager *)v34 materializeTripBundle:v38 contextEvents:v59 updateWithFilteredEvents:1];
        }
        id v36 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
      }
      while (v36);
    }

    long long v60 = (void *)v74;
    long long v61 = [[MOObjectZipper alloc] initWithObjects:obj others:v74 comparator:&__block_literal_global_636];

    do
    {
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_2_637;
      v84[3] = &unk_1002CE3C8;
      long long v62 = v34;
      id v85 = v62;
      unsigned __int8 v63 = [(MOObjectZipper *)v61 nextObjectPairWithHandler:v84];
    }
    while ((v63 & 1) != 0);

    long long v23 = v79;
    id v21 = v71;
    id v20 = v72;
    long long v29 = v69;
    uint64_t v22 = v70;
    id v64 = v68;
  }
  else
  {
    id v64 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      id v65 = [v20 count];
      id v66 = [v29 count];
      *(_DWORD *)buf = 134218240;
      id v94 = v65;
      __int16 v95 = 2048;
      id v96 = v66;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Trip bundle association: Either container or element bundle array is empty. trip bundle count: %lu, element bundle count: %lu", buf, 0x16u);
    }
    long long v60 = (void *)v74;
  }
}

void __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 events];
  id v5 = [v4 count];

  id v6 = [v3 events];
  uint64_t v7 = [v6 filteredArrayUsingPredicate:*(void *)(a1 + 32)];
  [v3 setEvents:v7];

  id v8 = [v3 action];

  if (v8)
  {
    long long v9 = [v3 events];
    id v10 = [v9 firstObject];
    uint64_t v11 = [v10 eventIdentifier];
    id v12 = [v3 action];
    [v12 setSourceEventIdentifier:v11];

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v3 action];
      id v15 = [v14 sourceEventIdentifier];
      *(_DWORD *)buf = 138412290;
      long long v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from first event after applying effectiveWindowPredicate", buf, 0xCu);
    }
  }
  id v16 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *(void **)(a1 + 40);
    long long v27 = [v3 events];
    id v18 = [v27 count];
    CFStringRef v19 = [v3 events];
    id v20 = [v19 firstObject];
    id v21 = [v20 startDate];
    uint64_t v22 = [v3 events];
    long long v23 = [v22 lastObject];
    uint64_t v24 = [v23 startDate];
    id v25 = v5;
    long long v26 = (void *)v24;
    *(_DWORD *)buf = 138413314;
    long long v29 = v17;
    __int16 v30 = 2048;
    id v31 = v25;
    __int16 v32 = 2048;
    id v33 = v18;
    __int16 v34 = 2112;
    id v35 = v21;
    __int16 v36 = 2112;
    uint64_t v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "associateEventBundles: event pruning, date, %@, before, %lu, after, %lu, first event, %@, last event, %@", buf, 0x34u);
  }
}

int64_t __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_626(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)a2 endDate];
  id v6 = [(MOEventBundle *)v4 endDate];

  LODWORD(v4) = [v5 isBeforeDate:v6];
  if (v4) {
    return -1;
  }
  else {
    return 1;
  }
}

void __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_2(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v50 = v4;
    __int16 v51 = 2112;
    id v52 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "associateEventBundles: bundle, %@, container bundles, %@", buf, 0x16u);
  }

  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(MOEventBundle *)v4 startDate];
    long long v9 = [(MOEventBundle *)v4 endDate];
    id v10 = [(MOEventBundle *)v5 startDate];
    uint64_t v11 = [(MOEventBundle *)v5 endDate];
    *(_DWORD *)buf = 138413058;
    id v50 = v8;
    __int16 v51 = 2112;
    id v52 = v9;
    __int16 v53 = 2112;
    double v54 = *(double *)&v10;
    __int16 v55 = 2112;
    id v56 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "associateEventBundles: bundle, start, %@, end, %@, container bundles, start, %@, end, %@", buf, 0x2Au);
  }
  +[MOSummarizationUtilities overlappingTimeIntervalBetween:v4 andOtherBundle:v5];
  if (v12 > 0.0)
  {
    double v13 = v12;
    id v14 = [(MOEventBundle *)v4 dateInterval];
    [v14 duration];
    if (v15 <= 0.0)
    {
LABEL_29:

      goto LABEL_30;
    }
    [v14 duration];
    double v17 = v13 / v16;
    if (v17 <= 0.2)
    {
      CFStringRef v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_28:

        goto LABEL_29;
      }
      id v25 = [(MOEventBundle *)v5 suggestionID];
      long long v26 = [(MOEventBundle *)v4 suggestionID];
      *(_DWORD *)buf = 138412802;
      id v50 = (MOEventBundle *)v25;
      __int16 v51 = 2112;
      id v52 = v26;
      __int16 v53 = 2048;
      double v54 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "associateEventBundles, partially overlappend bundle, container bundle, %@, child bundle, %@, ratio, %f", buf, 0x20u);

LABEL_27:
      goto LABEL_28;
    }
    id v18 = [(MOEventBundle *)v4 suggestionID];
    CFStringRef v19 = [v18 UUIDString];

    id v20 = [(MOEventBundle *)v5 subBundleIDs];

    if (v20)
    {
      id v21 = [(MOEventBundle *)v5 subBundleIDs];
      unsigned __int8 v22 = [v21 containsObject:v19];

      if (v22) {
        goto LABEL_15;
      }
      long long v23 = [(MOEventBundle *)v5 subBundleIDs];
      uint64_t v24 = [v23 arrayByAddingObject:v19];
      [(MOEventBundle *)v5 setSubBundleIDs:v24];
    }
    else
    {
      id v48 = v19;
      long long v23 = +[NSArray arrayWithObjects:&v48 count:1];
      [(MOEventBundle *)v5 setSubBundleIDs:v23];
    }

LABEL_15:
    long long v27 = [(MOEventBundle *)v4 place];
    [v27 setLocationMode:2];

    long long v28 = [(MOEventBundle *)v5 events];

    if (v28)
    {
      long long v29 = [(MOEventBundle *)v5 events];
      __int16 v30 = [(MOEventBundle *)v4 events];
      id v31 = [v29 arrayByAddingObjectsFromArray:v30];

      __int16 v32 = +[NSSet setWithArray:v31];
      id v33 = [v32 allObjects];
      [(MOEventBundle *)v5 setEvents:v33];

      __int16 v34 = [(MOEventBundle *)v5 action];

      if (v34)
      {
        id v35 = [(MOEventBundle *)v5 events];
        __int16 v36 = [v35 firstObject];
        uint64_t v37 = [v36 eventIdentifier];
        __int16 v38 = [(MOEventBundle *)v5 action];
        [v38 setSourceEventIdentifier:v37];

        __int16 v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
LABEL_23:

          goto LABEL_24;
        }
        __int16 v40 = [(MOEventBundle *)v5 action];
        uint64_t v41 = [(MOEventBundle *)v40 sourceEventIdentifier];
        *(_DWORD *)buf = 138412290;
        id v50 = v41;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from first event for overlapping ratio > 0.2 and container bundle had events originally", buf, 0xCu);

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      __int16 v42 = [(MOEventBundle *)v4 events];
      [(MOEventBundle *)v5 setEvents:v42];

      id v43 = [(MOEventBundle *)v5 action];

      if (!v43) {
        goto LABEL_25;
      }
      id v44 = [(MOEventBundle *)v5 events];
      __int16 v45 = [v44 firstObject];
      id v46 = [v45 eventIdentifier];
      __int16 v47 = [(MOEventBundle *)v5 action];
      [v47 setSourceEventIdentifier:v46];

      id v31 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        __int16 v39 = [(MOEventBundle *)v5 action];
        __int16 v40 = [v39 sourceEventIdentifier];
        *(_DWORD *)buf = 138412290;
        id v50 = v40;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from first event for overlapping ratio > 0.2 and container bundle had no events originally", buf, 0xCu);
        goto LABEL_22;
      }
    }
LABEL_24:

LABEL_25:
    id v25 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v50 = v4;
      __int16 v51 = 2112;
      id v52 = v5;
      __int16 v53 = 2048;
      double v54 = v17;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "associateEventBundles: merge, bundle %@, container bundle, %@, ratio, %f", buf, 0x20u);
    }
    goto LABEL_27;
  }
LABEL_30:
}

int64_t __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_634(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)a2 endDate];
  id v6 = [(MOEventBundle *)v4 endDate];

  LODWORD(v4) = [v5 isBeforeDate:v6];
  if (v4) {
    return -1;
  }
  else {
    return 1;
  }
}

void __64__MOEventBundleManager_associateEventBundles_effectiveInterval___block_invoke_2_637(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v82 = v5;
    __int16 v83 = 2112;
    id v84 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "associateEventBundles: daily trip bundle, %@, container bundles, %@", buf, 0x16u);
  }

  id v8 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    long long v9 = [v5 startDate];
    id v10 = [v5 endDate];
    uint64_t v11 = [v6 startDate];
    double v12 = [v6 endDate];
    *(_DWORD *)buf = 138413058;
    id v82 = v9;
    __int16 v83 = 2112;
    id v84 = v10;
    __int16 v85 = 2112;
    long long v86 = v11;
    __int16 v87 = 2112;
    long long v88 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "associateEventBundles: summary trip bundle, start, %@, end, %@, container bundles, start, %@, end, %@", buf, 0x2Au);
  }
  +[MOSummarizationUtilities overlappingTimeIntervalBetween:v5 andOtherBundle:v6];
  if (v13 > 0.0)
  {
    id v14 = [v5 suggestionID];
    double v15 = [v14 UUIDString];

    double v16 = [v6 subBundleIDs];

    if (v16)
    {
      double v17 = [v6 subBundleIDs];
      unsigned __int8 v18 = [v17 containsObject:v15];

      if (v18) {
        goto LABEL_11;
      }
      CFStringRef v19 = [v6 subBundleIDs];
      id v20 = [v19 arrayByAddingObject:v15];
      [v6 setSubBundleIDs:v20];
    }
    else
    {
      id v96 = v15;
      CFStringRef v19 = +[NSArray arrayWithObjects:&v96 count:1];
      [v6 setSubBundleIDs:v19];
    }

LABEL_11:
    id v21 = [v6 resources];

    if (v21)
    {
      unsigned __int8 v22 = [v6 resources];
      long long v23 = [v5 resources];
      uint64_t v24 = [v22 arrayByAddingObjectsFromArray:v23];

      id v25 = +[NSSet setWithArray:v24];
      long long v26 = [v25 allObjects];
      [v6 setResources:v26];
    }
    else
    {
      uint64_t v24 = [v5 resources];
      [v6 setResources:v24];
    }

    long long v27 = *(void **)(a1 + 32);
    long long v28 = [v6 resources];
    [v27 _assignPriorityScoreForPhotoResources:v28];

    long long v29 = [v6 events];

    if (v29)
    {
      __int16 v30 = [v6 events];
      id v31 = [v5 events];
      __int16 v32 = [v30 arrayByAddingObjectsFromArray:v31];

      id v33 = +[NSSet setWithArray:v32];
      __int16 v34 = [v33 allObjects];
      [v6 setEvents:v34];

      id v35 = [v6 action];

      if (v35)
      {
        __int16 v36 = [v6 events];
        uint64_t v37 = [v36 firstObject];
        __int16 v38 = [v37 eventIdentifier];
        __int16 v39 = [v6 action];
        [v39 setSourceEventIdentifier:v38];

        __int16 v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v41 = [v6 action];
        __int16 v42 = [v41 sourceEventIdentifier];
        *(_DWORD *)buf = 138412290;
        id v82 = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from second round of association and container bundle had events orignally", buf, 0xCu);

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      id v43 = [v5 events];
      [v6 setEvents:v43];

      id v44 = [v6 action];

      if (!v44)
      {
LABEL_24:
        __int16 v49 = [v6 places];

        if (v49)
        {
          id v50 = [v6 places];
          __int16 v51 = [v5 places];
          id v52 = [v50 arrayByAddingObjectsFromArray:v51];

          __int16 v53 = +[NSSet setWithArray:v52];
          double v54 = [v53 allObjects];
        }
        else
        {
          double v54 = [v5 places];
        }
        __int16 v55 = objc_opt_new();
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v56 = v54;
        id v57 = [v56 countByEnumeratingWithState:&v77 objects:v95 count:16];
        if (v57)
        {
          id v58 = v57;
          uint64_t v59 = *(void *)v78;
          do
          {
            for (i = 0; i != v58; i = (char *)i + 1)
            {
              if (*(void *)v78 != v59) {
                objc_enumerationMutation(v56);
              }
              long long v61 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              if ((unint64_t)[v61 placeType] <= 5) {
                [v55 addObject:v61];
              }
            }
            id v58 = [v56 countByEnumeratingWithState:&v77 objects:v95 count:16];
          }
          while (v58);
        }

        [v6 setPlaces:v55];
        long long v62 = [v55 lastObject];
        unsigned __int8 v63 = [v62 location];
        id v64 = [v6 place];
        [v64 setLocation:v63];

        goto LABEL_37;
      }
      __int16 v45 = [v6 events];
      id v46 = [v45 firstObject];
      __int16 v47 = [v46 eventIdentifier];
      id v48 = [v6 action];
      [v48 setSourceEventIdentifier:v47];

      __int16 v32 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        __int16 v40 = [v6 action];
        uint64_t v41 = [v40 sourceEventIdentifier];
        *(_DWORD *)buf = 138412290;
        id v82 = v41;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "associateEventBundles: setting container bundle action as %@ from second round of association and container bundle had no events orignally", buf, 0xCu);
        goto LABEL_21;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_37:
  id v65 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    id v66 = [v5 startDate];
    __int16 v67 = [v5 endDate];
    id v68 = [v6 startDate];
    __int16 v69 = [v6 endDate];
    id v75 = [v6 subBundleIDs];
    id v70 = [v75 count];
    [v6 subSuggestionIDs];
    v71 = id v76 = v5;
    id v72 = [v71 count];
    int8x16_t v73 = [v6 events];
    id v74 = [v73 count];
    *(_DWORD *)buf = 138413826;
    id v82 = v66;
    __int16 v83 = 2112;
    id v84 = v67;
    __int16 v85 = 2112;
    long long v86 = v68;
    __int16 v87 = 2112;
    long long v88 = v69;
    __int16 v89 = 2048;
    id v90 = v70;
    __int16 v91 = 2048;
    id v92 = v72;
    __int16 v93 = 2048;
    id v94 = v74;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "associateEventBundles: summary trip bundle, start, %@, end, %@, container bundles, start, %@, end, %@, container.subBundleIDs, %lu, container.subSuggstionIDs, %lu, container.events, %lu", buf, 0x48u);

    id v5 = v76;
  }
}

+ (id)dateFormatterForKeyword
{
  if (dateFormatterForKeyword_onceToken != -1) {
    dispatch_once(&dateFormatterForKeyword_onceToken, &__block_literal_global_639);
  }
  id v2 = (void *)dateFormatterForKeyword_dateFormatter;

  return v2;
}

void __47__MOEventBundleManager_dateFormatterForKeyword__block_invoke(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)dateFormatterForKeyword_dateFormatter;
  dateFormatterForKeyword_dateFormatter = v1;

  id v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)dateFormatterForKeyword_dateFormatter setLocale:v3];

  [(id)dateFormatterForKeyword_dateFormatter setDateFormat:@"yyyy-MM-dd"];
  id v4 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [(id)dateFormatterForKeyword_dateFormatter setTimeZone:v4];
}

- (id)keywordForEventBundle:(id)a3
{
  id v3 = a3;
  if ([v3 bundleManagementPolicy] == (id)1)
  {
    id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v3 interfaceType]);
  }
  else
  {
    id v5 = +[MOEventBundleManager dateFormatterForKeyword];
    id v6 = [v3 startDate];
    uint64_t v7 = [v5 stringFromDate:v6];

    id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu-%@", [v3 interfaceType], v7);
  }

  return v4;
}

- (id)adjacentKeywordsForEventBundle:(id)a3
{
  id v4 = a3;
  if ([v4 bundleManagementPolicy] == (id)1)
  {
    id v5 = [(MOEventBundleManager *)self keywordForEventBundle:v4];
    id v20 = v5;
    id v6 = +[NSArray arrayWithObjects:&v20 count:1];
  }
  else
  {
    id v5 = +[MOEventBundleManager dateFormatterForKeyword];
    uint64_t v7 = objc_opt_new();
    id v8 = [v4 startDate];
    long long v9 = [v8 dateByAddingTimeInterval:-86400.0];
    id v10 = [v5 stringFromDate:v9];

    uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu-%@", [v4 interfaceType], v10);
    [v7 addObject:v11];

    double v12 = [v4 startDate];
    double v13 = [v5 stringFromDate:v12];

    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu-%@", [v4 interfaceType], v13);
    [v7 addObject:v14];

    double v15 = [v4 startDate];
    double v16 = [v15 dateByAddingTimeInterval:86400.0];
    double v17 = [v5 stringFromDate:v16];

    unsigned __int8 v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu-%@", [v4 interfaceType], v17);
    [v7 addObject:v18];

    id v6 = [v7 copy];
  }

  return v6;
}

- (id)partitionedEventBundles:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = [(MOEventBundleManager *)self keywordForEventBundle:v10];
        double v12 = [v5 objectForKey:v11];
        if (!v12) {
          double v12 = objc_opt_new();
        }
        [v12 addObject:v10];
        [v5 setObject:v12 forKey:v11];
      }
      id v7 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  double v13 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v25 = [v5 allKeys];
  id v14 = [v25 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v25);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * (void)j);
        CFStringRef v19 = [v5 objectForKey:v18];
        id v20 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
        id v35 = v20;
        id v21 = +[NSArray arrayWithObjects:&v35 count:1];
        unsigned __int8 v22 = [v19 sortedArrayUsingDescriptors:v21];

        [v13 setObject:v22 forKey:v18];
      }
      id v15 = [v25 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v15);
  }

  id v23 = [v13 copy];

  return v23;
}

- (id)matchedEventBundleForEventBundle:(id)a3 otherEventBundles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOEventBundleManager *)self adjacentKeywordsForEventBundle:v6];
  long long v9 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [v7 objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        [v9 addObjectsFromArray:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v12);
  }

  long long v31 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  id v46 = v31;
  uint64_t v16 = +[NSArray arrayWithObjects:&v46 count:1];
  double v17 = [v9 sortedArrayUsingDescriptors:v16];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v37;
LABEL_10:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v37 != v21) {
        objc_enumerationMutation(v18);
      }
      id v23 = *(void **)(*((void *)&v36 + 1) + 8 * v22);
      if (([v23 filtered] & 1) == 0
        && ([v6 isEqualToEventBundle:v23] & 1) != 0)
      {
        goto LABEL_27;
      }
      if (v20 == (id)++v22)
      {
        id v20 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v20) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = v18;
  id v25 = [v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v33;
LABEL_19:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v33 != v27) {
        objc_enumerationMutation(v24);
      }
      id v23 = *(void **)(*((void *)&v32 + 1) + 8 * v28);
      if ([v23 filtered])
      {
        if ([v6 isEqualToEventBundle:v23]) {
          break;
        }
      }
      if (v26 == (id)++v28)
      {
        id v26 = [v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
        id v29 = 0;
        if (v26) {
          goto LABEL_19;
        }
        goto LABEL_28;
      }
    }
LABEL_27:
    id v29 = v23;
    goto LABEL_28;
  }
  id v29 = 0;
LABEL_28:

  return v29;
}

- (void)submitMetricForEventBundleWithPromptMetrics:(id)a3
{
  id v3 = a3;
  [v3 getAndSetAgeGender];
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Start submission of bundling CA metrics.", buf, 2u);
  }

  id v11 = 0;
  [v3 submitMetricsWithError:&v11];

  id v5 = v11;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      uint64_t v8 = "Error was issued during metrics submission for MOPromptMetrics. Error: %@";
      long long v9 = v6;
      uint32_t v10 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    uint64_t v8 = "Finished submission of bundling CA metrics.";
    long long v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_8;
  }
}

- (void)submitMOEventData:(id)a3 startDate:(id)a4 endDate:(id)a5 subDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v89 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "We have %lu raw events to submit.", buf, 0xCu);
  }

  id v15 = [[MOEventBundler alloc] initWithStartDate:v11 endDate:v12];
  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Bundle events to find co-occuring events before submission.", buf, 2u);
  }
  uint64_t v71 = v13;
  id v63 = v12;
  id v64 = v11;

  id v65 = v10;
  id v66 = v15;
  double v17 = [(MOEventBundler *)v15 calculateEventBundlesFromEvents:v10];
  id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v17 count];
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v89 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "We have %lu event bundles.", buf, 0xCu);
  }

  long long v62 = [[MOUserData alloc] initWithEventManager:self->_eventManager];
  [(MOUserData *)v62 submitUserDataWithCompletionHandler:&__block_literal_global_656];
  id v74 = objc_alloc_init((Class)NSMutableArray);
  id v20 = objc_alloc_init((Class)NSMutableArray);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  __int16 v69 = v17;
  uint64_t v21 = [v17 allKeys];
  id v22 = [v21 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v85;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v85 != v24) {
          objc_enumerationMutation(v21);
        }
        [v74 addObject:*(void *)(*((void *)&v84 + 1) + 8 * i)];
        uint64_t v26 = arc4random_uniform(0x1388u) + 1;
        int v27 = 10;
        do
        {
          uint64_t v28 = +[NSNumber numberWithUnsignedInt:v26];
          unsigned int v29 = [v20 containsObject:v28];

          if (!v29) {
            break;
          }
          uint64_t v26 = arc4random_uniform(0x1388u) + 1;
          --v27;
        }
        while (v27);
        long long v30 = +[NSNumber numberWithUnsignedInt:v26];
        [v20 addObject:v30];
      }
      id v23 = [v21 countByEnumeratingWithState:&v84 objects:v94 count:16];
    }
    while (v23);
  }

  long long v31 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v74];
  long long v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v89 = v31;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "islandID random map: %@", buf, 0xCu);
  }

  int8x16_t v73 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002F57F8, &off_1002F5810, &off_1002F5828, &off_1002F5798, 0);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v33 = v69;
  long long v34 = [v69 allKeys];
  id v35 = [v34 countByEnumeratingWithState:&v80 objects:v93 count:16];
  __int16 v67 = v31;
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v81;
    id v68 = v34;
    uint64_t v59 = *(void *)v81;
    do
    {
      long long v38 = 0;
      id v60 = v36;
      do
      {
        if (*(void *)v81 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v80 + 1) + 8 * (void)v38);
        id v72 = [v31 objectForKey:v39];
        if (v72)
        {
          long long v61 = v38;
          uint64_t v70 = v39;
          long long v40 = [v33 objectForKeyedSubscript:v39];
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v41 = v40;
          id v42 = [v41 countByEnumeratingWithState:&v76 objects:v92 count:16];
          if (v42)
          {
            id v43 = v42;
            int v44 = 0;
            uint64_t v45 = *(void *)v77;
            while (2)
            {
              for (j = 0; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v77 != v45) {
                  objc_enumerationMutation(v41);
                }
                __int16 v47 = *(void **)(*((void *)&v76 + 1) + 8 * (void)j);
                id v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v47 provider]);
                unsigned int v49 = [v73 containsObject:v48];

                if (v49)
                {
                  id v50 = [[MOEventData alloc] initWithEvent:v47 islandID:v72 subDate:v71];
                  __int16 v51 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)__int16 v89 = v44;
                    *(_WORD *)&v89[4] = 2112;
                    *(void *)&v89[6] = v70;
                    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Submitting raw event with index: %d and islandID: %@.", buf, 0x12u);
                  }

                  id v75 = 0;
                  [(MOEventData *)v50 submitMetricsWithError:&v75];
                  id v52 = v75;
                  if (v52)
                  {
                    id v57 = v52;
                    id v58 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)__int16 v89 = v44;
                      *(_WORD *)&v89[4] = 2112;
                      *(void *)&v89[6] = v70;
                      __int16 v90 = 2112;
                      __int16 v91 = v57;
                      _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Error was issued during raw event submission with event index: %d and islandID: %@. Error: %@", buf, 0x1Cu);
                    }

                    __int16 v55 = v64;
                    double v54 = v65;
                    id v56 = v63;
                    long long v33 = v69;
                    goto LABEL_46;
                  }
                  ++v44;
                }
              }
              id v43 = [v41 countByEnumeratingWithState:&v76 objects:v92 count:16];
              if (v43) {
                continue;
              }
              break;
            }
          }

          long long v34 = v68;
          long long v33 = v69;
          long long v31 = v67;
          uint64_t v37 = v59;
          id v36 = v60;
          long long v38 = v61;
        }
        long long v38 = (char *)v38 + 1;
      }
      while (v38 != v36);
      id v36 = [v34 countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v36);
  }

  __int16 v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v68 = v53;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Finished submission of raw events.", buf, 2u);
  }
  __int16 v55 = v64;
  double v54 = v65;
  id v56 = v12;
LABEL_46:
}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke(id a1, NSError *a2, NSError *a3, NSError *a4)
{
  id v6 = a2;
  BOOL v7 = a3;
  uint64_t v8 = a4;
  if (v6)
  {
    long long v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_3();
    }
  }
  if (v7)
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_2();
    }
  }
  if (v8)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_1();
    }
  }
}

- (void)submitEventBundleInternalAnalytics:(id)a3 withSubmissionDate:(id)a4 withRefreshVariant:(unint64_t)a5
{
  id v7 = a3;
  id v113 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v127 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%lu bundles are passed to be submitted to CoreAnalytics.", buf, 0xCu);
  }

  v102 = +[NSCalendar currentCalendar];
  long long v9 = [v102 components:764 fromDate:v113];
  id v110 = [v9 year];
  id v109 = [v9 month];
  id v108 = [v9 day];
  id v107 = [v9 hour];
  id v101 = v9;
  id v106 = [v9 minute];
  id v112 = +[MOMetric binsFromStart:&off_1002F5768 toEnd:&off_1002F97E0 gap:&off_1002F9860];
  id v10 = [(MOEventBundleManager *)self configurationManager];
  id v11 = [v10 getTrialExperimentIdentifiers];

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = v7;
  id v114 = [obj countByEnumeratingWithState:&v119 objects:v125 count:16];
  if (v114)
  {
    uint64_t v104 = *(void *)v120;
    id v105 = v11;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v120 != v104) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v119 + 1) + 8 * (void)v12);
        id v14 = objc_opt_new();
        id v15 = +[NSNumber numberWithInteger:v110];
        [v14 setObject:v15 forKeyedSubscript:@"submissionTimeYear"];

        uint64_t v16 = +[NSNumber numberWithInteger:v109];
        [v14 setObject:v16 forKeyedSubscript:@"submissionTimeMonth"];

        double v17 = +[NSNumber numberWithInteger:v108];
        [v14 setObject:v17 forKeyedSubscript:@"submissionTimeDay"];

        id v18 = +[NSNumber numberWithInteger:v107];
        [v14 setObject:v18 forKeyedSubscript:@"submissionTimeHour"];

        id v19 = +[NSNumber numberWithInteger:v106];
        [v14 setObject:v19 forKeyedSubscript:@"submissionTimeMinute"];

        id v20 = +[NSNumber numberWithUnsignedInteger:a5];
        [v14 setObject:v20 forKeyedSubscript:@"refreshVariant"];

        if (v11)
        {
          uint64_t v21 = [v11 experimentId];
          [v14 setObject:v21 forKeyedSubscript:@"trialExperimentId"];

          id v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 deploymentId]);
          id v23 = [v22 stringValue];
          [v14 setObject:v23 forKeyedSubscript:@"trialDeploymentId"];

          uint64_t v24 = [v11 treatmentId];
          [v14 setObject:v24 forKeyedSubscript:@"trialTreatmentId"];
        }
        id v25 = [v13 bundleIdentifier];
        uint64_t v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 hash]);
        [v14 setObject:v26 forKeyedSubscript:@"bundleId"];

        int v27 = [v13 suggestionID];
        uint64_t v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 hash]);
        [v14 setObject:v28 forKeyedSubscript:@"suggestionId"];

        unsigned int v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 interfaceType]);
        [v14 setObject:v29 forKeyedSubscript:@"interfaceType"];

        long long v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 source]);
        [v14 setObject:v30 forKeyedSubscript:@"bundleSource"];

        long long v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 filtered]);
        [v14 setObject:v31 forKeyedSubscript:@"isFiltered"];

        long long v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 bundleSubType]);
        [v14 setObject:v32 forKeyedSubscript:@"bundleSubType"];

        long long v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 bundleSuperType]);
        [v14 setObject:v33 forKeyedSubscript:@"bundleSuperType"];

        long long v34 = [v13 startDate];
        [v113 timeIntervalSinceDate:v34];
        id v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v36 = +[MOMetric binForNumber:v35 bins:v112];
        [v14 setObject:v36 forKeyedSubscript:@"startTimeBucketed"];

        uint64_t v37 = [v13 endDate];
        [v113 timeIntervalSinceDate:v37];
        long long v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v39 = +[MOMetric binForNumber:v38 bins:v112];
        [v14 setObject:v39 forKeyedSubscript:@"endTimeBucketed"];

        long long v40 = [v13 events];
        id v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v40 count]);
        [v14 setObject:v41 forKeyedSubscript:@"numTotalEvents"];

        id v42 = [v13 events];
        uint64_t v43 = [v42 valueForKeyPath:@"@distinctUnionOfObjects.category"];

        long long v117 = (void *)v43;
        id v44 = [objc_alloc((Class)NSCountedSet) initWithArray:v43];
        uint64_t v45 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5738]);
        [v14 setObject:v45 forKeyedSubscript:@"numUnknownEvents"];

        id v46 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F57F8]);
        [v14 setObject:v46 forKeyedSubscript:@"numVisitEvents"];

        __int16 v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5810]);
        [v14 setObject:v47 forKeyedSubscript:@"numWorkoutEvents"];

        id v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5828]);
        [v14 setObject:v48 forKeyedSubscript:@"numMediaOnRepeatEvents"];

        unsigned int v49 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5798]);
        [v14 setObject:v49 forKeyedSubscript:@"numLeisureMediaEvents"];

        id v50 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F57B0]);
        [v14 setObject:v50 forKeyedSubscript:@"numPhotoMomentEvents"];

        __int16 v51 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5840]);
        [v14 setObject:v51 forKeyedSubscript:@"numMediaPlaySessionEvents"];

        id v52 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5858]);
        [v14 setObject:v52 forKeyedSubscript:@"numTopicEvents"];

        __int16 v53 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5870]);
        [v14 setObject:v53 forKeyedSubscript:@"numTravelEvents"];

        double v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5888]);
        [v14 setObject:v54 forKeyedSubscript:@"numSharedWithYouEvents"];

        __int16 v55 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F58A0]);
        [v14 setObject:v55 forKeyedSubscript:@"numSignificantContactEvents"];

        id v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5750]);
        [v14 setObject:v56 forKeyedSubscript:@"numStructuredEvents"];

        id v57 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F5780]);
        [v14 setObject:v57 forKeyedSubscript:@"numNLEvents"];

        id v58 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F58B8]);
        [v14 setObject:v58 forKeyedSubscript:@"numMindfulSessionEvents"];

        uint64_t v59 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 countForObject:&off_1002F58D0]);
        [v14 setObject:v59 forKeyedSubscript:@"numSharedPhotoEvents"];

        id v60 = [v13 events];
        uint64_t v61 = [v60 valueForKeyPath:@"@distinctUnionOfObjects.provider"];

        id v116 = (void *)v61;
        id v115 = [objc_alloc((Class)NSCountedSet) initWithArray:v61];
        long long v62 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v115 countForObject:&off_1002F57B0]);
        [v14 setObject:v62 forKeyedSubscript:@"numPatternEvents"];

        id v63 = [v13 allResources];
        id v64 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v63 count]);
        [v14 setObject:v64 forKeyedSubscript:@"numTotalResources"];

        id v65 = [v63 valueForKeyPath:@"@distinctUnionOfObjects.type"];
        id v66 = [objc_alloc((Class)NSCountedSet) initWithArray:v65];
        __int16 v67 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5738]);
        [v14 setObject:v67 forKeyedSubscript:@"numUnknownResourceTypes"];

        id v68 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F57F8]);
        [v14 setObject:v68 forKeyedSubscript:@"numValueResourceTypes"];

        __int16 v69 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5810]);
        [v14 setObject:v69 forKeyedSubscript:@"numPhotoAssetResourceTypes"];

        uint64_t v70 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5828]);
        [v14 setObject:v70 forKeyedSubscript:@"numMediaResourceTypes"];

        uint64_t v71 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5798]);
        [v14 setObject:v71 forKeyedSubscript:@"numWebLinkResourceTypes"];

        id v72 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F57B0]);
        [v14 setObject:v72 forKeyedSubscript:@"numInferenceTagResourceTypes"];

        int8x16_t v73 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5840]);
        [v14 setObject:v73 forKeyedSubscript:@"numMapItemResourceTypes"];

        id v74 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5858]);
        [v14 setObject:v74 forKeyedSubscript:@"numAppResourceTypes"];

        id v75 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5870]);
        [v14 setObject:v75 forKeyedSubscript:@"numTopicResourceTypes"];

        long long v76 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5888]);
        [v14 setObject:v76 forKeyedSubscript:@"numEvergreenResourceTypes"];

        long long v77 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F58A0]);
        [v14 setObject:v77 forKeyedSubscript:@"numWorkoutResourceTypes"];

        long long v78 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5750]);
        [v14 setObject:v78 forKeyedSubscript:@"numPersonResourceTypes"];

        long long v79 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F5780]);
        [v14 setObject:v79 forKeyedSubscript:@"numPlaceResourceTypes"];

        long long v80 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F58B8]);
        [v14 setObject:v80 forKeyedSubscript:@"numMotionActivityResourceTypes"];

        long long v81 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 countForObject:&off_1002F58D0]);
        [v14 setObject:v81 forKeyedSubscript:@"numWeatherResourceTypes"];

        if ([v13 interfaceType] == (id)2
          || [v13 interfaceType] == (id)1
          || [v13 interfaceType] == (id)7
          || [v13 interfaceType] == (id)10)
        {
          long long v82 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            long long v83 = [v13 photoSource];
            *(_DWORD *)buf = 134217984;
            __int16 v127 = v83;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "photoSource set in ca,%lu", buf, 0xCu);
          }

          long long v84 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 photoSource]);
          [v14 setObject:v84 forKeyedSubscript:@"photoSource"];
        }
        long long v85 = [v13 action];
        long long v86 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v85 actionType]);
        [v14 setObject:v86 forKeyedSubscript:@"actionType"];

        long long v87 = [v13 persons];
        long long v88 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v87 count]);
        [v14 setObject:v88 forKeyedSubscript:@"numPersons"];

        __int16 v89 = [v13 place];
        __int16 v90 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v89 placeUserType] != 0);
        [v14 setObject:v90 forKeyedSubscript:@"isPlaceUserTypeKnown"];

        __int16 v91 = [v13 place];
        id v92 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v91 placeType] != 0);
        [v14 setObject:v92 forKeyedSubscript:@"isPlaceTypeKnown"];

        __int16 v93 = [v13 place];
        id v94 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v93 proposition] != 0);
        [v14 setObject:v94 forKeyedSubscript:@"isPlacePropositionSet"];

        __int16 v95 = [v13 time];
        id v96 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v95 timeTag] != 0);
        [v14 setObject:v96 forKeyedSubscript:@"isTimeTagSet"];

        if (v14)
        {
          __int16 v97 = v14;
          AnalyticsSendEventLazy();
          id v98 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          long long v99 = v118;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v127 = v97;
            _os_log_debug_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "Submitted coreAnalytics message: %@", buf, 0xCu);
          }
        }
        else
        {
          __int16 v97 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          long long v99 = v118;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
            -[MOEventBundleManager submitEventBundleInternalAnalytics:withSubmissionDate:withRefreshVariant:](v123, &v124, v97);
          }
        }
        id v11 = v105;

        id v12 = (char *)v12 + 1;
      }
      while (v114 != v12);
      id v114 = [obj countByEnumeratingWithState:&v119 objects:v125 count:16];
    }
    while (v114);
  }

  id v100 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "Completed Bundle CoreAnalytics submission.", buf, 2u);
  }
}

id __97__MOEventBundleManager_submitEventBundleInternalAnalytics_withSubmissionDate_withRefreshVariant___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)saveEventBundles:(id)a3 withStartDate:(id)a4 endDate:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, void))a6;
  id v14 = objc_opt_new();
  id v15 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v11 endDate:v12];
  uint64_t v16 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:v15 ascending:1 limit:0 filterBundle:0];
  double v17 = [(MOEventBundleManager *)self eventBundleStore];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke;
  v51[3] = &unk_1002CE450;
  id v18 = v10;
  id v52 = v18;
  id v19 = v14;
  id v53 = v19;
  [v17 fetchEventBundleWithOptions:v16 CompletionHandler:v51];

  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__19;
  unsigned int v49 = __Block_byref_object_dispose__19;
  id v50 = 0;
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__19;
  uint64_t v43 = __Block_byref_object_dispose__19;
  id v44 = (id)objc_opt_new();
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__19;
  uint64_t v37 = __Block_byref_object_dispose__19;
  id v38 = 0;
  eventBundleStore = self->_eventBundleStore;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_692;
  v29[3] = &unk_1002CE478;
  long long v31 = &v45;
  long long v32 = &v39;
  id v21 = v18;
  id v30 = v21;
  [(MOEventBundleStore *)eventBundleStore storeEventBundles:v21 CompletionHandler:v29];
  id v22 = self->_eventBundleStore;
  id v23 = [v19 copy];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_693;
  v26[3] = &unk_1002CE4A0;
  uint64_t v28 = &v33;
  id v24 = v19;
  id v27 = v24;
  [(MOEventBundleStore *)v22 removeEventBundles:v23 CompletionHandler:v26];

  if (v13)
  {
    uint64_t v25 = v46[5];
    if (v25) {
      v13[2](v13, v25, v40[5]);
    }
    else {
      v13[2](v13, v34[5], v40[5]);
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a2;
  id v14 = [obj countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = v3;
        id v4 = *(void **)(*((void *)&v20 + 1) + 8 * v3);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v5 = *(id *)(a1 + 32);
        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v28 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v17;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v17 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
              if ([v4 shareEvents:v10])
              {
                id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v25 = v4;
                  __int16 v26 = 2112;
                  uint64_t v27 = v10;
                  _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "found old event bundle which share events with new event bundle, old bundle, %@, new bundle, %@", buf, 0x16u);
                }

                if ([v4 interfaceType] != (id)13) {
                  [*(id *)(a1 + 40) addObject:v4];
                }
              }
            }
            id v7 = [v5 countByEnumeratingWithState:&v16 objects:v28 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v15 + 1;
      }
      while ((id)(v15 + 1) != v14);
      id v14 = [obj countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v14);
  }
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_692(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  long long v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_692_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v10 = [v7 mutableCopy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v9 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v12 = [*(id *)(a1 + 32) count];
    int v13 = 134217984;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saved %lu new event bundles from bundling process", (uint8_t *)&v13, 0xCu);
  }
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_693(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_693_cold_1();
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v3;
    id v5 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134217984;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "removed %lu old event bundles from bundling process", (uint8_t *)&v9, 0xCu);
  }
}

- (id)getUnfilteredEventBundleFrom:(id)a3 with:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __58__MOEventBundleManager_getUnfilteredEventBundleFrom_with___block_invoke;
  v12[3] = &unk_1002CE4C8;
  id v13 = v5;
  id v7 = (id)objc_opt_new();
  id v14 = v7;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  int v9 = v14;
  id v10 = v7;

  return v10;
}

void __58__MOEventBundleManager_getUnfilteredEventBundleFrom_with___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [[MOEventBundle alloc] initWithEventSet:v6 filtered:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [[*(id *)(a1 + 32) allValues];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v9)
  {

LABEL_11:
    [*(id *)(a1 + 40) setObject:v7 forKey:v5];
    goto LABEL_12;
  }
  id v10 = v9;
  int v11 = 0;
  uint64_t v12 = *(void *)v15;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v15 != v12) {
        objc_enumerationMutation(v8);
      }
      v11 |= [(MOEventBundle *)v7 containTheSameEventSet:*(void *)(*((void *)&v14 + 1) + 8 * i)];
    }
    id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v10);

  if ((v11 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)saveEventBundles:(id)a3 handler:(id)a4
{
  id v6 = a4;
  eventBundleStore = self->_eventBundleStore;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __49__MOEventBundleManager_saveEventBundles_handler___block_invoke;
  v9[3] = &unk_1002C9A50;
  id v10 = v6;
  id v8 = v6;
  [(MOEventBundleStore *)eventBundleStore storeEventBundles:a3 CompletionHandler:v9];
}

void __49__MOEventBundleManager_saveEventBundles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_692_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "save event bundles succeed", v10, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)saveEventBundleDictionary:(id)a3
{
  id v4 = [a3 allValues];
  [(MOEventBundleStore *)self->_eventBundleStore storeEventBundles:v4 CompletionHandler:&__block_literal_global_696];
}

void __50__MOEventBundleManager_saveEventBundleDictionary___block_invoke(id a1, NSError *a2, NSDictionary *a3)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_692_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "save event bundles succeed", v6, 2u);
  }
}

- (void)fetchRehydratedEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke;
  v8[3] = &unk_1002CE510;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(MOEventBundleManager *)self fetchEventBundlesWithOptions:v7 CompletionHandler:v8];
}

void __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    id v19 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetchRehydratedEventBundlesWithOptions, options, %@, bundles, %lu", buf, 0x16u);
  }

  if ([v7 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke_697;
    v13[3] = &unk_1002CAD10;
    uint64_t v12 = *(void **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v14 = v9;
    [v12 _rehydrateEventBundles:v7 withHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __81__MOEventBundleManager_fetchRehydratedEventBundlesWithOptions_CompletionHandler___block_invoke_697(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
}

- (void)fetchEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesWrapper", "", buf, 2u);
  }

  id v9 = [[MOPerformanceMeasurement alloc] initWithName:@"FetchEventBundlesWrapper" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  id v10 = [(MOEventBundleManager *)self eventBundleStore];
  uint64_t v11 = [v10 persistenceManager];
  id v12 = [v11 availability];

  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  id v14 = v13;
  if (v12 == (id)2)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "fetch event bundles since datastore is available", buf, 2u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __71__MOEventBundleManager_fetchEventBundlesWithOptions_CompletionHandler___block_invoke;
    v19[3] = &unk_1002CE538;
    long long v20 = v9;
    id v21 = v7;
    [(MOEventBundleManager *)self _fetchEventBundlesWithOptions:v6 CompletionHandler:v19];

    id v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleManager fetchEventBundlesWithOptions:CompletionHandler:]();
    }

    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"database is not available";
    long long v16 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v15 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v16];

    uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesWrapper", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v9 endSession];
    CFStringRef v23 = @"stateDatabaseAvailable";
    id v24 = &__kCFBooleanFalse;
    __int16 v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    (*((void (**)(id, void *, void *, void *))v7 + 2))(v7, &__NSArray0__struct, v15, v18);
  }
}

void __71__MOEventBundleManager_fetchEventBundlesWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObject:&__kCFBooleanTrue forKey:@"stateDatabaseAvailable"];
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  [v7 setObject:v8 forKey:@"resultNumberOfBundleEvents"];

  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesWrapper", "", v10, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchEventBundlesWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__19;
  void v24[4] = __Block_byref_object_dispose__19;
  id v25 = [v6 limit];
  id v8 = [v6 identifiers];
  if (v8)
  {
    id v9 = (MOEventBundleFetchOptions *)v6;
  }
  else
  {
    id v10 = [MOEventBundleFetchOptions alloc];
    uint64_t v11 = [v6 categories];
    id v12 = [v6 dateInterval];
    id v9 = [-MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:](v10, v11, v12, [v6 ascending], 0, [v6 includeDeletedBundles], [v6 skipRanking], [v6 interfaceType]);
  }
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesFetch", "", buf, 2u);
  }

  id v14 = [[MOPerformanceMeasurement alloc] initWithName:@"FetchEventBundlesFetch" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v14 startSession];
  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetched event bundles options, %@", buf, 0xCu);
  }

  eventBundleStore = self->_eventBundleStore;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke;
  v19[3] = &unk_1002CE588;
  uint64_t v17 = v14;
  long long v20 = v17;
  id v21 = self;
  id v18 = v7;
  id v22 = v18;
  CFStringRef v23 = v24;
  [(MOEventBundleStore *)eventBundleStore fetchEventBundleWithOptions:v9 CompletionHandler:v19];

  _Block_object_dispose(v24, 8);
}

void __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesFetch", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  id v8 = [*(id *)(a1 + 40) queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_707;
  v12[3] = &unk_1002CE560;
  id v13 = v6;
  id v9 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v9;
  uint64_t v16 = *(void *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_707(uint64_t a1)
{
  id v2 = (void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_707_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, &__NSArray0__struct, *v2);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 40) count];
      int v15 = 134217984;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetched event bundles count, %lu", (uint8_t *)&v15, 0xCu);
    }

    id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v9 = *(void **)(a1 + 40);
    if (v8)
    {
      id v10 = [v8 integerValue];
      id v11 = [*(id *)(a1 + 40) count];
      if (v10 >= v11) {
        id v12 = v11;
      }
      else {
        id v12 = v10;
      }
      [v9 subarrayWithRange:0, v12];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = v9;
    }
    id v14 = v13;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_rehydrateEventBundles:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v32 = a4;
  uint64_t v33 = objc_opt_new();
  id v31 = [v5 mutableCopy];
  uint64_t v6 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          long long v20 = [v11 events];
          id v21 = [v20 count];
          *(_DWORD *)buf = 134218242;
          id v53 = v21;
          __int16 v54 = 2112;
          __int16 v55 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "_rehydrateEventBundles, bundle.events, %lu, bundle, %@", buf, 0x16u);
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v13 = [v11 events];
        id v14 = [v13 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v44;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v44 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
              id v19 = [v18 eventIdentifier:v31];
              [v6 setObject:v18 forKey:v19];
            }
            id v15 = [v13 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v15);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v8);
  }

  id v22 = [v6 allValues];
  CFStringRef v23 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEvents", "", buf, 2u);
  }

  id v24 = [[MOPerformanceMeasurement alloc] initWithName:@"FetchEventBundlesRehydrateEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v24 startSession];
  id v25 = [(MOEventBundleManager *)self eventManager];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke;
  v36[3] = &unk_1002CE5D8;
  uint64_t v37 = v24;
  id v38 = self;
  id v39 = obj;
  id v40 = v33;
  id v41 = v31;
  id v42 = v32;
  id v26 = v32;
  id v27 = v31;
  id v28 = v33;
  id v29 = obj;
  id v30 = v24;
  [v25 rehydrateEvents:v22 withHandler:v36];
}

void __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEvents", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  id v8 = [*(id *)(a1 + 40) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_711;
  block[3] = &unk_1002CE5B0;
  uint64_t v9 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v14 = v9;
  id v15 = v5;
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v18 = v6;
  id v19 = v10;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v8, block);
}

void __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_711(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEventsPostProcessing", "", buf, 2u);
  }

  long long v43 = [[MOPerformanceMeasurement alloc] initWithName:@"FetchEventBundlesRehydrateEventsPostProcessing" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v43 startSession];
  uint64_t v3 = [*(id *)(a1 + 32) configurationManager];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) configurationManager];
    unsigned __int8 v5 = [v4 getBoolSettingForKey:@"EventBundleManagerOverrideEnableLifeEvent" withFallback:1];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_711_cold_1();
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = *(id *)(a1 + 40);
  id v8 = [v7 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = &MOLogFacilityEventBundleManager;
    uint64_t v11 = *(void *)v53;
    uint64_t v50 = *(void *)v53;
    uint64_t v46 = a1;
    unsigned __int8 v45 = v5;
    id v44 = v7;
    do
    {
      id v12 = 0;
      id v51 = v9;
      do
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v12);
        if ([v13 interfaceType] == (id)11)
        {
          id v14 = _mo_log_facility_get_os_log(v10);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "eventBundle skips event rehydration, %@", buf, 0xCu);
          }
          goto LABEL_32;
        }
        if ((v5 & 1) == 0)
        {
          id v15 = [v13 action];
          if ([v15 actionType] == (id)9)
          {

LABEL_20:
            long long v48 = [MOAction alloc];
            long long v47 = +[NSUUID UUID];
            long long v49 = [v13 action];
            id v18 = [v49 actionName];
            id v19 = [v13 action];
            id v20 = [v19 actionSubtype];
            id v21 = [v13 action];
            [v21 actionNameConfidence];
            double v23 = v22;
            id v24 = [v13 action];
            [v24 actionMetaData];
            id v26 = v25 = v10;
            id v27 = [(MOAction *)v48 initWithIdentifier:v47 actionName:v18 actionType:2 actionSubtype:v20 actionNameConfidence:v26 actionMetaData:v23];
            [v13 setAction:v27];

            id v10 = v25;
            id v28 = +[NSPredicate predicateWithFormat:@"category != %lu", 22];
            id v29 = [v13 events];
            id v30 = [v29 filteredArrayUsingPredicate:v28];
            [v13 setEvents:v30];

            id v31 = [v13 events];
            id v32 = [v31 firstObject];
            uint64_t v33 = [v32 eventIdentifier];
            long long v34 = [v13 action];
            [v34 setSourceEventIdentifier:v33];

            uint64_t v35 = _mo_log_facility_get_os_log(v25);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v13;
              _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "eventBundle skips life events (fetch), bundle, %@", buf, 0xCu);
            }

            a1 = v46;
            unsigned __int8 v5 = v45;
            id v7 = v44;
            uint64_t v11 = v50;
            goto LABEL_23;
          }
          id v16 = [v13 action];
          id v17 = [v16 actionType];

          if (v17 == (id)10) {
            goto LABEL_20;
          }
        }
LABEL_23:
        id v14 = [*(id *)(a1 + 32) findRehydrateEvents:*(void *)(a1 + 48) forBundle:v13];
        id v36 = _mo_log_facility_get_os_log(v10);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          id v37 = [v14 count];
          *(_DWORD *)buf = 134217984;
          id v57 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "eventBundle with rehydrated events count: , %lu", buf, 0xCu);
        }

        if ([v14 count])
        {
          id v38 = [objc_alloc((Class)NSArray) initWithArray:v14];
          [v13 setEvents:v38];

          id v39 = _mo_log_facility_get_os_log(v10);
          id v9 = v51;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            id v40 = [v13 description];
            *(_DWORD *)buf = 138412290;
            id v57 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "eventBundle with rehydrated events: , %@", buf, 0xCu);
          }
          uint64_t v11 = v50;
        }
        else
        {
          [*(id *)(a1 + 56) addObject:v13];
          id v39 = _mo_log_facility_get_os_log(v10);
          id v9 = v51;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v13;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "eventBundle is removed in the SPI output after rehydration failure, %@", buf, 0xCu);
          }
        }

LABEL_32:
        id v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [v7 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 64) removeObjectsInArray:*(void *)(a1 + 56)];
  id v41 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerFetchEventBundlesRehydrateEventsPostProcessing", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v43 endSession];
  uint64_t v42 = *(void *)(a1 + 80);
  if (v42) {
    (*(void (**)(uint64_t, void, void))(v42 + 16))(v42, *(void *)(a1 + 64), *(void *)(a1 + 72));
  }
}

- (id)findRehydrateEvents:(id)a3 forBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = [v6 events];
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v30 + 1) + 8 * i) eventIdentifier];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v5;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        id v21 = [v20 eventIdentifier:v26];
        unsigned int v22 = [v8 containsObject:v21];

        if (v22) {
          [v7 addObject:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  double v23 = [v7 allObjects];
  id v24 = +[NSArray arrayWithArray:v23];

  return v24;
}

- (void)cleanUpEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v8 = v7;
  unint64_t v9 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesWrapper", "", buf, 2u);
  }

  id v10 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanUpEventBundlesWrapper" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v10 startSession];
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v12 = v11;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundles", "", buf, 2u);
  }

  id v13 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanUpEventBundles" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v13 startSession];
  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v15 = v14;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerCleanUpEventBundles", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v13 endSession];
  id v16 = [(MOEventBundleManager *)self eventBundleStore];
  id v17 = [v16 persistenceManager];
  id v18 = [v17 availability];

  id v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v20 = v19;
  if (v18 == (id)2)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "purge eventBundles since datastore is available", buf, 2u);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __73__MOEventBundleManager_cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke;
    v25[3] = &unk_1002CE600;
    id v27 = v6;
    unint64_t v28 = a3;
    long long v26 = v10;
    [(MOEventBundleManager *)self _cleanUpEventBundlesWithRefreshVariant:a3 andHandler:v25];
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleManager cleanUpEventBundlesWithRefreshVariant:andHandler:]();
    }

    if (v6)
    {
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      CFStringRef v31 = @"[cleanUpEventBundlesWithRefreshVariant] database is not available";
      id v21 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      unsigned int v22 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v21];

      (*((void (**)(id, void *, void *))v6 + 2))(v6, v22, &__NSDictionary0__struct);
    }
    double v23 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    id v24 = v23;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerCleanUpEventBundlesWrapper", "", buf, 2u);
    }

    [(MOPerformanceMeasurement *)v10 endSession];
  }
}

void __73__MOEventBundleManager_cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  unint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventBundleManagerCleanUpEventBundlesWrapper", "", v11, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)_cleanUpEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_group_create();
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x3032000000;
  v107[3] = __Block_byref_object_copy__19;
  v107[4] = __Block_byref_object_dispose__19;
  id v108 = objc_alloc_init((Class)NSMutableDictionary);
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x3032000000;
  v105[3] = __Block_byref_object_copy__19;
  v105[4] = __Block_byref_object_dispose__19;
  id v106 = +[NSNumber numberWithInt:0];
  v103[0] = 0;
  v103[1] = v103;
  void v103[2] = 0x3032000000;
  v103[3] = __Block_byref_object_copy__19;
  v103[4] = __Block_byref_object_dispose__19;
  id v104 = +[NSNumber numberWithInt:0];
  v101[0] = 0;
  v101[1] = v101;
  void v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__19;
  v101[4] = __Block_byref_object_dispose__19;
  id v102 = +[NSNumber numberWithInt:0];
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x3032000000;
  v99[3] = __Block_byref_object_copy__19;
  v99[4] = __Block_byref_object_dispose__19;
  id v100 = +[NSNumber numberWithInt:0];
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x3032000000;
  v97[3] = __Block_byref_object_copy__19;
  v97[4] = __Block_byref_object_dispose__19;
  id v98 = +[NSNumber numberWithInt:0];
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x3032000000;
  v95[3] = __Block_byref_object_copy__19;
  v95[4] = __Block_byref_object_dispose__19;
  id v96 = 0;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x3032000000;
  v93[3] = __Block_byref_object_copy__19;
  v93[4] = __Block_byref_object_dispose__19;
  id v94 = 0;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x3032000000;
  v91[3] = __Block_byref_object_copy__19;
  v91[4] = __Block_byref_object_dispose__19;
  id v92 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__19;
  v89[4] = __Block_byref_object_dispose__19;
  id v90 = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = __Block_byref_object_copy__19;
  v87[4] = __Block_byref_object_dispose__19;
  id v88 = 0;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  unint64_t v9 = v8;
  unint64_t v10 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeExpired", "", buf, 2u);
  }

  id v11 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanUpEventBundlesPurgeExpired" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v11 startSession];
  dispatch_group_enter(v7);
  eventBundleStore = self->_eventBundleStore;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke;
  v80[3] = &unk_1002CE628;
  unint64_t v85 = a3;
  id v13 = v11;
  long long v81 = v13;
  long long v83 = v95;
  long long v84 = v105;
  id v14 = v7;
  long long v82 = v14;
  [(MOEventBundleStore *)eventBundleStore purgeExpiredEventBundlesWithCompletionHandler:v80];
  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v16 = v15;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeNoEvents", "", buf, 2u);
  }

  id v17 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanUpEventBundlesPurgeNoEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v17 startSession];
  dispatch_group_enter(v14);
  id v18 = self->_eventBundleStore;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_738;
  v74[3] = &unk_1002CE628;
  unint64_t v79 = a3;
  id v19 = v17;
  id v75 = v19;
  long long v77 = v93;
  long long v78 = v103;
  id v20 = v14;
  long long v76 = v20;
  [(MOEventBundleStore *)v18 purgeEventBundlesWithNoEventsAssociatedWithCompletionHandler:v74];
  id v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  unsigned int v22 = v21;
  id v44 = v13;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeInvalidEvergreeen", "", buf, 2u);
  }
  double v23 = v6;

  id v24 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanUpEventBundlesPurgeInvalidEvergreen" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v24 startSession];
  dispatch_group_enter(v20);
  id v25 = self->_eventBundleStore;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_742;
  v68[3] = &unk_1002CE628;
  unint64_t v73 = a3;
  long long v26 = v24;
  __int16 v69 = v26;
  uint64_t v71 = v91;
  id v72 = v101;
  id v27 = v20;
  uint64_t v70 = v27;
  [(MOEventBundleStore *)v25 purgeInvalidEvergreenBundlesWithCompletionHandler:v68];
  unint64_t v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  long long v29 = v28;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeRehydrationFailure", "", buf, 2u);
  }

  NSErrorUserInfoKey v30 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanUpEventBundlesPurgeRehydrationFailure" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v30 startSession];
  CFStringRef v31 = [(MOEventBundleManager *)self configurationManager];
  id v32 = [v31 getIntegerSettingForKey:@"EventManagerOverrideEventsRehydrationFailureCountThreshold" withFallback:10];

  dispatch_group_enter(v27);
  long long v33 = self->_eventBundleStore;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_749;
  v62[3] = &unk_1002CE628;
  unint64_t v67 = a3;
  long long v34 = v30;
  id v63 = v34;
  id v65 = v89;
  id v66 = v99;
  uint64_t v35 = v27;
  id v64 = v35;
  [(MOEventBundleStore *)v33 purgeEventBundlesWithRehydrationFailureCount:v32 andHandler:v62];
  id v36 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v37 = v36;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerCleanUpEventBundlesPurgeDangling", "", buf, 2u);
  }

  id v38 = [[MOPerformanceMeasurement alloc] initWithName:@"CleanUpEventBundlesPurgeDangling" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v38 startSession];
  dispatch_group_enter(v35);
  id v39 = self->_eventBundleStore;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_753;
  v56[3] = &unk_1002CE628;
  unint64_t v61 = a3;
  id v40 = v38;
  id v57 = v40;
  uint64_t v59 = v87;
  id v60 = v97;
  id v41 = v35;
  id v58 = v41;
  [(MOEventBundleStore *)v39 purgeDanglingEventBundlesWithHandler:v56];
  uint64_t v42 = [(MOEventBundleManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_754;
  block[3] = &unk_1002CE650;
  long long v48 = v103;
  long long v49 = v99;
  uint64_t v50 = v97;
  id v51 = v107;
  id v46 = v23;
  long long v47 = v105;
  long long v52 = v95;
  long long v53 = v93;
  long long v54 = v89;
  long long v55 = v87;
  id v43 = v23;
  dispatch_group_notify(v41, v42, block);

  _Block_object_dispose(v87, 8);
  _Block_object_dispose(v89, 8);

  _Block_object_dispose(v91, 8);
  _Block_object_dispose(v93, 8);

  _Block_object_dispose(v95, 8);
  _Block_object_dispose(v97, 8);

  _Block_object_dispose(v99, 8);
  _Block_object_dispose(v101, 8);

  _Block_object_dispose(v103, 8);
  _Block_object_dispose(v105, 8);

  _Block_object_dispose(v107, 8);
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "EventBundleManagerCleanUpEventBundlesPurgeExpired", "", (uint8_t *)v18, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  if (v5)
  {
    unint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v5;
    id v13 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else
  {
    uint64_t v14 = [v6 objectForKey:@"resultNumberOfBundleEvents"];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) intValue];
      v18[0] = 67109120;
      v18[1] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge expired event bundles succeeded, count %i", (uint8_t *)v18, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_738(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "EventBundleManagerCleanUpEventBundlesPurgeNoEvents", "", (uint8_t *)v18, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  if (v5)
  {
    unint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_738_cold_1();
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v5;
    id v13 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else
  {
    uint64_t v14 = [v6 objectForKey:@"resultNumberOfBundleEvents"];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) intValue];
      v18[0] = 67109120;
      v18[1] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge non-evergreen event bundles with no events succeeded, count %i", (uint8_t *)v18, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_742(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "EventBundleManagerCleanUpEventBundlesPurgeInvalidEvergreeen", "", (uint8_t *)v18, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  if (v5)
  {
    unint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_742_cold_1();
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v5;
    id v13 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else
  {
    uint64_t v14 = [v6 objectForKey:@"resultNumberOfBundleEvents"];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) intValue];
      v18[0] = 67109120;
      v18[1] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge evergreen event bundles with no events succeeded, count %i", (uint8_t *)v18, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_749(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "EventBundleManagerCleanUpEventBundlesPurgeRehydrationFailure", "", (uint8_t *)v18, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  if (v5)
  {
    unint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_749_cold_1();
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v5;
    id v13 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else
  {
    uint64_t v14 = [v6 objectForKey:@"resultNumberOfBundleEvents"];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) intValue];
      v18[0] = 67109120;
      v18[1] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge bundles with rehydration failures succeeded, count %d", (uint8_t *)v18, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_753(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "EventBundleManagerCleanUpEventBundlesPurgeDangling", "", (uint8_t *)v18, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  if (v5)
  {
    unint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_753_cold_1();
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = v5;
    id v13 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else
  {
    uint64_t v14 = [v6 objectForKey:@"resultNumberOfBundleEvents"];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) intValue];
      v18[0] = 67109120;
      v18[1] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "purge dangling bundles succeeded, count %d", (uint8_t *)v18, 8u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_754(void *a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1[5] + 8) + 40) intValue];
  unsigned int v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) intValue] + v2;
  unsigned int v4 = [*(id *)(*(void *)(a1[7] + 8) + 40) intValue];
  uint64_t v5 = v3 + v4 + [*(id *)(*(void *)(a1[8] + 8) + 40) intValue];
  id v6 = *(void **)(*(void *)(a1[9] + 8) + 40);
  uint64_t v7 = +[NSNumber numberWithInt:v5];
  [v6 setObject:v7 forKey:@"resultNumberOfEvents"];

  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = [*(id *)(*(void *)(a1[5] + 8) + 40) intValue];
    unsigned int v10 = [*(id *)(*(void *)(a1[6] + 8) + 40) intValue];
    unsigned int v11 = [*(id *)(*(void *)(a1[7] + 8) + 40) intValue];
    unsigned int v12 = [*(id *)(*(void *)(a1[8] + 8) + 40) intValue];
    v16[0] = 67110144;
    v16[1] = v9;
    __int16 v17 = 1024;
    unsigned int v18 = v10;
    __int16 v19 = 1024;
    unsigned int v20 = v11;
    __int16 v21 = 1024;
    unsigned int v22 = v12;
    __int16 v23 = 1024;
    int v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "clean up event bundles completed with %d+%d+%d+%d = total %d", (uint8_t *)v16, 0x20u);
  }

  uint64_t v13 = a1[4];
  if (v13)
  {
    uint64_t v14 = *(void **)(*(void *)(a1[10] + 8) + 40);
    if (v14) {
      goto LABEL_10;
    }
    uint64_t v14 = *(void **)(*(void *)(a1[11] + 8) + 40);
    if (v14) {
      goto LABEL_10;
    }
    if (!*(void *)(*(void *)(a1[12] + 8) + 40) && !*(void *)(*(void *)(a1[13] + 8) + 40))
    {
      (*(void (**)(uint64_t, void, void))(v13 + 16))(v13, 0, *(void *)(*(void *)(a1[9] + 8) + 40));
      return;
    }
    uint64_t v14 = *(void **)(*(void *)(a1[12] + 8) + 40);
    if (v14 || (uint64_t v14 = *(void **)(*(void *)(a1[13] + 8) + 40)) != 0) {
LABEL_10:
    }
      id v15 = v14;
    else {
      id v15 = 0;
    }
    (*(void (**)(void))(a1[4] + 16))();
  }
}

- (void)clearEventBundlesWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v8 = v7;
  unint64_t v9 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)unint64_t v28 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerClearEventBundlesWrapper", "", v28, 2u);
  }

  unsigned int v10 = [[MOPerformanceMeasurement alloc] initWithName:@"ClearEventBundlesWrapper" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v10 startSession];
  if (a3 == 0xFFFF)
  {
    unsigned int v11 = [(MOEventBundleManager *)self fsmStore];
    [v11 removeAllFSMsWithCompletionHandler:&__block_literal_global_760];
  }
  unsigned int v12 = [(MOEventBundleManager *)self eventBundleStore];
  uint64_t v13 = [v12 persistenceManager];
  id v14 = [v13 availability];

  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v16 = v15;
  if (v14 == (id)2)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "clear event bundles since datastore is available", v28, 2u);
    }

    __int16 v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    unsigned int v18 = v17;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)unint64_t v28 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventBundleManagerClearEventBundles", "", v28, 2u);
    }

    __int16 v19 = [[MOPerformanceMeasurement alloc] initWithName:@"ClearEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v19 startSession];
    [(MOEventBundleManager *)self _clearEventBundles];
    [(MOEventBundleManager *)self _clearFSMs];
    unsigned int v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    __int16 v21 = v20;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)unint64_t v28 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerClearEventBundles", "", v28, 2u);
    }

    [(MOPerformanceMeasurement *)v19 endSession];
    if (v6) {
      v6[2](v6, 0, &__NSDictionary0__struct);
    }
    unsigned int v22 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    __int16 v23 = v22;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)unint64_t v28 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerClearEventBundlesWrapper", "", v28, 2u);
    }

    [(MOPerformanceMeasurement *)v10 endSession];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleManager clearEventBundlesWithRefreshVariant:andHandler:]();
    }

    if (v6)
    {
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      CFStringRef v30 = @"database is not available";
      int v24 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v25 = +[NSError errorWithDomain:@"MOErrorDomain" code:16 userInfo:v24];

      ((void (**)(id, void *, void *))v6)[2](v6, v25, &__NSDictionary0__struct);
    }
    long long v26 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    id v27 = v26;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)unint64_t v28 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, a3, "EventBundleManagerClearEventBundlesWrapper", "", v28, 2u);
    }

    [(MOPerformanceMeasurement *)v10 endSession];
  }
}

void __71__MOEventBundleManager_clearEventBundlesWithRefreshVariant_andHandler___block_invoke(id a1, NSError *a2)
{
  unsigned int v2 = a2;
  unsigned int v3 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "remove all FSM since the variant is reset, error, %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_clearEventBundles
{
  id v2 = [(MOEventBundleManager *)self eventBundleStore];
  [v2 removeAllBundlesWithCompletionHandler:&__block_literal_global_765];
}

void __42__MOEventBundleManager__clearEventBundles__block_invoke(id a1, NSError *a2)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "cleared bundle db", v3, 2u);
  }
}

- (void)_clearFSMs
{
  id v2 = [(MOEventBundleManager *)self fsmStore];
  [v2 removeAllFSMsWithCompletionHandler:&__block_literal_global_767];
}

void __34__MOEventBundleManager__clearFSMs__block_invoke(id a1, NSError *a2)
{
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "cleared FMS db", v3, 2u);
  }
}

- (BOOL)isDataDumpEnabledForTrigger:(unint64_t)a3
{
  unsigned int v5 = [(MOConfigurationManagerBase *)self->_configurationManager getBoolSettingForKey:@"BundlingDataCollectionEnabled" withFallback:0];
  if ([(MOConfigurationManagerBase *)self->_configurationManager getBoolSettingForKey:@"BundlingDataUploadEnabled" withFallback:0])
  {
    if (a3 - 1 >= 5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!v5)
  {
    if (a3 == 3)
    {
LABEL_8:
      LOBYTE(v6) = 1;
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (a3 >= 5) {
    goto LABEL_9;
  }
  return (0x1Au >> a3) & 1;
}

- (void)captureCurrentDBStateForTrigger:(unint64_t)a3 withFeedback:(id)a4 additionalMetadata:(id)a5 shouldUpload:(BOOL)a6 andHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  unsigned int v15 = [(MOEventBundleManager *)self isDataDumpEnabledForTrigger:a3];
  id v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleManager captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:]();
  }

  if (v15)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    _DWORD v18[2] = __112__MOEventBundleManager_captureCurrentDBStateForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke;
    v18[3] = &unk_1002C9A50;
    id v19 = v14;
    [(MOEventBundleManager *)self fetchAndSaveBundlingDataForTrigger:a3 withFeedback:v12 additionalMetadata:v13 shouldUpload:v8 andHandler:v18];
    __int16 v17 = v19;
LABEL_7:

    goto LABEL_8;
  }
  if (v14)
  {
    CFStringRef v20 = @"kMODataDumpEnabled";
    __int16 v21 = &__kCFBooleanFalse;
    __int16 v17 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v17);
    goto LABEL_7;
  }
LABEL_8:
}

void __112__MOEventBundleManager_captureCurrentDBStateForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = a2;
    id v6 = [a3 mutableCopy];
    [v6 setObject:&__kCFBooleanTrue forKey:@"kMODataDumpEnabled"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_getMetadataForTrigger:(unint64_t)a3
{
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)CFStringRef v30 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGetMetadata", "", v30, 2u);
  }

  id v6 = [[MOPerformanceMeasurement alloc] initWithName:@"GetMetadata" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v6 startSession];
  uint64_t v7 = objc_opt_new();
  uint64_t v9 = [(MOEventBundleManager *)self getAllowedToPromptConfiguration];
  unsigned int v10 = (void *)v9;
  if (v9) {
    unsigned int v11 = (void *)v9;
  }
  else {
    unsigned int v11 = &__NSDictionary0__struct;
  }
  [v7 setObject:v11 forKey:@"kMODataPermissions"];
  uint64_t v12 = +[MOPlatformInfo extractHardwareAndSoftwareMetadata];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = &__NSDictionary0__struct;
  }
  [v7 setObject:v14 forKey:@"kMODeviceMetadata"];
  unsigned int v15 = +[NSDate date];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;

  unsigned int v18 = +[NSNumber numberWithDouble:v17];
  [v7 setObject:v18 forKey:@"kMODataDumpTimestamp"];

  [v7 setObject:&off_1002F9870 forKey:@"kMOBundlingCollectionVersionNumber"];
  id v19 = +[NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v19 forKey:@"kMODataDumpTrigger"];

  CFStringRef v20 = [(MOEventBundleManager *)self configurationManager];
  id v21 = [v20 getIntegerSettingForKey:@"OnboardingStatus" withFallback:0];

  unsigned int v22 = +[NSNumber numberWithInt:v21];
  [v7 setObject:v22 forKey:@"kMODataOnboardingStatus"];

  __int16 v23 = [(MOEventBundleManager *)self defaultManager];
  int v24 = [v23 objectForKey:@"OnboardingDate"];

  if (v24)
  {
    [v24 timeIntervalSinceReferenceDate];
    id v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setObject:v25 forKey:@"kMODataOnboardingDate"];
  }
  long long v26 = +[NSNumber numberWithBool:[(MOEventBundleManager *)self persistBundlingDataWithoutRandomization]];
  [v7 setObject:v26 forKey:@"kMODataWithoutRandomization"];

  id v27 = [(MOEventBundleManager *)self defaultManager];
  unint64_t v28 = [v27 objectForKeyWithoutLog:@"MODataServerUploaderSubjectUUID"];

  if (v28) {
    [v7 setObject:v28 forKey:@"kMOSubjectUUID"];
  }

  return v7;
}

- (void)fetchAndSaveBundlingDataForTrigger:(unint64_t)a3 withFeedback:(id)a4 additionalMetadata:(id)a5 shouldUpload:(BOOL)a6 andHandler:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDB", "", buf, 2u);
  }

  id v14 = [[MOPerformanceMeasurement alloc] initWithName:@"CaptureCurrentDB" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v14 startSession];
  unsigned int v15 = [(MOEventBundleManager *)self configurationManager];
  unsigned int v16 = [v15 getIntegerSettingForKey:@"EventBundleManagerOverrideRefreshDataExportMaxLookBackWindowSecs" withFallback:2419200];

  double v17 = +[NSDate date];
  unsigned int v18 = [v17 dateByAddingTimeInterval:(double)-v16];
  id v19 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v18 endDate:v17];
  CFStringRef v20 = dispatch_group_create();
  [(MOEventBundleManager *)self beginDataExport];
  dispatch_group_enter(v20);
  id v21 = [(MOEventBundleManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke;
  block[3] = &unk_1002CD9F0;
  void block[4] = self;
  id v44 = v19;
  unsigned int v22 = v20;
  unsigned __int8 v45 = v22;
  id v31 = v19;
  dispatch_async(v21, block);

  dispatch_group_enter(v22);
  __int16 v23 = [(MOEventBundleManager *)self queue];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_5;
  v38[3] = &unk_1002CE778;
  id v41 = v22;
  unint64_t v42 = a3;
  v38[4] = self;
  id v39 = v11;
  id v40 = v10;
  int v24 = v22;
  id v25 = v10;
  id v26 = v11;
  dispatch_async(v23, v38);

  id v27 = [(MOEventBundleManager *)self eventBundleRanking];
  [(MOEventBundleManager *)self persistRankingModel:v27];

  unint64_t v28 = [(MOEventBundleManager *)self queue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_807;
  v34[3] = &unk_1002CE7C8;
  BOOL v37 = a6;
  uint64_t v35 = v14;
  id v36 = v12;
  void v34[4] = self;
  NSErrorUserInfoKey v29 = v14;
  id v30 = v12;
  dispatch_group_notify(v24, v28, v34);
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke(uint64_t a1)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2;
  v4[3] = &unk_1002CE700;
  v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v3 fetchAndPersistEventsForTimeInterval:v5 withHandler:v4];
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) eventManager];
  [v6 clearCache];

  if (a2)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_3;
    v9[3] = &unk_1002CE6D8;
    BOOL v8 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    id v11 = v5;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v7, v9);
  }
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_4;
  v4[3] = &unk_1002C98B8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 fetchAndPersistBundlesForTimeInterval:v2 eventsIdsToDrop:v3 withHandler:v4];
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_4(uint64_t a1)
{
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_5(uint64_t a1)
{
  v16[0] = 0;
  v16[1] = v16;
  _DWORD v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__19;
  v16[4] = __Block_byref_object_dispose__19;
  id v17 = [*(id *)(a1 + 32) _getMetadataForTrigger:*(void *)(a1 + 64)];
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerCaptureCurrentDBFetchBundleTypeDistribution", "", buf, 2u);
  }

  uint64_t v3 = [[MOPerformanceMeasurement alloc] initWithName:@"CaptureCurrentDBFetchBundleTypeDistribution" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v3 startSession];
  int v4 = [*(id *)(a1 + 32) eventBundleStore];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_800;
  v8[3] = &unk_1002CE750;
  id v14 = v16;
  id v9 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  uint64_t v7 = v3;
  id v12 = v7;
  id v13 = *(id *)(a1 + 56);
  [v4 fetchBundleTypeDistributionFromStoreWithHandler:v8];

  _Block_object_dispose(v16, 8);
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_800(uint64_t a1, void *a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_804;
  v9[3] = &unk_1002CE728;
  uint64_t v3 = *(void *)(a1 + 72);
  id v10 = @"BundleInterfaceTypeCount";
  uint64_t v11 = v3;
  [a2 enumerateKeysAndObjectsUsingBlock:v9];
  if (*(void *)(a1 + 32)) {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addEntriesFromDictionary:];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v4 forKey:@"kMOBundleFeedback"];
  }
  [*(id *)(a1 + 48) persistMetadata:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDBFetchBundleTypeDistribution", "", v8, 2u);
  }

  [*(id *)(a1 + 56) endSession];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_804(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 stringValue];
  id v10 = [v5 stringByAppendingString:v7];

  BOOL v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v9 = [v6 stringValue];

  [v8 setObject:v9 forKey:v10];
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_807(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_808;
  v4[3] = &unk_1002CE7A0;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v2 finalizeDataExportWithUpload:v3 handler:v4];
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_808(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_808_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "JSON data dump complete.", buf, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerCaptureCurrentDB", "", v11, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)_generateClusterAndAnomalyBundlesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Start bundle clustering", buf, 2u);
  }

  id v6 = +[NSDate date];
  uint64_t v7 = [(MOEventBundleManager *)self onboardingAndSettingsPersistence];
  BOOL v8 = [v7 getSnapshotDictionaryForAnalytics];

  uint64_t v9 = [v6 dateByAddingTimeInterval:-2419200.0];
  id v10 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v9 endDate:v6];
  uint64_t v11 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:v10 ascending:1 limit:0 includeDeletedBundles:0 skipRanking:0];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesFetchBundles", "", buf, 2u);
  }

  id v13 = [[MOPerformanceMeasurement alloc] initWithName:@"GenerateClusterBundlesFetchBundles" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v13 startSession];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke;
  v17[3] = &unk_1002CE840;
  unsigned int v18 = v13;
  id v19 = self;
  id v20 = v8;
  id v21 = v4;
  id v14 = v8;
  id v15 = v4;
  unsigned int v16 = v13;
  [(MOEventBundleManager *)self fetchEventBundlesWithOptions:v11 CompletionHandler:v17];
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesFetchBundles", "", buf, 2u);
  }

  [a1[4] endSession];
  uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v12 = v11;
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_2(v7, v12);
    }

    unsigned __int8 v45 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002F57F8, &off_1002F5810, &off_1002F5828, &off_1002F57B0, 0);
    uint64_t v13 = +[NSPredicate predicateWithFormat:@"bundleSuperType in %@", v45];
    id v43 = +[NSPredicate predicateWithFormat:@"isAggregatedAndSuppressed == NO AND summarizationGranularity != %lu", 2];
    id v44 = (void *)v13;
    v61[0] = v13;
    v61[1] = v43;
    id v14 = +[NSArray arrayWithObjects:v61 count:2];
    id v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];

    unsigned int v16 = [v7 filteredArrayUsingPredicate:v15];
    id v17 = [v16 count];
    unsigned int v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_1();
    }

    id v19 = [a1[5] bundleClusteringManager];
    id v20 = [v19 getClusteringParams];

    if ((unint64_t)[v16 count] < 0x1F5)
    {
      if (v20)
      {
        id v26 = [v16 count];
        if (v26 > [v20 minClusterSize])
        {
          id v27 = [a1[5] bundleClusteringManager];
          unint64_t v28 = [v27 getEmbeddingsFromBundles:v16 forEmbeddingType:1];

          NSErrorUserInfoKey v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v30 = [v28 count];
            *(_DWORD *)buf = 134217984;
            id v56 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Embedding extraction completed. embedding count=%lu. Attempting to run clustering alg", buf, 0xCu);
          }

          id v31 = [a1[5] bundleClusteringManager];
          [v31 runHDBSCANClusteringOn:v28];

          id v32 = [a1[5] bundleClusteringManager];
          unsigned int v33 = [v32 isClusteringResultValid];

          long long v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
          if (v33)
          {
            if (v35)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Valid cluster labels were generated. Attempting to generate cluster bundles and annotate anomaly bundles", buf, 2u);
            }

            unint64_t v42 = [a1[5] bundleClusteringManager];
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_824;
            v46[3] = &unk_1002CE818;
            id v36 = a1[7];
            id v37 = a1[5];
            id v50 = v36;
            v46[4] = v37;
            id v47 = v16;
            id v48 = v28;
            id v49 = a1[6];
            [v42 annotateAnomalyBundles:v47 withEmbeddings:v48 handler:v46];

            id v38 = v50;
          }
          else
          {
            if (v35)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Cluster labels are invalid: It is either not generated from HDBSCAN or all the inputs are clustered into one group. Skipping cluster & anomaly bundle generation", buf, 2u);
            }

            id v41 = (void (**)(id, void, void *))a1[7];
            v51[0] = @"resultClusterBundleGenerationSuccess";
            v51[1] = @"resultNumberOfClusterBundles";
            v52[0] = &off_1002F5768;
            v52[1] = &off_1002F5768;
            v51[2] = @"resultOutlierBundleGenerationSuccess";
            v51[3] = @"resultNumberOfOutlierBundles";
            v52[2] = &off_1002F5768;
            v52[3] = &off_1002F5768;
            id v38 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
            v41[2](v41, 0, v38);
          }

          goto LABEL_27;
        }
      }
      id v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        id v40 = [v20 minClusterSize];
        *(_DWORD *)buf = 134218240;
        id v56 = v17;
        __int16 v57 = 2048;
        id v58 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[GenerateClusterBundles] Clustering params are not set or Filtered bundle count (%lu) is less than minClusterSize (%lu). Skip clustering", buf, 0x16u);
      }

      __int16 v23 = (void (**)(id, void, void *))a1[7];
      v53[0] = @"resultClusterBundleGenerationSuccess";
      v53[1] = @"resultNumberOfClusterBundles";
      v54[0] = &off_1002F5768;
      v54[1] = &off_1002F5768;
      v53[2] = @"resultOutlierBundleGenerationSuccess";
      v53[3] = @"resultNumberOfOutlierBundles";
      v54[2] = &off_1002F5768;
      v54[3] = &off_1002F5768;
      int v24 = v54;
      id v25 = v53;
    }
    else
    {
      id v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = [v16 count];
        *(_DWORD *)buf = 134218240;
        id v56 = v22;
        __int16 v57 = 1024;
        LODWORD(v58) = 500;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[GenerateClusterBundles] Clustering input count (%lu) is more than max limit (%u). Skip clustering", buf, 0x12u);
      }

      __int16 v23 = (void (**)(id, void, void *))a1[7];
      v59[0] = @"resultClusterBundleGenerationSuccess";
      v59[1] = @"resultNumberOfClusterBundles";
      v60[0] = &off_1002F5768;
      v60[1] = &off_1002F5768;
      v59[2] = @"resultOutlierBundleGenerationSuccess";
      v59[3] = @"resultNumberOfOutlierBundles";
      v60[2] = &off_1002F5768;
      v60[3] = &off_1002F5768;
      int v24 = v60;
      id v25 = v59;
    }
    unint64_t v28 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v25 count:4];
    v23[2](v23, 0, v28);
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_3();
  }

  (*((void (**)(void))a1[7] + 2))();
LABEL_28:
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_824(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v25 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Annotated %lu bundles as anomaly", buf, 0xCu);
  }

  if (v6)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while annotating anomaly bundles, error, %@", buf, 0xCu);
    }

    id v9 = (void (**)(id, id, void *))a1[8];
    v22[0] = @"resultClusterBundleGenerationSuccess";
    v22[1] = @"resultNumberOfClusterBundles";
    v23[0] = &off_1002F5768;
    v23[1] = &off_1002F5768;
    v22[2] = @"resultOutlierBundleGenerationSuccess";
    v22[3] = @"resultNumberOfOutlierBundles";
    v23[2] = &off_1002F5768;
    v23[3] = &off_1002F5768;
    id v10 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    v9[2](v9, v6, v10);
  }
  else if ([v5 count])
  {
    uint64_t v11 = [a1[4] eventBundleStore];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_827;
    v15[3] = &unk_1002CE7F0;
    id v21 = a1[8];
    id v12 = v5;
    id v13 = a1[4];
    id v16 = v12;
    id v17 = v13;
    id v18 = a1[7];
    id v19 = a1[5];
    id v20 = a1[6];
    [v11 updateEventBundles:v12 CompletionHandler:v15];

    id v10 = v21;
  }
  else
  {
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] No anomaly bundle was detected. Skiping anomaly bundle annotation.", buf, 2u);
    }

    id v10 = objc_opt_new();
    [v10 setObject:&off_1002F58E8 forKeyedSubscript:@"resultOutlierBundleGenerationSuccess"];
    [v10 setObject:&off_1002F5768 forKeyedSubscript:@"resultNumberOfOutlierBundles"];
    [a1[4] _processClusterBundles:a1[5] withEmbeddings:a1[6] onboardingStatus:a1[7] result:v10 andHandler:a1[8]];
  }
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_827(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while updating annotated anomaly bundles, result, %@, error, %@", buf, 0x16u);
    }

    uint64_t v9 = *(void *)(a1 + 72);
    v17[0] = @"resultClusterBundleGenerationSuccess";
    v17[1] = @"resultNumberOfClusterBundles";
    v18[0] = &off_1002F5768;
    v18[1] = &off_1002F5768;
    v17[2] = @"resultOutlierBundleGenerationSuccess";
    v17[3] = @"resultNumberOfOutlierBundles";
    _DWORD v18[2] = &off_1002F5768;
    v18[3] = &off_1002F5768;
    id v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Annomaly bundles are annotated and saved. result, %@, error, %@", buf, 0x16u);
    }

    id v10 = objc_opt_new();
    [v10 setObject:&off_1002F58E8 forKeyedSubscript:@"resultOutlierBundleGenerationSuccess"];
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) count]);
    [v10 setObject:v11 forKeyedSubscript:@"resultNumberOfOutlierBundles"];

    if (+[MOPlatformInfo isInternalBuild])
    {
      id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Submit internal anomaly bundle analytics", buf, 2u);
      }

      id v13 = [*(id *)(a1 + 40) bundleClusteringManager];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = +[NSDate date];
      [v13 submitAnomalyBundleInternalAnalytics:v14 withOnboardingStatus:v15 andSubmissionDate:v16];
    }
    [*(id *)(a1 + 40) _processClusterBundles:*(void *)(a1 + 56) withEmbeddings:*(void *)(a1 + 64) onboardingStatus:*(void *)(a1 + 48) result:v10 andHandler:*(void *)(a1 + 72)];
  }
}

- (void)_processClusterBundles:(id)a3 withEmbeddings:(id)a4 onboardingStatus:(id)a5 result:(id)a6 andHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v15) {
    id v15 = (id)objc_opt_new();
  }
  id v17 = [(MOEventBundleManager *)self bundleClusteringManager];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke;
  v21[3] = &unk_1002CAE48;
  id v22 = v15;
  __int16 v23 = self;
  id v24 = v14;
  id v25 = v16;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  [v17 generateClusterBundles:v12 withEmbeddings:v13 handler:v21];
}

void __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while generating cluster bundles %@", buf, 0xCu);
    }

    [a1[4] setObject:&off_1002F5768 forKeyedSubscript:@"resultClusterBundleGenerationSuccess"];
    [a1[4] setObject:&off_1002F5768 forKeyedSubscript:@"resultNumberOfClusterBundles"];
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      id v24 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Generated %lu cluster bundles", buf, 0xCu);
    }

    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
    [a1[4] setObject:v9 forKeyedSubscript:@"resultNumberOfClusterBundles"];

    if ([v5 count])
    {
      id v10 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:0 ascending:1 limit:0 includeDeletedBundles:1 skipRanking:1 interfaceType:15];
      uint64_t v11 = [a1[5] eventBundleStore];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      _DWORD v16[2] = __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_828;
      v16[3] = &unk_1002CAEC0;
      int8x16_t v15 = *((int8x16_t *)a1 + 2);
      id v12 = (id)v15.i64[0];
      int8x16_t v17 = vextq_s8(v15, v15, 8uLL);
      id v20 = a1[7];
      id v18 = v5;
      id v19 = a1[6];
      [v11 fetchEventBundleWithOptions:v10 CompletionHandler:v16];
    }
    else
    {
      id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] cluster bundle count is zero.", buf, 2u);
      }

      id v14 = (void (**)(id, void, MOEventBundleFetchOptions *))a1[7];
      v21[0] = @"resultClusterBundleGenerationSuccess";
      v21[1] = @"resultNumberOfClusterBundles";
      v22[0] = &off_1002F5768;
      v22[1] = &off_1002F5768;
      v21[2] = @"resultOutlierBundleGenerationSuccess";
      v21[3] = @"resultNumberOfOutlierBundles";
      v22[2] = &off_1002F5768;
      v22[3] = &off_1002F5768;
      id v10 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
      v14[2](v14, 0, v10);
    }
  }
}

void __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_828(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_828_cold_1(v3, v4);
  }

  if ([v3 count])
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesRemoveExistingClusterBundles", "", buf, 2u);
    }

    id v6 = [[MOPerformanceMeasurement alloc] initWithName:@"GenerateClusterBundlesRemoveEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v6 startSession];
    id v7 = [a1[4] eventBundleStore];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_832;
    v29[3] = &unk_1002CE868;
    BOOL v8 = (id *)&v30;
    id v30 = v6;
    uint64_t v9 = (id *)v31;
    v31[0] = a1[5];
    id v10 = &v34;
    id v11 = a1[8];
    id v12 = a1[4];
    id v34 = v11;
    v31[1] = v12;
    id v13 = &v32;
    id v32 = a1[6];
    id v14 = &v33;
    id v33 = a1[7];
    int8x16_t v15 = v6;
    [v7 removeEventBundles:v3 CompletionHandler:v29];
  }
  else
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] no existing bundles in current DB. saving new cluster bundles", buf, 2u);
    }

    int8x16_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", "", buf, 2u);
    }

    id v18 = [[MOPerformanceMeasurement alloc] initWithName:@"GenerateClusterBundlesSaveEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v18 startSession];
    id v19 = a1[6];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_844;
    v23[3] = &unk_1002CE868;
    BOOL v8 = (id *)&v24;
    id v24 = v18;
    uint64_t v9 = (id *)v25;
    id v20 = a1[4];
    v25[0] = a1[5];
    id v10 = &v28;
    id v21 = a1[8];
    id v22 = a1[4];
    id v28 = v21;
    v25[1] = v22;
    id v13 = &v26;
    id v26 = a1[6];
    id v14 = &v27;
    id v27 = a1[7];
    int8x16_t v15 = v18;
    [v20 saveEventBundles:v19 handler:v23];
  }
}

void __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_832(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesRemoveExistingClusterBundles", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  BOOL v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while removing existing cluster bundles. result, %@ error, %@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:&off_1002F5768 forKeyedSubscript:@"resultClusterBundleGenerationSuccess"];
    [*(id *)(a1 + 40) addEntriesFromDictionary:v6];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Removed existing cluster bundles. Result, %@", buf, 0xCu);
    }

    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesPurgeExistingClusterBundles", "", buf, 2u);
    }

    id v11 = [[MOPerformanceMeasurement alloc] initWithName:@"GenerateClusterBundlesPurgeEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v11 startSession];
    id v12 = [*(id *)(a1 + 48) eventBundleStore];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_836;
    v17[3] = &unk_1002CE868;
    id v18 = v11;
    id v19 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 48);
    int8x16_t v15 = *(void **)(a1 + 56);
    id v23 = v13;
    uint64_t v20 = v14;
    id v21 = v15;
    id v22 = *(id *)(a1 + 64);
    id v16 = v11;
    [v12 purgeDeletedEventBundlesWithCompletionHandler:v17];
  }
}

void __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_836(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesPurgeExistingClusterBundles", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  BOOL v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while purging existing cluster bundles. result, %@ error, %@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:&off_1002F5768 forKeyedSubscript:@"resultClusterBundleGenerationSuccess"];
    [*(id *)(a1 + 40) addEntriesFromDictionary:v6];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Purged existing cluster bundles. Result, %@", buf, 0xCu);
    }

    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", "", buf, 2u);
    }

    id v11 = [[MOPerformanceMeasurement alloc] initWithName:@"GenerateClusterBundlesSaveEventBundles" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v11 startSession];
    id v12 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    _DWORD v18[2] = __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_840;
    v18[3] = &unk_1002CE868;
    id v19 = v11;
    id v20 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(void **)(a1 + 56);
    id v24 = v14;
    uint64_t v21 = v15;
    id v22 = v16;
    id v23 = *(id *)(a1 + 64);
    int8x16_t v17 = v11;
    [v12 saveEventBundles:v13 handler:v18];
  }
}

void __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_840(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", "", (uint8_t *)&v23, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  BOOL v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v23 = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while saving cluster bundles, result, %@, error, %@", (uint8_t *)&v23, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:&off_1002F5768 forKeyedSubscript:@"resultClusterBundleGenerationSuccess"];
    [*(id *)(a1 + 40) addEntriesFromDictionary:v6];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (v9)
    {
      int v23 = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Cluster bundle saved. result, %@, error, %@", (uint8_t *)&v23, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:&off_1002F58E8 forKeyedSubscript:@"resultClusterBundleGenerationSuccess"];
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = *(void **)(a1 + 40);
      int v23 = 138412290;
      id v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Process completed. Result: %@", (uint8_t *)&v23, 0xCu);
    }

    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v12))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", "", (uint8_t *)&v23, 2u);
    }

    uint64_t v13 = [[MOPerformanceMeasurement alloc] initWithName:@"GenerateClusterBundlesSubmitClusterBundleAnalytics" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v13 startSession];
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Start Biome donation for cluster bundles", (uint8_t *)&v23, 2u);
    }

    uint64_t v15 = [*(id *)(a1 + 48) biomeManager];
    [v15 donateEvents:0 andBundles:*(void *)(a1 + 56) andOnboardingStatus:*(void *)(a1 + 64)];

    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Completed biome donation for cluster bundles.", (uint8_t *)&v23, 2u);
    }

    int8x16_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v17))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", "", (uint8_t *)&v23, 2u);
    }

    [(MOPerformanceMeasurement *)v13 endSession];
    if (+[MOPlatformInfo isInternalBuild])
    {
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Submit internal cluster bundle analytics", (uint8_t *)&v23, 2u);
      }

      id v19 = [*(id *)(a1 + 48) bundleClusteringManager];
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 64);
      id v22 = +[NSDate date];
      [v19 submitClusterBundleInternalAnalytics:v20 withOnboardingStatus:v21 andSubmissionDate:v22];
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_844(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSaveClusterBundles", "", (uint8_t *)&v23, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  BOOL v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v23 = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Error while saving cluster bundles, result, %@, error, %@", (uint8_t *)&v23, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:&off_1002F5768 forKeyedSubscript:@"resultClusterBundleGenerationSuccess"];
    [*(id *)(a1 + 40) addEntriesFromDictionary:v6];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (v9)
    {
      int v23 = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Cluster bundle saved. result, %@, error, %@", (uint8_t *)&v23, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:&off_1002F58E8 forKeyedSubscript:@"resultClusterBundleGenerationSuccess"];
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = *(void **)(a1 + 40);
      int v23 = 138412290;
      id v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[GenerateClusterAndAnomalyBundles] Process completed. Result:%@", (uint8_t *)&v23, 0xCu);
    }

    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v12))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", "", (uint8_t *)&v23, 2u);
    }

    uint64_t v13 = [[MOPerformanceMeasurement alloc] initWithName:@"GenerateClusterBundlesSubmitClusterBundleAnalytics" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v13 startSession];
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Biome donation for cluster bundles", (uint8_t *)&v23, 2u);
    }

    uint64_t v15 = [*(id *)(a1 + 48) biomeManager];
    [v15 donateEvents:0 andBundles:*(void *)(a1 + 56) andOnboardingStatus:*(void *)(a1 + 64)];

    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "finished biome donation for cluster bundles.", (uint8_t *)&v23, 2u);
    }

    int8x16_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v17))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventBundleManagerGenerateClusterAndAnomalyBundlesSubmitClusterBundleAnalytics", "", (uint8_t *)&v23, 2u);
    }

    [(MOPerformanceMeasurement *)v13 endSession];
    if (+[MOPlatformInfo isInternalBuild])
    {
      id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Submit internal cluster bundle analytics", (uint8_t *)&v23, 2u);
      }

      id v19 = [*(id *)(a1 + 48) bundleClusteringManager];
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 64);
      id v22 = +[NSDate date];
      [v19 submitClusterBundleInternalAnalytics:v20 withOnboardingStatus:v21 andSubmissionDate:v22];
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MOEventBundleStore)eventBundleStore
{
  return self->_eventBundleStore;
}

- (void)setEventBundleStore:(id)a3
{
}

- (MOFSMStore)fsmStore
{
  return self->_fsmStore;
}

- (void)setFsmStore:(id)a3
{
}

- (BOOL)enableSemanticPruning
{
  return self->_enableSemanticPruning;
}

- (void)setEnableSemanticPruning:(BOOL)a3
{
  self->_BOOL enableSemanticPruning = a3;
}

- (MODefaultsManager)defaultManager
{
  return self->_defaultManager;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (void)setEngagementHistoryManager:(id)a3
{
}

- (MOEventBundleRanking)eventBundleRanking
{
  return self->_eventBundleRanking;
}

- (void)setEventBundleRanking:(id)a3
{
}

- (MODataExportManager)exportManager
{
  return self->_exportManager;
}

- (void)setExportManager:(id)a3
{
}

- (MOBundleClusteringManager)bundleClusteringManager
{
  return self->_bundleClusteringManager;
}

- (void)setBundleClusteringManager:(id)a3
{
}

- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence
{
  return self->_onboardingAndSettingsPersistence;
}

- (MOBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
}

- (MOEngagementAndSuggestionAnalyticsManager)engagementAndSuggestionAnalyticsManager
{
  return self->_engagementAndSuggestionAnalyticsManager;
}

- (void)setEngagementAndSuggestionAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementAndSuggestionAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_bundleClusteringManager, 0);
  objc_storeStrong((id *)&self->_exportManager, 0);
  objc_storeStrong((id *)&self->_eventBundleRanking, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_defaultManager, 0);
  objc_storeStrong((id *)&self->_fsmStore, 0);
  objc_storeStrong((id *)&self->_eventBundleStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);

  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventBundleStore", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: defaultManager", v2, v3, v4, v5, v6);
}

- (void)bundleEventsWithRefreshVariant:andHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to bundle event since datastore is not available", v2, v3, v4, v5, v6);
}

void __67__MOEventBundleManager__bundleEventsWithRefreshVariant_andHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Fetching events for bundling failed. reason, %@", v2, v3, v4, v5, v6);
}

- (void)_filterPreOnboardedVisitEvents:(uint64_t)a1 handler:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [OUTLINED_FUNCTION_2_1(a1, a2) routineEvent];
  unsigned int v5 = [v4 isPreOnboardedVisit];
  _DWORD *v3 = 67109120;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_6_1((void *)&_mh_execute_header, v6, v7, "filterPreOnboardedVisitEvents, adding event visit to PreOnboardedVisit event array,isPreOnboarded,%d");
}

- (void)_filterPreOnboardedVisitEvents:(uint64_t)a1 handler:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [OUTLINED_FUNCTION_2_1(a1, a2) routineEvent];
  unsigned int v5 = [v4 isPreOnboardedVisit];
  _DWORD *v3 = 67109120;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_6_1((void *)&_mh_execute_header, v6, v7, "filterPreOnboardedVisitEvents, adding event visit to rest event array,isPreOnboarded,%d");
}

- (void)_filterPreOnboardedVisitEvents:(uint64_t)a1 handler:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  id v5 = [[(id)OUTLINED_FUNCTION_2_1(a1, a2) category];
  *(_DWORD *)uint64_t v4 = 134217984;
  void *v3 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "filterPreOnboardedVisitEvents, adding event category %lu, to rest event array", v4, 0xCu);
}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error was issued during CA submission of user age and gender. Error: %@", v2, v3, v4, v5, v6);
}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error was issued during fetching of age. Error: %@", v2, v3, v4, v5, v6);
}

void __68__MOEventBundleManager_submitMOEventData_startDate_endDate_subDate___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error was issued during fetching of gender. Error: %@", v2, v3, v4, v5, v6);
}

- (void)submitEventBundleInternalAnalytics:(uint8_t *)buf withSubmissionDate:(void *)a2 withRefreshVariant:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = @"com.apple.Moments.MOEventBundle";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CA payload (%@) is nil. Skip submission", buf, 0xCu);
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_692_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "save event bundles hit error, %@", v2, v3, v4, v5, v6);
}

void __71__MOEventBundleManager_saveEventBundles_withStartDate_endDate_handler___block_invoke_693_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "remove event bundles hit error, %@", v2, v3, v4, v5, v6);
}

- (void)fetchEventBundlesWithOptions:CompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to fetch event bundles since datastore is not available", v2, v3, v4, v5, v6);
}

void __72__MOEventBundleManager__fetchEventBundlesWithOptions_CompletionHandler___block_invoke_707_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch event bundles hit error, %@", v2, v3, v4, v5, v6);
}

void __59__MOEventBundleManager__rehydrateEventBundles_withHandler___block_invoke_711_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "eventBundle enable life events (rehydrate events), %lu", v2, v3, v4, v5, v6);
}

- (void)cleanUpEventBundlesWithRefreshVariant:andHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to purge eventBundles since datastore is not available", v2, v3, v4, v5, v6);
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge expired event bundles hit error, %@", v2, v3, v4, v5, v6);
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_738_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge non-evergreen event bundles with no events hit error, %@", v2, v3, v4, v5, v6);
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_742_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge evergreen event bundles with no events hit error, %@", v2, v3, v4, v5, v6);
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_749_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge bundles with rehydration failures hit error, %@", v2, v3, v4, v5, v6);
}

void __74__MOEventBundleManager__cleanUpEventBundlesWithRefreshVariant_andHandler___block_invoke_753_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge dangling bundles hit error, %@", v2, v3, v4, v5, v6);
}

- (void)clearEventBundlesWithRefreshVariant:andHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "unable to clear event bundles since datastore is not available", v2, v3, v4, v5, v6);
}

- (void)captureCurrentDBStateForTrigger:withFeedback:additionalMetadata:shouldUpload:andHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Bundling input/output data collection is %s", v2, v3, v4, v5, v6);
}

void __115__MOEventBundleManager_fetchAndSaveBundlingDataForTrigger_withFeedback_additionalMetadata_shouldUpload_andHandler___block_invoke_2_808_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "JSON data dump error: %@", v2, v3, v4, v5, v6);
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "[GenerateClusterBundles] Filtered bundle count for embedding extraction: %lu", v2, v3, v4, v5, v6);
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  id v4 = [a1 count];
  uint64_t v5 = [a1 valueForKeyPath:@"@min.startDate"];
  uint8_t v6 = [a1 valueForKeyPath:@"@max.startDate"];
  int v7 = 134218498;
  id v8 = v4;
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[GenerateClusterAndAnomalyBundles] Fetched input bundle: count=%lu, date range=%@-%@", (uint8_t *)&v7, 0x20u);
}

void __69__MOEventBundleManager__generateClusterAndAnomalyBundlesWithHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[GenerateClusterAndAnomalyBundles] Error occurred while fetching input bundles. Error, %@", v2, v3, v4, v5, v6);
}

void __97__MOEventBundleManager__processClusterBundles_withEmbeddings_onboardingStatus_result_andHandler___block_invoke_828_cold_1(void *a1, NSObject *a2)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[GenerateClusterAndAnomalyBundles] Existing cluster Bundle count:%lu", v3, 0xCu);
}

@end