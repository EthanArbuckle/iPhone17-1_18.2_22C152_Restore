@interface MOEventPatternDetectorPredicateFilterByADPDCounts
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorPredicateFilterByADPDCounts)init;
- (id)crossReference:(id)a3 withEvents:(id)a4 withGroupingStrategy:(unint64_t)a5;
- (id)filterEvents:(id)a3;
- (id)splitIntoWeekdays:(id)a3 withADPDEvents:(id)a4 withCalendar:(id)a5;
@end

@implementation MOEventPatternDetectorPredicateFilterByADPDCounts

- (MOEventPatternDetectorPredicateFilterByADPDCounts)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterByADPDCounts;
  v2 = [(MOEventPatternDetectorPredicateFilterByADPDCounts *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[NSPredicate predicateWithFormat:@"%K = %lu AND %K = %lu", @"category", 1, @"placeUserType", 1];
  objc_super v6 = [v3 filteredArrayUsingPredicate:v5];
  id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v60 = v7;
  v8 = +[NSArray arrayWithObjects:&v60 count:1];
  v44 = v6;
  v9 = [v6 sortedArrayUsingDescriptors:v8];

  v10 = +[MOEventPatternDetectorUtilities getHomeVisitChunksForStandardDay:v9];
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    id v57 = [v9 count];
    __int16 v58 = 2048;
    id v59 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found %lu home visits and processed into %lu home visit chunks", buf, 0x16u);
  }

  if ([v10 count])
  {
    v42 = v9;
    v12 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 15];
    v43 = [v3 filteredArrayUsingPredicate:v12];
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v43 count];
      *(_DWORD *)buf = 134217984;
      id v57 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "H@H: Found %lu proximity events", buf, 0xCu);
    }

    v41 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 23];
    v15 = [v3 filteredArrayUsingPredicate:];
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v15 count];
      *(_DWORD *)buf = 134217984;
      id v57 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "H@H: Found %lu people density events", buf, 0xCu);
    }

    id v18 = [v15 count];
    v19 = v43;
    if ((char *)[v43 count] + (void)v18)
    {
      v37 = v12;
      v39 = v5;
      id v40 = v3;
      id v21 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
      uint64_t v22 = [(MOEventPatternDetectorPredicateFilterByADPDCounts *)self splitIntoWeekdays:v10 withADPDEvents:v43 withCalendar:v21];
      v38 = v10;
      v36 = v21;
      [(MOEventPatternDetectorPredicateFilterByADPDCounts *)self splitIntoWeekdays:v10 withADPDEvents:v15 withCalendar:v21];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v34 = long long v52 = 0u;
      v35 = (void *)v22;
      v54[0] = v22;
      v54[1] = v34;
      id obj = +[NSArray arrayWithObjects:v54 count:2];
      id v48 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v48)
      {
        uint64_t v46 = *(void *)v50;
        do
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v50 != v46) {
              objc_enumerationMutation(obj);
            }
            v24 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            uint64_t v25 = 1;
            do
            {
              v26 = +[NSNumber numberWithInt:v25];
              v27 = [v24 objectForKeyedSubscript:v26];

              if (v27)
              {
                v28 = +[NSNumber numberWithInt:v25];
                v29 = [v24 objectForKeyedSubscript:v28];

                id v53 = v7;
                v30 = +[NSArray arrayWithObjects:&v53 count:1];
                [v29 sortedArrayUsingDescriptors:v30];
                v32 = v31 = v15;
                [v4 addObject:v32];

                v15 = v31;
              }
              else
              {
                v29 = objc_opt_new();
                [v4 addObject:v29];
              }

              uint64_t v25 = (v25 + 1);
            }
            while (v25 != 8);
          }
          id v48 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        }
        while (v48);
      }

      id v20 = v4;
      v5 = v39;
      id v3 = v40;
      v12 = v37;
      v10 = v38;
      v19 = v43;
    }
    else
    {
      id v20 = 0;
    }

    v9 = v42;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)splitIntoWeekdays:(id)a3 withADPDEvents:(id)a4 withCalendar:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v31 = a5;
  v9 = objc_opt_new();
  v10 = [v8 firstObject];
  id v11 = [v10 category];

  if (v11 == (id)15) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = -1;
  }
  v13 = [v8 firstObject];
  id v14 = [v13 category];

  if (v14 == (id)23) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v12;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  id v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = [(MOEventPatternDetectorPredicateFilterByADPDCounts *)self crossReference:*(void *)(*((void *)&v33 + 1) + 8 * i) withEvents:v8 withGroupingStrategy:v15];
        id v21 = v20;
        if (v20)
        {
          uint64_t v22 = [v20 startDate];
          v23 = [v22 dateByAddingTimeInterval:-10800.0];
          v24 = [v31 components:512 fromDate:v23];

          uint64_t v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 weekday]);
          v26 = [v9 objectForKey:v25];

          if (!v26)
          {
            v27 = objc_opt_new();
            [v9 setObject:v27 forKeyedSubscript:v25];
          }
          v28 = [v9 objectForKeyedSubscript:v25];
          [v28 addObject:v21];
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  return v9;
}

