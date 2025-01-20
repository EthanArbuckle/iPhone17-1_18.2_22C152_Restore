@interface MOEngagementAndSuggestionAnalyticsManager
+ (id)getDefaultAnalyticsResultWithOnboardingStatus:(id)a3;
- (BOOL)isReadyToSubmitAnalytics;
- (MOConfigurationManager)configurationManager;
- (MODefaultsManager)defaultsManager;
- (MOEngagementAndSuggestionAnalyticsManager)initWithUniverse:(id)a3;
- (MOEngagementHistoryManager)engagementHistoryManager;
- (MOEventBundleStore)eventBundleStore;
- (NSDate)lastAnalyticsSubmissionDate;
- (float)minimumTimeGapBetweenSubmissionsInDays;
- (id)setLastAnalyticsSubmissionDate;
- (void)_submitSuggestionPerformanceAnalyticsFromEventBundles:(id)a3 WithOnboardingStatus:(id)a4 andCompletionResult:(id)a5;
- (void)isReadyToSubmitAnalytics;
- (void)setConfigurationManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setEngagementHistoryManager:(id)a3;
- (void)setEventBundleStore:(id)a3;
- (void)submitEngagementAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4;
- (void)submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4;
- (void)submitSuggestionPerformanceAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4;
@end

@implementation MOEngagementAndSuggestionAnalyticsManager

- (MOEngagementAndSuggestionAnalyticsManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MOEngagementAndSuggestionAnalyticsManager;
  v5 = [(MOEngagementAndSuggestionAnalyticsManager *)&v32 init];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 getService:v7];
    defaultsManager = v5->_defaultsManager;
    v5->_defaultsManager = (MODefaultsManager *)v8;

    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = [v4 getService:v11];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v12;

    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    uint64_t v16 = [v4 getService:v15];
    engagementHistoryManager = v5->_engagementHistoryManager;
    v5->_engagementHistoryManager = (MOEngagementHistoryManager *)v16;

    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = [v4 getService:v19];
    eventBundleStore = v5->_eventBundleStore;
    v5->_eventBundleStore = (MOEventBundleStore *)v20;

    v22 = [(MOEngagementAndSuggestionAnalyticsManager *)v5 configurationManager];
    LODWORD(v23) = 28.0;
    [v22 getFloatSettingForKey:@"minimumTimeGapBetweenAnalyticsSubmissionsInDays" withFallback:v23];
    v5->_double minimumTimeGapBetweenSubmissionsInDays = v24;

    lastAnalyticsSubmissionDate = v5->_lastAnalyticsSubmissionDate;
    v5->_lastAnalyticsSubmissionDate = 0;

    v26 = [(MOEngagementAndSuggestionAnalyticsManager *)v5 defaultsManager];
    v27 = [v26 objectForKey:@"LastAnalyticsSubmissionDate"];

    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_lastAnalyticsSubmissionDate, v27);
      }
    }
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = v5->_lastAnalyticsSubmissionDate;
      double minimumTimeGapBetweenSubmissionsInDays = v5->_minimumTimeGapBetweenSubmissionsInDays;
      *(_DWORD *)buf = 138412546;
      v34 = v29;
      __int16 v35 = 2048;
      double v36 = minimumTimeGapBetweenSubmissionsInDays;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "EngagementAndSuggestionAnalyticsManager is initialized: lastAnalyticsSubmissionDate=%@ minimumTimeGapBetweenSubmissionsInDays=%.1f", buf, 0x16u);
    }
  }
  return v5;
}

- (void)submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitSuggestionPerformanceAnalytics", "", buf, 2u);
  }

  v9 = [[MOPerformanceMeasurement alloc] initWithName:@"SubmitSuggestionPerformanceAnalytics" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v9 startSession];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke;
  v13[3] = &unk_1002D1220;
  v14 = v9;
  v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v6;
  id v11 = v7;
  uint64_t v12 = v9;
  [(MOEngagementAndSuggestionAnalyticsManager *)self submitSuggestionPerformanceAnalyticsWithOnboardingStatus:v10 AndCompletionHandler:v13];
}

void __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitSuggestionPerformanceAnalytics", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[submitSuggestionPerformanceAnalytics] result:%@, error:%@", buf, 0x16u);
  }

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = objc_opt_new();
    [v9 addEntriesFromDictionary:v6];
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitEngagementAnalytics", "", buf, 2u);
    }

    id v11 = [[MOPerformanceMeasurement alloc] initWithName:@"SubmitEngagementAnalytics" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v11 startSession];
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_112;
    v17[3] = &unk_1002D11F8;
    v18 = v11;
    id v19 = v9;
    id v14 = *(id *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = v14;
    id v15 = v9;
    id v16 = v11;
    [v12 submitEngagementAnalyticsWithOnboardingStatus:v13 AndCompletionHandler:v17];
  }
}

void __136__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAndSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "SubmitEngagementAndSuggestionPerformanceAnalyticssubmitEngagementAnalytics", "", (uint8_t *)&v13, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[submitEngagementAnalytics] result:%@, error:%@", (uint8_t *)&v13, 0x16u);
  }

  if (v6 && [v6 count]) {
    [*(id *)(a1 + 40) addEntriesFromDictionary:v6];
  }
  if (v5)
  {
    v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v10 = [*(id *)(a1 + 48) setLastAnalyticsSubmissionDate];
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:@"lastAnalyticsSubmissionDate"];

    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void **)(a1 + 40);
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[submitEngagementAndSuggestionPerformanceAnalytics] completed analytics submission. Result:%@", (uint8_t *)&v13, 0xCu);
    }

    v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v9();
}

