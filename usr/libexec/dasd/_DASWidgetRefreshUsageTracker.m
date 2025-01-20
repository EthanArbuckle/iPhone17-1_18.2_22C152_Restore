@interface _DASWidgetRefreshUsageTracker
+ (id)sharedInstance;
- (NSDate)computedBudgetDate;
- (NSMutableDictionary)dailyComputedBudgetsForAllWidgets;
- (NSMutableDictionary)trackingWidgets;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDLocalContext)context;
- (_DASWidgetRefreshUsageTracker)init;
- (double)stopTrackingActivity:(id)a3;
- (double)sumOfValuesOfDictionary:(id)a3;
- (id)allocatedBudgetsWithAverageViews:(id)a3 groupTotalBudget:(int)a4 individualMaxBudgets:(id)a5 individualMinBudget:(int)a6;
- (id)dailyBudgetForWidget:(id)a3;
- (id)dailyBudgetsForAllWidgets;
- (id)getAverageWidgetViewsPerDayWithStore:(id)a3;
- (int)allocateBudgetForViewsCurve:(int)a3;
- (unsigned)maxWidgetRefreshBudgetForIndividualDaily;
- (unsigned)maxWidgetRefreshBudgetForSystemDaily;
- (void)computeBudgetFromHistoryForAllWidgets;
- (void)flushComputedBudgetCache;
- (void)invalidateComputedBudgetCache;
- (void)setComputedBudgetDate:(id)a3;
- (void)setContext:(id)a3;
- (void)setDailyComputedBudgetsForAllWidgets:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTrackingWidgets:(id)a3;
- (void)startTrackingActivity:(id)a3;
@end

@implementation _DASWidgetRefreshUsageTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028A04;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3B58 != -1) {
    dispatch_once(&qword_1001C3B58, block);
  }
  v2 = (void *)qword_1001C3B60;

  return v2;
}

- (_DASWidgetRefreshUsageTracker)init
{
  v18.receiver = self;
  v18.super_class = (Class)_DASWidgetRefreshUsageTracker;
  v2 = [(_DASWidgetRefreshUsageTracker *)&v18 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "widgetRefresh");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    trackingWidgets = v2->_trackingWidgets;
    v2->_trackingWidgets = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dailyComputedBudgetsForAllWidgets = v2->_dailyComputedBudgetsForAllWidgets;
    v2->_dailyComputedBudgetsForAllWidgets = v7;

    uint64_t v9 = +[NSDate distantPast];
    computedBudgetDate = v2->_computedBudgetDate;
    v2->_computedBudgetDate = (NSDate *)v9;

    uint64_t v11 = +[_CDClientContext userContext];
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.dasd.computeWidgetBudgets", v14);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v15;
  }
  return v2;
}

- (id)dailyBudgetForWidget:(id)a3
{
  id v4 = a3;
  [(_DASWidgetRefreshUsageTracker *)self computeBudgetFromHistoryForAllWidgets];
  v5 = [(NSMutableDictionary *)self->_dailyComputedBudgetsForAllWidgets objectForKey:v4];

  return v5;
}

- (id)dailyBudgetsForAllWidgets
{
  [(_DASWidgetRefreshUsageTracker *)self computeBudgetFromHistoryForAllWidgets];
  os_log_t v3 = [(NSMutableDictionary *)self->_dailyComputedBudgetsForAllWidgets allKeys];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = -[_DASWidgetRefreshUsageTracker dailyBudgetForWidget:](self, "dailyBudgetForWidget:", v10, (void)v13);
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)computeBudgetFromHistoryForAllWidgets
{
  os_log_t v3 = +[NSDate now];
  [v3 timeIntervalSinceDate:self->_computedBudgetDate];
  double v5 = v4;

  if (v5 > 60.0)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = sub_100028E40;
    v12 = sub_100028E50;
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100028E58;
    v7[3] = &unk_1001758F8;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(queue, v7);
    objc_storeStrong((id *)&self->_dailyComputedBudgetsForAllWidgets, (id)v9[5]);
    _Block_object_dispose(&v8, 8);
  }
}

