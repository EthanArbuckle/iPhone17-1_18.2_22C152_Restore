@interface MOTrendsAnalyzer
- (MOHealthKitManager)healthKitManager;
- (MOTrendsAnalyzer)init;
- (MOTrendsAnalyzer)initWithHealthKitManager:(id)a3;
- (double)timeOfDay:(id)a3;
- (id)buildAnalyticsPlans;
- (id)eventWithOptions:(id)a3 originalTrendsData:(id)a4;
- (id)indexDate:(id)a3 aggregationDuration:(unint64_t)a4 referenceDate:(id)a5;
- (id)lookupTrendsDataWithOptions:(id)a3 events:(id)a4;
- (id)prepareData:(id)a3 aggregationDuration:(unint64_t)a4 aggregationMethod:(unint64_t)a5 valueFunction:(id)a6;
- (int64_t)trendsfromAnalyticsResult:(unint64_t)a3;
- (void)analyzeEvents:(id)a3 analyticsPlans:(id)a4 handler:(id)a5;
- (void)analyzeEvents:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)sendMetricsForTrendsEvents:(id)a3;
- (void)setCommonFields:(id)a3;
- (void)setDecimatedValue:(id)a3 forKey:(id)a4 dictionary:(id)a5;
- (void)setHealthKitManager:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4 dictionary:(id)a5;
- (void)setValue:(id)a3 forKey:(id)a4 dictionary:(id)a5 bins:(id)a6;
- (void)updateTrendsData:(id)a3 lastEventDate:(id)a4 lastEventInterval:(double)a5;
- (void)updateTrendsData:(id)a3 model:(id)a4;
- (void)updateTrendsData:(id)a3 prevTrendsData:(id)a4;
- (void)updateTrendsData:(id)a3 result:(unint64_t)a4;
@end

@implementation MOTrendsAnalyzer

- (MOTrendsAnalyzer)init
{
  if (self)
  {
    healthKitManager = self->_healthKitManager;
    self->_healthKitManager = 0;
  }
  return self;
}

- (MOTrendsAnalyzer)initWithHealthKitManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOTrendsAnalyzer;
  v6 = [(MOTrendsAnalyzer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_healthKitManager, a3);
  }

  return v7;
}

- (id)indexDate:(id)a3 aggregationDuration:(unint64_t)a4 referenceDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 2uLL:
      v10 = +[NSCalendar currentCalendar];
      v11 = [v10 components:512 fromDate:v7];
      v12 = [v10 components:512 fromDate:v8];
      id v13 = objc_alloc_init((Class)NSDateComponents);
      [v13 setDay:((unsigned char *)[v12 weekday] - (unsigned char *)[v11 weekday])];
      v14 = [v10 dateByAddingComponents:v13 toDate:v7 options:0];
      v15 = [v10 components:28 fromDate:v14];
      v16 = [v10 dateFromComponents:v15];

      goto LABEL_9;
    case 1uLL:
      id v9 = [v7 startOfDayWithBoundaryOfADay:10800.0];
      goto LABEL_7;
    case 0uLL:
      id v9 = v7;
LABEL_7:
      v16 = v9;
      goto LABEL_9;
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (id)prepareData:(id)a3 aggregationDuration:(unint64_t)a4 aggregationMethod:(unint64_t)a5 valueFunction:(id)a6
{
  id v9 = a3;
  v10 = (double (**)(id, void *))a6;
  v40 = +[NSDate date];
  v11 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v38 = *(void *)v42;
    *(void *)&long long v13 = 138412546;
    long long v33 = v13;
    unint64_t v34 = a5;
    unint64_t v35 = a4;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v17 = [v16 startDate:v33];
        v18 = [(MOTrendsAnalyzer *)self indexDate:v17 aggregationDuration:a4 referenceDate:v40];

        v19 = [v11 objectForKey:v18];
        if (!v19)
        {
          v19 = objc_opt_new();
          v20 = [v16 startDate];
          [v19 setDate:v20];
        }
        v21 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v28 = NSStringFromSelector(a2);
          v29 = [v16 startDate];
          *(_DWORD *)buf = 138413314;
          v46 = v28;
          __int16 v47 = 2112;
          double v48 = *(double *)&v29;
          __int16 v49 = 2112;
          v50 = v18;
          __int16 v51 = 2112;
          v52 = v16;
          __int16 v53 = 2112;
          v54 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@ event.startDate, %@, index, %@, event, %@, data, %@", buf, 0x34u);

          a5 = v34;
          a4 = v35;
        }

        double v22 = v10[2](v10, v16);
        if (v22 > -1.79769313e308 && v22 < 1.79769313e308)
        {
          switch(a5)
          {
            case 2uLL:
              goto LABEL_22;
            case 1uLL:
              [v19 value];
              double v27 = v22 + v26 * (double)(unint64_t)[v19 count];
              double v22 = v27 / (double)((unint64_t)[v19 count] + 1);
LABEL_22:
              [v19 setValue:v22];
              break;
            case 0uLL:
              [v19 value];
              double v22 = v22 + v25;
              goto LABEL_22;
          }
          [v19 setCount:[v19 count] + 1];
          [v11 setObject:v19 forKey:v18];
          goto LABEL_24;
        }
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v30 = NSStringFromSelector(a2);
          *(_DWORD *)buf = v33;
          v46 = v30;
          __int16 v47 = 2048;
          double v48 = v22;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%@ Invalid ranged value, %f", buf, 0x16u);

          a4 = v35;
        }

