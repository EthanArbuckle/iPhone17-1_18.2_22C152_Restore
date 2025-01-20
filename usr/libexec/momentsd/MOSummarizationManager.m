@interface MOSummarizationManager
- (BOOL)supressCoarseGranularityPropertyOfEventBundle:(id)a3 dominantBundle:(id)a4;
- (MOConfigurationManager)configurationManager;
- (MODaemonUniverse)fUniverse;
- (MOEventBundleRanking)eventBundleRanking;
- (MOSummarizationManager)init;
- (MOSummarizationManager)initWithUniverse:(id)a3;
- (MOSummarizationParameters)parameters;
- (OS_dispatch_queue)queue;
- (id)_getThirdPartyKeyByAlbumArtist:(id)a3 albumOrArtist:(id)a4;
- (id)_getThirdPartyTitleKey:(id)a3;
- (id)_getThirdPartyTitleKey:(id)a3 dayKey:(id)a4 isRecommendTab:(BOOL)a5;
- (id)_removeDuplicateFromResource:(id)a3 nonMediaKeySet:(id)a4 mediaOnRepeatDict:(id)a5 eventBundleDayKey:(id)a6 keyName:(id)a7;
- (id)_removeDuplicateFromResourceThridParty:(id)a3 mediaKeySet:(id)a4 dayKey:(id)a5 isRecommendTab:(BOOL)a6;
- (id)_sortResourcesByPriorityScore:(id)a3;
- (id)removeDuplicateAssetsAccrossMultipleBundleTypes:(id)a3;
- (unint64_t)supressCoarseGranularityPropertyOfEventBundles:(id)a3 primaryBundles:(id)a4 bundleMapping:(id)a5;
- (void)_aggregateEventBundles:(id)a3 withAggregtaionDateInterval:(id)a4 handler:(id)a5;
- (void)_compressAssetsForThirdPartyBundle:(id)a3;
- (void)_dedupAssetForMediaBundle:(id)a3 nonPlayedMediaBudnles:(id)a4 isRecommendTab:(BOOL)a5;
- (void)_removeDuplicateAssetsForBundleType:(id)a3 bundleSuperType:(unint64_t)a4 musicAlbumSet:(id)a5 podcastEpisodeSet:(id)a6 isRecommendTab:(BOOL)a7;
- (void)aggregateEventBundles:(id)a3 withAggregtaionDateInterval:(id)a4 handler:(id)a5;
- (void)compressAssetsForThirdPartyBundles:(id)a3;
- (void)dedupAssetForMediaBundleThirdParty:(id)a3 nonPlayedMediaBudnles:(id)a4 isRecommendTab:(BOOL)a5;
- (void)removeDuplicateAssetsFromMediaBundle:(id)a3;
- (void)removeDuplicateAssetsPerBundleTypeForThirdParty:(id)a3 bundleSuperType:(unint64_t)a4 titleSet:(id)a5 isRecommendTab:(BOOL)a6 isMediaOnRepeat:(BOOL)a7;
- (void)setConfigurationManager:(id)a3;
- (void)setEventBundleRanking:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation MOSummarizationManager

- (MOSummarizationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MOSummarizationManager;
  v2 = [(MOSummarizationManager *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (MOSummarizationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MOSummarizationManager;
  v6 = [(MOSummarizationManager *)&v26 init];
  dispatch_queue_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    objc_super v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    fUniverse = v7->_fUniverse;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v17 = [(MODaemonUniverse *)fUniverse getService:v16];
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v17;

    v19 = [[MOSummarizationParameters alloc] initWithConfigurationManager:v7->_configurationManager];
    parameters = v7->_parameters;
    v7->_parameters = v19;

    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    uint64_t v23 = [v5 getService:v22];
    eventBundleRanking = v7->_eventBundleRanking;
    v7->_eventBundleRanking = (MOEventBundleRanking *)v23;
  }
  return v7;
}

- (void)aggregateEventBundles:(id)a3 withAggregtaionDateInterval:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "aggregate eventBundles count, %lu", buf, 0xCu);
  }

  dispatch_queue_t v12 = [(MOSummarizationManager *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke;
  v16[3] = &unk_1002C9A78;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2;
  v4[3] = &unk_1002CA140;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _aggregateEventBundles:v2 withAggregtaionDateInterval:v3 handler:v4];
}

uint64_t __84__MOSummarizationManager_aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_aggregateEventBundles:(id)a3 withAggregtaionDateInterval:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v38 = a4;
  id v37 = a5;
  if ([v8 count])
  {
    id v9 = [(MOSummarizationManager *)self parameters];
    [v9 setAggregationDateInterval:v38];

    id v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [v38 startDate];
      dispatch_queue_t v12 = [v38 endDate];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "aggregation date interval, start date: %@, end date: %@", buf, 0x16u);
    }
    id v35 = [objc_alloc((Class)NSArray) initWithObjects:&off_1002F59D8, &off_1002F59F0, 0];
    v34 = +[NSPredicate predicateWithFormat:@"interfaceType in %@", v35];
    v36 = [v8 filteredArrayUsingPredicate:v34];
    id v13 = [v8 mutableCopy];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v54 = __Block_byref_object_copy__22;
    v55 = __Block_byref_object_dispose__22;
    id v56 = [v36 mutableCopy];
    id v14 = [v13 count];
    [v13 removeObjectsInArray:v36];
    [(MOEventBundleRanking *)self->_eventBundleRanking generateBundleRanking:v13 withMinRecommendedBundleCountRequirement:0];
    id v16 = [v13 count];
    v33 = +[NSPredicate predicateWithFormat:@"%K == %lu", @"interfaceType", 13];
    id v17 = [v8 filteredArrayUsingPredicate:];
    [*(id *)(*(void *)&buf[8] + 40) addObjectsFromArray:v17];
    [v13 removeObjectsInArray:v17];
    id v18 = +[NSPredicate predicateWithFormat:@"%K.%K <= %lu", @"place", @"placeType", 100];
    id v19 = [v17 filteredArrayUsingPredicate:v18];
    v20 = +[NSCompoundPredicate notPredicateWithSubpredicate:v18];
    id v21 = [v17 filteredArrayUsingPredicate:v20];

    id v22 = v19;
    uint64_t v23 = [MODominantBundleCreationManager alloc];
    v24 = [(MOSummarizationManager *)self fUniverse];
    v25 = [(MODominantBundleCreationManager *)v23 initWithUniverse:v24];

    objc_super v26 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v47 = 134218496;
      id v48 = v14;
      __int16 v49 = 2048;
      id v50 = v16;
      __int16 v51 = 2048;
      id v52 = [v36 count];
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Summarization: eventBundles, %lu, dominantBundling inputs, %lu, not summarize, %lu", v47, 0x20u);
    }

    id v27 = [v13 copy];
    v28 = [(MOSummarizationManager *)self parameters];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke;
    v39[3] = &unk_1002CEDB8;
    v46 = buf;
    id v29 = v13;
    id v40 = v29;
    v41 = self;
    id v42 = v22;
    id v30 = v21;
    id v43 = v30;
    id v31 = v42;
    id v44 = v31;
    id v45 = v37;
    [(MODominantBundleCreationManager *)v25 processBundlesForCreatingDominantBundles:v27 withParameters:v28 handler:v39];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v32 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "No eventBundle to be aggregated", buf, 2u);
    }

    (*((void (**)(id, void, void))v37 + 2))(v37, 0, 0);
  }
}

void __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObjectsFromArray:v3];
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
    *(_DWORD *)buf = 134217984;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Summarization:dominant bundle result count, %lu", buf, 0xCu);
  }

  v6 = +[NSPredicate predicateWithFormat:@"%K == NO", @"isAggregatedAndSuppressed"];
  dispatch_queue_t v7 = [v3 filteredArrayUsingPredicate:v6];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    id v10 = [v7 count];
    v11 = [v3 count];
    dispatch_queue_t v12 = [v7 count];
    *(_DWORD *)buf = 134218496;
    id v31 = v9;
    __int16 v32 = 2048;
    id v33 = v10;
    __int16 v34 = 2048;
    int64_t v35 = v11 - v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Summarization: Dominant bundle process, input, %lu, output, %lu, supressed, %lu", buf, 0x20u);
  }

  id v13 = [MOFineGranularityAggregationManager alloc];
  id v14 = [*(id *)(a1 + 40) fUniverse];
  id v15 = [(MOFineGranularityAggregationManager *)v13 initWithUniverse:v14];

  id v16 = [*(id *)(a1 + 40) parameters];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_403;
  v21[3] = &unk_1002CED90;
  uint64_t v29 = *(void *)(a1 + 80);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = *(void **)(a1 + 48);
  id v22 = v7;
  uint64_t v23 = v17;
  id v24 = v18;
  id v25 = v3;
  id v26 = *(id *)(a1 + 56);
  id v27 = *(id *)(a1 + 64);
  id v28 = *(id *)(a1 + 72);
  id v19 = v3;
  id v20 = v7;
  [(MOFineGranularityAggregationManager *)v15 aggregateBundles:v20 withParameters:v16 handler:v21];
}

