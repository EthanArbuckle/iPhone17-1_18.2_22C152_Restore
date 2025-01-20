@interface MOContextAnnotationUtilities
+ (BOOL)isEvergreenBundle:(id)a3;
+ (double)distanceFromHomeToCLLocation:(id)a3 universe:(id)a4;
+ (double)distanceFromHomeToLocation:(id)a3 universe:(id)a4;
+ (double)labelConfidenceForEventBundle:(id)a3;
+ (double)weightedAverageForObjects:(id)a3 weightPath:(id)a4 valuePath:(id)a5;
+ (id)andStringFromArray:(id)a3 propertyPath:(id)a4 maxCount:(unint64_t)a5;
+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 emotionEvents:(id)a5 bundleDurationThreshold:(float)a6;
+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5;
+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 lessSignificantPlaySessionMediaTypes:(id)a6;
+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 mediaDurationThreshold:(float)a6;
+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 mediaDurationThreshold:(float)a6 lessSignificantPlaySessionMediaTypes:(id)a7;
+ (id)annotateEventBundle:(id)a3 leisureMediaEvents:(id)a4;
+ (id)annotateEventBundle:(id)a3 playbackMediaEvents:(id)a4;
+ (id)annotateEventBundle:(id)a3 playbackMediaEvents:(id)a4 lessSignificantPlaySessionMediaTypes:(id)a5;
+ (id)annotateEventBundle:(id)a3 visitEvents:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9;
+ (id)annotateEventBundle:(id)a3 visitEvents:(id)a4 universe:(id)a5;
+ (id)averageLocationFromLocations:(id)a3;
+ (id)baseTimeFromBaseEvents:(id)a3;
+ (id)bundleNameFromBundleId:(id)a3;
+ (id)creatMediaActionWithMediaInfo:(id)a3 mediaNameConfidence:(double)a4;
+ (id)createMediaResourceWithMediaInfo:(id)a3 playSessions:(id)a4 eventIdentifiersMapping:(id)a5 isDominant:(BOOL)a6;
+ (id)dominantMediaNameFromEvents:(id)a3;
+ (id)dominantMediaNameFromPlaySessions:(id)a3 intervalOfInterest:(id)a4 dominantFactorThreshold:(double)a5 confidence:(double *)a6;
+ (id)dominantMediaNameFromPlaySessions:(id)a3 intervalsOfInterest:(id)a4 dominantFactorThreshold:(double)a5 confidence:(double *)a6;
+ (id)extendedBundleNameFromBundleName:(id)a3 bundleId:(id)a4;
+ (id)fetchAssetUsingID:(id)a3 universe:(id)a4;
+ (id)groupedEventsFromEvents:(id)a3 propertyPath:(id)a4;
+ (id)locationsFromLocationString:(id)a3;
+ (id)locationsFromMotionEvents:(id)a3;
+ (id)majorityGroupFromEvents:(id)a3 propertyPath:(id)a4 valuePath:(id)a5;
+ (id)majorityPropertyFromEvents:(id)a3 propertyPath:(id)a4 valuePath:(id)a5;
+ (id)placeFromRoutes:(id)a3;
+ (id)placeFromRoutes:(id)a3 referencePointRatio:(double)a4 minimumRangeOfLocation:(double)a5;
+ (id)placeFromVisitEvent:(id)a3 preferredCategories:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9;
+ (id)placeFromVisitEvents:(id)a3 preferredCategories:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9;
+ (id)placeFromVisitEvents:(id)a3 usedEvents:(id)a4 preferredCategories:(id)a5 poiCategoryBlocklist:(id)a6 mediumConfidenceThreshold:(double)a7 highConfidenceThreshold:(double)a8 aoiConfidenceThreshold:(double)a9 universe:(id)a10;
+ (id)predicateOfEmotionLogsWithStartDate:(id)a3 endDate:(id)a4;
+ (id)predicateOfEventsWithPlaySessions;
+ (id)predicateOfEventsWithPlaySessionsWithStartDate:(id)a3 endData:(id)a4;
+ (id)predicateOfEventsWithPlaySessionsWithStartDate:(id)a3 endData:(id)a4 distanceThreshold:(double)a5;
+ (id)predicateOfMediaPlaySessionsWithStartDate:(id)a3 endDate:(id)a4 distanceThreshold:(double)a5;
+ (id)predicateOfSocialContextEventWithStartDate:(id)a3 endData:(id)a4;
+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4;
+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 distanceThreshold:(double)a5;
+ (id)setActionForActivityBundle:(id)a3;
+ (id)timeOfDayPrefixFromBaseEvents:(id)a3;
+ (unint64_t)prepositionWithPlaceType:(unint64_t)a3 userPlaceType:(unint64_t)a4 mapItemPlaceType:(unint64_t)a5 distanceFromVisitToPlace:(double)a6 snappingThreshold:(double)a7;
+ (void)addPhotoResources:(id)a3 universe:(id)a4 handler:(id)a5;
+ (void)addPhotoResourcesWithDateArray:(id)a3 universe:(id)a4 handler:(id)a5;
+ (void)addStateOfMindMetaDataForRankForBundle:(id)a3 withEmotionEvents:(id)a4;
+ (void)addStateOfMindResourceForBundle:(id)a3 withEmotionEvents:(id)a4;
+ (void)assetPriorityScoringForTimeAtHomeBundlesWithBundle:(id)a3 withMediaResources:(id)a4 withPhotoResources:(id)a5 withEmotionResources:(id)a6;
+ (void)filterEventsIntersectingDateRange:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5 eventInterval:(double)a6 handler:(id)a7;
+ (void)filterEventsIntersectingDateRange:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5 handler:(id)a6;
@end

@implementation MOContextAnnotationUtilities

+ (id)majorityPropertyFromEvents:(id)a3 propertyPath:(id)a4 valuePath:(id)a5
{
  id v7 = a4;
  v8 = +[MOContextAnnotationUtilities majorityGroupFromEvents:a3 propertyPath:v7 valuePath:a5];
  v9 = [v8 firstObject];
  v10 = [v9 valueForKeyPath:v7];

  return v10;
}

+ (id)majorityGroupFromEvents:(id)a3 propertyPath:(id)a4 valuePath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v27 = v8;
  v28 = v7;
  v10 = +[MOContextAnnotationUtilities groupedEventsFromEvents:v7 propertyPath:v8];
  v11 = [v10 allValues];
  id v30 = [v11 firstObject];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v10 allKeys];
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v36;
    double v15 = -1.79769313e308;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = [v10 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v32;
          double v21 = 0.0;
          do
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v32 != v20) {
                objc_enumerationMutation(v17);
              }
              v23 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) valueForKeyPath:v9];
              [v23 doubleValue];
              double v21 = v21 + v24;
            }
            id v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v19);
        }
        else
        {
          double v21 = 0.0;
        }
        if (v21 > v15)
        {
          id v25 = v17;

          id v30 = v25;
          double v15 = v21;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }

  return v30;
}

+ (void)filterEventsIntersectingDateRange:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void))a6;
  if ([v9 count])
  {
    v28 = v12;
    id v29 = v9;
    id v30 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v20 = [v19 endDate];
          [v20 timeIntervalSinceDate:v10];
          if (v21 >= 0.0)
          {
            v22 = [v19 startDate];
            [v11 timeIntervalSinceDate:v22];
            double v24 = v23;

            if (v24 >= 0.0) {
              [v30 addObject:v19];
            }
          }
          else
          {
          }
          id v25 = [v19 endDate];
          [v25 timeIntervalSinceDate:v11];
          BOOL v27 = v26 >= 0.0;

          v16 |= v27;
        }
        id v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v15);
    }
    else
    {
      char v16 = 0;
    }

    id v12 = v28;
    v28[2](v28, v30, v16 & 1);

    id v9 = v29;
  }
  else
  {
    v12[2](v12, &__NSArray0__struct, 0);
  }
}

+ (void)filterEventsIntersectingDateRange:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5 eventInterval:(double)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *, void, double))a7;
  if (![v11 count])
  {
    v14[2](v14, &__NSArray0__struct, 0, 0.0);
    goto LABEL_28;
  }
  v42 = v14;
  id v15 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v43 = v11;
  id obj = v11;
  id v16 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (!v16)
  {
    char v18 = 0;
    float v20 = 0.0;
    goto LABEL_22;
  }
  id v17 = v16;
  char v18 = 0;
  uint64_t v19 = *(void *)v47;
  float v20 = 0.0;
  id v44 = v12;
  do
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v47 != v19) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      double v23 = [v22 endDate:v42];
      [v23 timeIntervalSinceDate:v12];
      if (v24 >= 0.0)
      {
        id v25 = [v22 startDate];
        [v13 timeIntervalSinceDate:v25];
        double v27 = v26;

        if (v27 < 0.0) {
          goto LABEL_17;
        }
        v28 = v12;
        id v29 = v15;
        id v30 = [v22 startDate];
        if ([v30 isBeforeDate:v28])
        {
          id v31 = v28;
        }
        else
        {
          id v31 = [v22 startDate];
        }
        double v23 = v31;

        long long v32 = [v22 endDate];
        if ([v32 isAfterDate:v13])
        {
          id v33 = v13;
        }
        else
        {
          id v33 = [v22 endDate];
        }
        long long v34 = v33;

        [v34 timeIntervalSinceDate:v23];
        float v20 = v35 + v20;
        id v15 = v29;
        [v29 addObject:v22];

        id v12 = v44;
      }

LABEL_17:
      long long v36 = [v22 endDate];
      [v36 timeIntervalSinceDate:v13];
      BOOL v38 = v37 >= 0.0;

      v18 |= v38;
    }
    id v17 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  }
  while (v17);
LABEL_22:

  if (v20 >= a6)
  {
    id v14 = v42;
    v39.n128_f32[0] = v20;
    ((void (*)(void (**)(id, void *, void, double), void *, void, __n128))v42[2])(v42, v15, v18 & 1, v39);
  }
  else
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    id v14 = v42;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v51 = v20;
      __int16 v52 = 2048;
      double v53 = a6;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "P@H: Total Home duration is %f s, doesn't meet threshold %f s", buf, 0x16u);
    }

    v41.n128_u64[0] = 0;
    ((void (*)(void (**)(id, void *, void, double), void *, void, __n128))v42[2])(v42, &__NSArray0__struct, 0, v41);
  }
  id v11 = v43;

LABEL_28:
}

+ (id)groupedEventsFromEvents:(id)a3 propertyPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [v13 valueForKey:v6];
          if (v14)
          {
            id v15 = [v7 objectForKey:v14];
            if (!v15) {
              id v15 = objc_opt_new();
            }
            [v15 addObject:v13];
            [v7 setObject:v15 forKey:v14];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v16 = [v7 copy];
    id v5 = v18;
  }
  else
  {
    id v16 = &__NSDictionary0__struct;
  }

  return v16;
}

+ (id)annotateEventBundle:(id)a3 visitEvents:(id)a4 universe:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    id v110 = v9;
    id v12 = [v9 getService:v11];

    id v13 = @"aboveDoorShortAddress";
    v109 = v12;
    if (v12)
    {
      LODWORD(v14) = *(_DWORD *)"fff?";
      [v12 getFloatSettingForKey:@"VA_VisitLabelMediumConfidenceThreshold" withFallback:v14];
      double v16 = v15;
      LODWORD(v17) = 0.5;
      [v12 getFloatSettingForKey:@"VA_AOIVisitLabelConfidentThreshold" withFallback:v17];
      double v19 = v18;
      long long v20 = +[NSString stringWithFormat:@"%@_%@", @"addressFormatting", @"formatOption"];
      uint64_t v21 = [v12 getStringSettingForKey:v20 withFallback:v13];

      [v12 getDoubleSettingForKey:@"distanceOfSnappingThreshold" withFallback:150.0];
      id v13 = (__CFString *)v21;
    }
    else
    {
      double v19 = 0.5;
      double v16 = 0.9;
    }
    v108 = objc_opt_new();
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v111 = v8;
    id obj = v8;
    id v23 = [obj countByEnumeratingWithState:&v120 objects:v136 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v121;
      double v26 = &MOLogFacilityEventBundleManager;
      id v112 = v7;
      v113 = v13;
      uint64_t v114 = *(void *)v121;
      do
      {
        double v27 = 0;
        id v118 = v24;
        do
        {
          if (*(void *)v121 != v25) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v120 + 1) + 8 * (void)v27);
          if ([v28 category] == (id)1)
          {
            id v29 = [v28 placeName];
            [v28 placeNameConfidence];
            double v31 = v30;
            v119 = [v28 formatLocalityWithFormatOption:v13];
            if (!v119)
            {
              v119 = [v28 formatAdministrativeAreaWithFormatOption:v13];
              if (!v119)
              {
                v119 = [v28 formatCountryWithFormatOption:v13];
              }
            }
            long long v32 = [v28 placeName];

            if (v32)
            {
              BOOL v33 = [v28 placeType] == (id)3 && v31 < v16;
              if (v33 && ([v28 placeSource] & 0x40000) == 0
                || (int v34 = 0, [v28 placeType] == (id)2) && v31 < v19)
              {
                double v35 = [v28 formatAddressWithFormatOption:v13];
                long long v36 = _mo_log_facility_get_os_log(v26);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  v104 = (objc_class *)objc_opt_class();
                  v105 = NSStringFromClass(v104);
                  id v106 = [v28 placeType];
                  *(_DWORD *)buf = 138413570;
                  v125 = v105;
                  __int16 v126 = 2112;
                  v127 = v29;
                  __int16 v128 = 2112;
                  v129 = v35;
                  __int16 v130 = 2112;
                  v131 = v13;
                  __int16 v132 = 2048;
                  double v133 = v31;
                  __int16 v134 = 2048;
                  id v135 = v106;
                  _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%@: original place name, %@, new place name, %@, format option, %@, confidence, %f, placeType, %lu", buf, 0x3Eu);

                  id v7 = v112;
                }

                if (v35)
                {
                  id v37 = v35;

                  int v34 = 1;
                  id v29 = v37;
                }
                else
                {
                  int v34 = 0;
                }
              }
              if ([v28 placeType] == (id)4 || objc_msgSend(v28, "placeType") == (id)5)
              {
                v55 = [v28 formatAddressWithFormatOption:v13];
                v56 = _mo_log_facility_get_os_log(v26);
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  v98 = (objc_class *)objc_opt_class();
                  v99 = NSStringFromClass(v98);
                  id v100 = [v28 placeType];
                  *(_DWORD *)buf = 138413570;
                  v125 = v99;
                  __int16 v126 = 2112;
                  v127 = v29;
                  __int16 v128 = 2112;
                  v129 = v55;
                  __int16 v130 = 2112;
                  v131 = v13;
                  __int16 v132 = 2048;
                  double v133 = v31;
                  __int16 v134 = 2048;
                  id v135 = v100;
                  _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%@: original place name, %@, new place name, %@, format option, %@, confidence, %f, placeType, %lu", buf, 0x3Eu);

                  id v7 = v112;
                }

                if (v55)
                {
                  id v57 = v55;

                  int v34 = 1;
                  id v29 = v57;
                }
              }
              if ([v28 placeSource] == (id)0x2000 || objc_msgSend(v28, "placeSource") == (id)8193)
              {
                v58 = [v28 formatAddressWithFormatOption:v13];
                v59 = _mo_log_facility_get_os_log(v26);
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                {
                  v101 = (objc_class *)objc_opt_class();
                  v102 = NSStringFromClass(v101);
                  id v103 = [v28 placeType];
                  *(_DWORD *)buf = 138413570;
                  v125 = v102;
                  __int16 v126 = 2112;
                  v127 = v29;
                  __int16 v128 = 2112;
                  v129 = v58;
                  __int16 v130 = 2112;
                  v131 = v13;
                  __int16 v132 = 2048;
                  double v133 = v31;
                  __int16 v134 = 2048;
                  id v135 = v103;
                  _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%@: original place name, %@, new place name, %@, format option, %@, confidence, %f, placeType, %lu", buf, 0x3Eu);

                  id v7 = v112;
                }

                if (v58)
                {
                  id v60 = v58;

                  int v34 = 1;
                  id v29 = v60;
                }
              }
              unsigned int v61 = [v28 isHighConfidence];
              [v28 placeNameConfidence];
              double v63 = 1.0;
              if (!v61) {
                double v63 = 0.9;
              }
              double v64 = v62 * v63;
              if (v64 >= 0.0) {
                double v65 = v64;
              }
              else {
                double v65 = 0.0;
              }
              uint64_t v66 = [v7 place];
              if (v66)
              {
                v67 = (void *)v66;
                v68 = [v7 place];
                [v68 placeNameConfidence];
                double v70 = v69;

                if (v34)
                {
                  double v65 = 0.0;
                  BOOL v54 = 1;
                }
                else
                {
                  BOOL v54 = 0;
                }
                if (v65 <= v70)
                {
                  uint64_t v25 = v114;
                  id v24 = v118;
                  goto LABEL_67;
                }
              }
              else
              {
                BOOL v54 = v34 != 0;
                if (v34) {
                  double v65 = 0.0;
                }
              }
              BOOL v116 = v54;
              id v71 = [v28 placeType];
              if (v34) {
                uint64_t v72 = 5;
              }
              else {
                uint64_t v72 = (uint64_t)v71;
              }
              v73 = [MOPlace alloc];
              [v28 placeUserType];
              v74 = [v28 location];
              [v28 mode];
              v75 = [v28 poiCategory];
              [v28 familiarityIndexLOI];
              double v77 = v76;
              v78 = [v28 startDate];
              uint64_t v79 = [v28 endDate];
              v80 = v29;
              v81 = (void *)v79;
              v117 = v80;
              __int16 v52 = -[MOPlace initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:](v73, "initWithPlaceName:enclosingArea:placeType:placeUserType:location:locationMode:poiCategory:distanceToHomeInMiles:placeNameConfidence:familiarityIndexLOI:startDate:endDate:", -1.0, v65, v77, v75, v78, v79);

              id v7 = v112;
              v82 = objc_opt_class();
              id v83 = [v28 placeUserType];
              v84 = [v28 routineEvent];
              id v85 = [v84 mapItemPlaceType];
              v86 = [v28 routineEvent];
              [v86 distanceFromVisitToPlace];
              -[MOPlace setProposition:](v52, "setProposition:", [v82 prepositionWithPlaceType:v72 userPlaceType:v83 mapItemPlaceType:v85 distanceFromVisitToPlace:v84 snappingThreshold:v86]);

              double v53 = [v28 eventIdentifier];
              [(MOPlace *)v52 setSourceEventIdentifier:v53];
            }
            else
            {
              BOOL v38 = [v28 location];

              if (!v38) {
                goto LABEL_32;
              }
              uint64_t v39 = [v7 place];
              if (v39)
              {
                v40 = (void *)v39;
                __n128 v41 = [v7 place];
                [v41 placeNameConfidence];
                double v43 = v42;

                if (v31 <= v43)
                {
LABEL_32:
                  BOOL v54 = 0;
                  goto LABEL_67;
                }
              }
              v117 = v29;
              id v44 = [MOPlace alloc];
              v45 = [v28 location];
              id v46 = [v28 mode];
              long long v47 = [v28 poiCategory];
              [v28 familiarityIndexLOI];
              double v49 = v48;
              v50 = [v28 startDate];
              double v51 = [v28 endDate];
              __int16 v52 = [(MOPlace *)v44 initWithPlaceName:0 enclosingArea:v119 placeType:0 placeUserType:0 location:v45 locationMode:v46 poiCategory:-1.0 distanceToHomeInMiles:0.0 placeNameConfidence:v49 familiarityIndexLOI:v47 startDate:v50 endDate:v51];

              double v53 = [v28 eventIdentifier];
              [(MOPlace *)v52 setSourceEventIdentifier:v53];
              BOOL v116 = 0;
            }

            [v7 setPlace:v52];
            id v13 = v113;
            uint64_t v25 = v114;
            id v29 = v117;
            id v24 = v118;
            double v26 = &MOLogFacilityEventBundleManager;
            BOOL v54 = v116;