- (void)submitEngagementAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  v34 = objc_opt_new();
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Submitting engagement metric analytics", buf, 2u);
  }

  v9 = +[NSDate date];
  id v10 = [(MOEngagementAndSuggestionAnalyticsManager *)self engagementHistoryManager];
  id v11 = [v9 dateByAddingTimeInterval:-2419200.0];
  id v53 = 0;
  uint64_t v12 = [v10 fetchSuggestionEngagementEventsWithTypes:&off_1002F9368 fromStartDate:v11 toEndDate:v9 withError:&v53];
  id v13 = v53;

  id v14 = [(MOEngagementAndSuggestionAnalyticsManager *)self engagementHistoryManager];
  __int16 v15 = [v9 dateByAddingTimeInterval:-2419200.0];
  id v52 = v13;
  id v16 = [v14 fetchAppEntryEngagementEventsWithTypes:&off_1002F9380 fromStartDate:v15 toEndDate:v9 withError:&v52];
  id v33 = v52;

  if (v33)
  {
    id v17 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[submitEngagementAnalytics] Biome sink error:%@", buf, 0xCu);
    }

    v7[2](v7, v33, 0);
  }
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v12 count];
    id v20 = [v16 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Total fetched suggestion engagement event count: %lu, journal entry engagement event count: %lu", buf, 0x16u);
  }

  id v21 = +[MOEngagementAndSuggestionAnalyticsParams aggregationWindowMap];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  [v9 timeIntervalSince1970];
  uint64_t v23 = v22;
  __int16 v24 = +[MOEngagementAndSuggestionAnalyticsParams bundleSubTypeToAnalyticsSuggestionTypeMap];
  +[MOEngagementAndSuggestionAnalyticsParams aggregatedEngagementAnalyticsAddressMap];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke;
  v35[3] = &unk_1002D1298;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v36 = v25;
  uint64_t v47 = v23;
  id v26 = v16;
  id v37 = v26;
  v38 = &off_1002F9398;
  id v27 = v6;
  id v39 = v27;
  v45 = buf;
  id v28 = v12;
  id v40 = v28;
  v41 = &off_1002F93B0;
  v42 = &off_1002F93E0;
  v43 = &off_1002F93C8;
  id v29 = v24;
  id v44 = v29;
  v46 = &v48;
  [v21 enumerateKeysAndObjectsUsingBlock:v35];
  v30 = +[NSNumber numberWithUnsignedInteger:v49[3]];
  [v34 setObject:v30 forKeyedSubscript:@"suggestionEngagementAnalyticsPayloadCount"];

  v31 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)&buf[8] + 24)];
  [v34 setObject:v31 forKeyedSubscript:@"journalEntryEngagementAnalyticsPayloadCount"];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(buf, 8);

  ((void (**)(id, id, void *))v7)[2](v7, 0, v34);
}

