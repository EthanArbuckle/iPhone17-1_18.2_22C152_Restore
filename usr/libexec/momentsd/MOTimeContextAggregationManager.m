@interface MOTimeContextAggregationManager
- (BOOL)_shouldMergeBundle:(id)a3 toCluster:(id)a4 parameters:(id)a5 granularity:(unint64_t)a6;
- (BOOL)_shouldMergeBundleForCoarseGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5;
- (BOOL)_shouldMergeBundleForFineGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5;
- (BOOL)_shouldMergeTransitBundleForFineGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5;
- (float)_maximumGoodnessScoreDeltaFromBundle:(id)a3 toCluster:(id)a4;
- (id)_groupBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5;
- (id)_groupTransitBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5;
- (id)_megaBundleFromActivityTimeContextBundles:(id)a3 parameters:(id)a4;
- (id)_megaBundlesFromOutingActivityTimeContextBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5;
- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6;
@end

@implementation MOTimeContextAggregationManager

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v14 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v22 = a5;
    __int16 v23 = 2048;
    id v24 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "TimeContextAggregation (granularity=%lu): Input eventBundles count, %lu", buf, 0x16u);
  }

  if ((unint64_t)[v10 count] <= 1)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v22 = a5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TimeContextAggregation (granularity=%lu): Insufficient event bundles (<2). Skip summarization", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if (a5 == 2)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_368;
    v17[3] = &unk_1002CA140;
    id v18 = v12;
    [(MOTimeContextAggregationManager *)self _aggregateBundlesForCoarseGranularity:v10 withParameters:v11 handler:v17];
    v16 = v18;
    goto LABEL_12;
  }
  if (a5 == 1)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke;
    v19[3] = &unk_1002CA140;
    id v20 = v12;
    [(MOTimeContextAggregationManager *)self _aggregateBundlesForFineGranularity:v10 withParameters:v11 handler:v19];
    v16 = v20;
LABEL_12:

    goto LABEL_13;
  }
LABEL_10:
  (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
LABEL_13:
}

void __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: output eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__MOTimeContextAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_368(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: output eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v12 = [v8 count];
  v13 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      id v15 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: input eventBundles count, %lu", buf, 0xCu);
    }

    v16 = [(MOTimeContextAggregationManager *)self _megaBundlesFromOutingActivityTimeContextBundles:v8 parameters:v9 granularity:1];
    if ([v16 count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * i) setSummarizationGranularity:1, v25];
          }
          id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v19);
      }
    }
    unint64_t v22 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v16 count];
      *(_DWORD *)buf = 134217984;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: output eventBundles count, %lu", buf, 0xCu);
    }

    v10[2](v10, v16, 0);
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: No eventBundle to be proccessed", buf, 2u);
    }

    v10[2](v10, 0, 0);
  }
}