- (id)crossReference:(id)a3 withEvents:(id)a4 withGroupingStrategy:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 startDate];
  v9 = [v6 endDate];
  v96 = objc_opt_new();
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v105 objects:v111 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v106;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v106 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        id v16 = [v15 startDate];
        id v17 = [v15 endDate];
        if ([v16 compare:v8] != (id)-1 && objc_msgSend(v17, "compare:", v9) != (id)1) {
          [v96 addObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v105 objects:v111 count:16];
    }
    while (v12);
  }

  uint64_t v18 = v96;
  if (![v96 count]) {
    goto LABEL_29;
  }
  if ([v96 count] != (id)1)
  {
    if (a5 == 1)
    {
      id v91 = v6;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id objb = v96;
      id v54 = [objb countByEnumeratingWithState:&v97 objects:v109 count:16];
      if (v54)
      {
        id v55 = v54;
        v56 = 0;
        uint64_t v57 = *(void *)v98;
        float v58 = 0.0;
        float v59 = 0.0;
        do
        {
          for (j = 0; j != v55; j = (char *)j + 1)
          {
            if (*(void *)v98 != v57) {
              objc_enumerationMutation(objb);
            }
            v61 = *(void **)(*((void *)&v97 + 1) + 8 * (void)j);
            v62 = [v61 densityScore];
            [v62 floatValue];
            float v64 = v63;

            v65 = [v61 densityScore];
            [v65 floatValue];
            float v67 = v66;

            if (v67 > v59)
            {
              id v68 = v61;

              v69 = [v68 densityScore];
              [v69 floatValue];
              float v59 = v70;

              v56 = v68;
            }
            float v58 = v58 + v64;
          }
          id v55 = [objb countByEnumeratingWithState:&v97 objects:v109 count:16];
        }
        while (v55);
      }
      else
      {
        v56 = 0;
        float v58 = 0.0;
      }

      float v71 = v58 / (float)(unint64_t)[objb count];
      v72 = [objb sortMOEventArrayByStartDate];
      v73 = [v72 firstObject];

      v74 = [objb sortMOEventArrayByEndDate];
      v75 = [v74 lastObject];

      if (v56) {
        v76 = v56;
      }
      else {
        v76 = v73;
      }
      v88 = [v76 eventIdentifier];
      v77 = [MOEvent alloc];
      v78 = [v73 startDate];
      [v75 endDate];
      v79 = id objc = v73;
      v80 = +[NSDate date];
      v26 = [(MOEvent *)v77 initWithEventIdentifier:v88 startDate:v78 endDate:v79 creationDate:v80 provider:5 category:1];

      v81 = [v75 endDate];
      v82 = [v81 dateByAddingTimeInterval:2419200.0];
      [(MOEvent *)v26 setExpirationDate:v82];

      [(MOEvent *)v26 setPCount:&off_1002F4898];
      *(float *)&double v83 = v71;
      v84 = +[NSNumber numberWithFloat:v83];
      [(MOEvent *)v26 setDensityScore:v84];

      [(MOEvent *)v26 setTimeAtHomeSubType:3];
      id v6 = v91;
      goto LABEL_49;
    }
    if (!a5)
    {
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v32 = v96;
      id v33 = [v32 countByEnumeratingWithState:&v101 objects:v110 count:16];
      if (!v33)
      {
        v26 = 0;
        goto LABEL_43;
      }
      id v34 = v33;
      id v90 = v6;
      id obja = v32;
      id v87 = v10;
      long long v35 = 0;
      signed int v36 = 0;
      uint64_t v37 = *(void *)v102;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v102 != v37) {
            objc_enumerationMutation(obja);
          }
          v39 = *(void **)(*((void *)&v101 + 1) + 8 * (void)k);
          id v40 = [v39 pCount:v87];
          signed int v41 = [v40 intValue];

          if (v41 > v36)
          {
            id v42 = v39;

            v43 = [v42 pCount];
            signed int v36 = [v43 intValue];

            long long v35 = v42;
          }
        }
        id v34 = [obja countByEnumeratingWithState:&v101 objects:v110 count:16];
      }
      while (v34);

      if (v35)
      {
        v44 = [MOEvent alloc];
        v45 = [v35 eventIdentifier];
        uint64_t v46 = [v35 startDate];
        v47 = [v35 endDate];
        id v48 = +[NSDate date];
        v26 = [(MOEvent *)v44 initWithEventIdentifier:v45 startDate:v46 endDate:v47 creationDate:v48 provider:5 category:1];

        long long v49 = [v35 endDate];
        long long v50 = [v49 dateByAddingTimeInterval:2419200.0];
        [(MOEvent *)v26 setExpirationDate:v50];

        long long v51 = [v35 pCount];
        [(MOEvent *)v26 setPCount:v51];

        [(MOEvent *)v26 setDensityScore:&off_1002F9700];
        [(MOEvent *)v26 setTimeAtHomeSubType:3];
        id v32 = v35;
        id v10 = v87;
        id v6 = v90;
        uint64_t v18 = v96;
LABEL_43:

        goto LABEL_50;
      }
      v26 = 0;
      id v10 = v87;
      id v6 = v90;