LABEL_67:
            v87 = [v28 placeMapItem];

            if (v87 && !v54)
            {
              v88 = [MOResource alloc];
              [v28 placeName];
              uint64_t v89 = v25;
              v90 = v13;
              id v91 = v7;
              v92 = v26;
              v94 = v93 = v29;
              v95 = [v28 placeMapItem];
              v96 = [(MOResource *)v88 initWithName:v94 mapItemHandle:v95 priorityScore:-1.0];

              v97 = [v28 eventIdentifier];
              [(MOResource *)v96 setSourceEventIdentifier:v97];

              id v29 = v93;
              double v26 = v92;
              id v7 = v91;
              id v13 = v90;
              uint64_t v25 = v89;
              id v24 = v118;
              [v7 addResource:v96];
            }
          }
          double v27 = (char *)v27 + 1;
        }
        while (v24 != v27);
        id v24 = [obj countByEnumeratingWithState:&v120 objects:v136 count:16];
      }
      while (v24);
    }

    id v22 = [v108 copy];
    id v9 = v110;
    id v8 = v111;
  }
  else
  {
    id v22 = &__NSArray0__struct;
  }

  return v22;
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 emotionEvents:(id)a5 bundleDurationThreshold:(float)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 count])
  {
    double v53 = v9;
    id v57 = objc_opt_new();
    id v52 = v10;
    if (v10)
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v66 objects:v82 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v67;
        float v16 = 0.0;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v67 != v15) {
              objc_enumerationMutation(v12);
            }
            float v18 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            id v19 = objc_alloc((Class)NSDateInterval);
            long long v20 = [v18 startDate];
            uint64_t v21 = [v18 endDate];
            id v22 = [v19 initWithStartDate:v20 endDate:v21];

            [v57 addObject:v22];
            [v22 duration];
            float v16 = v23 + v16;
          }
          id v14 = [v12 countByEnumeratingWithState:&v66 objects:v82 count:16];
        }
        while (v14);
      }
      else
      {
        float v16 = 0.0;
      }
    }
    else
    {
      float v16 = 0.0;
    }
    v55 = objc_opt_new();
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v51 = v11;
    id obj = v11;
    id v25 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v56 = *(void *)v63;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v63 != v56) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
          id v29 = +[NSCalendar currentCalendar];
          id v30 = objc_alloc((Class)NSDateInterval);
          double v31 = [v28 startDate];
          long long v32 = [v28 endDate];
          BOOL v33 = [v29 dateByAddingUnit:128 value:10 toDate:v32 options:0];
          id v34 = [v30 initWithStartDate:v31 endDate:v33];

          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v35 = v57;
          id v36 = [v35 countByEnumeratingWithState:&v58 objects:v80 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v59;
            while (2)
            {
              for (k = 0; k != v37; k = (char *)k + 1)
              {
                if (*(void *)v59 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)k) intersectionWithDateInterval:v34];
                [v40 duration];
                if (v41 > 0.0)
                {
                  [v55 addObject:v28];

                  goto LABEL_30;
                }
              }
              id v37 = [v35 countByEnumeratingWithState:&v58 objects:v80 count:16];
              if (v37) {
                continue;
              }
              break;
            }
          }
LABEL_30:
        }
        id v26 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
      }
      while (v26);
    }

    double v42 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
    if (v16 <= a6)
    {
      id v9 = v53;
      id v11 = v51;
      id v46 = v55;
      if (v43)
      {
        double v47 = COERCE_DOUBLE([v55 count]);
        double v48 = [v53 suggestionID];
        id v49 = [v53 bundleSuperType];
        *(_DWORD *)buf = 134219010;
        double v71 = v47;
        __int16 v72 = 2048;
        double v73 = v16;
        __int16 v74 = 2048;
        double v75 = a6;
        __int16 v76 = 2112;
        id v77 = v48;
        __int16 v78 = 2048;
        id v79 = v49;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "N=%lu emotion events attached to bundle since total bundle duration (%.2f) is less or equal to threshold (%.2f), suggestionID %@, bundleSuperType %lu", buf, 0x34u);
      }
      id v24 = v55;
      id v10 = v52;
    }
    else
    {
      id v10 = v52;
      id v9 = v53;
      id v11 = v51;
      if (v43)
      {
        double v44 = [v53 suggestionID];
        id v45 = [v53 bundleSuperType];
        *(_DWORD *)buf = 134218754;
        double v71 = v16;
        __int16 v72 = 2048;
        double v73 = a6;
        __int16 v74 = 2112;
        double v75 = v44;
        __int16 v76 = 2048;
        id v77 = v45;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "No emotion events attached to bundle since total bundle duration (%.2f) is higher than threshold (%.2f), suggestionID %@, bundleSuperType %lu", buf, 0x2Au);
      }
      id v24 = &__NSArray0__struct;
      id v46 = v55;
    }
  }
  else
  {
    id v24 = &__NSArray0__struct;
  }

  return v24;
}

+ (id)annotateEventBundle:(id)a3 leisureMediaEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count])
  {
    id v32 = &__NSArray0__struct;
    goto LABEL_39;
  }
  id v43 = v6;
  double v44 = v5;
  id v7 = +[MOContextAnnotationUtilities groupedEventsFromEvents:v6 propertyPath:@"mediaArtist"];
  id v8 = [v7 allValues];

  id v9 = [v8 firstObject];
  id v10 = [v9 firstObject];

  id v11 = [v10 mediaTitle];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (!v12)
  {
    double v15 = 0.0;
    double v16 = -1.79769313e308;
    goto LABEL_29;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v51;
  double v15 = 0.0;
  double v16 = -1.79769313e308;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v51 != v14) {
        objc_enumerationMutation(obj);
      }
      float v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v47;
        double v23 = 0.0;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v47 != v22) {
              objc_enumerationMutation(v19);
            }
            id v25 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)j) mediaSumTimePlayed];
            [v25 doubleValue];
            double v23 = v23 + v26;
          }
          id v21 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
        }
        while (v21);
      }
      else
      {
        double v23 = 0.0;
      }

      if (v23 > v16)
      {
        double v27 = [v19 firstObject];

        if ([v19 count] == (id)1)
        {
          v28 = [v27 mediaTitle];

          if (v28)
          {
            uint64_t v29 = [v27 mediaTitle];
            goto LABEL_22;
          }
        }
        id v30 = [v27 mediaArtist];

        if (v30)
        {
          uint64_t v29 = [v27 mediaArtist];
LABEL_22:
          double v31 = (void *)v29;

          id v11 = v31;
        }
        id v10 = v27;
        double v16 = v23;
      }
      double v15 = v15 + v23;
    }
    id v13 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  }
  while (v13);
LABEL_29:

  if (v11)
  {
    if (v15 <= 0.0) {
      double v33 = -1.0;
    }
    else {
      double v33 = v16 / v15;
    }
    id v34 = +[NSString stringWithFormat:@"listening to %@", v11];
    id v35 = [[MOAction alloc] initWithActionName:v34 actionType:6 actionSubtype:0 actionNameConfidence:v33];
    id v36 = [v10 eventIdentifier];
    [(MOAction *)v35 setSourceEventIdentifier:v36];

    id v5 = v44;
    [v44 addBackgroundAction:v35];
    id v37 = [MOResource alloc];
    uint64_t v38 = [v10 mediaProductId];
    uint64_t v39 = [(MOResource *)v37 initWithName:v11 type:3 assets:v38];

    v40 = [v10 eventIdentifier];
    [(MOResource *)v39 setSourceEventIdentifier:v40];

    [v44 addResource:v39];
    double v41 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    id v6 = v43;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v35;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Action, %@", buf, 0xCu);
    }
  }
  else
  {
    id v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    id v6 = v43;
    id v5 = v44;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[MOContextAnnotationUtilities annotateEventBundle:leisureMediaEvents:]((uint64_t)v10, v34);
    }
  }

  id v32 = v6;
LABEL_39:

  return v32;
}

+ (id)annotateEventBundle:(id)a3 playbackMediaEvents:(id)a4
{
  return +[MOContextAnnotationUtilities annotateEventBundle:a3 playbackMediaEvents:a4 lessSignificantPlaySessionMediaTypes:0];
}

+ (id)annotateEventBundle:(id)a3 playbackMediaEvents:(id)a4 lessSignificantPlaySessionMediaTypes:(id)a5
{
  return +[MOContextAnnotationUtilities annotateEventBundle:a3 dateIntervalEvents:0 playbackMediaEvents:a4 lessSignificantPlaySessionMediaTypes:a5];
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5
{
  return +[MOContextAnnotationUtilities annotateEventBundle:a3 dateIntervalEvents:a4 playbackMediaEvents:a5 lessSignificantPlaySessionMediaTypes:0];
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 lessSignificantPlaySessionMediaTypes:(id)a6
{
  return +[MOContextAnnotationUtilities annotateEventBundle:a3 dateIntervalEvents:a4 playbackMediaEvents:a5 mediaDurationThreshold:a6 lessSignificantPlaySessionMediaTypes:0.0];
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 mediaDurationThreshold:(float)a6
{
  return +[MOContextAnnotationUtilities annotateEventBundle:a3 dateIntervalEvents:a4 playbackMediaEvents:a5 mediaDurationThreshold:0 lessSignificantPlaySessionMediaTypes:0.0];
}

+ (id)annotateEventBundle:(id)a3 dateIntervalEvents:(id)a4 playbackMediaEvents:(id)a5 mediaDurationThreshold:(float)a6 lessSignificantPlaySessionMediaTypes:(id)a7
{
  id v11 = a3;
  id v112 = a4;
  id v12 = a5;
  id v13 = a7;
  if ([v12 count])
  {
    id v108 = v13;
    id v15 = objc_alloc((Class)NSDateInterval);
    double v16 = [v11 startDate];
    double v17 = [v11 endDate];
    id v18 = [v15 initWithStartDate:v16 endDate:v17];

    [v18 duration];
    uint64_t v114 = v18;
    if (v19 == 0.0)
    {
      id v20 = &__NSArray0__struct;
      id v13 = v108;
    }
    else
    {
      id v100 = v12;
      id v21 = [v18 startDate];
      uint64_t v22 = [v18 endDate];
      id v103 = +[MOContextAnnotationUtilities predicateOfMediaPlaySessionsWithStartDate:v21 endDate:v22 distanceThreshold:0.5];

      v113 = objc_opt_new();
      if (v112)
      {
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        id v23 = v112;
        id v24 = [v23 countByEnumeratingWithState:&v140 objects:v152 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v141;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v141 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v140 + 1) + 8 * i);
              id v29 = objc_alloc((Class)NSDateInterval);
              id v30 = [v28 startDate];
              double v31 = [v28 endDate];
              id v32 = [v29 initWithStartDate:v30 endDate:v31];

              [v113 addObject:v32];
            }
            id v25 = [v23 countByEnumeratingWithState:&v140 objects:v152 count:16];
          }
          while (v25);
        }
      }
      v99 = v14;
      BOOL v116 = objc_opt_new();
      double v33 = objc_opt_new();
      id v110 = objc_opt_new();
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id obj = v100;
      id v104 = [obj countByEnumeratingWithState:&v136 objects:v151 count:16];
      if (v104)
      {
        uint64_t v102 = *(void *)v137;
        float v34 = 0.0;
        id v35 = v108;
        id v107 = v11;
        while (1)
        {
          uint64_t v36 = 0;
          do
          {
            if (*(void *)v137 != v102) {
              objc_enumerationMutation(obj);
            }
            uint64_t v106 = v36;
            id v37 = *(void **)(*((void *)&v136 + 1) + 8 * v36);
            long long v122 = v37;
            uint64_t v38 = [v37 mediaPlaySessions];
            uint64_t v39 = [v38 filteredArrayUsingPredicate:v103];

            v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              double v41 = [v122 mediaPlaySessions];
              id v42 = [v41 count];
              id v43 = [v39 count];
              *(_DWORD *)buf = 134218240;
              id v148 = v42;
              __int16 v149 = 2048;
              id v150 = v43;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "playback, %lu, filtered sessions, %lu", buf, 0x16u);
            }
            long long v134 = 0u;
            long long v135 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            id v44 = v39;
            id v118 = [v44 countByEnumeratingWithState:&v132 objects:v146 count:16];
            if (!v118)
            {

              goto LABEL_79;
            }
            id v115 = v44;
            char v111 = 0;
            uint64_t v117 = *(void *)v133;
            id v45 = v116;
            do
            {
              for (j = 0; j != v118; j = (char *)j + 1)
              {
                if (*(void *)v133 != v117) {
                  objc_enumerationMutation(v115);
                }
                long long v47 = *(void **)(*((void *)&v132 + 1) + 8 * (void)j);
                if ([v11 interfaceType] == (id)1 && objc_msgSend(v47, "isRemote"))
                {
                  long long v121 = [v47 deviceSource];
                  if ([v121 isEqualToString:@"iPad"]) {
                    goto LABEL_72;
                  }
                  long long v49 = [v47 deviceSource];
                  if ([v49 isEqualToString:@"MacDesktop"]) {
                    goto LABEL_71;
                  }
                  context = v48;
                  id v50 = [v47 deviceSource];
                  if ([v50 isEqualToString:@"MacPortable"]) {
                    goto LABEL_69;
                  }
                  long long v51 = [v47 deviceSource];
                  if ([v51 isEqualToString:@"TV"]) {
                    goto LABEL_66;
                  }
                  long long v52 = [v47 deviceSource];
                  unsigned __int8 v53 = [v52 isEqualToString:@"HomePod"];

                  id v45 = v116;
                  long long v48 = context;
                  if (v53) {
                    goto LABEL_73;
                  }
                }
                v119 = j;
                context = v48;
                if (v35)
                {
                  BOOL v54 = [v47 mediaType];
                  v55 = [v47 bundleId];
                  uint64_t v56 = +[MOMediaPlaySession getMOPlaySessionMediaType:v54 bundleId:v55];
                  unsigned __int8 v57 = [v35 containsObject:v56];

                  if (v57)
                  {
                    id v45 = v116;
                    j = v119;
                    long long v48 = context;
                    goto LABEL_73;
                  }
                }
                id v58 = objc_alloc((Class)NSDateInterval);
                long long v59 = [v47 startDate];
                long long v60 = [v47 endDate];
                id v61 = [v58 initWithStartDate:v59 endDate:v60];

                long long v121 = v61;
                long long v49 = [v114 intersectionWithDateInterval:v61];
                [v49 duration];
                if (v62 == 0.0)
                {
                  id v45 = v116;
                  j = v119;
                  goto LABEL_70;
                }
                [v49 duration];
                float v34 = v63 + v34;
                if (!v112 || ![v113 count])
                {
LABEL_51:
                  [v110 addObject:v47, v99];
                  double v71 = [v47 title];
                  __int16 v72 = [v33 objectForKeyedSubscript:v71];

                  if (!v72)
                  {
                    id v50 = [v122 eventIdentifier];
                    long long v51 = [v47 title];
                    [v33 setObject:v50 forKeyedSubscript:v51];
                    char v111 = 1;
                    j = v119;
LABEL_66:

                    id v45 = v116;
                    goto LABEL_69;
                  }
                  long long v126 = 0u;
                  long long v127 = 0u;
                  long long v124 = 0u;
                  long long v125 = 0u;
                  id v45 = v116;
                  id v50 = v116;
                  id v73 = [v50 countByEnumeratingWithState:&v124 objects:v144 count:16];
                  if (!v73)
                  {
                    char v111 = 1;
                    id v11 = v107;
                    goto LABEL_68;
                  }
                  id v74 = v73;
                  v109 = v49;
                  uint64_t v75 = *(void *)v125;
                  while (2)
                  {
                    uint64_t v76 = 0;
LABEL_55:
                    if (*(void *)v125 != v75) {
                      objc_enumerationMutation(v50);
                    }
                    id v77 = *(void **)(*((void *)&v124 + 1) + 8 * v76);
                    __int16 v78 = [v77 eventIdentifier];
                    id v79 = [v47 title];
                    v80 = [v33 objectForKeyedSubscript:v79];
                    if (v78 != v80)
                    {

                      goto LABEL_61;
                    }
                    v81 = [v77 startDate];
                    v82 = [v122 startDate];
                    [v81 timeIntervalSinceDate:v82];
                    double v84 = v83;

                    if (v84 > 0.0)
                    {
                      __int16 v78 = [v122 eventIdentifier];
                      id v79 = [v47 title];
                      [v33 setObject:v78 forKeyedSubscript:v79];
LABEL_61:
                    }
                    if (v74 == (id)++v76)
                    {
                      id v74 = [v50 countByEnumeratingWithState:&v124 objects:v144 count:16];
                      if (!v74)
                      {
                        char v111 = 1;
                        id v11 = v107;
                        id v35 = v108;
                        id v45 = v116;
                        j = v119;
                        long long v49 = v109;
                        goto LABEL_69;
                      }
                      continue;
                    }
                    goto LABEL_55;
                  }
                }
                long long v130 = 0u;
                long long v131 = 0u;
                long long v128 = 0u;
                long long v129 = 0u;
                id v50 = v113;
                id v64 = [v50 countByEnumeratingWithState:&v128 objects:v145 count:16];
                if (!v64) {
                  goto LABEL_49;
                }
                id v65 = v64;
                uint64_t v66 = *(void *)v129;
                do
                {
                  for (k = 0; k != v65; k = (char *)k + 1)
                  {
                    if (*(void *)v129 != v66) {
                      objc_enumerationMutation(v50);
                    }
                    long long v68 = [*(id *)(*((void *)&v128 + 1) + 8 * (void)k) intersectionWithDateInterval:v121, v99];
                    [v68 duration];
                    double v70 = v69;

                    if (v70 > 0.0)
                    {

                      id v35 = v108;
                      goto LABEL_51;
                    }
                  }
                  id v65 = [v50 countByEnumeratingWithState:&v128 objects:v145 count:16];
                }
                while (v65);
                id v35 = v108;
LABEL_49:
                id v45 = v116;
LABEL_68:
                j = v119;
LABEL_69:

LABEL_70:
                long long v48 = context;
LABEL_71:

LABEL_72:
LABEL_73:
              }
              id v118 = [v115 countByEnumeratingWithState:&v132 objects:v146 count:16];
            }
            while (v118);

            if (v111) {
              [v45 addObject:v122];
            }
            id v44 = v115;
LABEL_79:

            uint64_t v36 = v106 + 1;
          }
          while ((id)(v106 + 1) != v104);
          id v104 = [obj countByEnumeratingWithState:&v136 objects:v151 count:16];
          if (!v104) {
            goto LABEL_83;
          }
        }
      }
      float v34 = 0.0;