LABEL_24:
      }
      id v14 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v14);
  }

  v31 = [v11 allValues];

  return v31;
}

- (void)analyzeEvents:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, uint64_t))a5;
  if ([v8 count])
  {
    v11 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"provider == %lu AND category == %lu", 5, [v9 category]);
    id v12 = [v8 filteredArrayUsingPredicate:v11];
    long long v13 = [(MOTrendsAnalyzer *)self lookupTrendsDataWithOptions:v9 events:v12];
    v118 = self;
    id v14 = [(MOTrendsAnalyzer *)self eventWithOptions:v9 originalTrendsData:v13];
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v88 = NSStringFromSelector(a2);
      [v9 keyword];
      v115 = v12;
      v89 = v14;
      v91 = v90 = v13;
      *(_DWORD *)buf = 138413570;
      v134 = v88;
      __int16 v135 = 2112;
      v136 = v91;
      __int16 v137 = 2112;
      id v138 = v9;
      __int16 v139 = 2048;
      v140 = [v115 count];
      __int16 v141 = 2112;
      double v142 = *(double *)&v90;
      __int16 v143 = 2112;
      id v144 = v89;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, options, %@, data, trends array, %lu, original trends, %@, new trends, %@", buf, 0x3Eu);

      long long v13 = v90;
      id v14 = v89;
      id v12 = v115;
    }
    if ([v9 category]) {
      +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"provider != %lu AND category == %lu", 5, [v9 category]);
    }
    else {
    v17 = +[NSPredicate predicateWithFormat:@"provider != %lu", 5, v104];
    }
    v16 = [v8 filteredArrayUsingPredicate:v17];

    if ([v16 count])
    {
      v18 = [v16 lastObject];
      uint64_t v19 = [v18 startDate];

      v116 = v19;
      if ((unint64_t)[v16 count] < 2)
      {
        double v23 = 1.79769313e308;
      }
      else
      {
        v20 = [v16 objectAtIndex:((char *)[v16 count] - 2)];
        v21 = [v20 startDate];
        [v116 timeIntervalSinceDate:v21];
        double v23 = v22;

        uint64_t v19 = (uint64_t)v116;
      }
      v117 = v16;
      v109 = v13;
      v110 = v11;
      v114 = v12;
      v111 = v10;
      double v25 = [v14 trends];
      [(MOTrendsAnalyzer *)v118 updateTrendsData:v25 lastEventDate:v19 lastEventInterval:v23];

      double v26 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v96 = NSStringFromSelector(a2);
        v97 = [v9 keyword];
        *(_DWORD *)buf = 138413314;
        v134 = v96;
        __int16 v135 = 2112;
        v136 = v97;
        __int16 v137 = 2112;
        id v138 = v14;
        __int16 v139 = 2112;
        v140 = v116;
        __int16 v141 = 2048;
        double v142 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, trendsData, %@, update last event date and interval, last event date, %@, last event interval, %f", buf, 0x34u);
      }
      v113 = v14;

      double v27 = [v9 trainDateInterval];
      v28 = [v27 startDate];
      v29 = [v9 trainDateInterval];
      [v29 endDate];
      v30 = v119 = v9;
      v31 = [v119 trainDateInterval];
      v32 = [v31 startDate];
      long long v33 = [v119 trainDateInterval];
      unint64_t v34 = [v33 endDate];
      uint64_t v35 = +[NSPredicate predicateWithFormat:@"(startDate >= %@ AND startDate <= %@)", v28, v30, v32, v34];

      v108 = (void *)v35;
      uint64_t v36 = [v117 filteredArrayUsingPredicate:v35];
      id v37 = [v119 aggregationDuration];
      id v38 = [v119 aggregationMethod];
      v39 = [v119 valueFunction];
      v112 = (void *)v36;
      uint64_t v40 = [(MOTrendsAnalyzer *)v118 prepareData:v36 aggregationDuration:v37 aggregationMethod:v38 valueFunction:v39];

      long long v41 = [v119 testDateInterval];
      long long v42 = [v41 startDate];
      long long v43 = [v119 testDateInterval];
      long long v44 = [v43 endDate];
      v45 = [v119 testDateInterval];
      v46 = [v45 startDate];
      __int16 v47 = [v119 testDateInterval];
      double v48 = [v47 endDate];
      uint64_t v49 = +[NSPredicate predicateWithFormat:@"(startDate >= %@ AND startDate <= %@)", v42, v44, v46, v48];

      v50 = (void *)v40;
      v107 = (void *)v49;
      __int16 v51 = [v117 filteredArrayUsingPredicate:v49];
      id v52 = [v119 aggregationDuration];
      id v53 = [v119 aggregationMethod];
      v54 = [v119 valueFunction];
      v55 = [(MOTrendsAnalyzer *)v118 prepareData:v51 aggregationDuration:v52 aggregationMethod:v53 valueFunction:v54];

      v56 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        v98 = NSStringFromSelector(a2);
        v99 = [v119 keyword];
        v100 = [v112 count];
        id v101 = [v51 count];
        id v102 = [v50 count];
        id v103 = [v55 count];
        *(_DWORD *)buf = 138413826;
        v134 = v98;
        __int16 v135 = 2112;
        v136 = v99;
        __int16 v137 = 2112;
        id v138 = v119;
        __int16 v139 = 2048;
        v140 = v100;
        __int16 v141 = 2048;
        double v142 = *(double *)&v101;
        __int16 v143 = 2048;
        id v144 = v102;
        __int16 v145 = 2048;
        id v146 = v103;
        _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, options, %@, data, train, %lu, test, %lu, train.data, %lu, test.data, %lu", buf, 0x48u);
      }
      v105 = v55;
      v106 = v51;

      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v57 = v50;
      id v58 = [v57 countByEnumeratingWithState:&v126 objects:v132 count:16];
      if (v58)
      {
        id v59 = v58;
        uint64_t v60 = *(void *)v127;
        do
        {
          for (i = 0; i != v59; i = (char *)i + 1)
          {
            if (*(void *)v127 != v60) {
              objc_enumerationMutation(v57);
            }
            v62 = *(void **)(*((void *)&v126 + 1) + 8 * i);
            v63 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              v64 = NSStringFromSelector(a2);
              v65 = [v62 date];
              [v62 value];
              v67 = v66;
              v68 = [v62 count];
              *(_DWORD *)buf = 138413058;
              v134 = v64;
              __int16 v135 = 2112;
              v136 = v65;
              __int16 v137 = 2048;
              id v138 = v67;
              __int16 v139 = 2048;
              v140 = v68;
              _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "%@ train data, date, %@, value, %f, count, %lu", buf, 0x2Au);
            }
          }
          id v59 = [v57 countByEnumeratingWithState:&v126 objects:v132 count:16];
        }
        while (v59);
      }

      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v69 = v105;
      id v70 = [v69 countByEnumeratingWithState:&v122 objects:v131 count:16];
      if (v70)
      {
        id v71 = v70;
        uint64_t v72 = *(void *)v123;
        do
        {
          for (j = 0; j != v71; j = (char *)j + 1)
          {
            if (*(void *)v123 != v72) {
              objc_enumerationMutation(v69);
            }
            v74 = *(void **)(*((void *)&v122 + 1) + 8 * (void)j);
            v75 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              v76 = NSStringFromSelector(a2);
              v77 = [v74 date];
              [v74 value];
              v79 = v78;
              v80 = [v74 count];
              *(_DWORD *)buf = 138413058;
              v134 = v76;
              __int16 v135 = 2112;
              v136 = v77;
              __int16 v137 = 2048;
              id v138 = v79;
              __int16 v139 = 2048;
              v140 = v80;
              _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "%@ test data, date, %@, value, %f, count, %lu", buf, 0x2Au);
            }
          }
          id v71 = [v69 countByEnumeratingWithState:&v122 objects:v131 count:16];
        }
        while (v71);
      }

      if ((unint64_t)[v57 count] > 5)
      {
        id v9 = v119;
        v11 = v110;
        v10 = v111;
        id v14 = v113;
        if (![v69 count])
        {
          v81 = objc_alloc_init(MOTimeSeries);
          v130 = v81;
          uint64_t v82 = +[NSArray arrayWithObjects:&v130 count:1];

          id v69 = (id)v82;
        }
        v83 = objc_opt_new();
        if ([v83 fitData:v57])
        {
          v84 = [v83 testData:v69];
          v85 = v84;
          if (v84)
          {
            if ([v84 outlier])
            {
              [v85 score];
              uint64_t v86 = 4;
              if (v87 > 0.0) {
                uint64_t v86 = 6;
              }
            }
            else
            {
              uint64_t v86 = 5;
            }
            SEL aSelectora = (SEL)v86;
            v93 = v113;
            v94 = [v113 trends];
            [(MOTrendsAnalyzer *)v118 updateTrendsData:v94 model:v83];

            v95 = [v113 trends];
            uint64_t v92 = (uint64_t)aSelectora;
            [(MOTrendsAnalyzer *)v118 updateTrendsData:v95 result:aSelectora];
          }
          else
          {
            uint64_t v92 = 3;
            v93 = v113;
          }
          ((void (**)(id, void *, uint64_t))v111)[2](v111, v93, v92);

          id v14 = v93;
        }
        else
        {
          ((void (**)(id, void *, uint64_t))v111)[2](v111, v113, 3);
        }
      }
      else
      {
        v10 = v111;
        id v14 = v113;
        ((void (**)(id, void *, uint64_t))v111)[2](v111, v113, 1);
        id v9 = v119;
        v11 = v110;
      }
      v16 = v117;

      id v12 = v114;
      v24 = v116;
      long long v13 = v109;
    }
    else
    {
      v10[2](v10, 0, 1);
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[MOTrendsAnalyzer analyzeEvents:options:resultHandler:](a2, v9, v24);
      }
    }
  }
  else
  {
    v10[2](v10, 0, 1);
    v16 = v8;
  }
}