void __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_403(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObjectsFromArray:v3];
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218240;
    id v25 = v5;
    __int16 v26 = 2048;
    id v27 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Summarization: Fine granularity aggregation process, input, %lu, output, %lu", buf, 0x16u);
  }

  v6 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    *(_DWORD *)buf = 134217984;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Summarization:fine granularity result count, %lu", buf, 0xCu);
  }

  id v8 = [MOCoarseGranularityAggregationManager alloc];
  id v9 = [*(id *)(a1 + 40) fUniverse];
  id v10 = [(MOCoarseGranularityAggregationManager *)v8 initWithUniverse:v9];

  uint64_t v11 = *(void *)(a1 + 32);
  dispatch_queue_t v12 = [*(id *)(a1 + 40) parameters];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_405;
  v15[3] = &unk_1002CED90;
  uint64_t v23 = *(void *)(a1 + 88);
  id v16 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 40);
  id v17 = v13;
  uint64_t v18 = v14;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  id v21 = *(id *)(a1 + 72);
  id v22 = *(id *)(a1 + 80);
  [(MOCoarseGranularityAggregationManager *)v10 aggregateBundles:v11 withParameters:v12 handler:v15];
}

void __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_405(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v119 = a3;
  v120 = v5;
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObjectsFromArray:v5];
  v6 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [*(id *)(a1 + 32) count];
    id v8 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134218496;
    id v158 = v7;
    __int16 v159 = 2048;
    id v160 = v8;
    __int16 v161 = 2048;
    id v162 = [v120 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Summarization: Coarse granularity aggregation process, input, %lu, (container bundles, %lu) output, %lu", buf, 0x20u);
  }

  id v9 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
    *(_DWORD *)buf = 134217984;
    id v158 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Summarization:coarse granularity result count, %lu", buf, 0xCu);
  }

  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  dispatch_queue_t v12 = [*(id *)(a1 + 48) parameters];
  id v13 = +[MOSummarizationUtilities summarizeMotionActivityBundlesWithSamePlaceName:v11 withParameters:v12];

  if ([v13 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObjectsFromArray:v13];
  }
  v118 = v13;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v14 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v121 = a1;
  id v134 = [v14 countByEnumeratingWithState:&v153 objects:v179 count:16];
  if (v134)
  {
    uint64_t v15 = *(void *)v154;
    id v127 = v14;
    uint64_t v129 = *(void *)v154;
    do
    {
      for (i = 0; i != v134; i = (char *)i + 1)
      {
        if (*(void *)v154 != v15) {
          objc_enumerationMutation(v14);
        }
        id v17 = *(void **)(*((void *)&v153 + 1) + 8 * i);
        if ([v17 bundleSubType] == (id)204)
        {
          id v19 = [v17 metaDataForRank];
          id v20 = [v19 objectForKeyedSubscript:@"WorkoutDuration"];
          [v20 doubleValue];
          double v22 = v21;
          uint64_t v23 = [*(id *)(a1 + 48) parameters];
          [v23 motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel];
          double v25 = v24;

          if (v22 < v25)
          {
            __int16 v26 = +[NSPredicate predicateWithFormat:@"type == %lu", 2];
            id v27 = [v17 resources];
            id v28 = [v27 filteredArrayUsingPredicate:v26];

            uint64_t v29 = [v17 place];

            if (v29)
            {
              id v30 = [v17 place];
              id v31 = [v30 placeName];
              char v32 = v31 != 0;
            }
            else
            {
              char v32 = 0;
            }
            id v33 = [v17 places];

            if (v33)
            {
              v131 = v26;
              long long v151 = 0u;
              long long v152 = 0u;
              long long v149 = 0u;
              long long v150 = 0u;
              __int16 v34 = [v17 places];
              id v35 = [v34 countByEnumeratingWithState:&v149 objects:v178 count:16];
              if (v35)
              {
                id v36 = v35;
                uint64_t v37 = *(void *)v150;
                do
                {
                  for (j = 0; j != v36; j = (char *)j + 1)
                  {
                    if (*(void *)v150 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    v39 = [*(id *)(*((void *)&v149 + 1) + 8 * (void)j) placeName];
                    BOOL v40 = v39 != 0;

                    v32 |= v40;
                  }
                  id v36 = [v34 countByEnumeratingWithState:&v149 objects:v178 count:16];
                }
                while (v36);
              }

              a1 = v121;
              id v14 = v127;
              __int16 v26 = v131;
            }
            if (![v28 count] && (v32 & 1) == 0) {
              [v17 setIsAggregatedAndSuppressed:1];
            }

            uint64_t v15 = v129;
          }
        }
      }
      id v134 = [v14 countByEnumeratingWithState:&v153 objects:v179 count:16];
    }
    while (v134);
  }

  uint64_t v41 = +[NSPredicate predicateWithBlock:&__block_literal_global_26];
  uint64_t v42 = +[NSPredicate predicateWithBlock:&__block_literal_global_413];
  uint64_t v43 = [v120 filteredArrayUsingPredicate:v41];
  v117 = (void *)v41;
  uint64_t v44 = [*(id *)(a1 + 56) filteredArrayUsingPredicate:v41];
  uint64_t v45 = [v120 filteredArrayUsingPredicate:v42];
  v116 = (void *)v42;
  uint64_t v46 = [*(id *)(a1 + 56) filteredArrayUsingPredicate:v42];
  v47 = +[NSMutableDictionary dictionary];
  v114 = (void *)v44;
  id v111 = [*(id *)(a1 + 48) supressCoarseGranularityPropertyOfEventBundles:v44 primaryBundles:*(void *)(a1 + 40) bundleMapping:v47];
  v115 = (void *)v43;
  id v110 = [*(id *)(a1 + 48) supressCoarseGranularityPropertyOfEventBundles:v43 primaryBundles:*(void *)(a1 + 40) bundleMapping:v47];
  id v109 = [*(id *)(a1 + 48) supressCoarseGranularityPropertyOfEventBundles:v45 primaryBundles:*(void *)(a1 + 40) bundleMapping:v47];
  id v108 = [*(id *)(a1 + 48) supressCoarseGranularityPropertyOfEventBundles:v46 primaryBundles:*(void *)(a1 + 40) bundleMapping:v47];
  v113 = (void *)v45;
  id v107 = [*(id *)(a1 + 48) supressCoarseGranularityPropertyOfEventBundles:v45 primaryBundles:*(void *)(a1 + 64) bundleMapping:v47];
  v112 = (void *)v46;
  id v106 = [*(id *)(a1 + 48) supressCoarseGranularityPropertyOfEventBundles:v46 primaryBundles:*(void *)(a1 + 64) bundleMapping:v47];
  id v48 = +[NSMutableDictionary dictionary];

  id v105 = [*(id *)(a1 + 48) supressCoarseGranularityPropertyOfEventBundles:*(void *)(a1 + 72) primaryBundles:*(void *)(a1 + 64) bundleMapping:v48];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  __int16 v49 = [v48 allKeys];
  id v125 = [v49 countByEnumeratingWithState:&v145 objects:v177 count:16];
  if (v125)
  {
    uint64_t v124 = *(void *)v146;
    v122 = v49;
    v123 = v48;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v146 != v124) {
          objc_enumerationMutation(v49);
        }
        uint64_t v126 = v50;
        __int16 v51 = *(void **)(*((void *)&v145 + 1) + 8 * v50);
        id v52 = [v48 objectForKey:v51];
        v53 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v158 = v51;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "summary trip Bundle : %@ maps to :", buf, 0xCu);
        }

        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        id v54 = v52;
        id v55 = [v54 countByEnumeratingWithState:&v141 objects:v176 count:16];
        id obj = v54;
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v142;
          do
          {
            for (k = 0; k != v56; k = (char *)k + 1)
            {
              if (*(void *)v142 != v57) {
                objc_enumerationMutation(obj);
              }
              v59 = *(void **)(*((void *)&v141 + 1) + 8 * (void)k);
              v60 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v158 = v59;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "daily trip bundles : %@", buf, 0xCu);
              }
            }
            id v54 = obj;
            id v56 = [obj countByEnumeratingWithState:&v141 objects:v176 count:16];
          }
          while (v56);
        }

        v61 = [v51 place];
        id v62 = [v61 placeType];

        if ((unint64_t)v62 <= 0x65 && [v54 count] == (id)1)
        {
          v63 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "Maps to one daily trip bundle.", buf, 2u);
          }

          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v128 = v54;
          id v132 = [v128 countByEnumeratingWithState:&v137 objects:v175 count:16];
          if (v132)
          {
            uint64_t v130 = *(void *)v138;
            do
            {
              for (m = 0; m != v132; m = (char *)m + 1)
              {
                if (*(void *)v138 != v130) {
                  objc_enumerationMutation(v128);
                }
                v65 = *(void **)(*((void *)&v137 + 1) + 8 * (void)m);
                [v65 setIsAggregatedAndSuppressed:0];
                [v51 setIsAggregatedAndSuppressed:1];
                v66 = objc_opt_new();
                v67 = [v65 subBundleIDs];
                [v66 addObjectsFromArray:v67];

                v68 = [v51 bundleIdentifier];
                v69 = [v68 UUIDString];
                [v66 addObject:v69];

                id v70 = [v66 copy];
                [v65 setSubBundleIDs:v70];

                v71 = [v51 subBundleIDs];
                v72 = [v65 bundleIdentifier];
                v73 = [v72 UUIDString];
                unsigned int v74 = [v71 containsObject:v73];

                if (v74)
                {
                  v75 = [v51 subBundleIDs];
                  v136[0] = _NSConcreteStackBlock;
                  v136[1] = 3221225472;
                  v136[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_416;
                  v136[3] = &unk_1002CED68;
                  v136[4] = v65;
                  v76 = +[NSPredicate predicateWithBlock:v136];
                  v77 = [v75 filteredArrayUsingPredicate:v76];
                  [v51 setSubBundleIDs:v77];
                }
                v78 = objc_opt_new();
                v79 = [v65 subSuggestionIDs];
                [v78 addObjectsFromArray:v79];

                v80 = [v51 suggestionID];
                v81 = [v80 UUIDString];
                [v78 addObject:v81];

                id v82 = [v78 copy];
                [v65 setSubSuggestionIDs:v82];

                v83 = [v51 subSuggestionIDs];
                v84 = [v65 suggestionID];
                v85 = [v84 UUIDString];
                unsigned int v86 = [v83 containsObject:v85];

                if (v86)
                {
                  v87 = [v51 subSuggestionIDs];
                  v135[0] = _NSConcreteStackBlock;
                  v135[1] = 3221225472;
                  v135[2] = __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2_418;
                  v135[3] = &unk_1002CED68;
                  v135[4] = v65;
                  v88 = +[NSPredicate predicateWithBlock:v135];
                  v89 = [v87 filteredArrayUsingPredicate:v88];
                  [v51 setSubSuggestionIDs:v89];
                }
                v90 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v158 = v51;
                  _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "suppressed summary trip bundle : %@ ", buf, 0xCu);
                }

                v91 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v158 = v65;
                  _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "for daily trip bundle : %@", buf, 0xCu);
                }
              }
              id v132 = [v128 countByEnumeratingWithState:&v137 objects:v175 count:16];
            }
            while (v132);
          }

          __int16 v49 = v122;
          id v48 = v123;
          id v54 = obj;
        }

        uint64_t v50 = v126 + 1;
      }
      while ((id)(v126 + 1) != v125);
      id v125 = [v49 countByEnumeratingWithState:&v145 objects:v177 count:16];
    }
    while (v125);
  }

  id v92 = [*(id *)(*(void *)(*(void *)(v121 + 88) + 8) + 40) count];
  v93 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    v103 = [*(id *)(v121 + 56) count];
    v104 = [*(id *)(v121 + 32) count];
    *(_DWORD *)buf = 134220032;
    id v158 = (id)(v103 - v104);
    __int16 v159 = 2048;
    id v160 = v109;
    __int16 v161 = 2048;
    id v162 = v108;
    __int16 v163 = 2048;
    id v164 = v111;
    __int16 v165 = 2048;
    id v166 = v110;
    __int16 v167 = 2048;
    id v168 = v105;
    __int16 v169 = 2048;
    id v170 = v107;
    __int16 v171 = 2048;
    id v172 = v106;
    __int16 v173 = 2048;
    id v174 = v92;
    _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "Summarization: suppresed by dedupe, %lu, supressed by trip bundles, %lu, supressedOnCoarse by trip bundles, %lu, suppressedWorkout by trip bundles, %lu, suppressedWorkoutOnCoarse by trip bundle, %lu, suppressedTrips, %lu, suppressedOutingsBySummaryTrip, %lu, suppressedSeedBySummaryTrip, %lu, result, %lu", buf, 0x5Cu);
  }

  v95 = [*(id *)(v121 + 48) eventBundleRanking];
  [v95 generateBundleRanking:*(void *)(*(void *)(*(void *)(v121 + 88) + 8) + 40) withMinRecommendedBundleCountRequirement:0];

  uint64_t v97 = [*(id *)(v121 + 48) removeDuplicateAssetsAccrossMultipleBundleTypes:*(void *)(*(void *)(*(void *)(v121 + 88) + 8) + 40)];
  uint64_t v98 = *(void *)(*(void *)(v121 + 88) + 8);
  v99 = *(void **)(v98 + 40);
  *(void *)(v98 + 40) = v97;

  [*(id *)(v121 + 48) removeDuplicateAssetsFromMediaBundle:*(void *)(*(void *)(*(void *)(v121 + 88) + 8) + 40)];
  [*(id *)(v121 + 48) compressAssetsForThirdPartyBundles:*(void *)(*(void *)(*(void *)(v121 + 88) + 8) + 40)];
  (*(void (**)(void))(*(void *)(v121 + 80) + 16))();
}