LABEL_83:

      double v123 = -1.0;
      id v85 = +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:v110 intervalOfInterest:v114 dominantFactorThreshold:&v123 confidence:0.8];
      v86 = v85;
      if (v85)
      {
        uint64_t v87 = [v85 objectForKeyedSubscript:@"DominantMediaNameKey"];
        if (v87)
        {
          v88 = (void *)v87;
          uint64_t v89 = [v86 objectForKeyedSubscript:@"DominantMediaPropertyKey"];

          if (v89)
          {
            v90 = +[MOContextAnnotationUtilities creatMediaActionWithMediaInfo:v86 mediaNameConfidence:v123];
            [v11 setConcurrentMediaAction:v90];

            id v91 = +[MOContextAnnotationUtilities createMediaResourceWithMediaInfo:playSessions:eventIdentifiersMapping:isDominant:](MOContextAnnotationUtilities, "createMediaResourceWithMediaInfo:playSessions:eventIdentifiersMapping:isDominant:", v86, v110, v33, v123 > 0.8, v123);
            if ([v91 count])
            {
              [v11 addResources:v91];
              v92 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
              {
                v93 = [v11 resources];
                id v94 = [v93 count];
                v95 = [v11 resources];
                id v96 = [v95 count];
                *(_DWORD *)buf = 134218240;
                id v148 = v94;
                __int16 v149 = 2048;
                id v150 = v96;
                _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "Add media resources, %lu, total, %lu", buf, 0x16u);
              }
            }
          }
        }
      }
      if (v34 <= a6)
      {
        id v20 = &__NSArray0__struct;
        id v13 = v108;
        v97 = v116;
      }
      else
      {
        v97 = v116;
        id v20 = v116;
        id v13 = v108;
      }

      uint64_t v14 = v99;
      id v12 = v100;
    }
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

+ (id)creatMediaActionWithMediaInfo:(id)a3 mediaNameConfidence:(double)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 setObject:&off_1002F4B38 forKeyedSubscript:@"MediaActionMetaDataMediaType"];
  id v7 = [v5 objectForKeyedSubscript:@"DominantMediaBundleIdKey"];
  unsigned int v8 = [v7 isEqualToString:@"com.apple.tv"];

  if (v8) {
    [v6 setObject:&off_1002F4B50 forKeyedSubscript:@"MediaActionMetaDataMediaType"];
  }
  id v9 = [v5 objectForKeyedSubscript:@"DominantMediaInfoKey"];
  [v6 setObject:v9 forKeyedSubscript:@"MediaActionMetaDataMediaInfoType"];

  id v10 = [MOAction alloc];
  id v11 = [v5 objectForKeyedSubscript:@"DominantMediaNameKey"];
  id v12 = [(MOAction *)v10 initWithActionName:v11 actionType:6 actionSubtype:0 actionNameConfidence:a4];

  [(MOAction *)v12 setActionMetaData:v6];
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    double v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Action, %@", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

+ (id)createMediaResourceWithMediaInfo:(id)a3 playSessions:(id)a4 eventIdentifiersMapping:(id)a5 isDominant:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v82 = a4;
  id v83 = a5;
  uint64_t v89 = objc_opt_new();
  id v10 = [v9 objectForKeyedSubscript:@"DominantMediaPropertyKey"];
  id v11 = [v10 stringByAppendingString:@"=%@"];

  id v12 = [v9 objectForKeyedSubscript:@"DominantMediaNameKey"];
  id v13 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v11, v12);

  uint64_t v14 = [v9 objectForKeyedSubscript:@"DominantMediaPropertyKey"];
  LODWORD(v10) = [v14 isEqualToString:@"bundleId"];

  if (v10)
  {
    int v15 = [v9 objectForKeyedSubscript:@"DominantMediaBundleIdKey"];
    uint64_t v16 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v11, v15);

    v80 = (void *)v16;
  }
  else
  {
    v80 = v13;
  }
  id v81 = v9;
  double v17 = [v9 objectForKeyedSubscript:@"DominantMediaPropertyKey"];
  unsigned int v18 = [v17 isEqualToString:@"bundleId"];

  if (!v18 || v6)
  {
    id v19 = [v82 filteredArrayUsingPredicate:v80];
  }
  else
  {
    id v19 = v82;
  }
  id v20 = v19;
  id v21 = v9;
  if ([v19 count])
  {
    id v79 = v20;
    uint64_t v22 = [v20 sortedArrayUsingComparator:&__block_literal_global_8];
    id v23 = [v22 reverseObjectEnumerator];
    id v24 = [v23 allObjects];

    if ([v24 count])
    {
      v88 = objc_opt_new();
      double v84 = objc_opt_new();
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id obj = v24;
      id v97 = [obj countByEnumeratingWithState:&v106 objects:v115 count:16];
      if (v97)
      {
        uint64_t v96 = *(void *)v107;
        double v25 = 201.0;
        v86 = v24;
        uint64_t v87 = v11;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v107 != v96) {
              objc_enumerationMutation(obj);
            }
            double v27 = *(void **)(*((void *)&v106 + 1) + 8 * (void)v26);
            id v29 = [v27 bundleId];
            if (([v29 isEqualToString:@"com.apple.Music"] & 1) != 0
              || [v29 isEqualToString:@"com.apple.MediaPlayer.RemotePlayerService"])
            {
              id v30 = [v27 album];
              double v31 = MOMediaPlayMetaDataKeyPlayerMediaTypeSong;
            }
            else if ([v29 isEqualToString:@"com.apple.podcasts"])
            {
              id v30 = [v27 artist];
              double v31 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode;
            }
            else
            {
              id v30 = [v27 title];
              double v31 = MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia;
            }
            id v32 = *v31;
            if (v30)
            {
              v111[0] = @"MOMediaPlayMetaDataKeyPlayerTitle";
              double v33 = [v27 title];
              v98 = v29;
              if (v33)
              {
                v95 = [v27 title];
                CFStringRef v34 = v95;
              }
              else
              {
                CFStringRef v34 = &stru_1002D2AC8;
              }
              v101 = v30;
              v112[0] = v34;
              v111[1] = @"MOMediaPlayMetaDataKeyPlayerArtist";
              uint64_t v36 = [v27 artist];
              id v37 = v32;
              if (v36)
              {
                id v94 = [v27 artist];
                CFStringRef v38 = v94;
              }
              else
              {
                CFStringRef v38 = &stru_1002D2AC8;
              }
              v112[1] = v38;
              v111[2] = @"MOMediaPlayMetaDataKeyPlayerTrackID";
              uint64_t v39 = [v27 productId];
              if (v39)
              {
                v93 = [v27 productId];
                CFStringRef v40 = v93;
              }
              else
              {
                CFStringRef v40 = &stru_1002D2AC8;
              }
              v112[2] = v40;
              v111[3] = @"MOMediaPlayMetaDataKeyPlayerAlbumName";
              double v41 = [v27 album];
              if (v41)
              {
                v92 = [v27 album];
                CFStringRef v42 = v92;
              }
              else
              {
                CFStringRef v42 = &stru_1002D2AC8;
              }
              v112[3] = v42;
              v111[4] = @"MOMediaPlayMetaDataKeyPlayerBundleID";
              id v43 = [v27 bundleId];
              v99 = v28;
              if (v43)
              {
                id v91 = [v27 bundleId];
                CFStringRef v44 = v91;
              }
              else
              {
                CFStringRef v44 = &stru_1002D2AC8;
              }
              v112[4] = v44;
              v112[5] = v37;
              v111[5] = @"MOMediaPlayMetaDataKeyPlayerMediaTypeKey";
              v111[6] = @"MOMediaPlayMetaDataKeyPlayerBgColor";
              id v45 = [v27 bgColor];
              if (v45)
              {
                v90 = [v27 bgColor];
                CFStringRef v46 = v90;
              }
              else
              {
                CFStringRef v46 = &stru_1002D2AC8;
              }
              v112[6] = v46;
              long long v47 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:7];
              id v100 = [v47 mutableCopy];

              if (v45) {
              if (v43)
              }

              if (v41) {
              id v11 = v87;
              }
              id v35 = v100;
              if (v39) {

              }
              if (v36) {
              id v32 = v37;
              }
              if (v33) {

              }
              long long v48 = [v27 startDate];

              id v30 = v101;
              if (v48)
              {
                long long v49 = [v27 startDate];
                [v49 timeIntervalSinceReferenceDate];
                id v50 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                [v100 setObject:v50 forKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerStartDate"];
              }
              long long v51 = [v88 objectForKey:v101];

              if (v51)
              {
                long long v52 = [v88 objectForKey:v101];
                unsigned __int8 v53 = [(MOResource *)v52 getDictionary];
                id v54 = [v53 mutableCopy];

                unsigned __int8 v55 = [(__CFString *)v32 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeSong[0]];
                uint64_t v56 = MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum;
                if ((v55 & 1) != 0
                  || (unsigned __int8 v57 = [(__CFString *)v32 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode[0]], v56 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist, (v57 & 1) != 0)|| (v58 = [(__CFString *)v32 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia[0]], v56 = MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum, v58))
                {
                  [v54 setObject:*v56 forKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];
                }
                long long v59 = v32;
                long long v60 = [[MOResource alloc] initWithName:v101 type:3 dict:v54 value:0.0];
                id v61 = [(MOResource *)v52 sourceEventIdentifier];
                [(MOResource *)v60 setSourceEventIdentifier:v61];

                [(MOResource *)v60 setSourceEventAccessType:[(MOResource *)v52 sourceEventAccessType]];
                [v88 setObject:v60 forKeyedSubscript:v101];
                double v62 = [MOResource alloc];
                double v63 = [v27 title];
                id v35 = v100;
                id v64 = [(MOResource *)v62 initWithName:v63 type:3 dict:v100 value:0.0];

                id v65 = [(MOResource *)v52 sourceEventIdentifier];
                [(MOResource *)v64 setSourceEventIdentifier:v65];

                [(MOResource *)v64 setSourceEventAccessType:[(MOResource *)v52 sourceEventAccessType]];
                -[MOResource setPriorityScore:](v64, "setPriorityScore:", (double)((unint64_t)[v84 count] + 300));
                [v84 addObject:v64];

                id v32 = v59;
                id v30 = v101;
              }
              else
              {
                uint64_t v66 = [MOResource alloc];
                long long v67 = [v27 title];
                long long v52 = [(MOResource *)v66 initWithName:v67 type:3 dict:v100 value:0.0];

                long long v68 = [v27 title];
                double v69 = [v83 objectForKeyedSubscript:v68];
                [(MOResource *)v52 setSourceEventIdentifier:v69];

                [(MOResource *)v52 setSourceEventAccessType:2];
                [(MOResource *)v52 setPriorityScore:v25];
                [v88 setObject:v52 forKeyedSubscript:v101];
                double v25 = v25 + 1.0;
              }
              id v24 = v86;

              id v29 = v98;
              v28 = v99;
            }
            else
            {
              id v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                +[MOContextAnnotationUtilities createMediaResourceWithMediaInfo:playSessions:eventIdentifiersMapping:isDominant:](v113, v27, &v114, v35);
              }
            }

            uint64_t v26 = (char *)v26 + 1;
          }
          while (v97 != v26);
          id v70 = [obj countByEnumeratingWithState:&v106 objects:v115 count:16];
          id v97 = v70;
        }
        while (v70);
      }

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v71 = v88;
      id v72 = [v71 countByEnumeratingWithState:&v102 objects:v110 count:16];
      if (v72)
      {
        id v73 = v72;
        uint64_t v74 = *(void *)v103;
        do
        {
          for (i = 0; i != v73; i = (char *)i + 1)
          {
            if (*(void *)v103 != v74) {
              objc_enumerationMutation(v71);
            }
            uint64_t v76 = [v71 objectForKey:*(void *)(*((void *)&v102 + 1) + 8 * i)];
            if (v76) {
              [v89 addObject:v76];
            }
          }
          id v73 = [v71 countByEnumeratingWithState:&v102 objects:v110 count:16];
        }
        while (v73);
      }
    }
    id v21 = v81;
    id v20 = v79;
  }
  id v77 = [v89 copy];

  return v77;
}

int64_t __113__MOContextAnnotationUtilities_createMediaResourceWithMediaInfo_playSessions_eventIdentifiersMapping_isDominant___block_invoke(id a1, MOMediaPlaySession *a2, MOMediaPlaySession *a3)
{
  v4 = a3;
  id v5 = a2;
  BOOL v6 = [(MOMediaPlaySession *)v5 endDate];
  id v7 = [(MOMediaPlaySession *)v5 startDate];

  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  id v10 = [(MOMediaPlaySession *)v4 endDate];
  id v11 = [(MOMediaPlaySession *)v4 startDate];

  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  if (v9 >= v13) {
    int64_t v14 = 0;
  }
  else {
    int64_t v14 = -1;
  }
  if (v9 > v13) {
    return 1;
  }
  else {
    return v14;
  }
}

