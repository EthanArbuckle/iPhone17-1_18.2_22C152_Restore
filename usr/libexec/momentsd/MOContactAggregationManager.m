@interface MOContactAggregationManager
- (MOConfigurationManager)configurationManager;
- (MOContactAggregationManager)initWithUniverse:(id)a3;
- (id)_bundlesForContact:(id)a3 fromInputBundles:(id)a4;
- (id)_contactCandidatesForMegaBundleFromStats:(id)a3 contactClassificationMap:(id)a4 parameters:(id)a5;
- (id)_contactClassificationMapFromEventBundles:(id)a3;
- (id)_createContactMegaBundleFromBundles:(id)a3 parameters:(id)a4;
- (id)_eventsForContactFromEventBundles:(id)a3;
- (id)_megaBundleFromContactBundles:(id)a3 parameters:(id)a4;
- (id)_statsForContactFromEventBundles:(id)a3;
- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6;
- (void)setConfigurationManager:(id)a3;
@end

@implementation MOContactAggregationManager

- (MOContactAggregationManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOContactAggregationManager;
  v5 = [(MOContactAggregationManager *)&v11 init];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 getService:v7];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v8;
  }
  return v5;
}

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = v12;
  if (a5 == 2)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_95;
    v15[3] = &unk_1002CA140;
    id v16 = v12;
    [(MOContactAggregationManager *)self _aggregateBundlesForCoarseGranularity:v10 withParameters:v11 handler:v15];
    v14 = v16;
  }
  else
  {
    if (a5 != 1)
    {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
      goto LABEL_7;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke;
    v17[3] = &unk_1002CA140;
    id v18 = v12;
    [(MOContactAggregationManager *)self _aggregateBundlesForFineGranularity:v10 withParameters:v11 handler:v17];
    v14 = v18;
  }

LABEL_7:
}

void __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: output eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__MOContactAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: output eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v11 = [v7 count];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    context = v10;
    id v28 = v9;
    id v29 = v8;
    if (v13)
    {
      *(_DWORD *)buf = 134217984;
      id v36 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: input eventBundles count, %lu", buf, 0xCu);
    }

    +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 4];
    v26 = id v30 = v7;
    v14 = [v7 filteredArrayUsingPredicate:];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = [v19 bundleIdentifier];
            unsigned int v22 = [v19 includedInSummaryBundleOnly];
            *(_DWORD *)buf = 138412546;
            CFStringRef v23 = @"NO";
            if (v22) {
              CFStringRef v23 = @"YES";
            }
            id v36 = v21;
            __int16 v37 = 2112;
            CFStringRef v38 = v23;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: bundle id, %@, includedInSummaryBundleOnly, %@", buf, 0x16u);
          }
          if ([v19 includedInSummaryBundleOnly]) {
            [v19 setIsAggregatedAndSuppressed:1];
          }
          [v19 setSummarizationGranularity:1];
        }
        id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v16);
    }
    v24 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = [v14 count];
      *(_DWORD *)buf = 134217984;
      id v36 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: updated contact eventBundles count, %lu", buf, 0xCu);
    }

    id v9 = v28;
    (*((void (**)(id, void, void))v28 + 2))(v28, 0, 0);

    id v8 = v29;
    id v7 = v30;
    id v10 = context;
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: No eventBundle to be proccessed", buf, 2u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(MOConfigurationManagerBase *)self->_configurationManager getBoolSettingForKey:@"kMOContactAggregationManagerShouldAggregateBundlesForCoarseGranularity" withFallback:0])
  {
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v19 = "CoarseGranularityAggregation for contact: skip aggregation";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, buf, 2u);
    }
LABEL_15:

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    goto LABEL_16;
  }
  if (![v8 count])
  {
    id v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v19 = "CoarseGranularityAggregation for contact: No eventBundle to be proccessed";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v11 = objc_opt_new();
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact related bundles: input eventBundles count, %lu", buf, 0xCu);
  }

  BOOL v13 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 4];
  v14 = [v8 filteredArrayUsingPredicate:v13];
  id v15 = [(MOContactAggregationManager *)self _megaBundleFromContactBundles:v14 parameters:v9];
  if (v15) {
    [v11 addObject:v15];
  }
  id v16 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v11 count];
    *(_DWORD *)buf = 134217984;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact related bundles: output eventBundles count, %lu", buf, 0xCu);
  }

  (*((void (**)(id, void *, void))v10 + 2))(v10, v11, 0);