BOOL __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_410(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  return (id)[(MOEventBundle *)a2 bundleSuperType] == (id)2;
}

BOOL __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  return (id)[(MOEventBundle *)a2 bundleSuperType] == (id)1;
}

uint64_t __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_416(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 bundleIdentifier];
  id v5 = [v4 UUIDString];
  unsigned int v6 = [v3 isEqual:v5];

  return v6 ^ 1;
}

uint64_t __85__MOSummarizationManager__aggregateEventBundles_withAggregtaionDateInterval_handler___block_invoke_2_418(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 suggestionID];
  id v5 = [v4 UUIDString];
  unsigned int v6 = [v3 isEqual:v5];

  return v6 ^ 1;
}

- (id)removeDuplicateAssetsAccrossMultipleBundleTypes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[MOSummarizationUtilities sortedBundleBasedOnGoodnessScore:v4];
    id v6 = objc_alloc_init((Class)NSMutableSet);
    id v7 = objc_alloc_init((Class)NSMutableSet);
    id v8 = objc_alloc_init((Class)NSMutableSet);
    for (uint64_t i = 0; i != 4; ++i)
    {
      [(MOSummarizationManager *)self _removeDuplicateAssetsForBundleType:v5 bundleSuperType:qword_1002BB0D8[i] musicAlbumSet:v6 podcastEpisodeSet:v7 isRecommendTab:1];
    }
    [v6 removeAllObjects];
    [v7 removeAllObjects];
    for (uint64_t j = 0; j != 4; ++j)
    {
      [(MOSummarizationManager *)self _removeDuplicateAssetsForBundleType:v5 bundleSuperType:qword_1002BB0D8[j] musicAlbumSet:v6 podcastEpisodeSet:v7 isRecommendTab:0];
    }
    [(MOSummarizationManager *)self removeDuplicateAssetsPerBundleTypeForThirdParty:v5 bundleSuperType:4 titleSet:v8 isRecommendTab:1 isMediaOnRepeat:1];
    uint64_t v13 = &dword_100000008;
    do
    {
      [(MOSummarizationManager *)self removeDuplicateAssetsPerBundleTypeForThirdParty:v5 bundleSuperType:*(uint64_t *)((char *)qword_1002BB0D8 + v13) titleSet:v8 isRecommendTab:1 isMediaOnRepeat:0];
      v13 += 8;
    }
    while (v13 != 32);
    [v8 removeAllObjects];
    [(MOSummarizationManager *)self removeDuplicateAssetsPerBundleTypeForThirdParty:v5 bundleSuperType:4 titleSet:v8 isRecommendTab:0 isMediaOnRepeat:1];
    uint64_t v15 = &dword_100000008;
    do
    {
      [(MOSummarizationManager *)self removeDuplicateAssetsPerBundleTypeForThirdParty:v5 bundleSuperType:*(uint64_t *)((char *)qword_1002BB0D8 + v15) titleSet:v8 isRecommendTab:0 isMediaOnRepeat:0];
      v15 += 8;
    }
    while (v15 != 32);
    id v16 = [objc_alloc((Class)NSMutableArray) initWithArray:v5];
  }
  else
  {
    id v16 = v4;
  }

  return v16;
}