- (id)eventWithOptions:(id)a3 originalTrendsData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    [v7 eventIdentifier];
  }
  else {
  id v9 = +[NSUUID UUID];
  }
  v10 = [MOEvent alloc];
  v11 = [v6 testDateInterval];
  id v12 = [v11 startDate];
  long long v13 = [v6 testDateInterval];
  id v14 = [v13 endDate];
  v15 = +[NSDate date];
  v16 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v10, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v9, v12, v14, v15, 5, [v6 category]);

  v17 = [v6 testDateInterval];
  v18 = [v17 endDate];
  uint64_t v19 = [v18 dateByAddingTimeInterval:2419200.0];
  [(MOEvent *)v16 setExpirationDate:v19];

  v20 = objc_opt_new();
  v21 = [v6 keyword];
  [v20 setObject:v21 forKeyedSubscript:@"keyword"];

  double v22 = [v6 trainDateInterval];
  double v23 = [v22 startDate];
  [v23 timeIntervalSinceReferenceDate];
  v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v20 setObject:v24 forKeyedSubscript:@"trainStartDate"];

  double v25 = [v6 trainDateInterval];
  double v26 = [v25 endDate];
  [v26 timeIntervalSinceReferenceDate];
  double v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v20 setObject:v27 forKeyedSubscript:@"trainEndDate"];

  v28 = [v6 testDateInterval];
  v29 = [v28 startDate];
  [v29 timeIntervalSinceReferenceDate];
  v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v20 setObject:v30 forKeyedSubscript:@"testStartDate"];

  v31 = [v6 testDateInterval];
  v32 = [v31 endDate];
  [v32 timeIntervalSinceReferenceDate];
  long long v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v20 setObject:v33 forKeyedSubscript:@"testEndDate"];

  unint64_t v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 aggregationDuration]);
  [v20 setObject:v34 forKeyedSubscript:@"aggregationDuration"];

  uint64_t v35 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 aggregationMethod]);
  [v20 setObject:v35 forKeyedSubscript:@"aggregationMethod"];

  uint64_t v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 valueFunctionType]);
  [v20 setObject:v36 forKeyedSubscript:@"valueFunctionType"];

  [(MOEvent *)v16 setTrends:v20];
  if (v8)
  {
    id v37 = [(MOEvent *)v16 trends];
    id v38 = [v8 trends];
    [(MOTrendsAnalyzer *)self updateTrendsData:v37 prevTrendsData:v38];

    v39 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v40 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v45 = v40;
    __int16 v46 = 2112;
    id v47 = v6;
    __int16 v48 = 2112;
    uint64_t v49 = v16;
    long long v41 = "%@ options, %@, trends data from origin, event, %@";
  }
  else
  {
    v39 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v40 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v45 = v40;
    __int16 v46 = 2112;
    id v47 = v6;
    __int16 v48 = 2112;
    uint64_t v49 = v16;
    long long v41 = "%@ options, %@, new trends data, event, %@";
  }
  _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, v41, buf, 0x20u);

