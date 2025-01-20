@interface MODominantBundleCreationManager
- (BOOL)_locationCheckForMergingOutingBundle:(id)a3 activityBundle:(id)a4;
- (MODaemonUniverse)fUniverse;
- (MODominantBundleCreationManager)initWithUniverse:(id)a3;
- (id)_dominantBundleCreatedFromOutingBundles:(id)a3 activityBundles:(id)a4 parameters:(id)a5;
- (void)_removeDuplicatePhotoResourceFromActivityBundles:(id)a3 compareWithHomeBundle:(id)a4;
- (void)_suppressDuplicateContactBundles:(id)a3 comparedWithContactTrendbundles:(id)a4;
- (void)_suppressDuplicateHomeBundles:(id)a3 parameters:(id)a4;
- (void)_suppressDuplicateMediaBundles:(id)a3 comparedWithActivitybundles:(id)a4 parameters:(id)a5;
- (void)_suppressDuplicateMediaBundles:(id)a3 comparedWithHomebundles:(id)a4 parameters:(id)a5;
- (void)processBundlesForCreatingDominantBundles:(id)a3 withParameters:(id)a4 handler:(id)a5;
@end

@implementation MODominantBundleCreationManager

- (MODominantBundleCreationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODominantBundleCreationManager;
  v6 = [(MODominantBundleCreationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fUniverse, a3);
  }

  return v7;
}

- (void)processBundlesForCreatingDominantBundles:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = [v8 count];
  v13 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    v46 = self;
    context = v11;
    id v48 = v10;
    if (v14)
    {
      *(_DWORD *)buf = 134217984;
      id v56 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "DominantBundleCreation: input eventBundles count, %lu", buf, 0xCu);
    }

    id v15 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    v45 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 2];
    v16 = [v8 filteredArrayUsingPredicate:];
    id v54 = v15;
    v17 = +[NSArray arrayWithObjects:&v54 count:1];
    uint64_t v18 = [v16 sortedArrayUsingDescriptors:v17];

    v43 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 1];
    v19 = [v8 filteredArrayUsingPredicate:];
    id v53 = v15;
    v20 = +[NSArray arrayWithObjects:&v53 count:1];
    v37 = [v19 sortedArrayUsingDescriptors:v20];

    v42 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 7];
    v21 = [v8 filteredArrayUsingPredicate:];
    id v52 = v15;
    v22 = +[NSArray arrayWithObjects:&v52 count:1];
    v23 = [v21 sortedArrayUsingDescriptors:v22];

    v40 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 4];
    v24 = [v8 filteredArrayUsingPredicate:];
    id v51 = v15;
    v25 = +[NSArray arrayWithObjects:&v51 count:1];
    uint64_t v26 = [v24 sortedArrayUsingDescriptors:v25];

    v38 = +[NSPredicate predicateWithBlock:&__block_literal_global_2];
    v27 = [v8 filteredArrayUsingPredicate:];
    v44 = (void *)v18;
    v28 = [(MODominantBundleCreationManager *)v46 _dominantBundleCreatedFromOutingBundles:v18 activityBundles:v37 parameters:v9];
    v39 = (void *)v26;
    [(MODominantBundleCreationManager *)v46 _suppressDuplicateContactBundles:v26 comparedWithContactTrendbundles:v27];
    id v49 = v9;
    [(MODominantBundleCreationManager *)v46 _suppressDuplicateHomeBundles:v23 parameters:v9];
    v29 = +[NSPredicate predicateWithFormat:@"%K = NO", @"isAggregatedAndSuppressed"];
    v41 = v23;
    v30 = [v23 filteredArrayUsingPredicate:v29];
    id v50 = v15;
    v31 = +[NSArray arrayWithObjects:&v50 count:1];
    v32 = [v30 sortedArrayUsingDescriptors:v31];

    [(MODominantBundleCreationManager *)v46 _removeDuplicatePhotoResourceFromActivityBundles:v37 compareWithHomeBundle:v32];
    v33 = [v8 arrayByAddingObjectsFromArray:v28];
    v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = [v33 count];
      *(_DWORD *)buf = 134217984;
      id v56 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "DominantBundleCreation: output eventBundles count, %lu", buf, 0xCu);
    }

    id v10 = v48;
    (*((void (**)(id, void *, void))v48 + 2))(v48, v33, 0);

    id v9 = v49;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "DominantBundleCreation: No eventBundle to be proccessed through dominantBundleCreation process", buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