- (void)_removeDuplicateAssetsForBundleType:(id)a3 bundleSuperType:(unint64_t)a4 musicAlbumSet:(id)a5 podcastEpisodeSet:(id)a6 isRecommendTab:(BOOL)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count])
  {
    id v55 = v13;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = __125__MOSummarizationManager__removeDuplicateAssetsForBundleType_bundleSuperType_musicAlbumSet_podcastEpisodeSet_isRecommendTab___block_invoke;
    v72[3] = &__block_descriptor_41_e40_B24__0__MOEventBundle_8__NSDictionary_16l;
    v72[4] = a4;
    BOOL v73 = a7;
    uint64_t v46 = +[NSPredicate predicateWithBlock:v72];
    id v47 = v11;
    [v11 filteredArrayUsingPredicate:];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (!v14) {
      goto LABEL_58;
    }
    id v15 = v14;
    uint64_t v16 = *(void *)v69;
    uint64_t v57 = v12;
    unint64_t v54 = a4;
    uint64_t v48 = *(void *)v69;
    while (1)
    {
      id v17 = 0;
      id v50 = v15;
      do
      {
        if (*(void *)v69 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v17);
        uint64_t v19 = [v18 resources];
        if (v19)
        {
          id v20 = (void *)v19;
          double v21 = [v18 resources];
          id v22 = [v21 count];

          if (v22)
          {
            id v52 = v17;
            uint64_t v23 = [v18 resources];
            float v24 = [(MOSummarizationManager *)self _sortResourcesByPriorityScore:v23];

            id v59 = objc_alloc_init((Class)NSMutableArray);
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v25 = v24;
            id v26 = [v25 countByEnumeratingWithState:&v64 objects:v77 count:16];
            id v58 = v25;
            if (!v26)
            {
              int v56 = 0;
              goto LABEL_39;
            }
            id v27 = v26;
            int v56 = 0;
            uint64_t v28 = *(void *)v65;
            while (1)
            {
              for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v65 != v28) {
                  objc_enumerationMutation(v25);
                }
                id v30 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                id v32 = [v30 type];
                if ([v18 bundleSuperType] == (id)a4 && v32 == (id)3)
                {
                  id v33 = [v30 getDictionary];
                  __int16 v34 = [v33 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

                  if (([v34 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]] & 1) != 0|| objc_msgSend(v34, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeSong[0]))
                  {
                    id v35 = [v30 getDictionary];
                    id v36 = [v35 objectForKey:@"MOMediaPlayMetaDataKeyPlayerAlbumName"];

                    if (v36)
                    {
                      id v12 = v57;
                      if ([v57 containsObject:v36])
                      {
                        if ([v57 containsObject:v36]
                          && [v18 bundleSuperType] != (id)4)
                        {
                          [v59 addObject:v30];
                        }
                      }
                      else
                      {
                        [v57 addObject:v36];
                        ++v56;
                      }
                      goto LABEL_33;
                    }
LABEL_29:
                    id v12 = v57;
                    goto LABEL_33;
                  }
                  if (([v34 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]] & 1) != 0|| objc_msgSend(v34, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode[0]))
                  {
                    uint64_t v37 = [v30 getDictionary];
                    id v36 = [v37 objectForKey:@"MOMediaPlayMetaDataKeyPlayerArtist"];

                    if (!v36) {
                      goto LABEL_29;
                    }
                    if ([v55 containsObject:v36])
                    {
                      if ([v55 containsObject:v36]) {
                        [v59 addObject:v30];
                      }
                    }
                    else
                    {
                      [v55 addObject:v36];
                      ++v56;
                    }
                    id v12 = v57;
                    a4 = v54;
LABEL_33:
                  }
                  id v25 = v58;
                }
              }
              id v27 = [v25 countByEnumeratingWithState:&v64 objects:v77 count:16];
              if (!v27)
              {
LABEL_39:

                if ([v59 count])
                {
                  id v38 = objc_alloc_init((Class)NSMutableArray);
                  long long v60 = 0u;
                  long long v61 = 0u;
                  long long v62 = 0u;
                  long long v63 = 0u;
                  id v39 = v25;
                  id v40 = [v39 countByEnumeratingWithState:&v60 objects:v76 count:16];
                  if (v40)
                  {
                    id v41 = v40;
                    uint64_t v42 = *(void *)v61;
                    do
                    {
                      for (uint64_t j = 0; j != v41; uint64_t j = (char *)j + 1)
                      {
                        if (*(void *)v61 != v42) {
                          objc_enumerationMutation(v39);
                        }
                        uint64_t v44 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
                        if ([v59 containsObject:v44])
                        {
                          uint64_t v45 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            uint64_t v75 = v44;
                            _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Media resource is removed, %@", buf, 0xCu);
                          }
                        }
                        else
                        {
                          [v38 addObject:v44];
                        }
                      }
                      id v41 = [v39 countByEnumeratingWithState:&v60 objects:v76 count:16];
                    }
                    while (v41);
                  }

                  if (!v56) {
                    [v18 setConcurrentMediaAction:0];
                  }
                  [v18 setResources:v38];

                  id v25 = v58;
                }

                uint64_t v16 = v48;
                id v15 = v50;
                id v17 = v52;
                break;
              }
            }
          }
        }
        id v17 = (char *)v17 + 1;
      }
      while (v17 != v15);
      id v15 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
      if (!v15)
      {
LABEL_58:

        id v11 = v47;
        id v13 = v55;
        break;
      }
    }
  }
}

uint64_t __125__MOSummarizationManager__removeDuplicateAssetsForBundleType_bundleSuperType_musicAlbumSet_podcastEpisodeSet_isRecommendTab___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 bundleSuperType] == *(id *)(a1 + 32) && objc_msgSend(v3, "bundleSuperType") != (id)4)
  {
    uint64_t v4 = [v3 rankingDictionary];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [v3 rankingDictionary];
      id v7 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];

      if (v7)
      {
        id v8 = [v3 rankingDictionary];
        id v9 = [v8 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        unsigned int v10 = [v9 unsignedIntValue];

        if ((!*(unsigned char *)(a1 + 40) || v10 - 1 >= 2) && (*(unsigned char *)(a1 + 40) || (v10 & 0xFFFFFFFD) != 1)) {
          goto LABEL_18;
        }
        goto LABEL_19;
      }
    }
  }
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_17;
  }
  if ([v3 bundleSuperType] == (id)4
    && [v3 bundleSubType] == (id)404
    && ![v3 isAggregatedAndSuppressed])
  {
    goto LABEL_19;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
LABEL_17:
    if ([v3 bundleSuperType] == (id)4
      && [v3 bundleSubType] == (id)401
      && ![v3 isAggregatedAndSuppressed])
    {
LABEL_19:
      uint64_t v11 = 1;
      goto LABEL_20;
    }
  }
LABEL_18:
  uint64_t v11 = 0;
LABEL_20:

  return v11;
}

- (void)compressAssetsForThirdPartyBundles:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[MOSummarizationManager _compressAssetsForThirdPartyBundle:](self, "_compressAssetsForThirdPartyBundle:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_compressAssetsForThirdPartyBundle:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3
    || [v3 bundleSuperType] != (id)4
    && [v4 bundleSuperType] != (id)2
    && [v4 bundleSuperType] != (id)1
    && [v4 bundleSuperType] != (id)5)
  {
    goto LABEL_66;
  }
  if ([v4 isAggregatedAndSuppressed]) {
    goto LABEL_66;
  }
  if ([v4 bundleSuperType] != (id)4)
  {
    uint64_t v5 = [v4 rankingDictionary];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [v4 rankingDictionary];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"visibilityCategoryForUI"];

      if (v8)
      {
        id v9 = [v4 rankingDictionary];
        long long v10 = [v9 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        unsigned int v11 = [v10 unsignedIntValue];

        if (v11 == 4) {
          goto LABEL_66;
        }
      }
    }
  }
  long long v65 = objc_opt_new();
  id v59 = v4;
  long long v60 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = [v4 resources];
  id v12 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (!v12)
  {
    int v14 = 0;
    goto LABEL_35;
  }
  id v13 = v12;
  int v14 = 0;
  uint64_t v15 = *(void *)v75;
  do
  {
    for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v75 != v15) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      if ([v17 type] == (id)3)
      {
        uint64_t v19 = [v17 getDictionary];
        id v20 = [v19 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

        if (([v20 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]] & 1) != 0|| (objc_msgSend(v20, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]) & 1) != 0|| objc_msgSend(v20, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaArtist))
        {
          double v21 = [v17 getDictionary];
          id v22 = [v21 objectForKey:@"MOMediaPlayMetaDataKeyPlayerAlbumName"];

          uint64_t v23 = [v17 getDictionary];
          float v24 = [(MOSummarizationManager *)self _getThirdPartyKeyByAlbumArtist:v23 albumOrArtist:v22];

          if (!v22) {
            goto LABEL_26;
          }
          if (([v22 isEqualToString:&stru_1002D2AC8] & 1) == 0)
          {
            id v25 = [v65 objectForKeyedSubscript:v24];

            if (v25)
            {
              id v26 = [v65 objectForKeyedSubscript:v24];
              [v26 addObject:v17];
              goto LABEL_28;
            }
          }
          if (([v22 isEqualToString:&stru_1002D2AC8] & 1) != 0
            || ([v65 objectForKeyedSubscript:v24],
                id v27 = objc_claimAutoreleasedReturnValue(),
                v27,
                v27))
          {
LABEL_26:
            [v60 addObject:v17];
          }
          else
          {
            id v26 = objc_opt_new();
            [v26 addObject:v17];
            [v65 setValue:v26 forKey:v24];
LABEL_28:
          }
          ++v14;
        }
      }
    }
    id v13 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  }
  while (v13);