- (id)_megaBundlesFromOutingActivityTimeContextBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 count] <= 1)
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v234 = [v7 count];
      *(_WORD *)&v234[8] = 2048;
      *(void *)&v234[10] = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: no needed to aggregate bundles since bundles  count is: %lu, granularity, %lu", buf, 0x16u);
    }
    id v10 = 0;
    goto LABEL_154;
  }
  v202 = objc_opt_new();
  id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
  v182 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 2];
  v13 = [v7 filteredArrayUsingPredicate:];
  v181 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 1];
  v192 = [v7 filteredArrayUsingPredicate:];
  +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 12];
  v180 = id v183 = v7;
  uint64_t v14 = [v7 filteredArrayUsingPredicate:];
  id v15 = [(MOAggregationManager *)self fUniverse];
  v16 = (objc_class *)objc_opt_class();
  id v17 = NSStringFromClass(v16);
  v205 = [v15 getService:v17];

  v186 = v13;
  v195 = (void *)v14;
  id v18 = [v13 arrayByAddingObjectsFromArray:v14];
  v190 = v12;
  v191 = v11;
  v248[0] = v11;
  v248[1] = v12;
  id v19 = +[NSArray arrayWithObjects:v248 count:2];
  uint64_t v20 = [v18 sortedArrayUsingDescriptors:v19];

  v21 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)v234 = [v20 count];
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: outing grouping process input bundle count, %lu, granularity, %lu", buf, 0x16u);
  }

  unint64_t v22 = [(MOAggregationManager *)self filterEventBundlesEligibleForSummarization:v20];

  id v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = [v22 count];
    *(_DWORD *)buf = 134218240;
    *(void *)v234 = v24;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: outing grouping process input bundle count after filtering, %lu, granularity, %lu", buf, 0x16u);
  }

  v189 = self;
  v177 = v22;
  long long v25 = [(MOTimeContextAggregationManager *)self _groupBundles:v22 parameters:v8 granularity:a5];
  v200 = objc_opt_new();
  long long v26 = objc_opt_new();
  v185 = v25;
  id v198 = v8;
  v203 = v26;
  if ([v25 count])
  {
    long long v229 = 0u;
    long long v230 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    id v27 = v25;
    id v28 = [v27 countByEnumeratingWithState:&v227 objects:v247 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v228;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v228 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v227 + 1) + 8 * i);
          v33 = [v32 getTimeSpanOfMOEventBundleArray];
          v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = [v33 startDate];
            v36 = [v33 endDate];
            *(_DWORD *)buf = 138412802;
            *(void *)v234 = v35;
            *(_WORD *)&v234[8] = 2112;
            *(void *)&v234[10] = v36;
            __int16 v235 = 2048;
            unint64_t v236 = a5;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: activity grouping date interval, start, %@, end, %@, granularity, %lu", buf, 0x20u);
          }
          if (v33) {
            [v200 setObject:v32 forKey:v33];
          }

          long long v26 = v203;
        }
        id v29 = [v27 countByEnumeratingWithState:&v227 objects:v247 count:16];
      }
      while (v29);
    }

    id v8 = v198;
  }
  uint64_t v37 = +[NSPredicate predicateWithFormat:@"bundleSubType != %lu", 204];
  uint64_t v38 = +[NSPredicate predicateWithFormat:@"bundleSubType != %lu", 207];
  uint64_t v39 = +[NSPredicate predicateWithFormat:@"bundleSubType != %lu", 208];
  v178 = (void *)v38;
  v179 = (void *)v37;
  v246[0] = v37;
  v246[1] = v38;
  v176 = (void *)v39;
  v246[2] = v39;
  v40 = +[NSArray arrayWithObjects:v246 count:3];
  uint64_t v41 = +[NSCompoundPredicate andPredicateWithSubpredicates:v40];

  v175 = (void *)v41;
  v174 = [v192 filteredArrayUsingPredicate:v41];
  v42 = [v174 arrayByAddingObjectsFromArray:v195];
  v245[0] = v191;
  v245[1] = v190;
  v43 = +[NSArray arrayWithObjects:v245 count:2];
  v44 = [v42 sortedArrayUsingDescriptors:v43];

  v45 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    id v46 = [v44 count];
    *(_DWORD *)buf = 134218240;
    *(void *)v234 = v46;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: acitivity grouping process input bundle count, %lu, granularity, %lu", buf, 0x16u);
  }

  v47 = [(MOAggregationManager *)v189 filterEventBundlesEligibleForSummarization:v44];

  v48 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    id v49 = [v47 count];
    *(_DWORD *)buf = 134218240;
    *(void *)v234 = v49;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: activity grouping process input bundle count after filtering, %lu, granularity, %lu", buf, 0x16u);
  }

  v173 = v47;
  v50 = [(MOTimeContextAggregationManager *)v189 _groupBundles:v47 parameters:v8 granularity:1];
  v201 = objc_opt_new();
  v184 = v50;
  if ([v50 count])
  {
    long long v225 = 0u;
    long long v226 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    id v51 = v50;
    id v52 = [v51 countByEnumeratingWithState:&v223 objects:v244 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v224;
      do
      {
        for (j = 0; j != v53; j = (char *)j + 1)
        {
          if (*(void *)v224 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = *(void **)(*((void *)&v223 + 1) + 8 * (void)j);
          v57 = [v56 getTimeSpanOfMOEventBundleArray];
          v58 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            v59 = [v57 startDate];
            v60 = [v57 endDate];
            *(_DWORD *)buf = 138412802;
            *(void *)v234 = v59;
            *(_WORD *)&v234[8] = 2112;
            *(void *)&v234[10] = v60;
            __int16 v235 = 2048;
            unint64_t v236 = a5;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: activity grouping date interval, start, %@, end, %@, granularity, %lu", buf, 0x20u);
          }
          if (v57) {
            [v201 setObject:v56 forKey:v57];
          }

          long long v26 = v203;
        }
        id v53 = [v51 countByEnumeratingWithState:&v223 objects:v244 count:16];
      }
      while (v53);
    }

    id v8 = v198;
  }
  v199 = objc_opt_new();
  if (![v195 count]) {
    goto LABEL_76;
  }
  v61 = [v201 allKeys];
  if (![v61 count])
  {

    goto LABEL_76;
  }
  v62 = [v200 allKeys];
  id v63 = [v62 count];

  if (!v63)
  {
LABEL_76:
    v112 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: no chance of overlapping so create summary bundles for both outing groups and activity groups", buf, 2u);
    }

    long long v221 = 0u;
    long long v222 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    v113 = [v200 allValues];
    id v114 = [v113 countByEnumeratingWithState:&v219 objects:v241 count:16];
    if (v114)
    {
      id v115 = v114;
      uint64_t v116 = *(void *)v220;
      do
      {
        for (k = 0; k != v115; k = (char *)k + 1)
        {
          if (*(void *)v220 != v116) {
            objc_enumerationMutation(v113);
          }
          uint64_t v118 = *(void *)(*((void *)&v219 + 1) + 8 * (void)k);
          v119 = +[MOSummarizationUtilities createOutingMegaBundleFromBundles:v118 withParameters:v8 isCoarseGranularity:a5 == 2 timeZoneManager:v205];
          if (v119)
          {
            [v202 addObject:v119];
            [v26 addObjectsFromArray:v118];
          }
        }
        id v115 = [v113 countByEnumeratingWithState:&v219 objects:v241 count:16];
      }
      while (v115);
    }

    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    v66 = [v201 allValues];
    id v120 = [v66 countByEnumeratingWithState:&v215 objects:v240 count:16];
    if (v120)
    {
      id v121 = v120;
      uint64_t v122 = *(void *)v216;
      do
      {
        for (m = 0; m != v121; m = (char *)m + 1)
        {
          if (*(void *)v216 != v122) {
            objc_enumerationMutation(v66);
          }
          v124 = +[MOSummarizationUtilities createActivityMegaBundleFromBundles:*(void *)(*((void *)&v215 + 1) + 8 * (void)m) withParameters:v8 isCoarseGranularity:a5 == 2 isWeeklySummary:0 timeZoneManager:v205];
          if (v124) {
            [v202 addObject:v124];
          }
        }
        id v121 = [v66 countByEnumeratingWithState:&v215 objects:v240 count:16];
      }
      while (v121);
    }
    goto LABEL_123;
  }
  v64 = [v200 allKeys];
  v243[0] = v191;
  v243[1] = v190;
  v65 = +[NSArray arrayWithObjects:v243 count:2];
  v66 = [v64 sortedArrayUsingDescriptors:v65];

  v67 = [v201 allKeys];
  v242[0] = v191;
  v242[1] = v190;
  v68 = +[NSArray arrayWithObjects:v242 count:2];
  v69 = [v67 sortedArrayUsingDescriptors:v68];

  v70 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    id v71 = [v66 count];
    id v72 = [v69 count];
    *(_DWORD *)buf = 134218496;
    *(void *)v234 = v71;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = v72;
    __int16 v235 = 2048;
    unint64_t v236 = a5;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: outing mega intervals count: %lu, activity mega intervals count: %lu, granularity, %lu", buf, 0x20u);
  }

  v187 = v69;
  if (![v66 count])
  {
    unsigned int v75 = 0;
    LODWORD(v76) = 0;
    unint64_t v73 = 0;
    goto LABEL_99;
  }
  unint64_t v73 = 0;
  int v74 = 0;
  unsigned int v75 = 0;
  while ((unint64_t)[v69 count] > v75)
  {
    int v193 = v74;
    unint64_t v76 = [v66 objectAtIndexedSubscript:v73];
    v77 = [v69 objectAtIndexedSubscript:v75];
    unsigned int v78 = [(id)v76 intersectsDateInterval:v77];
    v79 = [v200 objectForKey:v76];
    v80 = +[NSSet setWithArray:v79];

    v81 = [v201 objectForKey:v77];
    v82 = +[NSSet setWithArray:v81];

    v196 = v80;
    if (!v78)
    {
      v92 = v199;
      v93 = [v199 allKeys];
      unsigned __int8 v94 = [v93 containsObject:v82];

      int v86 = v193;
      if ((v94 & 1) == 0)
      {
        v95 = [v82 allObjects];
        v96 = +[MOSummarizationUtilities createActivityMegaBundleFromBundles:v95 withParameters:v198 isCoarseGranularity:a5 == 2 isWeeklySummary:0 timeZoneManager:v205];

        v92 = v199;
        if (v96)
        {
          [v202 addObject:v96];
          [v199 setObject:v96 forKey:v82];
        }
      }
      v97 = [v92 allKeys];
      unsigned __int8 v98 = [v97 containsObject:v196];

      if (v98) {
        goto LABEL_73;
      }
      unint64_t v188 = v76;
      v99 = [v196 allObjects];
      v88 = +[MOSummarizationUtilities createOutingMegaBundleFromBundles:v99 withParameters:v198 isCoarseGranularity:a5 == 2 timeZoneManager:v205];

      if (!v88) {
        goto LABEL_72;
      }
      [v202 addObject:v88];
      v100 = [v196 allObjects];
      [v203 addObjectsFromArray:v100];

      v89 = v199;
      v90 = v88;
      v91 = v196;
LABEL_61:
      [v89 setObject:v90 forKey:v91];
LABEL_72:

      unint64_t v76 = v188;
      goto LABEL_73;
    }
    unint64_t v188 = v76;
    v83 = v199;
    if (!v80 || !v82 || ![v80 intersectsSet:v82])
    {
      v101 = [v199 allKeys];
      unsigned __int8 v102 = [v101 containsObject:v82];

      int v86 = v193;
      if (v102)
      {
        v88 = [v199 objectForKey:v82];
      }
      else
      {
        v103 = [v82 allObjects];
        v88 = +[MOSummarizationUtilities createActivityMegaBundleFromBundles:v103 withParameters:v198 isCoarseGranularity:a5 == 2 isWeeklySummary:0 timeZoneManager:v205];

        if (v88)
        {
          [v202 addObject:v88];
          v83 = v199;
          [v199 setObject:v88 forKey:v82];
        }
        else
        {
          v83 = v199;
        }
      }
      v104 = [v83 allKeys];
      unsigned __int8 v105 = [v104 containsObject:v196];

      if (v105)
      {
        v106 = [v83 objectForKey:v196];
      }
      else
      {
        v107 = [v196 allObjects];
        v106 = +[MOSummarizationUtilities createOutingMegaBundleFromBundles:v107 withParameters:v198 isCoarseGranularity:a5 == 2 timeZoneManager:v205];

        if (v106)
        {
          [v202 addObject:v106];
          v108 = [v196 allObjects];
          [v203 addObjectsFromArray:v108];

          [v199 setObject:v106 forKey:v196];
        }
      }
      +[MOSummarizationUtilities removeDuplicatePhotoResourceFromBundle:v88 comparedWithPrimaryBundle:v106];

      goto LABEL_72;
    }
    v84 = [v199 allKeys];
    unsigned __int8 v85 = [v84 containsObject:v82];

    int v86 = v193;
    if ((v85 & 1) == 0)
    {
      v87 = [v82 allObjects];
      v88 = +[MOSummarizationUtilities createActivityMegaBundleFromBundles:v87 withParameters:v198 isCoarseGranularity:a5 == 2 isWeeklySummary:0 timeZoneManager:v205];

      if (v88)
      {
        [v202 addObject:v88];
        v89 = v199;
        v90 = v88;
        v91 = v82;
        goto LABEL_61;
      }
      goto LABEL_72;
    }
LABEL_73:
    v109 = [(id)v76 endDate];
    v110 = [v77 endDate];
    unsigned int v111 = [v109 isOnOrAfter:v110];

    v75 += v111;
    unint64_t v73 = v86 + (v111 ^ 1);

    int v74 = v86 + (v111 ^ 1);
    LODWORD(v76) = v74;
    v69 = v187;
    if ((unint64_t)[v66 count] <= v73) {
      goto LABEL_99;
    }
  }
  LODWORD(v76) = v74;
