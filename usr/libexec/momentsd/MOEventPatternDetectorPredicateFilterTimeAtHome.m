@interface MOEventPatternDetectorPredicateFilterTimeAtHome
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorPredicateFilterTimeAtHome)init;
- (id)filterEvents:(id)a3;
@end

@implementation MOEventPatternDetectorPredicateFilterTimeAtHome

- (MOEventPatternDetectorPredicateFilterTimeAtHome)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOEventPatternDetectorPredicateFilterTimeAtHome;
  v2 = [(MOEventPatternDetectorPredicateFilterTimeAtHome *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[NSCalendar currentCalendar];
    cal = v2->_cal;
    v2->_cal = (NSCalendar *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)filterEvents:(id)a3
{
  id v4 = a3;
  v5 = +[NSPredicate predicateWithFormat:@"%K = %lu AND %K = %lu", @"category", 1, @"placeUserType", 1];
  v6 = [v4 filteredArrayUsingPredicate:v5];
  id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v54 = v7;
  v8 = +[NSArray arrayWithObjects:&v54 count:1];
  v9 = [v6 sortedArrayUsingDescriptors:v8];

  v10 = +[MOEventPatternDetectorUtilities getHomeVisitChunksForStandardDay:v9];
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    id v51 = [v9 count];
    __int16 v52 = 2048;
    id v53 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found %lu home visits and processed into %lu home visit chunks", buf, 0x16u);
  }

  if ([v10 count])
  {
    v38 = v9;
    id v39 = v7;
    v40 = v6;
    v41 = v5;
    id v42 = v4;
    id v43 = (id)objc_opt_new();
    v12 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v37 = v10;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v45;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          [v18 setTimeAtHomeSubType:1];
          cal = self->_cal;
          v20 = [v18 startDate];
          v21 = [v20 dateByAddingTimeInterval:-10800.0];
          v22 = [(NSCalendar *)cal components:512 fromDate:v21];

          v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v22 weekday]);
          v24 = [v12 objectForKey:v23];

          if (!v24)
          {
            v25 = objc_opt_new();
            [v12 setObject:v25 forKeyedSubscript:v23];
          }
          v26 = [v12 objectForKeyedSubscript:v23];
          [v26 addObject:v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v15);
    }

    uint64_t v27 = 1;
    id v28 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    v5 = v41;
    id v4 = v42;
    v6 = v40;
    v29 = NSAssertionHandler_ptr;
    do
    {
      v30 = [v29[32] numberWithInt:v27];
      v31 = [v12 objectForKeyedSubscript:v30];

      if (v31)
      {
        v32 = [v29[32] numberWithInt:v27];
        v33 = [v12 objectForKeyedSubscript:v32];

        id v48 = v28;
        v34 = +[NSArray arrayWithObjects:&v48 count:1];
        v35 = [v33 sortedArrayUsingDescriptors:v34];
        [v43 addObject:v35];

        v29 = NSAssertionHandler_ptr;
      }
      else
      {
        v33 = objc_opt_new();
        [v43 addObject:v33];
      }

      uint64_t v27 = (v27 + 1);
    }
    while (v27 != 8);

    v9 = v38;
    id v7 = v39;
    v10 = v37;
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end