LABEL_8:

  return v16;
}

- (void)updateTrendsData:(id)a3 prevTrendsData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v19[0] = @"lastEventDate";
  v19[1] = @"lastEventInterval";
  +[NSArray arrayWithObjects:v19 count:2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v13 = [v6 objectForKey:v12];
        if (v13) {
          [v5 setObject:v13 forKeyedSubscript:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)updateTrendsData:(id)a3 lastEventDate:(id)a4 lastEventInterval:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 objectForKey:@"lastEventDate"];
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)double v27 = 138412290;
    *(void *)&v27[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "updateTrendsData, %@", v27, 0xCu);
  }

  [v9 timeIntervalSinceReferenceDate];
  uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v8 setObject:v12 forKeyedSubscript:@"lastEventDate"];

  double v13 = 0.0;
  if (v10)
  {
    [v9 timeIntervalSinceReferenceDate];
    double v15 = v14;
    [v10 doubleValue];
    double v17 = v15 - v16;
    if (v17 >= 0.0) {
      double v18 = v17;
    }
    else {
      double v18 = -v17;
    }
    if (v18 > 1.0)
    {
      if (v18 < a5) {
        a5 = v18;
      }
      uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)double v27 = 134218240;
      *(double *)&v27[4] = a5;
      *(_WORD *)&v27[12] = 2048;
      *(double *)&v27[14] = v18;
      v20 = "updateTrendsData, min, %f, interval , %f";
      v21 = v19;
      uint32_t v22 = 22;
      goto LABEL_15;
    }
    if (a5 < 1.79769313e308)
    {
      uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_16:

        double v13 = a5;
        goto LABEL_17;
      }
      *(_DWORD *)double v27 = 134217984;
      *(double *)&v27[4] = a5;
      v20 = "updateTrendsData, min, %f";
      v21 = v19;
      uint32_t v22 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, v27, v22);
      goto LABEL_16;
    }
  }
LABEL_17:
  double v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13, *(_OWORD *)v27, *(void *)&v27[16]);
  [v8 setObject:v23 forKeyedSubscript:@"lastEventInterval"];

  v24 = +[NSDate date];
  [v24 timeIntervalSinceDate:v9];
  double v26 = v25;

  if (v13 > 1814400.0 || v26 > 1814400.0) {
    [(MOTrendsAnalyzer *)self updateTrendsData:v8 result:8];
  }
}