+ (id)dominantMediaNameFromEvents:(id)a3
{
  id v63 = a3;
  double v62 = objc_opt_new();
  v88[0] = &off_1002F4B50;
  v88[1] = &off_1002F4B68;
  v89[0] = @"mediaTitle";
  v89[1] = @"mediaAlbum";
  v88[2] = &off_1002F4B80;
  v88[3] = &off_1002F4B98;
  v89[2] = @"mediaArtist";
  v89[3] = @"mediaGenre";
  v88[4] = &off_1002F4BB0;
  v89[4] = @"mediaPlayerBundleId";
  id v64 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:5];
  int v3 = 1;
  *(void *)&long long v4 = 138412802;
  long long v60 = v4;
  while (1)
  {
    int v65 = v3;
    uint64_t v66 = +[NSNumber numberWithInt:v60];
    id v5 = [v64 objectForKey:];
    double v69 = objc_opt_new();
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id obj = v63;
    id v6 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v75;
      double v9 = 0.0;
      long long v68 = v5;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v75 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          id v13 = objc_alloc((Class)NSDateInterval);
          int64_t v14 = [v11 startDate];
          int v15 = [v11 endDate];
          id v16 = [v13 initWithStartDate:v14 endDate:v15];

          [v16 duration];
          double v18 = v17;
          id v19 = [v11 mediaEvent];

          if (v19)
          {
            id v20 = [v11 mediaEvent];
            id v21 = [v20 valueForKeyPath:v5];

            if (!v21 || ![(__CFString *)v21 length])
            {

              id v21 = @"__Unknown__";
            }
            [v16 duration];
            double v23 = v22;
            id v24 = [v69 objectForKey:v21];
            if (v24)
            {
              double v25 = v24;
              [(MOMediaStats *)v24 value];
              [(MOMediaStats *)v25 setValue:v23 + v26];
            }
            else
            {
              double v25 = [[MOMediaStats alloc] initWithKeyword:v21 value:v23];
            }
            double v27 = [v11 mediaEvent];
            v28 = [v27 mediaPlayerBundleId];
            [(MOMediaStats *)v25 setBundleId:v28];

            id v29 = [(MOMediaStats *)v25 members];
            [v29 addObject:v11];

            [v69 setObject:v25 forKey:v21];
            id v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              double v31 = +[MOMediaPlaySession redactString:v21];
              [(MOMediaStats *)v25 value];
              *(_DWORD *)buf = 138413058;
              v80 = v68;
              __int16 v81 = 2112;
              id v82 = v31;
              __int16 v83 = 2048;
              double v84 = v23;
              __int16 v85 = 2048;
              double v86 = v32;
              _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Third Party media, property.path, %@, property.name, %@, property.value, %f, total.value, %f", buf, 0x2Au);
            }
            id v5 = v68;
          }
          double v9 = v9 + v18;
        }
        id v7 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    double v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    CFStringRef v34 = v69;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v80 = v5;
      __int16 v81 = 2112;
      id v82 = v69;
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Third Party media, property.path, %@, stats %@", buf, 0x16u);
    }

    if (![v69 count]) {
      goto LABEL_60;
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v35 = [v69 allValues];
    id v36 = [v35 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v36)
    {
      id v37 = v36;
      CFStringRef v38 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)v71;
      double v41 = -1.0;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v71 != v40) {
            objc_enumerationMutation(v35);
          }
          id v43 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
          CFStringRef v44 = [v43 keyword];
          unsigned __int8 v45 = [v44 isEqualToString:@"__Unknown__"];

          if ((v45 & 1) == 0)
          {
            [v43 value];
            if (v46 > v41)
            {
              [v43 value];
              double v41 = v47;
              uint64_t v48 = [v43 keyword];

              uint64_t v49 = [v43 bundleId];

              CFStringRef v38 = (__CFString *)v48;
              uint64_t v39 = (void *)v49;
            }
          }
        }
        id v37 = [v35 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v37);
    }
    else
    {
      CFStringRef v38 = 0;
      uint64_t v39 = 0;
      double v41 = -1.0;
    }

    id v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v55 = +[MOMediaPlaySession redactString:v38];
      *(_DWORD *)buf = 138413058;
      v80 = v5;
      __int16 v81 = 2112;
      id v82 = v55;
      __int16 v83 = 2048;
      double v84 = v41;
      __int16 v85 = 2048;
      double v86 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "Third Party media, property.path, %@, topKeyword, %@, topDuration %f, totalDuration, %f", buf, 0x2Au);
    }
    if (v41 >= v9)
    {
      if ([v5 isEqual:@"mediaPlayerBundleId"])
      {
        long long v52 = +[MOContextAnnotationUtilities bundleNameFromBundleId:v38];
        long long v51 = v52;
        if (v52) {
          unsigned __int8 v53 = v52;
        }
      }
      else
      {
        long long v51 = v38;
      }
      id v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      CFStringRef v34 = v69;
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
LABEL_55:

        if (v66 && v51 && v39 && v5)
        {
          [v62 setObject:v51 forKeyedSubscript:@"DominantMediaNameKey"];
          [v62 setObject:v39 forKeyedSubscript:@"DominantMediaBundleIdKey"];
          [v62 setObject:v5 forKeyedSubscript:@"DominantMediaPropertyKey"];
          unsigned int v58 = v66;
          [v62 setObject:v66 forKeyedSubscript:@"DominantMediaInfoKey"];
          id v57 = v62;
          goto LABEL_65;
        }
        goto LABEL_59;
      }
LABEL_62:
      uint64_t v56 = +[MOMediaPlaySession redactString:v51];
      *(_DWORD *)buf = v60;
      v80 = v56;
      __int16 v81 = 2112;
      id v82 = v5;
      __int16 v83 = 2048;
      double v84 = v41;
      _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "Third Party media, mediaName, %@, property.path, %@, duration, %f", buf, 0x20u);

      goto LABEL_55;
    }
    if (v65 == 5) {
      break;
    }
    long long v51 = v38;
    CFStringRef v34 = v69;
LABEL_59:

LABEL_60:
    int v3 = v65 + 1;
    if (v65 == 5)
    {
      id v57 = 0;
      goto LABEL_66;
    }
  }
  if ([v5 isEqual:@"mediaPlayerBundleId"])
  {

    long long v51 = @"Media";
  }
  else
  {
    long long v51 = v38;
  }
  CFStringRef v34 = v69;
  if (v41 <= 0.0 || v9 <= 0.0 || v41 / v9 >= 1.0)
  {
    id v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_55;
    }
    goto LABEL_62;
  }
  id v57 = 0;
  unsigned int v58 = v66;
LABEL_65:

LABEL_66:

  return v57;
}

+ (id)dominantMediaNameFromPlaySessions:(id)a3 intervalOfInterest:(id)a4 dominantFactorThreshold:(double)a5 confidence:(double *)a6
{
  id v86 = a3;
  id v10 = a4;
  id v11 = v10;
  if (a5 < 0.0)
  {
    double v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:]();
    }

    id v13 = +[NSAssertionHandler currentHandler];
    CFStringRef v14 = @"Invalid parameter not satisfying: dominantFactorThreshold >= 0";
    SEL v15 = a2;
    id v16 = a1;
    double v17 = v13;
    uint64_t v18 = 858;
LABEL_82:
    [v13 handleFailureInMethod:v15 object:v16 file:@"MOContextAnnotationUtilities.m" lineNumber:v18 description:v14];
    id v80 = 0;
    goto LABEL_85;
  }
  [v10 duration];
  if (v19 <= 0.0)
  {
    id v79 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:]();
    }

    id v13 = +[NSAssertionHandler currentHandler];
    CFStringRef v14 = @"Invalid parameter not satisfying: intervalOfInterest.duration > 0";
    SEL v15 = a2;
    id v16 = a1;
    double v17 = v13;
    uint64_t v18 = 859;
    goto LABEL_82;
  }
  __int16 v83 = objc_opt_new();
  v112[0] = &off_1002F4B50;
  v112[1] = &off_1002F4B68;
  v113[0] = @"title";
  v113[1] = @"album";
  v112[2] = &off_1002F4B80;
  v112[3] = &off_1002F4B98;
  v113[2] = @"artist";
  v113[3] = @"genre";
  v112[4] = &off_1002F4BB0;
  uint8_t v113[4] = @"bundleId";
  __int16 v85 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:5];
  id v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:](v86);
  }

  int v21 = 1;
  *(void *)&long long v22 = 138413314;
  long long v82 = v22;
  v90 = v11;
  while (2)
  {
    int v87 = v21;
    v88 = +[NSNumber numberWithInt:v82];
    uint64_t v89 = [v85 objectForKey:];
    id v91 = objc_opt_new();
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v23 = v86;
    id v24 = [v23 countByEnumeratingWithState:&v96 objects:v111 count:16];
    if (!v24)
    {
      double v27 = 0.0;
      goto LABEL_34;
    }
    id v25 = v24;
    uint64_t v26 = *(void *)v97;
    double v27 = 0.0;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v97 != v26) {
          objc_enumerationMutation(v23);
        }
        id v29 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        id v30 = objc_alloc((Class)NSDateInterval);
        double v31 = [v29 startDate];
        double v32 = [v29 endDate];
        id v33 = [v30 initWithStartDate:v31 endDate:v32];

        id v34 = v33;
        id v35 = v34;
        if (!v11
          || ([v11 intersectionWithDateInterval:v34],
              id v35 = objc_claimAutoreleasedReturnValue(),
              v34,
              [v35 duration],
              v36 != 0.0))
        {
          [v35 duration];
          double v38 = v37;
          uint64_t v39 = [v29 valueForKeyPath:v89];
          uint64_t v40 = [v29 bundleId];
          if ([v40 isEqualToString:@"com.apple.podcasts"])
          {
            id v41 = [v88 unsignedLongValue];

            BOOL v42 = v41 == (id)2;
            id v11 = v90;
            if (!v42)
            {
              if (!v39)
              {
LABEL_22:

                uint64_t v39 = @"__Unknown__";
                goto LABEL_23;
              }
LABEL_21:
              if (![(__CFString *)v39 length]) {
                goto LABEL_22;
              }
LABEL_23:
              [v35 duration];
              double v44 = v43;
              unsigned __int8 v45 = [v91 objectForKey:v39];
              if (v45)
              {
                double v46 = v45;
                [(MOMediaStats *)v45 value];
                [(MOMediaStats *)v46 setValue:v44 + v47];
              }
              else
              {
                double v46 = [[MOMediaStats alloc] initWithKeyword:v39 value:v44];
              }
              uint64_t v48 = [v29 bundleId];
              [(MOMediaStats *)v46 setBundleId:v48];

              uint64_t v49 = [(MOMediaStats *)v46 members];
              [v49 addObject:v29];

              [v91 setObject:v46 forKey:v39];
              id v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                long long v51 = +[MOMediaPlaySession redactString:v39];
                [(MOMediaStats *)v46 value];
                *(_DWORD *)buf = 138413058;
                v101 = v89;
                __int16 v102 = 2112;
                long long v103 = v51;
                __int16 v104 = 2048;
                double v105 = v44;
                __int16 v106 = 2048;
                double v107 = v52;
                _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, property.name, %@, property.value, %f, total.value, %f", buf, 0x2Au);
              }
              id v11 = v90;
            }
            double v27 = v27 + v38;

            goto LABEL_30;
          }

          if (!v39) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
LABEL_30:
      }
      id v25 = [v23 countByEnumeratingWithState:&v96 objects:v111 count:16];
    }
    while (v25);
LABEL_34:

    unsigned __int8 v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    id v54 = v91;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v101 = v89;
      __int16 v102 = 2112;
      long long v103 = v91;
      _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, stats %@", buf, 0x16u);
    }

    if (![v91 count])
    {
LABEL_76:

      int v21 = v87 + 1;
      if (v87 == 5)
      {
        id v80 = 0;
        double v17 = v83;
        goto LABEL_84;
      }
      continue;
    }
    break;
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  unsigned __int8 v55 = [v91 allValues];
  id v56 = [v55 countByEnumeratingWithState:&v92 objects:v110 count:16];
  if (v56)
  {
    id v57 = v56;
    unsigned int v58 = 0;
    long long v59 = 0;
    uint64_t v60 = *(void *)v93;
    double v61 = -1.0;
    do
    {
      for (j = 0; j != v57; j = (char *)j + 1)
      {
        if (*(void *)v93 != v60) {
          objc_enumerationMutation(v55);
        }
        id v63 = *(void **)(*((void *)&v92 + 1) + 8 * (void)j);
        id v64 = [v63 keyword];
        unsigned __int8 v65 = [v64 isEqualToString:@"__Unknown__"];

        if ((v65 & 1) == 0)
        {
          [v63 value];
          if (v66 > v61)
          {
            [v63 value];
            double v61 = v67;
            uint64_t v68 = [v63 keyword];

            uint64_t v69 = [v63 bundleId];

            unsigned int v58 = (__CFString *)v68;
            long long v59 = (void *)v69;
          }
        }
      }
      id v57 = [v55 countByEnumeratingWithState:&v92 objects:v110 count:16];
    }
    while (v57);
  }
  else
  {
    unsigned int v58 = 0;
    long long v59 = 0;
    double v61 = -1.0;
  }

  long long v70 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    long long v75 = +[MOMediaPlaySession redactString:v58];
    *(_DWORD *)buf = 138413058;
    v101 = v89;
    __int16 v102 = 2112;
    long long v103 = v75;
    __int16 v104 = 2048;
    double v105 = v61;
    __int16 v106 = 2048;
    double v107 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, topKeyword, %@, topDuration %f, totalDuration, %f", buf, 0x2Au);
  }
  if (v61 > v27 * a5)
  {
    if ([v89 isEqual:@"bundleId"])
    {
      long long v71 = +[MOContextAnnotationUtilities bundleNameFromBundleId:v58];
      long long v72 = v71;
      if (v71) {
        long long v73 = v71;
      }
    }
    else
    {
      long long v72 = v58;
    }
    id v54 = v91;
    if (v61 > 0.0 && v27 > 0.0) {
      *a6 = v61 / v27;
    }
    long long v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_78;
    }
    goto LABEL_71;
  }
  if (v87 != 5)
  {
    long long v72 = v58;
    id v54 = v91;
    goto LABEL_75;
  }
  if ([v89 isEqual:@"bundleId"])
  {

    long long v72 = @"Media";
  }
  else
  {
    long long v72 = v58;
  }
  id v54 = v91;
  if (v61 > 0.0 && v27 > 0.0) {
    *a6 = v61 / v27;
  }
  long long v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
  {
LABEL_78:
    long long v76 = +[MOMediaPlaySession redactString:v72];
    [v11 duration];
    uint64_t v77 = *(void *)a6;
    *(_DWORD *)buf = v82;
    v101 = v76;
    __int16 v102 = 2112;
    long long v103 = v89;
    __int16 v104 = 2048;
    double v105 = v61;
    __int16 v106 = 2048;
    double v107 = v78;
    __int16 v108 = 2048;
    uint64_t v109 = v77;
    _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "MediaName, mediaName, %@, property.path, %@, duration, %f, intervalOfInterest, %f, confidence, %f", buf, 0x34u);
  }
LABEL_71:

  if (!v88 || !v72 || !v59 || !v89)
  {
LABEL_75:

    goto LABEL_76;
  }
  double v17 = v83;
  [v83 setObject:v72 forKeyedSubscript:@"DominantMediaNameKey"];
  [v83 setObject:v59 forKeyedSubscript:@"DominantMediaBundleIdKey"];
  [v83 setObject:v89 forKeyedSubscript:@"DominantMediaPropertyKey"];
  [v83 setObject:v88 forKeyedSubscript:@"DominantMediaInfoKey"];
  id v80 = v83;

LABEL_84:
LABEL_85:

  return v80;
}

+ (id)dominantMediaNameFromPlaySessions:(id)a3 intervalsOfInterest:(id)a4 dominantFactorThreshold:(double)a5 confidence:(double *)a6
{
  id v87 = a3;
  id v10 = a4;
  id v11 = v10;
  if (a5 < 0.0)
  {
    double v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:]();
    }

    id v13 = +[NSAssertionHandler currentHandler];
    CFStringRef v14 = v13;
    CFStringRef v15 = @"Invalid parameter not satisfying: dominantFactorThreshold >= 0";
    SEL v16 = a2;
    id v17 = a1;
    uint64_t v18 = 980;
