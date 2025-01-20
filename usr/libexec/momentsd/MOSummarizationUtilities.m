@interface MOSummarizationUtilities
+ (BOOL)allPhotoAssetsFromBundleStartDay:(id)a3;
+ (BOOL)bundleHasOneWayRoute:(id)a3 parameters:(id)a4;
+ (BOOL)hasWorkoutRoute:(id)a3;
+ (BOOL)isBundle:(id)a3 insideTheSameDayAsOtherBundle:(id)a4;
+ (BOOL)isBundleWithAssets:(id)a3;
+ (BOOL)isFlightBundle:(id)a3;
+ (BOOL)isOutingBundleFromHomeOrWorkVisit:(id)a3;
+ (BOOL)isOutingBundleInsideOneDay:(id)a3;
+ (BOOL)shouldIncludeVisitIntoActionsFromBundles:(id)a3 forDominantBundle:(id)a4 withParameters:(id)a5;
+ (double)maximumDistanceFromBundle:(id)a3 toBundleCluster:(id)a4;
+ (double)overlappingTimeIntervalBetween:(id)a3 andOtherBundle:(id)a4;
+ (double)workoutTimeIntervalBetweenBundle:(id)a3 andNextBundle:(id)a4;
+ (id)addResourcesFromOutingBundle:(id)a3 toActivityBundle:(id)a4;
+ (id)combineEmotionResources:(id)a3;
+ (id)combineMediaResources:(id)a3;
+ (id)combinePhotoResources:(id)a3;
+ (id)concatenatePlaceNameAndPlaceStart:(id)a3;
+ (id)createActivityMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 isWeeklySummary:(BOOL)a6 timeZoneManager:(id)a7;
+ (id)createDominantBundleFromBundles:(id)a3 withParameters:(id)a4 timeZoneManager:(id)a5;
+ (id)createMegaBundleFromBundles:(id)a3 parameters:(id)a4 timeZoneManager:(id)a5;
+ (id)createMotionActivityMegaBundleFromBundles:(id)a3 withSamePlace:(id)a4 withParameters:(id)a5;
+ (id)createOutingMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 timeZoneManager:(id)a6;
+ (id)createTransitMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 timeZoneManager:(id)a6 groupedOutingBundles:(id)a7;
+ (id)findDuplicatePhotoResourceFromBundle:(id)a3 comparedWithPrimaryBundle:(id)a4;
+ (id)getActionFromBundles:(id)a3 withMainActionSelectionThresholdBasedOnDuration:(float)a4;
+ (id)getActionsFromBundles:(id)a3 withDominantAction:(id)a4;
+ (id)getDominantBundleFromBundles:(id)a3;
+ (id)getInterestingDestination:(id)a3;
+ (id)getPlaceFromBundle:(id)a3;
+ (id)getPlaceFromPlacesSortedByDuration:(id)a3;
+ (id)getResourcesForOutingSummaryBundleWithWorkoutResources:(id)a3 photoResources:(id)a4 mediaResources:(id)a5 emotionResources:(id)a6 shouldUpLevelPhoto:(BOOL)a7;
+ (id)getResourcesForWeeklyWorkoutSummaryBundleWithWorkoutResources:(id)a3 photoResources:(id)a4 mediaResources:(id)a5;
+ (id)getResourcesFromBundles:(id)a3 forSummaryBundle:(id)a4 withParameters:(id)a5;
+ (id)getWorkoutActionsByActionSubtypeFromBundles:(id)a3;
+ (id)mergeOutingBundlesWithInDayWithGroupedBundles:(id)a3 remainingSingletonBundles:(id)a4 parameters:(id)a5 isCoarseGranularity:(BOOL)a6 timeZoneManager:(id)a7;
+ (id)metricForVisitsFromBundle:(id)a3 andNextBundle:(id)a4;
+ (id)sortedActivityEventsFromBundle:(id)a3;
+ (id)sortedBundleBasedOnGoodnessScore:(id)a3;
+ (id)sortedBundleByPhotoAssetsCount:(id)a3;
+ (id)sortedBundleByStartDate:(id)a3;
+ (id)sortedVisitEventsFromBundle:(id)a3;
+ (id)sortedWorkoutBundleByDuration:(id)a3;
+ (id)sortedWorkoutEventsFromBundle:(id)a3;
+ (id)summarizeMotionActivityBundlesWithSamePlaceName:(id)a3 withParameters:(id)a4;
+ (id)workoutMetaDataCreatedForBundles:(id)a3;
+ (void)removeDuplicatePhotoResourceFromBundle:(id)a3 comparedWithPrimaryBundle:(id)a4;
+ (void)removeUnnecessaryResourceFromWorkoutSummaryBundle:(id)a3;
+ (void)setActionsAndPlacesFromBundles:(id)a3 forDominantBundle:(id)a4 withParameters:(id)a5;
+ (void)setActionsAndPlacesFromBundles:(id)a3 forSummaryBundle:(id)a4;
+ (void)setMediaActionForWorkoutBundle:(id)a3 withMediaPlaySessionDominantFactorThreshold:(double)a4 mediaPlaySessionsOverlapsMinimumDistance:(double)a5;
+ (void)updateRankMetaDataFrom:(id)a3 forSummaryBundle:(id)a4;
@end

@implementation MOSummarizationUtilities

+ (double)overlappingTimeIntervalBetween:(id)a3 andOtherBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSDateInterval);
  v8 = [v6 startDate];
  v9 = [v6 endDate];

  id v10 = [v7 initWithStartDate:v8 endDate:v9];
  id v11 = objc_alloc((Class)NSDateInterval);
  v12 = [v5 startDate];
  v13 = [v5 endDate];

  id v14 = [v11 initWithStartDate:v12 endDate:v13];
  v15 = [v10 intersectionWithDateInterval:v14];
  [v15 duration];
  double v17 = v16;

  return v17;
}

+ (id)findDuplicatePhotoResourceFromBundle:(id)a3 comparedWithPrimaryBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 resources];
  if (![v7 count])
  {

    goto LABEL_25;
  }
  v8 = [v6 resources];
  id v9 = [v8 count];

  if (!v9)
  {
LABEL_25:
    id v10 = 0;
    goto LABEL_26;
  }
  id v10 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v5;
  id obj = [v5 resources];
  id v29 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v36;
    id v28 = v6;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v11;
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v13 = [v6 resources];
        id v14 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v12 type] == (id)2 && objc_msgSend(v18, "type") == (id)2)
              {
                v19 = [v12 assets];
                v20 = [v18 assets];
                unsigned int v21 = [v19 isEqualToString:v20];

                if (v21)
                {
                  v22 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    v23 = [v12 assets];
                    *(_DWORD *)buf = 138412290;
                    v40 = v23;
                    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "duplicate photo id, %@", buf, 0xCu);
                  }
                  [v10 addObject:v12];
                }
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v30 + 1;
        id v6 = v28;
      }
      while ((id)(v30 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v29);
  }

  id v5 = v25;
LABEL_26:

  return v10;
}

+ (void)removeDuplicatePhotoResourceFromBundle:(id)a3 comparedWithPrimaryBundle:(id)a4
{
  id v6 = a3;
  id v7 = [a1 findDuplicatePhotoResourceFromBundle:v6 comparedWithPrimaryBundle:a4];
  if ([v7 count])
  {
    v8 = [v6 resources];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __93__MOSummarizationUtilities_removeDuplicatePhotoResourceFromBundle_comparedWithPrimaryBundle___block_invoke;
    v11[3] = &unk_1002CD758;
    id v12 = v7;
    id v9 = +[NSPredicate predicateWithBlock:v11];
    id v10 = [v8 filteredArrayUsingPredicate:v9];

    [v6 setResources:v10];
  }
}

uint64_t __93__MOSummarizationUtilities_removeDuplicatePhotoResourceFromBundle_comparedWithPrimaryBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3] ^ 1;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v3 assets];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "photo id, %@, should keep, %d", (uint8_t *)&v8, 0x12u);
  }
  return v4;
}

+ (id)getResourcesFromBundles:(id)a3 forSummaryBundle:(id)a4 withParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v80 = a5;
  if (![v9 count])
  {
    v57 = 0;
    goto LABEL_60;
  }
  id v73 = a1;
  v71 = objc_opt_new();
  v78 = objc_opt_new();
  v76 = objc_opt_new();
  v75 = objc_opt_new();
  int v11 = objc_opt_new();
  v77 = objc_opt_new();
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v72 = v9;
  id obj = v9;
  id v82 = [obj countByEnumeratingWithState:&v98 objects:v104 count:16];
  if (!v82) {
    goto LABEL_32;
  }
  uint64_t v81 = *(void *)v99;
  id v12 = NSAssertionHandler_ptr;
  v83 = v11;
  v84 = v10;
  do
  {
    v13 = 0;
    do
    {
      if (*(void *)v99 != v81) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v13);
      uint64_t v15 = [v12[37] predicateWithFormat:@"type == %lu", 10];
      uint64_t v16 = [v14 resources];
      v88 = (void *)v15;
      double v17 = [v16 filteredArrayUsingPredicate:v15];

      if ([v17 count]) {
        [v78 setObject:v17 forKey:v14];
      }
      v87 = v17;
      uint64_t v18 = [v12[37] predicateWithFormat:@"type == %lu", 2];
      v19 = [v14 resources];
      v86 = (void *)v18;
      v20 = [v19 filteredArrayUsingPredicate:v18];

      if ([v20 count]) {
        [v76 setObject:v20 forKey:v14];
      }
      v85 = v20;
      unsigned int v21 = [v12[37] predicateWithFormat:@"type == %lu", 3];
      v22 = [v14 resources];
      v23 = [v22 filteredArrayUsingPredicate:v21];

      if ([v23 count]) {
        [v75 setObject:v23 forKey:v14];
      }
      v24 = [v12[37] predicateWithFormat:@"type == %lu", 6];
      id v25 = [v14 resources];
      v26 = [v25 filteredArrayUsingPredicate:v24];

      if ([v26 count])
      {
        id v27 = [v26 copy];
        [v77 addObjectsFromArray:v27];
      }
      id v28 = [v10 bundleSuperType];
      if (v28 == (id)1)
      {
        id v29 = [v10 metaDataForRank];
        id v5 = [v29 objectForKeyedSubscript:@"VisitDuration"];
        [v5 floatValue];
        float v31 = v30;
        [v80 emotionAttachmentBundleDurationThreshold];
        if (v31 < v32)
        {

          long long v33 = v5;
LABEL_26:
          v42 = v21;
          uint64_t v43 = +[NSPredicate predicateWithFormat:@"type == %lu", 16];
          v44 = [v14 resources];
          v89 = (void *)v43;
          v45 = [v44 filteredArrayUsingPredicate:v43];

          if ([v45 count]) {
            [v83 setObject:v45 forKey:v14];
          }
          unsigned int v21 = v42;
          id v5 = v45;
LABEL_29:

          v89 = v29;
          id v5 = v33;
          goto LABEL_30;
        }
        id v34 = [v10 bundleSuperType];
        v89 = v29;
        long long v33 = v5;
        if (v34 != (id)2) {
          goto LABEL_29;
        }
      }
      else if ([v10 bundleSuperType] != (id)2)
      {
        goto LABEL_30;
      }
      v79 = v21;
      long long v35 = [v84 metaDataForRank];
      long long v36 = [v35 objectForKeyedSubscript:@"WorkoutDuration"];
      [v36 floatValue];
      float v38 = v37;
      [v80 emotionAttachmentBundleDurationThreshold];
      float v40 = v39;

      if (v28 == (id)1)
      {

        id v29 = v89;
        BOOL v41 = v38 < v40;
      }
      else
      {
        BOOL v41 = v38 < v40;
        id v29 = v89;
      }
      long long v33 = v5;
      unsigned int v21 = v79;
      if (v41) {
        goto LABEL_26;
      }
LABEL_30:

      v13 = (char *)v13 + 1;
      int v11 = v83;
      id v10 = v84;
      id v12 = NSAssertionHandler_ptr;
    }
    while (v82 != v13);
    id v82 = [obj countByEnumeratingWithState:&v98 objects:v104 count:16];
  }
  while (v82);
LABEL_32:

  if ([v10 bundleSubType] == (id)202)
  {
    v46 = objc_opt_new();
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    v47 = [v10 places];
    id v48 = [v47 countByEnumeratingWithState:&v94 objects:v103 count:16];
    v49 = v75;
    if (v48)
    {
      id v50 = v48;
      uint64_t v51 = *(void *)v95;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v95 != v51) {
            objc_enumerationMutation(v47);
          }
          id v53 = [*(id *)(*((void *)&v94 + 1) + 8 * i) copy];
          [v53 setPriorityScore:20000.0];
          [v46 addObject:v53];
        }
        id v50 = [v47 countByEnumeratingWithState:&v94 objects:v103 count:16];
      }
      while (v50);
    }

    [v10 setPlaces:v46];
    v54 = v78;
    v55 = v76;
    v56 = [v73 getResourcesForWeeklyWorkoutSummaryBundleWithWorkoutResources:v78 photoResources:v76 mediaResources:v75];
    v57 = v71;
    id v9 = v72;
    goto LABEL_59;
  }
  if ([v78 count] == (id)1) {
    unsigned __int8 v58 = [v73 hasWorkoutRoute:v10];
  }
  else {
    unsigned __int8 v58 = 0;
  }
  v46 = objc_opt_new();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v59 = [v10 places];
  id v60 = [v59 countByEnumeratingWithState:&v90 objects:v102 count:16];
  if (v60)
  {
    id v61 = v60;
    uint64_t v62 = *(void *)v91;
    do
    {
      for (j = 0; j != v61; j = (char *)j + 1)
      {
        if (*(void *)v91 != v62) {
          objc_enumerationMutation(v59);
        }
        id v64 = [*(id *)(*((void *)&v90 + 1) + 8 * (void)j) copy];
        v65 = v64;
        double v66 = 20000.0;
        if ((v58 & 1) == 0)
        {
          [v64 priorityScore:20000.0];
          if (v67 == 20000.0) {
            goto LABEL_54;
          }
          double v66 = 200.0;
        }
        [v65 setPriorityScore:v66];
LABEL_54:
        [v46 addObject:v65];
      }
      id v61 = [v59 countByEnumeratingWithState:&v90 objects:v102 count:16];
    }
    while (v61);
  }

  [v10 setPlaces:v46];
  v57 = v71;
  if ((v58 & 1) == 0) {
    [v71 addObjectsFromArray:v77];
  }
  v54 = v78;
  v68 = [v78 allKeys];
  BOOL v69 = [v68 count] == 0;

  v49 = v75;
  v55 = v76;
  v56 = [v73 getResourcesForOutingSummaryBundleWithWorkoutResources:v78 photoResources:v76 mediaResources:v75 emotionResources:v11 shouldUpLevelPhoto:v69];
  id v9 = v72;
LABEL_59:
  [v57 addObjectsFromArray:v56];

LABEL_60:

  return v57;
}

+ (id)getResourcesForWeeklyWorkoutSummaryBundleWithWorkoutResources:(id)a3 photoResources:(id)a4 mediaResources:(id)a5
{
  id v7 = a3;
  id v25 = a4;
  id v24 = a5;
  int v8 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v26 = v7;
  id obj = [v7 allValues];
  id v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v37;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v9;
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v31 = v10;
        id v11 = [v31 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v33;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v31);
              }
              uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              double v17 = [MOResource alloc];
              uint64_t v18 = [v15 name];
              id v19 = [v15 type];
              v20 = [v15 getDictionary];
              [v15 value];
              unsigned int v21 = -[MOResource initWithName:type:dict:value:](v17, "initWithName:type:dict:value:", v18, v19, v20);

              v22 = [v15 sourceEventIdentifier];
              [(MOResource *)v21 setSourceEventIdentifier:v22];

              -[MOResource setSourceEventAccessType:](v21, "setSourceEventAccessType:", [v15 sourceEventAccessType]);
              [(MOResource *)v21 setPriorityScore:100.0];
              [v8 addObject:v21];
            }
            id v12 = [v31 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v30 + 1;
      }
      while ((id)(v30 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v29);
  }

  return v8;
}

+ (id)getResourcesForOutingSummaryBundleWithWorkoutResources:(id)a3 photoResources:(id)a4 mediaResources:(id)a5 emotionResources:(id)a6 shouldUpLevelPhoto:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v48 = (id)objc_opt_new();
  uint64_t v16 = [v12 allValues];
  id v17 = [v16 count];

  if (v17)
  {
    BOOL v38 = v7;
    id v39 = a1;
    id v40 = v15;
    id v41 = v14;
    id v42 = v13;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v43 = v12;
    id obj = [v12 allValues];
    id v46 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v46)
    {
      uint64_t v45 = *(void *)v54;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v54 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v47 = v18;
          id v19 = *(void **)(*((void *)&v53 + 1) + 8 * v18);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v50;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v50 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                id v27 = [MOResource alloc];
                uint64_t v28 = [v25 name];
                id v29 = [v25 type];
                uint64_t v30 = [v25 getDictionary];
                [v25 value];
                id v31 = -[MOResource initWithName:type:dict:value:](v27, "initWithName:type:dict:value:", v28, v29, v30);

                long long v32 = [v25 sourceEventIdentifier];
                [(MOResource *)v31 setSourceEventIdentifier:v32];

                -[MOResource setSourceEventAccessType:](v31, "setSourceEventAccessType:", [v25 sourceEventAccessType]);
                [(MOResource *)v31 setPriorityScore:100.0];
                [v48 addObject:v31];
              }
              id v22 = [v20 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v22);
          }

          uint64_t v18 = v47 + 1;
        }
        while ((id)(v47 + 1) != v46);
        id v46 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v46);
    }

    id v13 = v42;
    id v12 = v43;
    id v15 = v40;
    id v14 = v41;
    a1 = v39;
    BOOL v7 = v38;
  }
  long long v33 = [a1 combinePhotoResources:v13];
  if ([v33 count])
  {
    if (v7)
    {
      long long v34 = [v33 firstObject];
      [v34 setPriorityScore:100.0];
    }
    [v48 addObjectsFromArray:v33];
  }
  long long v35 = [a1 combineMediaResources:v14];
  if ([v35 count]) {
    [v48 addObjectsFromArray:v35];
  }
  long long v36 = [a1 combineEmotionResources:v15];
  if ([v36 count]) {
    [v48 addObjectsFromArray:v36];
  }

  return v48;
}

+ (id)combineEmotionResources:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = [v3 allKeys];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
    uint64_t v9 = [v3 allKeys];
    long long v32 = v8;
    id v40 = v8;
    id v10 = +[NSArray arrayWithObjects:&v40 count:1];
    id v11 = [v9 sortedArrayUsingDescriptors:v10];

    if ([v11 count])
    {
      unint64_t v12 = 0;
      double v13 = 401.0;
      long long v33 = v11;
      id v34 = v3;
      do
      {
        id v14 = [v11 objectAtIndexedSubscript:v12];
        id v15 = [v3 objectForKey:v14];
        id v16 = [v15 count];

        if (v16)
        {
          id v17 = [v11 objectAtIndexedSubscript:v12];
          uint64_t v18 = [v3 objectForKey:v17];

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v19 = v18;
          id v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v36;
            do
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v36 != v22) {
                  objc_enumerationMutation(v19);
                }
                id v24 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v23);
                id v25 = [v24 assets];
                unsigned __int8 v26 = [v4 containsObject:v25];

                if ((v26 & 1) == 0)
                {
                  if (!v12
                    && ([v19 firstObject],
                        id v27 = objc_claimAutoreleasedReturnValue(),
                        v27,
                        v24 == v27))
                  {
                    double v28 = 203.0;
                  }
                  else
                  {
                    double v28 = v13;
                    double v13 = v13 + 1.0;
                  }
                  [v24 setPriorityScore:v28];
                  [v5 addObject:v24];
                  id v29 = [v24 assets];
                  [v4 addObject:v29];
                }
                uint64_t v23 = (char *)v23 + 1;
              }
              while (v21 != v23);
              id v30 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
              id v21 = v30;
            }
            while (v30);
          }

          id v11 = v33;
          id v3 = v34;
        }
        ++v12;
      }
      while ((unint64_t)[v11 count] > v12);
    }
  }

  return v5;
}

