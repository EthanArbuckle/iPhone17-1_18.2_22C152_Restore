@interface MOTrendBundlerAnnotatorRecentEvent
- (BOOL)_isStringUnique:(id)a3 inThis:(id)a4;
- (BOOL)configure:(id)a3;
- (MOTrendBundlerAnnotatorRecentEvent)init;
- (id)_actionFromEvent:(id)a3;
- (id)_annotateEvents:(id)a3 withSourceEventForSet:(id)a4;
- (id)_personsFromEvent:(id)a3;
- (id)createTrendBundlesFrom:(id)a3 withEvents:(id)a4;
- (void)_assignResourcePriorityScore:(id)a3;
@end

@implementation MOTrendBundlerAnnotatorRecentEvent

- (MOTrendBundlerAnnotatorRecentEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOTrendBundlerAnnotatorRecentEvent;
  v2 = [(MOTrendBundlerAnnotatorRecentEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_maximumFeatureCountForFrequencyTrend = -1.0;
    v4 = v2;
  }

  return v3;
}

- (id)createTrendBundlesFrom:(id)a3 withEvents:(id)a4
{
  id v5 = a3;
  id v45 = a4;
  id v42 = (id)objc_opt_new();
  if ([v5 count])
  {
    uint64_t v6 = 0;
    v44 = v5;
    while (1)
    {
      v7 = objc_opt_new();
      uint64_t v8 = [v5 objectAtIndex:v6];
      v47 = (void *)v8;
      uint64_t v48 = v6;
      if (v8)
      {
        [v7 addObjectsFromArray:v8];
      }
      else
      {
        v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "trendEventArray is nil", buf, 2u);
        }
      }
      v10 = objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v11 = v7;
      id v12 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v12) {
        break;
      }
LABEL_20:

      v26 = objc_opt_new();
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v27 = v10;
      id v28 = [v27 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v50;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v50 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            id v33 = +[NSUUID UUID];
            [v26 addObject:v33];
          }
          id v29 = [v27 countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v29);
      }

      v46 = +[NSPredicate predicateWithFormat:@"eventIdentifier IN %@", v26];
      v34 = [v45 filteredArrayUsingPredicate:];
      id v35 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
      id v58 = v35;
      v36 = +[NSArray arrayWithObjects:&v58 count:1];
      v37 = [v34 sortedArrayUsingDescriptors:v36];

      if ([v37 count])
      {
        v38 = [v37 firstObject];
        [v11 addObject:v38];

        v39 = [(MOTrendBundlerAnnotatorRecentEvent *)self _annotateEvents:v11 withSourceEventForSet:v37];
        v40 = v47;
        if (v39) {
          [v42 addObject:v39];
        }
      }
      else
      {
        v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v40 = v47;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "No source events for trend or routine found", buf, 2u);
        }
      }

      uint64_t v6 = v48 + 1;
      id v5 = v44;
      if ((unint64_t)[v44 count] <= v48 + 1) {
        goto LABEL_33;
      }
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v54;
LABEL_10:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v54 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v53 + 1) + 8 * v15);
      v17 = [v16 patterns];
      v18 = [v17 objectForKeyedSubscript:@"kEventPatternType"];
      unsigned int v19 = [v18 intValue];

      v20 = [v16 patterns];
      v21 = v20;
      if (v19 == 1) {
        break;
      }
      v23 = [v20 objectForKeyedSubscript:@"kEventPatternType"];
      unsigned int v24 = [v23 intValue];

      if (v24 == 2)
      {
        v20 = [v16 patterns];
        v21 = v20;
        CFStringRef v22 = @"kEventPatternRoutineEventIdentifierList";
        goto LABEL_17;
      }
LABEL_18:
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (!v13) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
    }
    CFStringRef v22 = @"kEventPatternTrendEventIdentifierList";
LABEL_17:
    v25 = [v20 objectForKeyedSubscript:v22];
    [v10 addObjectsFromArray:v25];

    goto LABEL_18;
  }
LABEL_33:

  return v42;
}