BOOL __99__MODominantBundleCreationManager_processBundlesForCreatingDominantBundles_withParameters_handler___block_invoke(id a1, MOEventBundle *a2, NSDictionary *a3)
{
  v3 = a2;
  id v4 = [(MOEventBundle *)v3 interfaceType];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MOEventBundle *)v3 events];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v11) {
          v8 |= [v11 category] == (id)4;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  return (v4 == (id)9) & v8;
}

- (id)_dominantBundleCreatedFromOutingBundles:(id)a3 activityBundles:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    SEL v91 = a2;
    v100 = objc_opt_new();
    v95 = objc_opt_new();
    v94 = +[NSPredicate predicateWithFormat:@"type == %lu", 2];
    id v93 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"priorityScore" ascending:1];
    v96 = v9;
    if ([v8 count])
    {
      uint64_t v11 = 0;
      unsigned int v12 = 0;
      unsigned int v13 = 0;
      while (1)
      {
        if ((unint64_t)[v9 count] <= v13) {
          goto LABEL_29;
        }
        unsigned int v98 = v12;
        long long v14 = v8;
        long long v15 = [v8 objectAtIndexedSubscript:v11];
        id v16 = v9;
        unsigned int v17 = v13;
        uint64_t v18 = [v9 objectAtIndexedSubscript:v13];
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:v15 andOtherBundle:v18];
        double v20 = v19;
        id v21 = objc_alloc((Class)NSDateInterval);
        v22 = [v15 startDate];
        v23 = [v15 endDate];
        id v24 = [v21 initWithStartDate:v22 endDate:v23];
        [v24 duration];
        double v26 = v20 / v25;

        id v27 = objc_alloc((Class)NSDateInterval);
        v28 = [v18 startDate];
        v29 = [v18 endDate];
        id v30 = [v27 initWithStartDate:v28 endDate:v29];
        [v30 duration];
        double v32 = v20 / v31;

        [v10 dominantBundle_overlappingThreshold];
        if (v26 > v33 || (objc_msgSend(v10, "dominantBundle_overlappingThreshold"), v32 > v34))
        {
          if (!+[MOSummarizationUtilities isOutingBundleFromHomeOrWorkVisit:](MOSummarizationUtilities, "isOutingBundleFromHomeOrWorkVisit:", v15)&& -[MODominantBundleCreationManager _locationCheckForMergingOutingBundle:activityBundle:](self, "_locationCheckForMergingOutingBundle:activityBundle:", v15, v18)&& +[MOSummarizationUtilities isOutingBundleInsideOneDay:](MOSummarizationUtilities, "isOutingBundleInsideOneDay:", v15)&& [v18 bundleSubType] != (id)204&& objc_msgSend(v18, "bundleSubType") != (id)207&& objc_msgSend(v18, "bundleSubType") != (id)208&& !+[MOSummarizationUtilities isFlightBundle:](MOSummarizationUtilities, "isFlightBundle:", v15))
          {
            break;
          }
        }
        unsigned int v35 = v17;
        id v8 = v14;
        if (v26 <= 0.0 && v32 <= 0.0) {
          goto LABEL_23;
        }
        +[MOSummarizationUtilities removeDuplicatePhotoResourceFromBundle:v18 comparedWithPrimaryBundle:v15];
        v36 = [v18 action];
        if ([v36 actionSubtype] != (id)2) {
          goto LABEL_22;
        }
        v37 = [v18 resources];
        id v38 = [v37 count];

        id v16 = v96;
        if (v38)
        {
          v39 = [v18 resources];
          v36 = [v39 filteredArrayUsingPredicate:v94];

          if ([v36 count])
          {
            id v106 = v93;
            v40 = +[NSArray arrayWithObjects:&v106 count:1];
            v41 = [v36 sortedArrayUsingDescriptors:v40];

            v42 = [v41 firstObject];
            [v42 setPriorityScore:99.0];
            goto LABEL_21;
          }
          goto LABEL_22;
        }
LABEL_23:
        v43 = [v15 endDate];
        v44 = [v18 endDate];
        unsigned int v45 = [v43 isOnOrAfter:v44];

        unsigned int v13 = v35 + v45;
        unsigned int v12 = v98 + (v45 ^ 1);
        uint64_t v11 = v12;
        id v9 = v16;
        if ((unint64_t)[v8 count] <= v12) {
          goto LABEL_29;
        }
      }
      unsigned int v35 = v17;
      id v8 = v14;
      uint64_t v46 = v35 + [v14 count];
      v36 = +[NSNumber numberWithInt:v98];
      v107[0] = v36;
      v41 = +[NSNumber numberWithInt:v46];
      v107[1] = v41;
      v42 = +[NSArray arrayWithObjects:v107 count:2];
      [v95 addObject:v42];