+ (id)combinePhotoResources:(id)a3
{
  id v4 = a3;
  id v91 = (id)objc_opt_new();
  id v5 = [v4 allKeys];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [v4 allKeys];
    id v8 = [a1 sortedBundleByPhotoAssetsCount:v7];

    uint64_t v9 = objc_opt_new();
    id v10 = [v8 firstObject];
    id v11 = [v4 objectForKey:v10];

    id v84 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"photoCurationScore" ascending:0];
    id v97 = v84;
    unint64_t v12 = +[NSArray arrayWithObjects:&v97 count:1];
    v85 = v11;
    double v13 = [v11 sortedArrayUsingDescriptors:v12];

    v83 = v13;
    id v14 = [v13 firstObject];
    id v15 = [MOResource alloc];
    id v16 = [v14 name];
    id v17 = [v14 type];
    uint64_t v18 = [v14 getDictionary];
    [v14 value];
    id v19 = -[MOResource initWithName:type:dict:value:](v15, "initWithName:type:dict:value:", v16, v17, v18);

    id v20 = [v14 sourceEventIdentifier];
    [(MOResource *)v19 setSourceEventIdentifier:v20];

    -[MOResource setSourceEventAccessType:](v19, "setSourceEventAccessType:", [v14 sourceEventAccessType]);
    [(MOResource *)v19 setPriorityScore:201.0];
    id v21 = [v14 photoCurationScore];
    [(MOResource *)v19 setPhotoCurationScore:v21];

    -[MOResource setPhotoFaceCount:](v19, "setPhotoFaceCount:", [v14 photoFaceCount]);
    [v14 photoOverallAestheticScore];
    -[MOResource setPhotoOverallAestheticScore:](v19, "setPhotoOverallAestheticScore:");
    -[MOResource setPhotoAssetMediaType:](v19, "setPhotoAssetMediaType:", [v14 photoAssetMediaType]);
    id v82 = v14;
    uint64_t v22 = [v14 assets];
    [(MOResource *)v19 setAssets:v22];

    uint64_t v23 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    id v24 = v4;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      +[MOSummarizationUtilities combinePhotoResources:](v19);
    }

    [v91 addObject:v19];
    uint64_t v81 = v19;
    id v25 = [(MOResource *)v19 assets];
    long long v92 = v9;
    [v9 addObject:v25];

    long long v90 = v8;
    if ((unint64_t)[v8 count] >= 2)
    {
      unint64_t v26 = 301;
      do
      {
        id v27 = [v8 objectAtIndexedSubscript:v26 - 300];
        [v24 objectForKey:v27];
        v29 = double v28 = v8;
        id v30 = [v29 count];

        if (v30)
        {
          long long v32 = [v28 objectAtIndexedSubscript:v26 - 300];
          uint64_t v33 = [v24 objectForKey:v32];
          id v34 = [(id)v33 firstObject];

          long long v35 = [v34 assets];
          LOBYTE(v33) = [v92 containsObject:v35];

          if ((v33 & 1) == 0)
          {
            long long v36 = [MOResource alloc];
            long long v37 = [v34 name];
            id v38 = [v34 type];
            id v39 = [v34 getDictionary];
            [v34 value];
            id v40 = -[MOResource initWithName:type:dict:value:](v36, "initWithName:type:dict:value:", v37, v38, v39);

            id v41 = [v34 sourceEventIdentifier];
            [(MOResource *)v40 setSourceEventIdentifier:v41];

            -[MOResource setSourceEventAccessType:](v40, "setSourceEventAccessType:", [v34 sourceEventAccessType]);
            id v42 = [v34 photoCurationScore];
            [(MOResource *)v40 setPhotoCurationScore:v42];

            -[MOResource setPhotoFaceCount:](v40, "setPhotoFaceCount:", [v34 photoFaceCount]);
            [v34 photoOverallAestheticScore];
            -[MOResource setPhotoOverallAestheticScore:](v40, "setPhotoOverallAestheticScore:");
            -[MOResource setPhotoAssetMediaType:](v40, "setPhotoAssetMediaType:", [v34 photoAssetMediaType]);
            id v43 = [v34 assets];
            [(MOResource *)v40 setAssets:v43];

            [(MOResource *)v40 setPriorityScore:(double)v26];
            v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              id v48 = [(MOResource *)v40 assets];
              [(MOResource *)v40 priorityScore];
              *(_DWORD *)buf = 138412546;
              long long v94 = v48;
              __int16 v95 = 2048;
              uint64_t v96 = v49;
              _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "auxiliary photo asset, %@, priority score, %f", buf, 0x16u);
            }
            [v91 addObject:v40];
            uint64_t v45 = [(MOResource *)v40 assets];
            [v92 addObject:v45];
          }
          double v28 = v90;
        }
        id v46 = [v28 count];
        unint64_t v47 = v26 - 299;
        ++v26;
        id v8 = v28;
      }
      while ((unint64_t)v46 > v47);
    }
    int v50 = [v91 count];
    long long v51 = v92;
    if (v50 < 11)
    {
      long long v52 = [v24 allValues];
      signed int v87 = [v52 count];

      if ([v8 count])
      {
        unint64_t v53 = 0;
        int v86 = 11 - v50;
        v88 = v24;
        do
        {
          long long v54 = [v8 objectAtIndexedSubscript:v53];
          long long v55 = [v24 objectForKey:v54];

          if ([v55 count])
          {
            int v56 = (int)[v55 count] / v87 * v86;
            if (v56 >= 1)
            {
              uint64_t v57 = (v56 + 1);
              unint64_t v58 = 1;
              do
              {
                if ((unint64_t)[v55 count] > v58)
                {
                  id v60 = [v55 objectAtIndexedSubscript:v58];
                  id v61 = [v60 assets];
                  unsigned __int8 v62 = [v51 containsObject:v61];

                  if ((v62 & 1) == 0)
                  {
                    v63 = [MOResource alloc];
                    id v64 = [v60 name];
                    id v65 = [v60 type];
                    double v66 = [v60 getDictionary];
                    [v60 value];
                    double v67 = -[MOResource initWithName:type:dict:value:](v63, "initWithName:type:dict:value:", v64, v65, v66);

                    v68 = [v60 sourceEventIdentifier];
                    [(MOResource *)v67 setSourceEventIdentifier:v68];

                    -[MOResource setSourceEventAccessType:](v67, "setSourceEventAccessType:", [v60 sourceEventAccessType]);
                    BOOL v69 = [v60 photoCurationScore];
                    [(MOResource *)v67 setPhotoCurationScore:v69];

                    -[MOResource setPhotoFaceCount:](v67, "setPhotoFaceCount:", [v60 photoFaceCount]);
                    [v60 photoOverallAestheticScore];
                    -[MOResource setPhotoOverallAestheticScore:](v67, "setPhotoOverallAestheticScore:");
                    -[MOResource setPhotoAssetMediaType:](v67, "setPhotoAssetMediaType:", [v60 photoAssetMediaType]);
                    v70 = [v60 assets];
                    [(MOResource *)v67 setAssets:v70];

                    v71 = [v91 lastObject];
                    [v71 priorityScore];
                    double v73 = v72;

                    if (v73 >= 300.0)
                    {
                      v74 = [v91 lastObject];
                      [v74 priorityScore];
                      [(MOResource *)v67 setPriorityScore:v75 + 1.0];
                    }
                    else
                    {
                      [(MOResource *)v67 setPriorityScore:300.0];
                    }
                    v76 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                    {
                      v78 = [(MOResource *)v67 assets];
                      [(MOResource *)v67 priorityScore];
                      *(_DWORD *)buf = 138412546;
                      long long v94 = v78;
                      __int16 v95 = 2048;
                      uint64_t v96 = v79;
                      _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "remaining photo asset, %@, priority score, %f", buf, 0x16u);
                    }
                    [v91 addObject:v67];
                    v77 = [(MOResource *)v67 assets];
                    long long v51 = v92;
                    [v92 addObject:v77];
                  }
                }
                ++v58;
              }
              while (v57 != v58);
            }
          }

          ++v53;
          id v8 = v90;
          id v24 = v88;
        }
        while ((unint64_t)[v90 count] > v53);
      }
    }

    id v4 = v24;
  }

  return v91;
}

+ (id)combineMediaResources:(id)a3
{
  id v3 = a3;
  id v87 = (id)objc_opt_new();
  id v4 = [v3 allKeys];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    long long v90 = objc_opt_new();
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v8 = [v3 allKeys];
    id v9 = [v8 countByEnumeratingWithState:&v91 objects:v99 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v92;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v92 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          id v14 = [v13 action];
          id v15 = [v14 actionType];

          if (v15 == (id)4) {
            id v16 = v6;
          }
          else {
            id v16 = v7;
          }
          [v16 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v91 objects:v99 count:16];
      }
      while (v10);
    }

    id v17 = v87;
    id v82 = v6;
    id v83 = v3;
    uint64_t v18 = v90;
    if ([v6 count])
    {
      id v19 = [v6 sortBundlesByTimespan];
      if ([v19 count])
      {
        unint64_t v21 = 0;
        *(void *)&long long v20 = 138412546;
        long long v78 = v20;
        id v80 = v19;
        int v86 = v7;
        do
        {
          uint64_t v22 = [v19 objectAtIndexedSubscript:v21];
          uint64_t v23 = [v3 objectForKey:v22];
          id v24 = [v23 count];

          if (v24)
          {
            unint64_t v88 = v21;
            id v25 = [v19 objectAtIndexedSubscript:v21];
            unint64_t v26 = [v3 objectForKey:v25];

            if ([v26 count])
            {
              uint64_t v27 = 0;
              double v28 = (double)(v21 + 310);
              while (1)
              {
                id v30 = [v26 objectAtIndexedSubscript:v27];
                id v31 = [v30 name];
                if ([v18 containsObject:v31]) {
                  goto LABEL_31;
                }
                id v32 = [v17 count];

                if ((unint64_t)v32 <= 0xB) {
                  break;
                }
LABEL_32:

                if ((unint64_t)[v26 count] <= ++v27) {
                  goto LABEL_33;
                }
              }
              uint64_t v33 = [MOResource alloc];
              id v34 = [v30 name];
              id v35 = [v30 type];
              long long v36 = [v30 getDictionary];
              [v30 value];
              id v31 = -[MOResource initWithName:type:dict:value:](v33, "initWithName:type:dict:value:", v34, v35, v36);

              long long v37 = [v30 sourceEventIdentifier];
              [(MOResource *)v31 setSourceEventIdentifier:v37];

              -[MOResource setSourceEventAccessType:](v31, "setSourceEventAccessType:", [v30 sourceEventAccessType]);
              if (v88 | v27)
              {
                uint64_t v18 = v90;
                if (v88 || v27 != 1)
                {
                  id v17 = v87;
                  id v38 = [v87 lastObject:v78];
                  [v38 priorityScore];
                  double v40 = v39;

                  if (v40 >= 300.0)
                  {
                    id v41 = [v87 lastObject];
                    [v41 priorityScore];
                    [(MOResource *)v31 setPriorityScore:v42 + 1.0];
                  }
                  else
                  {
                    [(MOResource *)v31 setPriorityScore:310.0];
                  }
                }
                else
                {
                  [(MOResource *)v31 setPriorityScore:v28];
                  id v17 = v87;
                }
              }
              else
              {
                [(MOResource *)v31 setPriorityScore:202.0];
                id v17 = v87;
                uint64_t v18 = v90;
              }
              id v7 = v86;
              id v43 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v45 = [(MOResource *)v31 name];
                [(MOResource *)v31 priorityScore];
                *(_DWORD *)buf = v78;
                uint64_t v96 = v45;
                __int16 v97 = 2048;
                uint64_t v98 = v46;
                _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "media asset from workout name, %@, priority score, %f", buf, 0x16u);
              }
              [v17 addObject:v31];
              v44 = [(MOResource *)v31 name];
              [v18 addObject:v44];

LABEL_31:
              goto LABEL_32;
            }
LABEL_33:

            id v6 = v82;
            id v3 = v83;
            id v19 = v80;
            unint64_t v21 = v88;
          }
          ++v21;
        }
        while ((unint64_t)[v19 count] > v21);
      }
    }
    if ((int)objc_msgSend(v17, "count", v78) <= 10 && objc_msgSend(v7, "count"))
    {
      unint64_t v47 = [v7 sortBundlesByTimespan];
      if ([v47 count])
      {
        unint64_t v49 = 0;
        *(void *)&long long v48 = 138412546;
        long long v79 = v48;
        uint64_t v81 = v47;
        do
        {
          int v50 = [v47 objectAtIndexedSubscript:v49];
          long long v51 = [v3 objectForKey:v50];
          id v52 = [v51 count];

          if (v52)
          {
            unint64_t v89 = v49;
            unint64_t v53 = [v47 objectAtIndexedSubscript:v49];
            long long v54 = [v3 objectForKey:v53];

            if ([v54 count])
            {
              uint64_t v55 = 0;
              double v56 = (double)(v49 + 310);
              while (1)
              {
                unint64_t v58 = [v54 objectAtIndexedSubscript:v55];
                v59 = [v58 name];
                if ([v18 containsObject:v59]) {
                  goto LABEL_56;
                }
                id v60 = [v17 count];

                if ((unint64_t)v60 <= 0xA) {
                  break;
                }
LABEL_57:

                if ((unint64_t)[v54 count] <= ++v55) {
                  goto LABEL_58;
                }
              }
              id v61 = [MOResource alloc];
              unsigned __int8 v62 = [v58 name];
              id v63 = [v58 type];
              id v64 = [v58 getDictionary];
              [v58 value];
              v59 = -[MOResource initWithName:type:dict:value:](v61, "initWithName:type:dict:value:", v62, v63, v64);

              id v65 = [v58 sourceEventIdentifier];
              [(MOResource *)v59 setSourceEventIdentifier:v65];

              -[MOResource setSourceEventAccessType:](v59, "setSourceEventAccessType:", [v58 sourceEventAccessType]);
              if ([v17 count])
              {
                double v66 = [v17 lastObject];
                [v66 priorityScore];
                double v68 = v67;

                if (v68 < 300.0)
                {
                  BOOL v69 = v59;
                  double v70 = 310.0;
                  goto LABEL_52;
                }
                v71 = [v17 lastObject];
                [v71 priorityScore];
                [(MOResource *)v59 setPriorityScore:v72 + 1.0];
              }
              else
              {
                BOOL v69 = v59;
                if (v89 | v55) {
                  double v70 = v56;
                }
                else {
                  double v70 = 202.0;
                }
LABEL_52:
                -[MOResource setPriorityScore:](v69, "setPriorityScore:", v70, v79);
              }
              uint64_t v18 = v90;
              double v73 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
              {
                double v75 = [(MOResource *)v59 name];
                [(MOResource *)v59 priorityScore];
                *(_DWORD *)buf = v79;
                uint64_t v96 = v75;
                __int16 v97 = 2048;
                uint64_t v98 = v76;
                _os_log_debug_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "media asset from outing name, %@, priority score, %f", buf, 0x16u);
              }
              [v17 addObject:v59];
              v74 = [(MOResource *)v59 name];
              [v90 addObject:v74];

LABEL_56:
              goto LABEL_57;
            }
LABEL_58:

            id v6 = v82;
            id v3 = v83;
            unint64_t v47 = v81;
            unint64_t v49 = v89;
          }
          ++v49;
        }
        while ((unint64_t)[v47 count] > v49);
      }
    }
  }

  return v87;
}

+ (void)removeUnnecessaryResourceFromWorkoutSummaryBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 resources];
  id v5 = +[NSPredicate predicateWithBlock:&__block_literal_global_20];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  [v3 setResources:v6];
}

BOOL __78__MOSummarizationUtilities_removeUnnecessaryResourceFromWorkoutSummaryBundle___block_invoke(id a1, MOResource *a2, NSDictionary *a3)
{
  id v3 = a2;
  BOOL v4 = (id)[(MOResource *)v3 type] == (id)10
    || (id)[(MOResource *)v3 type] == (id)2
    || (id)[(MOResource *)v3 type] == (id)3;

  return v4;
}