LABEL_16:
}

- (id)_megaBundleFromContactBundles:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      BOOL v13 = "CoarseGranularityAggregation for contact: no needed to aggregate contact bundles since bundles count is 0";
      v14 = v11;
      uint32_t v15 = 2;
      goto LABEL_7;
    }
LABEL_8:

    id v16 = 0;
    goto LABEL_10;
  }
  id v8 = [v7 aggregationDateInterval];
  [v8 duration];
  double v10 = v9;

  if (v10 < 604800.0)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      [v7 coarseGranularity_contactMegaBundleLookBackDays];
      int v18 = 134217984;
      double v19 = v12;
      BOOL v13 = "CoarseGranularityAggregation for contact: no needed to contact bundles since aggregation time interval is less than %f days";
      v14 = v11;
      uint32_t v15 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, v15);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v16 = [(MOContactAggregationManager *)self _createContactMegaBundleFromBundles:v6 parameters:v7];
  [v16 setSummarizationGranularity:2];
LABEL_10:

  return v16;
}

- (id)_createContactMegaBundleFromBundles:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v95 = self;
  id v8 = [(MOAggregationManager *)self fUniverse];
  double v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  uint64_t v97 = [v8 getService:v10];

  id v11 = +[NSCalendar currentCalendar];
  id v12 = objc_alloc((Class)NSDate);
  [v7 coarseGranularity_contactMegaBundleLookBackDays];
  double v14 = v13 * -86400.0;
  uint32_t v15 = +[NSDate date];
  id v16 = [v12 initWithTimeInterval:v15 sinceDate:v14];
  id v17 = [v11 startOfDayForDate:v16];

  int v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v113 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: the earliest date for contact bundle to be aggregated for coarse granularity: %@", buf, 0xCu);
  }

  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = __78__MOContactAggregationManager__createContactMegaBundleFromBundles_parameters___block_invoke;
  v107[3] = &unk_1002CD8A0;
  id v19 = v17;
  id v108 = v19;
  v20 = +[NSPredicate predicateWithBlock:v107];
  id v21 = [v6 filteredArrayUsingPredicate:v20];

  id v22 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v23 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
  v111[0] = v22;
  v111[1] = v23;
  v96 = v23;
  v24 = +[NSArray arrayWithObjects:v111 count:2];
  id v25 = [v21 sortedArrayUsingDescriptors:v24];

  v26 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v25 count];
    *(_DWORD *)buf = 134217984;
    id v113 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: bundle count after removing old bundles: %lu", buf, 0xCu);
  }

  v98 = v25;
  if (![v25 count])
  {
    id v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    id v29 = (void *)v97;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v31 = "CoarseGranularityAggregation for contact: no bundle available to create contact mega bundle";
      long long v32 = v28;
      uint32_t v33 = 2;
      goto LABEL_11;
    }