- (void)invalidateComputedBudgetCache
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002934C;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)flushComputedBudgetCache
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002940C;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)getAverageWidgetViewsPerDayWithStore:(id)a3
{
  id v48 = a3;
  id v62 = objc_alloc_init((Class)NSMutableDictionary);
  v61 = +[NSDate now];
  os_log_t v3 = [v61 dateByAddingTimeInterval:-604800.0];
  uint64_t v4 = [v3 dateByAddingTimeInterval:86400.0];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  int v7 = 0;
  uint64_t v47 = kDASWidgetViewStreamName;
  do
  {
    int v55 = v7;
    uint64_t v8 = +[_DKEventStream eventStreamWithName:v47];
    id obj = v3;
    v59 = (void *)v4;
    uint64_t v9 = +[_DKQuery predicateForEventsWithStartAndEndInDateRangeFrom:v3 to:v4];
    v52 = (void *)v8;
    uint64_t v82 = v8;
    uint64_t v10 = +[NSArray arrayWithObjects:&v82 count:1];
    uint64_t v11 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
    v81 = v11;
    v12 = +[NSArray arrayWithObjects:&v81 count:1];
    v51 = (void *)v9;
    id v13 = +[_DKEventQuery eventQueryWithPredicate:v9 eventStreams:v10 offset:0 limit:5000 sortDescriptors:v12];

    [v13 setReadMetadata:0];
    id v72 = 0;
    long long v14 = [v48 executeQuery:v13 error:&v72];
    id v15 = v72;
    if (v15)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v78 = v13;
        __int16 v79 = 2112;
        id v80 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Query for widget views %@ failed with error %@", buf, 0x16u);
      }
    }
    v49 = v15;
    v50 = v13;
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3C34(v75, v17, v14, &v76);
    }
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v18 = v14;
    id v19 = [v18 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v69;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v69 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v24 = [v23 stringValue];
          v25 = [v5 valueForKey:v24];

          if (!v25)
          {
            v26 = [v23 startDate];
            [v5 setObject:v26 forKeyedSubscript:v24];
          }
          v27 = [v6 valueForKey:v24];

          if (v27)
          {
            v28 = [v6 objectForKeyedSubscript:v24];
            v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 intValue] + 1);
            [v6 setObject:v29 forKeyedSubscript:v24];
          }
          else
          {
            [v6 setObject:&off_100186B20 forKeyedSubscript:v24];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v68 objects:v74 count:16];
      }
      while (v20);
    }

    uint64_t v30 = [obj dateByAddingTimeInterval:86400.0];

    uint64_t v31 = [v59 dateByAddingTimeInterval:86400.0];

    int v7 = v55 + 1;
    os_log_t v3 = (void *)v30;
    uint64_t v4 = v31;
  }
  while (v55 != 6);
  contexta = (void *)v31;
  v56 = (void *)v30;
  [v6 allKeys];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  id v32 = [obja countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v60 = *(void *)v65;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v65 != v60) {
          objc_enumerationMutation(obja);
        }
        v35 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
        v37 = [v5 objectForKeyedSubscript:v35];
        [v37 timeIntervalSinceDate:v61];
        double v39 = v38;

        v40 = [v6 objectForKeyedSubscript:v35];
        v41 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)[v40 intValue] / (int)vcvtpd_s64_f64(v39 / -86400.0)));
        [v62 setObject:v41 forKeyedSubscript:v35];

        v42 = self->_log;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = v42;
          v44 = [v6 objectForKeyedSubscript:v35];
          *(_DWORD *)buf = 138412546;
          id v78 = v35;
          __int16 v79 = 2112;
          id v80 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "widget: %@ - view count: %@", buf, 0x16u);
        }
      }
      id v33 = [obja countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v33);
  }

  v45 = self->_log;
  if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v78 = v62;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v45, OS_LOG_TYPE_INFO, "Average views %@", buf, 0xCu);
  }

  return v62;
}