+ (id)createMegaBundleFromBundles:(id)a3 parameters:(id)a4 timeZoneManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ((unint64_t)[v7 count] >= 2)
  {
    id v10 = [MOEventBundle alloc];
    uint64_t v11 = +[NSUUID UUID];
    unint64_t v12 = +[NSDate date];
    id v9 = [(MOEventBundle *)v10 initWithBundleIdentifier:v11 creationDate:v12];

    double v13 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v14 = v7;
    id v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v32 + 1) + 8 * i) events:v32];
          [v13 addObjectsFromArray:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v16);
    }

    long long v20 = [v13 allObjects];
    [(MOEventBundle *)v9 setEvents:v20];

    [(MOEventBundle *)v9 setPropertiesBasedOnEvents];
    unint64_t v21 = [v14 getTimeSpanOfMOEventBundleArray];
    uint64_t v22 = [v21 startDate];
    [(MOEventBundle *)v9 setStartDate:v22];

    uint64_t v23 = [v21 endDate];
    [(MOEventBundle *)v9 setEndDate:v23];

    [a1 updateRankMetaDataFrom:v14 forSummaryBundle:v9];
    id v24 = [(MOEventBundle *)v9 events];
    id v25 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
    long long v36 = v25;
    unint64_t v26 = +[NSArray arrayWithObjects:&v36 count:1];
    uint64_t v27 = [v24 sortedArrayUsingDescriptors:v26];

    double v28 = [v27 lastObject];
    id v29 = [v28 endDate];
    id v30 = +[MOTime timeForDate:v29 timeZoneManager:v8];
    [(MOEventBundle *)v9 setTime:v30];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)updateRankMetaDataFrom:(id)a3 forSummaryBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v261 = 0u;
  long long v262 = 0u;
  long long v263 = 0u;
  long long v264 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v261 objects:v270 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v262;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v262 != v10) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v261 + 1) + 8 * i) interfaceType] == (id)2) {
          ++v9;
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v261 objects:v270 count:16];
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
  }
  v240 = objc_opt_new();
  v239 = objc_opt_new();
  v238 = objc_opt_new();
  v237 = objc_opt_new();
  long long v257 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  long long v260 = 0u;
  id v12 = v5;
  id v252 = [v12 countByEnumeratingWithState:&v257 objects:v269 count:16];
  if (v252)
  {
    BOOL v226 = 0;
    uint64_t v251 = *(void *)v258;
    double v13 = 0.0;
    float v225 = 0.0;
    float v14 = 0.0;
    float v227 = 0.0;
    float v228 = 0.0;
    float v247 = 0.0;
    float v242 = 0.0;
    float v243 = 0.0;
    float v15 = 0.0;
    double v224 = 0.0;
    float v231 = 0.0;
    float v232 = 0.0;
    float v233 = 0.0;
    float v235 = 0.0;
    float v236 = 0.0;
    float v234 = 0.0;
    float v16 = 0.0;
    float v250 = 0.0;
    float v249 = 0.0;
    float v241 = 0.0;
    float v248 = 0.0;
    float v230 = 0.0;
    float v229 = 0.0;
    id v246 = v12;
    do
    {
      for (j = 0; j != v252; j = (char *)j + 1)
      {
        if (*(void *)v258 != v251) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v257 + 1) + 8 * (void)j);
        id v19 = [v18 endDate];
        long long v20 = [v18 startDate];
        [v19 timeIntervalSinceDate:v20];
        double v22 = v21;

        if ([v18 interfaceType] == (id)1)
        {
          uint64_t v23 = [v18 metaDataForRank];
          id v24 = [v23 objectForKeyedSubscript:@"DistanceToHome"];
          [v24 floatValue];
          float v26 = v25;

          if (v26 >= 0.0)
          {
            unint64_t v47 = [v18 metaDataForRank];
            long long v48 = [v47 objectForKeyedSubscript:@"DistanceToHome"];
            [v48 floatValue];

            double v28 = [v18 metaDataForRank];
            unint64_t v49 = [v28 objectForKeyedSubscript:@"DistanceToHome"];
            [v49 floatValue];
            float v51 = v247 + v50 * v22;
            float v247 = v51;
          }
          else
          {
            uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v266 = "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]";
              __int16 v267 = 1024;
              int v268 = 530;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Workout in summary bundle distanceToHomeInMiles is negative (in %s:%d)", buf, 0x12u);
            }

            double v28 = +[NSAssertionHandler currentHandler];
            [v28 handleFailureInMethod:a2 object:a1 file:@"MOSummarizationUtilities.m" lineNumber:530 description:@"Workout in summary bundle distanceToHomeInMiles is negative (in %s:%d)", "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]", 530];
          }

          id v52 = [v18 metaDataForRank];
          unint64_t v53 = [v52 objectForKeyedSubscript:@"WorkoutDuration"];
          [v53 floatValue];
          float v55 = v54;

          if (!v9)
          {
            double v56 = [v18 metaDataForRank];
            uint64_t v57 = [v56 objectForKeyedSubscript:@"FamiliarityIndex"];
            [v57 floatValue];
            float v59 = v58;

            if (v59 == -1.0)
            {
              id v60 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
                +[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:](&v255, v256);
              }
            }
            else
            {
              id v60 = [v18 metaDataForRank];
              id v61 = [v60 objectForKeyedSubscript:@"FamiliarityIndex"];
              [v61 floatValue];
              float v63 = v228 + v62 * v22;
              float v228 = v63;
            }
            v130 = [v18 metaDataForRank];
            v131 = [v130 objectForKeyedSubscript:@"PoiCategory"];

            v132 = +[NSNull null];
            unsigned __int8 v133 = [v131 isEqual:v132];

            if ((v133 & 1) == 0)
            {
              v134 = [v18 metaDataForRank];
              v135 = [v134 objectForKeyedSubscript:@"PoiCategory"];
              [v135 floatValue];
              float v137 = v227 + v136 * v22;
              float v227 = v137;
            }
            v138 = [v18 metaDataForRank];
            v139 = [v138 objectForKey:@"PeopleDensityWeightedAverage"];
            [v139 floatValue];
            float v141 = v140;

            v142 = [v18 metaDataForRank];
            v143 = [v142 objectForKey:@"PeopleCountWeightedAverage"];
            [v143 floatValue];
            float v145 = v144;

            v146 = [v18 metaDataForRank];
            v147 = [v146 objectForKey:@"StateOfMindLabels"];

            if (v147)
            {
              v148 = [v18 metaDataForRank];
              v149 = [v148 objectForKey:@"StateOfMindLabels"];
              [v240 addObjectsFromArray:v149];
            }
            v150 = [v18 metaDataForRank];
            v151 = [v150 objectForKey:@"StateOfMindDomains"];

            if (v151)
            {
              v152 = [v18 metaDataForRank];
              v153 = [v152 objectForKey:@"StateOfMindDomains"];
              [v239 addObjectsFromArray:v153];
            }
            v154 = [v18 metaDataForRank];
            v155 = [v154 objectForKey:@"StateOfMindValence"];

            if (v155)
            {
              v156 = [v18 metaDataForRank];
              v157 = [v156 objectForKey:@"StateOfMindValence"];
              [v238 addObjectsFromArray:v157];
            }
            v158 = [v18 metaDataForRank];
            v159 = [v158 objectForKey:@"StateOfMindValenceClassification"];

            if (v159)
            {
              v160 = [v18 metaDataForRank];
              v161 = [v160 objectForKey:@"StateOfMindValenceClassification"];
              [v237 addObjectsFromArray:v161];
            }
            float v162 = v242 + v141 * v22;
            float v163 = v243 + v145 * v22;
            float v242 = v162;
            float v243 = v163;

            id v12 = v246;
          }
          float v14 = v14 + v55;
          float v15 = v22 + v15;
        }
        else if ([v18 interfaceType] == (id)2)
        {
          id v29 = [v18 metaDataForRank];
          id v30 = [v29 objectForKeyedSubscript:@"PoiCategory"];

          id v31 = +[NSNull null];
          unsigned __int8 v32 = [v30 isEqual:v31];

          if ((v32 & 1) == 0)
          {
            long long v33 = [v18 metaDataForRank];
            long long v34 = [v33 objectForKeyedSubscript:@"PoiCategory"];
            [v34 floatValue];
            float v36 = v229 + v35 * v22;
            float v229 = v36;
          }
          long long v37 = [v18 metaDataForRank];
          id v38 = [v37 objectForKeyedSubscript:@"LocationModeTourist"];
          [v38 floatValue];
          float v40 = v39;

          id v41 = [v18 metaDataForRank];
          double v42 = [v41 objectForKeyedSubscript:@"DistanceToHome"];
          [v42 floatValue];
          float v44 = v43;

          if (v44 >= 0.0)
          {
            long long v79 = [v18 metaDataForRank];
            id v80 = [v79 objectForKeyedSubscript:@"DistanceToHome"];
            [v80 floatValue];

            uint64_t v46 = [v18 metaDataForRank];
            uint64_t v81 = [v46 objectForKeyedSubscript:@"DistanceToHome"];
            [v81 floatValue];
            float v83 = v230 + v82 * v22;
            float v230 = v83;
          }
          else
          {
            uint64_t v45 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v266 = "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]";
              __int16 v267 = 1024;
              int v268 = 579;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Summary bundle distanceToHomeInMiles is negative (in %s:%d)", buf, 0x12u);
            }

            uint64_t v46 = +[NSAssertionHandler currentHandler];
            [v46 handleFailureInMethod:a2 object:a1 file:@"MOSummarizationUtilities.m" lineNumber:579 description:@"Summary bundle distanceToHomeInMiles is negative (in %s:%d)", "+[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:]", 579];
          }

          id v84 = [v18 metaDataForRank];
          v85 = [v84 objectForKeyedSubscript:@"FamiliarityIndex"];
          [v85 floatValue];
          float v87 = v86;

          if (v87 == -1.0)
          {
            unint64_t v88 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT)) {
              +[MOSummarizationUtilities updateRankMetaDataFrom:forSummaryBundle:](&v253, v254);
            }
          }
          else
          {
            unint64_t v88 = [v18 metaDataForRank];
            unint64_t v89 = [v88 objectForKeyedSubscript:@"FamiliarityIndex"];
            [v89 floatValue];
            float v91 = v241 + v90 * v22;
            float v241 = v91;
          }
          v103 = [v18 metaDataForRank];
          v104 = [v103 objectForKey:@"PeopleDensityWeightedAverage"];
          [v104 floatValue];
          float v106 = v105;

          v107 = [v18 metaDataForRank];
          v108 = [v107 objectForKey:@"PeopleCountWeightedAverage"];
          [v108 floatValue];
          float v110 = v109;

          v111 = [v18 metaDataForRank];
          v112 = [v111 objectForKey:@"StateOfMindLabels"];

          if (v112)
          {
            v113 = [v18 metaDataForRank];
            v114 = [v113 objectForKey:@"StateOfMindLabels"];
            [v240 addObjectsFromArray:v114];
          }
          v115 = [v18 metaDataForRank];
          v116 = [v115 objectForKey:@"StateOfMindDomains"];

          if (v116)
          {
            v117 = [v18 metaDataForRank];
            v118 = [v117 objectForKey:@"StateOfMindDomains"];
            [v239 addObjectsFromArray:v118];
          }
          v119 = [v18 metaDataForRank];
          v120 = [v119 objectForKey:@"StateOfMindValence"];

          if (v120)
          {
            v121 = [v18 metaDataForRank];
            v122 = [v121 objectForKey:@"StateOfMindValence"];
            [v238 addObjectsFromArray:v122];
          }
          v123 = [v18 metaDataForRank];
          v124 = [v123 objectForKey:@"StateOfMindValenceClassification"];

          if (v124)
          {
            v125 = [v18 metaDataForRank];
            v126 = [v125 objectForKey:@"StateOfMindValenceClassification"];
            [v237 addObjectsFromArray:v126];
          }
          float v127 = v248 + v40 * v22;
          float v248 = v127;
          float v128 = v249 + v106 * v22;
          float v249 = v128;
          float v129 = v250 + v110 * v22;
          float v250 = v129;
          float v16 = v22 + v16;

          id v12 = v246;
        }
        else if ([v18 interfaceType] == (id)4)
        {
          id v64 = [v18 metaDataForRank];
          id v65 = [v64 objectForKeyedSubscript:@"dailyAggregateCallDuration"];
          [v65 floatValue];
          float v234 = v234 + v66;

          double v67 = [v18 metaDataForRank];
          double v68 = [v67 objectForKeyedSubscript:@"callDuration"];
          [v68 floatValue];
          float v235 = v235 + v69;

          double v70 = [v18 metaDataForRank];
          v71 = [v70 objectForKeyedSubscript:@"burstyInteractionCount"];
          [v71 floatValue];
          float v236 = v236 + v72;

          double v73 = [v18 metaDataForRank];
          v74 = [v73 objectForKeyedSubscript:@"isFamilyContact"];
          [v74 floatValue];
          float v232 = v232 + v75;

          uint64_t v76 = [v18 metaDataForRank];
          v77 = [v76 objectForKeyedSubscript:@"isCoworkerContact"];
          [v77 floatValue];
          float v233 = v233 + v78;

          float v231 = v231 + 1.0;
        }
        else if ([v18 interfaceType] == (id)5)
        {
          long long v92 = [v18 metaDataForRank];
          long long v93 = [v92 objectForKey:@"MediaTotalPlayTime"];
          [v93 doubleValue];
          double v95 = v94;

          float v96 = v95;
          double v224 = v224 + v96;
          __int16 v97 = [v18 metaDataForRank];
          uint64_t v98 = [v97 objectForKey:@"MediaActionIsRepeat"];
          unsigned int v99 = [v98 BOOLValue];

          BOOL v100 = v226;
          BOOL v101 = v99 == 0;
          id v12 = v246;
          if (!v101) {
            BOOL v100 = v95 + (double)v226 != 0.0;
          }
          BOOL v226 = v100;
          float v102 = v22 + v225;
          float v225 = v102;
        }
        if ([v18 bundleSubType] == (id)204
          || [v18 bundleSubType] == (id)207
          || [v18 bundleSubType] == (id)208
          || [v18 bundleSubType] == (id)206)
        {
          v164 = [v18 metaDataForRank];
          v165 = [v164 objectForKeyedSubscript:@"MotionActivityWalkSpan"];
          [v165 doubleValue];
          double v167 = v166;

          if (v167 > v13) {
            double v13 = v167;
          }
        }
      }
      id v252 = [v12 countByEnumeratingWithState:&v257 objects:v269 count:16];
    }
    while (v252);

    if (v16 <= 0.0)
    {
      v174 = v6;
      v172 = NSAssertionHandler_ptr;
      float v171 = v230;
    }
    else
    {
      float v169 = v16;
      *(float *)&double v168 = v229 / v16;
      float v170 = v248 / v16;
      float v171 = v230 / v16;
      v172 = NSAssertionHandler_ptr;
      v173 = +[NSNumber numberWithFloat:v168];
      v174 = v6;
      [v6 addMetaDataForRankForKey:@"PoiCategory" value:v173];

      *(float *)&double v175 = v171;
      v176 = +[NSNumber numberWithFloat:v175];
      [v6 addMetaDataForRankForKey:@"DistanceToHome" value:v176];

      *(float *)&double v177 = v170;
      v178 = +[NSNumber numberWithFloat:v177];
      [v6 addMetaDataForRankForKey:@"LocationModeTourist" value:v178];

      *(float *)&double v179 = v169;
      v180 = +[NSNumber numberWithFloat:v179];
      [v6 addMetaDataForRankForKey:@"VisitDuration" value:v180];

      *(float *)&double v181 = v241 / v169;
      v182 = +[NSNumber numberWithFloat:v181];
      [v6 addMetaDataForRankForKey:@"FamiliarityIndex" value:v182];

      *(float *)&double v183 = v249 / v169;
      v184 = +[NSNumber numberWithFloat:v183];
      [v6 addMetaDataForRankForKey:@"PeopleDensityWeightedAverage" value:v184];

      *(float *)&double v185 = v250 / v169;
      v186 = +[NSNumber numberWithFloat:v185];
      [v6 addMetaDataForRankForKey:@"PeopleCountWeightedAverage" value:v186];
    }
    if (v15 > 0.0)
    {
      *(float *)&double v168 = v14;
      v194 = +[NSNumber numberWithFloat:v168];
      [v174 addMetaDataForRankForKey:@"WorkoutDuration" value:v194];

      double v168 = v171;
      if (v171 < 2.22507386e-308)
      {
        *(float *)&double v168 = v247 / v15;
        v195 = +[NSNumber numberWithFloat:v168];
        [v174 addMetaDataForRankForKey:@"DistanceToHome" value:v195];
      }
      if (!v9)
      {
        *(float *)&double v168 = v227 / v15;
        v196 = +[NSNumber numberWithFloat:v168];
        [v174 addMetaDataForRankForKey:@"PoiCategory" value:v196];

        *(float *)&double v197 = v228 / v15;
        v198 = +[NSNumber numberWithFloat:v197];
        [v174 addMetaDataForRankForKey:@"FamiliarityIndex" value:v198];

        *(float *)&double v199 = v242 / v15;
        v200 = +[NSNumber numberWithFloat:v199];
        [v174 addMetaDataForRankForKey:@"PeopleDensityWeightedAverage" value:v200];

        *(float *)&double v201 = v243 / v15;
        v202 = +[NSNumber numberWithFloat:v201];
        [v174 addMetaDataForRankForKey:@"PeopleCountWeightedAverage" value:v202];
      }
    }
    if (v13 > 0.0)
    {
      v203 = +[NSNumber numberWithDouble:v13];
      [v174 addMetaDataForRankForKey:@"MotionActivityWalkSpan" value:v203];
    }
    v187 = v174;
    float v189 = v225;
    if (v231 <= 0.0)
    {
      double v188 = v224;
      float v191 = v235;
      float v190 = v236;
      float v193 = v233;
      float v192 = v234;
      *(float *)&double v168 = v232;
    }
    else
    {
      *(float *)&double v168 = v232 / v231;
      float v193 = v233 / v231;
      double v188 = v224;
      float v191 = v235;
      float v190 = v236;
      float v192 = v234;
    }
  }
  else
  {
    v187 = v6;

    LOBYTE(v226) = 0;
    double v188 = 0.0;
    float v189 = 0.0;
    float v190 = 0.0;
    float v191 = 0.0;
    float v192 = 0.0;
    float v193 = 0.0;
    double v168 = 0.0;
    v172 = NSAssertionHandler_ptr;
  }
  v204 = [v172[32] numberWithFloat:v168];
  [v187 addMetaDataForRankForKey:@"isFamilyContact" value:v204];

  *(float *)&double v205 = v193;
  v206 = [v172[32] numberWithFloat:v205];
  [v187 addMetaDataForRankForKey:@"isCoworkerContact" value:v206];

  [v187 addMetaDataForRankForKey:@"isGroupConversation" value:&__kCFBooleanFalse];
  *(float *)&double v207 = v192;
  v208 = [v172[32] numberWithFloat:v207];
  [v187 addMetaDataForRankForKey:@"dailyAggregateCallDuration" value:v208];

  *(float *)&double v209 = v191;
  v210 = [v172[32] numberWithFloat:v209];
  [v187 addMetaDataForRankForKey:@"callDuration" value:v210];

  *(float *)&double v211 = v190;
  v212 = [v172[32] numberWithFloat:v211];
  [v187 addMetaDataForRankForKey:@"burstyInteractionCount" value:v212];

  v213 = [v172[32] numberWithDouble:v188];
  [v187 addMetaDataForRankForKey:@"MediaTotalPlayTime" value:v213];

  if (v189 > 0.0)
  {
    *(float *)&double v214 = (float)v226 / v189;
    v215 = [v172[32] numberWithFloat:v214];
    [v187 addMetaDataForRankForKey:@"MediaActionIsRepeat" value:v215];
  }
  v216 = +[NSSet setWithArray:v240];
  v217 = [v216 allObjects];
  [v187 addMetaDataForRankForKey:@"StateOfMindLabels" value:v217];

  v218 = +[NSSet setWithArray:v239];
  v219 = [v218 allObjects];
  [v187 addMetaDataForRankForKey:@"StateOfMindDomains" value:v219];

  v220 = +[NSSet setWithArray:v238];
  v221 = [v220 allObjects];
  [v187 addMetaDataForRankForKey:@"StateOfMindValence" value:v221];

  v222 = +[NSSet setWithArray:v237];
  v223 = [v222 allObjects];
  [v187 addMetaDataForRankForKey:@"StateOfMindValenceClassification" value:v223];
}

+ (id)createDominantBundleFromBundles:(id)a3 withParameters:(id)a4 timeZoneManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 createMegaBundleFromBundles:v8 parameters:v9 timeZoneManager:a5];
  [a1 setActionsAndPlacesFromBundles:v8 forDominantBundle:v10 withParameters:v9];
  [v10 setInterfaceType:12];
  uint64_t v11 = [v10 action];
  id v12 = [v11 actionType];

  if (v12 == (id)4)
  {
    [v9 dominantBundle_mediaPlaySessionDominantFactorThreshold];
    double v14 = v13;
    [v9 dominantBundle_mediaPlaySessionsOverlapsMinimumDistance];
    [a1 setMediaActionForWorkoutBundle:v10 withMediaPlaySessionDominantFactorThreshold:v14 mediaPlaySessionsOverlapsMinimumDistance:v15];
    uint64_t v16 = 201;
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v16 = 101;
    uint64_t v17 = 1;
  }
  [v10 setBundleSuperType:v17 a1 v9];
  [v10 setBundleSubType:v16];
  uint64_t v18 = objc_opt_new();
  id v19 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v20 = v8;
  id v21 = [v20 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        float v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v25 setIsAggregatedAndSuppressed:1];
        float v26 = [v25 bundleIdentifier];
        uint64_t v27 = [v26 UUIDString];
        [v18 addObject:v27];

        double v28 = [v25 suggestionID];
        id v29 = [v28 UUIDString];
        [v19 addObject:v29];
      }
      id v22 = [v20 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v22);
  }

  id v30 = [v18 copy];
  [v10 setSubBundleIDs:v30];

  id v31 = [v19 copy];
  [v10 setSubSuggestionIDs:v31];

  unsigned __int8 v32 = [v35 getResourcesFromBundles:v20 forSummaryBundle:v10 withParameters:v36];
  [v10 setResources:v32];

  long long v33 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "SummarizationUtilities: dominant bundle being created: %@", buf, 0xCu);
  }

  return v10;
}

+ (id)getWorkoutActionsByActionSubtypeFromBundles:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    float v58 = objc_opt_new();
    uint64_t v57 = objc_opt_new();
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v52 = v3;
    id obj = v3;
    id v55 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v55)
    {
      uint64_t v54 = *(void *)v68;
      BOOL v4 = &MOLogFacilitySummarization;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v68 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v56 = v5;
          id v6 = *(void **)(*((void *)&v67 + 1) + 8 * v5);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v7 = [v6 events];
          id v8 = [v7 countByEnumeratingWithState:&v63 objects:v75 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v64;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v64 != v10) {
                  objc_enumerationMutation(v7);
                }
                id v12 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                if ([v12 provider] == (id)1 && objc_msgSend(v12, "category") == (id)2)
                {
                  float v13 = [v12 workoutType];

                  if (v13)
                  {
                    double v14 = [v58 allKeys];
                    float v15 = [v12 workoutType];
                    unsigned int v16 = [v14 containsObject:v15];

                    if (v16)
                    {
                      uint64_t v17 = [v12 workoutType];
                      uint64_t v18 = [v58 objectForKey:v17];
                      [v18 addObject:v12];

                      id v19 = [v12 workoutType];
                      id v20 = [v57 objectForKey:v19];

                      [v20 floatValue];
                      float v22 = v21;
                      uint64_t v23 = [v12 workoutDuration];
                      [v23 floatValue];
                      *(float *)&double v25 = v22 + v24;
                      float v26 = +[NSNumber numberWithFloat:v25];
                      [v12 workoutType];
                      uint64_t v27 = v7;
                      v29 = double v28 = v4;
                      [v57 setObject:v26 forKey:v29];

                      BOOL v4 = v28;
                      id v7 = v27;
                    }
                    else
                    {
                      id v30 = +[NSMutableSet setWithObject:v12];
                      id v31 = [v12 workoutType];
                      [v58 setObject:v30 forKey:v31];

                      id v20 = [v12 workoutDuration];
                      uint64_t v23 = [v12 workoutType];
                      [v57 setObject:v20 forKey:v23];
                    }

                    unsigned __int8 v32 = _mo_log_facility_get_os_log(v4);
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                      +[MOSummarizationUtilities getWorkoutActionsByActionSubtypeFromBundles:]((uint64_t)v74, (uint64_t)v12);
                    }
                  }
                }
              }
              id v9 = [v7 countByEnumeratingWithState:&v63 objects:v75 count:16];
            }
            while (v9);
          }

          uint64_t v5 = v56 + 1;
        }
        while ((id)(v56 + 1) != v55);
        id v55 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v55);
    }

    long long v33 = [v57 keysSortedByValueUsingComparator:&__block_literal_global_424];
    long long v34 = objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v35 = v33;
    id v36 = [v35 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v60;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v60 != v38) {
            objc_enumerationMutation(v35);
          }
          long long v40 = [v58 objectForKeyedSubscript:*(void *)(*((void *)&v59 + 1) + 8 * (void)j)];
          if ([v40 count] && objc_msgSend(v40, "count"))
          {
            id v41 = [MOAction alloc];
            double v42 = [v40 allObjects];
            float v43 = [v42 objectAtIndex:0];
            float v44 = [v43 workoutType];
            uint64_t v45 = [(MOAction *)v41 initWithActionName:v44 actionType:4 actionSubtype:1 actionMetaData:0];

            uint64_t v46 = [v40 allObjects];
            unint64_t v47 = [v46 firstObject];
            long long v48 = [v47 eventIdentifier];
            [(MOAction *)v45 setSourceEventIdentifier:v48];

            [v34 addObject:v45];
            unint64_t v49 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              float v72 = v45;
              _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "getWorkoutActionsByActionSubtypeFromBundles: output action, %@", buf, 0xCu);
            }
          }
        }
        id v37 = [v35 countByEnumeratingWithState:&v59 objects:v73 count:16];
      }
      while (v37);
    }

    id v50 = [v34 copy];
    id v3 = v52;
  }
  else
  {
    id v50 = 0;
  }

  return v50;
}

int64_t __72__MOSummarizationUtilities_getWorkoutActionsByActionSubtypeFromBundles___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

+ (id)getActionsFromBundles:(id)a3 withDominantAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_opt_new();
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v52 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v68;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v68 != v11) {
            objc_enumerationMutation(v8);
          }
          float v13 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          double v14 = [v13 action];

          if (v14)
          {
            float v15 = [v13 action];
            unsigned int v16 = [v15 actionName];

            uint64_t v17 = [v7 allKeys];
            unsigned int v18 = [v17 containsObject:v16];

            if (v18)
            {
              id v19 = [v7 objectForKey:v16];
              [v19 addObject:v13];
            }
            else
            {
              id v19 = +[NSMutableSet setWithObject:v13];
              [v7 setObject:v19 forKey:v16];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v67 objects:v75 count:16];
      }
      while (v10);
    }

    uint64_t v54 = objc_opt_new();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v20 = [v7 allKeys];
    id v21 = [v20 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v64;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v64 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v63 + 1) + 8 * (void)j);
          float v26 = [v7 objectForKey:v25];
          uint64_t v27 = [v26 allObjects];

          [v27 getTotalDurationOfMOEventBundleArray];
          double v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v54 setObject:v28 forKey:v25];
        }
        id v22 = [v20 countByEnumeratingWithState:&v63 objects:v74 count:16];
      }
      while (v22);
    }

    id v29 = [v54 keysSortedByValueUsingComparator:&__block_literal_global_427];
    id v30 = objc_opt_new();
    if ([v6 actionType] == (id)2)
    {
      [v30 addObject:v6];
      id v31 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.6((uint64_t)v6, v30);
      }
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v32 = v29;
    id v33 = [v32 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v60;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v60 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = *(void **)(*((void *)&v59 + 1) + 8 * (void)k);
          if (v6
            && ([v6 actionName],
                uint64_t v38 = objc_claimAutoreleasedReturnValue(),
                unsigned int v39 = [v37 isEqualToString:v38],
                v38,
                v39))
          {
            long long v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
              +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:].cold.5(&v57, v58);
            }
          }
          else
          {
            if ([v6 actionType] != (id)4
              || ![v37 isEqualToString:@"visit"])
            {
              long long v40 = [v7 objectForKeyedSubscript:v37];
              if (![v40 count]) {
                goto LABEL_49;
              }
              id v41 = [v40 count];
              double v42 = [v40 allObjects];
              float v43 = v42;
              if (v41 == (id)1)
              {
                float v44 = [v42 objectAtIndex:0];

                uint64_t v45 = [v44 action];

                if (v45)
                {
                  uint64_t v46 = [v44 action];
                  [v30 addObject:v46];

                  unint64_t v47 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
                    +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:]((uint64_t)v72, (uint64_t)v44);
                  }
                  goto LABEL_47;
                }
              }
              else
              {
                float v44 = [a1 getDominantBundleFromBundles:v42];

                if (v44)
                {
                  long long v48 = [v44 action];

                  if (v48)
                  {
                    unint64_t v49 = [v44 action];
                    [v30 addObject:v49];

                    unint64_t v47 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
                      +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:]((uint64_t)v71, (uint64_t)v44);
                    }
LABEL_47:
                  }
                }
              }

              goto LABEL_49;
            }
            long long v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
              +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:](&v55, v56);
            }
          }