LABEL_21:

LABEL_22:
      id v16 = v96;
      goto LABEL_23;
    }
LABEL_29:
    id v49 = (char *)[v8 count];
    id v50 = &v49[(void)[v9 count]];
    id v51 = [[MOGraph alloc] initWithNumVertices:v50 edges:v95];
    id v52 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      id v53 = [v95 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v109 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "DominantBundleCreation: correlation graph is built with number of edges, %lu", buf, 0xCu);
    }

    v90 = v51;
    v99 = [(MOGraph *)v51 calculateConnectedComponentWithGraphTraversal:1];
    id v54 = v100;
    if ([v99 count] != v50)
    {
      v55 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:](v55);
      }

      id v56 = +[NSAssertionHandler currentHandler];
      [v56 handleFailureInMethod:v91 object:self file:@"MODominantBundleCreationManager.m" lineNumber:187 description:@"DominantBundleCreation: the event bundles and membership arrays have to be of the same size. (in %s:%d)", @"-[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:]", 187];
    }
    if (v50)
    {
      uint64_t v57 = 0;
      for (unint64_t i = 0; (char *)i != v50; ++i)
      {
        v59 = [v99 objectAtIndexedSubscript:i];
        v60 = [v54 objectForKey:v59];

        if (!v60)
        {
          v61 = objc_opt_new();
          [v54 setObject:v61 forKeyedSubscript:v59];
        }
        if ((unint64_t)[v8 count] <= i)
        {
          id v68 = [v8 count];
          v69 = [v54 objectForKeyedSubscript:v59];
          uint64_t v70 = (v57 - ((void)v68 << 32)) >> 32;
          v71 = [v96 objectAtIndexedSubscript:v70];
          [v69 addObject:v71];

          v64 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v72 = [v59 intValue];
            v66 = [v96 objectAtIndexedSubscript:v70];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v109 = v72;
            *(_WORD *)&v109[4] = 2112;
            *(void *)&v109[6] = v66;
            v67 = v64;
            goto LABEL_46;
          }
        }
        else
        {
          v62 = [v54 objectForKeyedSubscript:v59];
          v63 = [v8 objectAtIndexedSubscript:i];
          [v62 addObject:v63];

          v64 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v65 = [v59 intValue];
            v66 = [v8 objectAtIndexedSubscript:i];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v109 = v65;
            *(_WORD *)&v109[4] = 2112;
            *(void *)&v109[6] = v66;
            v67 = v64;
LABEL_46:
            _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "DominantBundleCreation:group %d, bundle-> %@", buf, 0x12u);
          }
        }

        v57 += (uint64_t)&_mh_execute_header;
        id v54 = v100;
      }
    }
    id v92 = v8;
    v73 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
      -[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:](v99, v73);
    }

    v74 = [(MODominantBundleCreationManager *)self fUniverse];
    v75 = (objc_class *)objc_opt_class();
    v76 = NSStringFromClass(v75);
    v77 = [v74 getService:v76];

    id v48 = objc_opt_new();
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v78 = [v100 allValues];
    id v79 = [v78 countByEnumeratingWithState:&v101 objects:v105 count:16];
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v102;
      do
      {
        for (j = 0; j != v80; j = (char *)j + 1)
        {
          if (*(void *)v102 != v81) {
            objc_enumerationMutation(v78);
          }
          v83 = *(void **)(*((void *)&v101 + 1) + 8 * (void)j);
          if ((unint64_t)[v83 count] >= 2)
          {
            v84 = [v83 allObjects];
            v85 = +[MOSummarizationUtilities createDominantBundleFromBundles:v84 withParameters:v10 timeZoneManager:v77];

            if (v85) {
              [v48 addObject:v85];
            }
            v86 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v109 = v85;
              _os_log_debug_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "DominantBundleCreation:dominant bundle %@", buf, 0xCu);
            }
          }
        }
        id v80 = [v78 countByEnumeratingWithState:&v101 objects:v105 count:16];
      }
      while (v80);
    }

    v87 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      id v88 = [v48 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v109 = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "DominantBundleCreation: newly created dominant bundles count: %lu", buf, 0xCu);
    }

    id v8 = v92;
    id v9 = v96;
    v47 = v100;
  }
  else
  {
    v47 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v109 = [v8 count];
      *(_WORD *)&v109[8] = 2048;
      *(void *)&v109[10] = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "DominantBundleCreation: no dominant bundle is created since outing or activit bundles count is 0, outing bundles count: %lu, activity bundles count: %lu", buf, 0x16u);
    }
    id v48 = 0;
  }

  return v48;
}