LABEL_99:
  unint64_t v125 = v75;
  if ((unint64_t)[v66 count] <= v73)
  {
    long long v26 = v203;
  }
  else
  {
    long long v26 = v203;
    if ([v69 count] == (id)v75)
    {
      v126 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v234 = v76;
        *(_WORD *)&v234[4] = 2048;
        *(void *)&v234[6] = a5;
        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: not all outing mega intervals are looped through, stopping at %d, granularity, %lu", buf, 0x12u);
      }

      if ((unint64_t)[v66 count] > v76)
      {
        unint64_t v76 = v76;
        do
        {
          v127 = [v66 objectAtIndexedSubscript:v76];
          uint64_t v128 = [v200 objectForKey:v127];
          v129 = +[NSSet setWithArray:v128];

          v130 = [v199 allKeys];
          LOBYTE(v128) = [v130 containsObject:v129];

          if ((v128 & 1) == 0)
          {
            v131 = [v129 allObjects];
            v132 = +[MOSummarizationUtilities createOutingMegaBundleFromBundles:v131 withParameters:v198 isCoarseGranularity:a5 == 2 timeZoneManager:v205];

            if (v132)
            {
              [v202 addObject:v132];
              v133 = [v129 allObjects];
              [v203 addObjectsFromArray:v133];

              [v199 setObject:v132 forKey:v129];
            }
          }
          ++v76;
        }
        while ((unint64_t)[v66 count] > v76);
        long long v26 = v203;
        v69 = v187;
      }
    }
  }
  if ((unint64_t)[v69 count] > v125 && objc_msgSend(v66, "count") == (id)(int)v76)
  {
    v134 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v234 = v76;
      *(_WORD *)&v234[4] = 2048;
      *(void *)&v234[6] = a5;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: not all activity mega intervals are looped through, stopping at %d, granularity, %lu", buf, 0x12u);
    }

    if ((unint64_t)[v69 count] > v125)
    {
      do
      {
        v135 = [v69 objectAtIndexedSubscript:v125];
        uint64_t v136 = [v201 objectForKey:v135];
        v137 = +[NSSet setWithArray:v136];

        v138 = [v199 allKeys];
        LOBYTE(v136) = [v138 containsObject:v137];

        if ((v136 & 1) == 0)
        {
          v139 = [v137 allObjects];
          v140 = +[MOSummarizationUtilities createActivityMegaBundleFromBundles:v139 withParameters:v198 isCoarseGranularity:a5 == 2 isWeeklySummary:0 timeZoneManager:v205];

          if (v140)
          {
            [v202 addObject:v140];
            [v199 setObject:v140 forKey:v137];
          }
        }
        ++v125;

        v69 = v187;
      }
      while ((unint64_t)[v187 count] > v125);
    }
  }

  id v8 = v198;