LABEL_49:
        }
        id v34 = [v32 countByEnumeratingWithState:&v59 objects:v73 count:16];
      }
      while (v34);
    }

    id v50 = [v30 copy];
    id v5 = v52;
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[MOSummarizationUtilities getActionsFromBundles:withDominantAction:](v7);
    }
    id v50 = 0;
  }

  return v50;
}

int64_t __69__MOSummarizationUtilities_getActionsFromBundles_withDominantAction___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

+ (id)getDominantBundleFromBundles:(id)a3
{
  id v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_433];
  BOOL v4 = [v3 objectAtIndex:0];

  return v4;
}

int64_t __57__MOSummarizationUtilities_getDominantBundleFromBundles___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  BOOL v4 = a3;
  [(MOEventBundle *)a2 duration];
  double v6 = v5;
  [(MOEventBundle *)v4 duration];
  double v8 = v7;

  if (v6 <= v8) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = -1;
  }
  if (v6 < v8) {
    return 1;
  }
  else {
    return v9;
  }
}

+ (id)getActionFromBundles:(id)a3 withMainActionSelectionThresholdBasedOnDuration:(float)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 count] < 2)
  {
    double v7 = 0;
    goto LABEL_48;
  }
  id v62 = a1;
  double v8 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v64 = v6;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v74;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        float v15 = [v8 allKeys];
        unsigned int v16 = [v14 getBundleType];
        unsigned int v17 = [v15 containsObject:v16];

        if (v17)
        {
          unsigned int v18 = [v14 getBundleType];
          id v19 = [v8 objectForKey:v18];
          [v19 addObject:v14];
        }
        else
        {
          unsigned int v18 = +[NSMutableSet setWithObject:v14];
          id v19 = [v14 getBundleType];
          [v8 setObject:v18 forKey:v19];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v11);
  }

  id v20 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v21 = [v8 allKeys];
  id v22 = [v21 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v70;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v70 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v69 + 1) + 8 * (void)j);
        uint64_t v27 = [v8 objectForKey:v26];
        double v28 = [v27 allObjects];

        [v28 getTotalDurationOfMOEventBundleArray];
        id v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v20 setObject:v29 forKey:v26];
      }
      id v23 = [v21 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v23);
  }

  id v30 = [v20 keysSortedByValueUsingComparator:&__block_literal_global_435];
  id v31 = [v30 objectAtIndexedSubscript:[v30 count] - 1];
  id v32 = [v30 objectAtIndexedSubscript:[v30 count] - 2];
  long long v63 = v32;
  if ((![v31 isEqualToString:@"activity"]
     || ([v32 isEqualToString:@"outing"] & 1) == 0)
    && (![v31 isEqualToString:@"outing"]
     || ![v32 isEqualToString:@"activity"]))
  {
    long long v40 = [v8 objectForKey:v31];
    id v41 = [v40 allObjects];
    double v42 = [v41 firstObject];
    double v7 = [v42 action];

    goto LABEL_28;
  }
  id v33 = [v20 objectForKey:@"activity"];
  [v33 doubleValue];
  double v35 = v34;

  id v36 = [v20 objectForKey:@"outing"];
  [v36 doubleValue];
  double v38 = v37;

  if (v38 <= 0.0 || (double v39 = v35 / v38, v35 / v38 >= a4))
  {
    float v43 = [v8 objectForKey:@"activity" v39];
    float v44 = [v43 allObjects];

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v45 = v44;
    id v46 = [v45 countByEnumeratingWithState:&v65 objects:v77 count:16];
    if (v46)
    {
      id v47 = v46;
      long long v60 = v31;
      long long v61 = v30;
      unint64_t v48 = 0;
      uint64_t v49 = *(void *)v66;
      do
      {
        for (k = 0; k != v47; k = (char *)k + 1)
        {
          if (*(void *)v66 != v49) {
            objc_enumerationMutation(v45);
          }
          float v51 = *(void **)(*((void *)&v65 + 1) + 8 * (void)k);
          id v52 = [v51 action];
          if ([v52 actionType] == (id)4)
          {
            unint64_t v53 = [v51 action];
            id v54 = [v53 actionSubtype];

            if (v54 == (id)1) {
              ++v48;
            }
          }
          else
          {
          }
        }
        id v47 = [v45 countByEnumeratingWithState:&v65 objects:v77 count:16];
      }
      while (v47);

      BOOL v55 = v48 >= 2;
      id v6 = v64;
      id v31 = v60;
      id v30 = v61;
      if (v55)
      {
        uint64_t v56 = [MOAction alloc];
        char v57 = [v62 workoutMetaDataCreatedForBundles:v45];
        float v58 = [(MOAction *)v56 initWithActionName:@"workout" actionType:4 actionSubtype:1 actionMetaData:v57];
LABEL_46:
        double v7 = v58;

        goto LABEL_47;
      }
    }
    else
    {

      id v6 = v64;
    }
    char v57 = [v45 firstObject];
    float v58 = [v57 action];
    goto LABEL_46;
  }
  double v7 = [[MOAction alloc] initWithActionName:@"visit" actionType:2];
LABEL_28:
  id v6 = v64;
LABEL_47:

LABEL_48:

  return v7;
}

int64_t __97__MOSummarizationUtilities_getActionFromBundles_withMainActionSelectionThresholdBasedOnDuration___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

+ (id)sortedBundleBasedOnGoodnessScore:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_440];
    }
    double v5 = v4;
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

int64_t __61__MOSummarizationUtilities_sortedBundleBasedOnGoodnessScore___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a3;
  double v5 = [(MOEventBundle *)a2 rankingDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v6 floatValue];
  float v8 = v7;

  id v9 = [(MOEventBundle *)v4 rankingDictionary];

  id v10 = [v9 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v10 floatValue];
  float v12 = v11;

  if (v8 <= v12) {
    return 1;
  }
  else {
    return -1;
  }
}

+ (void)setActionsAndPlacesFromBundles:(id)a3 forDominantBundle:(id)a4 withParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] <= 1)
  {
    float v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not enough bundles to create dominant bundle, so skip seting actions and places", buf, 2u);
    }
    goto LABEL_30;
  }
  id v52 = objc_opt_new();
  uint64_t v49 = objc_opt_new();
  float v12 = objc_opt_new();
  unint64_t v53 = objc_opt_new();
  float v13 = [a1 sortedBundleBasedOnGoodnessScore:v8];
  id v47 = v10;
  id v48 = v8;
  float v51 = v9;
  unsigned int v50 = [a1 shouldIncludeVisitIntoActionsFromBundles:v8 forDominantBundle:v9 withParameters:v10];
  if ([v13 count])
  {
    uint64_t v14 = 0;
    while (1)
    {
      float v15 = [v13 objectAtIndexedSubscript:v14];
      uint64_t v16 = [v15 action];
      if (!v16) {
        goto LABEL_17;
      }
      unsigned int v17 = (void *)v16;
      unsigned int v18 = [v15 action];
      uint64_t v19 = [v18 actionName];
      if (!v19) {
        goto LABEL_16;
      }
      id v20 = (void *)v19;
      id v21 = [v15 action];
      id v22 = [v21 actionName];
      unsigned __int8 v23 = [v53 containsObject:v22];

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = [v15 action];
        unsigned int v25 = [v24 actionType] == (id)2 ? v50 : 1;

        if (v25 == 1) {
          break;
        }
      }
LABEL_17:
      uint64_t v31 = [v15 place];
      if (v31)
      {
        id v32 = v31;
        id v33 = [v15 place];
        uint64_t v34 = [v33 placeName];
        if (!v34)
        {

LABEL_23:
          goto LABEL_24;
        }
        double v35 = (void *)v34;
        id v36 = [v15 place];
        double v37 = [v36 placeName];
        unsigned __int8 v38 = [v12 containsObject:v37];

        if ((v38 & 1) == 0)
        {
          double v39 = [v15 place];
          [v52 addObject:v39];

          long long v40 = [v15 place];
          id v41 = [v40 placeName];
          [v12 addObject:v41];

          id v32 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            double v42 = [v15 place];
            float v43 = [v42 placeName];
            float v44 = [v51 startDate];
            *(_DWORD *)buf = 138412546;
            BOOL v55 = v43;
            __int16 v56 = 2112;
            char v57 = v44;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "SummarizationUtilities: add place to places: %@, for dominant bundle with start date, %@", buf, 0x16u);
          }
          goto LABEL_23;
        }
      }
LABEL_24:

      if ((unint64_t)[v13 count] <= ++v14) {
        goto LABEL_25;
      }
    }
    uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [v15 action];
      double v28 = [v27 actionName];
      id v29 = [v51 startDate];
      *(_DWORD *)buf = 138412546;
      BOOL v55 = v28;
      __int16 v56 = 2112;
      char v57 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "SummarizationUtilities: add action to actions: %@, for dominant bundle with start date, %@", buf, 0x16u);
    }
    id v30 = [v15 action];
    [v49 addObject:v30];

    unsigned int v17 = [v15 action];
    unsigned int v18 = [v17 actionName];
    [v53 addObject:v18];
LABEL_16:

    goto LABEL_17;
  }
LABEL_25:
  id v9 = v51;
  [v51 setActions:v49];
  float v11 = v52;
  [v51 setPlaces:v52];
  if ([v52 count])
  {
    id v45 = [v52 firstObject];
    [v51 setPlace:v45];
  }
  id v10 = v47;
  id v8 = v48;
  if ([v49 count])
  {
    id v46 = [v49 firstObject];
    [v51 setAction:v46];
  }
LABEL_30:
}

+ (BOOL)shouldIncludeVisitIntoActionsFromBundles:(id)a3 forDominantBundle:(id)a4 withParameters:(id)a5
{
  id v6 = a3;
  id v43 = a5;
  float v7 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        float v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v14 = [v7 allKeys];
        float v15 = [v13 getBundleType];
        unsigned int v16 = [v14 containsObject:v15];

        if (v16)
        {
          unsigned int v17 = [v13 getBundleType];
          unsigned int v18 = [v7 objectForKey:v17];
          [v18 addObject:v13];
        }
        else
        {
          unsigned int v17 = +[NSMutableSet setWithObject:v13];
          unsigned int v18 = [v13 getBundleType];
          [v7 setObject:v17 forKey:v18];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v10);
  }
  id v42 = v8;

  uint64_t v19 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = [v7 allKeys];
  id v21 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
        uint64_t v26 = [v7 objectForKey:v25 v42];
        uint64_t v27 = [v26 allObjects];

        [v27 getTotalDurationOfMOEventBundleArray];
        double v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v19 setObject:v28 forKey:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v22);
  }

  id v29 = [v19 keysSortedByValueUsingComparator:&__block_literal_global_442];
  id v30 = [v29 objectAtIndexedSubscript:[v29 count] - 1];
  uint64_t v31 = [v29 objectAtIndexedSubscript:((char *)[v29 count]) - 2];
  if ((![v30 isEqualToString:@"activity"]
     || ([v31 isEqualToString:@"outing"] & 1) == 0)
    && (!objc_msgSend(v30, "isEqualToString:", @"outing", v42)
     || ![v31 isEqualToString:@"activity"]))
  {
    goto LABEL_24;
  }
  id v32 = [v19 objectForKey:@"activity" v42];
  [v32 doubleValue];
  double v34 = v33;

  double v35 = [v19 objectForKey:@"outing"];
  [v35 doubleValue];
  double v37 = v36;

  if (v37 > 0.0)
  {
    [v43 dominantBundle_mainActionSelectionThreshold];
    double v39 = v42;
    BOOL v40 = v34 / v37 < v38;
  }
  else
  {
LABEL_24:
    BOOL v40 = 0;
    double v39 = v42;
  }

  return v40;
}

int64_t __102__MOSummarizationUtilities_shouldIncludeVisitIntoActionsFromBundles_forDominantBundle_withParameters___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

+ (void)setActionsAndPlacesFromBundles:(id)a3 forSummaryBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  if ((unint64_t)[v8 count] > 1)
  {
    os_log_t log = (os_log_t)objc_opt_new();
    id v10 = objc_opt_new();
    long long v49 = objc_opt_new();
    id v41 = v8;
    uint64_t v11 = [a1 sortedBundleBasedOnGoodnessScore:v8];
    if ([v11 count])
    {
      unint64_t v12 = 0;
      long long v47 = v10;
      long long v48 = v9;
      id v42 = a1;
      id v43 = v11;
      do
      {
        float v13 = [v11 objectAtIndexedSubscript:v12];
        uint64_t v14 = [v13 action];

        if (v14)
        {
          float v15 = objc_opt_new();
          unsigned int v16 = objc_opt_new();
          unsigned int v17 = [v13 actions];
          unsigned int v18 = (char *)[v17 count];

          uint64_t v19 = [a1 getPlaceFromBundle:v13];
          long long v45 = v13;
          unint64_t v46 = v12;
          if (v18)
          {
            id v20 = [v13 actions];
            [v16 addObjectsFromArray:v20];

            id v21 = v49;
            id v22 = v15;
            do
            {
              [v15 addObject:v19];
              --v18;
            }
            while (v18);
          }
          else
          {
            uint64_t v23 = [v13 action];
            [v16 addObject:v23];

            [v15 addObject:v19];
            id v21 = v49;
            id v22 = v15;
          }
          long long v44 = (void *)v19;
          if ([v16 count])
          {
            unint64_t v24 = 0;
            do
            {
              uint64_t v25 = [v16 objectAtIndexedSubscript:v24];
              uint64_t v26 = [v25 actionName];
              [v22 objectAtIndexedSubscript:v24];
              v28 = uint64_t v27 = v22;
              id v29 = [v28 placeName];
              id v30 = [v26 stringByAppendingFormat:@"-%@", v29];

              id v22 = v27;
              if (([v21 containsObject:v30] & 1) == 0)
              {
                [v21 addObject:v30];
                uint64_t v31 = [v27 objectAtIndexedSubscript:v24];
                [log addObject:v31];

                id v32 = [v16 objectAtIndexedSubscript:v24];
                [v10 addObject:v32];

                double v33 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  double v34 = [v16 objectAtIndexedSubscript:v24];
                  double v35 = [v34 actionName];
                  double v36 = [v27 objectAtIndexedSubscript:v24];
                  double v37 = [v36 placeName];
                  float v38 = [v48 startDate];
                  *(_DWORD *)buf = 138412802;
                  id v52 = v35;
                  __int16 v53 = 2112;
                  id v54 = v37;
                  __int16 v55 = 2112;
                  __int16 v56 = v38;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "SummarizationUtilities: add action to actions: %@, place to places: %@, for bundle with start date, %@", buf, 0x20u);

                  id v21 = v49;
                  id v10 = v47;

                  id v22 = v27;
                }
              }
              ++v24;
            }
            while ((unint64_t)[v16 count] > v24);
          }

          id v9 = v48;
          a1 = v42;
          uint64_t v11 = v43;
          float v13 = v45;
          unint64_t v12 = v46;
        }

        ++v12;
      }
      while ((unint64_t)[v11 count] > v12);
    }
    [v9 setActions:v10];
    [v9 setPlaces:log];
    if ([log count])
    {
      double v39 = [log firstObject];
      [v9 setPlace:v39];
    }
    if ([v10 count])
    {
      BOOL v40 = [v10 firstObject];
      [v9 setAction:v40];
    }
    id v8 = v41;
  }
  else
  {
    _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Not enough bundles to create summary bundle, so skip seting actions and places", buf, 2u);
    }
  }
}

+ (id)getPlaceFromBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 place];

  long long v65 = [MOPlace alloc];
  long long v68 = +[NSUUID UUID];
  double v5 = [v3 place];
  long long v67 = v5;
  if (v4)
  {
    long long v47 = [v5 placeName];
    long long v63 = [v3 place];
    __int16 v53 = [v63 enclosingArea];
    long long v61 = [v3 place];
    id v6 = [v61 placeType];
    long long v59 = [v3 place];
    id v52 = [v59 placeUserType];
    char v57 = [v3 place];
    long long v50 = [v57 location];
    __int16 v55 = [v3 place];
    id v48 = [v55 locationMode];
    id v54 = [v3 place];
    unint64_t v46 = [v54 poiCategory];
    long long v51 = [v3 place];
    [v51 distanceToHomeInMiles];
    double v8 = v7;
    long long v49 = [v3 place];
    [v49 placeNameConfidence];
    double v10 = v9;
    uint64_t v11 = [v3 place];
    [v11 familiarityIndexLOI];
    double v13 = v12;
    uint64_t v14 = [v3 place];
    [v14 priorityScore];
    double v16 = v15;
    unsigned int v17 = [v3 place];
    unsigned int v18 = [v17 startDate];
    uint64_t v19 = [v3 place];
    id v20 = [v19 endDate];
    id v21 = [(MOPlace *)v65 initWithIdentifier:v68 placeName:v47 enclosingArea:v53 placeType:v6 placeUserType:v52 location:v50 locationMode:v8 poiCategory:v10 distanceToHomeInMiles:v13 placeNameConfidence:v16 familiarityIndexLOI:v48 priorityScore:v46 startDate:v18 endDate:v20];

    id v22 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [(MOPlace *)v21 placeName];
      unint64_t v24 = [v3 startDate];
      *(_DWORD *)buf = 138412546;
      long long v70 = v23;
      __int16 v71 = 2112;
      long long v72 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SummarizationUtilities: get place: %@, from bundle with start date, %@", buf, 0x16u);
    }
    uint64_t v25 = [v3 place];
    uint64_t v26 = [v25 sourceEventIdentifier];
    [(MOPlace *)v21 setSourceEventIdentifier:v26];

    uint64_t v27 = [v3 place];
    [(MOPlace *)v21 setSourceEventAccessType:[v27 sourceEventAccessType]];
  }
  else
  {
    id v58 = [v5 placeType];
    id v64 = [v3 place];
    id v56 = [v64 placeUserType];
    id v62 = [v3 place];
    id v28 = [v62 locationMode];
    long long v60 = [v3 place];
    id v29 = [v60 poiCategory];
    id v30 = [v3 place];
    [v30 distanceToHomeInMiles];
    double v32 = v31;
    double v33 = [v3 place];
    [v33 placeNameConfidence];
    double v35 = v34;
    double v36 = [v3 place];
    [v36 familiarityIndexLOI];
    double v38 = v37;
    double v39 = [v3 place];
    BOOL v40 = [v39 startDate];
    id v41 = [v3 place];
    id v42 = [v41 endDate];
    long long v66 = [(MOPlace *)v65 initWithIdentifier:v68 placeName:0 enclosingArea:0 placeType:v58 placeUserType:v56 location:0 locationMode:v32 poiCategory:v35 distanceToHomeInMiles:v38 placeNameConfidence:20000.0 familiarityIndexLOI:v28 priorityScore:v29 startDate:v40 endDate:v42];

    uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v43 = [v3 startDate];
      id v21 = v66;
      [(MOPlace *)v66 priorityScore];
      *(_DWORD *)buf = 138412546;
      long long v70 = v43;
      __int16 v71 = 2048;
      long long v72 = v44;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "SummarizationUtilities: get place holder from bundle with start date, %@ with priority score, %f", buf, 0x16u);
    }
    else
    {
      id v21 = v66;
    }
  }

  return v21;
}

+ (id)getPlaceFromPlacesSortedByDuration:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = v3;
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v3;
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v11, "proposition", (void)v16) != (id)4)
            {
              uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v21 = v11;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "SummarizationUtilities: precise label: %@", buf, 0xCu);
              }

              id v5 = v11;
              goto LABEL_20;
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      double v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        double v13 = [v6 firstObject];
        *(_DWORD *)buf = 138412290;
        id v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SummarizationUtilities: imprecise label: %@", buf, 0xCu);
      }
      id v4 = v6;
    }
    [v4 firstObject:v16];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
LABEL_20:

  return v5;
}

+ (id)workoutMetaDataCreatedForBundles:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  id v28 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v28)
  {
    id obj = v5;
    uint64_t v27 = *(void *)v34;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v9 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 2];
        double v10 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 1];
        v40[0] = v9;
        v40[1] = v10;
        uint64_t v11 = +[NSArray arrayWithObjects:v40 count:2];
        double v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

        double v13 = [v8 events];
        uint64_t v14 = [v13 filteredArrayUsingPredicate:v12];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v15 = v14;
        id v16 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)j) workoutDuration];
              [v20 doubleValue];
              double v6 = v6 + v21 / 60.0;
            }
            id v17 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
          }
          while (v17);
        }
      }
      id v5 = obj;
      id v28 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v28);

    if (v6 > 0.0)
    {
      LODWORD(v22) = llround(v6);
      uint64_t v23 = +[NSString stringWithFormat:@"%d", v22];
      [v4 setObject:v23 forKeyedSubscript:@"ActivityActionMetaDataValue"];

      [v4 setObject:@"minutes" forKeyedSubscript:@"ActivityActionMetaDataUnit"];
    }
  }
  else
  {
  }
  unint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "SummarizationUtilities: workoutMetaData: %@", buf, 0xCu);
  }

  return v4;
}