LABEL_12:
    p_super = v28;
    v35 = 0;
    goto LABEL_38;
  }
  if ((unint64_t)[v25 count] <= 1)
  {
    id v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    id v29 = (void *)v97;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v30 = [v25 count];
      *(_DWORD *)buf = 134217984;
      id v113 = v30;
      long long v31 = "CoarseGranularityAggregation for contact: %lu bundle is not enough to create contact mega bundle for coarse granularity";
      long long v32 = v28;
      uint32_t v33 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, v31, buf, v33);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v91 = v22;
  v92 = v21;
  id v36 = [MOEventBundle alloc];
  __int16 v37 = +[NSUUID UUID];
  CFStringRef v38 = +[NSDate date];
  v39 = [(MOEventBundle *)v36 initWithBundleIdentifier:v37 creationDate:v38];

  v93 = v39;
  [(MOEventBundle *)v39 setInterfaceType:4];
  uint64_t v40 = [(MOContactAggregationManager *)v95 _statsForContactFromEventBundles:v25];
  v89 = [(MOContactAggregationManager *)v95 _contactClassificationMapFromEventBundles:v25];
  v90 = (void *)v40;
  v41 = -[MOContactAggregationManager _contactCandidatesForMegaBundleFromStats:contactClassificationMap:parameters:](v95, "_contactCandidatesForMegaBundleFromStats:contactClassificationMap:parameters:", v40);
  v100 = [(MOContactAggregationManager *)v95 _eventsForContactFromEventBundles:v25];
  v94 = objc_opt_new();
  v102 = objc_opt_new();
  v101 = objc_opt_new();
  v88 = v41;
  if ((unint64_t)[v41 count] > 1)
  {
    id v86 = v6;
    id v87 = v19;
    if ((unint64_t)[v41 count] < 3)
    {
      v45 = v94;
      [v94 addObjectsFromArray:v41];
    }
    else
    {
      signed int v43 = arc4random_uniform([v41 count] - 3);
      v44 = [v41 objectAtIndexedSubscript:v43];
      v45 = v94;
      [v94 addObject:v44];

      v46 = [v41 objectAtIndexedSubscript:v43 + 1];
      [v94 addObject:v46];

      v47 = [v41 objectAtIndexedSubscript:v43 + 2];
      [v94 addObject:v47];
    }
    v48 = +[NSSortDescriptor sortDescriptorWithKey:@"score", 0, v7 ascending];
    v110 = v48;
    v49 = +[NSArray arrayWithObjects:&v110 count:1];
    v50 = [v45 sortedArrayUsingDescriptors:v49];

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v51 = v50;
    id v52 = [v51 countByEnumeratingWithState:&v103 objects:v109 count:16];
    obj = v51;
    if (v52)
    {
      id v53 = v52;
      unint64_t v54 = 0;
      uint64_t v55 = *(void *)v104;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(void *)v104 != v55) {
            objc_enumerationMutation(obj);
          }
          v57 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          v58 = [v57 contact];
          v59 = [v58 identifier];
          v60 = +[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:v59];

          if (v60)
          {
            if (v54 >= 3) {
              double v61 = 0.0;
            }
            else {
              double v61 = (double)(v54 + 200);
            }
            v62 = [MOPerson alloc];
            v63 = [v57 contact];
            v64 = [v63 localizedFullName];
            [v57 score];
            v66 = [(MOPerson *)v62 initWithLocalIdentifier:0 name:v64 contactIdentifier:v60 family:0 priorityScore:v61 significanceScore:v65];

            v67 = [v100 objectForKey:v57];
            v68 = [v67 allObjects];

            [(MOPerson *)v66 setSourceEventAccessType:3];
            v69 = [v68 firstObject];
            v70 = [v69 eventIdentifier];
            [(MOPerson *)v66 setSourceEventIdentifier:v70];

            [v101 addObject:v66];
            v71 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              id v72 = [v68 count];
              *(_DWORD *)buf = 134217984;
              id v113 = v72;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact, events count for each suggested contact: %lu", buf, 0xCu);
            }

            [v102 addObjectsFromArray:v68];
            ++v54;
          }
        }
        v51 = obj;
        id v53 = [obj countByEnumeratingWithState:&v103 objects:v109 count:16];
      }
      while (v53);
    }

    v73 = [(MOContactAggregationManager *)v95 _bundlesForContact:v94 fromInputBundles:v98];
    +[MOSummarizationUtilities updateRankMetaDataFrom:v73 forSummaryBundle:v93];
    v74 = [v102 allObjects];
    [(MOEventBundle *)v93 setEvents:v74];

    [(MOEventBundle *)v93 setPropertiesBasedOnEvents];
    [(MOEventBundle *)v93 setStartDate:v87];
    v75 = +[NSDate date];
    [(MOEventBundle *)v93 setEndDate:v75];

    v76 = [(MOEventBundle *)v93 startDate];
    id v29 = (void *)v97;
    v77 = +[MOTime timeForDate:v76 timeZoneManager:v97];
    [(MOEventBundle *)v93 setTime:v77];

    v78 = [[MOAction alloc] initWithActionName:@"Communicate" actionType:5 actionSubtype:4];
    [(MOEventBundle *)v93 setAction:v78];

    v79 = [v102 allObjects];
    v80 = [v79 firstObject];
    v81 = [v80 eventIdentifier];
    v82 = [(MOEventBundle *)v93 action];
    [v82 setSourceEventIdentifier:v81];

    [(MOEventBundle *)v93 setPersons:v101];
    [(MOEventBundle *)v93 setBundleSuperType:3];
    [(MOEventBundle *)v93 setBundleSubType:302];
    v83 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      -[MOContactAggregationManager _createContactMegaBundleFromBundles:parameters:]((uint64_t)v93, v83);
    }

    v35 = v93;
    id v7 = v85;
    id v6 = v86;
    id v19 = v87;
    id v22 = v91;
    id v21 = v92;
  }
  else
  {
    v42 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    id v29 = (void *)v97;
    id v22 = v91;
    id v21 = v92;
    obj = v42;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: no enough contacts to create contact mega bundle for coarse granularity", buf, 2u);
    }
    v35 = 0;
  }

  p_super = &v93->super;