void __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v156 = a1;
  v146 = v5;
  v138 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v219[0] = _NSConcreteStackBlock;
  v219[1] = 3221225472;
  v219[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2;
  v219[3] = &unk_1002D1248;
  uint64_t v221 = *(void *)(a1 + 120);
  id v147 = v6;
  id v220 = v147;
  v128 = +[NSPredicate predicateWithBlock:v219];
  v145 = [*(id *)(a1 + 40) filteredArrayUsingPredicate:v128];
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v145 count];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v147;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Journal entryengagement event count from the last %@days=%lu", buf, 0x16u);
  }

  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id obj = *(id *)(a1 + 48);
  id v9 = [obj countByEnumeratingWithState:&v215 objects:v233 count:16];
  if (v9)
  {
    uint64_t v164 = *(void *)v216;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v216 != v164) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v215 + 1) + 8 * i);
        id v13 = +[MOEngagementAndSuggestionAnalyticsManager getDefaultAnalyticsResultWithOnboardingStatus:*(void *)(v156 + 56)];
        LODWORD(v14) = 1120403456;
        __int16 v15 = +[NSNumber numberWithFloat:v14];
        [v13 setObject:v15 forKeyedSubscript:@"scalingFactorForAnalyticsKey"];

        [v13 setObject:v146 forKeyedSubscript:@"aggregationWindow"];
        [v13 setObject:v11 forKeyedSubscript:@"journalEntryType"];
        [v13 setObject:&off_1002F7928 forKeyedSubscript:@"appType"];
        [v13 setObject:&off_1002F7928 forKeyedSubscript:@"suggestionType"];
        [v13 setObject:&off_1002F7928 forKeyedSubscript:@"suggestionUIPlacement"];
        signed int v16 = [v11 intValue];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        uint64_t v232 = 0;
        uint64_t v211 = 0;
        v212 = &v211;
        uint64_t v213 = 0x2020000000;
        uint64_t v214 = 0;
        uint64_t v207 = 0;
        v208 = &v207;
        uint64_t v209 = 0x2020000000;
        uint64_t v210 = 0;
        uint64_t v203 = 0;
        v204 = &v203;
        uint64_t v205 = 0x2020000000;
        uint64_t v206 = 0;
        uint64_t v199 = 0;
        v200 = &v199;
        uint64_t v201 = 0x2020000000;
        uint64_t v202 = 0;
        uint64_t v195 = 0;
        v196 = &v195;
        uint64_t v197 = 0x2020000000;
        uint64_t v198 = 0;
        v194[0] = _NSConcreteStackBlock;
        v194[1] = 3221225472;
        v194[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_188;
        v194[3] = &unk_1002D1270;
        v194[10] = v16;
        v194[4] = buf;
        v194[5] = &v195;
        v194[6] = &v199;
        v194[7] = &v203;
        v194[8] = &v207;
        v194[9] = &v211;
        [v145 enumerateObjectsUsingBlock:v194];
        id v17 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)&buf[8] + 24)];
        [v13 setObject:v17 forKeyedSubscript:@"journalEntryCreatedCount"];

        v18 = +[NSNumber numberWithUnsignedInteger:v212[3]];
        [v13 setObject:v18 forKeyedSubscript:@"journalEntryCancelledCount"];

        id v19 = +[NSNumber numberWithUnsignedInteger:v208[3]];
        [v13 setObject:v19 forKeyedSubscript:@"journalEntryDeletedCount"];

        id v20 = +[NSNumber numberWithUnsignedInteger:v204[3]];
        [v13 setObject:v20 forKeyedSubscript:@"journalEntryEditedCount"];

        id v21 = +[NSNumber numberWithUnsignedInteger:v200[3]];
        [v13 setObject:v21 forKeyedSubscript:@"journalEntryWithZeroCharacterCount"];

        unint64_t v23 = *(void *)(*(void *)&buf[8] + 24);
        if (v23)
        {
          *(float *)&double v22 = (float)(unint64_t)v196[3] / (float)v23;
          __int16 v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOEngagementAndSuggestionAnalyticsParams getCharacterCountBin:v22]);
          [v13 setObject:v24 forKeyedSubscript:@"journalEntryAvgCharacterCountBinned"];
        }
        else
        {
          [v13 setObject:&off_1002F7928 forKeyedSubscript:@"journalEntryAvgCharacterCountBinned"];
        }
        if (v13)
        {
          v189 = _NSConcreteStackBlock;
          uint64_t v190 = 3221225472;
          v191 = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2_202;
          v192 = &unk_1002CD5F8;
          id v25 = v13;
          id v193 = v25;
          AnalyticsSendEventLazy();
          ++*(void *)(*(void *)(*(void *)(v156 + 104) + 8) + 24);
          id v26 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v227 = 138412546;
            v228 = v138;
            __int16 v229 = 2112;
            id v230 = v25;
            _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Journal entry engagement analytics result was submitted to: %@, Analytics event: %@", v227, 0x16u);
          }
        }
        _Block_object_dispose(&v195, 8);
        _Block_object_dispose(&v199, 8);
        _Block_object_dispose(&v203, 8);
        _Block_object_dispose(&v207, 8);
        _Block_object_dispose(&v211, 8);
        _Block_object_dispose(buf, 8);
      }
      id v9 = [obj countByEnumeratingWithState:&v215 objects:v233 count:16];
    }
    while (v9);
  }

  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472;
  v186[2] = __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_204;
  v186[3] = &unk_1002D1248;
  uint64_t v188 = *(void *)(v156 + 120);
  id v116 = v147;
  id v187 = v116;
  v123 = +[NSPredicate predicateWithBlock:v186];
  v130 = [*(id *)(v156 + 64) filteredArrayUsingPredicate:v123];
  id v27 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = [v130 count];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v116;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Suggestion engagement event count from the last %@ days %lu", buf, 0x16u);
  }

  long long v184 = 0u;
  long long v185 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  id v117 = *(id *)(v156 + 72);
  id v126 = [v117 countByEnumeratingWithState:&v182 objects:v226 count:16];
  if (v126)
  {
    uint64_t v114 = *(void *)v183;
    *(void *)&long long v29 = 138412546;
    long long v113 = v29;
    do
    {
      for (j = 0; j != v126; j = (char *)j + 1)
      {
        if (*(void *)v183 != v114) {
          objc_enumerationMutation(v117);
        }
        v131 = *(void **)(*((void *)&v182 + 1) + 8 * (void)j);
        long long v178 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        id v118 = *(id *)(v156 + 80);
        id v127 = [v118 countByEnumeratingWithState:&v178 objects:v225 count:16];
        if (v127)
        {
          uint64_t v115 = *(void *)v179;
          do
          {
            for (k = 0; k != v127; k = (char *)k + 1)
            {
              if (*(void *)v179 != v115) {
                objc_enumerationMutation(v118);
              }
              v132 = *(void **)(*((void *)&v178 + 1) + 8 * (void)k);
              long long v174 = 0u;
              long long v175 = 0u;
              long long v176 = 0u;
              long long v177 = 0u;
              id v120 = *(id *)(v156 + 88);
              id v129 = [v120 countByEnumeratingWithState:&v174 objects:v224 count:16];
              if (v129)
              {
                uint64_t v119 = *(void *)v175;
                do
                {
                  uint64_t v30 = 0;
                  do
                  {
                    if (*(void *)v175 != v119)
                    {
                      uint64_t v31 = v30;
                      objc_enumerationMutation(v120);
                      uint64_t v30 = v31;
                    }
                    uint64_t v121 = v30;
                    objc_super v32 = *(void **)(*((void *)&v174 + 1) + 8 * v30);
                    v133 = +[MOEngagementAndSuggestionAnalyticsManager getDefaultAnalyticsResultWithOnboardingStatus:*(void *)(v156 + 56)];
                    LODWORD(v33) = 1120403456;
                    v34 = +[NSNumber numberWithFloat:v33];
                    [v133 setObject:v34 forKeyedSubscript:@"scalingFactorForAnalyticsKey"];

                    [v133 setObject:v146 forKeyedSubscript:@"aggregationWindow"];
                    [v133 setObject:v131 forKeyedSubscript:@"appType"];
                    [v133 setObject:v32 forKeyedSubscript:@"suggestionType"];
                    [v133 setObject:v132 forKeyedSubscript:@"suggestionUIPlacement"];
                    [v133 setObject:&off_1002F7928 forKeyedSubscript:@"journalEntryType"];
                    unsigned int v135 = [v131 intValue];
                    signed int v35 = [v32 intValue];
                    unsigned int v160 = [v132 intValue];
                    v144 = objc_opt_new();
                    v143 = objc_opt_new();
                    v142 = objc_opt_new();
                    v141 = objc_opt_new();
                    long long v172 = 0u;
                    long long v173 = 0u;
                    long long v170 = 0u;
                    long long v171 = 0u;
                    id v134 = v130;
                    id v137 = [v134 countByEnumeratingWithState:&v170 objects:v223 count:16];
                    if (!v137)
                    {
                      unint64_t v153 = 0;
                      unint64_t v154 = 0;
                      uint64_t v149 = 0;
                      obja = 0;
                      unint64_t v152 = 0;
                      goto LABEL_121;
                    }
                    unint64_t v153 = 0;
                    unint64_t v154 = 0;
                    uint64_t v149 = 0;
                    obja = 0;
                    unint64_t v152 = 0;
                    uint64_t v163 = v35;
                    uint64_t v136 = *(void *)v171;
                    do
                    {
                      uint64_t v36 = 0;
                      do
                      {
                        if (*(void *)v171 != v136)
                        {
                          uint64_t v37 = v36;
                          objc_enumerationMutation(v134);
                          uint64_t v36 = v37;
                        }
                        uint64_t v140 = v36;
                        v38 = *(void **)(*((void *)&v170 + 1) + 8 * v36);
                        id v39 = [v38 objectForKeyedSubscript:@"suggestionEvent" v113];

                        if (!v39) {
                          goto LABEL_117;
                        }
                        v148 = [v38 objectForKeyedSubscript:@"suggestionEvent"];
                        id v40 = [v148 objectForKeyedSubscript:@"type"];
                        unsigned int v155 = [v40 intValue];

                        v139 = [v148 objectForKeyedSubscript:@"clientIdentifier"];
                        int v41 = v135;
                        switch(v135)
                        {
                          case 1u:
                            goto LABEL_46;
                          case 3u:
                            v42 = +[NSNull null];
                            if (([v139 isEqual:v42] & 1) == 0)
                            {
                              unsigned int v159 = [v139 isEqualToString:@"com.apple.journal"] ^ 1;
                              goto LABEL_51;
                            }
                            break;
                          case 2u:
                            v42 = +[NSNull null];
                            if (([v139 isEqual:v42] & 1) == 0)
                            {
                              unsigned __int8 v43 = [v139 isEqualToString:@"com.apple.journal"];

                              if (v43)
                              {
                                int v41 = 1;
LABEL_46:
                                unsigned int v159 = v41;
                                goto LABEL_52;
                              }
LABEL_47:
                              unsigned int v159 = 0;
                              goto LABEL_52;
                            }
                            break;
                          default:
                            goto LABEL_47;
                        }
                        unsigned int v159 = 0;
LABEL_51:

LABEL_52:
                        v161 = [v148 objectForKeyedSubscript:@"viewContainerName"];
                        int v44 = v160;
                        if (v160 != 1)
                        {
                          if (v160 == 3)
                          {
                            v45 = +[NSNull null];
                            if ([v161 isEqual:v45]) {
LABEL_61:
                            }
                              unsigned int v165 = 0;
                            else {
                              unsigned int v165 = [v161 isEqualToString:@"Recent"];
                            }

                            goto LABEL_64;
                          }
                          if (v160 != 2) {
                            goto LABEL_59;
                          }
                          v45 = +[NSNull null];
                          if ([v161 isEqual:v45]) {
                            goto LABEL_61;
                          }
                          unsigned __int8 v46 = [v161 isEqualToString:@"Recommended"];

                          if ((v46 & 1) == 0)
                          {
LABEL_59:
                            unsigned int v165 = 0;
                            goto LABEL_64;
                          }
                          int v44 = 1;
                        }
                        unsigned int v165 = v44;
LABEL_64:
                        uint64_t v47 = [v148 objectForKeyedSubscript:@"fullBundleOrderedSet"];

                        if (!v47) {
                          goto LABEL_116;
                        }
                        id v157 = [v148 objectForKeyedSubscript:@"fullBundleOrderedSet"];
                        long long v168 = 0u;
                        long long v169 = 0u;
                        long long v166 = 0u;
                        long long v167 = 0u;
                        id v162 = [v157 countByEnumeratingWithState:&v166 objects:v222 count:16];
                        if (!v162) {
                          goto LABEL_115;
                        }
                        uint64_t v158 = *(void *)v167;
                        do
                        {
                          for (m = 0; m != v162; m = (char *)m + 1)
                          {
                            if (*(void *)v167 != v158) {
                              objc_enumerationMutation(v157);
                            }
                            v49 = *(void **)(*((void *)&v166 + 1) + 8 * (void)m);
                            uint64_t v50 = [v49 objectForKeyedSubscript:@"bundleSubType"];
                            if (v163 == 1)
                            {
                              unsigned int v51 = 1;
                            }
                            else
                            {
                              id v52 = *(void **)(v156 + 96);
                              id v53 = +[NSNumber numberWithUnsignedInteger:v163];
                              v54 = [v52 objectForKeyedSubscript:v53];

                              unsigned int v51 = [v54 containsObject:v50];
                            }
                            if (v160 == 5)
                            {
                              v59 = +[NSNull null];
                              if (([v161 isEqual:v59] & 1) != 0
                                || ![v161 isEqualToString:@"Recommended"])
                              {
                                BOOL v62 = 0;
                              }
                              else
                              {
                                v60 = [v49 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
                                v61 = +[NSNull null];
                                if ([v60 isEqual:v61])
                                {
                                  BOOL v62 = 0;
                                }
                                else
                                {
                                  v65 = [v49 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
                                  if (v65)
                                  {
                                    v66 = [v49 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
                                    BOOL v62 = (int)[v66 intValue] < 11;
                                  }
                                  else
                                  {
                                    BOOL v62 = 0;
                                  }
                                }
                              }

                              goto LABEL_95;
                            }
                            if (v160 != 4)
                            {
                              BOOL v62 = 0;
LABEL_95:
                              int v64 = v165;
                              goto LABEL_96;
                            }
                            uint64_t v55 = +[NSNull null];
                            if (([v161 isEqual:v55] & 1) != 0
                              || ![v161 isEqualToString:@"Recommended"])
                            {
                              BOOL v58 = 0;
                            }
                            else
                            {
                              v56 = [v49 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
                              v57 = +[NSNull null];
                              if ([v56 isEqual:v57])
                              {
                                BOOL v58 = 0;
                              }
                              else
                              {
                                v63 = [v49 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
                                BOOL v58 = (int)[v63 intValue] < 6;
                              }
                            }

                            BOOL v62 = 0;
                            int v64 = v58 | v165;
LABEL_96:
                            int v67 = v62 | v64;
                            unsigned int v165 = v67;
                            if (v159 && v51 && (v67 & 1) != 0)
                            {
                              switch(v155)
                              {
                                case 1u:
                                  v68 = [v49 objectForKeyedSubscript:@"identifier"];
                                  ++v153;
                                  if (v68)
                                  {
                                    v69 = [v49 objectForKeyedSubscript:@"identifier"];
                                    v70 = [v69 objectForKeyedSubscript:@"suggestionId"];
                                    BOOL v71 = v70 == 0;

                                    if (!v71)
                                    {
                                      v72 = [v49 objectForKeyedSubscript:@"identifier"];
                                      v73 = [v72 objectForKeyedSubscript:@"suggestionId"];
                                      [v142 addObject:v73];
                                    }
                                  }
                                  break;
                                case 6u:
                                  ++obja;
                                  break;
                                case 8u:
                                  v74 = [v49 objectForKeyedSubscript:@"identifier"];
                                  ++v152;
                                  if (v74)
                                  {
                                    v75 = [v49 objectForKeyedSubscript:@"identifier"];
                                    v76 = [v75 objectForKeyedSubscript:@"suggestionId"];
                                    BOOL v77 = v76 == 0;

                                    if (!v77)
                                    {
                                      v78 = [v49 objectForKeyedSubscript:@"identifier"];
                                      v79 = [v78 objectForKeyedSubscript:@"suggestionId"];
                                      [v143 addObject:v79];
                                    }
                                  }
                                  break;
                                case 9u:
                                  v80 = [v49 objectForKeyedSubscript:@"identifier"];
                                  ++v154;
                                  if (v80)
                                  {
                                    v81 = [v49 objectForKeyedSubscript:@"identifier"];
                                    v82 = [v81 objectForKeyedSubscript:@"suggestionId"];
                                    BOOL v83 = v82 == 0;

                                    if (!v83)
                                    {
                                      v84 = [v49 objectForKeyedSubscript:@"identifier"];
                                      v85 = [v84 objectForKeyedSubscript:@"suggestionId"];
                                      [v144 addObject:v85];
                                    }
                                  }
                                  break;
                                case 0xCu:
                                  v86 = [v49 objectForKeyedSubscript:@"identifier"];
                                  ++v149;
                                  if (v86)
                                  {
                                    v87 = [v49 objectForKeyedSubscript:@"identifier"];
                                    v88 = [v87 objectForKeyedSubscript:@"suggestionId"];
                                    BOOL v89 = v88 == 0;

                                    if (!v89)
                                    {
                                      v90 = [v49 objectForKeyedSubscript:@"identifier"];
                                      v91 = [v90 objectForKeyedSubscript:@"suggestionId"];
                                      [v141 addObject:v91];
                                    }
                                  }
                                  break;
                                default:
                                  break;
                              }
                            }
                          }
                          id v162 = [v157 countByEnumeratingWithState:&v166 objects:v222 count:16];
                        }
                        while (v162);
LABEL_115:

LABEL_116:
LABEL_117:
                        uint64_t v36 = v140 + 1;
                      }
                      while ((id)(v140 + 1) != v137);
                      id v137 = [v134 countByEnumeratingWithState:&v170 objects:v223 count:16];
                    }
                    while (v137);
LABEL_121:

                    id v92 = [v144 count];
                    id v93 = [v141 count];
                    id v94 = [v143 count];
                    id v95 = [v142 count];
                    v96 = +[NSNumber numberWithUnsignedInteger:v153];
                    [v133 setObject:v96 forKeyedSubscript:@"suggestionSelectedCount"];

                    v97 = +[NSNumber numberWithUnsignedInteger:obja];
                    [v133 setObject:v97 forKeyedSubscript:@"suggestionDeletedCount"];

                    v98 = +[NSNumber numberWithUnsignedInteger:v152];
                    [v133 setObject:v98 forKeyedSubscript:@"suggestionQuickAddCount"];

                    v99 = +[NSNumber numberWithUnsignedInteger:v149];
                    [v133 setObject:v99 forKeyedSubscript:@"totalviewedInterstitialCount"];

                    v100 = +[NSNumber numberWithUnsignedInteger:v154];
                    [v133 setObject:v100 forKeyedSubscript:@"totalViewedSuggestionCount"];

                    v101 = +[NSNumber numberWithUnsignedInteger:v92];
                    [v133 setObject:v101 forKeyedSubscript:@"uniqueViewedSuggestionCount"];

                    v102 = +[NSNumber numberWithUnsignedInteger:v93];
                    [v133 setObject:v102 forKeyedSubscript:@"uniqueViewedInterstitalCount"];

                    if (v92)
                    {
                      float v104 = (float)(unint64_t)v92;
                      *(float *)&double v103 = 100.0 * (float)((float)(unint64_t)v94 / (float)(unint64_t)v92);
                      v105 = +[NSNumber numberWithFloat:v103];
                      [v133 setObject:v105 forKeyedSubscript:@"uniqueSuggestionViewToQuickAddConversionRate"];

                      *(float *)&double v106 = 100.0 * (float)((float)(unint64_t)v95 / v104);
                      v107 = +[NSNumber numberWithFloat:v106];
                      [v133 setObject:v107 forKeyedSubscript:@"uniqueSuggestionViewToSelectConversionRate"];
                    }
                    if (v154)
                    {
                      *(float *)&double v103 = 100.0 * (float)((float)v152 / (float)v154);
                      v108 = +[NSNumber numberWithFloat:v103];
                      [v133 setObject:v108 forKeyedSubscript:@"totalSuggestionViewToQuickAddConversionRate"];

                      *(float *)&double v109 = 100.0 * (float)((float)v153 / (float)v154);
                      v110 = +[NSNumber numberWithFloat:v109];
                      [v133 setObject:v110 forKeyedSubscript:@"totalSuggestionViewToSelectConversionRate"];
                    }
                    if (v133)
                    {
                      id v111 = v133;
                      AnalyticsSendEventLazy();
                      ++*(void *)(*(void *)(*(void *)(v156 + 112) + 8) + 24);
                      v112 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
                      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = v113;
                        *(void *)&uint8_t buf[4] = v138;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v111;
                        _os_log_debug_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEBUG, "Journal entry engagement analytics result was submitted to: %@, Analytics event: %@", buf, 0x16u);
                      }
                    }
                    uint64_t v30 = v121 + 1;
                  }
                  while ((id)(v121 + 1) != v129);
                  id v129 = [v120 countByEnumeratingWithState:&v174 objects:v224 count:16];
                }
                while (v129);
              }
            }
            id v127 = [v118 countByEnumeratingWithState:&v178 objects:v225 count:16];
          }
          while (v127);
        }
      }
      id v126 = [v117 countByEnumeratingWithState:&v182 objects:v226 count:16];
    }
    while (v126);
  }
}

BOOL __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"entryEvent"];
  if (v4
    && (id v5 = (void *)v4,
        [v3 objectForKeyedSubscript:@"entryEvent"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    id v8 = [v3 objectForKeyedSubscript:@"entryEvent"];
    id v9 = [v8 objectForKeyedSubscript:@"timestamp"];
    if (v9)
    {
      id v10 = [v3 objectForKeyedSubscript:@"entryEvent"];
      id v11 = [v10 objectForKeyedSubscript:@"timestamp"];
      [v11 floatValue];
      double v13 = v12;
      double v14 = *(double *)(a1 + 40);
      [*(id *)(a1 + 32) floatValue];
      if (v14 + (float)(v15 * -86400.0) <= v13)
      {
        id v17 = [v3 objectForKeyedSubscript:@"entryEvent"];
        v18 = [v17 objectForKeyedSubscript:@"timestamp"];
        [v18 floatValue];
        BOOL v16 = *(double *)(a1 + 40) >= v19;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_188(void *a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 objectForKeyedSubscript:@"entryEvent"];

  uint64_t v4 = v15;
  if (v3)
  {
    id v5 = [v15 objectForKeyedSubscript:@"entryEvent"];
    id v6 = [v5 objectForKeyedSubscript:@"type"];
    unsigned int v7 = [v6 intValue];

    id v8 = [v5 objectForKeyedSubscript:@"bundleEvergreenTypes"];
    id v9 = [v5 objectForKeyedSubscript:@"bundleInterfaceTypes"];
    uint64_t v10 = a1[10];
    if (v10 == 1) {
      goto LABEL_13;
    }
    if (v10 == 2)
    {
      if (![v8 count] && !objc_msgSend(v9, "count")) {
        goto LABEL_13;
      }
      uint64_t v10 = a1[10];
    }
    if (v10 == 3)
    {
      if ([v8 count]) {
        goto LABEL_13;
      }
      uint64_t v10 = a1[10];
    }
    if (v10 != 4 || [v8 count] || !objc_msgSend(v9, "count"))
    {
LABEL_21:

      uint64_t v4 = v15;
      goto LABEL_22;
    }
LABEL_13:
    switch(v7)
    {
      case 1u:
        ++*(void *)(*(void *)(a1[4] + 8) + 24);
        id v11 = [v5 objectForKeyedSubscript:@"totalCharacters"];
        int v12 = [v11 intValue];

        if (v12 < 1)
        {
          uint64_t v14 = a1[6];
          goto LABEL_20;
        }
        double v13 = [v5 objectForKeyedSubscript:@"totalCharacters"];
        *(void *)(*(void *)(a1[5] + 8) + 24) += (int)[v13 intValue];

        goto LABEL_21;
      case 2u:
        uint64_t v14 = a1[7];
        goto LABEL_20;
      case 3u:
        uint64_t v14 = a1[8];
        goto LABEL_20;
      case 4u:
        uint64_t v14 = a1[9];
LABEL_20:
        ++*(void *)(*(void *)(v14 + 8) + 24);
        break;
      default:
        goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_22:
}

id __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_2_202(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_204(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"suggestionEvent"];
  if (v4
    && (id v5 = (void *)v4,
        [v3 objectForKeyedSubscript:@"suggestionEvent"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    id v8 = [v3 objectForKeyedSubscript:@"suggestionEvent"];
    id v9 = [v8 objectForKeyedSubscript:@"timestamp"];
    if (v9)
    {
      uint64_t v10 = [v3 objectForKeyedSubscript:@"suggestionEvent"];
      id v11 = [v10 objectForKeyedSubscript:@"timestamp"];
      [v11 floatValue];
      double v13 = v12;
      double v14 = *(double *)(a1 + 40);
      [*(id *)(a1 + 32) floatValue];
      if (v14 + (float)(v15 * -86400.0) <= v13)
      {
        id v17 = [v3 objectForKeyedSubscript:@"suggestionEvent"];
        v18 = [v17 objectForKeyedSubscript:@"timestamp"];
        [v18 floatValue];
        BOOL v16 = *(double *)(a1 + 40) >= v19;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

id __112__MOEngagementAndSuggestionAnalyticsManager_submitEngagementAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke_237(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitSuggestionPerformanceAnalyticsWithOnboardingStatus:(id)a3 AndCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric analytics", buf, 2u);
  }

  id v11 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:0 ascending:1 limit:0 includeDeletedBundles:0 skipRanking:0];
  float v12 = [(MOEngagementAndSuggestionAnalyticsManager *)self eventBundleStore];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __123__MOEngagementAndSuggestionAnalyticsManager_submitSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke;
  v17[3] = &unk_1002D12C0;
  id v13 = v7;
  id v20 = v13;
  void v17[4] = self;
  id v14 = v6;
  id v18 = v14;
  id v15 = v8;
  id v19 = v15;
  [v12 fetchEventBundleWithOptions:v11 CompletionHandler:v17];

  BOOL v16 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Suggestion perf analytics submission was completed. Result: %@", buf, 0xCu);
  }

  (*((void (**)(id, void, id))v13 + 2))(v13, 0, v15);
}

void __123__MOEngagementAndSuggestionAnalyticsManager_submitSuggestionPerformanceAnalyticsWithOnboardingStatus_AndCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    id v9 = [v5 count];
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fetched bundle count, %lu, error, %@", (uint8_t *)&v8, 0x16u);
  }

  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    [*(id *)(a1 + 32) _submitSuggestionPerformanceAnalyticsFromEventBundles:v5 WithOnboardingStatus:*(void *)(a1 + 40) andCompletionResult:*(void *)(a1 + 48)];
  }
}

- (void)_submitSuggestionPerformanceAnalyticsFromEventBundles:(id)a3 WithOnboardingStatus:(id)a4 andCompletionResult:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric for %lu bundles.", (uint8_t *)&buf, 0xCu);
  }

  id v11 = +[NSDate date];
  float v12 = +[MOEngagementAndSuggestionAnalyticsParams aggregationWindowMap];
  id v13 = +[MOEngagementAndSuggestionAnalyticsParams suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke;
  id v22 = &unk_1002D1310;
  id v14 = v11;
  id v23 = v14;
  id v15 = v7;
  id v24 = v15;
  id v25 = &off_1002F93F8;
  id v16 = v13;
  id v26 = v16;
  id v17 = v8;
  id v27 = v17;
  p_long long buf = &buf;
  [v12 enumerateKeysAndObjectsUsingBlock:&v19];
  id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(void *)(*((void *)&buf + 1) + 24), v19, v20, v21, v22);
  [v9 setObject:v18 forKeyedSubscript:@"suggestionAnalyticsPayloadCount"];

  _Block_object_dispose(&buf, 8);
}

void __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v51 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v48 = v5;
  [v5 floatValue];
  uint64_t v47 = [v6 dateByAddingTimeInterval:(float)(v7 * -86400.0)];
  +[NSPredicate predicateWithFormat:@"startDate >= %@ AND endDate <= %@", v47, *(void *)(a1 + 32)];
  unsigned __int8 v46 = v62 = a1;
  id v52 = [[*(id *)(a1 + 40) filteredArrayUsingPredicate:];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v76 = v48;
    __int16 v77 = 2048;
    id v78 = [v52 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric from the last %@days: bundleCount=%lu.", buf, 0x16u);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = *(id *)(a1 + 48);
  id v53 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v53)
  {
    uint64_t v50 = *(void *)v71;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v9;
        __int16 v10 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
        uint64_t v11 = (int)[v10 intValue];
        float v12 = [*(id *)(v62 + 56) objectForKeyedSubscript:v10];
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke_253;
        v67[3] = &unk_1002D12E8;
        id v57 = v12;
        id v68 = v57;
        uint64_t v69 = v11;
        v56 = +[NSPredicate predicateWithBlock:v67];
        id v13 = [v52 filteredArrayUsingPredicate:];
        id v14 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = [v13 count];
          *(_DWORD *)long long buf = 138412802;
          id v76 = v10;
          __int16 v77 = 2112;
          id v78 = v48;
          __int16 v79 = 2048;
          id v80 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Submitting suggestion performance metric for suggestionVisibilityCategory %@ from the last %@days : bundleCount=%lu.", buf, 0x20u);
        }

        id v16 = +[MOEngagementAndSuggestionAnalyticsManager getDefaultAnalyticsResultWithOnboardingStatus:*(void *)(v62 + 64)];
        LODWORD(v17) = 1120403456;
        id v18 = +[NSNumber numberWithFloat:v17];
        [v16 setObject:v18 forKeyedSubscript:@"scalingFactorForAnalyticsKey"];

        [v16 setObject:v51 forKeyedSubscript:@"aggregationWindow"];
        uint64_t v55 = v16;
        [v16 setObject:v10 forKeyedSubscript:@"suggestionUIVisibilityCategory"];
        id v54 = [v13 count];
        v61 = objc_opt_new();
        v60 = objc_opt_new();
        id v19 = objc_opt_new();
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v20 = v13;
        id v21 = [v20 countByEnumeratingWithState:&v63 objects:v74 count:16];
        if (!v21)
        {
          unint64_t v23 = 0;
          float v25 = 0.0;
          float v26 = -INFINITY;
          goto LABEL_31;
        }
        id v22 = v21;
        unint64_t v23 = 0;
        uint64_t v24 = *(void *)v64;
        float v25 = 0.0;
        float v26 = -INFINITY;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v64 != v24) {
              objc_enumerationMutation(v20);
            }
            id v28 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            if ([v28 bundleSuperType] == (id)6 || objc_msgSend(v28, "bundleSuperType") == (id)7)
            {
              if ([v28 bundleSuperType] == (id)6 && objc_msgSend(v28, "bundleSubType"))
              {
                long long v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 bundleSubType]);
                uint64_t v30 = v19;
LABEL_26:
                [v30 addObject:v29];

                continue;
              }
            }
            else
            {
              uint64_t v31 = *(void **)(v62 + 32);
              objc_super v32 = [v28 endDate];
              [v31 timeIntervalSinceDate:v32];
              float v34 = v33 / 86400.0;

              if (v26 < v34) {
                float v26 = v34;
              }
              if ([v28 bundleSuperType])
              {
                signed int v35 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 bundleSuperType]);
                [v60 addObject:v35];
              }
              ++v23;
              float v25 = v25 + v34;
              if ([v28 bundleSubType])
              {
                long long v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 bundleSubType]);
                uint64_t v30 = v61;
                goto LABEL_26;
              }
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v63 objects:v74 count:16];
        }
        while (v22);