LABEL_87:
    [v13 handleFailureInMethod:v16 object:v17 file:@"MOContextAnnotationUtilities.m" lineNumber:v18 description:v15];
    id v81 = 0;
    goto LABEL_90;
  }
  if (![v10 count])
  {
    long long v82 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:]();
    }

    id v13 = +[NSAssertionHandler currentHandler];
    CFStringRef v14 = v13;
    CFStringRef v15 = @"Invalid parameter not satisfying: intervalsOfInterest.count > 0";
    SEL v16 = a2;
    id v17 = a1;
    uint64_t v18 = 981;
    goto LABEL_87;
  }
  uint64_t v19 = objc_opt_new();
  v124[0] = &off_1002F4B50;
  v124[1] = &off_1002F4B68;
  v125[0] = @"title";
  v125[1] = @"album";
  v124[2] = &off_1002F4B80;
  v124[3] = &off_1002F4B98;
  v125[2] = @"artist";
  v125[3] = @"genre";
  v124[4] = &off_1002F4BB0;
  v125[4] = @"bundleId";
  id v86 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:5];
  id v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[MOContextAnnotationUtilities dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:](v87);
  }

  int v21 = 1;
  *(void *)&long long v22 = 138413314;
  long long v84 = v22;
  id v23 = NSAssertionHandler_ptr;
  long long v92 = v11;
  v88 = (void *)v19;
  while (1)
  {
    int v89 = v21;
    v90 = +[NSNumber numberWithInt:v84];
    long long v97 = [v86 objectForKey:x0];
    long long v98 = objc_opt_new();
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obj = v87;
    id v94 = [obj countByEnumeratingWithState:&v107 objects:v123 count:16];
    if (v94)
    {
      uint64_t v24 = *(void *)v108;
      double v25 = 0.0;
      uint64_t v91 = *(void *)v108;
      do
      {
        for (i = 0; i != v94; i = (char *)i + 1)
        {
          if (*(void *)v108 != v24) {
            objc_enumerationMutation(obj);
          }
          double v27 = *(void **)(*((void *)&v107 + 1) + 8 * i);
          id v28 = objc_alloc((Class)v23[12]);
          id v29 = [v27 startDate];
          id v30 = [v27 endDate];
          id v31 = [v28 initWithStartDate:v29 endDate:v30];

          if ([v11 count])
          {
            long long v95 = i;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            id v96 = v11;
            id v32 = [v96 countByEnumeratingWithState:&v103 objects:v122 count:16];
            if (v32)
            {
              id v33 = v32;
              id v34 = 0;
              uint64_t v35 = *(void *)v104;
              do
              {
                double v36 = 0;
                double v37 = v34;
                do
                {
                  if (*(void *)v104 != v35) {
                    objc_enumerationMutation(v96);
                  }
                  id v34 = [*(id *)(*((void *)&v103 + 1) + 8 * (void)v36) intersectionWithDateInterval:v31];

                  [v34 duration];
                  if (v38 != 0.0)
                  {
                    [v34 duration];
                    double v40 = v39;
                    id v41 = [v27 valueForKeyPath:v97];
                    BOOL v42 = v41;
                    if (!v41 || ![(__CFString *)v41 length])
                    {

                      BOOL v42 = @"__Unknown__";
                    }
                    [v34 duration];
                    double v44 = v43;
                    unsigned __int8 v45 = [v98 objectForKey:v42];
                    if (v45)
                    {
                      double v46 = v45;
                      [(MOMediaStats *)v45 value];
                      [(MOMediaStats *)v46 setValue:v44 + v47];
                    }
                    else
                    {
                      double v46 = [[MOMediaStats alloc] initWithKeyword:v42 value:v44];
                    }
                    uint64_t v48 = [v27 bundleId];
                    [(MOMediaStats *)v46 setBundleId:v48];

                    uint64_t v49 = [(MOMediaStats *)v46 members];
                    [v49 addObject:v27];

                    [v98 setObject:v46 forKey:v42];
                    id v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                    {
                      long long v51 = +[MOMediaPlaySession redactString:v42];
                      [(MOMediaStats *)v46 value];
                      *(_DWORD *)buf = 138413058;
                      id v112 = v97;
                      __int16 v113 = 2112;
                      uint64_t v114 = v51;
                      __int16 v115 = 2048;
                      double v116 = v44;
                      __int16 v117 = 2048;
                      double v118 = v52;
                      _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, property.name, %@, property.value, %f, total.value, %f", buf, 0x2Au);
                    }
                    double v25 = v25 + v40;
                  }
                  double v36 = (char *)v36 + 1;
                  double v37 = v34;
                }
                while (v33 != v36);
                id v33 = [v96 countByEnumeratingWithState:&v103 objects:v122 count:16];
              }
              while (v33);

              uint64_t v24 = v91;
              id v11 = v92;
              id v23 = NSAssertionHandler_ptr;
            }

            i = v95;
          }
        }
        id v94 = [obj countByEnumeratingWithState:&v107 objects:v123 count:16];
      }
      while (v94);
    }
    else
    {
      double v25 = 0.0;
    }

    unsigned __int8 v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    id v54 = v98;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v112 = v97;
      __int16 v113 = 2112;
      uint64_t v114 = v98;
      _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, stats %@", buf, 0x16u);
    }

    CFStringRef v14 = v88;
    if (![v98 count]) {
      goto LABEL_80;
    }
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    unsigned __int8 v55 = [v98 allValues];
    id v56 = [v55 countByEnumeratingWithState:&v99 objects:v121 count:16];
    if (v56)
    {
      id v57 = v56;
      unsigned int v58 = 0;
      long long v59 = 0;
      uint64_t v60 = *(void *)v100;
      double v61 = -1.0;
      do
      {
        for (j = 0; j != v57; j = (char *)j + 1)
        {
          if (*(void *)v100 != v60) {
            objc_enumerationMutation(v55);
          }
          id v63 = *(void **)(*((void *)&v99 + 1) + 8 * (void)j);
          id v64 = [v63 keyword];
          unsigned __int8 v65 = [v64 isEqualToString:@"__Unknown__"];

          if ((v65 & 1) == 0)
          {
            [v63 value];
            if (v66 > v61)
            {
              [v63 value];
              double v61 = v67;
              uint64_t v68 = [v63 keyword];

              uint64_t v69 = [v63 bundleId];

              unsigned int v58 = (__CFString *)v68;
              long long v59 = (void *)v69;
            }
          }
        }
        id v57 = [v55 countByEnumeratingWithState:&v99 objects:v121 count:16];
      }
      while (v57);
    }
    else
    {
      unsigned int v58 = 0;
      long long v59 = 0;
      double v61 = -1.0;
    }

    long long v70 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v77 = +[MOMediaPlaySession redactString:v58];
      *(_DWORD *)buf = 138413058;
      id v112 = v97;
      __int16 v113 = 2112;
      uint64_t v114 = v77;
      __int16 v115 = 2048;
      double v116 = v61;
      __int16 v117 = 2048;
      double v118 = v25;
      _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "MediaName, property.path, %@, topKeyword, %@, topDuration %f, totalDuration, %f", buf, 0x2Au);
    }
    id v11 = v92;
    if (v61 > v25 * a5)
    {
      id v23 = NSAssertionHandler_ptr;
      if ([v97 isEqual:@"bundleId"])
      {
        long long v71 = +[MOContextAnnotationUtilities bundleNameFromBundleId:v58];
        long long v72 = v71;
        if (v71) {
          long long v73 = v71;
        }
      }
      else
      {
        long long v72 = v58;
      }
      CFStringRef v14 = v88;
      if (v61 > 0.0 && v25 > 0.0) {
        *a6 = v61 / v25;
      }
      long long v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_75;
      }
      long long v75 = +[MOMediaPlaySession redactString:v72];
      uint64_t v76 = *(void *)a6;
      *(_DWORD *)buf = v84;
      id v112 = v75;
      __int16 v113 = 2112;
      uint64_t v114 = v97;
      __int16 v115 = 2048;
      double v116 = v61;
      __int16 v117 = 2048;
      double v118 = v25;
      __int16 v119 = 2048;
      uint64_t v120 = v76;
      _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "MediaName, mediaName, %@, property.path, %@, duration, %f, total play duration, %f, confidence, %f", buf, 0x34u);
LABEL_83:

      goto LABEL_75;
    }
    id v23 = NSAssertionHandler_ptr;
    if (v89 == 5) {
      break;
    }
    long long v72 = v58;
    CFStringRef v14 = v88;
LABEL_79:

    id v54 = v98;
LABEL_80:

    int v21 = v89 + 1;
    if (v89 == 5)
    {
      id v81 = 0;
      goto LABEL_89;
    }
  }
  if ([v97 isEqual:@"bundleId"])
  {

    long long v72 = @"Media";
  }
  else
  {
    long long v72 = v58;
  }
  CFStringRef v14 = v88;
  if (v61 > 0.0 && v25 > 0.0) {
    *a6 = v61 / v25;
  }
  long long v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
  {
    long long v75 = +[MOMediaPlaySession redactString:v72];
    double v78 = [v92 firstObject];
    [v78 duration];
    uint64_t v79 = *(void *)a6;
    *(_DWORD *)buf = v84;
    id v112 = v75;
    __int16 v113 = 2112;
    uint64_t v114 = v97;
    __int16 v115 = 2048;
    double v116 = v61;
    __int16 v117 = 2048;
    double v118 = v80;
    __int16 v119 = 2048;
    uint64_t v120 = v79;
    _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "MediaName, mediaName, %@, property.path, %@, duration, %f, intervalOfInterest, %f, confidence, %f", buf, 0x34u);

    CFStringRef v14 = v88;
    goto LABEL_83;
  }
LABEL_75:

  if (!v90 || !v72 || !v59 || !v97) {
    goto LABEL_79;
  }
  [v14 setObject:v72 forKeyedSubscript:@"DominantMediaNameKey"];
  [v14 setObject:v59 forKeyedSubscript:@"DominantMediaBundleIdKey"];
  [v14 setObject:v97 forKeyedSubscript:@"DominantMediaPropertyKey"];
  [v14 setObject:v90 forKeyedSubscript:@"DominantMediaInfoKey"];
  id v81 = v14;

LABEL_89:
LABEL_90:

  return v81;
}

+ (double)labelConfidenceForEventBundle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 action];
  double v5 = 1.0;
  if (v4)
  {
    id v6 = (void *)v4;
    id v7 = [v3 action];
    [v7 actionNameConfidence];
    double v9 = v8;

    if (v9 > 0.0)
    {
      id v10 = [v3 action];
      [v10 actionNameConfidence];
      double v5 = v11;
    }
  }
  double v12 = +[NSMutableString stringWithString:@"["];
  uint64_t v13 = [v3 concurrentMediaAction];
  if (v13)
  {
    CFStringRef v14 = (void *)v13;
    CFStringRef v15 = [v3 concurrentMediaAction];
    [v15 actionNameConfidence];
    double v17 = v16;

    if (v17 > 0.0)
    {
      uint64_t v18 = [v3 concurrentMediaAction];
      [v18 actionNameConfidence];
      double v5 = v5 * v19;

      id v20 = [v3 concurrentMediaAction];
      [v20 actionNameConfidence];
      [v12 appendFormat:@"(%f)", v21];
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v22 = [v3 actions];
  id v23 = [v22 countByEnumeratingWithState:&v48 objects:v64 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v49;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(v22);
        }
        double v27 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v27 actionNameConfidence];
        if (v28 > 0.0)
        {
          [v27 actionNameConfidence];
          double v5 = v5 * v29;
          [v27 actionNameConfidence];
          [v12 appendFormat:@"(%f)", v30];
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v48 objects:v64 count:16];
    }
    while (v24);
  }

  [v12 appendString:@"]"];
  uint64_t v31 = [v3 place];
  if (v31)
  {
    id v32 = (void *)v31;
    id v33 = [v3 place];
    [v33 placeNameConfidence];
    double v35 = v34;

    if (v35 > 0.0)
    {
      double v36 = [v3 place];
      [v36 placeNameConfidence];
      double v5 = v5 * v37;
    }
  }
  double v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    double v40 = [v3 action];
    [v40 actionNameConfidence];
    uint64_t v42 = v41;
    double v43 = [v3 concurrentMediaAction];
    [v43 actionNameConfidence];
    uint64_t v45 = v44;
    double v46 = [v3 place];
    [v46 placeNameConfidence];
    *(_DWORD *)buf = 134219266;
    double v53 = v5;
    __int16 v54 = 2048;
    uint64_t v55 = v42;
    __int16 v56 = 2048;
    uint64_t v57 = v45;
    __int16 v58 = 2112;
    long long v59 = v12;
    __int16 v60 = 2048;
    uint64_t v61 = v47;
    __int16 v62 = 2112;
    id v63 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "label confidence, label confidence score, %f, actionNameConfidence, %f, concurrentMediaActionNameConfidence, %f, backgroundActionNameConfidence, %@, placeNameConfidence, %f, bundle, %@", buf, 0x3Eu);
  }
  return v5;
}

+ (id)bundleNameFromBundleId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
    double v5 = [v4 localizedName];
    id v6 = +[MOContextAnnotationUtilities extendedBundleNameFromBundleName:v5 bundleId:v3];

    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      double v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[MOContextAnnotationUtilities bundleNameFromBundleId:]((uint64_t)v3, v8);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)extendedBundleNameFromBundleName:(id)a3 bundleId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSSet) initWithArray:&off_1002F8DF8];
  double v8 = 0;
  if (v5 && v6)
  {
    if ([v6 hasPrefix:@"com.apple."]
      && [v7 containsObject:v5])
    {
      id v9 = +[NSString stringWithFormat:@"Apple %@", v5];
    }
    else
    {
      id v9 = v5;
    }
    double v8 = v9;
  }

  return v8;
}

+ (id)andStringFromArray:(id)a3 propertyPath:(id)a4 maxCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (char *)[v7 count];
  if (!v9)
  {
    double v11 = 0;
    goto LABEL_13;
  }
  id v10 = v9;
  double v11 = 0;
  unint64_t v12 = 0;
  uint64_t v13 = v9 - 1;
  while (1)
  {
    CFStringRef v14 = [v7 objectAtIndex:v12];
    uint64_t v15 = [v14 valueForKeyPath:v8];
    double v16 = (void *)v15;
    if (!v11)
    {
      double v11 = +[NSMutableString stringWithString:v15];
      goto LABEL_9;
    }
    if (v13 != (char *)v12) {
      break;
    }
    [v11 appendFormat:@" and %@", v15];
LABEL_9:

    if (v10 == (char *)++v12) {
      goto LABEL_13;
    }
  }
  if (v12 < a5 - 1)
  {
    [v11 appendFormat:@", %@", v15];
    goto LABEL_9;
  }
  [v11 appendFormat:@", %@ and more", v15];

LABEL_13:
  id v17 = [v11 copy];

  return v17;
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4
{
  return +[NSPredicate predicateWithFormat:@"(startDate >= %@ AND startDate <= %@) OR (endDate >= %@ AND endDate <= %@) OR (startDate <= %@ AND endDate >= %@)", a3, a4, a3, a4, a3, a4];
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 distanceThreshold:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v8 endDate:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __81__MOContextAnnotationUtilities_predicateWithStartDate_endDate_distanceThreshold___block_invoke;
  v13[3] = &unk_1002CAFF8;
  id v14 = v9;
  double v15 = a5;
  id v10 = v9;
  double v11 = +[NSPredicate predicateWithBlock:v13];

  return v11;
}

BOOL __81__MOContextAnnotationUtilities_predicateWithStartDate_endDate_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSDateInterval);
  id v5 = [v3 startDate];
  id v6 = [v3 endDate];

  id v7 = [v4 initWithStartDate:v5 endDate:v6];
  id v8 = [*(id *)(a1 + 32) intersectionWithDateInterval:v7];
  [v8 duration];
  double v10 = v9;
  [*(id *)(a1 + 32) duration];
  double v12 = v11;
  [*(id *)(a1 + 32) duration];
  double v14 = v13;
  [v7 duration];
  if (v14 > v15)
  {
    [v7 duration];
    double v12 = v16;
  }
  BOOL v17 = v12 <= 0.0 || v10 / v12 >= *(double *)(a1 + 40);

  return v17;
}

+ (id)predicateOfEventsWithPlaySessions
{
  return +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 6];
}

+ (id)predicateOfEventsWithPlaySessionsWithStartDate:(id)a3 endData:(id)a4
{
  return +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:a3 endData:a4 distanceThreshold:0.5];
}

+ (id)predicateOfEventsWithPlaySessionsWithStartDate:(id)a3 endData:(id)a4 distanceThreshold:(double)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __105__MOContextAnnotationUtilities_predicateOfEventsWithPlaySessionsWithStartDate_endData_distanceThreshold___block_invoke;
  v11[3] = &unk_1002CB020;
  id v12 = a3;
  id v13 = a4;
  double v14 = a5;
  id v7 = v13;
  id v8 = v12;
  double v9 = +[NSPredicate predicateWithBlock:v11];

  return v9;
}

uint64_t __105__MOContextAnnotationUtilities_predicateOfEventsWithPlaySessionsWithStartDate_endData_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 category] != (id)6) {
    goto LABEL_4;
  }
  id v4 = +[MOContextAnnotationUtilities predicateOfMediaPlaySessionsWithStartDate:*(void *)(a1 + 32) endDate:*(void *)(a1 + 40) distanceThreshold:*(double *)(a1 + 48)];
  id v5 = [v3 mediaPlaySessions];
  id v6 = [v5 filteredArrayUsingPredicate:v4];

  id v7 = [v6 count];
  if (v7) {
    uint64_t v8 = 1;
  }
  else {
LABEL_4:
  }
    uint64_t v8 = 0;

  return v8;
}

+ (id)predicateOfSocialContextEventWithStartDate:(id)a3 endData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"category", &off_1002F8E10];
  uint64_t v8 = +[MOContextAnnotationUtilities predicateWithStartDate:v6 endDate:v5];

  v12[0] = v7;
  v12[1] = v8;
  double v9 = +[NSArray arrayWithObjects:v12 count:2];
  double v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)predicateOfEmotionLogsWithStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"stateOfMindEvent.reflectiveInterval = %d", 1];
  double v9 = +[MOContextAnnotationUtilities predicateWithStartDate:v6 endDate:v5];

  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  double v10 = +[NSArray arrayWithObjects:v13 count:3];
  double v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)predicateOfMediaPlaySessionsWithStartDate:(id)a3 endDate:(id)a4 distanceThreshold:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v8 endDate:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __100__MOContextAnnotationUtilities_predicateOfMediaPlaySessionsWithStartDate_endDate_distanceThreshold___block_invoke;
  void v13[3] = &unk_1002CB048;
  id v14 = v9;
  double v15 = a5;
  id v10 = v9;
  double v11 = +[NSPredicate predicateWithBlock:v13];

  return v11;
}

uint64_t __100__MOContextAnnotationUtilities_predicateOfMediaPlaySessionsWithStartDate_endDate_distanceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSDateInterval);
  id v5 = [v3 startDate];
  id v6 = [v3 endDate];
  id v7 = [v4 initWithStartDate:v5 endDate:v6];

  id v8 = [*(id *)(a1 + 32) intersectionWithDateInterval:v7];
  [v8 duration];
  double v10 = v9;
  [*(id *)(a1 + 32) duration];
  double v12 = v11;
  [*(id *)(a1 + 32) duration];
  double v14 = v13;
  [v7 duration];
  if (v14 > v15)
  {
    [v7 duration];
    double v12 = v16;
  }
  if (v12 <= 0.0) {
    goto LABEL_7;
  }
  double v17 = v10 / v12;
  uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    int v22 = 134218754;
    double v23 = v17;
    __int16 v24 = 2112;
    uint64_t v25 = v21;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Jcard index, %f, baseEventInterval, %@, contextEventInterval, %@, contextEvent, %@", (uint8_t *)&v22, 0x2Au);
  }

  if (v17 > *(double *)(a1 + 40)) {
    uint64_t v19 = 1;
  }
  else {
LABEL_7:
  }
    uint64_t v19 = 0;

  return v19;
}

+ (void)addPhotoResources:(id)a3 universe:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __67__MOContextAnnotationUtilities_addPhotoResources_universe_handler___block_invoke;
  v8[3] = &unk_1002CB070;
  id v9 = a5;
  id v7 = v9;
  +[MOContextAnnotationUtilities addPhotoResourcesWithDateArray:a3 universe:a4 handler:v8];
}