- (void)updateTrendsData:(id)a3 model:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v18 = [v5 getTrainDataStats];
  id v7 = [v5 getTestDataStats];

  [v18 mean];
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v8 forKeyedSubscript:@"trainMean"];

  [v18 std];
  id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v9 forKeyedSubscript:@"trainStd"];

  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
  [v6 setObject:v10 forKeyedSubscript:@"trainCount"];

  [v18 min];
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v11 forKeyedSubscript:@"trainMin"];

  [v18 max];
  uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v12 forKeyedSubscript:@"trainMax"];

  [v7 mean];
  double v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v13 forKeyedSubscript:@"testMean"];

  [v7 std];
  double v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v14 forKeyedSubscript:@"testStd"];

  double v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
  [v6 setObject:v15 forKeyedSubscript:@"testCount"];

  [v7 min];
  double v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v16 forKeyedSubscript:@"testMin"];

  [v7 max];
  double v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 setObject:v17 forKeyedSubscript:@"testMax"];
}

- (void)updateTrendsData:(id)a3 result:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInteger:a4];
  [v5 setObject:v6 forKeyedSubscript:@"trends"];
}

- (int64_t)trendsfromAnalyticsResult:(unint64_t)a3
{
  if (a3 - 4 > 2) {
    return 0;
  }
  else {
    return qword_1002BB1B0[a3 - 4];
  }
}

- (id)lookupTrendsDataWithOptions:(id)a3 events:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count])
  {
    id v24 = 0;
    goto LABEL_24;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v8)
  {
    id v24 = 0;
    goto LABEL_23;
  }
  id v9 = v8;
  id v26 = v6;
  uint64_t v10 = *(void *)v32;
  id v29 = v7;
  do
  {
    v11 = 0;
    id v30 = v9;
    do
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v11);
      double v13 = [v12 trends];

      if (v13)
      {
        double v14 = [v12 trends];
        double v15 = [v14 objectForKeyedSubscript:@"keyword"];
        double v16 = [v5 keyword];
        if ([v15 isEqualToString:v16])
        {
          uint64_t v17 = v10;
          id v18 = [v14 objectForKeyedSubscript:@"aggregationDuration"];
          id v19 = [v18 unsignedLongValue];
          if (v19 == [v5 aggregationDuration])
          {
            v20 = [v14 objectForKeyedSubscript:@"aggregationMethod"];
            v21 = v5;
            id v22 = [v20 unsignedLongValue];
            if (v22 == [v21 aggregationMethod])
            {
              double v23 = [v14 objectForKeyedSubscript:@"valueFunctionType"];
              id v28 = [v23 unsignedLongValue];
              id v27 = [v21 valueFunctionType];

              id v5 = v21;
              uint64_t v10 = v17;
              id v7 = v29;
              id v9 = v30;
              if (v28 == v27)
              {
                id v24 = v12;

                goto LABEL_21;
              }
              goto LABEL_16;
            }

            id v5 = v21;
            id v7 = v29;
          }

          uint64_t v10 = v17;
          id v9 = v30;
        }

LABEL_16:
      }
      v11 = (char *)v11 + 1;
    }
    while (v9 != v11);
    id v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v9);
  id v24 = 0;
LABEL_21:
  id v6 = v26;
LABEL_23:

LABEL_24:

  return v24;
}