- (void)_removeDuplicatePhotoResourceFromActivityBundles:(id)a3 compareWithHomeBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    uint64_t v25 = +[NSPredicate predicateWithFormat:@"type == %lu", 2];
    id v24 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"priorityScore" ascending:1];
    if ([v6 count])
    {
      uint64_t v7 = 0;
      unsigned int v8 = 0;
      unsigned int v9 = 0;
      while (1)
      {
        if ((unint64_t)[v5 count] <= v9) {
          goto LABEL_13;
        }
        id v10 = [v6 objectAtIndexedSubscript:v7];
        uint64_t v11 = [v5 objectAtIndexedSubscript:v9];
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:v10 andOtherBundle:v11];
        if (v12 > 0.0)
        {
          +[MOSummarizationUtilities removeDuplicatePhotoResourceFromBundle:v11 comparedWithPrimaryBundle:v10];
          unsigned int v13 = [v11 action];
          if ([v13 actionSubtype] != (id)2) {
            goto LABEL_11;
          }
          long long v14 = [v11 resources];
          id v15 = [v14 count];

          if (v15) {
            break;
          }
        }
LABEL_12:
        double v20 = [v10 endDate];
        id v21 = [v11 endDate];
        unsigned int v22 = [v20 isOnOrAfter:v21];

        v9 += v22;
        v8 += v22 ^ 1;
        uint64_t v7 = v8;
        if ((unint64_t)[v6 count] <= v8) {
          goto LABEL_13;
        }
      }
      id v16 = [v11 resources];
      unsigned int v13 = [v16 filteredArrayUsingPredicate:v25];

      if ([v13 count])
      {
        id v26 = v24;
        unsigned int v17 = +[NSArray arrayWithObjects:&v26 count:1];
        uint64_t v18 = [v13 sortedArrayUsingDescriptors:v17];

        double v19 = [v18 firstObject];
        [v19 setPriorityScore:99.0];
      }
LABEL_11:

      goto LABEL_12;
    }
LABEL_13:

    v23 = v25;
  }
  else
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v28 = [v6 count];
      __int16 v29 = 2048;
      id v30 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "DominantBundleCreation: no resource change needed for activity bundles compared to home bundles since home or activit bundles count is 0, home bundles count: %lu, activity bundles count: %lu", buf, 0x16u);
    }
  }
}