LABEL_35:

  uint64_t v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    [(MOSummarizationManager *)v65 _compressAssetsForThirdPartyBundle:v28];
  }

  id v29 = [v65 count];
  id v4 = v59;
  if (v29 != (id)(v14 - (void)[v60 count]))
  {
    id obja = (id)objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v30 = [v59 resources];
    id v31 = [v30 countByEnumeratingWithState:&v70 objects:v85 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v32; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v71 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
          if ([v35 type] == (id)3)
          {
            uint64_t v37 = [v35 getDictionary];
            id v38 = [v37 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

            if (([v38 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]] & 1) == 0&& (objc_msgSend(v38, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]) & 1) == 0&& (objc_msgSend(v38, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaArtist) & 1) == 0)
            {
              [obja addObject:v35];
            }
          }
          else
          {
            [obja addObject:v35];
          }
        }
        id v32 = [v30 countByEnumeratingWithState:&v70 objects:v85 count:16];
      }
      while (v32);
    }

    [obja addObjectsFromArray:v60];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v62 = [v65 allKeys];
    id v39 = [v62 countByEnumeratingWithState:&v66 objects:v84 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v67;
      do
      {
        for (k = 0; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v67 != v41) {
            objc_enumerationMutation(v62);
          }
          uint64_t v43 = *(void *)(*((void *)&v66 + 1) + 8 * (void)k);
          uint64_t v45 = [v65 objectForKeyedSubscript:v43];
          uint64_t v46 = [v45 objectAtIndexedSubscript:0];

          id v47 = [v65 objectForKeyedSubscript:v43];
          id v48 = [v47 count];

          if (v48 == (id)1)
          {
            [obja addObject:v46];
          }
          else
          {
            id v49 = objc_alloc((Class)NSMutableDictionary);
            id v50 = [v46 getDictionary];
            id v51 = [v49 initWithDictionary:v50];

            [v51 setValue:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0] forKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];
            id v52 = [MOResource alloc];
            v53 = [v46 name];
            unint64_t v54 = -[MOResource initWithName:type:dict:value:](v52, "initWithName:type:dict:value:", v53, [v46 type], v51, 0.0);

            id v55 = [v46 sourceEventIdentifier];
            [(MOResource *)v54 setSourceEventIdentifier:v55];

            -[MOResource setSourceEventAccessType:](v54, "setSourceEventAccessType:", [v46 sourceEventAccessType]);
            [v46 priorityScore];
            -[MOResource setPriorityScore:](v54, "setPriorityScore:");
            [obja addObject:v54];
            int v56 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v57 = [v46 name];
              id v58 = [v46 type];
              *(_DWORD *)buf = 138412802;
              uint64_t v79 = v43;
              __int16 v80 = 2112;
              v81 = v57;
              __int16 v82 = 2048;
              id v83 = v58;
              _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Compress assets by album, %@, name , %@, type, %lu", buf, 0x20u);
            }
          }
        }
        id v40 = [v62 countByEnumeratingWithState:&v66 objects:v84 count:16];
      }
      while (v40);
    }

    id v4 = v59;
    [v59 setResources:obja];
  }
LABEL_66:
}

- (void)removeDuplicateAssetsPerBundleTypeForThirdParty:(id)a3 bundleSuperType:(unint64_t)a4 titleSet:(id)a5 isRecommendTab:(BOOL)a6 isMediaOnRepeat:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a5;
  if ([v11 count])
  {
    int v56 = v12;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = __130__MOSummarizationManager_removeDuplicateAssetsPerBundleTypeForThirdParty_bundleSuperType_titleSet_isRecommendTab_isMediaOnRepeat___block_invoke;
    v73[3] = &__block_descriptor_42_e40_B24__0__MOEventBundle_8__NSDictionary_16l;
    v73[4] = a4;
    BOOL v74 = a6;
    BOOL v75 = v7;
    id v49 = +[NSPredicate predicateWithBlock:v73];
    id v50 = v11;
    [v11 filteredArrayUsingPredicate:];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (!v13) {
      goto LABEL_55;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v70;
    uint64_t v51 = *(void *)v70;
    while (1)
    {
      uint64_t v16 = 0;
      id v52 = v14;
      do
      {
        if (*(void *)v70 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v16);
        uint64_t v18 = [v17 resources];
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          id v20 = [v17 resources];
          id v21 = [v20 count];

          if (v21)
          {
            unint64_t v54 = v16;
            id v22 = [v17 resources];
            uint64_t v23 = [(MOSummarizationManager *)self _sortResourcesByPriorityScore:v22];

            id v60 = objc_alloc_init((Class)NSMutableArray);
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v24 = v23;
            id v25 = [v24 countByEnumeratingWithState:&v65 objects:v79 count:16];
            id v58 = v24;
            if (!v25)
            {
              int v55 = 0;
              goto LABEL_33;
            }
            id v26 = v25;
            int v55 = 0;
            uint64_t v27 = *(void *)v66;
            while (1)
            {
              uint64_t v28 = 0;
              id v59 = v26;
              do
              {
                if (*(void *)v66 != v27) {
                  objc_enumerationMutation(v24);
                }
                id v29 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v28);
                id v31 = [v29 type];
                if ([v17 bundleSuperType] == (id)a4 && v31 == (id)3)
                {
                  id v32 = [v29 getDictionary];
                  uint64_t v33 = [v32 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

                  if (([v33 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]] & 1) == 0&& !objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]))
                  {
                    goto LABEL_28;
                  }
                  __int16 v34 = v17;
                  unint64_t v35 = a4;
                  [v29 getDictionary];
                  uint64_t v37 = v36 = v7;
                  id v38 = [(MOSummarizationManager *)self _getThirdPartyTitleKey:v37];

                  BOOL v7 = v36;
                  if (v36)
                  {
                    if (v38)
                    {
                      a4 = v35;
                      if (([v56 containsObject:v38] & 1) == 0)
                      {
                        [v56 addObject:v38];
                        ++v55;
                      }
LABEL_27:
                      id v17 = v34;

                      id v24 = v58;
LABEL_28:
                      id v26 = v59;

                      goto LABEL_29;
                    }
                  }
                  else if (v38 && ([v56 containsObject:v38] & 1) == 0)
                  {
                    [v56 addObject:v38];
                    ++v55;
                  }
                  else
                  {
                    [v60 addObject:v29];
                  }
                  a4 = v35;
                  goto LABEL_27;
                }
LABEL_29:
                uint64_t v28 = (char *)v28 + 1;
              }
              while (v26 != v28);
              id v26 = [v24 countByEnumeratingWithState:&v65 objects:v79 count:16];
              if (!v26)
              {
LABEL_33:

                if ([v60 count])
                {
                  id v39 = objc_alloc_init((Class)NSMutableArray);
                  long long v61 = 0u;
                  long long v62 = 0u;
                  long long v63 = 0u;
                  long long v64 = 0u;
                  id v40 = v24;
                  id v41 = [v40 countByEnumeratingWithState:&v61 objects:v78 count:16];
                  if (v41)
                  {
                    id v42 = v41;
                    uint64_t v43 = *(void *)v62;
                    do
                    {
                      for (uint64_t i = 0; i != v42; uint64_t i = (char *)i + 1)
                      {
                        if (*(void *)v62 != v43) {
                          objc_enumerationMutation(v40);
                        }
                        uint64_t v45 = *(void *)(*((void *)&v61 + 1) + 8 * i);
                        if ([v60 containsObject:v45])
                        {
                          uint64_t v46 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            uint64_t v77 = v45;
                            _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Media resource is removed, %@", buf, 0xCu);
                          }
                        }
                        else
                        {
                          [v39 addObject:v45];
                        }
                      }
                      id v42 = [v40 countByEnumeratingWithState:&v61 objects:v78 count:16];
                    }
                    while (v42);
                  }

                  if (!v55) {
                    [v17 setConcurrentMediaAction:0];
                  }
                  [v17 setResources:v39];
                  if ([v17 bundleSuperType] == (id)4)
                  {
                    id v47 = [v17 resources];
                    id v48 = [v47 count];

                    if (!v48) {
                      [v17 setIsAggregatedAndSuppressed:1];
                    }
                  }

                  id v24 = v58;
                }

                uint64_t v15 = v51;
                id v14 = v52;
                uint64_t v16 = v54;
                break;
              }
            }
          }
        }
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v16 != v14);
      id v14 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
      if (!v14)
      {
LABEL_55:

        id v11 = v50;
        id v12 = v56;
        break;
      }
    }
  }
}

uint64_t __130__MOSummarizationManager_removeDuplicateAssetsPerBundleTypeForThirdParty_bundleSuperType_titleSet_isRecommendTab_isMediaOnRepeat___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 bundleSuperType] == *(id *)(a1 + 32) && objc_msgSend(v3, "bundleSuperType") != (id)4)
  {
    uint64_t v4 = [v3 rankingDictionary];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = [v3 rankingDictionary];
      BOOL v7 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];

      if (v7)
      {
        uint64_t v8 = [v3 rankingDictionary];
        id v9 = [v8 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        unsigned int v10 = [v9 unsignedIntValue];

        if ((!*(unsigned char *)(a1 + 40) || v10 - 1 >= 2) && (*(unsigned char *)(a1 + 40) || (v10 & 0xFFFFFFFD) != 1)) {
          goto LABEL_16;
        }
LABEL_26:
        uint64_t v11 = 1;
        goto LABEL_27;
      }
    }
  }
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_30;
  }
  if ([v3 bundleSuperType] == (id)4
    && ([v3 isAggregatedAndSuppressed] & 1) == 0)
  {
    if (!*(unsigned char *)(a1 + 41)) {
      goto LABEL_20;
    }
    if ([v3 bundleSubType] == (id)409) {
      goto LABEL_26;
    }
    if (!*(unsigned char *)(a1 + 41))
    {
LABEL_20:
      if ([v3 bundleSubType] == (id)410) {
        goto LABEL_26;
      }
    }
  }
  if (!*(unsigned char *)(a1 + 40))
  {
LABEL_30:
    if ([v3 bundleSuperType] == (id)4
      && ([v3 isAggregatedAndSuppressed] & 1) == 0)
    {
      if (!*(unsigned char *)(a1 + 41)) {
        goto LABEL_25;
      }
      if ([v3 bundleSubType] == (id)407) {
        goto LABEL_26;
      }
      if (!*(unsigned char *)(a1 + 41))
      {
LABEL_25:
        if ([v3 bundleSubType] == (id)408) {
          goto LABEL_26;
        }
      }
    }
  }