LABEL_31:

        uint64_t v36 = +[NSNumber numberWithUnsignedInteger:v54];
        [v55 setObject:v36 forKeyedSubscript:@"suggestionCount"];

        uint64_t v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
        [v55 setObject:v37 forKeyedSubscript:@"uniquePhotoMemorySuggestionSubTypeCount"];

        v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v61 count]);
        [v55 setObject:v38 forKeyedSubscript:@"uniqueSensedSuggestionSubTypeCount"];

        id v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v60 count]);
        [v55 setObject:v39 forKeyedSubscript:@"uniqueSensedSuggestionSuperTypeCount"];

        if (v23)
        {
          *(float *)&double v40 = v25 / (float)v23;
          int v41 = +[NSNumber numberWithFloat:v40];
          [v55 setObject:v41 forKeyedSubscript:@"avgAgeofSensedSuggestionsInDays"];

          *(float *)&double v42 = 100.0 * v26;
          unsigned __int8 v43 = +[NSNumber numberWithFloat:v42];
          [v55 setObject:v43 forKeyedSubscript:@"maxAgeofSensedSuggestionsInDays"];
        }
        if (v55)
        {
          id v44 = v55;
          AnalyticsSendEventLazy();
          ++*(void *)(*(void *)(*(void *)(v62 + 72) + 8) + 24);
          v45 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v76 = v44;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Suggestion perf analytics result was submitted: %@", buf, 0xCu);
          }
        }
        uint64_t v9 = v59 + 1;
      }
      while ((id)(v59 + 1) != v53);
      id v53 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
    }
    while (v53);
  }
}