- (void)_suppressDuplicateContactBundles:(id)a3 comparedWithContactTrendbundles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    if ([v5 count])
    {
      uint64_t v7 = 0;
      unsigned int v8 = 0;
      unsigned int v9 = 0;
      int v10 = 0;
      id v32 = v5;
      id v34 = v6;
      do
      {
        if ((unint64_t)[v6 count] <= v9) {
          break;
        }
        unsigned int v11 = v9;
        double v12 = [v5 objectAtIndexedSubscript:v7];
        unsigned int v13 = [v6 objectAtIndexedSubscript:v9];
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:v12 andOtherBundle:v13];
        if (v14 > 0.0)
        {
          uint64_t v15 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 10];
          id v16 = [v13 events];
          unsigned int v17 = [v16 filteredArrayUsingPredicate:v15];

          uint64_t v18 = [v12 events];
          float v33 = (void *)v15;
          double v19 = [v18 filteredArrayUsingPredicate:v15];

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v20 = v17;
          id v21 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v36;
            do
            {
              for (unint64_t i = 0; i != v22; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v36 != v23) {
                  objc_enumerationMutation(v20);
                }
                if ([v19 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * i)])
                {
                  [v12 setIsAggregatedAndSuppressed:1];
                  ++v10;
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
            }
            while (v22);
          }

          id v5 = v32;
        }
        uint64_t v25 = [v13 endDate];
        id v26 = [v12 endDate];
        unsigned int v27 = [v25 isOnOrAfter:v26];

        unsigned int v9 = v11 + (v27 ^ 1);
        v8 += v27;
        uint64_t v7 = v8;
        id v6 = v34;
      }
      while ((unint64_t)[v5 count] > v8);
    }
    else
    {
      int v10 = 0;
    }
    id v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v10;
      __int16 v29 = "DominantBundleCreation: duplicate contact bundle count: %d";
      id v30 = v28;
      uint32_t v31 = 8;
      goto LABEL_24;
    }
  }
  else
  {
    id v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v41 = [v5 count];
      __int16 v42 = 2048;
      id v43 = [v6 count];
      __int16 v29 = "DominantBundleCreation: no needed to remove duplicate contact bundle compared to contact trend bundles since"
            " contact or contact trend bundles count is 0, contact bundles count: %lu, contact trend bundles count: %lu";
      id v30 = v28;
      uint32_t v31 = 22;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v29, buf, v31);
    }
  }
}

- (void)_suppressDuplicateMediaBundles:(id)a3 comparedWithHomebundles:(id)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v31 = a5;
  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    if ([v7 count])
    {
      uint64_t v9 = 0;
      unsigned int v10 = 0;
      unsigned int v11 = 0;
      int v12 = 0;
      do
      {
        if ((unint64_t)[v8 count] <= v11) {
          break;
        }
        unsigned int v13 = [v7 objectAtIndexedSubscript:v9];
        double v14 = [v8 objectAtIndexedSubscript:v11];
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:v13 andOtherBundle:v14];
        double v16 = v15;
        id v17 = objc_alloc((Class)NSDateInterval);
        uint64_t v18 = [v13 startDate];
        double v19 = [v13 endDate];
        id v20 = [v17 initWithStartDate:v18 endDate:v19];
        [v20 duration];
        double v22 = v16 / v21;

        [v31 dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold];
        if (v22 > v23)
        {
          [v13 setIsAggregatedAndSuppressed:1];
          ++v12;
        }
        id v24 = [v13 endDate];
        uint64_t v25 = [v14 endDate];
        unsigned int v26 = [v24 isOnOrAfter:v25];

        v11 += v26;
        v10 += v26 ^ 1;
        uint64_t v9 = v10;
      }
      while ((unint64_t)[v7 count] > v10);
    }
    else
    {
      int v12 = 0;
    }
    unsigned int v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v12;
      id v28 = "DominantBundleCreation: duplicate media bundle compared with home bundles count: %d";
      __int16 v29 = v27;
      uint32_t v30 = 8;
      goto LABEL_15;
    }
  }
  else
  {
    unsigned int v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v33 = [v7 count];
      __int16 v34 = 2048;
      id v35 = [v8 count];
      id v28 = "DominantBundleCreation: no needed to remove duplicate media compared to home bundles since media or home bun"
            "dles count is 0, media bundles count: %lu, home bundles count: %lu";
      __int16 v29 = v27;
      uint32_t v30 = 22;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
    }
  }
}