- (id)buildAnalyticsPlans
{
  v4 = +[NSDate date];
  id v5 = [v4 startOfDayWithBoundaryOfADay:10800.0];

  id v6 = objc_alloc((Class)NSDateInterval);
  id v7 = [v5 dateByAddingTimeInterval:-2419200.0];
  id v8 = [v5 dateByAddingTimeInterval:-86400.0];
  id v9 = [v6 initWithStartDate:v7 endDate:v8];

  id v10 = objc_alloc((Class)NSDateInterval);
  v11 = [v5 dateByAddingTimeInterval:-86400.0];
  id v12 = [v10 initWithStartDate:v11 endDate:v5];

  double v13 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    double v25 = v22;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ trainDateInterval, %@, testDateInterval, %@", buf, 0x20u);
  }
  double v14 = objc_opt_new();
  double v15 = [[MOTrendsAnalyzerOptions alloc] initWithKeyword:@"workout.duration" category:2 trainDateInterval:v9 testDateInterval:v12 aggregationDuration:1 aggregationMethod:0 valueType:2];
  [v14 addObject:v15];

  double v16 = [[MOTrendsAnalyzerOptions alloc] initWithKeyword:@"work.duration" category:1 trainDateInterval:v9 testDateInterval:v12 aggregationDuration:1 aggregationMethod:0 valueFunction:&__block_literal_global_31];
  [v14 addObject:v16];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_2;
  v23[3] = &unk_1002CF868;
  v23[4] = self;
  uint64_t v17 = objc_retainBlock(v23);
  id v18 = [[MOTrendsAnalyzerOptions alloc] initWithKeyword:@"work.exit" category:1 trainDateInterval:v9 testDateInterval:v12 aggregationDuration:1 aggregationMethod:2 valueFunction:v17];
  [v14 addObject:v18];

  id v19 = [[MOTrendsAnalyzerOptions alloc] initWithKeyword:@"media.playTime" category:4 trainDateInterval:v9 testDateInterval:v12 aggregationDuration:1 aggregationMethod:0 valueFunction:&__block_literal_global_469_0];
  [v14 addObject:v19];

  v20 = [[MOTrendsAnalyzerOptions alloc] initWithKeyword:@"contact.interactions" category:10 trainDateInterval:v9 testDateInterval:v12 aggregationDuration:1 aggregationMethod:0 valueFunction:&__block_literal_global_474];
  [v14 addObject:v20];

  return v14;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke(id a1, MOEvent *a2)
{
  v2 = a2;
  if ((id)[(MOEvent *)v2 placeUserType] == (id)2)
  {
    v3 = [(MOEvent *)v2 endDate];
    v4 = [(MOEvent *)v2 startDate];
    [v3 timeIntervalSinceDate:v4];
    double v6 = v5;
  }
  else
  {
    double v6 = -1.79769313e308;
  }

  return v6;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 placeUserType] != (id)2) {
    goto LABEL_4;
  }
  v4 = [v3 endDate];

  if (!v4
    || (double v5 = *(void **)(a1 + 32),
        [v3 endDate],
        double v6 = objc_claimAutoreleasedReturnValue(),
        [v5 timeOfDay:v6],
        double v8 = v7,
        v6,
        v8 < 0.0))
  {
LABEL_4:
    double v8 = -1.79769313e308;
  }

  return v8;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_3(id a1, MOEvent *a2)
{
  v2 = a2;
  uint64_t v3 = [(MOEvent *)v2 mediaSumTimePlayed];
  if (v3
    && (v4 = (void *)v3,
        [(MOEvent *)v2 mediaSumTimePlayed],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 doubleValue],
        double v7 = v6,
        v5,
        v4,
        v7 > 0.0))
  {
    double v8 = [(MOEvent *)v2 mediaSumTimePlayed];
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = -1.79769313e308;
  }

  return v10;
}

double __39__MOTrendsAnalyzer_buildAnalyticsPlans__block_invoke_4(id a1, MOEvent *a2)
{
  v2 = a2;
  uint64_t v3 = [(MOEvent *)v2 interactions];

  if (!v3) {
    goto LABEL_12;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(MOEvent *)v2 interactions];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5)
  {

LABEL_12:
    double v12 = -1.79769313e308;
    goto LABEL_13;
  }
  id v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v15;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      double v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(*((void *)&v14 + 1) + 8 * i) mechanism]);
      unsigned int v11 = [&off_1002F8F90 containsObject:v10];

      v7 += v11;
    }
    id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v6);

  if (!v7) {
    goto LABEL_12;
  }
  double v12 = (double)v7;
LABEL_13:

  return v12;
}

- (void)analyzeEvents:(id)a3 analyticsPlans:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v18 = (void (**)(id, void *, void *))a5;
  unsigned int v11 = objc_opt_new();
  double v12 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v10;
  id v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v16);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = __57__MOTrendsAnalyzer_analyzeEvents_analyticsPlans_handler___block_invoke;
        v20[3] = &unk_1002CF8D0;
        id v21 = v12;
        uint64_t v22 = v17;
        id v23 = v11;
        SEL v24 = a2;
        [(MOTrendsAnalyzer *)self analyzeEvents:v9 options:v17 resultHandler:v20];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  v18[2](v18, v11, v12);
}

void __57__MOTrendsAnalyzer_analyzeEvents_analyticsPlans_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  unint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v8 = [*(id *)(a1 + 40) keyword];
  [v6 setValue:v7 forKey:v8];

  if (v5) {
    [*(id *)(a1 + 48) addObject:v5];
  }
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    unsigned int v11 = [*(id *)(a1 + 40) keyword];
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138413314;
    id v14 = v10;
    __int16 v15 = 2112;
    long long v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = a3;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ model, %@, options, %@, result, %lu, event, %@", (uint8_t *)&v13, 0x34u);
  }
}

- (double)timeOfDay:(id)a3
{
  if (!a3) {
    return -1.0;
  }
  id v3 = a3;
  id v4 = [v3 hours];
  id v5 = [v3 minutes];

  return (double)((unint64_t)v5 + 60 * (void)v4);
}