+ (void)setMediaActionForWorkoutBundle:(id)a3 withMediaPlaySessionDominantFactorThreshold:(double)a4 mediaPlaySessionsOverlapsMinimumDistance:(double)a5
{
  id v7 = a3;
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 6];
  long long v72 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 3];
  long long v73 = (void *)v8;
  v96[0] = v8;
  v96[1] = v72;
  uint64_t v9 = +[NSArray arrayWithObjects:v96 count:2];
  uint64_t v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  uint64_t v11 = [v7 events];
  __int16 v71 = (void *)v10;
  double v12 = [v11 filteredArrayUsingPredicate:v10];

  long long v79 = objc_opt_new();
  double v13 = [v7 startDate];
  uint64_t v14 = [v7 endDate];
  long long v76 = +[MOContextAnnotationUtilities predicateOfMediaPlaySessionsWithStartDate:v13 endDate:v14 distanceThreshold:a5];

  id v15 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"workoutDuration" ascending:0];
  uint64_t v16 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 2];
  long long v68 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 1];
  long long v69 = (void *)v16;
  v95[0] = v16;
  v95[1] = v68;
  id v17 = +[NSArray arrayWithObjects:v95 count:2];
  uint64_t v18 = +[NSCompoundPredicate andPredicateWithSubpredicates:v17];

  id v80 = v7;
  long long v19 = [v7 events];
  long long v67 = (void *)v18;
  id v20 = [v19 filteredArrayUsingPredicate:v18];
  long long v70 = v15;
  id v94 = v15;
  double v21 = +[NSArray arrayWithObjects:&v94 count:1];
  long long v66 = [v20 sortedArrayUsingDescriptors:v21];

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v12;
  id v77 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v77)
  {
    uint64_t v75 = *(void *)v86;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v86 != v75) {
          objc_enumerationMutation(obj);
        }
        uint64_t v78 = v22;
        uint64_t v23 = *(void **)(*((void *)&v85 + 1) + 8 * v22);
        unint64_t v24 = [v23 mediaPlaySessions];
        uint64_t v25 = [v24 filteredArrayUsingPredicate:v76];

        uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = [v23 mediaPlaySessions];
          id v28 = [v27 count];
          id v29 = [v25 count];
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v28;
          __int16 v91 = 2048;
          id v92 = v29;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "playback, %lu, filtered sessions, %lu", buf, 0x16u);
        }
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v30 = v25;
        id v31 = [v30 countByEnumeratingWithState:&v81 objects:v89 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v82;
          do
          {
            for (i = 0; i != v32; i = (char *)i + 1)
            {
              if (*(void *)v82 != v33) {
                objc_enumerationMutation(v30);
              }
              long long v35 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              id v36 = objc_alloc((Class)NSDateInterval);
              double v37 = [v35 startDate];
              double v38 = [v35 endDate];
              id v39 = [v36 initWithStartDate:v37 endDate:v38];

              id v40 = objc_alloc((Class)NSDateInterval);
              id v41 = [v80 startDate];
              id v42 = [v80 endDate];
              id v43 = [v40 initWithStartDate:v41 endDate:v42];
              long long v44 = [v43 intersectionWithDateInterval:v39];

              [v44 duration];
              if (v45 != 0.0) {
                [v79 addObject:v35];
              }
            }
            id v32 = [v30 countByEnumeratingWithState:&v81 objects:v89 count:16];
          }
          while (v32);
        }

        uint64_t v22 = v78 + 1;
      }
      while ((id)(v78 + 1) != v77);
      id v77 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v77);
  }

  if ([v66 count])
  {
    unint64_t v46 = objc_opt_new();
    if ([v66 count])
    {
      unint64_t v47 = 0;
      do
      {
        id v48 = [v66 objectAtIndexedSubscript:v47];
        long long v49 = [v48 workoutEvent];
        long long v50 = [v49 workoutType];
        long long v51 = [v66 firstObject];
        id v52 = [v51 workoutEvent];
        __int16 v53 = [v52 workoutType];

        if (v50 == v53)
        {
          id v54 = objc_alloc((Class)NSDateInterval);
          __int16 v55 = [v66 objectAtIndexedSubscript:v47];
          id v56 = [v55 startDate];
          char v57 = [v66 objectAtIndexedSubscript:v47];
          id v58 = [v57 endDate];
          id v59 = [v54 initWithStartDate:v56 endDate:v58];

          [v46 addObject:v59];
        }
        ++v47;
      }
      while ((unint64_t)[v66 count] > v47);
    }
    *(void *)buf = 0xBFF0000000000000;
    long long v60 = +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:v79 intervalsOfInterest:v46 dominantFactorThreshold:buf confidence:a4];
    long long v61 = v60;
    if (v60)
    {
      uint64_t v62 = [v60 objectForKeyedSubscript:@"DominantMediaNameKey"];
      if (v62)
      {
        long long v63 = (void *)v62;
        id v64 = [v61 objectForKeyedSubscript:@"DominantMediaPropertyKey"];

        if (v64)
        {
          long long v65 = +[MOContextAnnotationUtilities creatMediaActionWithMediaInfo:v61 mediaNameConfidence:*(double *)buf];
          [v80 setConcurrentMediaAction:v65];
        }
      }
    }
  }
}

+ (id)metricForVisitsFromBundle:(id)a3 andNextBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [a1 sortedVisitEventsFromBundle:v6];
  uint64_t v10 = [a1 sortedVisitEventsFromBundle:v7];
  if ([v9 count] && objc_msgSend(v10, "count"))
  {
    double v38 = v8;
    id v39 = v6;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v36 = v9;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    id v37 = v7;
    if (v11)
    {
      id v12 = v11;
      uint64_t v41 = *(void *)v47;
      double v13 = 1.79769313e308;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v47 != v41) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          uint64_t v16 = v10;
          id v17 = v10;
          id v18 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v43;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v43 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
                uint64_t v23 = [v15 location:v36];
                unint64_t v24 = [v22 location];
                [v23 distanceFromLocation:v24];
                double v26 = v25;

                if (v26 < v13) {
                  double v13 = v26;
                }
              }
              id v19 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v19);
          }

          uint64_t v10 = v16;
        }
        id v12 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v12);
    }
    else
    {
      double v13 = 1.79769313e308;
    }

    id v28 = [v10 firstObject];
    id v29 = [v28 startDate];
    id v30 = [obj lastObject];
    id v31 = [v30 endDate];
    [v29 timeIntervalSinceDate:v31];
    double v33 = v32;

    long long v34 = +[NSNumber numberWithDouble:v13];
    uint64_t v8 = v38;
    [v38 setObject:v34 forKey:@"distance"];

    uint64_t v27 = +[NSNumber numberWithDouble:v33];
    [v38 setObject:v27 forKey:@"timeInterval"];
    id v6 = v39;
    uint64_t v9 = v36;
    id v7 = v37;
  }
  else
  {
    uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      id v53 = [v9 count];
      __int16 v54 = 2048;
      id v55 = [v10 count];
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "SummarizationUtilities: can not generate visit metric for two bundle since one of them has visit count as 0, bundle 1 visit count, %lu, bundle 2 visit count, %lu", buf, 0x16u);
    }
  }

  return v8;
}

+ (double)maximumDistanceFromBundle:(id)a3 toBundleCluster:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    double v10 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = +[MOSummarizationUtilities metricForVisitsFromBundle:*(void *)(*((void *)&v17 + 1) + 8 * i) andNextBundle:v5];
        double v13 = [v12 objectForKey:@"distance"];
        [v13 doubleValue];
        double v15 = v14;

        if (v15 > v10) {
          double v10 = v15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 2.22507386e-308;
  }

  return v10;
}

+ (id)sortedVisitEventsFromBundle:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v5 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  id v6 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 4];
  v15[0] = v5;
  v15[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v15 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];

  uint64_t v9 = [v3 events];

  double v10 = [v9 filteredArrayUsingPredicate:v8];
  id v14 = v4;
  id v11 = +[NSArray arrayWithObjects:&v14 count:1];
  id v12 = [v10 sortedArrayUsingDescriptors:v11];

  return v12;
}

+ (double)workoutTimeIntervalBetweenBundle:(id)a3 andNextBundle:(id)a4
{
  id v6 = a4;
  id v7 = [a1 sortedWorkoutEventsFromBundle:a3];
  id v8 = [a1 sortedWorkoutEventsFromBundle:v6];

  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    uint64_t v9 = [v8 firstObject];
    double v10 = [v9 startDate];
    id v11 = [v7 lastObject];
    id v12 = [v11 endDate];
    [v10 timeIntervalSinceDate:v12];
    double v14 = v13;
  }
  else
  {
    double v15 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 134218240;
      id v18 = [v7 count];
      __int16 v19 = 2048;
      id v20 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "SummarizationUtilities: can not generate workout time interval for two bundle since one of them has workout count as 0, bundle 1 workout count, %lu, bundle 2 workout count, %lu", (uint8_t *)&v17, 0x16u);
    }

    double v14 = 1.79769313e308;
  }

  return v14;
}

+ (id)sortedWorkoutEventsFromBundle:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v5 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 2];
  id v6 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 1];
  v15[0] = v5;
  v15[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v15 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];

  uint64_t v9 = [v3 events];

  double v10 = [v9 filteredArrayUsingPredicate:v8];
  id v14 = v4;
  id v11 = +[NSArray arrayWithObjects:&v14 count:1];
  id v12 = [v10 sortedArrayUsingDescriptors:v11];

  return v12;
}

+ (id)createOutingMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 timeZoneManager:(id)a6
{
  BOOL v68 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((unint64_t)[v9 count] >= 2)
  {
    id v66 = v10;
    double v13 = [MOEventBundle alloc];
    id v14 = +[NSUUID UUID];
    double v15 = +[NSDate date];
    uint64_t v16 = [(MOEventBundle *)v13 initWithBundleIdentifier:v14 creationDate:v15];

    int v17 = v16;
    [a1 updateRankMetaDataFrom:v9 forSummaryBundle:v16];
    id v18 = objc_opt_new();
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v67 = v9;
    id v19 = v9;
    id v20 = [v19 countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v74;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v74 != v22) {
            objc_enumerationMutation(v19);
          }
          unint64_t v24 = [*(id *)(*((void *)&v73 + 1) + 8 * i) events];
          [v18 addObjectsFromArray:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v21);
    }

    long long v63 = v18;
    double v25 = [v18 allObjects];
    [(MOEventBundle *)v17 setEvents:v25];

    [(MOEventBundle *)v17 setPropertiesBasedOnEvents];
    double v26 = [v19 getTimeSpanOfMOEventBundleArray];
    uint64_t v27 = [v26 startDate];
    [(MOEventBundle *)v17 setStartDate:v27];

    long long v61 = v26;
    id v28 = [v26 endDate];
    [(MOEventBundle *)v17 setEndDate:v28];

    long long v60 = [a1 sortedVisitEventsFromBundle:v17];
    id v29 = [v60 lastObject];
    id v30 = [v29 endDate];
    id v65 = v11;
    id v31 = +[MOTime timeForDate:v30 timeZoneManager:v11];
    [(MOEventBundle *)v17 setTime:v31];

    [(MOEventBundle *)v17 setInterfaceType:12];
    id v62 = a1;
    [a1 setActionsAndPlacesFromBundles:v19 forSummaryBundle:v17];
    double v32 = [(MOEventBundle *)v17 action];
    id v33 = [v32 actionType];

    if (v33 == (id)4) {
      uint64_t v34 = 2;
    }
    else {
      uint64_t v34 = 1;
    }
    if (v33 == (id)4) {
      uint64_t v35 = 201;
    }
    else {
      uint64_t v35 = 101;
    }
    [(MOEventBundle *)v17 setBundleSuperType:v34];
    id v64 = v17;
    [(MOEventBundle *)v17 setBundleSubType:v35];
    id v36 = objc_opt_new();
    id v37 = objc_opt_new();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v38 = v19;
    id v39 = [v38 countByEnumeratingWithState:&v69 objects:v81 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v70;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v70 != v41) {
            objc_enumerationMutation(v38);
          }
          long long v43 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
          long long v44 = [v43 bundleIdentifier];
          long long v45 = [v44 UUIDString];
          [v36 addObject:v45];

          long long v46 = [v43 subBundleIDs];
          id v47 = [v46 count];

          if (v47)
          {
            long long v48 = [v43 subBundleIDs];
            [v36 addObjectsFromArray:v48];
          }
          long long v49 = [v43 suggestionID];
          long long v50 = [v49 UUIDString];
          [v37 addObject:v50];

          long long v51 = [v43 subSuggestionIDs];
          id v52 = [v51 count];

          if (v52)
          {
            id v53 = [v43 subSuggestionIDs];
            [v37 addObjectsFromArray:v53];
          }
          if (!v68 || ([v43 isAggregatedAndSuppressed] & 1) == 0)
          {
            [v43 setIsAggregatedAndSuppressed:!v68];
            [v43 setSummarizationGranularity:1];
          }
        }
        id v40 = [v38 countByEnumeratingWithState:&v69 objects:v81 count:16];
      }
      while (v40);
    }

    id v54 = [v36 copy];
    id v12 = v64;
    [(MOEventBundle *)v64 setSubBundleIDs:v54];

    id v55 = [v37 copy];
    [(MOEventBundle *)v64 setSubSuggestionIDs:v55];

    id v10 = v66;
    id v56 = [v62 getResourcesFromBundles:v38 forSummaryBundle:v64 withParameters:v66];
    [(MOEventBundle *)v64 setResources:v56];

    char v57 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      CFStringRef v58 = @"fine";
      if (v68) {
        CFStringRef v58 = @"coarse";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = v58;
      __int16 v79 = 2112;
      id v80 = v64;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "SummarizationUtilities: outing mega bundle being created: granularity, %@, bundle, %@", buf, 0x16u);
    }

    id v9 = v67;
    id v11 = v65;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)createActivityMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 isWeeklySummary:(BOOL)a6 timeZoneManager:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v113 = a4;
  id v12 = a7;
  id v13 = [v11 mutableCopy];
  id v14 = +[NSCalendar currentCalendar];
  id v15 = objc_alloc((Class)NSDate);
  uint64_t v16 = +[NSDate date];
  id v17 = [v15 initWithTimeInterval:v16 sinceDate:-604800.0];
  double v18 = [v14 startOfDayForDate:v17];

  BOOL v117 = v8;
  BOOL v114 = v9;
  int v19 = v9 && v8;
  if (v19 == 1)
  {
    id v20 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v133 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "SummarizationUtilities: the earliest date for activity bundle to be aggregated for weekly: %@", buf, 0xCu);
    }

    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = __131__MOSummarizationUtilities_createActivityMegaBundleFromBundles_withParameters_isCoarseGranularity_isWeeklySummary_timeZoneManager___block_invoke;
    v130[3] = &unk_1002CD8A0;
    v131 = *(id *)&v18;
    id v21 = +[NSPredicate predicateWithBlock:v130];
    [v13 filterUsingPredicate:v21];

    uint64_t v22 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      double v23 = COERCE_DOUBLE([v13 count]);
      *(_DWORD *)buf = 134217984;
      double v133 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SummarizationUtilities: bundle count in most recent 7 days: %lu", buf, 0xCu);
    }

    if (![v13 count])
    {
      unint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "SummarizationUtilities: no bundle available to create activity weekly bundle", buf, 2u);
      }
      goto LABEL_30;
    }
    id v108 = v12;
    id v110 = v11;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v105 = v13;
    unint64_t v24 = v13;
    id v25 = [v24 countByEnumeratingWithState:&v126 objects:v145 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v127;
      while (2)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v127 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = [*(id *)(*((void *)&v126 + 1) + 8 * i) rankingDictionary];
          id v30 = [v29 objectForKeyedSubscript:@"bundleGoodnessScore"];
          [v30 floatValue];
          float v32 = v31;

          id v33 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double v133 = v32;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "SummarizationUtilities: activity bundle goodness score, %f", buf, 0xCu);
          }

          [v113 activitySummary_suppressionGoodnessScoreThreshold];
          if (v32 > v34)
          {
            id v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "SummarizationUtilities: one of activity bundle goodness is too high. Stop creating weekly workout summary", buf, 2u);
            }

            id v12 = v108;
            id v11 = v110;
            id v13 = v105;
            goto LABEL_30;
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v126 objects:v145 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    if ((unint64_t)[v24 count] <= 3)
    {
      uint64_t v35 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      id v12 = v108;
      id v11 = v110;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        double v36 = COERCE_DOUBLE([v24 count]);
        *(_DWORD *)buf = 134217984;
        double v133 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "SummarizationUtilities: %lu bundles are not enough to create activity weekly bundle for coarse granularity", buf, 0xCu);
      }
      unint64_t v24 = v35;
      id v13 = v105;
LABEL_30:

      id v38 = 0;
      id v37 = v131;
      goto LABEL_70;
    }

    id v12 = v108;
    id v11 = v110;
    id v13 = v105;
    int v19 = 1;
    goto LABEL_32;
  }
  if ((unint64_t)[v13 count] > 1)
  {
LABEL_32:
    id v40 = [MOEventBundle alloc];
    uint64_t v41 = +[NSUUID UUID];
    long long v42 = +[NSDate date];
    id v38 = [(MOEventBundle *)v40 initWithBundleIdentifier:v41 creationDate:v42];

    [a1 updateRankMetaDataFrom:v13 forSummaryBundle:v38];
    long long v43 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v44 = [v13 copy];
    v104 = v43;
    float v144 = v43;
    long long v45 = +[NSArray arrayWithObjects:&v144 count:1];
    long long v46 = [v44 sortedArrayUsingDescriptors:v45];

    v116 = objc_opt_new();
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id obj = v46;
    id v47 = [obj countByEnumeratingWithState:&v122 objects:v143 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v123;
      do
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v123 != v49) {
            objc_enumerationMutation(obj);
          }
          long long v51 = [*(id *)(*((void *)&v122 + 1) + 8 * (void)j) events];
          [v116 addObjectsFromArray:v51];
        }
        id v48 = [obj countByEnumeratingWithState:&v122 objects:v143 count:16];
      }
      while (v48);
    }

    id v52 = [v116 allObjects];
    [(MOEventBundle *)v38 setEvents:v52];

    [(MOEventBundle *)v38 setPropertiesBasedOnEvents];
    if (v19)
    {
      [(MOEventBundle *)v38 setStartDate:*(void *)&v18];
      id v53 = +[NSDate date];
      [(MOEventBundle *)v38 setEndDate:v53];

      [(MOEventBundle *)v38 setBundleSuperType:2];
      [(MOEventBundle *)v38 setBundleSubType:202];
    }
    else
    {
      id v54 = [v11 getTimeSpanOfMOEventBundleArray];
      id v55 = [v54 startDate];
      [(MOEventBundle *)v38 setStartDate:v55];

      id v56 = [v54 endDate];
      [(MOEventBundle *)v38 setEndDate:v56];

      [(MOEventBundle *)v38 setBundleSuperType:2];
      [(MOEventBundle *)v38 setBundleSubType:201];
    }
    v103 = [a1 sortedWorkoutEventsFromBundle:v38];
    char v57 = [v103 lastObject];
    CFStringRef v58 = [v57 endDate];
    id v59 = +[MOTime timeForDate:v58 timeZoneManager:v12];
    [(MOEventBundle *)v38 setTime:v59];

    [(MOEventBundle *)v38 setInterfaceType:12];
    [a1 setActionsAndPlacesFromBundles:v11 forSummaryBundle:v38];
    if (v19)
    {
      long long v60 = [MOAction alloc];
      long long v61 = [a1 workoutMetaDataCreatedForBundles:obj];
      id v62 = [(MOAction *)v60 initWithActionName:@"workout" actionType:4 actionSubtype:0 actionMetaData:v61];
      [(MOEventBundle *)v38 setAction:v62];

      long long v63 = [(MOEventBundle *)v38 events];
      id v64 = [v63 firstObject];
      id v65 = [v64 eventIdentifier];
      id v66 = [(MOEventBundle *)v38 action];
      [v66 setSourceEventIdentifier:v65];
    }
    id v67 = [(MOEventBundle *)v38 action];

    id v109 = v12;
    id v111 = v11;
    double v107 = v18;
    if (v67)
    {
      BOOL v68 = [a1 workoutMetaDataCreatedForBundles:obj];
      long long v69 = [(MOEventBundle *)v38 action];
      [v69 setActionMetaData:v68];
    }
    else
    {
      long long v70 = [MOAction alloc];
      long long v71 = [a1 workoutMetaDataCreatedForBundles:obj];
      long long v72 = [(MOAction *)v70 initWithActionName:@"workout" actionType:4 actionSubtype:0 actionMetaData:v71];
      [(MOEventBundle *)v38 setAction:v72];

      BOOL v68 = [(MOEventBundle *)v38 events];
      long long v69 = [v68 firstObject];
      long long v73 = [v69 eventIdentifier];
      long long v74 = [(MOEventBundle *)v38 action];
      [v74 setSourceEventIdentifier:v73];
    }
    [v113 dominantBundle_mediaPlaySessionDominantFactorThreshold];
    double v76 = v75;
    [v113 dominantBundle_mediaPlaySessionsOverlapsMinimumDistance];
    [a1 setMediaActionForWorkoutBundle:v38 withMediaPlaySessionDominantFactorThreshold:v76 mediaPlaySessionsOverlapsMinimumDistance:v77];
    CFStringRef v78 = objc_opt_new();
    __int16 v79 = objc_opt_new();
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v106 = v13;
    id v80 = v13;
    id v81 = [v80 countByEnumeratingWithState:&v118 objects:v142 count:16];
    if (v81)
    {
      id v82 = v81;
      uint64_t v83 = *(void *)v119;
      do
      {
        for (k = 0; k != v82; k = (char *)k + 1)
        {
          if (*(void *)v119 != v83) {
            objc_enumerationMutation(v80);
          }
          long long v85 = *(void **)(*((void *)&v118 + 1) + 8 * (void)k);
          long long v86 = [v85 subBundleIDs];
          id v87 = [v86 count];

          if (v87)
          {
            long long v88 = [v85 subBundleIDs];
            [v78 addObjectsFromArray:v88];
          }
          else
          {
            long long v88 = [v85 bundleIdentifier];
            unint64_t v89 = [v88 UUIDString];
            [v78 addObject:v89];
          }
          float v90 = [v85 suggestionID];
          __int16 v91 = [v90 UUIDString];
          [v79 addObject:v91];

          if (!v117)
          {
            if (v114)
            {
              if (([v85 isAggregatedAndSuppressed] & 1) == 0) {
                [v85 setSummarizationGranularity:1];
              }
            }
            else
            {
              [v85 setIsAggregatedAndSuppressed:1];
            }
          }
          id v92 = [v78 copy];
          [(MOEventBundle *)v38 setSubBundleIDs:v92];

          id v93 = [v79 copy];
          [(MOEventBundle *)v38 setSubSuggestionIDs:v93];
        }
        id v82 = [v80 countByEnumeratingWithState:&v118 objects:v142 count:16];
      }
      while (v82);
    }

    id v94 = [a1 getResourcesFromBundles:obj forSummaryBundle:v38 withParameters:v113];
    [(MOEventBundle *)v38 setResources:v94];

    double v95 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      double v96 = [(MOEventBundle *)v38 startDate];
      __int16 v97 = [(MOEventBundle *)v38 endDate];
      uint64_t v98 = [(MOEventBundle *)v38 bundleIdentifier];
      unsigned int v99 = (void *)v98;
      CFStringRef v100 = @"NO";
      *(_DWORD *)buf = 138413314;
      double v133 = v96;
      if (v114) {
        CFStringRef v101 = @"YES";
      }
      else {
        CFStringRef v101 = @"NO";
      }
      __int16 v134 = 2112;
      v135 = v97;
      if (v117) {
        CFStringRef v100 = @"YES";
      }
      __int16 v136 = 2112;
      uint64_t v137 = v98;
      __int16 v138 = 2112;
      CFStringRef v139 = v101;
      __int16 v140 = 2112;
      CFStringRef v141 = v100;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "SummarizationUtilities: activity mega bundle being created: start date, %@, end date, %@, bundleID, %@, isCoarseGranularity, %@, isWeekly, %@", buf, 0x34u);
    }
    id v12 = v109;
    id v11 = v111;
    id v13 = v106;
    double v18 = v107;
    id v37 = v104;
    goto LABEL_70;
  }
  id v37 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v133 = COERCE_DOUBLE([v13 count]);
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "SummarizationUtilities: %lu bundles are not enough to create activity mega bundle", buf, 0xCu);
  }
  id v38 = 0;