- (void)_suppressDuplicateMediaBundles:(id)a3 comparedWithActivitybundles:(id)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v31 = a5;
  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    if ([v7 count])
    {
      uint64_t v9 = 0;
      unsigned int v10 = 0;
      unsigned int v11 = 0;
      int v12 = 0;
      do
      {
        if ((unint64_t)[v8 count] <= v11) {
          break;
        }
        unsigned int v13 = [v7 objectAtIndexedSubscript:v9];
        double v14 = [v8 objectAtIndexedSubscript:v11];
        +[MOSummarizationUtilities overlappingTimeIntervalBetween:v13 andOtherBundle:v14];
        double v16 = v15;
        id v17 = objc_alloc((Class)NSDateInterval);
        uint64_t v18 = [v13 startDate];
        double v19 = [v13 endDate];
        id v20 = [v17 initWithStartDate:v18 endDate:v19];
        [v20 duration];
        double v22 = v16 / v21;

        [v31 dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold];
        if (v22 > v23)
        {
          [v13 setIsAggregatedAndSuppressed:1];
          ++v12;
        }
        id v24 = [v13 endDate];
        uint64_t v25 = [v14 endDate];
        unsigned int v26 = [v24 isOnOrAfter:v25];

        v11 += v26;
        v10 += v26 ^ 1;
        uint64_t v9 = v10;
      }
      while ((unint64_t)[v7 count] > v10);
    }
    else
    {
      int v12 = 0;
    }
    unsigned int v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v12;
      id v28 = "DominantBundleCreation: duplicate media bundle compared with acitivity bundles count: %d";
      __int16 v29 = v27;
      uint32_t v30 = 8;
      goto LABEL_15;
    }
  }
  else
  {
    unsigned int v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v33 = [v7 count];
      __int16 v34 = 2048;
      id v35 = [v8 count];
      id v28 = "DominantBundleCreation: no needed to remove duplicate media compared to activity bundles since media or acti"
            "vity bundles count is 0, media bundles count: %lu, home bundles count: %lu";
      __int16 v29 = v27;
      uint32_t v30 = 22;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
    }
  }
}

- (BOOL)_locationCheckForMergingOutingBundle:(id)a3 activityBundle:(id)a4
{
  id v5 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [a3 events];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    char v10 = 1;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v13 = [v5 visitEventsRejectedByWatchLocation];
        double v14 = [v12 eventIdentifier];
        double v15 = [v14 UUIDString];
        unsigned int v16 = [v13 containsObject:v15];

        if (v16)
        {
          id v17 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)double v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "DominantBundleCreation: outing bundle contains visits rejected by activity bundle with watch location", v19, 2u);
          }

          char v10 = 0;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  return v10 & 1;
}