LABEL_123:

  v141 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
  {
    id v142 = [v202 count];
    *(_DWORD *)buf = 134218240;
    *(void *)v234 = v142;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: total mega bundles count after deduping: %lu,  granularity, %lu", buf, 0x16u);
  }

  v143 = objc_opt_new();
  [v143 addObjectsFromArray:v186];
  [v143 addObjectsFromArray:v192];
  [v143 addObjectsFromArray:v195];
  v239[0] = v191;
  v239[1] = v190;
  v144 = +[NSArray arrayWithObjects:v239 count:2];
  uint64_t v145 = [v143 sortedArrayUsingDescriptors:v144];

  v146 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
  {
    id v147 = [v186 count];
    id v148 = [v192 count];
    id v149 = [v195 count];
    *(_DWORD *)buf = 134218752;
    *(void *)v234 = v147;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = v148;
    __int16 v235 = 2048;
    unint64_t v236 = (unint64_t)v149;
    __int16 v237 = 2048;
    unint64_t v238 = a5;
    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: transit bundle grouping process input bundle counts, outing, %lu, activity, %lu, timecontext, %lu, granularity, %lu", buf, 0x2Au);
  }

  v197 = (void *)v145;
  v150 = [(MOTimeContextAggregationManager *)v189 _groupTransitBundles:v145 parameters:v8 granularity:1];
  v151 = objc_opt_new();
  v204 = v150;
  if ([v150 count])
  {
    v194 = v143;
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    id v152 = v150;
    id v153 = [v152 countByEnumeratingWithState:&v211 objects:v232 count:16];
    if (v153)
    {
      id v154 = v153;
      uint64_t v155 = *(void *)v212;
      do
      {
        for (n = 0; n != v154; n = (char *)n + 1)
        {
          if (*(void *)v212 != v155) {
            objc_enumerationMutation(v152);
          }
          uint64_t v157 = *(void *)(*((void *)&v211 + 1) + 8 * (void)n);
          v158 = +[MOSummarizationUtilities createTransitMegaBundleFromBundles:v157 withParameters:v8 isCoarseGranularity:a5 == 2 timeZoneManager:v205 groupedOutingBundles:v26];
          if (v158) {
            [v151 setObject:v157 forKey:v158];
          }
          [v26 addObjectsFromArray:v157];
        }
        id v154 = [v152 countByEnumeratingWithState:&v211 objects:v232 count:16];
      }
      while (v154);
    }

    v159 = [v151 allKeys];
    [v202 addObjectsFromArray:v159];

    v143 = v194;
  }
  v160 = objc_opt_new();
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id v161 = v177;
  id v162 = [v161 countByEnumeratingWithState:&v207 objects:v231 count:16];
  if (v162)
  {
    id v163 = v162;
    uint64_t v164 = *(void *)v208;
    do
    {
      for (ii = 0; ii != v163; ii = (char *)ii + 1)
      {
        if (*(void *)v208 != v164) {
          objc_enumerationMutation(v161);
        }
        uint64_t v166 = *(void *)(*((void *)&v207 + 1) + 8 * (void)ii);
        if (([v26 containsObject:v166] & 1) == 0) {
          [v160 addObject:v166];
        }
      }
      id v163 = [v161 countByEnumeratingWithState:&v207 objects:v231 count:16];
    }
    while (v163);
  }

  v167 = +[MOSummarizationUtilities mergeOutingBundlesWithInDayWithGroupedBundles:v202 remainingSingletonBundles:v160 parameters:v198 isCoarseGranularity:a5 == 2 timeZoneManager:v205];
  v168 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
  {
    id v169 = [v167 count];
    *(_DWORD *)buf = 134218240;
    *(void *)v234 = v169;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: total mega bundles count after merge visits to the same place in the same day %lu, granularity, %lu", buf, 0x16u);
  }

  if ([v167 count]) {
    [v202 addObjectsFromArray:v167];
  }
  v170 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
  {
    id v171 = [v202 count];
    *(_DWORD *)buf = 134218240;
    *(void *)v234 = v171;
    *(_WORD *)&v234[8] = 2048;
    *(void *)&v234[10] = a5;
    _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_INFO, "Aggregation: final timecontext mega bundles count: %lu, granularity, %lu", buf, 0x16u);
  }

  id v9 = v202;
  id v10 = v9;
  id v7 = v183;
  id v8 = v198;
LABEL_154:

  return v10;
}

- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ([v8 count])
  {
    id v11 = objc_opt_new();
    id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for time context related bundles: input eventBundles count, %lu", buf, 0xCu);
    }

    uint64_t v14 = [(MOTimeContextAggregationManager *)self _megaBundlesFromOutingActivityTimeContextBundles:v8 parameters:v9 granularity:2];
    id v15 = [(MOTimeContextAggregationManager *)self _megaBundleFromActivityTimeContextBundles:v8 parameters:v9];
    if ([v14 count])
    {
      [v11 addObjectsFromArray:v14];
      v16 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [v14 count];
        *(_DWORD *)buf = 134217984;
        id v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation outing megabundle count, %lu", buf, 0xCu);
      }
    }
    if (v15) {
      [v11 addObject:v15];
    }
    if ([v11 count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v18 = v11;
      id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v27;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v27 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * i) setSummarizationGranularity:2 v26];
          }
          id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v20);
      }
    }
    id v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v11 count];
      *(_DWORD *)buf = 134217984;
      id v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for time context related bundles: output eventBundles count, %lu", buf, 0xCu);
    }

    v10[2](v10, v11, 0);
  }
  else
  {
    long long v25 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: No eventBundle to be proccessed", buf, 2u);
    }

    v10[2](v10, 0, 0);
  }
}

- (id)_megaBundleFromActivityTimeContextBundles:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v29 = [objc_alloc((Class)NSArray) initWithObjects:&off_1002F7970, &off_1002F7988, 0];
  long long v28 = +[NSPredicate predicateWithFormat:@"interfaceType in %@", v29];
  id v8 = [v7 filteredArrayUsingPredicate:];

  id v9 = +[NSPredicate predicateWithFormat:@"bundleSubType != %lu", 204];
  id v10 = +[NSPredicate predicateWithFormat:@"bundleSubType != %lu", 207];
  id v11 = +[NSPredicate predicateWithFormat:@"bundleSubType != %lu", 208];
  v32[0] = v9;
  v32[1] = v10;
  v32[2] = v11;
  id v12 = +[NSArray arrayWithObjects:v32 count:3];
  id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

  uint64_t v14 = [v8 filteredArrayUsingPredicate:v13];
  if (![v14 count])
  {
    id v19 = v6;
    id v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v21 = "CoarseGranularityAggregation: no needed to aggregate activity and time context bundles since bundles count is 0";
      goto LABEL_7;
    }
LABEL_8:
    unint64_t v22 = 0;
    goto LABEL_12;
  }
  id v15 = self;
  v16 = [v6 aggregationDateInterval];
  [v16 duration];
  double v18 = v17;

  id v19 = v6;
  if (v18 < 604800.0)
  {
    id v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v21 = "CoarseGranularityAggregation: no needed to aggregate activity and time context bundles since aggregation tim"
            "e interval is less than a week";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v23 = [(MOAggregationManager *)v15 fUniverse];
  id v24 = (objc_class *)objc_opt_class();
  long long v25 = NSStringFromClass(v24);
  id v20 = [v23 getService:v25];

  unint64_t v22 = +[MOSummarizationUtilities createActivityMegaBundleFromBundles:v14 withParameters:v19 isCoarseGranularity:1 isWeeklySummary:1 timeZoneManager:v20];
  long long v26 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v22;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation activity megabundle, %@", buf, 0xCu);
  }