uint64_t __67__MOContextAnnotationUtilities_addPhotoResources_universe_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)addPhotoResourcesWithDateArray:(id)a3 universe:(id)a4 handler:(id)a5
{
  id v94 = a3;
  id v88 = a4;
  __int16 v85 = (void (**)(id, id, uint64_t, id, uint64_t, uint64_t, id))a5;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "addPhotoResources", buf, 2u);
  }

  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  int v89 = [v88 getService:v9];

  *(void *)buf = 0;
  v157 = buf;
  uint64_t v158 = 0x3032000000;
  v159 = __Block_byref_object_copy__7;
  v160 = __Block_byref_object_dispose__7;
  id v161 = (id)objc_opt_new();
  uint64_t v152 = 0;
  v153 = &v152;
  uint64_t v154 = 0x2020000000;
  uint64_t v155 = 0;
  uint64_t v146 = 0;
  v147 = &v146;
  uint64_t v148 = 0x3032000000;
  __int16 v149 = __Block_byref_object_copy__7;
  id v150 = __Block_byref_object_dispose__7;
  id v151 = (id)objc_opt_new();
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  double v10 = [v94 resources];
  id v11 = [v10 countByEnumeratingWithState:&v142 objects:v167 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v143;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v143 != v12) {
          objc_enumerationMutation(v10);
        }
        [*((id *)v157 + 5) addObject:*(void *)(*((void *)&v142 + 1) + 8 * i)];
      }
      id v11 = [v10 countByEnumeratingWithState:&v142 objects:v167 count:16];
    }
    while (v11);
  }

  uint64_t v136 = 0;
  long long v137 = &v136;
  uint64_t v138 = 0x3032000000;
  long long v139 = __Block_byref_object_copy__7;
  long long v140 = __Block_byref_object_dispose__7;
  id v141 = [v94 startDate];
  uint64_t v130 = 0;
  long long v131 = &v130;
  uint64_t v132 = 0x3032000000;
  long long v133 = __Block_byref_object_copy__7;
  long long v134 = __Block_byref_object_dispose__7;
  id v135 = [v94 endDate];
  uint64_t v124 = 0;
  long long v125 = &v124;
  uint64_t v126 = 0x3032000000;
  long long v127 = __Block_byref_object_copy__7;
  long long v128 = __Block_byref_object_dispose__7;
  id v129 = (id)objc_opt_new();
  long long v84 = dispatch_group_create();
  dispatch_group_enter(v84);
  double v14 = objc_opt_new();
  long long v93 = +[NSMutableArray array];
  id v87 = [objc_alloc((Class)NSArray) initWithObjects:&off_1002F4B50, 0];
  double v15 = +[NSPredicate predicateWithFormat:@"category IN %@ ", v87];
  [v93 addObject:v15];

  double v16 = +[NSPredicate predicateWithFormat:@"provider != %lu", 5];
  [v93 addObject:v16];

  double v17 = [v94 events];
  uint64_t v18 = +[NSCompoundPredicate andPredicateWithSubpredicates:v93];
  uint64_t v91 = [v17 filteredArrayUsingPredicate:v18];

  if ([v91 count])
  {
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v19 = v91;
    id v20 = [v19 countByEnumeratingWithState:&v120 objects:v166 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v121;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v121 != v21) {
            objc_enumerationMutation(v19);
          }
          double v23 = *(void **)(*((void *)&v120 + 1) + 8 * (void)j);
          __int16 v24 = [v23 routineEvent];
          uint64_t v25 = [v24 location];
          BOOL v26 = v25 == 0;

          if (!v26)
          {
            id v27 = [v23 routineEvent];
            __int16 v28 = [v27 location];
            [v14 addObject:v28];
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v120 objects:v166 count:16];
      }
      while (v20);
    }
  }
  long long v92 = +[NSMutableArray array];
  id v86 = [objc_alloc((Class)NSArray) initWithObjects:&off_1002F4B68, &off_1002F4BF8, 0];
  id v29 = +[NSPredicate predicateWithFormat:@"category IN %@ ", v86];
  [v92 addObject:v29];

  uint64_t v30 = +[NSPredicate predicateWithFormat:@"provider != %lu", 5];
  [v92 addObject:v30];

  uint64_t v31 = [v94 events];
  id v32 = +[NSCompoundPredicate andPredicateWithSubpredicates:v92];
  v90 = [v31 filteredArrayUsingPredicate:v32];

  if ([v90 count])
  {
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id obj = v90;
    id v33 = [obj countByEnumeratingWithState:&v116 objects:v165 count:16];
    if (!v33) {
      goto LABEL_41;
    }
    uint64_t v100 = *(void *)v117;
    while (1)
    {
      id v101 = v33;
      for (k = 0; k != v101; k = (char *)k + 1)
      {
        if (*(void *)v117 != v100) {
          objc_enumerationMutation(obj);
        }
        double v35 = *(void **)(*((void *)&v116 + 1) + 8 * (void)k);
        double v36 = [v35 workoutEvent];
        double v37 = [v36 workoutLocationRoute];
        BOOL v38 = [v37 count] == 0;

        if (v38)
        {
          __int16 v54 = [v35 workoutEvent];
          uint64_t v55 = [v54 workoutLocationStart];
          BOOL v56 = v55 == 0;

          if (v56) {
            continue;
          }
          id v95 = objc_alloc((Class)RTLocation);
          long long v99 = [v35 workoutEvent];
          long long v98 = [v99 workoutLocationStart];
          [v98 coordinate];
          double v58 = v57;
          long long v97 = [v35 workoutEvent];
          long long v59 = [v97 workoutLocationStart];
          [v59 coordinate];
          double v61 = v60;
          __int16 v62 = [v35 workoutEvent];
          id v63 = [v62 workoutLocationStart];
          [v63 horizontalAccuracy];
          double v65 = v64;
          double v66 = [v35 workoutEvent];
          double v67 = [v66 workoutLocationStart];
          uint64_t v68 = [v67 timestamp];
          id v40 = [v95 initWithLatitude:v68 longitude:v58 horizontalUncertainty:v61 date:v65];

          [v14 addObject:v40];
        }
        else
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          double v39 = [v35 workoutEvent];
          id v40 = [v39 workoutLocationRoute];

          id v41 = [v40 countByEnumeratingWithState:&v112 objects:v164 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v113;
            do
            {
              for (m = 0; m != v41; m = (char *)m + 1)
              {
                if (*(void *)v113 != v42) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v44 = *(void **)(*((void *)&v112 + 1) + 8 * (void)m);
                id v45 = objc_alloc((Class)RTLocation);
                [v44 coordinate];
                double v47 = v46;
                [v44 coordinate];
                double v49 = v48;
                [v44 horizontalAccuracy];
                double v51 = v50;
                double v52 = [v44 timestamp];
                id v53 = [v45 initWithLatitude:v52 longitude:v47 horizontalUncertainty:v49 date:v51];

                [v14 addObject:v53];
              }
              id v41 = [v40 countByEnumeratingWithState:&v112 objects:v164 count:16];
            }
            while (v41);
          }
        }
      }
      id v33 = [obj countByEnumeratingWithState:&v116 objects:v165 count:16];
      if (!v33)
      {
LABEL_41:

        break;
      }
    }
  }
  uint64_t v69 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    id v70 = [v14 count];
    *(_DWORD *)v162 = 134217984;
    id v163 = v70;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "final locations count, %lu", v162, 0xCu);
  }

  BOOL v71 = [v94 bundleSubType] == (id)106 || [v94 bundleSuperType] == (id)5;
  if (v89)
  {
    long long v72 = [v94 startDate];
    long long v73 = [v94 endDate];
    long long v74 = [v94 bundleIdentifier];
    id v75 = [v94 interfaceType];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = __80__MOContextAnnotationUtilities_addPhotoResourcesWithDateArray_universe_handler___block_invoke;
    v102[3] = &unk_1002CB098;
    id v103 = v94;
    id v104 = v89;
    long long v106 = buf;
    long long v107 = &v124;
    long long v108 = &v152;
    long long v109 = &v146;
    long long v110 = &v136;
    char v111 = &v130;
    uint64_t v76 = v84;
    long long v105 = v76;
    [v104 fetchPhotosBetweenStartDate:v72 EndDate:v73 SuggestionID:v74 BundleInterfaceType:v75 Locations:v14 IsLocationCheckMandatory:v71 handler:v102];

    if ((MODispatchGroupWait(v76, 0xFFFFFFFFFFFFFFFFLL, @"ContextAnnotation") & 1) == 0)
    {
      uint64_t v77 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
        +[MOContextAnnotationUtilities addPhotoResourcesWithDateArray:universe:handler:]();
      }
    }
  }
  id v78 = [*((id *)v157 + 5) copy];
  uint64_t v79 = v153[3];
  id v80 = [(id)v147[5] copy];
  uint64_t v81 = v137[5];
  uint64_t v82 = v131[5];
  id v83 = [(id)v125[5] copy];
  v85[2](v85, v78, v79, v80, v81, v82, v83);

  _Block_object_dispose(&v124, 8);
  _Block_object_dispose(&v130, 8);

  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v146, 8);

  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(buf, 8);
}

void __80__MOContextAnnotationUtilities_addPhotoResourcesWithDateArray_universe_handler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = +[NSDate distantFuture];
  double v16 = +[NSDate distantPast];
  double v65 = v11;
  double v61 = v14;
  __int16 v62 = v12;
  uint64_t v69 = (void *)v15;
  if (v11 && !v14 && [v11 count])
  {
    uint64_t v59 = a4;
    id v60 = v13;
    id v67 = objc_alloc_init((Class)NSMutableSet);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v12;
    id v66 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v66)
    {
      uint64_t v64 = *(void *)v71;
      do
      {
        for (i = 0; i != v66; i = (char *)i + 1)
        {
          if (*(void *)v71 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v76[0] = @"MOPhotoResourceTypeKey";
          id v19 = [v18 resourceType];
          v77[0] = v19;
          v76[1] = @"MOPhotoResourceLocalIdentifier";
          id v20 = [v18 localIdentifier];
          v77[1] = v20;
          v76[2] = @"MOPhotoResourceLocalTime";
          uint64_t v21 = [v18 creationDate];
          [v21 timeIntervalSinceReferenceDate];
          int v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v77[2] = v22;
          double v23 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:3];

          __int16 v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            uint64_t v25 = [*(id *)(a1 + 32) suggestionID];
            *(_DWORD *)buf = 138412290;
            id v75 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Fetching persons in the current Asset for the bundle SuggestionId : %@", buf, 0xCu);
          }
          BOOL v26 = [*(id *)(a1 + 40) getPersonsInAsset:v18];
          [v67 unionSet:v26];
          id v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            __int16 v28 = [v67 allObjects];
            *(_DWORD *)buf = 138412290;
            id v75 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "After Fetching persons in the current Asset for the bundle mopersons : %@", buf, 0xCu);
          }
          id v29 = [[MOResource alloc] initWithName:@"Photo" type:2 dict:v23 value:0.0];
          uint64_t v30 = [v65 objectForKey:v18];
          [(MOResource *)v29 setPhotoCurationScore:v30];

          uint64_t v31 = [v18 mediaAnalysisProperties];
          -[MOResource setPhotoFaceCount:](v29, "setPhotoFaceCount:", [v31 faceCount]);

          [v18 overallAestheticScore];
          -[MOResource setPhotoOverallAestheticScore:](v29, "setPhotoOverallAestheticScore:");
          -[MOResource setPhotoAssetMediaType:](v29, "setPhotoAssetMediaType:", [v18 mediaType]);
          id v32 = [v18 creationDate];
          [(MOResource *)v29 setPhotoCreationDate:v32];

          id v33 = [v18 localIdentifier];
          [(MOResource *)v29 setAssets:v33];

          double v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v18;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "creating new MOResource with identifier,%@", buf, 0xCu);
          }

          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v29];
          double v35 = [v18 creationDate];
          unsigned int v36 = [v35 isBeforeDate:v69];

          if (v36)
          {
            uint64_t v37 = [v18 creationDate];

            uint64_t v69 = (void *)v37;
          }
          BOOL v38 = [v18 creationDate];
          unsigned int v39 = [v38 isAfterDate:v16];

          if (v39)
          {
            uint64_t v40 = [v18 creationDate];

            double v16 = (void *)v40;
          }
          id v41 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          uint64_t v42 = [v18 creationDate];
          [v41 addObject:v42];
        }
        id v66 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v66);
    }

    double v43 = [v67 allObjects];
    [*(id *)(a1 + 32) setPersons:v43];

    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v59;
    uint64_t v44 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      id v45 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      id v75 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "addPhotoResources,photoSource,%lu", buf, 0xCu);
    }

    id v13 = v60;
  }
  if (v13 && [v13 count])
  {
    unint64_t v46 = 0;
    double v47 = &kPHGraphPersonalTraitName;
    uint64_t v68 = v16;
    do
    {
      double v48 = [v13 objectAtIndexedSubscript:v46];
      double v49 = v48;
      if (v48)
      {
        double v50 = [v48 objectForKey:*v47];
        double v51 = [v49 objectForKey:kPHGraphPersonalTraitRelevantAssetUUIDs];
        double v52 = [MOPhotoTrait alloc];
        id v53 = +[NSUUID UUID];
        __int16 v54 = [(MOPhotoTrait *)v52 initWithIdentifier:v53 name:v50 relevantAssetUUIDs:v51];

        uint64_t v55 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          [(MOPhotoTrait *)v54 description];
          BOOL v56 = v47;
          v58 = id v57 = v13;
          *(_DWORD *)buf = 138412290;
          id v75 = v58;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "#traits,creating new MOPhotoTrait,%@", buf, 0xCu);

          id v13 = v57;
          double v47 = v56;
        }

        [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v54];
        double v16 = v68;
      }

      ++v46;
    }
    while ((unint64_t)[v13 count] > v46);
  }
  if ([v69 isOnOrBefore:v16])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v69);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v16);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

+ (id)fetchAssetUsingID:(id)a3 universe:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fetchAssetUsingID", buf, 2u);
  }

  if (v5)
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    double v10 = [v6 getService:v9];

    *(void *)buf = 0;
    int v22 = buf;
    uint64_t v23 = 0x3032000000;
    __int16 v24 = __Block_byref_object_copy__7;
    uint64_t v25 = __Block_byref_object_dispose__7;
    id v26 = 0;
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    double v17 = __59__MOContextAnnotationUtilities_fetchAssetUsingID_universe___block_invoke;
    uint64_t v18 = &unk_1002CB0C0;
    id v20 = buf;
    id v12 = v11;
    id v19 = v12;
    [v10 fetchAssetUsingID:v5 handler:&v15];
    if (MODispatchGroupWait(v12, 0xFFFFFFFFFFFFFFFFLL, @"FetchPhotoAsset")) {
      id v13 = [[*((id *)v22 + 5) copy:v15, v16, v17, v18];
    }
    else {
      id v13 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetchAssetUsingID, identifier is nil", buf, 2u);
    }
    id v13 = 0;
  }

  return v13;
}

void __59__MOContextAnnotationUtilities_fetchAssetUsingID_universe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = v5;
  if (a3) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }
  id v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)baseTimeFromBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 startDate];

  uint64_t v6 = [v3 lastObject];

  id v7 = [v6 endDate];

  [v7 timeIntervalSinceDate:v5];
  id v9 = [v5 dateByAddingTimeInterval:v8 * 0.5];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;
  id v12 = +[NSCalendar currentCalendar];
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    int v21 = 138412546;
    int v22 = v15;
    __int16 v23 = 2112;
    __int16 v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "TimeContext(%@): baseTimeFromBaseEvents, %@", (uint8_t *)&v21, 0x16u);
  }
  if ([v12 isDateInWeekend:v9])
  {
    uint64_t v16 = [MOTime alloc];
    double v17 = [v12 timeZone];
    uint64_t v18 = [v17 name];
    id v19 = [(MOTime *)v16 initWithTimestamp:@"Weekend" timeString:v18 timeZone:10001 timeTag:v11];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)timeOfDayPrefixFromBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 startDate];

  uint64_t v6 = [v3 lastObject];

  id v7 = [v6 endDate];

  double v8 = +[MOTime timeOfDayPrefixFromStartDate:v5 endDate:v7];

  return v8;
}

+ (id)annotateEventBundle:(id)a3 visitEvents:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9
{
  id v15 = a3;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = objc_opt_new();
  id v20 = +[MOContextAnnotationUtilities placeFromVisitEvents:v18 usedEvents:v19 preferredCategories:0 poiCategoryBlocklist:v17 mediumConfidenceThreshold:v16 highConfidenceThreshold:a6 aoiConfidenceThreshold:a7 universe:a8];

  if (v20)
  {
    [v15 setPlace:v20];
    int v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = [v15 place];
      int v24 = 138412290;
      uint64_t v25 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "annotateEventBundle visit, %@", (uint8_t *)&v24, 0xCu);
    }
  }

  return v19;
}

+ (id)placeFromVisitEvents:(id)a3 preferredCategories:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9
{
  return +[MOContextAnnotationUtilities placeFromVisitEvents:a3 usedEvents:0 preferredCategories:0 poiCategoryBlocklist:a5 mediumConfidenceThreshold:a9 highConfidenceThreshold:a6 aoiConfidenceThreshold:a7 universe:a8];
}