LABEL_38:

  return v35;
}

id __78__MOContactAggregationManager__createContactMegaBundleFromBundles_parameters___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 startDate];
  id v4 = [v3 isOnOrAfter:*(void *)(a1 + 32)];

  return v4;
}

- (id)_contactCandidatesForMegaBundleFromStats:(id)a3 contactClassificationMap:(id)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v45 = (id)objc_opt_new();
  v46 = v7;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v10 = [v7 allKeys];
  id v47 = [v10 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v47)
  {
    uint64_t v12 = *(void *)v49;
    *(void *)&long long v11 = 138412290;
    long long v42 = v11;
    signed int v43 = v10;
    id v44 = v8;
    do
    {
      float v13 = 0;
      do
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v10);
        }
        double v14 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v13);
        uint32_t v15 = [v8 objectForKey:v14, v42];
        if (v15)
        {
          id v16 = [v8 objectForKey:v14];
          uint64_t v17 = [v16 unsignedIntValue];
        }
        else
        {
          uint64_t v17 = 0;
        }

        int v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          id v36 = [v14 contact];
          __int16 v37 = [v36 identifier];
          *(_DWORD *)buf = 138412546;
          id v53 = v37;
          __int16 v54 = 2048;
          uint64_t v55 = v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: contact identifier, %@, classification, %lu", buf, 0x16u);
        }
        if ((v17 & 0x200000) == 0 && (v17 & 0x100008) != 0)
        {
          uint64_t v19 = v12;
          v20 = v9;
          id v21 = [v46 objectForKey:v14];
          id v22 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v42;
            id v53 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: contactCandidates stats check: %@", buf, 0xCu);
          }

          id v23 = [v21 objectForKeyedSubscript:@"callCount"];
          float v24 = (float)(uint64_t)[v23 longValue];
          [v20 coarseGranularity_contactBundleAggregationCallCountThreshold];
          if (v25 > v24)
          {
            v26 = [v21 objectForKeyedSubscript:@"aggregatedCallDuration"];
            float v27 = (float)(uint64_t)[v26 longValue];
            [v20 coarseGranularity_contactBundleAggregationCallDurationThreshold];
            if (v28 > v27)
            {
              id v29 = [v21 objectForKeyedSubscript:@"messageCount"];
              float v30 = (float)(uint64_t)[v29 longValue];
              [v20 coarseGranularity_contactBundleAggregationMessageCountThreshold];
              if (v31 > v30)
              {

                double v10 = v43;
                id v8 = v44;
LABEL_22:

                id v9 = v20;
                uint64_t v12 = v19;
                goto LABEL_23;
              }
              long long v32 = [v21 objectForKeyedSubscript:@"outgoingMessageCount"];
              float v33 = (float)(uint64_t)[v32 longValue];
              [v20 coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold];
              float v35 = v34;

              double v10 = v43;
              id v8 = v44;
              if (v35 > v33) {
                goto LABEL_22;
              }
LABEL_21:
              [v45 addObject:v14];
              goto LABEL_22;
            }

            double v10 = v43;
            id v8 = v44;
          }

          goto LABEL_21;
        }
LABEL_23:
        float v13 = (char *)v13 + 1;
      }
      while (v47 != v13);
      id v38 = [v10 countByEnumeratingWithState:&v48 objects:v56 count:16];
      id v47 = v38;
    }
    while (v38);
  }

  v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    id v40 = [v45 count];
    *(_DWORD *)buf = 134217984;
    id v53 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for contact: contactCandidates count: %lu", buf, 0xCu);
  }

  return v45;
}