- (id)_annotateEvents:(id)a3 withSourceEventForSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v126 = "-[MOTrendBundlerAnnotatorRecentEvent _annotateEvents:withSourceEventForSet:]";
    __int16 v127 = 2048;
    v128 = (MOEventBundle *)[v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s, event count, %lu", buf, 0x16u);
  }

  if (![v5 count] || !objc_msgSend(v6, "count"))
  {
    id v28 = 0;
    goto LABEL_69;
  }
  uint64_t v8 = [MOEventBundle alloc];
  id v9 = [objc_alloc((Class)NSSet) initWithArray:v5];
  v10 = [(MOEventBundle *)v8 initWithEventSet:v9 filtered:0];

  [(MOEventBundle *)v10 setInterfaceType:9];
  id v11 = [v6 firstObject];
  id v12 = [v11 category];

  v96 = v10;
  if (v12 == (id)2)
  {
    [(MOEventBundle *)v10 setBundleSuperType:2];
    [(MOEventBundle *)v10 setBundleSubType:203];
    +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 5];
    v95 = id v93 = v5;
    id v13 = [v5 filteredArrayUsingPredicate:];
    if ([v13 count])
    {
      uint64_t v14 = [v13 objectAtIndex:0];
      uint64_t v15 = [(MOTrendBundlerAnnotatorRecentEvent *)self _actionFromEvent:v14];
      [(MOEventBundle *)v10 setAction:v15];
    }
    v107 = v13;
    v101 = objc_opt_new();
    [v6 valueForKeyPath:@"@distinctUnionOfObjects.workoutType"];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [obj countByEnumeratingWithState:&v121 objects:v135 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v122;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v122 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = +[NSPredicate predicateWithFormat:@"%K = %@", @"workoutType", *(void *)(*((void *)&v121 + 1) + 8 * i)];
          v21 = [v6 filteredArrayUsingPredicate:v20];
          id v22 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
          id v134 = v22;
          v23 = +[NSArray arrayWithObjects:&v134 count:1];
          unsigned int v24 = [v21 sortedArrayUsingDescriptors:v23];

          v25 = [v24 firstObject];
          [v101 addObject:v25];
        }
        id v17 = [obj countByEnumeratingWithState:&v121 objects:v135 count:16];
      }
      while (v17);
    }
    v26 = [(MOEventBundle *)v96 resources];
    id v91 = v6;
    if (v26)
    {
      id v27 = [(MOEventBundle *)v96 resources];
      id v105 = [v27 mutableCopy];
    }
    else
    {
      id v105 = (id)objc_opt_new();
    }

    long long v56 = objc_opt_new();
    v57 = objc_opt_new();
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v37 = v107;
    id v58 = [v37 countByEnumeratingWithState:&v117 objects:v133 count:16];
    if (v58)
    {
      id v59 = v58;
      uint64_t v60 = *(void *)v118;
      v103 = v57;
      v104 = v56;
      uint64_t v97 = *(void *)v118;
      id v98 = v37;
      do
      {
        v61 = 0;
        id v99 = v59;
        do
        {
          if (*(void *)v118 != v60) {
            objc_enumerationMutation(v37);
          }
          v62 = *(void **)(*((void *)&v117 + 1) + 8 * (void)v61);
          if ([v62 category] == (id)2)
          {
            [v62 patterns];
            v63 = v102 = v61;
            v64 = [v63 objectForKey:@"kEventResourcePatternWorkoutInfoDictArray"];

            v61 = v102;
            if (v64)
            {
              long long v115 = 0u;
              long long v116 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              v65 = [v62 patterns];
              v66 = [v65 objectForKeyedSubscript:@"kEventResourcePatternWorkoutInfoDictArray"];

              id v106 = v66;
              id v67 = [v66 countByEnumeratingWithState:&v113 objects:v132 count:16];
              if (v67)
              {
                id v68 = v67;
                uint64_t v69 = *(void *)v114;
                do
                {
                  for (j = 0; j != v68; j = (char *)j + 1)
                  {
                    if (*(void *)v114 != v69) {
                      objc_enumerationMutation(v106);
                    }
                    v71 = *(void **)(*((void *)&v113 + 1) + 8 * (void)j);
                    v72 = [v71 objectForKeyedSubscript:@"kEventResourcePatternWorkoutIdentifierFromProvider"];
                    if ([(MOTrendBundlerAnnotatorRecentEvent *)self _isStringUnique:v72 inThis:v56])
                    {
                      [v56 addObject:v72];
                      v73 = objc_opt_new();
                      v74 = [v71 objectForKeyedSubscript:@"kEventResourcePatternWorkoutStartDate"];
                      [v73 setObject:v74 forKey:@"MOWorkoutMetaDataKeyStartDate"];

                      v75 = [v71 objectForKeyedSubscript:@"kEventResourcePatternWorkoutEndDate"];
                      [v73 setObject:v75 forKey:@"MOWorkoutMetaDataKeyEndDate"];

                      v76 = [v71 objectForKeyedSubscript:@"kEventResourcePatternWorkoutType"];
                      [v73 setObject:v76 forKey:@"MOWorkoutMetaDataKeyActivityType"];

                      v77 = [v71 objectForKeyedSubscript:@"kEventResourcePatternWorkoutIsIndoors"];

                      if (v77)
                      {
                        v78 = [v71 objectForKeyedSubscript:@"kEventResourcePatternWorkoutIsIndoors"];
                        [v73 setObject:v78 forKey:@"MOWorkoutMetaDataKeyIsIndoors"];
                      }
                      else
                      {
                        [v73 setObject:&__kCFBooleanFalse forKey:@"MOWorkoutMetaDataKeyIsIndoors"];
                      }
                      [v73 setObject:v72 forKey:@"MOWorkoutMetaDataKeyWorkoutID"];
                      v79 = [[MOResource alloc] initWithName:@"Workout" type:10 dict:v73 value:0.0];
                      v80 = [v73 allKeys];
                      unsigned int v81 = [v80 containsObject:@"kEventResourcePatternWorkoutIdentifierFromProvider"];

                      if (v81)
                      {
                        v82 = [v73 objectForKeyedSubscript:@"kEventResourcePatternWorkoutIdentifierFromProvider"];
                        [(MOResource *)v79 setSourceEventIdentifier:v82];
                      }
                      [v105 addObject:v79];
                      v83 = [MOAction alloc];
                      v84 = [v71 objectForKeyedSubscript:@"kEventResourcePatternWorkoutType"];
                      v85 = [(MOAction *)v83 initWithActionName:v84 actionType:4];

                      v86 = [v73 objectForKeyedSubscript:@"kEventResourcePatternWorkoutIdentifierFromProvider"];
                      [(MOAction *)v85 setSourceEventIdentifier:v86];

                      v57 = v103;
                      [v103 addObject:v85];

                      long long v56 = v104;
                    }
                  }
                  id v68 = [v106 countByEnumeratingWithState:&v113 objects:v132 count:16];
                }
                while (v68);
              }

              uint64_t v60 = v97;
              id v37 = v98;
              id v59 = v99;
              v61 = v102;
            }
          }
          v61 = (char *)v61 + 1;
        }
        while (v61 != v59);
        id v59 = [v37 countByEnumeratingWithState:&v117 objects:v133 count:16];
      }
      while (v59);
    }

    [(MOTrendBundlerAnnotatorRecentEvent *)self _assignResourcePriorityScore:v105];
    long long v55 = v96;
    [(MOEventBundle *)v96 setResources:v105];
    if ([v57 count]) {
      [(MOEventBundle *)v96 setActions:v57];
    }

    id v6 = v91;
    id v5 = v93;
    id v38 = v101;
    goto LABEL_64;
  }
  id v29 = [v6 firstObject];
  id v30 = [v29 category];

  if (v30 == (id)10)
  {
    [(MOEventBundle *)v10 setBundleSuperType:3];
    [(MOEventBundle *)v10 setBundleSubType:303];
    v31 = [[MOAction alloc] initWithActionName:@"Conversations" actionType:1 actionSubtype:4];
    [(MOEventBundle *)v10 setAction:v31];

    uint64_t v32 = [v6 firstObject];
    id v33 = [v32 eventIdentifier];
    v34 = [(MOEventBundle *)v10 action];
    [v34 setSourceEventIdentifier:v33];

    id v35 = [v6 firstObject];
    v36 = [(MOTrendBundlerAnnotatorRecentEvent *)self _personsFromEvent:v35];
    [(MOEventBundle *)v10 setPersons:v36];

    v95 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 5];
    [v5 filteredArrayUsingPredicate:];
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    if (![v37 count])
    {
      long long v55 = v10;
LABEL_65:

      v87 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        v88 = [v6 firstObject];
        id v89 = [v88 category];
        *(_DWORD *)buf = 136315650;
        v126 = "-[MOTrendBundlerAnnotatorRecentEvent _annotateEvents:withSourceEventForSet:]";
        __int16 v127 = 2112;
        v128 = v96;
        __int16 v129 = 2048;
        id v130 = v89;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, %lu", buf, 0x20u);

        long long v55 = v96;
      }

      id v28 = v55;
      goto LABEL_68;
    }
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v38 = v37;
    id v39 = [v38 countByEnumeratingWithState:&v109 objects:v131 count:16];
    if (v39)
    {
      id v40 = v39;
      id v92 = v6;
      id v94 = v5;
      uint64_t v41 = *(void *)v110;
      do
      {
        for (k = 0; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v110 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v109 + 1) + 8 * (void)k);
          v44 = [v43 patterns];
          id v45 = [v44 objectForKeyedSubscript:@"kEventPatternType"];
          unsigned int v46 = [v45 intValue];

          if (v46 == 1)
          {
            v47 = [v43 patterns];
            uint64_t v48 = [v47 objectForKeyedSubscript:@"kEventPatternTrendFeatureType"];
            unsigned int v49 = [v48 intValue];

            if (v49 == 2)
            {
              long long v50 = [v43 patterns];
              long long v51 = [v50 objectForKeyedSubscript:@"kEventPatternTrendNumFeatures"];
              [v51 doubleValue];
              double v53 = v52;
              double maximumFeatureCountForFrequencyTrend = self->_maximumFeatureCountForFrequencyTrend;

              if (v53 > maximumFeatureCountForFrequencyTrend) {
                [(MOEventBundle *)v96 setIsAggregatedAndSuppressed:1];
              }
            }
          }
        }
        id v40 = [v38 countByEnumeratingWithState:&v109 objects:v131 count:16];
      }
      while (v40);
      id v37 = v38;
      id v6 = v92;
      id v5 = v94;
    }
    else
    {
      id v37 = v38;
    }
    long long v55 = v96;