+ (id)placeFromVisitEvents:(id)a3 usedEvents:(id)a4 preferredCategories:(id)a5 poiCategoryBlocklist:(id)a6 mediumConfidenceThreshold:(double)a7 highConfidenceThreshold:(double)a8 aoiConfidenceThreshold:(double)a9 universe:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a10;
  if ([v16 count])
  {
    id v20 = +[NSSortDescriptor sortDescriptorWithKey:@"placeNameConfidence" ascending:0];
    id v26 = v20;
    int v21 = +[NSArray arrayWithObjects:&v26 count:1];
    int v22 = [v16 sortedArrayUsingDescriptors:v21];

    __int16 v23 = [v22 firstObject];
    if ([v23 category] == (id)1)
    {
      if (v17) {
        [v17 addObject:v23];
      }
      int v24 = +[MOContextAnnotationUtilities placeFromVisitEvent:v23 preferredCategories:0 poiCategoryBlocklist:v18 mediumConfidenceThreshold:v19 highConfidenceThreshold:a7 aoiConfidenceThreshold:a8 universe:a9];
    }
    else
    {
      int v24 = 0;
    }
  }
  else
  {
    int v24 = 0;
  }

  return v24;
}

+ (unint64_t)prepositionWithPlaceType:(unint64_t)a3 userPlaceType:(unint64_t)a4 mapItemPlaceType:(unint64_t)a5 distanceFromVisitToPlace:(double)a6 snappingThreshold:(double)a7
{
  if (!(a4 | a3)) {
    return 0;
  }
  if (a4 - 1 < 0x63) {
    return 1;
  }
  unint64_t result = 3;
  if (a3 - 100 >= 3 && a3 != 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      return 1;
    }
    if (a3 == 6) {
      return 0;
    }
    if (a5 - 1 < 0x14 && ((0xE4FF9u >> (a5 - 1)) & 1) != 0)
    {
      return 3;
    }
    else
    {
      unint64_t v8 = 4;
      if (a6 <= a7) {
        unint64_t v8 = 1;
      }
      if (a6 >= 0.0) {
        return v8;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

+ (id)placeFromVisitEvent:(id)a3 preferredCategories:(id)a4 poiCategoryBlocklist:(id)a5 mediumConfidenceThreshold:(double)a6 highConfidenceThreshold:(double)a7 aoiConfidenceThreshold:(double)a8 universe:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  uint64_t v18 = [v14 placeName];
  [v14 placeNameConfidence];
  double v20 = v19;
  int v21 = [v14 location];
  +[MOContextAnnotationUtilities distanceFromHomeToLocation:v21 universe:v17];
  double v23 = v22;

  int v24 = @"aboveDoorShortAddress";
  uint64_t v25 = (objc_class *)objc_opt_class();
  id v26 = NSStringFromClass(v25);
  id v27 = [v17 getService:v26];

  if (v27)
  {
    __int16 v28 = +[NSString stringWithFormat:@"%@_%@", @"addressFormatting", @"formatOption"];
    uint64_t v29 = [v27 getStringSettingForKey:v28 withFallback:v24];

    [v27 getDoubleSettingForKey:@"distanceOfSnappingThreshold" withFallback:150.0];
    int v24 = (__CFString *)v29;
  }
  uint64_t v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    id v103 = (objc_class *)objc_opt_class();
    id v104 = NSStringFromClass(v103);
    NSStringFromSelector(a2);
    uint64_t v105 = v18;
    v107 = long long v106 = v27;
    *(_DWORD *)buf = 138412802;
    __int16 v149 = v104;
    __int16 v150 = 2112;
    id v151 = v107;
    __int16 v152 = 2112;
    v153 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@, %@: format option, %@", buf, 0x20u);

    id v27 = v106;
    uint64_t v18 = v105;
  }
  uint64_t v31 = [v14 formatLocalityWithFormatOption:v24];
  if (v31
    || ([v14 formatAdministrativeAreaWithFormatOption:v24],
        (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v18) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v31 = [v14 formatCountryWithFormatOption:v24];
    if (v18)
    {
LABEL_8:
      long long v142 = v27;
      id v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        long long v108 = (objc_class *)objc_opt_class();
        uint64_t v146 = NSStringFromClass(v108);
        long long v109 = NSStringFromSelector(a2);
        long long v144 = [v14 poiCategory];
        id v141 = (char *)[v14 placeType];
        id v110 = [v14 placeUserType];
        *(_DWORD *)buf = 138413826;
        __int16 v149 = v146;
        __int16 v150 = 2112;
        id v151 = v109;
        __int16 v152 = 2112;
        v153 = v24;
        __int16 v154 = 2112;
        uint64_t v155 = v18;
        __int16 v156 = 2112;
        v157 = v144;
        __int16 v158 = 2048;
        v159 = v141;
        __int16 v160 = 2048;
        id v161 = v110;
        _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%@, %@: format option, %@, place name, %@, category, %@, placeType, %lu, placeUserType, %lu", buf, 0x48u);
      }
      id v143 = v16;
      id v145 = v15;
      long long v140 = v31;
      v147 = v24;
      if (v15)
      {
        id v33 = [v14 poiCategory];
        unsigned int v34 = [v15 containsObject:v33];

        if (v34)
        {
          double v35 = [v14 poiCategory];
          uint64_t v136 = v18;
          if (v35 != (void *)GEOPOICategoryAirportTerminal)
          {
            unsigned int v36 = [v14 poiCategory];
            if (v36 != (void *)GEOPOICategoryAirportGate)
            {
              uint64_t v37 = [v14 poiCategory];
              BOOL v38 = v37;
              if (v37 != (void *)GEOPOICategoryAirport)
              {

LABEL_16:
                unsigned int v39 = [MOPlace alloc];
                uint64_t v40 = [v14 formatLocalityWithFormatOption:v147];
                id v41 = [v14 placeType];
                id v42 = [v14 placeUserType];
                double v43 = [v14 location];
                id v44 = [v14 mode];
                id v45 = [v14 poiCategory];
                [v14 familiarityIndexLOI];
                double v47 = v46;
                double v48 = [v14 startDate];
                double v49 = [v14 endDate];
                double v50 = v39;
                double v51 = (void *)v136;
                double v52 = [(MOPlace *)v50 initWithPlaceName:v136 enclosingArea:v40 placeType:v41 placeUserType:v42 location:v43 locationMode:v44 poiCategory:v23 distanceToHomeInMiles:v20 placeNameConfidence:v47 familiarityIndexLOI:v45 startDate:v48 endDate:v49];

LABEL_64:
                uint64_t v119 = objc_opt_class();
                id v120 = [v14 placeType];
                id v121 = [v14 placeUserType];
                long long v122 = [v14 routineEvent];
                id v123 = [v122 mapItemPlaceType];
                uint64_t v124 = [v14 routineEvent];
                [v124 distanceFromVisitToPlace];
                long long v125 = (void *)v119;
                double v61 = v52;
                long long v73 = v51;
                [v61 setProposition:[v125 prepositionWithPlaceType:v120 userPlaceType:v121 mapItemPlaceType:v123 distanceFromVisitToPlace:v124 snappingThreshold:v125]];

                long long v72 = [v14 eventIdentifier];
                [v61 setSourceEventIdentifier:v72];
                id v16 = v143;
                id v15 = v145;
                uint64_t v31 = v140;
                id v27 = v142;
                goto LABEL_65;
              }
              if ([v14 placeType] != (id)4)
              {
                id v127 = [v14 placeSource];

                if (v127 != (id)1) {
                  goto LABEL_16;
                }
LABEL_63:
                char v111 = [MOPlace alloc];
                uint64_t v40 = [v14 formatLocalityWithFormatOption:v24];
                id v112 = [v14 placeUserType];
                double v43 = [v14 location];
                id v113 = [v14 mode];
                long long v114 = [v14 poiCategory];
                [v14 familiarityIndexLOI];
                double v116 = v115;
                long long v117 = [v14 startDate];
                long long v118 = [v14 endDate];
                double v51 = (void *)v136;
                double v52 = [(MOPlace *)v111 initWithPlaceName:v136 enclosingArea:v40 placeType:6 placeUserType:v112 location:v43 locationMode:v113 poiCategory:v23 distanceToHomeInMiles:v20 placeNameConfidence:v116 familiarityIndexLOI:v114 startDate:v117 endDate:v118];

                goto LABEL_64;
              }
            }
          }

          goto LABEL_63;
        }
      }
      id v53 = (void *)v18;
      __int16 v54 = [v14 poiCategory];
      unsigned int v55 = [v16 containsObject:v54];

      if ([v14 placeType] == (id)3)
      {
        if (v15)
        {
          BOOL v56 = [v14 poiCategory];
          unsigned __int8 v57 = [v15 containsObject:v56];
        }
        else
        {
          unsigned __int8 v57 = 0;
        }
        id v60 = v53;
        if ((v57 & 1) == 0 && v20 <= a6 && ((unint64_t)[v14 placeSource] & 0x40000) == 0) {
          unsigned int v55 = 1;
        }
      }
      else
      {
        id v58 = [v14 placeType];
        if (v20 <= a8 && v58 == (id)2) {
          unsigned int v55 = 1;
        }
        id v60 = v53;
      }
      if (([(__CFString *)v24 isEqualToString:@"currentFormat"] & 1) == 0
        && ([v14 placeType] == (id)4
         || [v14 placeType] == (id)5
         || ([v14 placeSource] & 1) != 0))
      {
        uint64_t v79 = [v14 geoAddressObject];
        id v80 = [v79 address];
        uint64_t v81 = [v80 structuredAddress];
        uint64_t v82 = [v81 areaOfInterests];
        id v83 = [v82 count];

        id v60 = v53;
        if (v83) {
          char v84 = v55;
        }
        else {
          char v84 = 1;
        }
        if ((v84 & 1) == 0) {
          goto LABEL_50;
        }
      }
      else if (!v55)
      {
LABEL_50:
        BOOL v76 = 0;
LABEL_51:
        if ([v14 placeType] == (id)4
          || ([v14 placeSource] == (id)1 ? (char v85 = 1) : (char v85 = v76), (v85 & 1) != 0))
        {
          long long v73 = v60;
          uint64_t v86 = 4;
        }
        else
        {
          long long v73 = v60;
          uint64_t v86 = (uint64_t)[v14 placeType];
        }
        SEL aSelectorb = (SEL)v86;
        id v87 = [MOPlace alloc];
        id v88 = [v14 placeUserType];
        int v89 = [v14 location];
        id v90 = [v14 mode];
        uint64_t v91 = [v14 poiCategory];
        [v14 familiarityIndexLOI];
        double v93 = v92;
        id v94 = [v14 startDate];
        id v95 = [v14 endDate];
        id v96 = [(MOPlace *)v87 initWithPlaceName:v73 enclosingArea:v140 placeType:v86 placeUserType:v88 location:v89 locationMode:v90 poiCategory:v23 distanceToHomeInMiles:v20 placeNameConfidence:v93 familiarityIndexLOI:v91 startDate:v94 endDate:v95];

        uint64_t v31 = v140;
        uint64_t v97 = objc_opt_class();
        id v98 = [v14 placeUserType];
        long long v99 = [v14 routineEvent];
        id v100 = [v99 mapItemPlaceType];
        id v101 = [v14 routineEvent];
        [v101 distanceFromVisitToPlace];
        long long v102 = (void *)v97;
        double v61 = v96;
        -[MOPlace setProposition:](v96, "setProposition:", [v102 prepositionWithPlaceType:aSelectorb userPlaceType:v98 mapItemPlaceType:v100 distanceFromVisitToPlace:v102 snappingThreshold:v104]);

        long long v72 = [v14 eventIdentifier];
        [(MOPlace *)v96 setSourceEventIdentifier:v72];
        id v16 = v143;
        id v15 = v145;
        id v27 = v142;
        goto LABEL_65;
      }
      long long v74 = [v14 formatAddressWithFormatOption:v24];
      id v75 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
      {
        long long v128 = (objc_class *)objc_opt_class();
        id v135 = NSStringFromClass(v128);
        id v129 = NSStringFromSelector(a2);
        uint64_t v130 = [v60 mask];
        uint64_t v131 = [v74 mask];
        aSelectora = [v14 poiCategory];
        id v134 = [v14 placeType];
        id v132 = [v14 placeUserType];
        *(_DWORD *)buf = 138414082;
        __int16 v149 = v135;
        __int16 v150 = 2112;
        id v151 = v129;
        __int16 v152 = 2112;
        v153 = v130;
        __int16 v154 = 2112;
        uint64_t v155 = v131;
        long long v133 = (void *)v131;
        __int16 v156 = 2112;
        v157 = v24;
        __int16 v158 = 2112;
        v159 = aSelectora;
        __int16 v160 = 2048;
        id v161 = v134;
        __int16 v162 = 2048;
        id v163 = v132;
        _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "%@, %@: original place name, %@, new place name, %@, format option, %@, category, %@, placeType, %lu, placeUserType, %lu", buf, 0x52u);

        id v60 = v53;
      }

      BOOL v76 = v74 != 0;
      if (v74)
      {
        id v77 = v74;
        id v78 = v60;
        id v60 = v77;
      }
      goto LABEL_51;
    }
  }
  double v61 = [v14 location];

  if (!v61)
  {
    long long v73 = 0;
    goto LABEL_66;
  }
  v147 = v24;
  __int16 v62 = [MOPlace alloc];
  id v63 = [v14 location];
  uint64_t v64 = [v14 startDate];
  double v65 = [v14 endDate];
  id v66 = [(MOPlace *)v62 initWithPlaceName:0 enclosingArea:v31 placeType:0 placeUserType:0 location:v63 locationMode:0 poiCategory:v23 distanceToHomeInMiles:-1.0 placeNameConfidence:0.0 familiarityIndexLOI:0 startDate:v64 endDate:v65];

  uint64_t v67 = objc_opt_class();
  uint64_t v68 = [v14 routineEvent];
  id v69 = [v68 mapItemPlaceType];
  long long v70 = [v14 routineEvent];
  [v70 distanceFromVisitToPlace];
  long long v71 = (void *)v67;
  double v61 = v66;
  -[MOPlace setProposition:](v66, "setProposition:", [v71 prepositionWithPlaceType:0 userPlaceType:0 mapItemPlaceType:v69 distanceFromVisitToPlace:0 snappingThreshold:0]);

  long long v72 = [v14 eventIdentifier];
  [(MOPlace *)v66 setSourceEventIdentifier:v72];
  long long v73 = 0;
LABEL_65:

  int v24 = v147;
LABEL_66:

  return v61;
}

+ (id)locationsFromMotionEvents:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v11 = [v10 workoutEvent:v18];
        id v12 = [v11 workoutLocationRoute];

        if (v12)
        {
          id v13 = [v10 workoutEvent];
          id v14 = [v13 workoutLocationRoute];
          id v15 = [v14 copy];
          [v4 addObject:v15];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v16 = [v4 copy];

  return v16;
}

+ (id)placeFromRoutes:(id)a3
{
  return +[MOContextAnnotationUtilities placeFromRoutes:a3 referencePointRatio:1.5 minimumRangeOfLocation:0.0];
}

+ (id)placeFromRoutes:(id)a3 referencePointRatio:(double)a4 minimumRangeOfLocation:(double)a5
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 addObjectsFromArray:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v10);
    }

    id v13 = +[MOContextAnnotationUtilities averageLocationFromLocations:v7];
    id v14 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          [v13 distanceFromLocation:*(void *)(*((void *)&v34 + 1) + 8 * (void)j)];
          long long v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v14 addObject:v20];
        }
        id v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v17);
    }

    long long v21 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:0];
    double v22 = +[NSArray arrayWithObject:v21];
    [v14 sortUsingDescriptors:v22];

    double v23 = [v14 firstObject];
    [v23 doubleValue];

    int v24 = [v15 firstObject];
    uint64_t v25 = [v24 timestamp];

    id v26 = [v15 lastObject];
    id v27 = [v26 timestamp];

    id v28 = objc_alloc((Class)RTLocation);
    [v13 coordinate];
    double v30 = v29;
    [v13 coordinate];
    id v31 = [v28 initWithLatitude:v25 longitude:v30 horizontalUncertainty:v26 date:v27];
    id v32 = [[MOPlace alloc] initWithPlaceName:0 enclosingArea:0 placeType:0 placeUserType:0 location:v31 locationMode:0 poiCategory:0.0 distanceToHomeInMiles:0.0 placeNameConfidence:0.0 familiarityIndexLOI:0 startDate:v25 endDate:v27];
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

+ (id)averageLocationFromLocations:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v34;
    double v10 = 0.0;
    *(void *)&long long v7 = 134218240;
    long long v32 = v7;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v5);
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v14 coordinate:v32];
        double v16 = v15;
        [v14 coordinate];
        double v18 = v17;
        double v19 = v17 * 0.0174532925;
        __double2 v20 = __sincos_stret(v16 * 0.0174532925);
        __double2 v21 = __sincos_stret(v19);
        double v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v32;
          double v38 = v16;
          __int16 v39 = 2048;
          double v40 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Average Location: input loc, (%f, %f)", buf, 0x16u);
        }
        double v12 = v12 + v20.__cosval * v21.__cosval;
        double v11 = v11 + v20.__cosval * v21.__sinval;
        double v10 = v10 + v20.__sinval;
      }
      id v8 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
  }

  double v23 = v12 / (double)(uint64_t)v4;
  int v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    double v38 = v12 / (double)(uint64_t)v4;
    __int16 v39 = 2048;
    double v40 = v11 / (double)(uint64_t)v4;
    __int16 v41 = 2048;
    double v42 = v10 / (double)(uint64_t)v4;
    __int16 v43 = 2048;
    id v44 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Average Location: avg, (%f, %f, %f), cnt, %lu", buf, 0x2Au);
  }

  double v25 = atan2(v11 / (double)(uint64_t)v4, v23);
  double v26 = atan2(v10 / (double)(uint64_t)v4, sqrt(v11 / (double)(uint64_t)v4 * (v11 / (double)(uint64_t)v4) + v23 * v23));
  id v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    +[MOContextAnnotationUtilities averageLocationFromLocations:v25];
  }

  double v28 = v26 * 57.2957795;
  double v29 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v38 = v28;
    __int16 v39 = 2048;
    double v40 = v25 * 57.2957795;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Average Location: center, (%f, %f)", buf, 0x16u);
  }

  id v30 = [objc_alloc((Class)CLLocation) initWithLatitude:v28 longitude:v25 * 57.2957795];

  return v30;
}