- (void)_suppressDuplicateHomeBundles:(id)a3 parameters:(id)a4
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    id v6 = [v4 firstObject];
    id v7 = [v6 startDate];
    id v8 = [v5 components:28 fromDate:v7];

    [v8 setHour:3];
    v74 = v8;
    uint64_t v9 = [v5 dateFromComponents:v8];
    char v10 = [v4 lastObject];
    unsigned int v11 = [v10 startDate];
    int v12 = [v5 components:28 fromDate:v11];

    [v12 setHour:3];
    v73 = v12;
    unsigned int v13 = [v5 dateFromComponents:v12];
    double v14 = objc_opt_new();
    [v14 addObject:v9];
    if (([v5 isDate:v9 inSameDayAsDate:v13] & 1) != 0
      || ![v9 isBeforeDate:v13])
    {
      double v15 = v9;
    }
    else
    {
      do
      {
        double v15 = [v9 dateByAddingTimeInterval:86400.0];

        [v14 addObject:v15];
        uint64_t v9 = v15;
      }
      while (([v15 isBeforeDate:v13] & 1) != 0);
    }
    unsigned int v72 = v15;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id obj = v14;
    id v82 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
    if (!v82)
    {
      int v89 = 0;
      int v86 = 0;
      goto LABEL_90;
    }
    int v89 = 0;
    int v86 = 0;
    uint64_t v81 = *(void *)v113;
    id v75 = v4;
    v77 = v13;
    v78 = v5;
    while (1)
    {
      for (unint64_t i = 0; i != v82; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v113 != v81) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v112 + 1) + 8 * i);
        v109[0] = _NSConcreteStackBlock;
        v109[1] = 3221225472;
        v109[2] = __76__MODominantBundleCreationManager__suppressDuplicateHomeBundles_parameters___block_invoke;
        v109[3] = &unk_1002C9B90;
        v110 = v5;
        uint64_t v111 = v17;
        uint64_t v83 = v17;
        uint64_t v18 = +[NSPredicate predicateWithBlock:v109];
        double v19 = [v4 filteredArrayUsingPredicate:v18];

        long long v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          id v69 = [v19 count];
          *(_DWORD *)buf = 134218242;
          *(void *)v121 = v69;
          *(_WORD *)&v121[8] = 2112;
          *(void *)&v121[10] = v83;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: home bundle count is %lu for %@", buf, 0x16u);
        }

        id v92 = objc_opt_new();
        SEL v91 = objc_opt_new();
        if ((unint64_t)[v19 count] >= 2)
        {
          id v79 = v19;
          id v80 = i;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          id v21 = v19;
          id v22 = [v21 countByEnumeratingWithState:&v105 objects:v119 count:16];
          if (v22)
          {
            id v23 = v22;
            int v24 = 0;
            int v25 = 0;
            uint64_t v26 = *(void *)v106;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v106 != v26) {
                  objc_enumerationMutation(v21);
                }
                id v28 = *(void **)(*((void *)&v105 + 1) + 8 * (void)j);
                __int16 v29 = [v28 action];
                [v29 actionSubtype];

                uint32_t v30 = [v28 action];
                id v31 = [v30 actionSubtype];

                if (v31 == (id)1) {
                  ++v25;
                }
                id v32 = [v28 action];
                id v33 = [v32 actionSubtype];

                if (v33 == (id)9) {
                  ++v24;
                }
                __int16 v34 = [v28 suggestionID];
                id v35 = [v34 UUIDString];
                [v92 addObject:v35];

                long long v36 = [v28 bundleIdentifier];
                long long v37 = [v36 UUIDString];
                [v91 addObject:v37];
              }
              id v23 = [v21 countByEnumeratingWithState:&v105 objects:v119 count:16];
            }
            while (v23);
          }
          else
          {
            int v24 = 0;
            int v25 = 0;
          }

          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          id v85 = v21;
          id v49 = [v85 countByEnumeratingWithState:&v101 objects:v118 count:16];
          if (!v49)
          {
            int v90 = 0;
            int v87 = 0;
            goto LABEL_77;
          }
          id v50 = v49;
          int v90 = 0;
          int v87 = 0;
          uint64_t v88 = *(void *)v102;
          if (v24) {
            BOOL v51 = 1;
          }
          else {
            BOOL v51 = v25 <= 0;
          }
          int v52 = !v51;
          int v84 = v52;
          while (1)
          {
            for (k = 0; k != v50; k = (char *)k + 1)
            {
              if (*(void *)v102 != v88) {
                objc_enumerationMutation(v85);
              }
              id v54 = *(void **)(*((void *)&v101 + 1) + 8 * (void)k);
              if (v24 < 1)
              {
                if (v84)
                {
                  uint64_t v57 = [*(id *)(*((void *)&v101 + 1) + 8 * (void)k) action];
                  id v58 = [v57 actionSubtype];

                  if (v58 != (id)1)
                  {
LABEL_58:
                    [v54 setIsAggregatedAndSuppressed:1];
                    ++v86;
                    ++v87;
                  }
                }
              }
              else
              {
                v55 = [*(id *)(*((void *)&v101 + 1) + 8 * (void)k) action];
                id v56 = [v55 actionSubtype];

                if (v56 != (id)9) {
                  goto LABEL_58;
                }
              }
              long long v99 = 0u;
              long long v100 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              v59 = [v54 resources];
              id v60 = [v59 countByEnumeratingWithState:&v97 objects:v117 count:16];
              if (!v60)
              {

LABEL_72:
                [v54 setIsAggregatedAndSuppressed:1];
                ++v89;
                ++v90;
                goto LABEL_73;
              }
              id v61 = v60;
              int v62 = 0;
              uint64_t v63 = *(void *)v98;
              do
              {
                for (m = 0; m != v61; m = (char *)m + 1)
                {
                  if (*(void *)v98 != v63) {
                    objc_enumerationMutation(v59);
                  }
                  unsigned int v65 = *(void **)(*((void *)&v97 + 1) + 8 * (void)m);
                  if ([v65 type] == (id)2 || objc_msgSend(v65, "type") == (id)3) {
                    ++v62;
                  }
                }
                id v61 = [v59 countByEnumeratingWithState:&v97 objects:v117 count:16];
              }
              while (v61);

              if (!v62) {
                goto LABEL_72;
              }
LABEL_73:
              [v54 setSubSuggestionIDs:v92];
              [v54 setSubBundleIDs:v91];
            }
            id v50 = [v85 countByEnumeratingWithState:&v101 objects:v118 count:16];
            if (!v50)
            {
LABEL_77:

              id v4 = v75;
              unsigned int v13 = v77;
              id v5 = v78;
              double v19 = v79;
              unint64_t i = v80;
              goto LABEL_80;
            }
          }
        }
        if ([v19 count] == (id)1)
        {
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v38 = v19;
          v39 = [v19 firstObject];
          v40 = [v39 resources];

          id v41 = [v40 countByEnumeratingWithState:&v93 objects:v116 count:16];
          if (v41)
          {
            id v42 = v41;
            id v43 = v4;
            v44 = i;
            int v45 = 0;
            uint64_t v46 = *(void *)v94;
            do
            {
              for (n = 0; n != v42; n = (char *)n + 1)
              {
                if (*(void *)v94 != v46) {
                  objc_enumerationMutation(v40);
                }
                id v48 = *(void **)(*((void *)&v93 + 1) + 8 * (void)n);
                if ([v48 type] == (id)2 || objc_msgSend(v48, "type") == (id)3) {
                  ++v45;
                }
              }
              id v42 = [v40 countByEnumeratingWithState:&v93 objects:v116 count:16];
            }
            while (v42);

            unint64_t i = v44;
            id v4 = v43;
            unsigned int v13 = v77;
            id v5 = v78;
            if (v45)
            {
              int v90 = 0;
              int v87 = 0;
              double v19 = v38;
              goto LABEL_80;
            }
          }
          else
          {
          }
          double v19 = v38;
          v66 = [v38 firstObject];
          int v90 = 1;
          [v66 setIsAggregatedAndSuppressed:1];

          int v87 = 0;
          ++v89;
        }
        else
        {
          int v90 = 0;
          int v87 = 0;
        }