LABEL_12:

  return v22;
}

- (id)_groupBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 count] > 1)
  {
    id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v26 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
    long long v27 = v11;
    v34[0] = v11;
    v34[1] = v26;
    id v12 = +[NSArray arrayWithObjects:v34 count:2];
    long long v28 = v8;
    id v13 = [v8 sortedArrayUsingDescriptors:v12];

    id v29 = (id)objc_opt_new();
    uint64_t v14 = objc_opt_new();
    if ([v13 count] != (id)1)
    {
      id v15 = 0;
      do
      {
        v16 = v15;
        if (![v14 count])
        {
          double v17 = [v13 objectAtIndexedSubscript:v15];
          [v14 addObject:v17];
        }
        id v15 = v16 + 1;
        double v18 = [v13 objectAtIndexedSubscript:v16 + 1];
        id v19 = [v14 copy];
        unsigned int v20 = [(MOTimeContextAggregationManager *)self _shouldMergeBundle:v18 toCluster:v19 parameters:v9 granularity:a5];

        if (v20)
        {
          uint64_t v21 = [v13 objectAtIndexedSubscript:v16 + 1];
          [v14 addObject:v21];

          if (v16 == (char *)[v28 count] - 2 && (unint64_t)objc_msgSend(v14, "count") >= 2)
          {
            id v22 = [v14 copy];
            [v29 addObject:v22];
          }
        }
        else
        {
          if ((unint64_t)[v14 count] >= 2)
          {
            id v23 = [v14 copy];
            [v29 addObject:v23];
          }
          [v14 removeAllObjects];
        }
      }
      while ((char *)[v13 count] - 1 > v15);
    }
    id v24 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v31 = [v29 count];
      __int16 v32 = 2048;
      unint64_t v33 = a5;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: grouped bundle count: %lu, granularity: %lu", buf, 0x16u);
    }

    id v10 = v27;
    id v8 = v28;
  }
  else
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: aggregateBundles input bundle count is less than 2 so no bundle to be aggregated", buf, 2u);
    }
    id v29 = 0;
  }

  return v29;
}

- (BOOL)_shouldMergeBundle:(id)a3 toCluster:(id)a4 parameters:(id)a5 granularity:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == 2)
  {
    unsigned __int8 v13 = [(MOTimeContextAggregationManager *)self _shouldMergeBundleForCoarseGranularity:v10 toCluster:v11 parameters:v12];
  }
  else
  {
    if (a6 != 1)
    {
      BOOL v14 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v13 = [(MOTimeContextAggregationManager *)self _shouldMergeBundleForFineGranularity:v10 toCluster:v11 parameters:v12];
  }
  BOOL v14 = v13;
LABEL_7:

  return v14;
}

- (BOOL)_shouldMergeBundleForFineGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5
{
  double v8 = COERCE_DOUBLE(a3);
  id v9 = a4;
  id v10 = a5;
  double v11 = [v9 lastObject];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = [*(id *)&v11 startDate];
    double v14 = [*(id *)&v11 endDate];
    id v15 = [*(id *)&v8 startDate];
    v16 = [*(id *)&v8 endDate];
    *(_DWORD *)buf = 138413058;
    double v75 = v13;
    __int16 v76 = 2112;
    double v77 = v14;
    __int16 v78 = 2112;
    v79 = v15;
    __int16 v80 = 2112;
    v81 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: the last bundle in cluster start date, %@, end date, %@, bundle to be add to cluster: start date, %@, end date, %@", buf, 0x2Au);
  }
  BOOL v17 = [*(id *)&v11 interfaceType] == (id)2 && [*(id *)&v8 interfaceType] == (id)2;
  if ([*(id *)&v11 interfaceType] == (id)2 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)12) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = [*(id *)&v11 interfaceType] == (id)12 && [*(id *)&v8 interfaceType] == (id)2;
  }
  BOOL v19 = [*(id *)&v11 interfaceType] == (id)1 && [*(id *)&v8 interfaceType] == (id)1;
  if ([*(id *)&v11 interfaceType] == (id)1 && objc_msgSend(*(id *)&v8, "interfaceType") == (id)12) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = [*(id *)&v11 interfaceType] == (id)12 && [v8 interfaceType] == (id)1;
  }
  if (v17 || v18)
  {
    if (+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", *(void *)&v11)|| +[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:*(void *)&v8])
    {
      uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_27:
        BOOL v23 = 0;
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      id v22 = "FineGranularityAggregation for TimeContext:bundle is for home or work so exclude from group.";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
      goto LABEL_27;
    }
    if (!+[MOSummarizationUtilities isBundle:*(void *)&v11 insideTheSameDayAsOtherBundle:*(void *)&v8])
    {
      uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        double v30 = [*(id *)&v11 startDate];
        double v31 = [*(id *)&v11 endDate];
        __int16 v32 = [*(id *)&v8 startDate];
        unint64_t v33 = [*(id *)&v8 endDate];
        *(_DWORD *)buf = 138413058;
        double v75 = v30;
        __int16 v76 = 2112;
        double v77 = v31;
        __int16 v78 = 2112;
        v79 = v32;
        __int16 v80 = 2112;
        v81 = v33;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: two bundles should not merge since one of thme is covering more than one day, bundle1: start date, %@, end date, %@, bundle 2: start date, %@, end date, %@", buf, 0x2Au);
      }
      goto LABEL_27;
    }
    id v24 = [*(id *)&v8 rankingDictionary];
    long long v25 = [v24 objectForKeyedSubscript:@"bundleGoodnessScore"];
    [v25 floatValue];
    float v27 = v26;

    long long v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v75 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext:bundle goodness score, %f", buf, 0xCu);
    }

    [v10 fineGranularity_outingBundlesExclusionGoodnessScoreThreshold];
    if (v27 > v29)
    {
      uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      id v22 = "FineGranularityAggregation for TimeContext:bundle goodness is too high to include into group.";
      goto LABEL_26;
    }
    if (+[MOSummarizationUtilities isFlightBundle:*(void *)&v8])
    {
      uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      id v22 = "CoarseGranularityAggregation for TimeContext:bundle action is flight so don't group with others.";
      goto LABEL_26;
    }
    uint64_t v21 = +[MOSummarizationUtilities metricForVisitsFromBundle:*(void *)&v11 andNextBundle:*(void *)&v8];
    v34 = [v21 objectForKey:@"distance"];
    [v34 doubleValue];
    double v36 = v35;

    uint64_t v37 = [v21 objectForKey:@"timeInterval"];
    [v37 doubleValue];
    double v39 = v38;

    +[MOSummarizationUtilities maximumDistanceFromBundle:*(void *)&v8 toBundleCluster:v9];
    double v41 = v40;
    [(MOTimeContextAggregationManager *)self _maximumGoodnessScoreDeltaFromBundle:*(void *)&v8 toCluster:v9];
    float v43 = v42;
    v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      [v10 fineGranularity_outingBundlesAggregationDistanceThreshold];
      *(_DWORD *)buf = 134218240;
      double v75 = v36;
      __int16 v76 = 2048;
      double v77 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "FineGranularityAggregation: distance between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
    }
    double v46 = fabs(v39);

    v47 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      [v10 fineGranularity_outingBundlesAggregationTimeIntervalThreshold];
      *(_DWORD *)buf = 134218240;
      double v75 = v46;
      __int16 v76 = 2048;
      double v77 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "FineGranularityAggregation: time interval between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
    }

    id v49 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      [v10 fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold];
      *(_DWORD *)buf = 134218240;
      double v75 = v43;
      __int16 v76 = 2048;
      double v77 = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "FineGranularityAggregation: max goodness score deta between bundle and members in existing cluster: %f (thres=%f)", buf, 0x16u);
    }

    [v10 fineGranularity_outingBundlesAggregationDistanceThreshold];
    if (v36 < v51)
    {
      [v10 fineGranularity_outingBundlesAggregationTimeIntervalThreshold];
      if (v46 < v52)
      {
        [v10 fineGranularity_outingBundlesAggregationDistanceToClusterThreshold];
        if (v41 < v53)
        {
          [v10 fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold];
          if (v43 < v54)
          {
            v55 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              double v73 = [*(id *)&v11 startDate];
              double v72 = [*(id *)&v11 endDate];
              v69 = [*(id *)&v11 action];
              v70 = [v69 actionName];
              v68 = [*(id *)&v11 place];
              v56 = [v68 placeName];
              [*(id *)&v8 startDate];
              v57 = id v71 = v55;
              v58 = [*(id *)&v8 endDate];
              v67 = [*(id *)&v8 action];
              v59 = [v67 actionName];
              v66 = [*(id *)&v8 place];
              v60 = [v66 placeName];
              *(_DWORD *)buf = 138414082;
              double v75 = v73;
              __int16 v76 = 2112;
              double v77 = v72;
              __int16 v78 = 2112;
              v79 = v70;
              __int16 v80 = 2112;
              v81 = v56;
              __int16 v82 = 2112;
              v83 = v57;
              __int16 v84 = 2112;
              unsigned __int8 v85 = v58;
              __int16 v86 = 2112;
              v87 = v59;
              __int16 v88 = 2112;
              v89 = v60;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: two bundles should be merged for outing, bundle1: startDate:%@, endDate:%@, action:%@, place:%@, bundle 2: startDate:%@, endDate:%@, action:%@, place:%@", buf, 0x52u);

              v55 = v71;
            }

            BOOL v23 = 1;
            goto LABEL_28;
          }
        }
      }
    }
  }
  if (!v19 && !v20) {
    goto LABEL_58;
  }
  +[MOSummarizationUtilities workoutTimeIntervalBetweenBundle:*(void *)&v11 andNextBundle:*(void *)&v8];
  double v62 = fabs(v61);
  id v63 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v75 = v62;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: time interval between activities from two activity related bundles: %f", buf, 0xCu);
  }

  [v10 fineGranularity_activityBundlesAggregationTimeIntervalThreshold];
  if (v62 >= v64)
  {
LABEL_58:
    BOOL v23 = 0;
    goto LABEL_59;
  }
  uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  BOOL v23 = 1;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    double v75 = v11;
    __int16 v76 = 2112;
    double v77 = v8;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FineGranularityAggregation for TimeContext: two bundles should be merged for activity, bundle1: %@, bundle 2: %@", buf, 0x16u);
  }