LABEL_16:
  uint64_t v11 = 0;
LABEL_27:

  return v11;
}

- (void)removeDuplicateAssetsFromMediaBundle:(id)a3
{
  id v12 = a3;
  if ([v12 count])
  {
    uint64_t v4 = +[NSPredicate predicateWithBlock:&__block_literal_global_426];
    uint64_t v5 = [v12 filteredArrayUsingPredicate:v4];
    [(MOSummarizationManager *)self _dedupAssetForMediaBundle:v12 nonPlayedMediaBudnles:v5 isRecommendTab:1];
    id v6 = +[NSPredicate predicateWithBlock:&__block_literal_global_428];
    BOOL v7 = [v12 filteredArrayUsingPredicate:v6];
    [(MOSummarizationManager *)self _dedupAssetForMediaBundle:v12 nonPlayedMediaBudnles:v7 isRecommendTab:0];
    uint64_t v8 = +[NSPredicate predicateWithBlock:&__block_literal_global_430];
    id v9 = [v12 filteredArrayUsingPredicate:v8];
    [(MOSummarizationManager *)self dedupAssetForMediaBundleThirdParty:v12 nonPlayedMediaBudnles:v9 isRecommendTab:1];
    unsigned int v10 = +[NSPredicate predicateWithBlock:&__block_literal_global_432];
    uint64_t v11 = [v12 filteredArrayUsingPredicate:v10];
    [(MOSummarizationManager *)self dedupAssetForMediaBundleThirdParty:v12 nonPlayedMediaBudnles:v11 isRecommendTab:0];
  }
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  id v3 = a2;
  if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4) {
    goto LABEL_8;
  }
  uint64_t v4 = [(MOEventBundle *)v3 rankingDictionary];
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(MOEventBundle *)v3 rankingDictionary];
  BOOL v7 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];

  if (v7)
  {
    uint64_t v8 = [(MOEventBundle *)v3 rankingDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 - 4 >= 0xFFFFFFFD)
    {
LABEL_10:
      BOOL v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {
LABEL_8:
    if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4
      && (id)[(MOEventBundle *)v3 bundleSubType] == (id)404
      && ![(MOEventBundle *)v3 isAggregatedAndSuppressed])
    {
      goto LABEL_10;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke_2(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  id v3 = a2;
  if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4) {
    goto LABEL_8;
  }
  uint64_t v4 = [(MOEventBundle *)v3 rankingDictionary];
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(MOEventBundle *)v3 rankingDictionary];
  BOOL v7 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];

  if (v7)
  {
    uint64_t v8 = [(MOEventBundle *)v3 rankingDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v10 = [v9 unsignedIntValue];

    if ((v10 & 0xFFFFFFFD) == 1)
    {
LABEL_10:
      BOOL v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {
LABEL_8:
    if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4
      && (id)[(MOEventBundle *)v3 bundleSubType] == (id)401
      && ![(MOEventBundle *)v3 isAggregatedAndSuppressed])
    {
      goto LABEL_10;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke_3(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  id v3 = a2;
  if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4) {
    goto LABEL_8;
  }
  uint64_t v4 = [(MOEventBundle *)v3 rankingDictionary];
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(MOEventBundle *)v3 rankingDictionary];
  BOOL v7 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];

  if (v7)
  {
    uint64_t v8 = [(MOEventBundle *)v3 rankingDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10 - 4 >= 0xFFFFFFFD)
    {
LABEL_10:
      BOOL v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {
LABEL_8:
    if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4
      && (id)[(MOEventBundle *)v3 bundleSubType] == (id)409
      && ![(MOEventBundle *)v3 isAggregatedAndSuppressed])
    {
      goto LABEL_10;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

BOOL __63__MOSummarizationManager_removeDuplicateAssetsFromMediaBundle___block_invoke_4(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  id v3 = a2;
  if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4) {
    goto LABEL_8;
  }
  uint64_t v4 = [(MOEventBundle *)v3 rankingDictionary];
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(MOEventBundle *)v3 rankingDictionary];
  BOOL v7 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];

  if (v7)
  {
    uint64_t v8 = [(MOEventBundle *)v3 rankingDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v10 = [v9 unsignedIntValue];

    if ((v10 & 0xFFFFFFFD) == 1)
    {
LABEL_10:
      BOOL v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {
LABEL_8:
    if ((id)[(MOEventBundle *)v3 bundleSuperType] == (id)4
      && (id)[(MOEventBundle *)v3 bundleSubType] == (id)407
      && ![(MOEventBundle *)v3 isAggregatedAndSuppressed])
    {
      goto LABEL_10;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)_dedupAssetForMediaBundle:(id)a3 nonPlayedMediaBudnles:(id)a4 isRecommendTab:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    BOOL v63 = v5;
    long long v62 = v7;
    uint64_t v9 = +[NSCalendar currentCalendar];
    id v10 = objc_alloc_init((Class)NSDateFormatter);
    id v60 = (void *)v9;
    [v10 setCalendar:v9];
    long long v72 = v10;
    [v10 setDateFormat:@"yyyy-MM-dd"];
    id v73 = objc_alloc_init((Class)NSMutableSet);
    id v70 = objc_alloc_init((Class)NSMutableSet);
    id v71 = objc_alloc_init((Class)NSMutableDictionary);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v61 = v8;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (!v11) {
      goto LABEL_41;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v83;
    uint64_t v64 = *(void *)v83;
    do
    {
      id v14 = 0;
      id v65 = v12;
      do
      {
        if (*(void *)v83 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v14);
        uint64_t v17 = [v15 resources];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          uint64_t v19 = [v15 resources];
          id v20 = [v19 count];

          if (v20)
          {
            long long v68 = v16;
            long long v69 = v14;
            id v21 = [v15 resources];
            id v22 = [(MOSummarizationManager *)self _sortResourcesByPriorityScore:v21];

            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id v23 = v22;
            id v24 = [v23 countByEnumeratingWithState:&v78 objects:v87 count:16];
            if (!v24) {
              goto LABEL_38;
            }
            id v25 = v24;
            uint64_t v26 = *(void *)v79;
            while (1)
            {
              for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v79 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void **)(*((void *)&v78 + 1) + 8 * i);
                id v30 = [v28 type];
                if ([v15 bundleSuperType] != (id)4 && v30 == (id)3)
                {
                  id v31 = [v28 getDictionary];
                  id v32 = [v31 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

                  if (([v32 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]] & 1) != 0|| objc_msgSend(v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeSong[0]))
                  {
                    uint64_t v33 = [v28 getDictionary];
                    __int16 v34 = [v33 objectForKey:@"MOMediaPlayMetaDataKeyPlayerAlbumName"];

                    if (!v34) {
                      goto LABEL_34;
                    }
                    unint64_t v35 = v73;
                  }
                  else
                  {
                    if (([v32 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]] & 1) == 0&& !objc_msgSend(v32, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode[0]))
                    {
                      goto LABEL_35;
                    }
                    id v40 = [v28 getDictionary];
                    __int16 v34 = [v40 objectForKey:@"MOMediaPlayMetaDataKeyPlayerArtist"];

                    if (!v34) {
                      goto LABEL_34;
                    }
                    unint64_t v35 = v70;
                  }
                  if (([v35 containsObject:v34] & 1) == 0) {
                    [v35 addObject:v34];
                  }
LABEL_34:

LABEL_35:
                  goto LABEL_36;
                }
                if ([v15 bundleSuperType] == (id)4
                  && ([v15 bundleSubType] == (id)401 || objc_msgSend(v15, "bundleSubType") == (id)404))
                {
                  BOOL v36 = [v28 getDictionary];
                  id v32 = [v36 objectForKey:@"MOMediaPlayMetaDataKeyPlayerAlbumName"];

                  if (v32)
                  {
                    uint64_t v37 = [v15 startDate];
                    __int16 v34 = [v72 stringFromDate:v37];

                    id v38 = [v71 objectForKey:v34];

                    if (v38)
                    {
                      id v39 = [v71 objectForKey:v34];
                    }
                    else
                    {
                      id v39 = objc_alloc_init((Class)NSMutableSet);
                    }
                    id v41 = v39;
                    [v39 addObject:v32];
                    [v71 setObject:v41 forKey:v34];

                    goto LABEL_34;
                  }
                  goto LABEL_35;
                }
LABEL_36:
              }
              id v25 = [v23 countByEnumeratingWithState:&v78 objects:v87 count:16];
              if (!v25)
              {
LABEL_38:

                uint64_t v13 = v64;
                id v12 = v65;
                uint64_t v16 = v68;
                id v14 = v69;
                break;
              }
            }
          }
        }
        id v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
    }
    while (v12);
LABEL_41:

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v42 = v62;
    id v43 = [v42 countByEnumeratingWithState:&v74 objects:v86 count:16];
    BOOL v44 = v63;
    if (!v43) {
      goto LABEL_67;
    }
    id v45 = v43;
    uint64_t v46 = *(void *)v75;
LABEL_43:
    uint64_t v47 = 0;
    while (1)
    {
      if (*(void *)v75 != v46) {
        objc_enumerationMutation(v42);
      }
      id v48 = *(void **)(*((void *)&v74 + 1) + 8 * v47);
      id v49 = [v48 bundleSuperType];
      if (v44)
      {
        if (v49 != (id)4 || [v48 summarizationGranularity] != (id)2) {
          goto LABEL_65;
        }
      }
      else if (v49 != (id)4 || [v48 summarizationGranularity] != (id)1)
      {
        goto LABEL_65;
      }
      if (([v48 isAggregatedAndSuppressed] & 1) == 0) {
        break;
      }
LABEL_65:
      if (v45 == (id)++v47)
      {
        id v45 = [v42 countByEnumeratingWithState:&v74 objects:v86 count:16];
        if (!v45)
        {
LABEL_67:

          id v8 = v61;
          id v7 = v62;
          goto LABEL_68;
        }
        goto LABEL_43;
      }
    }
    id v50 = [v48 startDate];
    uint64_t v51 = [v72 stringFromDate:v50];

    if ([v48 bundleSubType] == (id)402)
    {
      id v52 = [v48 resources];
      v53 = self;
      unint64_t v54 = v52;
      id v55 = v73;
      id v56 = v71;
      uint64_t v57 = v51;
      CFStringRef v58 = @"MOMediaPlayMetaDataKeyPlayerAlbumName";
    }
    else
    {
      if ([v48 bundleSubType] == (id)403)
      {
        id v52 = [v48 resources];
        v53 = self;
        unint64_t v54 = v52;
        id v55 = v70;
        id v56 = 0;
      }
      else
      {
        if ([v48 bundleSubType] != (id)405)
        {
LABEL_64:

          BOOL v44 = v63;
          goto LABEL_65;
        }
        id v52 = [v48 resources];
        v53 = self;
        unint64_t v54 = v52;
        id v55 = v70;
        id v56 = v71;
      }
      uint64_t v57 = v51;
      CFStringRef v58 = @"MOMediaPlayMetaDataKeyPlayerArtist";
    }
    id v59 = [(MOSummarizationManager *)v53 _removeDuplicateFromResource:v54 nonMediaKeySet:v55 mediaOnRepeatDict:v56 eventBundleDayKey:v57 keyName:v58];

    [v48 setResources:v59];
    if (!v59 || ![v59 count]) {
      [v48 setIsAggregatedAndSuppressed:1];
    }

    goto LABEL_64;
  }
LABEL_68:
}

- (void)dedupAssetForMediaBundleThirdParty:(id)a3 nonPlayedMediaBudnles:(id)a4 isRecommendTab:(BOOL)a5
{
  BOOL v60 = a5;
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v53 = v6;
    uint64_t v8 = +[NSCalendar currentCalendar];
    id v9 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v51 = (void *)v8;
    [v9 setCalendar:v8];
    id v59 = v9;
    [v9 setDateFormat:@"yyyy-MM-dd"];
    id v10 = objc_alloc_init((Class)NSMutableSet);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v52 = v7;
    id obj = v7;
    id v11 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (!v11) {
      goto LABEL_38;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v71;
    uint64_t v54 = *(void *)v71;
    do
    {
      id v14 = 0;
      id v55 = v12;
      do
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v14);
        uint64_t v17 = [v15 resources];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          uint64_t v19 = [v15 resources];
          id v20 = [v19 count];

          if (v20)
          {
            uint64_t v57 = v16;
            CFStringRef v58 = v14;
            id v21 = v10;
            id v22 = [v15 resources];
            id v23 = [(MOSummarizationManager *)self _sortResourcesByPriorityScore:v22];

            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v24 = v23;
            id v25 = [v24 countByEnumeratingWithState:&v66 objects:v75 count:16];
            if (!v25) {
              goto LABEL_35;
            }
            id v26 = v25;
            uint64_t v27 = *(void *)v67;
            while (1)
            {
              for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v67 != v27) {
                  objc_enumerationMutation(v24);
                }
                id v29 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                id v31 = [v29 type];
                if ([v15 bundleSuperType] != (id)4 && v31 == (id)3)
                {
                  id v32 = [v29 getDictionary];
                  uint64_t v33 = [v32 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

                  if (([v33 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]] & 1) != 0|| (objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]) & 1) != 0|| objc_msgSend(v33, "isEqualToString:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaArtist))
                  {
                    __int16 v34 = [v29 getDictionary];
                    unint64_t v35 = [(MOSummarizationManager *)self _getThirdPartyTitleKey:v34];

                    if (v35 && ([v21 containsObject:v35] & 1) == 0) {
                      [v21 addObject:v35];
                    }
                  }
LABEL_23:

                  goto LABEL_33;
                }
                if ([v15 bundleSuperType] == (id)4)
                {
                  id v36 = [v15 bundleSubType];
                  if (v60)
                  {
                    if (v36 == (id)409)
                    {
                      uint64_t v37 = [v29 getDictionary];
                      uint64_t v33 = [(MOSummarizationManager *)self _getThirdPartyTitleKey:v37];
LABEL_30:

                      if (v33 && ([v21 containsObject:v33] & 1) == 0) {
                        [v21 addObject:v33];
                      }
                      goto LABEL_23;
                    }
                  }
                  else if (v36 == (id)407)
                  {
                    id v38 = [v15 startDate];
                    uint64_t v37 = [v59 stringFromDate:v38];

                    id v39 = [v29 getDictionary];
                    uint64_t v33 = [(MOSummarizationManager *)self _getThirdPartyTitleKey:v39 dayKey:v37 isRecommendTab:0];

                    goto LABEL_30;
                  }
                }
LABEL_33:
              }
              id v26 = [v24 countByEnumeratingWithState:&v66 objects:v75 count:16];
              if (!v26)
              {
LABEL_35:

                id v10 = v21;
                uint64_t v13 = v54;
                id v12 = v55;
                uint64_t v16 = v57;
                id v14 = v58;
                break;
              }
            }
          }
        }
        id v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    }
    while (v12);
LABEL_38:

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v6 = v53;
    id v40 = v53;
    id v41 = [v40 countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (!v41) {
      goto LABEL_62;
    }
    id v42 = v41;
    uint64_t v43 = *(void *)v63;
LABEL_40:
    uint64_t v44 = 0;
    while (1)
    {
      if (*(void *)v63 != v43) {
        objc_enumerationMutation(v40);
      }
      id v45 = *(void **)(*((void *)&v62 + 1) + 8 * v44);
      id v46 = [v45 bundleSuperType];
      if (v60)
      {
        if (v46 == (id)4
          && [v45 summarizationGranularity] == (id)2
          && ([v45 isAggregatedAndSuppressed] & 1) == 0
          && [v45 bundleSubType] == (id)410)
        {
          goto LABEL_53;
        }
      }
      else if (v46 == (id)4 {
             && [v45 summarizationGranularity] == (id)1
      }
             && ([v45 isAggregatedAndSuppressed] & 1) == 0
             && [v45 bundleSubType] == (id)408)
      {
LABEL_53:
        uint64_t v47 = [v45 startDate];
        id v48 = [v59 stringFromDate:v47];

        if ([v45 bundleSubType] == (id)408 || objc_msgSend(v45, "bundleSubType") == (id)410)
        {
          id v49 = [v45 resources];
          id v50 = [(MOSummarizationManager *)self _removeDuplicateFromResourceThridParty:v49 mediaKeySet:v10 dayKey:v48 isRecommendTab:v60];

          [v45 setResources:v50];
          if (!v50 || ![v50 count]) {
            [v45 setIsAggregatedAndSuppressed:1];
          }
        }
      }
      if (v42 == (id)++v44)
      {
        id v42 = [v40 countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (!v42)
        {
LABEL_62:

          id v7 = v52;
          break;
        }
        goto LABEL_40;
      }
    }
  }
}

- (id)_sortResourcesByPriorityScore:(id)a3
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_440_0];
}