- (MOHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sendMetricsForTrendsEvents:(id)a3
{
  id v4 = a3;
  v55 = +[MOMetric binsFromStart:&off_1002F6188 toEnd:&off_1002F98D0 gap:&off_1002F98E0];
  id v5 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v57 = *(void *)v59;
    *(void *)&long long v7 = 138412290;
    long long v54 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v59 != v57) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        unsigned int v11 = [v10 trends:v54];

        if (v11)
        {
          uint64_t v12 = [v10 trends];
          int v13 = [v10 creationDate];
          [v13 timeIntervalSinceReferenceDate];
          id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v5 setObject:v14 forKeyedSubscript:@"creationDate"];

          __int16 v15 = [v10 creationDate];
          long long v16 = [v15 startOfDay];
          [v16 timeIntervalSinceReferenceDate];
          __int16 v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v5 setObject:v17 forKeyedSubscript:@"creationDateStartOfDay"];

          uint64_t v18 = [v12 objectForKeyedSubscript:@"trainEndDate"];
          if (v18)
          {
            __int16 v19 = (void *)v18;
            uint64_t v20 = [v12 objectForKeyedSubscript:@"trainStartDate"];

            if (v20)
            {
              __int16 v21 = [v12 objectForKeyedSubscript:@"trainEndDate"];
              [v21 doubleValue];
              double v23 = v22;
              SEL v24 = [v12 objectForKeyedSubscript:@"trainStartDate"];
              [v24 doubleValue];
              double v26 = v23 - v25;

              long long v27 = +[NSNumber numberWithDouble:v26];
              [(MOTrendsAnalyzer *)self setValue:v27 forKey:@"trainDuration" dictionary:v5 bins:v55];
            }
          }
          uint64_t v28 = [v12 objectForKeyedSubscript:@"testEndDate"];
          if (v28)
          {
            id v29 = (void *)v28;
            id v30 = [v12 objectForKeyedSubscript:@"testStartDate"];

            if (v30)
            {
              long long v31 = [v12 objectForKeyedSubscript:@"testEndDate"];
              [v31 doubleValue];
              double v33 = v32;
              long long v34 = [v12 objectForKeyedSubscript:@"testStartDate"];
              [v34 doubleValue];
              double v36 = v33 - v35;

              id v37 = +[NSNumber numberWithDouble:v36];
              [(MOTrendsAnalyzer *)self setValue:v37 forKey:@"testDuration" dictionary:v5 bins:v55];
            }
          }
          id v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 category]);
          [(MOTrendsAnalyzer *)self setValue:v38 forKey:@"category" dictionary:v5];

          v39 = [v12 objectForKeyedSubscript:@"keyword"];
          [(MOTrendsAnalyzer *)self setValue:v39 forKey:@"keyword" dictionary:v5];

          uint64_t v40 = [v12 objectForKeyedSubscript:@"aggregationDuration"];
          [(MOTrendsAnalyzer *)self setValue:v40 forKey:@"aggregationDuration" dictionary:v5];

          long long v41 = [v12 objectForKeyedSubscript:@"aggregationMethod"];
          [(MOTrendsAnalyzer *)self setValue:v41 forKey:@"aggregationMethod" dictionary:v5];

          long long v42 = [v12 objectForKeyedSubscript:@"valueFunctionType"];
          [(MOTrendsAnalyzer *)self setValue:v42 forKey:@"valueFunctionType" dictionary:v5];

          long long v43 = [v12 objectForKeyedSubscript:@"trainMean"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v43 forKey:@"trainMean" dictionary:v5];

          long long v44 = [v12 objectForKeyedSubscript:@"trainStd"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v44 forKey:@"trainStd" dictionary:v5];

          v45 = [v12 objectForKeyedSubscript:@"trainCount"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v45 forKey:@"trainCount" dictionary:v5];

          __int16 v46 = [v12 objectForKeyedSubscript:@"trainMin"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v46 forKey:@"trainMin" dictionary:v5];

          id v47 = [v12 objectForKeyedSubscript:@"trainMax"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v47 forKey:@"trainMax" dictionary:v5];

          __int16 v48 = [v12 objectForKeyedSubscript:@"testMean"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v48 forKey:@"testMean" dictionary:v5];

          uint64_t v49 = [v12 objectForKeyedSubscript:@"testStd"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v49 forKey:@"testStd" dictionary:v5];

          v50 = [v12 objectForKeyedSubscript:@"testCount"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v50 forKey:@"testCount" dictionary:v5];

          __int16 v51 = [v12 objectForKeyedSubscript:@"testMin"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v51 forKey:@"testMin" dictionary:v5];

          id v52 = [v12 objectForKeyedSubscript:@"testMax"];
          [(MOTrendsAnalyzer *)self setDecimatedValue:v52 forKey:@"testMax" dictionary:v5];

          id v53 = [v12 objectForKeyedSubscript:@"trends"];
          [(MOTrendsAnalyzer *)self setValue:v53 forKey:@"trends" dictionary:v5];

          [(MOTrendsAnalyzer *)self setCommonFields:v5];
          log_analytics_submission(@"com.apple.Moments.trends", v5);
          AnalyticsSendEvent();
        }
        else
        {
          uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v54;
            v63 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Trends information is not available. %@", buf, 0xCu);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v8);
  }
}

