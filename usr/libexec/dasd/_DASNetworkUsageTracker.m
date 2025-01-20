@interface _DASNetworkUsageTracker
+ (BOOL)shouldTrackActivity:(id)a3;
+ (id)sharedInstance;
- (CTCarrierSpaceClient)carrierSpaceClient;
- (NSMutableDictionary)activityToDataMap;
- (NSMutableSet)startedActivites;
- (OS_os_log)log;
- (UsageFeed)symptomsFeed;
- (_DASBudgetModulator)modulator;
- (_DASNetworkUsageTracker)init;
- (double)dailyBudget;
- (double)dailyDataBudgetFromPlan:(id)a3 error:(id)a4;
- (double)getDataConsumedFromBytesOnCell:(double)result bytesOnCellExpensive:(double)a4 bytesOnCellInexpensive:(double)a5 bytesOnWiFiExpensive:(double)a6;
- (double)stopTrackingActivity:(id)a3;
- (double)updateDataForActivity:(id)a3 bytesOnCell:(double)a4 bytesOnCellExpensive:(double)a5 bytesOnCellInexpensive:(double)a6 bytesOnWiFiExpensive:(double)a7 bytesOnWiFiInexpensive:(double)a8;
- (os_unfair_lock_s)lock;
- (void)dataPlanMetricsDidChange;
- (void)setActivityToDataMap:(id)a3;
- (void)setCarrierSpaceClient:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setModulator:(id)a3;
- (void)setStartedActivites:(id)a3;
- (void)setSymptomsFeed:(id)a3;
- (void)startTrackingActivity:(id)a3;
@end

@implementation _DASNetworkUsageTracker

- (_DASNetworkUsageTracker)init
{
  v18.receiver = self;
  v18.super_class = (Class)_DASNetworkUsageTracker;
  id v2 = [(_DASNetworkUsageTracker *)&v18 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "networkbudgeting");
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    uint64_t v5 = +[NSMutableSet set];
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    *((_DWORD *)v2 + 2) = 0;
    uint64_t v7 = +[NSMutableDictionary dictionary];
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    id v9 = objc_alloc((Class)AnalyticsWorkspace);
    id v10 = [v9 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
    if (!v10 && os_log_type_enabled(*((os_log_t *)v2 + 3), OS_LOG_TYPE_ERROR)) {
      sub_1000F36F0();
    }
    id v11 = [objc_alloc((Class)UsageFeed) initWithWorkspace:v10];
    v12 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v11;

    if (!*((void *)v2 + 6) && os_log_type_enabled(*((os_log_t *)v2 + 3), OS_LOG_TYPE_ERROR)) {
      sub_1000F36BC();
    }
    id v13 = objc_alloc((Class)CTCarrierSpaceClient);
    v14 = dispatch_get_global_queue(-32768, 0);
    id v15 = [v13 initWithQueue:v14];
    v16 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v15;

    [*((id *)v2 + 7) setDelegate:v2];
  }
  return (_DASNetworkUsageTracker *)v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025880;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3B20 != -1) {
    dispatch_once(&qword_1001C3B20, block);
  }
  id v2 = (void *)qword_1001C3B28;

  return v2;
}

- (void)dataPlanMetricsDidChange
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Carrier data may have changed", v4, 2u);
  }
  [(_DASNetworkUsageTracker *)self dailyBudget];
  -[_DASBudgetModulator updateCapacity:forBudgetWithName:](self->_modulator, "updateCapacity:forBudgetWithName:", @"com.apple.dasd.systemCellular");
}

- (double)dailyDataBudgetFromPlan:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    log = self->_log;
    double v14 = -1.0;
    if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v22 = 138412290;
    v23 = v8;
    v17 = "Error trying to obtain data plan metrics: %@";
    objc_super v18 = log;
    uint32_t v19 = 12;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
    goto LABEL_15;
  }
  id v9 = [v6 domestic];

  if (!v9)
  {
    v20 = self->_log;
    double v14 = -1.0;
    if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LOWORD(v22) = 0;
    v17 = "No capacity returned. Using default";
    objc_super v18 = v20;
    uint32_t v19 = 2;
    goto LABEL_14;
  }
  id v10 = [v6 domestic];
  id v11 = [v10 capacityBytes];

  [v11 doubleValue];
  double v13 = v12 / 100.0;
  if (v13 <= 1073741820.0) {
    double v14 = v13;
  }
  else {
    double v14 = 1073741820.0;
  }
  id v15 = self->_log;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543618;
    v23 = v11;
    __int16 v24 = 2048;
    double v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Data plan budget is for %{public}@ bytes. Discretionary budget is now %lf bytes", (uint8_t *)&v22, 0x16u);
  }