LABEL_49:
      uint64_t v18 = v96;
      goto LABEL_50;
    }
LABEL_29:
    v26 = 0;
    goto LABEL_50;
  }
  id v89 = v6;
  v19 = [MOEvent alloc];
  v86 = [v96 firstObject];
  id v20 = [v86 eventIdentifier];
  id v21 = [v96 firstObject];
  uint64_t v22 = [v21 startDate];
  v23 = [v96 firstObject];
  v24 = [v23 endDate];
  uint64_t v25 = +[NSDate date];
  v26 = [(MOEvent *)v19 initWithEventIdentifier:v20 startDate:v22 endDate:v24 creationDate:v25 provider:5 category:1];

  uint64_t v18 = v96;
  v27 = [v96 firstObject];
  v28 = [v27 endDate];
  v29 = [v28 dateByAddingTimeInterval:2419200.0];
  [(MOEvent *)v26 setExpirationDate:v29];

  if (a5 == 1)
  {
    [(MOEvent *)v26 setPCount:&off_1002F4898];
    long long v52 = [v96 firstObject];
    id v53 = [v52 densityScore];
    [(MOEvent *)v26 setDensityScore:v53];

    id v6 = v89;
  }
  else
  {
    id v6 = v89;
    if (!a5)
    {
      v30 = [v96 firstObject];
      id v31 = [v30 pCount];
      [(MOEvent *)v26 setPCount:v31];

      [(MOEvent *)v26 setDensityScore:&off_1002F9700];
    }
  }
  [(MOEvent *)v26 setTimeAtHomeSubType:3];
LABEL_50:

  return v26;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end