LABEL_80:
        v67 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v121 = v87;
          *(_WORD *)&v121[4] = 2112;
          *(void *)&v121[6] = v83;
          _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: %d duplicate home bundles suppressed for %@", buf, 0x12u);
        }

        id v68 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v121 = v90;
          *(_WORD *)&v121[4] = 2112;
          *(void *)&v121[6] = v83;
          _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: %d home bundles without resources suppressed for %@", buf, 0x12u);
        }
      }
      id v82 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
      if (!v82)
      {
LABEL_90:

        uint64_t v70 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v121 = v86;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "DominantBundleCreation: %d total duplicate home bundles suppressed for period", buf, 8u);
        }

        v71 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v121 = v89;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "DominantBundleCreation: %d total home bundles without resources suppressed for period", buf, 8u);
        }

        goto LABEL_95;
      }
    }
  }
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v121 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "DominantBundleCreation: no need to remove duplicate home bundles since home bundle count is %lu", buf, 0xCu);
  }
LABEL_95:
}

id __76__MODominantBundleCreationManager__suppressDuplicateHomeBundles_parameters___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a2 startDate];
  id v5 = [v3 isDate:v4 inSameDayAsDate:*(void *)(a1 + 40)];

  return v5;
}

- (MODaemonUniverse)fUniverse
{
  return self->_fUniverse;
}

- (void).cxx_destruct
{
}

- (void)_dominantBundleCreatedFromOutingBundles:(void *)a1 activityBundles:(NSObject *)a2 parameters:.cold.1(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "DominantBundleCreation: Graph partitioning is performed. Number of bundles groups: %lu", (uint8_t *)&v3, 0xCu);
}

- (void)_dominantBundleCreatedFromOutingBundles:(os_log_t)log activityBundles:parameters:.cold.2(os_log_t log)
{
  int v1 = 136315394;
  v2 = "-[MODominantBundleCreationManager _dominantBundleCreatedFromOutingBundles:activityBundles:parameters:]";
  __int16 v3 = 1024;
  int v4 = 187;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DominantBundleCreation: the event bundles and membership arrays have to be of the same size. (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end