+ (id)locationsFromLocationString:(id)a3
{
  id v3 = a3;
  id v32 = 0;
  id v4 = +[NSRegularExpression regularExpressionWithPattern:@"\\(([-+]?[0-9]*\\.?[0-9]+),([-+]?[0-9]*\\.?[0-9]+)\\)" options:1 error:&v32];
  id v26 = v32;
  id v27 = v4;
  id v5 = [v4 matchesInString:v3 options:0 range:[v3 length]];
  id v6 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v37 count:16];
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
        double v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v12 numberOfRanges])
        {
          id v13 = [v12 rangeAtIndex:1];
          double v15 = [v3 substringWithRange:v13, v14];
          [v15 doubleValue];
          double v17 = v16;
          id v18 = [v12 rangeAtIndex:2];
          __double2 v20 = [v3 substringWithRange:v18, v19];
          [v20 doubleValue];
          double v22 = v21;
          double v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            double v34 = v17;
            __int16 v35 = 2048;
            double v36 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Location: %f, %f", buf, 0x16u);
          }

          id v24 = [objc_alloc((Class)CLLocation) initWithLatitude:v17 longitude:v22];
          [v6 addObject:v24];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (double)distanceFromHomeToLocation:(id)a3 universe:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 getService:v8];

  uint64_t v10 = [v9 homeLOI];
  double v11 = v10;
  if (v10)
  {
    [v10 distanceFromLocation:v5];
    double v13 = v12 * 0.00062137;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

+ (double)distanceFromHomeToCLLocation:(id)a3 universe:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 getService:v8];

  uint64_t v10 = [v9 homeLOI];
  if (v10)
  {
    id v11 = objc_alloc((Class)CLLocation);
    [v10 latitude];
    double v13 = v12;
    [v10 longitude];
    id v15 = [v11 initWithLatitude:v13 longitude:v14];
    [v15 distanceFromLocation:v5];
    double v17 = v16 * 0.00062137;
  }
  else
  {
    double v17 = 0.0;
  }

  return v17;
}

+ (double)weightedAverageForObjects:(id)a3 weightPath:(id)a4 valuePath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  double v11 = 0.0;
  double v12 = 0.0;
  if (v10)
  {
    id v13 = v10;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v7);
        }
        double v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        double v17 = [v16 valueForKeyPath:v8];
        [v17 doubleValue];
        double v19 = v18;

        __double2 v20 = [v16 valueForKeyPath:v9];
        [v20 doubleValue];
        double v22 = v21;

        double v12 = v12 + v19 * v22;
        double v11 = v11 + v19;
      }
      id v13 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }
  if (v11 == 0.0) {
    double v23 = 0.0;
  }
  else {
    double v23 = v12 / v11;
  }

  return v23;
}

+ (BOOL)isEvergreenBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 resources];
  id v5 = [v4 count];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v3 resources];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 type] == (id)3 || objc_msgSend(v11, "type") == (id)2)
          {
            BOOL v12 = 0;
            goto LABEL_15;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        BOOL v12 = 1;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
LABEL_15:
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

+ (void)assetPriorityScoringForTimeAtHomeBundlesWithBundle:(id)a3 withMediaResources:(id)a4 withPhotoResources:(id)a5 withEmotionResources:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v42 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"photoCurationScore" ascending:0];
  id v61 = v42;
  id v13 = +[NSArray arrayWithObjects:&v61 count:1];
  long long v14 = [v11 sortedArrayUsingDescriptors:v13];

  id v44 = +[NSMutableArray arrayWithArray:v10];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v15 = v10;
  id v16 = [v15 countByEnumeratingWithState:&v54 objects:v60 count:16];
  __int16 v43 = v11;
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v55;
    uint64_t v19 = 0x4069200000000000;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(v15);
        }
        double v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        [v21 priorityScore];
        if (v22 == 201.0)
        {
          id v23 = [v15 indexOfObject:v21];
          [v21 setPriorityScore:200.0];
          [v44 replaceObjectAtIndex:v23 withObject:v21];
          goto LABEL_11;
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v54 objects:v60 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = 0x4069000000000000;
LABEL_11:

  id v24 = objc_opt_new();
  id v45 = v12;
  if ([v12 count])
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v25 = v12;
    id v26 = [v25 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v51;
      double v29 = 501.0;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v51 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v31 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
          [v31 priorityScore];
          if (v32 != 202.0)
          {
            [v31 setPriorityScore:v29];
            double v29 = v29 + 1.0;
          }
          [v24 addObject:v31];
        }
        id v27 = [v25 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v27);
    }
  }
  long long v33 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v34 = v14;
  id v35 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v47;
    double v38 = 0.0;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v40 = *(void *)(*((void *)&v46 + 1) + 8 * (void)k);
        if (v38 == 0.0)
        {
          double v41 = 100.0;
        }
        else
        {
          double v41 = *(double *)&v19;
          if (v38 != 100.0)
          {
            if (v38 < 200.0) {
              goto LABEL_33;
            }
            double v41 = v38 + 1.0;
          }
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * (void)k) setPriorityScore:v41];
        double v38 = v41;
LABEL_33:
        [v33 addObject:v40];
      }
      id v36 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v36);
  }

  [v9 setResources:v33];
  [v9 addResources:v44];
  [v9 addResources:v24];
}

+ (id)setActionForActivityBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_53;
  }
  if ([v4 category] == (id)2)
  {
    id v6 = [v5 workoutEvent];
    id v7 = [v6 workoutType];

LABEL_11:
    uint64_t v12 = 1;
    goto LABEL_17;
  }
  if ([v5 category] != (id)16)
  {
    id v7 = 0;
    goto LABEL_11;
  }
  id v9 = [v5 motionActivityEvent];
  id v10 = [v9 motionType];

  if (v10 == (id)6)
  {
    id v11 = &MOWorkoutMotionActivityActionRunAndWalk;
  }
  else if (v10 == (id)3)
  {
    id v11 = &MOWorkoutMotionActivityActionRun;
  }
  else
  {
    if (v10 != (id)2)
    {
      id v7 = 0;
      goto LABEL_16;
    }
    id v11 = &MOWorkoutMotionActivityActionWalk;
  }
  id v7 = *v11;
LABEL_16:
  uint64_t v12 = 2;
LABEL_17:
  uint64_t v56 = v12;
  long long v57 = v7;
  id v58 = v3;
  uint64_t v59 = objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v13 = v3;
  id v14 = [v13 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v14)
  {
    id v15 = v14;
    LODWORD(v16) = 0;
    uint64_t v17 = *(void *)v65;
    double v18 = 0.0;
    double v19 = 0.0;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v65 != v17) {
          objc_enumerationMutation(v13);
        }
        double v21 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        double v22 = [v21 workoutEvent];
        id v23 = [v22 workoutTotalDistance];
        [v23 doubleValue];
        double v18 = v18 + v24;

        id v25 = [v21 workoutEvent];
        id v26 = [v25 workoutDuration];
        [v26 doubleValue];
        double v19 = v19 + v27 / 60.0;

        uint64_t v28 = [v21 motionActivityEvent];
        double v29 = [v28 motionStepCount];
        uint64_t v16 = [v29 intValue] + v16;

        long long v30 = [v21 motionActivityEvent];
        long long v31 = [v30 motionDistance];
        [v31 doubleValue];
      }
      id v15 = [v13 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
    double v18 = 0.0;
    double v19 = 0.0;
  }

  if ([v5 category] == (id)16)
  {
    long long v33 = v57;
    id v34 = v59;
    if ((int)v16 < 1) {
      goto LABEL_34;
    }
    id v35 = +[NSString stringWithFormat:@"%d", v16];
    id v36 = &MOWorkoutActionUnitMotionWalkingSteps;
  }
  else
  {
    long long v33 = v57;
    id v34 = v59;
    if (v18 <= 0.0)
    {
      if (v19 <= 0.0) {
        goto LABEL_34;
      }
      LODWORD(v32) = llround(v19);
      id v35 = +[NSString stringWithFormat:@"%d", v32];
      id v36 = &MOWorkoutActionUnitWorkoutDuration;
    }
    else
    {
      id v35 = +[NSString stringWithFormat:@"%.2f", trunc(v18 * 0.62137119 * 100.0) / 100.0];
      id v36 = &MOWorkoutActionUnitWorkoutDistance;
    }
  }
  [v34 setObject:v35 forKeyedSubscript:@"ActivityActionMetaDataValue"];

  [v34 setObject:*v36 forKeyedSubscript:@"ActivityActionMetaDataUnit"];
LABEL_34:
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v37 = v13;
  id v38 = [v37 countByEnumeratingWithState:&v60 objects:v68 count:16];
  __int16 v39 = v37;
  if (v38)
  {
    id v40 = v38;
    uint64_t v41 = *(void *)v61;
    while (2)
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v61 != v41) {
          objc_enumerationMutation(v37);
        }
        __int16 v43 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        if ([v43 fromFirstParty]) {
          goto LABEL_44;
        }
        id v44 = [v43 appBundle];
        id v45 = [v37 firstObject];
        long long v46 = [v45 appBundle];
        unsigned int v47 = [v44 isEqualToString:v46];

        if (!v47)
        {
LABEL_44:
          __int16 v39 = v37;
          id v34 = v59;
          goto LABEL_45;
        }
      }
      id v40 = [v37 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v40) {
        continue;
      }
      break;
    }

    __int16 v39 = [v37 firstObject];
    long long v48 = [v39 appBundle];
    long long v49 = +[MOContextAnnotationUtilities bundleNameFromBundleId:v48];
    id v34 = v59;
    [v59 setObject:v49 forKeyedSubscript:@"MediaActionMetaDataAppName"];
  }
LABEL_45:

  long long v50 = [v37 firstObject];
  if ([v50 fromFirstParty])
  {
    long long v51 = [v37 firstObject];
    unsigned int v52 = [v51 isFitnessPlusSession];

    id v3 = v58;
    if (v52) {
      [v34 setObject:@"Fitness+" forKeyedSubscript:@"MediaActionMetaDataAppName"];
    }
    if (v33) {
      goto LABEL_49;
    }
LABEL_51:
    id v8 = 0;
    goto LABEL_52;
  }

  id v3 = v58;
  if (!v33) {
    goto LABEL_51;
  }
LABEL_49:
  id v8 = [[MOAction alloc] initWithActionName:v33 actionType:4 actionSubtype:v56 actionMetaData:v34];
  long long v53 = [v37 firstObject];
  long long v54 = [v53 eventIdentifier];
  [(MOAction *)v8 setSourceEventIdentifier:v54];

LABEL_52:
LABEL_53:

  return v8;
}

+ (void)addStateOfMindResourceForBundle:(id)a3 withEmotionEvents:(id)a4
{
  id v36 = a3;
  id v5 = a4;
  id v33 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
  id v42 = v33;
  id v6 = +[NSArray arrayWithObjects:&v42 count:1];
  id v34 = v5;
  id v7 = [v5 sortedArrayUsingDescriptors:v6];

  id v8 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v35 = *(void *)v38;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v14 = [v13 startDate];
        [v14 timeIntervalSince1970];
        id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v8 setObject:v15 forKey:@"MOStateOfMindMetaDataKeyStartDate"];

        uint64_t v16 = [v13 endDate];
        [v16 timeIntervalSince1970];
        uint64_t v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v8 setObject:v17 forKey:@"MOStateOfMindMetaDataKeyEndDate"];

        double v18 = [v13 stateOfMindEvent];
        double v19 = [v18 labels];
        [v8 setObject:v19 forKey:@"MOStateOfMindMetaDataKeyLabel"];

        __double2 v20 = [v13 stateOfMindEvent];
        double v21 = [v20 domains];
        [v8 setObject:v21 forKey:@"MOStateOfMindMetaDataKeyDomain"];

        double v22 = [v13 stateOfMindEvent];
        [v22 reflectiveInterval];
        id v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v8 setObject:v23 forKey:@"MOStateOfMindMetaDataKeyReflectiveInterval"];

        double v24 = [v13 stateOfMindEvent];
        [v24 valence];
        id v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v8 setObject:v25 forKey:@"MOStateOfMindMetaDataKeyValence"];

        id v26 = [v13 stateOfMindEvent];
        [v26 valenceClassification];
        double v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v8 setObject:v27 forKey:@"MOStateOfMindMetaDataKeyValenceClassification"];

        uint64_t v28 = [v13 identifierFromProvider];
        [v8 setObject:v28 forKey:@"MOStateOfMindMetaDataKeyStateOfMindID"];

        double v29 = [[MOResource alloc] initWithName:@"StateOfMind" type:16 dict:v8 value:0.0];
        long long v30 = [v13 identifierFromProvider];
        [(MOResource *)v29 setAssets:v30];

        long long v31 = [v13 eventIdentifier];
        [(MOResource *)v29 setSourceEventIdentifier:v31];

        [(MOResource *)v29 setSourceEventAccessType:8];
        uint64_t v32 = [v9 firstObject];

        if (v32 == v13) {
          [(MOResource *)v29 setPriorityScore:202.0];
        }
        [v36 addResource:v29];
      }
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v11);
  }
}

+ (void)addStateOfMindMetaDataForRankForBundle:(id)a3 withEmotionEvents:(id)a4
{
  id v36 = a3;
  id v5 = a4;
  id v6 = objc_opt_new();
  long long v39 = objc_opt_new();
  long long v38 = objc_opt_new();
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        id v13 = v8;
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v15 = [v14 stateOfMindEvent:v36];
        uint64_t v16 = [v15 labels];
        [v6 addObjectsFromArray:v16];

        uint64_t v17 = [v14 stateOfMindEvent];
        double v18 = [v17 domains];
        [v39 addObjectsFromArray:v18];

        double v19 = [v14 stateOfMindEvent];
        [v19 valence];
        __double2 v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v38 addObject:v20];

        double v21 = [v14 stateOfMindEvent];
        [v21 valenceClassification];
        double v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v7 addObject:v22];

        id v23 = [v14 stateOfMindEvent];
        [v23 reflectiveInterval];
        double v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v8 = v13;
        [v13 addObject:v24];
      }
      id v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v10);
  }

  id v25 = v36;
  if ([v6 count])
  {
    id v26 = +[NSSet setWithArray:v6];
    double v27 = [v26 allObjects];
    [v36 addMetaDataForRankForKey:@"StateOfMindLabels" value:v27];
  }
  if (objc_msgSend(v39, "count", v36))
  {
    uint64_t v28 = +[NSSet setWithArray:v39];
    double v29 = [v28 allObjects];
    [v25 addMetaDataForRankForKey:@"StateOfMindDomains" value:v29];
  }
  if ([v38 count])
  {
    long long v30 = +[NSSet setWithArray:v38];
    long long v31 = [v30 allObjects];
    [v25 addMetaDataForRankForKey:@"StateOfMindValence" value:v31];
  }
  if ([v7 count])
  {
    uint64_t v32 = +[NSSet setWithArray:v7];
    id v33 = [v32 allObjects];
    [v25 addMetaDataForRankForKey:@"StateOfMindValenceClassification" value:v33];
  }
  if ([v8 count])
  {
    id v34 = +[NSSet setWithArray:v8];
    uint64_t v35 = [v34 allObjects];
    [v25 addMetaDataForRankForKey:@"StateOfMindReflectiveInterval" value:v35];
  }
}

+ (void)annotateEventBundle:(uint64_t)a1 leisureMediaEvents:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "media name is not resolved, top event, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)createMediaResourceWithMediaInfo:(uint8_t *)a1 playSessions:(void *)a2 eventIdentifiersMapping:(void *)a3 isDominant:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 productId];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Media containerName=nil, id=%@", a1, 0xCu);
}

+ (void)dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: dominantFactorThreshold >= 0", v2, v3, v4, v5, v6);
}

+ (void)dominantMediaNameFromPlaySessions:(void *)a1 intervalOfInterest:dominantFactorThreshold:confidence:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "MediaName, playSessions.count, %lu, intervalOfInterest, %@", v3, v4, v5, v6, v7);
}

+ (void)dominantMediaNameFromPlaySessions:intervalOfInterest:dominantFactorThreshold:confidence:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: intervalOfInterest.duration > 0", v2, v3, v4, v5, v6);
}

+ (void)dominantMediaNameFromPlaySessions:intervalsOfInterest:dominantFactorThreshold:confidence:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: intervalsOfInterest.count > 0", v2, v3, v4, v5, v6);
}

+ (void)dominantMediaNameFromPlaySessions:(void *)a1 intervalsOfInterest:dominantFactorThreshold:confidence:.cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v1, v2, "MediaName, playSessions.count, %lu, intervalsOfInterest, %@", v3, v4, v5, v6, v7);
}

+ (void)bundleNameFromBundleId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot retrieve app name from bundleId, %@", (uint8_t *)&v2, 0xCu);
}

+ (void)addPhotoResourcesWithDateArray:universe:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "addPhotoResources timed out", v1, 2u);
}

+ (void)averageLocationFromLocations:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Average Location: loc in radian, (%f, %f)", (uint8_t *)&v3, 0x16u);
}

@end