- (id)_contactClassificationMapFromEventBundles:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v3;
  id v31 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v48;
    __int16 v37 = v4;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v5;
        id v6 = *(void **)(*((void *)&v47 + 1) + 8 * v5);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v33 = [v6 events];
        id v35 = [v33 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v35)
        {
          uint64_t v34 = *(void *)v44;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v44 != v34) {
                objc_enumerationMutation(v33);
              }
              id v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              id v9 = [v8 contactClassificationMap];
              id v10 = [v9 count];

              if (v10)
              {
                id v36 = i;
                long long v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                {
                  float v25 = [v8 eventIdentifier];
                  v26 = [v8 contactClassificationMap];
                  id v27 = [v26 count];
                  *(_DWORD *)buf = 138412546;
                  id v53 = v25;
                  __int16 v54 = 2048;
                  id v55 = v27;
                  _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: event identifier, %@, contactClassificationMap count, %lu", buf, 0x16u);
                }
                long long v41 = 0u;
                long long v42 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                uint64_t v12 = [v8 contactClassificationMap];
                float v13 = [v12 allKeys];

                id v14 = [v13 countByEnumeratingWithState:&v39 objects:v51 count:16];
                if (v14)
                {
                  id v15 = v14;
                  uint64_t v16 = *(void *)v40;
                  do
                  {
                    for (j = 0; j != v15; j = (char *)j + 1)
                    {
                      if (*(void *)v40 != v16) {
                        objc_enumerationMutation(v13);
                      }
                      int v18 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
                      uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                      {
                        id v38 = [v18 contact];
                        id v22 = [v38 identifier];
                        id v23 = [v8 contactClassificationMap];
                        float v24 = [v23 objectForKey:v18];
                        *(_DWORD *)buf = 138412546;
                        id v53 = v22;
                        __int16 v54 = 2112;
                        id v55 = v24;
                        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: contact identifier, %@, classification, %@", buf, 0x16u);

                        id v4 = v37;
                      }

                      v20 = [v8 contactClassificationMap];
                      id v21 = [v20 objectForKey:v18];
                      [v4 setObject:v21 forKey:v18];
                    }
                    id v15 = [v13 countByEnumeratingWithState:&v39 objects:v51 count:16];
                  }
                  while (v15);
                }

                i = v36;
              }
            }
            id v35 = [v33 countByEnumeratingWithState:&v43 objects:v56 count:16];
          }
          while (v35);
        }

        uint64_t v5 = v32 + 1;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v31);
  }

  return v4;
}