int64_t __56__MOSummarizationManager__sortResourcesByPriorityScore___block_invoke(id a1, MOResource *a2, MOResource *a3)
{
  uint64_t v4 = a2;
  BOOL v5 = a3;
  [(MOResource *)v4 priorityScore];
  double v7 = v6;
  [(MOResource *)v5 priorityScore];
  if (v7 >= v8)
  {
    [(MOResource *)v4 priorityScore];
    double v11 = v10;
    [(MOResource *)v5 priorityScore];
    if (v11 <= v12)
    {
      uint64_t v13 = [(MOResource *)v4 identifier];
      id v14 = [(MOResource *)v5 identifier];
      int64_t v9 = (int64_t)[v13 compare:v14];
    }
    else
    {
      int64_t v9 = 1;
    }
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (id)_getThirdPartyKeyByAlbumArtist:(id)a3 albumOrArtist:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
  double v7 = (void *)v6;
  double v8 = 0;
  if (v5 && v6)
  {
    double v8 = +[NSString stringWithFormat:@"%@_%@", v5, v6];
  }

  return v8;
}

- (id)_getThirdPartyTitleKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
  id v5 = [v3 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    double v7 = 0;
  }
  else
  {
    double v7 = +[NSString stringWithFormat:@"%@_%@", v4, v5];
  }

  return v7;
}