LABEL_28:

LABEL_59:
  return v23;
}

- (BOOL)_shouldMergeBundleForCoarseGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v9 lastObject];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = [v11 startDate];
    double v14 = [v11 endDate];
    id v15 = [v8 startDate];
    [v8 endDate];
    BOOL v17 = v16 = v10;
    *(_DWORD *)buf = 138413058;
    double v87 = v13;
    __int16 v88 = 2112;
    double v89 = v14;
    __int16 v90 = 2112;
    v91 = v15;
    __int16 v92 = 2112;
    v93 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: the last bundle in cluster start date, %@, end date, %@, bundle to be add to cluster: start date, %@, end date, %@", buf, 0x2Au);

    id v10 = v16;
  }

  if (!+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", v11)&& !+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:v8])
  {
    BOOL v22 = [v11 interfaceType] == (id)2 && [v8 interfaceType] == (id)2;
    if ([v11 interfaceType] == (id)2 && objc_msgSend(v8, "interfaceType") == (id)12) {
      BOOL v23 = 1;
    }
    else {
      BOOL v23 = [v11 interfaceType] == (id)12 && [v8 interfaceType] == (id)2;
    }
    BOOL v24 = [v11 interfaceType] == (id)1 && [v8 interfaceType] == (id)1;
    if ([v11 interfaceType] == (id)1 && objc_msgSend(v8, "interfaceType") == (id)12) {
      BOOL v25 = 1;
    }
    else {
      BOOL v25 = [v11 interfaceType] == (id)12 && [v8 interfaceType] == (id)1;
    }
    if (v22 || v23)
    {
      if (!+[MOSummarizationUtilities isBundle:v11 insideTheSameDayAsOtherBundle:v8])
      {
        BOOL v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        double v32 = [v11 startDate];
        double v33 = [v11 endDate];
        v34 = [v8 startDate];
        double v35 = [v8 endDate];
        *(_DWORD *)buf = 138413058;
        double v87 = v32;
        __int16 v88 = 2112;
        double v89 = v33;
        __int16 v90 = 2112;
        v91 = v34;
        __int16 v92 = 2112;
        v93 = v35;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: two bundles should not merge since one of thme is covering more than one day, bundle1: start date, %@, end date, %@, bundle 2: start date, %@, end date, %@", buf, 0x2Au);
LABEL_59:

        goto LABEL_8;
      }
      float v26 = [v8 rankingDictionary];
      float v27 = [v26 objectForKeyedSubscript:@"bundleGoodnessScore"];
      [v27 floatValue];
      float v29 = v28;

      double v30 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v87 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext:bundle goodness score, %f", buf, 0xCu);
      }

      [v10 coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold];
      if (v29 > v31)
      {
        BOOL v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        *(_WORD *)buf = 0;
        BOOL v19 = "CoarseGranularityAggregation for TimeContext:bundle goodness is too high to include into group.";
        goto LABEL_7;
      }
      if (+[MOSummarizationUtilities isFlightBundle:v8])
      {
        BOOL v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        *(_WORD *)buf = 0;
        BOOL v19 = "CoarseGranularityAggregation for TimeContext:bundle action is flight so don't group with others.";
        goto LABEL_7;
      }
      BOOL v18 = +[MOSummarizationUtilities metricForVisitsFromBundle:v11 andNextBundle:v8];
      double v36 = [v18 objectForKey:@"distance"];
      [v36 doubleValue];
      double v38 = v37;

      double v39 = [v18 objectForKey:@"timeInterval"];
      [v39 doubleValue];
      double v41 = v40;

      +[MOSummarizationUtilities maximumDistanceFromBundle:v8 toBundleCluster:v9];
      double v43 = v42;
      [(MOTimeContextAggregationManager *)self _maximumGoodnessScoreDeltaFromBundle:v8 toCluster:v9];
      float v45 = v44;
      double v46 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        [v10 coarseGranularity_outingBundlesAggregationDistanceThreshold];
        *(_DWORD *)buf = 134218240;
        double v87 = v38;
        __int16 v88 = 2048;
        double v89 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: distance between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
      }

      float v48 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        [v10 coarseGranularity_outingBundlesAggregationTimeIntervalThreshold];
        *(_DWORD *)buf = 134218240;
        double v87 = v41;
        __int16 v88 = 2048;
        double v89 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: time interval between visits from two outing related bundles: %f (thres=%f)", buf, 0x16u);
      }

      float v50 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        [v10 coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold];
        *(_DWORD *)buf = 134218240;
        double v87 = v45;
        __int16 v88 = 2048;
        double v89 = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: max goodness score deta between bundle and members in existing cluster: %f (thres=%f)", buf, 0x16u);
      }

      [v10 coarseGranularity_outingBundlesAggregationDistanceThreshold];
      if (v38 < v52)
      {
        [v10 coarseGranularity_outingBundlesAggregationTimeIntervalThreshold];
        if (v41 < v53)
        {
          [v10 coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold];
          if (v43 < v54)
          {
            [v10 coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold];
            if (v45 < v55)
            {
              v56 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
              {
                *(double *)&os_log_t log = [v11 startDate];
                double v80 = [v11 endDate];
                __int16 v78 = [v11 action];
                v79 = [v78 actionName];
                double v77 = [v11 place];
                v57 = [v77 placeName];
                v58 = [v8 startDate];
                v59 = [v8 endDate];
                __int16 v76 = [v8 action];
                v60 = [v76 actionName];
                double v75 = [v8 place];
                [v75 placeName];
                double v61 = v83 = v10;
                *(_DWORD *)buf = 138414082;
                double v87 = *(double *)&log;
                __int16 v88 = 2112;
                double v89 = v80;
                __int16 v90 = 2112;
                v91 = v79;
                __int16 v92 = 2112;
                v93 = v57;
                __int16 v94 = 2112;
                v95 = v58;
                __int16 v96 = 2112;
                v97 = v59;
                __int16 v98 = 2112;
                v99 = v60;
                __int16 v100 = 2112;
                v101 = v61;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: two bundles should be merged for outing, bundle1: startDate:%@, endDate:%@, action:%@, place:%@, bundle 2: startDate:%@, endDate:%@, action:%@, place:%@", buf, 0x52u);

                id v10 = v83;
              }
LABEL_62:

              BOOL v20 = 1;
              goto LABEL_9;
            }
          }
        }
      }
      if (v24 || v25)
      {
        +[MOSummarizationUtilities workoutTimeIntervalBetweenBundle:v11 andNextBundle:v8];
        double v63 = v62;
        float v64 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          [v10 fineGranularity_activityBundlesAggregationTimeIntervalThreshold];
          *(_DWORD *)buf = 134218240;
          double v87 = v63;
          __int16 v88 = 2048;
          double v89 = v65;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: time interval between activities from two activity related bundles: %f, threshold: %f", buf, 0x16u);
        }

        [v10 fineGranularity_activityBundlesAggregationTimeIntervalThreshold];
        if (v63 < v66)
        {
          v56 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            double v69 = [v11 bundleIdentifier];
            double v70 = [v11 startDate];
            id v71 = [v11 endDate];
            [v8 bundleIdentifier];
            double v72 = v85 = v10;
            double v73 = [v8 startDate];
            [v8 endDate];
            int v74 = loga = v56;
            *(_DWORD *)buf = 138413570;
            double v87 = v69;
            __int16 v88 = 2112;
            double v89 = v70;
            __int16 v90 = 2112;
            v91 = v71;
            __int16 v92 = 2112;
            v93 = v72;
            __int16 v94 = 2112;
            v95 = v73;
            __int16 v96 = 2112;
            v97 = v74;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: two activity bundles should be merged for activity, bundle1: bundle ID, %@, startDate, %@, endDate, %@; bundle 2: bundle ID, %@, startDate, %@, endDate, %@",
              buf,
              0x3Eu);

            v56 = loga;
            id v10 = v85;
          }
          goto LABEL_62;
        }
      }
    }
    BOOL v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    double v32 = [v11 bundleIdentifier];
    double v33 = [v11 startDate];
    v34 = [v11 endDate];
    double v35 = [v8 bundleIdentifier];
    [v8 startDate];
    v67 = id v84 = v10;
    v68 = [v8 endDate];
    *(_DWORD *)buf = 138413570;
    double v87 = v32;
    __int16 v88 = 2112;
    double v89 = v33;
    __int16 v90 = 2112;
    v91 = v34;
    __int16 v92 = 2112;
    v93 = v35;
    __int16 v94 = 2112;
    v95 = v67;
    __int16 v96 = 2112;
    v97 = v68;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for TimeContext: bundle does not meet summarization criteria, bundle1: bundle ID, %@, startDate, %@, endDate, %@; bundle 2: bundle ID, %@, startDate, %@, endDate, %@",
      buf,
      0x3Eu);

    id v10 = v84;
    goto LABEL_59;
  }
  BOOL v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    BOOL v19 = "CoarseGranularityAggregation for TimeContext:bundle is for home or work so exclude from group.";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, buf, 2u);
  }