- (id)_statsForContactFromEventBundles:(id)a3
{
  id v3 = a3;
  id v76 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F6F98, &off_1002F6FB0, &off_1002F6FC8, &off_1002F6FE0, &off_1002F6FF8, &off_1002F7010, &off_1002F7028, &off_1002F7040, 0];
  id v73 = [objc_alloc((Class)NSSet) initWithObjects:&off_1002F7058, &off_1002F7070, &off_1002F7088, 0];
  id v4 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v3;
  id v66 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
  if (v66)
  {
    uint64_t v65 = *(void *)v90;
    id v72 = v4;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v90 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v67 = v5;
        id v6 = *(void **)(*((void *)&v89 + 1) + 8 * v5);
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v70 = [v6 events];
        id v7 = [v70 countByEnumeratingWithState:&v85 objects:v95 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v86;
          uint64_t v68 = *(void *)v86;
          do
          {
            uint64_t v10 = 0;
            id v69 = v8;
            do
            {
              if (*(void *)v86 != v9) {
                objc_enumerationMutation(v70);
              }
              uint64_t v71 = v10;
              long long v11 = *(void **)(*((void *)&v85 + 1) + 8 * v10);
              uint64_t v12 = [v11 interactions];
              float v13 = [v12 firstObject];
              id v14 = [v13 recipients];
              id v15 = [v14 count];

              if ((unint64_t)v15 <= 1)
              {
                uint64_t v16 = [v11 interactionScoredContact];
                if (v16)
                {
                  uint64_t v17 = (void *)v16;
                  int v18 = [v11 interactionScoredContact];
                  uint64_t v19 = [v18 contact];
                  v20 = [v19 identifier];
                  id v21 = +[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:v20];

                  if (v21)
                  {
                    id v22 = [v11 interactions];
                    id v23 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
                    v94 = v23;
                    float v24 = +[NSArray arrayWithObjects:&v94 count:1];
                    float v25 = [v22 sortedArrayUsingDescriptors:v24];

                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v81 = 0u;
                    long long v82 = 0u;
                    id v74 = v25;
                    v26 = NSAssertionHandler_ptr;
                    id v78 = [v74 countByEnumeratingWithState:&v81 objects:v93 count:16];
                    if (v78)
                    {
                      uint64_t v27 = 0;
                      uint64_t v79 = 0;
                      uint64_t v80 = 0;
                      uint64_t v77 = *(void *)v82;
                      double v28 = 0.0;
                      do
                      {
                        for (i = 0; i != v78; i = (char *)i + 1)
                        {
                          if (*(void *)v82 != v77) {
                            objc_enumerationMutation(v74);
                          }
                          uint64_t v30 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                          id v31 = [v26[32] numberWithInteger:[v30 mechanism]];
                          unsigned int v32 = [v76 containsObject:v31];

                          if (v32)
                          {
                            uint64_t v33 = [v30 startDate];
                            if (v33)
                            {
                              uint64_t v34 = (void *)v33;
                              id v35 = [v30 endDate];

                              if (v35)
                              {
                                id v36 = [v30 endDate];
                                __int16 v37 = [v30 startDate];
                                [v36 timeIntervalSinceDate:v37];
                                double v39 = v38;

                                double v28 = v28 + v39;
                                if (v39 > 300.0) {
                                  ++v27;
                                }
                              }
                            }
                          }
                          else
                          {
                            long long v40 = [v26[32] numberWithInteger:[v30 mechanism]];
                            unsigned int v41 = [v73 containsObject:v40];

                            if (v41)
                            {
                              ++v80;
                              id v42 = [v30 direction];
                              uint64_t v43 = v79;
                              if (v42 == (id)1) {
                                uint64_t v43 = v79 + 1;
                              }
                              uint64_t v79 = v43;
                            }
                          }
                          long long v44 = [v4 allKeys];
                          long long v45 = [v11 interactionScoredContact];
                          unsigned int v46 = [v44 containsObject:v45];

                          if (v46)
                          {
                            long long v47 = [v11 interactionScoredContact];
                            long long v48 = [v4 objectForKey:v47];
                            id v49 = [v48 mutableCopy];

                            long long v50 = [v49 valueForKey:@"callCount"];
                            long long v51 = [[v26[32] numberWithLong:[v50 longValue] + v27];
                            [v49 setValue:v51 forKey:@"callCount"];

                            uint64_t v75 = v27;
                            id v52 = [v49 valueForKey:@"aggregatedCallDuration"];
                            id v53 = [v26[32] numberWithLong:(uint64_t)(v28 + (double)(uint64_t)[v52 longValue])];
                            [v49 setValue:v53 forKey:@"aggregatedCallDuration"];

                            __int16 v54 = [v49 valueForKey:@"messageCount"];
                            id v55 = [v26[32] numberWithLong:((char *)[v54 longValue]) + v80];
                            [v49 setValue:v55 forKey:@"messageCount"];

                            v56 = [v49 valueForKey:@"outgoingMessageCount"];
                            v57 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v56 longValue] + v79);
                            id v4 = v72;
                            [v49 setValue:v57 forKey:@"callCount"];

                            v58 = [v11 interactionScoredContact];
                            [v72 setObject:v49 forKey:v58];

                            v26 = NSAssertionHandler_ptr;
                            uint64_t v27 = v75;
                          }
                          else
                          {
                            id v49 = (id)objc_opt_new();
                            v59 = [v26[32] numberWithLong:v27];
                            [v49 setValue:v59 forKey:@"callCount"];

                            v60 = [v26[32] numberWithLong:(uint64_t)v28];
                            [v49 setValue:v60 forKey:@"aggregatedCallDuration"];

                            double v61 = [v26[32] numberWithLong:v80];
                            [v49 setValue:v61 forKey:@"messageCount"];

                            v62 = [v26[32] numberWithLong:v79];
                            [v49 setValue:v62 forKey:@"outgoingMessageCount"];

                            long long v50 = [v11 interactionScoredContact];
                            [v4 setObject:v49 forKey:v50];
                          }
                        }
                        id v78 = [v74 countByEnumeratingWithState:&v81 objects:v93 count:16];
                      }
                      while (v78);
                    }

                    uint64_t v9 = v68;
                    id v8 = v69;
                  }
                }
              }
              uint64_t v10 = v71 + 1;
            }
            while ((id)(v71 + 1) != v8);
            id v8 = [v70 countByEnumeratingWithState:&v85 objects:v95 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v67 + 1;
      }
      while ((id)(v67 + 1) != v66);
      id v66 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
    }
    while (v66);
  }

  return v4;
}