LABEL_70:

  return v38;
}

id __131__MOSummarizationUtilities_createActivityMegaBundleFromBundles_withParameters_isCoarseGranularity_isWeeklySummary_timeZoneManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 startDate];
  id v4 = [v3 isOnOrAfter:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)isOutingBundleFromHomeOrWorkVisit:(id)a3
{
  [a1 sortedVisitEventsFromBundle:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "placeUserType", (void)v11) == (id)2 || objc_msgSend(v8, "placeUserType") == (id)2)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)isOutingBundleInsideOneDay:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  uint64_t v5 = [v3 time];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)v5;
  id v7 = [v3 time];
  BOOL v8 = [v7 timeZone];

  if (v8)
  {
    BOOL v9 = [v3 time];
    id v10 = [v9 timeZone];
    long long v11 = +[NSTimeZone timeZoneWithName:v10];
    long long v12 = [v3 startDate];
    long long v13 = [v4 componentsInTimeZone:v11 fromDate:v12];

    long long v14 = [v3 time];
    id v15 = [v14 timeZone];
    uint64_t v16 = +[NSTimeZone timeZoneWithName:v15];
    id v17 = [v3 endDate];
    double v18 = [v4 componentsInTimeZone:v16 fromDate:v17];
  }
  else
  {
LABEL_4:
    int v19 = [v3 startDate];
    long long v13 = [v4 components:28 fromDate:v19];

    long long v14 = [v3 endDate];
    double v18 = [v4 components:28 fromDate:v14];
  }

  id v20 = [v13 day];
  if (v20 == [v18 day] && (id v21 = objc_msgSend(v13, "month"), v21 == objc_msgSend(v18, "month")))
  {
    id v22 = [v13 year];
    BOOL v23 = v22 == [v18 year];
  }
  else
  {
    BOOL v23 = 0;
  }
  unint64_t v24 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    +[MOSummarizationUtilities isOutingBundleInsideOneDay:](v23, v24);
  }

  return v23;
}

+ (BOOL)isBundleWithAssets:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [a3 resources];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 type] == (id)2 || objc_msgSend(v8, "type") == (id)3)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

+ (BOOL)allPhotoAssetsFromBundleStartDay:(id)a3
{
  id v3 = a3;
  id v39 = +[NSCalendar currentCalendar];
  uint64_t v4 = [v3 time];
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = (void *)v4;
  uint64_t v6 = [v3 time];
  id v7 = [v6 timeZone];

  if (v7)
  {
    BOOL v8 = [v3 time];
    BOOL v9 = [v8 timeZone];
    id v10 = +[NSTimeZone timeZoneWithName:v9];
    long long v11 = [v3 startDate];
    long long v12 = [v39 componentsInTimeZone:v10 fromDate:v11];
  }
  else
  {
LABEL_4:
    BOOL v8 = [v3 startDate];
    long long v12 = [v39 components:28 fromDate:v8];
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v13 = [v3 resources];
  id v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v41;
    while (2)
    {
      id v17 = 0;
      id v38 = v15;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v17);
        if (objc_msgSend(v18, "type", v38) == (id)2)
        {
          int v19 = [v18 photoCreationDate];

          if (v19)
          {
            uint64_t v20 = [v3 time];
            if (!v20) {
              goto LABEL_15;
            }
            id v21 = (void *)v20;
            id v22 = [v3 time];
            BOOL v23 = [v22 timeZone];

            if (v23)
            {
              unint64_t v24 = [v3 time];
              id v25 = [v24 timeZone];
              id v26 = +[NSTimeZone timeZoneWithName:v25];
              [v18 photoCreationDate];
              uint64_t v27 = v16;
              id v28 = v12;
              id v29 = v13;
              v31 = id v30 = v3;
              float v32 = [v39 componentsInTimeZone:v26 fromDate:v31];

              id v3 = v30;
              long long v13 = v29;
              long long v12 = v28;
              uint64_t v16 = v27;
              id v15 = v38;
            }
            else
            {
LABEL_15:
              unint64_t v24 = [v18 photoCreationDate];
              float v32 = [v39 components:28 fromDate:v24];
            }

            id v33 = [v12 day];
            if (v33 != [v32 day]
              || (id v34 = [v12 month], v34 != objc_msgSend(v32, "month"))
              || (id v35 = [v12 year], v35 != objc_msgSend(v32, "year")))
            {

              BOOL v36 = 0;
              goto LABEL_24;
            }
          }
        }
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v36 = 1;
LABEL_24:

  return v36;
}

+ (BOOL)isBundle:(id)a3 insideTheSameDayAsOtherBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isOutingBundleInsideOneDay:v6]
    && [a1 isOutingBundleInsideOneDay:v7])
  {
    BOOL v8 = +[NSCalendar currentCalendar];
    uint64_t v9 = [v6 time];
    if (!v9) {
      goto LABEL_7;
    }
    id v10 = (void *)v9;
    long long v11 = [v6 time];
    long long v12 = [v11 timeZone];

    if (v12)
    {
      long long v13 = [v6 time];
      id v14 = [v13 timeZone];
      id v15 = +[NSTimeZone timeZoneWithName:v14];
      uint64_t v16 = [v6 startDate];
      id v17 = [v8 componentsInTimeZone:v15 fromDate:v16];
    }
    else
    {
LABEL_7:
      long long v13 = [v6 startDate];
      id v17 = [v8 components:28 fromDate:v13];
    }

    uint64_t v19 = [v7 time];
    if (!v19) {
      goto LABEL_11;
    }
    uint64_t v20 = (void *)v19;
    id v21 = [v7 time];
    id v22 = [v21 timeZone];

    if (v22)
    {
      BOOL v23 = [v6 time];
      unint64_t v24 = [v23 timeZone];
      id v25 = +[NSTimeZone timeZoneWithName:v24];
      id v26 = [v7 startDate];
      uint64_t v27 = [v8 componentsInTimeZone:v25 fromDate:v26];
    }
    else
    {
LABEL_11:
      BOOL v23 = [v7 startDate];
      uint64_t v27 = [v8 components:28 fromDate:v23];
    }

    id v28 = [v17 day];
    if (v28 == [v27 day] && (id v29 = objc_msgSend(v17, "month"), v29 == objc_msgSend(v27, "month")))
    {
      id v30 = [v17 year];
      BOOL v18 = v30 == [v27 year];
    }
    else
    {
      BOOL v18 = 0;
    }
    float v31 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      id v33 = [v6 startDate];
      id v34 = [v7 startDate];
      int v35 = 138412802;
      BOOL v36 = v33;
      __int16 v37 = 2112;
      id v38 = v34;
      __int16 v39 = 1024;
      BOOL v40 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "SummarizationUtilities: bundle 1 with start date, %@, and bundle 2 with start date, %@,  are inside one day: %d", (uint8_t *)&v35, 0x1Cu);
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

+ (id)mergeOutingBundlesWithInDayWithGroupedBundles:(id)a3 remainingSingletonBundles:(id)a4 parameters:(id)a5 isCoarseGranularity:(BOOL)a6 timeZoneManager:(id)a7
{
  BOOL v71 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = objc_opt_new();
  id v15 = objc_opt_new();
  if ([v10 count]) {
    [v15 addObjectsFromArray:v10];
  }
  if ([v11 count]) {
    [v15 addObjectsFromArray:v11];
  }
  if ([v15 count])
  {
    id v64 = v13;
    id v65 = v14;
    BOOL v68 = v12;
    id v66 = v11;
    id v67 = v10;
    long long v74 = objc_opt_new();
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v63 = v15;
    id obj = v15;
    id v76 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (!v76) {
      goto LABEL_41;
    }
    uint64_t v75 = *(void *)v82;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v82 != v75) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v16);
        BOOL v18 = +[NSCalendar currentCalendar];
        uint64_t v19 = [v17 time];
        if (!v19) {
          goto LABEL_14;
        }
        uint64_t v20 = (void *)v19;
        id v21 = [v17 time];
        id v22 = [v21 timeZone];

        if (v22)
        {
          BOOL v23 = [v17 time];
          unint64_t v24 = [v23 timeZone];
          id v25 = +[NSTimeZone timeZoneWithName:v24];
          id v26 = [v17 startDate];
          uint64_t v27 = [v18 componentsInTimeZone:v25 fromDate:v26];
        }
        else
        {
LABEL_14:
          BOOL v23 = [v17 startDate];
          uint64_t v27 = [v18 components:28 fromDate:v23];
        }

        id v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v27 year]);
        id v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v27 month]);
        id v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v27 day]);
        float v31 = [v28 stringByAppendingFormat:@"-%@-%@", v29, v30];
        float v32 = [v17 action];
        id v33 = [v32 actionType];

        if (v33 == (id)4)
        {
          id v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
            goto LABEL_22;
          }
          *(_WORD *)buf = 0;
          int v35 = v34;
          BOOL v36 = "bundle is mainly focusing on workout, so skip adding to groups";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, v36, buf, 2u);
          goto LABEL_22;
        }
        __int16 v37 = [v17 places];
        id v38 = [v37 count];

        if (v38)
        {
          id v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
            goto LABEL_22;
          }
          *(_WORD *)buf = 0;
          int v35 = v34;
          BOOL v36 = "bundle has many places related, so skip adding to groups";
          goto LABEL_21;
        }
        __int16 v39 = [v17 place];

        if (!v39)
        {
          id v34 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
            goto LABEL_22;
          }
          *(_WORD *)buf = 0;
          int v35 = v34;
          BOOL v36 = "there is no place in the bundle, so skip adding to groups";
          goto LABEL_21;
        }
        id v34 = [v17 place];
        if (!v34) {
          goto LABEL_22;
        }
        if ([a1 isOutingBundleInsideOneDay:v17])
        {

LABEL_33:
          long long v69 = [v17 place];
          long long v41 = [v69 placeName];
          id v34 = +[NSString stringWithFormat:@"%@-%@", v31, v41];

          long long v42 = [v74 objectForKeyedSubscript:v34];

          if (v42)
          {
            long long v43 = [v74 objectForKeyedSubscript:v34];
            [a1 maximumDistanceFromBundle:v17 toBundleCluster:v43];
            double v45 = v44;
            [v68 fineGranularity_outingBundlesAggregationDistanceThreshold];
            if (v45 < v46)
            {
              long long v70 = [v74 objectForKeyedSubscript:v34];
              [v70 addObject:v17];
            }
          }
          else
          {
            id v47 = objc_opt_new();
            [v74 setObject:v47 forKeyedSubscript:v34];

            long long v43 = [v74 objectForKeyedSubscript:v34];
            [v43 addObject:v17];
          }

          id v48 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            uint64_t v49 = [v17 startDate];
            *(_DWORD *)buf = 138412546;
            id v87 = v49;
            __int16 v88 = 2112;
            unint64_t v89 = v34;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "add bundle with start date %@ to group for key: %@", buf, 0x16u);
          }
LABEL_22:

          goto LABEL_23;
        }
        if ([a1 isOutingBundleInsideOneDay:v17]) {
          goto LABEL_22;
        }
        unsigned __int8 v40 = [a1 allPhotoAssetsFromBundleStartDay:v17];

        if (v40) {
          goto LABEL_33;
        }
LABEL_23:

        uint64_t v16 = (char *)v16 + 1;
      }
      while (v76 != v16);
      id v50 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
      id v76 = v50;
      if (!v50)
      {
LABEL_41:

        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v51 = v74;
        id v52 = [v74 allKeys];
        id v53 = [v52 countByEnumeratingWithState:&v77 objects:v85 count:16];
        id v13 = v64;
        id v14 = v65;
        id v12 = v68;
        if (v53)
        {
          id v54 = v53;
          uint64_t v55 = *(void *)v78;
          do
          {
            for (i = 0; i != v54; i = (char *)i + 1)
            {
              if (*(void *)v78 != v55) {
                objc_enumerationMutation(v52);
              }
              char v57 = [v51 objectForKeyedSubscript:*(void *)(*((void *)&v77 + 1) + 8 * i)];
              if ((unint64_t)[v57 count] >= 2)
              {
                CFStringRef v58 = [a1 createOutingMegaBundleFromBundles:v57 withParameters:v68 isCoarseGranularity:v71 timeZoneManager:v64];
                [v65 addObject:v58];

                long long v51 = v74;
              }
            }
            id v54 = [v52 countByEnumeratingWithState:&v77 objects:v85 count:16];
          }
          while (v54);
        }

        id v59 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          id v60 = [v65 count];
          *(_DWORD *)buf = 134218240;
          id v87 = v60;
          __int16 v88 = 1024;
          LODWORD(v89) = v71;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "number of bundles created for merging bundles to the same place within the same day, %lu, for coarse granulariy, %d", buf, 0x12u);
        }

        id v11 = v66;
        id v10 = v67;
        id v15 = v63;
        goto LABEL_55;
      }
    }
  }
  long long v61 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  long long v74 = v61;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "no candidate bundle for merging with in day and the same place", buf, 2u);
  }
LABEL_55:

  return v14;
}

+ (id)sortedWorkoutBundleByDuration:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_500];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

int64_t __58__MOSummarizationUtilities_sortedWorkoutBundleByDuration___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)a2 metaDataForRank];
  id v6 = [v5 objectForKeyedSubscript:@"WorkoutDuration"];
  [v6 floatValue];
  float v8 = v7;

  uint64_t v9 = [(MOEventBundle *)v4 metaDataForRank];

  id v10 = [v9 objectForKeyedSubscript:@"WorkoutDuration"];
  [v10 floatValue];
  float v12 = v11;

  if (v8 <= v12) {
    int64_t v13 = 0;
  }
  else {
    int64_t v13 = -1;
  }
  if (v8 < v12) {
    return 1;
  }
  else {
    return v13;
  }
}

+ (id)sortedBundleByPhotoAssetsCount:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_502];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

int64_t __59__MOSummarizationUtilities_sortedBundleByPhotoAssetsCount___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = +[NSPredicate predicateWithFormat:@"type == %lu", 2];
  float v7 = [(MOEventBundle *)v5 resources];

  float v8 = [v7 filteredArrayUsingPredicate:v6];
  float v9 = (float)(unint64_t)[v8 count];

  id v10 = [(MOEventBundle *)v4 resources];

  float v11 = [v10 filteredArrayUsingPredicate:v6];
  float v12 = (float)(unint64_t)[v11 count];

  if (v9 <= v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = -1;
  }
  if (v9 < v12) {
    int64_t v14 = 1;
  }
  else {
    int64_t v14 = v13;
  }

  return v14;
}

+ (id)sortedBundleByStartDate:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_504];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

int64_t __52__MOSummarizationUtilities_sortedBundleByStartDate___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [(MOEventBundle *)v4 startDate];
  float v7 = [(MOEventBundle *)v5 startDate];
  unsigned __int8 v8 = [v6 isBeforeDate:v7];

  if (v8)
  {
    int64_t v9 = 1;
  }
  else
  {
    id v10 = [(MOEventBundle *)v4 startDate];
    float v11 = [(MOEventBundle *)v5 startDate];
    id v12 = [v10 isAfterDate:v11];

    int64_t v9 = (uint64_t)((void)v12 << 63) >> 63;
  }

  return v9;
}

+ (BOOL)hasWorkoutRoute:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [a3 events];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        float v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) workoutLocationRoute];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

+ (BOOL)bundleHasOneWayRoute:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  float v7 = [a1 sortedActivityEventsFromBundle:a3];
  if (![v7 count]) {
    goto LABEL_6;
  }
  unsigned __int8 v8 = [v7 firstObject];
  long long v9 = [v8 workoutLocationRoute];
  if (v9)
  {
    long long v10 = [v7 lastObject];
    long long v11 = [v10 workoutLocationRoute];

    if (v11)
    {
      long long v12 = [v7 firstObject];
      uint64_t v13 = [v12 workoutLocationRoute];
      unsigned __int8 v8 = [v13 firstObject];

      long long v9 = [v7 lastObject];
      int64_t v14 = [v9 workoutLocationRoute];
      id v15 = [v14 lastObject];

      [v15 distanceFromLocation:v8];
      double v17 = v16;
      [v6 fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold];
      LOBYTE(v9) = v17 >= v18;

      goto LABEL_5;
    }
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_7;
  }
LABEL_5:

LABEL_7:
  return (char)v9;
}

+ (id)getInterestingDestination:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 place];

  if (v5)
  {
    id v6 = [v3 place];
    [v4 addObject:v6];
  }
  float v7 = [v3 places];

  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unsigned __int8 v8 = [v3 places];
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          [v4 addObject:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v10);
    }
  }
  id v13 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v25 = v13;
  int64_t v14 = +[NSArray arrayWithObjects:&v25 count:1];
  id v15 = [v4 sortedArrayUsingDescriptors:v14];

  if (![v15 count]) {
    goto LABEL_16;
  }
  double v16 = [v15 firstObject];
  if ([v16 placeUserType] == (id)1)
  {

LABEL_16:
    uint64_t v19 = 0;
    goto LABEL_17;
  }
  double v17 = [v15 firstObject];
  id v18 = [v17 placeUserType];

  if (v18 == (id)2) {
    goto LABEL_16;
  }
  uint64_t v19 = [v15 firstObject];
LABEL_17:

  return v19;
}

+ (id)sortedActivityEventsFromBundle:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"(%K = %lu OR %K = %lu) AND (%K != %lu)", @"category", 2, @"category", 16, @"provider", 5];
  id v6 = [v3 events];

  float v7 = [v6 filteredArrayUsingPredicate:v5];
  id v11 = v4;
  unsigned __int8 v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [v7 sortedArrayUsingDescriptors:v8];

  return v9;
}