LABEL_8:
  BOOL v20 = 0;
LABEL_9:

  return v20;
}

- (float)_maximumGoodnessScoreDeltaFromBundle:(id)a3 toCluster:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    float v10 = 1.1755e-38;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v13 = [v5 rankingDictionary];
        double v14 = [v13 objectForKeyedSubscript:@"bundleGoodnessScore"];
        [v14 floatValue];
        float v16 = v15;
        BOOL v17 = [v12 rankingDictionary];
        BOOL v18 = [v17 objectForKeyedSubscript:@"bundleGoodnessScore"];
        [v18 floatValue];
        float v20 = vabds_f32(v16, v19);

        if (v20 > v10) {
          float v10 = v20;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    float v10 = 1.1755e-38;
  }

  return v10;
}

- (id)_groupTransitBundles:(id)a3 parameters:(id)a4 granularity:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 count] > 1)
  {
    id v22 = (id)objc_opt_new();
    float v10 = objc_opt_new();
    if ([v8 count] != (id)1)
    {
      double v11 = 0;
      do
      {
        id v12 = v11;
        if (![v10 count])
        {
          double v13 = [v8 objectAtIndexedSubscript:v11];
          [v10 addObject:v13];
        }
        double v11 = v12 + 1;
        double v14 = [v8 objectAtIndexedSubscript:v12 + 1];
        id v15 = [v10 copy];
        unsigned int v16 = [(MOTimeContextAggregationManager *)self _shouldMergeTransitBundle:v14 toCluster:v15 parameters:v9 granularity:a5];

        if (v16)
        {
          BOOL v17 = [v8 objectAtIndexedSubscript:v12 + 1];
          [v10 addObject:v17];

          if (v12 == (char *)[v8 count] - 2 && (unint64_t)-[NSObject count](v10, "count") >= 2)
          {
            id v18 = [v10 copy];
            [v22 addObject:v18];
          }
        }
        else
        {
          if ((unint64_t)[v10 count] >= 2)
          {
            id v19 = [v10 copy];
            [v22 addObject:v19];
          }
          [v10 removeAllObjects];
        }
      }
      while ((char *)[v8 count] - 1 > v11);
    }
    float v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v24 = [v22 count];
      __int16 v25 = 2048;
      unint64_t v26 = a5;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: grouped bundle count: %lu, granularity: %lu", buf, 0x16u);
    }
  }
  else
  {
    float v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Aggregation for TimeContext: aggregateBundles input bundle count is less than 2 so no bundle to be aggregated", buf, 2u);
    }
    id v22 = 0;
  }

  return v22;
}