BOOL __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke_253(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 rankingDictionary];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v3 rankingDictionary];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = [v3 rankingDictionary];
      uint64_t v9 = [v8 objectForKey:@"visibilityCategoryForUI"];

      __int16 v10 = [v3 rankingDictionary];
      uint64_t v11 = [v10 objectForKey:@"ordinalRankInRecommendedTab"];

      if (v9 && [*(id *)(a1 + 32) containsObject:v9])
      {
        uint64_t v12 = *(void *)(a1 + 40);
        if (v12 == 5)
        {
          if (v11)
          {
            int v13 = 11;
            goto LABEL_12;
          }
        }
        else
        {
          if (v12 != 4)
          {
            BOOL v14 = 1;
            goto LABEL_14;
          }
          if (v11)
          {
            int v13 = 6;
LABEL_12:
            BOOL v14 = (int)[v11 intValue] < v13;
LABEL_14:

            goto LABEL_15;
          }
        }
      }
      BOOL v14 = 0;
      goto LABEL_14;
    }
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

id __140__MOEngagementAndSuggestionAnalyticsManager__submitSuggestionPerformanceAnalyticsFromEventBundles_WithOnboardingStatus_andCompletionResult___block_invoke_255(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)getDefaultAnalyticsResultWithOnboardingStatus:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }

  return v5;
}