+ (id)createTransitMegaBundleFromBundles:(id)a3 withParameters:(id)a4 isCoarseGranularity:(BOOL)a5 timeZoneManager:(id)a6 groupedOutingBundles:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v12 = [a3 mutableCopy];
  if ([v12 count] == (id)2)
  {
    id v68 = a1;
    long long v70 = v11;
    id v13 = [v12 firstObject];
    int64_t v14 = [v12 lastObject];
    id v15 = [MOEventBundle alloc];
    double v16 = +[NSUUID UUID];
    double v17 = +[NSDate date];
    id v18 = [(MOEventBundle *)v15 initWithBundleIdentifier:v16 creationDate:v17];

    uint64_t v19 = objc_opt_new();
    uint64_t v20 = [v13 bundleIdentifier];
    long long v21 = [v20 UUIDString];
    BOOL v71 = v19;
    [v19 addObject:v21];

    [v13 setIsAggregatedAndSuppressed:1];
    [(MOEventBundle *)v18 setInterfaceType:12];
    [(MOEventBundle *)v18 setBundleSuperType:2];
    long long v22 = [v13 action];
    id v23 = [v22 actionSubtype];

    if (v23 == (id)1) {
      [(MOEventBundle *)v18 setBundleSubType:205];
    }
    long long v24 = [v13 action];
    id v25 = [v24 actionSubtype];

    if (v25 == (id)2) {
      [(MOEventBundle *)v18 setBundleSubType:206];
    }
    [(MOEventBundle *)v18 setSummarizationGranularity:1];
    id v26 = [v13 action];
    [(MOEventBundle *)v18 setAction:v26];

    uint64_t v27 = [v13 concurrentMediaAction];
    [(MOEventBundle *)v18 setConcurrentMediaAction:v27];

    id v28 = [v13 endDate];
    id v29 = +[MOTime timeForDate:v28 timeZoneManager:v10];
    [(MOEventBundle *)v18 setTime:v29];

    id v30 = objc_opt_new();
    float v31 = [v13 events];
    [v30 addObjectsFromArray:v31];

    [(MOEventBundle *)v18 setEvents:v30];
    [(MOEventBundle *)v18 setPropertiesBasedOnEvents];
    float v32 = [v13 startDate];
    [(MOEventBundle *)v18 setStartDate:v32];

    id v33 = [v13 endDate];
    [(MOEventBundle *)v18 setEndDate:v33];

    id v34 = [v13 expirationDate];
    [(MOEventBundle *)v18 setExpirationDate:v34];

    int v35 = objc_opt_new();
    BOOL v36 = [v13 resources];
    [v35 addObjectsFromArray:v36];

    id v69 = v10;
    if ([v14 interfaceType] == (id)2
      && ([v70 containsObject:v14] & 1) == 0)
    {
      unsigned __int8 v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        long long v41 = [v13 suggestionID];
        long long v42 = [v14 suggestionID];
        *(_DWORD *)buf = 138412546;
        id v73 = v41;
        __int16 v74 = 2112;
        uint64_t v75 = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "SummarizationUtilities: Combining activity bundle and outing bundle for transit bundle, activity %@, outing, %@", buf, 0x16u);
      }
      long long v43 = [v14 events];
      [v30 addObjectsFromArray:v43];

      [(MOEventBundle *)v18 setEvents:v30];
      [(MOEventBundle *)v18 setPropertiesBasedOnEvents];
      double v44 = [v13 startDate];
      [(MOEventBundle *)v18 setStartDate:v44];

      double v45 = [v14 endDate];
      [(MOEventBundle *)v18 setEndDate:v45];

      float v46 = [v14 expirationDate];
      [(MOEventBundle *)v18 setExpirationDate:v46];

      uint64_t v47 = [v68 addResourcesFromOutingBundle:v14 toActivityBundle:v13];

      [v14 setIsAggregatedAndSuppressed:1];
      __int16 v37 = [v14 bundleIdentifier];
      id v48 = [v37 UUIDString];
      [v71 addObject:v48];

      int v35 = (void *)v47;
    }
    else
    {
      __int16 v37 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        id v38 = [v13 suggestionID];
        __int16 v39 = [v14 suggestionID];
        *(_DWORD *)buf = 138412546;
        id v73 = v38;
        __int16 v74 = 2112;
        uint64_t v75 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "SummarizationUtilities: Adding destination from timecontext bundle to activity bundle for transit bundle, activity %@, timecontext, %@", buf, 0x16u);
      }
    }

    id v49 = [v71 copy];
    [(MOEventBundle *)v18 setSubBundleIDs:v49];

    id v50 = objc_opt_new();
    long long v51 = +[MOSummarizationUtilities getInterestingDestination:v14];
    [v51 setPriorityScore:20000.0];
    [v50 addObject:v51];
    id v52 = [v13 place];

    if (v52)
    {
      id v53 = [v13 place];
      [(MOEventBundle *)v18 setPlace:v53];

      id v54 = [v13 place];
      [v50 addObject:v54];
    }
    [(MOEventBundle *)v18 setPlaces:v50];
    [(MOEventBundle *)v18 setResources:v35];
    if ([v14 interfaceType] == (id)2)
    {
      [v68 updateRankMetaDataFrom:v12 forSummaryBundle:v18];
LABEL_31:

      id v10 = v69;
      id v11 = v70;
      goto LABEL_32;
    }
    uint64_t v55 = [v13 rankingDictionary];
    [(MOEventBundle *)v18 setRankingDictionary:v55];

    id v56 = [v51 poiCategory];

    if (v56)
    {
      [v51 placeNameConfidence];
      if (v57 >= 0.9)
      {
        CFStringRef v58 = (void *)nonInterestingPOIcategories;
        id v59 = [v51 poiCategory];
        LODWORD(v58) = [v58 containsObject:v59];

        if (v58)
        {
          id v60 = &off_1002F9490;
LABEL_27:
          [(MOEventBundle *)v18 addMetaDataForRankForKey:@"PoiCategory" value:v60];
          goto LABEL_29;
        }
      }
      [v51 placeNameConfidence];
      if (v61 >= 0.9)
      {
        id v62 = (void *)interestingPOIcategories;
        long long v63 = [v51 poiCategory];
        LODWORD(v62) = [v62 containsObject:v63];

        if (v62)
        {
          id v60 = &off_1002F94A0;
          goto LABEL_27;
        }
      }
      id v64 = +[NSNull null];
      [(MOEventBundle *)v18 addMetaDataForRankForKey:@"PoiCategory" value:v64];
    }
LABEL_29:
    [v51 familiarityIndexLOI];
    if (v65 != -1.0)
    {
      [v51 familiarityIndexLOI];
      id v66 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventBundle *)v18 addMetaDataForRankForKey:@"FamiliarityIndex" value:v66];
    }
    goto LABEL_31;
  }
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v73 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "SummarizationUtilities: %lu bundle(s) does not meet count requirement to create transit mega bundle for fine granularity", buf, 0xCu);
  }
  id v18 = 0;
LABEL_32:

  return v18;
}

+ (id)addResourcesFromOutingBundle:(id)a3 toActivityBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float v7 = objc_opt_new();
  unsigned __int8 v8 = [v6 resources];
  id v166 = v7;
  [v7 addObjectsFromArray:v8];

  id v9 = NSAssertionHandler_ptr;
  uint64_t v10 = +[NSPredicate predicateWithFormat:@"type == %lu", 2];
  id v11 = [v6 resources];
  id v12 = [v11 filteredArrayUsingPredicate:v10];

  id v13 = [v5 resources];
  v160 = (void *)v10;
  int64_t v14 = [v13 filteredArrayUsingPredicate:v10];

  id v161 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"priorityScore" ascending:1];
  if ([v14 count] && !objc_msgSend(v12, "count"))
  {
    id v220 = v161;
    id v15 = +[NSArray arrayWithObjects:&v220 count:1];
    double v16 = [v14 sortedArrayUsingDescriptors:v15];

    long long v201 = 0u;
    long long v202 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v199 objects:v219 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v200;
      double v21 = 202.0;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v200 != v20) {
            objc_enumerationMutation(v17);
          }
          id v23 = *(void **)(*((void *)&v199 + 1) + 8 * i);
          [v23 setPriorityScore:v21];
          double v21 = v21 + 1.0;
          [v166 addObject:v23];
        }
        id v19 = [v17 countByEnumeratingWithState:&v199 objects:v219 count:16];
      }
      while (v19);
    }

    id v9 = NSAssertionHandler_ptr;
  }
  v155 = v14;
  v156 = v12;
  v158 = v6;
  if ([v14 count] && objc_msgSend(v12, "count"))
  {
    id v218 = v161;
    long long v24 = +[NSArray arrayWithObjects:&v218 count:1];
    id v25 = [v12 sortedArrayUsingDescriptors:v24];

    id v217 = v161;
    id v26 = +[NSArray arrayWithObjects:&v217 count:1];
    uint64_t v27 = [v14 sortedArrayUsingDescriptors:v26];

    id v28 = objc_opt_new();
    id v29 = [v25 lastObject];
    [v29 priorityScore];
    double v31 = v30;

    long long v197 = 0u;
    long long v198 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    id v32 = v25;
    id v33 = [v32 countByEnumeratingWithState:&v195 objects:v216 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v196;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v196 != v35) {
            objc_enumerationMutation(v32);
          }
          __int16 v37 = [*(id *)(*((void *)&v195 + 1) + 8 * (void)j) assets];
          [v28 addObject:v37];
        }
        id v34 = [v32 countByEnumeratingWithState:&v195 objects:v216 count:16];
      }
      while (v34);
    }
    id v38 = v5;

    long long v193 = 0u;
    long long v194 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    id v39 = v27;
    id v40 = [v39 countByEnumeratingWithState:&v191 objects:v215 count:16];
    if (v40)
    {
      id v41 = v40;
      double v42 = v31 + 1.0;
      uint64_t v43 = *(void *)v192;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v192 != v43) {
            objc_enumerationMutation(v39);
          }
          double v45 = *(void **)(*((void *)&v191 + 1) + 8 * (void)k);
          float v46 = [v45 assets];
          unsigned __int8 v47 = [v28 containsObject:v46];

          if ((v47 & 1) == 0)
          {
            [v45 setPriorityScore:v42];
            double v42 = v42 + 1.0;
            id v48 = [v45 assets];
            [v28 addObject:v48];

            [v166 addObject:v45];
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v191 objects:v215 count:16];
      }
      while (v41);
    }

    id v5 = v38;
    id v6 = v158;
    id v9 = NSAssertionHandler_ptr;
  }
  uint64_t v49 = [v9[37] predicateWithFormat:@"type == %lu", 3];
  id v50 = [v6 resources];
  long long v51 = [v50 filteredArrayUsingPredicate:v49];

  id v52 = [v5 resources];
  v154 = (void *)v49;
  id v53 = [v52 filteredArrayUsingPredicate:v49];

  if ([v53 count] && !objc_msgSend(v51, "count"))
  {
    id v214 = v161;
    id v54 = +[NSArray arrayWithObjects:&v214 count:1];
    uint64_t v55 = [v53 sortedArrayUsingDescriptors:v54];

    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id v56 = v55;
    id v57 = [v56 countByEnumeratingWithState:&v187 objects:v213 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v188;
      double v60 = 300.0;
      do
      {
        for (m = 0; m != v58; m = (char *)m + 1)
        {
          if (*(void *)v188 != v59) {
            objc_enumerationMutation(v56);
          }
          id v62 = *(void **)(*((void *)&v187 + 1) + 8 * (void)m);
          [v62 setPriorityScore:v60];
          double v60 = v60 + 1.0;
          [v166 addObject:v62];
        }
        id v58 = [v56 countByEnumeratingWithState:&v187 objects:v213 count:16];
      }
      while (v58);
    }

    id v9 = NSAssertionHandler_ptr;
  }
  v152 = v53;
  v153 = v51;
  if ([v53 count] && objc_msgSend(v51, "count"))
  {
    id v212 = v161;
    long long v63 = +[NSArray arrayWithObjects:&v212 count:1];
    id v64 = [v51 sortedArrayUsingDescriptors:v63];

    id v211 = v161;
    double v65 = +[NSArray arrayWithObjects:&v211 count:1];
    id v66 = [v53 sortedArrayUsingDescriptors:v65];

    id v67 = objc_opt_new();
    id v68 = [v64 lastObject];
    [v68 priorityScore];
    double v70 = v69 + 1.0;

    BOOL v71 = [v64 lastObject];
    [v71 priorityScore];
    double v73 = v72;

    if (v73 == 201.0) {
      double v74 = 300.0;
    }
    else {
      double v74 = v70;
    }
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id v75 = v64;
    id v76 = [v75 countByEnumeratingWithState:&v183 objects:v210 count:16];
    if (v76)
    {
      id v77 = v76;
      uint64_t v78 = *(void *)v184;
      do
      {
        for (n = 0; n != v77; n = (char *)n + 1)
        {
          if (*(void *)v184 != v78) {
            objc_enumerationMutation(v75);
          }
          long long v80 = [*(id *)(*((void *)&v183 + 1) + 8 * (void)n) name];
          [v67 addObject:v80];
        }
        id v77 = [v75 countByEnumeratingWithState:&v183 objects:v210 count:16];
      }
      while (v77);
    }
    id v81 = v5;

    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    id v82 = v66;
    id v83 = [v82 countByEnumeratingWithState:&v179 objects:v209 count:16];
    if (v83)
    {
      id v84 = v83;
      uint64_t v85 = *(void *)v180;
      do
      {
        for (ii = 0; ii != v84; ii = (char *)ii + 1)
        {
          if (*(void *)v180 != v85) {
            objc_enumerationMutation(v82);
          }
          id v87 = *(void **)(*((void *)&v179 + 1) + 8 * (void)ii);
          __int16 v88 = [v87 name];
          unsigned __int8 v89 = [v67 containsObject:v88];

          if ((v89 & 1) == 0)
          {
            [v87 setPriorityScore:v74];
            double v74 = v74 + 1.0;
            float v90 = [v87 name];
            [v67 addObject:v90];

            [v166 addObject:v87];
          }
        }
        id v84 = [v82 countByEnumeratingWithState:&v179 objects:v209 count:16];
      }
      while (v84);
    }

    id v5 = v81;
    id v6 = v158;
    id v9 = NSAssertionHandler_ptr;
  }
  __int16 v91 = [v166 filteredArrayUsingPredicate:v160];
  if ([v91 count])
  {
    id v92 = [v6 action];
    id v93 = [v92 actionSubtype];

    if (v93 == (id)2)
    {
      id v208 = v161;
      id v94 = +[NSArray arrayWithObjects:&v208 count:1];
      double v95 = [v91 sortedArrayUsingDescriptors:v94];

      double v96 = [v95 firstObject];
      [v96 setPriorityScore:99.0];
    }
  }
  v151 = v91;
  uint64_t v97 = [v9[37] predicateWithFormat:@"%K = %lu", @"category", 24];
  v149 = [v9[37] predicateWithFormat:@"%K = %lu", @"provider", 1];
  v150 = (void *)v97;
  v207[0] = v97;
  v207[1] = v149;
  uint64_t v98 = +[NSArray arrayWithObjects:v207 count:2];
  uint64_t v99 = +[NSCompoundPredicate andPredicateWithSubpredicates:v98];

  v165 = objc_opt_new();
  CFStringRef v100 = [v6 events];
  v159 = (void *)v99;
  CFStringRef v101 = [v100 filteredArrayUsingPredicate:v99];

  float v102 = objc_opt_new();
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id obj = v101;
  id v103 = [obj countByEnumeratingWithState:&v175 objects:v206 count:16];
  if (v103)
  {
    id v104 = v103;
    uint64_t v105 = *(void *)v176;
    do
    {
      for (jj = 0; jj != v104; jj = (char *)jj + 1)
      {
        if (*(void *)v176 != v105) {
          objc_enumerationMutation(obj);
        }
        double v107 = *(void **)(*((void *)&v175 + 1) + 8 * (void)jj);
        id v108 = [v107 identifierFromProvider];
        unsigned __int8 v109 = [v102 containsObject:v108];

        if ((v109 & 1) == 0)
        {
          id v110 = [v107 identifierFromProvider];
          [v102 addObject:v110];

          [v165 addObject:v107];
        }
      }
      id v104 = [obj countByEnumeratingWithState:&v175 objects:v206 count:16];
    }
    while (v104);
  }

  id v111 = [v5 events];
  v112 = [v111 filteredArrayUsingPredicate:v159];

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v162 = v112;
  id v113 = [v162 countByEnumeratingWithState:&v171 objects:v205 count:16];
  if (v113)
  {
    id v114 = v113;
    uint64_t v115 = *(void *)v172;
    do
    {
      for (kk = 0; kk != v114; kk = (char *)kk + 1)
      {
        if (*(void *)v172 != v115) {
          objc_enumerationMutation(v162);
        }
        BOOL v117 = *(void **)(*((void *)&v171 + 1) + 8 * (void)kk);
        long long v118 = [v117 identifierFromProvider];
        unsigned __int8 v119 = [v102 containsObject:v118];

        if ((v119 & 1) == 0) {
          [v165 addObject:v117];
        }
      }
      id v114 = [v162 countByEnumeratingWithState:&v171 objects:v205 count:16];
    }
    while (v114);
  }
  v157 = v5;

  id v148 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
  id v204 = v148;
  long long v120 = +[NSArray arrayWithObjects:&v204 count:1];
  long long v121 = [v165 sortedArrayUsingDescriptors:v120];

  long long v122 = objc_opt_new();
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  id v123 = v121;
  id v124 = [v123 countByEnumeratingWithState:&v167 objects:v203 count:16];
  if (v124)
  {
    id v125 = v124;
    uint64_t v164 = *(void *)v168;
    do
    {
      for (mm = 0; mm != v125; mm = (char *)mm + 1)
      {
        if (*(void *)v168 != v164) {
          objc_enumerationMutation(v123);
        }
        long long v127 = *(void **)(*((void *)&v167 + 1) + 8 * (void)mm);
        long long v128 = [v127 startDate];
        [v128 timeIntervalSince1970];
        long long v129 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v122 setObject:v129 forKey:@"MOStateOfMindMetaDataKeyStartDate"];

        v130 = [v127 endDate];
        [v130 timeIntervalSince1970];
        v131 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v122 setObject:v131 forKey:@"MOStateOfMindMetaDataKeyEndDate"];

        v132 = [v127 stateOfMindEvent];
        double v133 = [v132 labels];
        [v122 setObject:v133 forKey:@"MOStateOfMindMetaDataKeyLabel"];

        __int16 v134 = [v127 stateOfMindEvent];
        v135 = [v134 domains];
        [v122 setObject:v135 forKey:@"MOStateOfMindMetaDataKeyDomain"];

        __int16 v136 = [v127 stateOfMindEvent];
        [v136 reflectiveInterval];
        uint64_t v137 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v122 setObject:v137 forKey:@"MOStateOfMindMetaDataKeyReflectiveInterval"];

        __int16 v138 = [v127 stateOfMindEvent];
        [v138 valence];
        CFStringRef v139 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v122 setObject:v139 forKey:@"MOStateOfMindMetaDataKeyValence"];

        __int16 v140 = [v127 stateOfMindEvent];
        [v140 valenceClassification];
        CFStringRef v141 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v122 setObject:v141 forKey:@"MOStateOfMindMetaDataKeyValenceClassification"];

        v142 = [v127 identifierFromProvider];
        [v122 setObject:v142 forKey:@"MOStateOfMindMetaDataKeyStateOfMindID"];

        v143 = [[MOResource alloc] initWithName:@"StateOfMind" type:16 dict:v122 value:0.0];
        float v144 = [v127 identifierFromProvider];
        [(MOResource *)v143 setAssets:v144];

        float v145 = [v127 eventIdentifier];
        [(MOResource *)v143 setSourceEventIdentifier:v145];

        [(MOResource *)v143 setSourceEventAccessType:8];
        v146 = [v123 firstObject];

        if (v146 == v127) {
          [(MOResource *)v143 setPriorityScore:202.0];
        }
        [v166 addObject:v143];
      }
      id v125 = [v123 countByEnumeratingWithState:&v167 objects:v203 count:16];
    }
    while (v125);
  }

  +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:v158 withEmotionEvents:v165];

  return v166;
}

+ (BOOL)isFlightBundle:(id)a3
{
  id v3 = [a3 action];
  BOOL v4 = [v3 actionType] == (id)11;

  return v4;
}

+ (id)summarizeMotionActivityBundlesWithSamePlaceName:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v85 = a4;
  id v84 = (id)objc_opt_new();
  float v7 = NSAssertionHandler_ptr;
  unsigned __int8 v8 = +[NSPredicate predicateWithFormat:@"(%K = %lu OR %K = %lu OR %K = %lu) AND %K == NO", @"bundleSubType", 204, @"bundleSubType", 207, @"bundleSubType", 206, @"isAggregatedAndSuppressed"];
  id v9 = [v6 filteredArrayUsingPredicate:v8];
  id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v113 = v10;
  id v11 = +[NSArray arrayWithObjects:&v113 count:1];
  id v12 = [v9 sortedArrayUsingDescriptors:v11];

  id v13 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v110 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Summarization: Found %lu bundles containing phone walks eligible for summarization", buf, 0xCu);
  }

  if ((unint64_t)[v12 count] >= 2)
  {
    id v72 = v10;
    double v73 = v9;
    double v74 = v8;
    id v75 = v6;
    int64_t v14 = +[NSCalendar currentCalendar];
    id v15 = [v12 firstObject];
    double v16 = [v15 startDate];
    id v17 = [v14 components:28 fromDate:v16];

    id v18 = [v14 dateFromComponents:v17];
    id v19 = [v12 lastObject];
    uint64_t v20 = [v19 startDate];
    uint64_t v21 = [v14 components:28 fromDate:v20];

    BOOL v71 = (void *)v21;
    long long v22 = [v14 dateFromComponents:v21];
    id v23 = [v14 dateByAddingUnit:16 value:1 toDate:v22 options:0];

    id v24 = v18;
    id v76 = v24;
    if ([v24 compare:v23] == (id)-1)
    {
      uint64_t v78 = v14;
      long long v79 = v12;
      id v77 = v23;
      while (1)
      {
        id v25 = v24;
        id v26 = [v14 dateByAddingUnit:16 value:1 toDate:v25 options:0];
        uint64_t v27 = v7[37];
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = __91__MOSummarizationUtilities_summarizeMotionActivityBundlesWithSamePlaceName_withParameters___block_invoke;
        v103[3] = &unk_1002C9B90;
        id v83 = v25;
        id v104 = v83;
        id v82 = v26;
        id v105 = v82;
        id v81 = [v27 predicateWithBlock:v103];
        id v28 = [v12 filteredArrayUsingPredicate:];
        id v29 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          id v30 = [v28 count];
          *(_DWORD *)buf = 134218242;
          id v110 = v30;
          __int16 v111 = 2112;
          id v112 = v83;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Summarization: Found %lu bundles containing phone walks for %@", buf, 0x16u);
        }

        double v31 = v28;
        if ((unint64_t)[v28 count] >= 2) {
          break;
        }
LABEL_61:

        id v24 = [v14 dateByAddingUnit:16 value:1 toDate:v83 options:0];

        if ([v24 compare:v23] != (id)-1) {
          goto LABEL_62;
        }
      }
      id v32 = objc_opt_new();
      float v90 = objc_opt_new();
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v80 = v28;
      id v33 = v28;
      __int16 v88 = v32;
      id v89 = [v33 countByEnumeratingWithState:&v99 objects:v108 count:16];
      if (!v89) {
        goto LABEL_41;
      }
      uint64_t v34 = *(void *)v100;
      uint64_t v86 = *(void *)v100;
      id v87 = v33;
LABEL_11:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v100 != v34) {
          objc_enumerationMutation(v33);
        }
        BOOL v36 = *(void **)(*((void *)&v99 + 1) + 8 * v35);
        __int16 v37 = [v36 place];
        uint64_t v38 = [v37 placeName];
        if (!v38) {
          break;
        }
        id v39 = (void *)v38;
        id v40 = [v36 place];
        id v41 = [v40 startDate];

        if (!v41) {
          goto LABEL_18;
        }
        id v42 = [v36 place];