- (BOOL)_shouldMergeTransitBundleForFineGranularity:(id)a3 toCluster:(id)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 lastObject];
  float v10 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    double v11 = [v9 startDate];
    id v12 = [v9 endDate];
    double v13 = [v7 startDate];
    double v14 = [v7 endDate];
    *(_DWORD *)buf = 138413058;
    double v87 = v11;
    __int16 v88 = 2112;
    double v89 = v12;
    __int16 v90 = 2112;
    v91 = v13;
    __int16 v92 = 2112;
    v93 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Aggregation for transit bundle: the last bundle in cluster start date, %@, end date, %@, bundle to be add to cluster: start date, %@, end date, %@", buf, 0x2Au);
  }
  id v77 = [v9 interfaceType];
  unsigned int v15 = +[MOSummarizationUtilities bundleHasOneWayRoute:v9 parameters:v8];
  unsigned int v16 = +[NSArray arrayWithObjects:@"HKWorkoutActivityTypeWalking", @"HKWorkoutActivityTypeHiking", @"HKWorkoutActivityTypeRunning", @"HKWorkoutActivityTypeCycling", @"walk", @"run", @"cycle", 0];
  BOOL v17 = [v9 action];

  v79 = v16;
  if (v17)
  {
    id v18 = [v9 action];
    id v19 = [v18 actionName];
    unsigned int v20 = [v16 containsObject:v19];

    int v21 = v20 ^ 1;
  }
  else
  {
    int v21 = 1;
  }
  double v80 = v8;
  id v22 = [v9 place];

  if (v22)
  {
    long long v23 = [v9 place];
    id v24 = [v23 placeName];

    int v25 = v24 == 0;
  }
  else
  {
    int v25 = 1;
  }
  p_info = (__objc2_class_ro **)(MOPersonRelationship + 32);
  float v27 = [v9 places];

  if (v27)
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    float v28 = [v9 places];
    id v29 = [v28 countByEnumeratingWithState:&v81 objects:v85 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v82;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v82 != v31) {
            objc_enumerationMutation(v28);
          }
          double v33 = [*(id *)(*((void *)&v81 + 1) + 8 * i) placeName];

          int v25 = (v33 == 0) & v25;
        }
        id v30 = [v28 countByEnumeratingWithState:&v81 objects:v85 count:16];
      }
      while (v30);
    }

    p_info = MOPersonRelationship.info;
  }
  if ([v9 bundleSubType] != (id)201) {
    goto LABEL_21;
  }
  v34 = [v9 metaDataForRank];
  double v35 = [v34 objectForKeyedSubscript:@"WorkoutDuration"];
  [v35 doubleValue];
  double v37 = v36;
  [v80 fineGranularity_transitBundlesWorkoutMinimumDuration];
  double v39 = v38;

  if (v37 < v39) {
    int v40 = 1;
  }
  else {
LABEL_21:
  }
    int v40 = 0;
  BOOL v41 = [v7 interfaceType] == (id)2 || [v7 interfaceType] == (id)12;
  uint64_t v42 = [p_info + 206 getInterestingDestination:v7];
  double v43 = (void *)v42;
  int v44 = v15 ^ 1;
  if (v77 != (id)1) {
    int v44 = 1;
  }
  if ((v44 | v21 | v40 | v25 ^ 1) == 1 || !v41 || v42 == 0)
  {
    BOOL v47 = 0;
    float v48 = v80;
    goto LABEL_45;
  }
  __int16 v78 = [p_info + 206 sortedActivityEventsFromBundle:v9];
  float v49 = [v78 lastObject];
  float v50 = [v49 workoutLocationRoute];
  float v51 = [v50 lastObject];

  id v52 = objc_alloc((Class)CLLocation);
  float v53 = [v43 location];
  [v53 latitude];
  double v55 = v54;
  v56 = [v43 location];
  [v56 longitude];
  id v58 = [v52 initWithLatitude:v55 longitude:v57];

  [v58 distanceFromLocation:v51];
  double v60 = v59;
  double v61 = [v9 action];
  double v62 = [v61 actionName];
  if ([v62 isEqualToString:@"HKWorkoutActivityTypeCycling"])
  {
  }
  else
  {
    double v63 = [v9 action];
    float v64 = [v63 actionName];
    unsigned int v65 = [v64 isEqualToString:@"cycle"];

    if (!v65)
    {
      float v48 = v80;
      [v80 fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian];
      goto LABEL_41;
    }
  }
  float v48 = v80;
  [v80 fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle];
LABEL_41:
  double v67 = v66;
  id v68 = objc_alloc((Class)NSDateInterval);
  double v69 = [v9 startDate];
  double v70 = [v51 timestamp];
  id v71 = [v70 dateByAddingTimeInterval:v67];
  id v72 = [v68 initWithStartDate:v69 endDate:v71];

  double v73 = [v43 startDate];
  unsigned __int8 v74 = [v72 containsDate:v73];

  [v48 fineGranularity_transitBundlesDestinationMaximumDistanceThreshold];
  if (v60 <= v75) {
    BOOL v47 = v74;
  }
  else {
    BOOL v47 = 0;
  }

LABEL_45:
  return v47;
}

@end