- (void)setCommonFields:(id)a3
{
  id v4 = a3;
  id v5 = [(MOTrendsAnalyzer *)self healthKitManager];

  if (v5)
  {
    uint64_t v51 = 0;
    id v52 = &v51;
    uint64_t v53 = 0x3032000000;
    long long v54 = __Block_byref_object_copy__25;
    v55 = __Block_byref_object_dispose__25;
    id v56 = 0;
    uint64_t v45 = 0;
    __int16 v46 = &v45;
    uint64_t v47 = 0x3032000000;
    __int16 v48 = __Block_byref_object_copy__25;
    uint64_t v49 = __Block_byref_object_dispose__25;
    id v50 = 0;
    if (objc_opt_class()
      && (+[MCProfileConnection sharedConnection],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isHealthDataSubmissionAllowed],
          v6,
          v7))
    {
      id v8 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex for CoreAnalytics, with IHA permission", buf, 2u);
      }

      *(void *)buf = 0;
      uint64_t v40 = buf;
      uint64_t v41 = 0x3032000000;
      long long v42 = __Block_byref_object_copy__25;
      long long v43 = __Block_byref_object_dispose__25;
      id v44 = 0;
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      id v10 = [(MOTrendsAnalyzer *)self healthKitManager];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke;
      v35[3] = &unk_1002CCDE8;
      unsigned int v11 = v9;
      double v36 = v11;
      id v37 = &v51;
      id v38 = buf;
      [v10 fetchUserBiologicalSexWithHandler:v35];

      uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/Trends/MOTrendsAnalyzer.m", 719, "-[MOTrendsAnalyzer(Metrics) setCommonFields:]");
      id v34 = 0;
      BOOL v13 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v11, &v34, v12);
      id v26 = v34;
      if (!v13)
      {
        id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          [(MOTripAnnotationManager *)(uint64_t)v12 hometownReferenceLocations];
        }
      }
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x3032000000;
      v32[3] = __Block_byref_object_copy__25;
      v32[4] = __Block_byref_object_dispose__25;
      id v33 = 0;
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      long long v16 = [(MOTrendsAnalyzer *)self healthKitManager];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke_581;
      v28[3] = &unk_1002CCE10;
      __int16 v17 = v15;
      id v29 = v17;
      id v30 = &v45;
      long long v31 = v32;
      [v16 fetchUserAgeWithHandler:v28];

      uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptSource/Trends/MOTrendsAnalyzer.m", 736, "-[MOTrendsAnalyzer(Metrics) setCommonFields:]");
      id v27 = 0;
      BOOL v19 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v17, &v27, v18);
      id v20 = v27;
      if (!v19)
      {
        __int16 v21 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          [(MOTripAnnotationManager *)(uint64_t)v18 hometownReferenceLocations];
        }
      }
      _Block_object_dispose(v32, 8);

      _Block_object_dispose(buf, 8);
      double v22 = +[NSNumber numberWithBool:1];
      [(MOTrendsAnalyzer *)self setValue:v22 forKey:@"IHA_State" dictionary:v4];

      uint64_t v23 = v46[5];
      if (v23) {
        [(MOTrendsAnalyzer *)self setValue:v23 forKey:@"Age" dictionary:v4 bins:&off_1002F8FA8];
      }
      uint64_t v24 = v52[5];
      if (v24) {
        [(MOTrendsAnalyzer *)self setValue:v24 forKey:@"BiologicalSex" dictionary:v4];
      }
    }
    else
    {
      double v25 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Not sending age/biologicalSex to CoreAnalytics, no IHA permission", buf, 2u);
      }
    }
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(&v51, 8);
  }
}

void __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (!v5)
  {
    if (v11)
    {
      uint64_t v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 biologicalSex]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __45__MOTrendsAnalyzer_Metrics__setCommonFields___block_invoke_581(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v9) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setValue:(id)a3 forKey:(id)a4 dictionary:(id)a5
{
  if (a3)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = [a3 copy];
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4 dictionary:(id)a5 bins:(id)a6
{
  if (a3)
  {
    id v9 = a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = [v12 copy];
    [v10 setObject:v13 forKeyedSubscript:v11];

    id v15 = +[MOMetric binForNumber:v12 bins:v9];

    id v14 = [v11 stringByAppendingString:@"_Bucketed"];

    [v10 setObject:v15 forKeyedSubscript:v14];
  }
}

- (void)setDecimatedValue:(id)a3 forKey:(id)a4 dictionary:(id)a5
{
  if (a3)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    [v9 doubleValue];
    double v11 = v10;
    double v12 = -v10;
    if (v11 >= 0.0) {
      long double v13 = v11;
    }
    else {
      long double v13 = v12;
    }
    unint64_t v14 = vcvtmd_s64_f64(log10(v13));
    double v15 = round(__exp10((double)(uint64_t)(1 - v14)) * v13);
    if (v11 >= 0.0) {
      double v16 = v15;
    }
    else {
      double v16 = -v15;
    }
    id v17 = [v9 copy];

    [v7 setObject:v17 forKeyedSubscript:v8];
    uint64_t v18 = +[NSNumber numberWithInteger:v14];
    BOOL v19 = [v8 stringByAppendingString:@"_Scale"];
    [v7 setObject:v18 forKeyedSubscript:v19];

    id v21 = +[NSNumber numberWithDouble:v16];
    id v20 = [v8 stringByAppendingString:@"_SignificantValue"];

    [v7 setObject:v21 forKeyedSubscript:v20];
  }
}

- (void)analyzeEvents:(const char *)a1 options:(void *)a2 resultHandler:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  id v5 = NSStringFromSelector(a1);
  id v6 = [a2 keyword];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  double v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ keyword, %@, MOTrendsAnalyzerResultInsufficientData", (uint8_t *)&v7, 0x16u);
}

@end