- (BOOL)isReadyToSubmitAnalytics
{
  lastAnalyticsSubmissionDate = self->_lastAnalyticsSubmissionDate;
  if (lastAnalyticsSubmissionDate)
  {
    [(NSDate *)lastAnalyticsSubmissionDate timeIntervalSinceNow];
    *(float *)&double v4 = v4 / -86400.0;
    return self->_minimumTimeGapBetweenSubmissionsInDays < *(float *)&v4;
  }
  else
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[MOEngagementAndSuggestionAnalyticsManager isReadyToSubmitAnalytics](v6);
    }

    id v7 = [(MOEngagementAndSuggestionAnalyticsManager *)self setLastAnalyticsSubmissionDate];
    return 0;
  }
}

- (id)setLastAnalyticsSubmissionDate
{
  id v3 = +[NSDate date];
  double v4 = [(MOEngagementAndSuggestionAnalyticsManager *)self defaultsManager];
  [v4 setObject:v3 forKey:@"LastAnalyticsSubmissionDate"];

  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    lastAnalyticsSubmissionDate = self->_lastAnalyticsSubmissionDate;
    int v8 = 138412546;
    uint64_t v9 = lastAnalyticsSubmissionDate;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Last analytics submission date was updated from %@ to %@", (uint8_t *)&v8, 0x16u);
  }

  return v3;
}

- (NSDate)lastAnalyticsSubmissionDate
{
  return self->_lastAnalyticsSubmissionDate;
}

- (float)minimumTimeGapBetweenSubmissionsInDays
{
  return self->_minimumTimeGapBetweenSubmissionsInDays;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (void)setEngagementHistoryManager:(id)a3
{
}

- (MOEventBundleStore)eventBundleStore
{
  return self->_eventBundleStore;
}

- (void)setEventBundleStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBundleStore, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_lastAnalyticsSubmissionDate, 0);
}

- (void)isReadyToSubmitAnalytics
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Engagement and suggestion analytics were never submitted. Setting analyticsSubmissionDate to now to hold out for the next 28 days", v1, 2u);
}

@end