- (id)_eventsForContactFromEventBundles:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = v3;
  id v37 = [v5 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v45;
    id v36 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v5);
        }
        uint64_t v38 = v6;
        id v7 = *(void **)(*((void *)&v44 + 1) + 8 * v6);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id obj = [v7 events];
        id v8 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v41;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v41 != v10) {
                objc_enumerationMutation(obj);
              }
              uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              float v13 = [v12 interactions];
              id v14 = [v13 firstObject];
              id v15 = [v14 recipients];
              id v16 = [v15 count];

              if ((unint64_t)v16 <= 1)
              {
                uint64_t v17 = [v12 interactionScoredContact];
                if (v17)
                {
                  int v18 = (void *)v17;
                  uint64_t v19 = [v12 interactionScoredContact];
                  v20 = [v19 contact];
                  id v21 = [v20 identifier];
                  id v22 = +[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:v21];

                  if (v22)
                  {
                    id v23 = [v4 allKeys];
                    float v24 = [v12 interactionScoredContact];
                    unsigned int v25 = [v23 containsObject:v24];

                    if (v25)
                    {
                      v26 = [v12 interactionScoredContact];
                      uint64_t v27 = [v4 objectForKey:v26];
                      id v28 = [v27 mutableCopy];

                      [v28 addObject:v12];
                      id v29 = [v28 copy];
                      uint64_t v30 = [v12 interactionScoredContact];
                      [v4 setObject:v29 forKey:v30];

                      id v31 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                        -[MOContactAggregationManager _eventsForContactFromEventBundles:]((uint64_t)v49, v28);
                      }
                    }
                    else
                    {
                      id v28 = (id)objc_opt_new();
                      [v28 addObject:v12];
                      unsigned int v32 = [v12 interactionScoredContact];
                      [v4 setObject:v28 forKey:v32];

                      id v31 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
                        -[MOContactAggregationManager _eventsForContactFromEventBundles:]((uint64_t)v48, v28);
                      }
                    }
                  }
                }
              }
            }
            id v9 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v38 + 1;
        id v5 = v36;
      }
      while ((id)(v38 + 1) != v37);
      id v37 = [v36 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v37);
  }

  uint64_t v33 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[MOContactAggregationManager _eventsForContactFromEventBundles:]((uint64_t)v4, v33);
  }

  return v4;
}

- (id)_bundlesForContact:(id)a3 fromInputBundles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v20 = (id)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = v6;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          float v13 = [v12 events];
          id v14 = [v13 firstObject];
          id v15 = [v14 interactionScoredContact];
          unsigned int v16 = [v5 containsObject:v15];

          if (v16)
          {
            [v20 addObject:v12];
            uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v12;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: subBundles: %@", buf, 0xCu);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
    }

    id v6 = v19;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_createContactMegaBundleFromBundles:(uint64_t)a1 parameters:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: megabundle: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_eventsForContactFromEventBundles:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "CoarseGranularityAggregation for contact: contact eventsDict: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_eventsForContactFromEventBundles:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  id v4 = OUTLINED_FUNCTION_1_10(a1, a2);
  _DWORD *v3 = 134217984;
  *int v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "CoarseGranularityAggregation for contact: contact events count after modified: %lu");
}

- (void)_eventsForContactFromEventBundles:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  id v4 = OUTLINED_FUNCTION_1_10(a1, a2);
  _DWORD *v3 = 134217984;
  *int v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "CoarseGranularityAggregation for contact: contact events count after set: %lu");
}

@end