- (id)_getThirdPartyTitleKey:(id)a3 dayKey:(id)a4 isRecommendTab:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  int64_t v9 = [v8 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
  double v10 = [v8 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    double v12 = 0;
  }
  else
  {
    if (v5) {
      +[NSString stringWithFormat:@"%@_%@", v9, v10, v14];
    }
    else {
    double v12 = +[NSString stringWithFormat:@"%@_%@_%@", v7, v9, v10];
    }
  }

  return v12;
}

- (id)_removeDuplicateFromResource:(id)a3 nonMediaKeySet:(id)a4 mediaOnRepeatDict:(id)a5 eventBundleDayKey:(id)a6 keyName:(id)a7
{
  id v11 = a3;
  id v31 = a4;
  id v33 = a5;
  id v29 = a6;
  id v32 = a7;
  id v28 = (id)objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v15);
        uint64_t v18 = [v16 getDictionary];
        uint64_t v19 = [v18 objectForKey:v32];

        id v20 = [v16 getDictionary];
        id v21 = [v20 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

        if (!v19) {
          goto LABEL_12;
        }
        unsigned __int8 v22 = [v31 containsObject:v19];
        unsigned __int8 v23 = v22;
        if (v33)
        {
          if ((v22 & 1) == 0)
          {
            id v24 = [v33 objectForKey:v29];

            if (v24)
            {
              id v25 = [v33 objectForKey:v29];
              unsigned __int8 v23 = [v25 containsObject:v19];
            }
          }
        }
        if ((v23 & 1) == 0)
        {
          [v28 addObject:v16];
        }
        else
        {
LABEL_12:
          id v26 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            id v39 = v32;
            __int16 v40 = 2112;
            id v41 = v19;
            __int16 v42 = 2112;
            uint64_t v43 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Summarization: Media bundle remove duplicate asset with key, %@, value, %@, title, %@", buf, 0x20u);
          }
        }
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  return v28;
}

- (id)_removeDuplicateFromResourceThridParty:(id)a3 mediaKeySet:(id)a4 dayKey:(id)a5 isRecommendTab:(BOOL)a6
{
  BOOL v30 = a6;
  id v9 = a3;
  id v31 = a4;
  id v28 = a5;
  id v26 = (id)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v29 = *(void *)v33;
    *(void *)&long long v11 = 138412802;
    long long v25 = v11;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v13);
        uint64_t v16 = [v14 getDictionary];
        uint64_t v17 = [(MOSummarizationManager *)self _getThirdPartyTitleKey:v16];

        uint64_t v18 = [v14 getDictionary];
        uint64_t v19 = [v18 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

        if (v30)
        {
          id v20 = v17;
        }
        else
        {
          [v14 getDictionary];
          v22 = id v21 = v12;
          id v20 = [(MOSummarizationManager *)self _getThirdPartyTitleKey:v22 dayKey:v28 isRecommendTab:0];

          id v12 = v21;
        }
        if ((objc_msgSend(v31, "containsObject:", v17, v25) & 1) != 0
          || ([v31 containsObject:v20] & 1) != 0)
        {
          unsigned __int8 v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v25;
            id v37 = v28;
            __int16 v38 = 2112;
            id v39 = v17;
            __int16 v40 = 2112;
            id v41 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Summarization: Media bundle remove duplicate asset with day, %@, key for , %@, title, %@", buf, 0x20u);
          }
        }
        else
        {
          [v26 addObject:v14];
        }

        id v13 = (char *)v13 + 1;
      }
      while (v12 != v13);
      id v12 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v12);
  }

  return v26;
}

- (unint64_t)supressCoarseGranularityPropertyOfEventBundles:(id)a3 primaryBundles:(id)a4 bundleMapping:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    long long v11 = [[MOObjectZipper alloc] initWithObjects:v8 others:v9 comparator:&__block_literal_global_451];
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    do
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2;
      v15[3] = &unk_1002CEF00;
      void v15[4] = self;
      id v16 = v10;
      uint64_t v17 = &v18;
      unsigned __int8 v12 = [(MOObjectZipper *)v11 nextObjectPairWithHandler:v15];
    }
    while ((v12 & 1) != 0);
    unint64_t v13 = v19[3];
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

int64_t __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  uint64_t v4 = a3;
  BOOL v5 = [(MOEventBundle *)a2 endDate];
  BOOL v6 = [(MOEventBundle *)v4 endDate];

  LODWORD(v4) = [v5 isBeforeDate:v6];
  if (v4) {
    return -1;
  }
  else {
    return 1;
  }
}

void __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_2((uint64_t)v5, (uint64_t)v6, v7);
  }

  id v8 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_1(v5, v6, v8);
  }

  +[MOSummarizationUtilities overlappingTimeIntervalBetween:v5 andOtherBundle:v6];
  if (v9 > 0.0)
  {
    double v10 = v9;
    long long v11 = [v5 dateInterval];
    [v11 duration];
    if (v12 > 0.0)
    {
      [v11 duration];
      double v14 = v10 / v13;
      if (v14 > 0.2)
      {
        unsigned int v15 = [*(id *)(a1 + 32) supressCoarseGranularityPropertyOfEventBundle:v5 dominantBundle:v6];
        if (v15)
        {
          id v16 = [*(id *)(a1 + 40) objectForKey:v6];
          if (v16)
          {
            uint64_t v17 = v16;
            [v16 addObject:v5];
          }
          else
          {
            uint64_t v17 = +[NSMutableSet setWithObject:v5];
            [*(id *)(a1 + 40) setObject:v17 forKey:v6];
          }
          ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        }
        uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = v15;
          id v25 = [v5 interfaceType];
          id v19 = [v6 interfaceType];
          id v20 = [v5 summarizationGranularity];
          uint64_t v21 = [v5 isAggregatedAndSuppressed];
          id v22 = [v5 summarizationGranularity];
          unsigned __int8 v23 = [v5 suggestionID];
          id v24 = [v6 suggestionID];
          *(_DWORD *)buf = 134220034;
          uint64_t v28 = v26;
          __int16 v29 = 2048;
          id v30 = v25;
          __int16 v31 = 2048;
          id v32 = v19;
          __int16 v33 = 2048;
          id v34 = v20;
          __int16 v35 = 2048;
          uint64_t v36 = v21;
          __int16 v37 = 2048;
          id v38 = v22;
          __int16 v39 = 2048;
          double v40 = v14;
          __int16 v41 = 2112;
          __int16 v42 = v23;
          __int16 v43 = 2112;
          uint64_t v44 = v24;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: merge, suppressed, %lu, bundle.interfacetype, %lu, megaBundle.interfacetype, %lu, bundle.summary, %lu, bundle.aggregated, %lu, bundle.granularity, %lu, ratio, %f, bundle suggestionID, %@, mega bundle suggestionID, %@", buf, 0x5Cu);
        }
      }
    }
  }
}

- (BOOL)supressCoarseGranularityPropertyOfEventBundle:(id)a3 dominantBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if (([v6 isAggregatedAndSuppressed] & 1) != 0
      || ([v5 isAggregatedAndSuppressed] & 1) != 0)
    {
      BOOL v8 = 0;
    }
    else
    {
      if ([v5 summarizationGranularity] == (id)2) {
        [v5 setIsAggregatedAndSuppressed:1];
      }
      else {
        [v5 setSummarizationGranularity:1];
      }
      double v9 = objc_opt_new();
      double v10 = [v7 subBundleIDs];
      [v9 addObjectsFromArray:v10];

      long long v11 = [v5 bundleIdentifier];
      double v12 = [v11 UUIDString];
      [v9 addObject:v12];

      id v13 = [v9 copy];
      [v7 setSubBundleIDs:v13];

      double v14 = objc_opt_new();
      unsigned int v15 = [v7 subSuggestionIDs];
      [v14 addObjectsFromArray:v15];

      id v16 = [v5 suggestionID];
      uint64_t v17 = [v16 UUIDString];
      [v14 addObject:v17];

      id v18 = [v14 copy];
      [v7 setSubSuggestionIDs:v18];

      BOOL v8 = 1;
    }
  }

  return v8;
}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (MOEventBundleRanking)eventBundleRanking
{
  return self->_eventBundleRanking;
}

- (void)setEventBundleRanking:(id)a3
{
}

- (MOSummarizationParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_eventBundleRanking, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_fUniverse, 0);
}

- (void)_compressAssetsForThirdPartyBundle:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5 = 134218240;
  id v6 = [a1 count];
  __int16 v7 = 2048;
  id v8 = [a2 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Compress assets calcualted with album, %lu, empty album, %lu", (uint8_t *)&v5, 0x16u);
}

void __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_1(void *a1, void *a2, NSObject *a3)
{
  id v6 = [a1 startDate];
  __int16 v7 = [a1 endDate];
  id v8 = [a2 startDate];
  double v9 = [a2 endDate];
  int v10 = 138413058;
  long long v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  __int16 v14 = 2112;
  unsigned int v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation: bundle, start, %@, end, %@, maga bundles, start, %@, end, %@", (uint8_t *)&v10, 0x2Au);
}

void __102__MOSummarizationManager_supressCoarseGranularityPropertyOfEventBundles_primaryBundles_bundleMapping___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation: bundle, %@, maga bundles, %@", (uint8_t *)&v3, 0x16u);
}

@end