LABEL_64:

    goto LABEL_65;
  }
  id v28 = 0;
  long long v55 = v10;
LABEL_68:

LABEL_69:

  return v28;
}

- (void)_assignResourcePriorityScore:(id)a3
{
  id v3 = a3;
  unsigned int v19 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v17 = *(void *)v21;
    uint64_t v6 = 100;
    uint64_t v7 = 200;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v9 getDictionary];
        id v12 = [v11 objectForKeyedSubscript:@"MOWorkoutMetaDataKeyActivityType"];
        if ([(MOTrendBundlerAnnotatorRecentEvent *)self _isStringUnique:v12 inThis:v19])
        {
          [v19 addObject:v12];
          unint64_t v13 = v6++;
        }
        else
        {
          unint64_t v13 = v7++;
        }
        [v9 setPriorityScore:(double)v13];
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v5);
  }

  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v19 count];
    *(_DWORD *)buf = 134218242;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Found %lu unique workout types and they are %@", buf, 0x16u);
  }
}

- (id)_actionFromEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 patterns];
  id v5 = [v4 objectForKeyedSubscript:@"kEventPatternOverallWorkoutType"];

  uint64_t v6 = [[MOAction alloc] initWithActionName:v5 actionType:4 actionSubtype:0];
  uint64_t v7 = [v3 eventIdentifier];

  [(MOAction *)v6 setSourceEventIdentifier:v7];

  return v6;
}

- (id)_personsFromEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 interactionScoredContact];
  uint64_t v6 = [v5 contact];
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = +[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:v7];

  if (v8)
  {
    id v9 = [MOPerson alloc];
    v10 = [v5 contact];
    id v11 = [v10 givenName];
    id v12 = [v5 contact];
    unint64_t v13 = [v12 identifier];
    uint64_t v14 = +[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:v13];
    [v5 score];
    id v16 = [(MOPerson *)v9 initWithLocalIdentifier:0 name:v11 contactIdentifier:v14 family:0 priorityScore:100.0 significanceScore:v15];

    uint64_t v17 = [v3 eventIdentifier];
    [(MOPerson *)v16 setSourceEventIdentifier:v17];

    [(MOPerson *)v16 setSourceEventAccessType:3];
    [v4 addObject:v16];
    id v18 = v4;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)configure:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"maximumFeatureCountForFrequencyTrend"];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"maximumFeatureCountForFrequencyTrend"];
    [v6 doubleValue];
    self->_double maximumFeatureCountForFrequencyTrend = v7;
  }
  return 1;
}

- (BOOL)_isStringUnique:(id)a3 inThis:(id)a4
{
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "isEqualToString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

@end