- (int)allocateBudgetForViewsCurve:(int)a3
{
  if (a3 >= 0x1F) {
    return (int)((double)a3 + -59.2305146 + 30.0);
  }
  else {
    return a3;
  }
}

- (id)allocatedBudgetsWithAverageViews:(id)a3 groupTotalBudget:(int)a4 individualMaxBudgets:(id)a5 individualMinBudget:(int)a6
{
  id v9 = a3;
  id v43 = a5;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v42 = v9;
  [v9 allKeys];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v49;
    double v14 = 0.0;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        v17 = [v42 objectForKeyedSubscript:v16];
        id v18 = [v17 intValue];

        id v19 = [v43 objectForKeyedSubscript:v16];
        signed int v20 = [v19 intValue];

        int v21 = [(_DASWidgetRefreshUsageTracker *)self allocateBudgetForViewsCurve:v18];
        if (v21 >= v20) {
          int v22 = v20;
        }
        else {
          int v22 = v21;
        }
        if (v22 <= a6) {
          uint64_t v23 = a6;
        }
        else {
          uint64_t v23 = v22;
        }
        v24 = +[NSNumber numberWithInt:v23];
        [v10 setObject:v24 forKeyedSubscript:v16];

        double v14 = v14 + (double)v21;
      }
      id v12 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v12);
  }
  else
  {
    double v14 = 0.0;
  }
  if (v14 > (double)a4)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v25 = obj;
    id v26 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v45;
      double v29 = (double)a4 / v14;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
          id v32 = [v10 objectForKeyedSubscript:v31];
          [v32 doubleValue];
          double v34 = v33;

          v35 = [v43 objectForKeyedSubscript:v31];
          int v36 = [v35 intValue];

          if (v34 <= (double)v36) {
            double v37 = 1.0;
          }
          else {
            double v37 = v29;
          }
          double v38 = +[NSNumber numberWithDouble:round(v34 * v37)];
          [v10 setObject:v38 forKeyedSubscript:v31];
        }
        id v27 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v27);
    }
  }

  return v10;
}

- (void)startTrackingActivity:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 widgetBudgetID];

  if (v4)
  {
    trackingWidgets = self->_trackingWidgets;
    id v6 = [v7 widgetBudgetID];
    [(NSMutableDictionary *)trackingWidgets setObject:&off_100186B20 forKeyedSubscript:v6];
  }
}

- (double)stopTrackingActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 widgetBudgetID];

  double v6 = 0.0;
  if (v5)
  {
    trackingWidgets = self->_trackingWidgets;
    uint64_t v8 = [v4 widgetBudgetID];
    id v9 = [(NSMutableDictionary *)trackingWidgets objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = self->_trackingWidgets;
      id v11 = [v4 widgetBudgetID];
      [(NSMutableDictionary *)v10 removeObjectForKey:v11];

      double v6 = 1.0;
    }
  }

  return v6;
}

- (double)sumOfValuesOfDictionary:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = [v3 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v9 doubleValue];
        double v7 = v7 + v10;
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (unsigned)maxWidgetRefreshBudgetForSystemDaily
{
  return self->_maxWidgetRefreshBudgetForSystemDaily;
}

- (unsigned)maxWidgetRefreshBudgetForIndividualDaily
{
  return self->_maxWidgetRefreshBudgetForIndividualDaily;
}

- (NSMutableDictionary)trackingWidgets
{
  return self->_trackingWidgets;
}

- (void)setTrackingWidgets:(id)a3
{
}

- (NSMutableDictionary)dailyComputedBudgetsForAllWidgets
{
  return self->_dailyComputedBudgetsForAllWidgets;
}

- (void)setDailyComputedBudgetsForAllWidgets:(id)a3
{
}

- (NSDate)computedBudgetDate
{
  return self->_computedBudgetDate;
}

- (void)setComputedBudgetDate:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_computedBudgetDate, 0);
  objc_storeStrong((id *)&self->_dailyComputedBudgetsForAllWidgets, 0);

  objc_storeStrong((id *)&self->_trackingWidgets, 0);
}

@end