LABEL_15:
  return v14;
}

- (double)dailyBudget
{
  uint64_t v12 = 0;
  double v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  unint64_t v15 = 0xBFF0000000000000;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  carrierSpaceClient = self->_carrierSpaceClient;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100025C44;
  v9[3] = &unk_100175860;
  id v11 = &v12;
  v9[4] = self;
  uint64_t v5 = v3;
  id v10 = v5;
  [(CTCarrierSpaceClient *)carrierSpaceClient fetchDataPlanMetrics:v9];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  if (v13[3] >= 0.0) {
    double v7 = v13[3];
  }
  else {
    double v7 = 52428800.0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 clientDataBudgetName];
  if (!v5)
  {
    id v7 = [v4 schedulingPriority];
    unint64_t v8 = _DASSchedulingPriorityUserInitiated;
    if ((unint64_t)v7 < _DASSchedulingPriorityUserInitiated)
    {
      id v9 = [v4 widgetID];
      if (v9)
      {
        BOOL v6 = 1;
        goto LABEL_20;
      }
    }
    if (([v4 budgeted] & 1) != 0 || objc_msgSend(v4, "dataBudgeted"))
    {
      unsigned int v10 = [v4 requiresNetwork];
      if (v10)
      {
        dispatch_semaphore_t v3 = [v4 userInfo];
        id v11 = [v3 objectForKeyedSubscript:kNWEndpointKey];
        if (v11)
        {

          BOOL v6 = 1;
LABEL_18:
          if ((unint64_t)v7 >= v8) {
            goto LABEL_21;
          }
          id v9 = 0;
LABEL_20:

          goto LABEL_21;
        }
        if (([v4 requestsApplicationLaunch] & 1) == 0)
        {
          BOOL v6 = 0;
LABEL_17:

          goto LABEL_18;
        }
LABEL_14:
        uint64_t v12 = [v4 relatedApplications];
        BOOL v6 = [v12 count] != 0;

        if (!v10) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      if ([v4 requestsApplicationLaunch]) {
        goto LABEL_14;
      }
    }
    BOOL v6 = 0;
    goto LABEL_18;
  }
  BOOL v6 = 1;
LABEL_21:

  return v6;
}

- (void)startTrackingActivity:(id)a3
{
  id v5 = a3;
  if (+[_DASNetworkUsageTracker shouldTrackActivity:v5])
  {
    os_unfair_lock_lock(&self->_lock);
    startedActivites = self->_startedActivites;
    id v7 = [v5 name];
    [(NSMutableSet *)startedActivites addObject:v7];

    os_unfair_lock_unlock(&self->_lock);
    unint64_t v8 = [v5 clientDataBudgetName];
    if (v8) {
      goto LABEL_3;
    }
    unint64_t v8 = [v5 relatedApplications];
    if (![v8 count])
    {
LABEL_34:

      goto LABEL_35;
    }
    if ([v5 requestsApplicationLaunch])
    {
LABEL_3:
    }
    else
    {
      unsigned int v10 = [v5 widgetID];

      if (!v10) {
        goto LABEL_35;
      }
    }
    os_unfair_lock_lock(&self->_lock);
    unint64_t v8 = [(NSMutableDictionary *)self->_activityToDataMap objectForKeyedSubscript:v5];
    if (!v8)
    {
      unint64_t v8 = +[NSMutableDictionary dictionary];
      [(NSMutableDictionary *)self->_activityToDataMap setObject:v8 forKeyedSubscript:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
    if ([v5 pid])
    {
      id v9 = +[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", [v5 pid]);
    }
    else
    {
      id v9 = 0;
    }
    unsigned __int8 v11 = [v5 requestsApplicationLaunch];
    if ((v11 & 1) != 0 || ([v5 widgetID], (dispatch_semaphore_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [v5 relatedApplications];
      double v13 = +[NSSet setWithArray:v12];

      if (v11)
      {
        if (!v13) {
          goto LABEL_33;
        }
        goto LABEL_23;
      }
    }
    else
    {
      if (v9)
      {
        double v13 = +[NSSet setWithObject:v9];
      }
      else
      {
        double v13 = 0;
      }
      dispatch_semaphore_t v3 = 0;
    }

    if (!v13)
    {
LABEL_33:

      goto LABEL_34;
    }
LABEL_23:
    if ([v5 requestsApplicationLaunch])
    {
      id v14 = kUsageProcessBundleName;
    }
    else
    {
      unint64_t v15 = [v5 widgetID];
      v16 = (id *)&kUsageProcessBundleName;
      if (!v15) {
        v16 = (id *)&kUsageProcessProcName;
      }
      id v14 = *v16;
    }
    uint64_t v26 = kSymptomAnalyticsServiceRefreshUsage;
    v27 = &__kCFBooleanTrue;
    v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000261D0;
    v22[3] = &unk_100175888;
    v22[4] = self;
    id v23 = v8;
    id v24 = v5;
    uint32_t v19 = v18;
    double v25 = v19;
    v20 = objc_retainBlock(v22);
    if ([(UsageFeed *)self->_symptomsFeed usageToDateWithOptionsFor:v13 nameKind:v14 options:v17 reply:v20])
    {
      dispatch_time_t v21 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v19, v21);
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000F3724();
    }

    goto LABEL_33;
  }
LABEL_35:
}

- (double)stopTrackingActivity:(id)a3
{
  id v4 = a3;
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  if (!+[_DASNetworkUsageTracker shouldTrackActivity:v4])goto LABEL_10; {
  p_lock = &self->_lock;
  }
  os_unfair_lock_lock(&self->_lock);
  startedActivites = self->_startedActivites;
  id v7 = [v4 name];
  LODWORD(startedActivites) = [(NSMutableSet *)startedActivites containsObject:v7];

  if (!startedActivites)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000F3800();
    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_10;
  }
  unint64_t v8 = self->_startedActivites;
  id v9 = [v4 name];
  [(NSMutableSet *)v8 removeObject:v9];

  os_unfair_lock_unlock(&self->_lock);
  unsigned int v10 = [v4 clientDataBudgetName];
  if (v10)
  {
LABEL_4:

    goto LABEL_5;
  }
  unsigned int v10 = [v4 relatedApplications];
  if (![(__objc2_class *)v10 count])
  {

    goto LABEL_10;
  }
  if ([v4 requestsApplicationLaunch]) {
    goto LABEL_4;
  }
  uint64_t v12 = [v4 widgetID];
  BOOL v13 = v12 == 0;

  if (v13)
  {
LABEL_10:
    double v11 = v44[3];
    goto LABEL_43;
  }
LABEL_5:
  if ([v4 pid])
  {
    unsigned int v10 = _DASUtils;
    v38 = +[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", [v4 pid]);
  }
  else
  {
    v38 = 0;
  }
  unsigned __int8 v14 = [v4 requestsApplicationLaunch];
  if ((v14 & 1) != 0
    || ([v4 widgetID], (unsigned int v10 = (__objc2_class *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v15 = [v4 relatedApplications];
    v16 = +[NSSet setWithArray:v15];

    if (v14) {
      goto LABEL_26;
    }
  }
  else
  {
    if (v38)
    {
      v16 = +[NSSet setWithObject:](NSSet, "setWithObject:");
    }
    else
    {
      v16 = 0;
    }
    unsigned int v10 = 0;
  }

LABEL_26:
  if (v16)
  {
    if ([v4 requestsApplicationLaunch])
    {
      id v17 = kUsageProcessBundleName;
    }
    else
    {
      uint32_t v19 = [v4 widgetID];
      v20 = (id *)&kUsageProcessBundleName;
      if (!v19) {
        v20 = (id *)&kUsageProcessProcName;
      }
      id v17 = *v20;
    }
    uint64_t v53 = kSymptomAnalyticsServiceRefreshUsage;
    v54 = &__kCFBooleanTrue;
    v36 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100026A50;
    v39[3] = &unk_1001758B0;
    v39[4] = self;
    id v22 = v4;
    id v40 = v22;
    v42 = &v43;
    dispatch_semaphore_t dsema = v21;
    dispatch_semaphore_t v41 = dsema;
    v37 = objc_retainBlock(v39);
    if ([(UsageFeed *)self->_symptomsFeed usageToDateWithOptionsFor:v16 nameKind:v17 options:v36 reply:v37])
    {
      dispatch_time_t v23 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(dsema, v23);
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000F37CC();
    }
    id v24 = [v22 widgetID];

    if (v24)
    {
      double v25 = [v22 relatedApplications];
      uint64_t v26 = [v25 firstObject];
      v27 = +[NSString stringWithFormat:@"com.apple.dasd.bytes.widgets.%@", v26];

      v52[0] = @"com.apple.dasd.bytes.widgets";
      v52[1] = v27;
      v28 = +[NSArray arrayWithObjects:v52 count:2];
      v29 = +[NSNumber numberWithDouble:v44[3]];
      v51[0] = v29;
      v30 = +[NSNumber numberWithDouble:v44[3]];
      v51[1] = v30;
      v31 = +[NSArray arrayWithObjects:v51 count:2];
      +[_DASMetricRecorder incrementOccurrencesForKeys:v28 byCounts:v31];
    }
    v32 = self->_log;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = +[NSNumber numberWithDouble:v44[3]];
      *(_DWORD *)buf = 138412546;
      id v48 = v22;
      __int16 v49 = 2112;
      v50 = v33;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Data consumed for %@: %@", buf, 0x16u);
    }
    double v11 = v44[3];
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    dispatch_semaphore_t v18 = [(_DASNetworkUsageTracker *)self activityToDataMap];
    [v18 removeObjectForKey:v4];

    os_unfair_lock_unlock(p_lock);
    double v11 = 0.0;
  }

LABEL_43:
  _Block_object_dispose(&v43, 8);

  return v11;
}

- (double)getDataConsumedFromBytesOnCell:(double)result bytesOnCellExpensive:(double)a4 bytesOnCellInexpensive:(double)a5 bytesOnWiFiExpensive:(double)a6
{
  double v6 = a4 + a5 + a6;
  double v7 = a5 * 0.05 + a4 + a6;
  if (v6 != 0.0) {
    return v7;
  }
  return result;
}

- (double)updateDataForActivity:(id)a3 bytesOnCell:(double)a4 bytesOnCellExpensive:(double)a5 bytesOnCellInexpensive:(double)a6 bytesOnWiFiExpensive:(double)a7 bytesOnWiFiInexpensive:(double)a8
{
  id v14 = a3;
  unsigned int v15 = +[_DASPhotosPolicy isiCPLActivity:v14];
  v16 = [v14 relatedApplications];
  id v17 = [v16 sortedArrayUsingSelector:"compare:"];
  dispatch_semaphore_t v18 = [v17 firstObject];

  id v19 = [v14 schedulingPriority];
  if ((unint64_t)v19 <= _DASSchedulingPriorityDefault) {
    CFStringRef v20 = @"disc";
  }
  else {
    CFStringRef v20 = @"non-disc";
  }
  dispatch_semaphore_t v21 = +[NSString stringWithFormat:@"com.apple.dasd.bytes.%@.%@.cell", v18, v20];
  id v22 = [v14 schedulingPriority];
  if ((unint64_t)v22 <= _DASSchedulingPriorityDefault) {
    CFStringRef v23 = @"disc";
  }
  else {
    CFStringRef v23 = @"non-disc";
  }
  uint64_t v24 = +[NSString stringWithFormat:@"com.apple.dasd.bytes.%@.%@.wifi", v18, v23];
  double v25 = (void *)v24;
  if (a5 + a6 + a7 + a8 > 0.0)
  {
    v88[0] = v24;
    v88[1] = v21;
    uint64_t v26 = +[NSArray arrayWithObjects:v88 count:2];
    id v27 = v14;
    unsigned int v28 = v15;
    v29 = v18;
    v30 = self;
    v31 = v25;
    v32 = v21;
    v33 = +[NSNumber numberWithDouble:a7 + a8];
    v87[0] = v33;
    v34 = +[NSNumber numberWithDouble:a5 + a6];
    v87[1] = v34;
    v35 = +[NSArray arrayWithObjects:v87 count:2];
    +[_DASMetricRecorder incrementOccurrencesForKeys:v26 byCounts:v35];

    dispatch_semaphore_t v21 = v32;
    double v25 = v31;
    self = v30;
    dispatch_semaphore_t v18 = v29;
    unsigned int v15 = v28;
    id v14 = v27;
  }
  if (v15)
  {
    v36 = self->_log;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v72 = v25;
      v37 = v21;
      v38 = v36;
      v39 = +[NSNumber numberWithDouble:a5];
      id v40 = +[NSNumber numberWithDouble:a6];
      dispatch_semaphore_t v41 = +[NSNumber numberWithDouble:a7];
      v42 = +[NSNumber numberWithDouble:a8];
      uint64_t v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 schedulingPriority]);
      *(_DWORD *)buf = 138544386;
      v76 = v39;
      __int16 v77 = 2114;
      v78 = v40;
      __int16 v79 = 2114;
      v80 = v41;
      __int16 v81 = 2114;
      v82 = v42;
      __int16 v83 = 2114;
      v84 = v43;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Cell Expensive Bytes: %{public}@, Cell Inexpensive Bytes: %{public}@, WiFi Expensive Bytes: %{public}@, WiFi Inexpensive Bytes: %{public}@, Priority: %{public}@, Applications: com.apple.mobileslideshow", buf, 0x34u);

      dispatch_semaphore_t v21 = v37;
      double v25 = v72;
    }
  }
  else
  {
    v44 = [v14 relatedApplications];
    id v45 = [v44 count];

    uint64_t v46 = self->_log;
    BOOL v47 = os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT);
    if (v45 == (id)1)
    {
      if (v47)
      {
        log = v46;
        v67 = +[NSNumber numberWithDouble:a5];
        id v48 = +[NSNumber numberWithDouble:a6];
        __int16 v49 = +[NSNumber numberWithDouble:a7];
        +[NSNumber numberWithDouble:a8];
        v70 = v21;
        v50 = v73 = v25;
        v51 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 schedulingPriority]);
        v52 = [v14 relatedApplications];
        uint64_t v53 = [v52 firstObject];
        *(_DWORD *)buf = 138544642;
        v76 = v67;
        __int16 v77 = 2114;
        v78 = v48;
        __int16 v79 = 2114;
        v80 = v49;
        __int16 v81 = 2114;
        v82 = v50;
        __int16 v83 = 2114;
        v84 = v51;
        __int16 v85 = 2112;
        v86 = v53;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Cell Expensive Bytes: %{public}@, Cell Inexpensive Bytes: %{public}@, WiFi Expensive Bytes: %{public}@, WiFi Inexpensive Bytes: %{public}@, Priority: %{public}@, Applications: %@", buf, 0x3Eu);

        dispatch_semaphore_t v21 = v70;
        double v25 = v73;
      }
    }
    else if (v47)
    {
      loga = v46;
      v71 = +[NSNumber numberWithDouble:a5];
      v54 = +[NSNumber numberWithDouble:a6];
      v55 = +[NSNumber numberWithDouble:a7];
      +[NSNumber numberWithDouble:a8];
      v74 = v25;
      v57 = v56 = v21;
      v58 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 schedulingPriority]);
      v59 = [v14 relatedApplications];
      *(_DWORD *)buf = 138544642;
      v76 = v71;
      __int16 v77 = 2114;
      v78 = v54;
      __int16 v79 = 2114;
      v80 = v55;
      __int16 v81 = 2114;
      v82 = v57;
      __int16 v83 = 2114;
      v84 = v58;
      __int16 v85 = 2112;
      v86 = v59;
      _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "Cell Expensive Bytes: %{public}@, Cell Inexpensive Bytes: %{public}@, WiFi Expensive Bytes: %{public}@, WiFi Inexpensive Bytes: %{public}@, Priority: %{public}@, Applications: %@", buf, 0x3Eu);

      dispatch_semaphore_t v21 = v56;
      double v25 = v74;
    }
  }
  double v60 = 0.0;
  if (+[_DASNetworkUsageTracker shouldTrackActivity:v14])
  {
    os_unfair_lock_lock(&self->_lock);
    startedActivites = self->_startedActivites;
    v62 = [v14 name];
    LOBYTE(startedActivites) = [(NSMutableSet *)startedActivites containsObject:v62];

    if ((startedActivites & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000F38E8();
      }
      v63 = self->_startedActivites;
      v64 = [v14 name];
      [(NSMutableSet *)v63 addObject:v64];
    }
    os_unfair_lock_unlock(&self->_lock);
    [(_DASNetworkUsageTracker *)self getDataConsumedFromBytesOnCell:a4 bytesOnCellExpensive:a5 bytesOnCellInexpensive:a6 bytesOnWiFiExpensive:a7];
    double v60 = v65;
  }

  return v60;
}

- (_DASBudgetModulator)modulator
{
  return (_DASBudgetModulator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModulator:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableSet)startedActivites
{
  return self->_startedActivites;
}

- (void)setStartedActivites:(id)a3
{
}

- (NSMutableDictionary)activityToDataMap
{
  return self->_activityToDataMap;
}

- (void)setActivityToDataMap:(id)a3
{
}

- (UsageFeed)symptomsFeed
{
  return self->_symptomsFeed;
}

- (void)setSymptomsFeed:(id)a3
{
}

- (CTCarrierSpaceClient)carrierSpaceClient
{
  return self->_carrierSpaceClient;
}

- (void)setCarrierSpaceClient:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, 0);
  objc_storeStrong((id *)&self->_symptomsFeed, 0);
  objc_storeStrong((id *)&self->_activityToDataMap, 0);
  objc_storeStrong((id *)&self->_startedActivites, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_modulator, 0);
}

@end