LABEL_33:
        id v52 = [a1 concatenatePlaceNameAndPlaceStart:v42];
        if (v52)
        {
          id v53 = [v32 objectForKey:v52];

          if (v53)
          {
            id v54 = [v32 objectForKeyedSubscript:v52];
            [v54 addObject:v36];
          }
          else
          {
            id v54 = objc_opt_new();
            [v54 addObject:v36];
            [v32 setObject:v54 forKey:v52];
          }

          uint64_t v55 = [v90 objectForKey:v52];

          if (!v55) {
            [v90 setObject:v42 forKey:v52];
          }
        }

        if ((id)++v35 == v89)
        {
          id v89 = [v33 countByEnumeratingWithState:&v99 objects:v108 count:16];
          if (!v89)
          {
LABEL_41:

            id v56 = [v32 allKeys];
            id v57 = [v56 count];

            if (v57)
            {
              long long v93 = 0u;
              long long v94 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              id v58 = [v32 allKeys];
              id v59 = [v58 countByEnumeratingWithState:&v91 objects:v106 count:16];
              if (v59)
              {
                id v60 = v59;
                uint64_t v61 = *(void *)v92;
                do
                {
                  for (i = 0; i != v60; i = (char *)i + 1)
                  {
                    if (*(void *)v92 != v61) {
                      objc_enumerationMutation(v58);
                    }
                    uint64_t v63 = *(void *)(*((void *)&v91 + 1) + 8 * i);
                    id v64 = [v32 objectForKeyedSubscript:v63];
                    double v65 = [v90 objectForKeyedSubscript:v63];
                    if ((unint64_t)[v64 count] >= 2
                      && [v65 placeUserType] != (id)1
                      && [v65 placeUserType] != (id)2)
                    {
                      id v66 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
                      {
                        id v67 = [v64 count];
                        *(_DWORD *)buf = 134218242;
                        id v110 = v67;
                        __int16 v111 = 2112;
                        id v112 = v83;
                        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Summarization: Found %lu bundles containing phone walks with the same place for %@", buf, 0x16u);
                      }

                      id v68 = [a1 createMotionActivityMegaBundleFromBundles:v64 withSamePlace:v65 withParameters:v85];
                      if (v68)
                      {
                        double v69 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v110 = v68;
                          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Summarization: Created phone walk mega bundle, %@", buf, 0xCu);
                        }

                        [v84 addObject:v68];
                      }
                    }
                    id v32 = v88;
                  }
                  id v60 = [v58 countByEnumeratingWithState:&v91 objects:v106 count:16];
                }
                while (v60);
              }
            }
            float v7 = NSAssertionHandler_ptr;
            int64_t v14 = v78;
            id v12 = v79;
            id v23 = v77;
            double v31 = v80;
            goto LABEL_61;
          }
          goto LABEL_11;
        }
      }

LABEL_18:
      uint64_t v43 = [v36 places];

      if (v43)
      {
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        double v44 = [v36 places];
        id v42 = [v44 countByEnumeratingWithState:&v95 objects:v107 count:16];
        if (v42)
        {
          id v45 = a1;
          uint64_t v46 = *(void *)v96;
          while (2)
          {
            for (j = 0; j != v42; j = (char *)j + 1)
            {
              if (*(void *)v96 != v46) {
                objc_enumerationMutation(v44);
              }
              id v48 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
              uint64_t v49 = [v48 placeName];
              if (v49)
              {
                id v50 = (void *)v49;
                long long v51 = [v48 startDate];

                if (v51)
                {
                  id v42 = v48;
                  goto LABEL_31;
                }
              }
            }
            id v42 = [v44 countByEnumeratingWithState:&v95 objects:v107 count:16];
            if (v42) {
              continue;
            }
            break;
          }
LABEL_31:
          a1 = v45;
          id v33 = v87;
          id v32 = v88;
          uint64_t v34 = v86;
        }
      }
      else
      {
        id v42 = 0;
      }
      goto LABEL_33;
    }
LABEL_62:

    unsigned __int8 v8 = v74;
    id v6 = v75;
    id v10 = v72;
    id v9 = v73;
  }

  return v84;
}

uint64_t __91__MOSummarizationUtilities_summarizeMotionActivityBundlesWithSamePlaceName_withParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 startDate];
  unsigned int v5 = [v4 isOnOrAfter:*(void *)(a1 + 32)];

  id v6 = [v3 startDate];

  uint64_t v7 = v5 & [v6 isBeforeDate:*(void *)(a1 + 40)];
  return v7;
}

+ (id)concatenatePlaceNameAndPlaceStart:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && ([v3 placeName], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 startDate];

    if (v7)
    {
      unsigned __int8 v8 = objc_opt_new();
      id v9 = [v4 placeName];
      [v8 addObject:v9];

      id v10 = [v4 startDate];
      [v10 timeIntervalSinceReferenceDate];
      id v12 = +[NSString stringWithFormat:@"%f", v11];
      [v8 addObject:v12];

      uint64_t v7 = [v8 componentsJoinedByString:@":"];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)createMotionActivityMegaBundleFromBundles:(id)a3 withSamePlace:(id)a4 withParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] < 2)
  {
    uint64_t v11 = 0;
    goto LABEL_93;
  }
  id v133 = a1;
  __int16 v138 = v9;
  CFStringRef v139 = v10;
  v147 = objc_opt_new();
  v146 = objc_opt_new();
  id v12 = objc_opt_new();
  v157 = objc_opt_new();
  v156 = objc_opt_new();
  v155 = objc_opt_new();
  v154 = objc_opt_new();
  v159 = objc_opt_new();
  CFStringRef v141 = objc_opt_new();
  id v13 = objc_opt_new();
  v158 = objc_opt_new();
  float v145 = objc_opt_new();
  id v140 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v137 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"priorityScore" ascending:1];
  id v136 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v188 = v136;
  int64_t v14 = +[NSArray arrayWithObjects:&v188 count:1];
  id v135 = v8;
  id v15 = [v8 sortedArrayUsingDescriptors:v14];

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id obj = v15;
  id v148 = [obj countByEnumeratingWithState:&v177 objects:v187 count:16];
  if (v148)
  {
    uint64_t v143 = *(void *)v178;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v178 != v143) {
          objc_enumerationMutation(obj);
        }
        uint64_t v152 = v16;
        id v17 = *(void **)(*((void *)&v177 + 1) + 8 * v16);
        id v18 = [v17 bundleIdentifier];
        id v19 = [v18 UUIDString];
        [v147 addObject:v19];

        uint64_t v20 = [v17 suggestionID];
        uint64_t v21 = [v20 UUIDString];
        [v146 addObject:v21];

        long long v175 = 0u;
        long long v176 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        v150 = v17;
        long long v22 = [v17 events];
        id v23 = [v22 countByEnumeratingWithState:&v173 objects:v186 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v174;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v174 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void **)(*((void *)&v173 + 1) + 8 * i);
              id v28 = [v27 eventIdentifier];
              id v29 = [v28 UUIDString];
              unsigned __int8 v30 = [v12 containsObject:v29];

              if ((v30 & 1) == 0)
              {
                if ([v27 category] == (id)16 && objc_msgSend(v27, "provider") != (id)5) {
                  [v157 addObject:v27];
                }
                if ([v27 category] == (id)1 && objc_msgSend(v27, "provider") != (id)5) {
                  [v156 addObject:v27];
                }
                if ([v27 category] == (id)6 && objc_msgSend(v27, "provider") != (id)5) {
                  [v155 addObject:v27];
                }
                if ([v27 category] == (id)24 && objc_msgSend(v27, "provider") != (id)5)
                {
                  double v31 = [v27 identifierFromProvider];
                  unsigned __int8 v32 = [v158 containsObject:v31];

                  if ((v32 & 1) == 0)
                  {
                    [v154 addObject:v27];
                    id v33 = [v27 identifierFromProvider];
                    [v158 addObject:v33];
                  }
                }
                if ([v27 provider] == (id)5) {
                  [v159 addObject:v27];
                }
              }
              uint64_t v34 = [v27 eventIdentifier];
              uint64_t v35 = [v34 UUIDString];
              unsigned __int8 v36 = [v12 containsObject:v35];

              if ((v36 & 1) == 0)
              {
                __int16 v37 = [v27 eventIdentifier];
                uint64_t v38 = [v37 UUIDString];
                [v12 addObject:v38];
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v173 objects:v186 count:16];
          }
          while (v24);
        }

        long long v171 = 0u;
        long long v172 = 0u;
        long long v169 = 0u;
        long long v170 = 0u;
        id v39 = [v150 resources];
        id v40 = [v39 countByEnumeratingWithState:&v169 objects:v185 count:16];
        if (v40)
        {
          id v41 = v40;
          uint64_t v42 = *(void *)v170;
          do
          {
            for (j = 0; j != v41; j = (char *)j + 1)
            {
              if (*(void *)v170 != v42) {
                objc_enumerationMutation(v39);
              }
              double v44 = *(void **)(*((void *)&v169 + 1) + 8 * (void)j);
              if ([v44 type] == (id)2)
              {
                id v45 = [v44 assets];
                unsigned __int8 v46 = [v13 containsObject:v45];

                if ((v46 & 1) == 0)
                {
                  unsigned __int8 v47 = [v44 assets];
                  [v13 addObject:v47];

                  [v145 addObject:v44];
                }
              }
            }
            id v41 = [v39 countByEnumeratingWithState:&v169 objects:v185 count:16];
          }
          while (v41);
        }

        uint64_t v16 = v152 + 1;
      }
      while ((id)(v152 + 1) != v148);
      id v148 = [obj countByEnumeratingWithState:&v177 objects:v187 count:16];
    }
    while (v148);
  }

  id v184 = v140;
  id v48 = +[NSArray arrayWithObjects:&v184 count:1];
  uint64_t v49 = [v157 sortedArrayUsingDescriptors:v48];

  [v141 addObjectsFromArray:v49];
  if ([v156 count]) {
    [v141 addObjectsFromArray:v156];
  }
  id v50 = v159;
  id v10 = v139;
  if ([v159 count]) {
    [v141 addObjectsFromArray:v159];
  }
  v153 = v49;
  if ((unint64_t)[v49 count] >= 2)
  {
    unint64_t v51 = 1;
    while (1)
    {
      id v52 = [v49 objectAtIndex:v51];
      unint64_t v53 = v51 - 1;
      id v54 = [v49 objectAtIndex:v53];
      uint64_t v55 = [(MOEventBundle *)v52 startDate];
      id v56 = [v54 endDate];
      unsigned int v57 = [v55 isAfterDate:v56];

      if (v57)
      {
        id v58 = [(MOEventBundle *)v52 startDate];
        id v59 = [v54 endDate];
        [v58 timeIntervalSinceDate:v59];
        double v61 = v60;

        [v139 motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace];
        if (v61 > v62) {
          break;
        }
      }

      uint64_t v49 = v153;
      unint64_t v51 = v53 + 2;
      if ((unint64_t)[v153 count] <= v51) {
        goto LABEL_54;
      }
    }
    v151 = v52;
    uint64_t v11 = 0;
    id v9 = v138;
    __int16 v88 = v153;
    id v8 = v135;
    goto LABEL_92;
  }
LABEL_54:
  uint64_t v63 = [MOEventBundle alloc];
  id v64 = +[NSUUID UUID];
  double v65 = +[NSDate date];
  id v66 = [(MOEventBundle *)v63 initWithBundleIdentifier:v64 creationDate:v65];

  [(MOEventBundle *)v66 setInterfaceType:1];
  [(MOEventBundle *)v66 setBundleSuperType:2];
  id v67 = [v49 firstObject];
  id v68 = [v67 motionActivityEvent];
  id v69 = [v68 motionType];

  if (v69 == (id)2)
  {
    uint64_t v70 = 204;
    BOOL v71 = v154;
  }
  else
  {
    id v72 = [v49 firstObject];
    double v73 = [v72 motionActivityEvent];
    id v74 = [v73 motionType];

    BOOL v75 = v74 == (id)3;
    BOOL v71 = v154;
    if (!v75) {
      goto LABEL_60;
    }
    uint64_t v70 = 207;
  }
  [(MOEventBundle *)v66 setBundleSubType:v70];
LABEL_60:
  id v76 = [v147 copy];
  [(MOEventBundle *)v66 setSubBundleIDs:v76];

  id v77 = [v146 copy];
  [(MOEventBundle *)v66 setSubSuggestionIDs:v77];

  [(MOEventBundle *)v66 setEvents:v141];
  [(MOEventBundle *)v66 setPropertiesBasedOnEvents];
  uint64_t v78 = [obj firstObject];
  long long v79 = [v78 startDate];
  [(MOEventBundle *)v66 setStartDate:v79];

  long long v80 = [obj lastObject];
  id v81 = [v80 endDate];
  [(MOEventBundle *)v66 setEndDate:v81];

  id v82 = [obj lastObject];
  id v83 = [v82 expirationDate];
  [(MOEventBundle *)v66 setExpirationDate:v83];

  id v84 = [obj firstObject];
  id v85 = [v84 time];
  [(MOEventBundle *)v66 setTime:v85];

  uint64_t v86 = +[MOContextAnnotationUtilities setActionForActivityBundle:v153];
  [(MOEventBundle *)v66 setAction:v86];

  if ([v155 count])
  {
    id v87 = +[MOContextAnnotationUtilities annotateEventBundle:v66 playbackMediaEvents:v155];
    [v141 addObjectsFromArray:v87];
    [(MOEventBundle *)v66 setEvents:v141];
  }
  v151 = v66;
  id v9 = v138;
  if ([v71 count])
  {
    [v141 addObjectsFromArray:v71];
    [(MOEventBundle *)v66 setEvents:v141];
    +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:v66 withEmotionEvents:v71];
    +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:v66 withEmotionEvents:v71];
  }
  id v54 = objc_opt_new();
  [v138 setPriorityScore:20000.0];
  [v54 addObject:v138];
  __int16 v88 = v153;
  uint64_t v89 = +[MOContextAnnotationUtilities locationsFromMotionEvents:v153];
  [v139 motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap];
  float v144 = (void *)v89;
  long long v91 = +[MOContextAnnotationUtilities placeFromRoutes:v89 referencePointRatio:1.5 minimumRangeOfLocation:v90];
  if (v91)
  {
    long long v92 = [v141 firstObject];
    long long v93 = [v92 eventIdentifier];
    [v91 setSourceEventIdentifier:v93];

    [v91 setPriorityScore:200.0];
    [(MOEventBundle *)v151 setPlace:v91];
    [v54 addObject:v91];
    [(MOEventBundle *)v151 setPlaces:v54];
    long long v94 = [(MOEventBundle *)v151 resources];
    if (v94)
    {
      long long v95 = [(MOEventBundle *)v151 resources];
      id v127 = [v95 mutableCopy];
    }
    else
    {
      id v127 = (id)objc_opt_new();
    }

    long long v97 = objc_opt_new();
    long long v98 = [(MOEventBundle *)v151 startDate];
    [v98 timeIntervalSince1970];
    long long v99 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v97 setObject:v99 forKey:@"MOActivityMetaDataKeyStartDate"];

    long long v100 = [(MOEventBundle *)v151 endDate];
    [v100 timeIntervalSince1970];
    long long v101 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v149 = v97;
    [v97 setObject:v101 forKey:@"MOActivityMetaDataKeyEndDate"];

    long long v102 = [(MOEventBundle *)v151 action];
    id v103 = [v102 actionMetaData];

    uint64_t v104 = [v103 objectForKeyedSubscript:@"ActivityActionMetaDataValue"];
    v131 = v103;
    uint64_t v105 = [v103 objectForKeyedSubscript:@"ActivityActionMetaDataUnit"];
    id v106 = [(MOEventBundle *)v151 action];
    __int16 v134 = [v106 actionName];

    double v107 = v151;
    if (v104 && v105)
    {
      [v149 setObject:v104 forKey:@"MOActivityMetaDataKeyStepCount"];
      [v149 setObject:v105 forKey:@"MOActivityMetaDataKeyUnit"];
    }
    v130 = (void *)v104;
    [v149 setObject:v134 forKey:@"MOActivityMetaDataMotionType" v127];
    id v108 = [[MOResource alloc] initWithName:@"MotionActivity" type:13 dict:v149 value:0.0];
    unsigned __int8 v109 = [v141 firstObject];
    id v110 = [v109 eventIdentifier];
    [(MOResource *)v108 setSourceEventIdentifier:v110];

    [(MOResource *)v108 setPriorityScore:100.0];
    __int16 v111 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "Summarization: Primary MOResource created for phone walk bundle", buf, 2u);
    }
    v132 = v54;

    [v128 addObject:v108];
    if ([v145 count])
    {
      id v183 = v137;
      id v112 = +[NSArray arrayWithObjects:&v183 count:1];
      id v113 = [v145 sortedArrayUsingDescriptors:v112];

      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      id v114 = v113;
      id v115 = [v114 countByEnumeratingWithState:&v164 objects:v182 count:16];
      if (v115)
      {
        id v116 = v115;
        uint64_t v117 = *(void *)v165;
        double v118 = 202.0;
        do
        {
          for (k = 0; k != v116; k = (char *)k + 1)
          {
            if (*(void *)v165 != v117) {
              objc_enumerationMutation(v114);
            }
            [*(id *)(*((void *)&v164 + 1) + 8 * (void)k) setPriorityScore:v118];
            double v118 = v118 + 1.0;
          }
          id v116 = [v114 countByEnumeratingWithState:&v164 objects:v182 count:16];
        }
        while (v116);
      }

      long long v120 = [v114 firstObject];
      [v120 setPriorityScore:99.0];

      [v128 addObjectsFromArray:v114];
      double v107 = v151;
    }
    long long v129 = (void *)v105;
    [(MOEventBundle *)v107 setResources:v128];
    [v133 updateRankMetaDataFrom:obj forSummaryBundle:v107];
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v121 = obj;
    id v122 = [v121 countByEnumeratingWithState:&v160 objects:v181 count:16];
    __int16 v88 = v153;
    if (v122)
    {
      id v123 = v122;
      uint64_t v124 = *(void *)v161;
      do
      {
        for (m = 0; m != v123; m = (char *)m + 1)
        {
          if (*(void *)v161 != v124) {
            objc_enumerationMutation(v121);
          }
          [*(id *)(*((void *)&v160 + 1) + 8 * (void)m) setIsAggregatedAndSuppressed:1];
        }
        id v123 = [v121 countByEnumeratingWithState:&v160 objects:v181 count:16];
      }
      while (v123);
    }
    long long v96 = v91;

    uint64_t v11 = v151;
    id v8 = v135;
    id v9 = v138;
    id v10 = v139;
    id v50 = v159;
    id v54 = v132;
  }
  else
  {
    long long v96 = 0;
    uint64_t v11 = 0;
    id v50 = v159;
    id v8 = v135;
  }

LABEL_92:
LABEL_93:

  return v11;
}

+ (void)combinePhotoResources:(void *)a1 .cold.1(void *a1)
{
  v2 = [a1 assets];
  [a1 priorityScore];
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v3, v4, "secondary photo asset, %@, priority score, %f", v5, v6, v7, v8, 2u);
}

+ (void)updateRankMetaDataFrom:(unsigned char *)a1 forSummaryBundle:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_4(a1, a2);
  _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Summary bundle familiarity index is -1", v3, 2u);
}

+ (void)getWorkoutActionsByActionSubtypeFromBundles:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [OUTLINED_FUNCTION_2_1(a1, a2) workoutType];
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "getWorkoutActionsByActionSubtypeFromBundles: input action, %@");
}

+ (void)getActionsFromBundles:(os_log_t)log withDominantAction:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No bundle for getting actions", v1, 2u);
}

+ (void)getActionsFromBundles:(unsigned char *)a1 withDominantAction:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_4(a1, a2);
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "skip vist action when adding to actions to bundle with workout as dominant action", v3, 2u);
}

+ (void)getActionsFromBundles:(uint64_t)a1 withDominantAction:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [OUTLINED_FUNCTION_2_1(a1, a2) action];
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v5, v6, "The action, %@, added");
}

+ (void)getActionsFromBundles:(unsigned char *)a1 withDominantAction:(unsigned char *)a2 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_4(a1, a2);
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "skip dominant action whenwe already added it to actions", v3, 2u);
}

+ (void)getActionsFromBundles:(uint64_t)a1 withDominantAction:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 firstObject];
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v2, v3, "The dominant action added for visit, %@, added, %@", v4, v5, v6, v7, 2u);
}

+ (void)isOutingBundleInsideOneDay:(char)a1 .cold.1(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "SummarizationUtilities: outing bundle is inside one day: %d", (uint8_t *)v2, 8u);
}

@end