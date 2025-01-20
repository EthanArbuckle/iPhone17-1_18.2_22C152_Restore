@interface _DASActivityProfiler
+ (id)sharedProfiler;
- (BOOL)errorCheck:(unint64_t)a3 withError:(int)a4 onActivity:(id)a5;
- (BOOL)isProfilingDelayedForActivity:(id)a3;
- (BOOL)shouldProfileActivity:(id)a3;
- (NSArray)mediaanalysisActivities;
- (NSMutableDictionary)activityToProfile;
- (NSMutableDictionary)activityToProfilerStartDates;
- (NSMutableDictionary)activityToSession;
- (NSMutableDictionary)activityToSnapshot;
- (UsageFeed)symptomsFeed;
- (_DASActivityProfiler)init;
- (_DASBatchingQueue)writeQueue;
- (_DASBatteryTemperatureRecorder)batteryTemperatureRecorder;
- (id)startRecordingNetworkTransfer:(id)a3;
- (id)stopRecordingNetworkTransfer:(id)a3;
- (int)pidToken;
- (os_unfair_lock_s)lock;
- (void)endProfilingForActivity:(id)a3 completed:(BOOL)a4 withState:(id)a5;
- (void)lockedEndProfilingForActivity:(id)a3 completed:(BOOL)a4 withState:(id)a5;
- (void)lockedStartProfilingForActivity:(id)a3 withState:(id)a4;
- (void)setActivityToProfile:(id)a3;
- (void)setActivityToProfilerStartDates:(id)a3;
- (void)setActivityToSession:(id)a3;
- (void)setActivityToSnapshot:(id)a3;
- (void)setBatteryTemperatureRecorder:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMediaanalysisActivities:(id)a3;
- (void)setPidToken:(int)a3;
- (void)setSymptomsFeed:(id)a3;
- (void)setWriteQueue:(id)a3;
- (void)startProfilingForActivity:(id)a3 withState:(id)a4;
- (void)startProfilingSnapshotForActivity:(id)a3 withState:(id)a4;
- (void)stopProfilingSnapshotForActivity:(id)a3 endDate:(id)a4 completionStatus:(BOOL)a5 currentProfile:(id)a6 withState:(id)a7;
- (void)storeProfileArrayToKnowledgeStore:(id)a3;
@end

@implementation _DASActivityProfiler

- (_DASActivityProfiler)init
{
  v29.receiver = self;
  v29.super_class = (Class)_DASActivityProfiler;
  v2 = [(_DASActivityProfiler *)&v29 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    activityToSession = v2->_activityToSession;
    v2->_activityToSession = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    activityToSnapshot = v2->_activityToSnapshot;
    v2->_activityToSnapshot = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    activityToProfile = v2->_activityToProfile;
    v2->_activityToProfile = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    activityToProfilerStartDates = v2->_activityToProfilerStartDates;
    v2->_activityToProfilerStartDates = (NSMutableDictionary *)v9;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v11 = objc_alloc((Class)AnalyticsWorkspace);
    id v12 = [v11 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
    if (!v12)
    {
      v13 = qword_1001C41A8;
      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Init: Error setting up symptom workspace", buf, 2u);
      }
    }
    v14 = (UsageFeed *)[objc_alloc((Class)UsageFeed) initWithWorkspace:v12];
    symptomsFeed = v2->_symptomsFeed;
    v2->_symptomsFeed = v14;

    if (!v2->_symptomsFeed)
    {
      v16 = qword_1001C41A8;
      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR)) {
        sub_1000F82F4(v16);
      }
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100079E2C;
    v26[3] = &unk_100176C78;
    v17 = v2;
    v27 = v17;
    uint64_t v18 = +[_DASBatchingQueue queueWithName:@"profileStoreQueue" maxBatchingDelay:16 maxQueueDepth:0 queue:v26 workItemsHandler:300.0];
    writeQueue = v17->_writeQueue;
    v17->_writeQueue = (_DASBatchingQueue *)v18;

    uint64_t v20 = +[_DASBatteryTemperatureRecorder sharedInstance];
    batteryTemperatureRecorder = v17->_batteryTemperatureRecorder;
    v17->_batteryTemperatureRecorder = (_DASBatteryTemperatureRecorder *)v20;

    mediaanalysisActivities = v17->_mediaanalysisActivities;
    v17->_mediaanalysisActivities = (NSArray *)&off_100187A68;

    if (notify_register_check((const char *)[@"com.apple.mediaanalysisd.serviceProcessID" UTF8String], &v17->_pidToken)&& os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR))
    {
      sub_1000F8274();
    }
    uint64_t v23 = +[_DKKnowledgeStore knowledgeStoreWithDirectReadWriteAccess];
    knowledgeStore = v17->_knowledgeStore;
    v17->_knowledgeStore = (_DKKnowledgeStore *)v23;
  }
  return v2;
}

+ (id)sharedProfiler
{
  uint64_t v3 = +[_DASDaemonLogger logForCategory:@"profiling"];
  v4 = (void *)qword_1001C41A8;
  qword_1001C41A8 = v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079F64;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C41B0 != -1) {
    dispatch_once(&qword_1001C41B0, block);
  }
  uint64_t v5 = (void *)qword_1001C41B8;

  return v5;
}

- (BOOL)isProfilingDelayedForActivity:(id)a3
{
  mediaanalysisActivities = self->_mediaanalysisActivities;
  v4 = [a3 name];
  LOBYTE(mediaanalysisActivities) = [(NSArray *)mediaanalysisActivities containsObject:v4];

  return (char)mediaanalysisActivities;
}

- (void)startProfilingForActivity:(id)a3 withState:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(_DASActivityProfiler *)self lockedStartProfilingForActivity:v8 withState:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)lockedStartProfilingForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_DASActivityProfiler *)self shouldProfileActivity:v6])
  {
    id v8 = qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Starting profiling on activity %@", (uint8_t *)&v9, 0xCu);
    }
    [(_DASActivityProfiler *)self startProfilingSnapshotForActivity:v6 withState:v7];
  }
}

- (BOOL)shouldProfileActivity:(id)a3
{
  id v4 = a3;
  if (![v4 pid])
  {
    v21 = (void *)qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      [v4 interval];
      int v32 = 138412546;
      id v33 = v4;
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      v24 = "Profiling not started for %@, interval: %f";
      v25 = v22;
      uint32_t v26 = 22;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v32, v26);
    }
LABEL_17:
    BOOL v28 = 0;
    goto LABEL_23;
  }
  [v4 interval];
  if (v5 <= 0.0)
  {
    v27 = (void *)qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
    {
      v22 = v27;
      int v32 = 138412546;
      id v33 = v4;
      __int16 v34 = 1024;
      LODWORD(v35) = [v4 pid];
      v24 = "Profiling not started for %@, pid: %d";
      v25 = v22;
      uint32_t v26 = 18;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v6 = qword_1001C41C0++;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v6 + 0x1999999999999998, 1) >= 0x1999999999999999uLL
    && !+[_DASConfig isInternalBuild])
  {
    goto LABEL_17;
  }
  activityToProfilerStartDates = self->_activityToProfilerStartDates;
  id v8 = [v4 name];
  int v9 = [(NSMutableDictionary *)activityToProfilerStartDates objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = +[NSMutableArray arrayWithCapacity:3];
    id v11 = self->_activityToProfilerStartDates;
    id v12 = [v4 name];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];
  }
  v13 = self->_activityToProfilerStartDates;
  v14 = [v4 name];
  v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];

  if ([v15 count] == (id)3)
  {
    v16 = [v15 lastObject];
    v17 = +[NSDate date];
    uint64_t v18 = 0;
    while (1)
    {
      [v17 timeIntervalSinceDate:v16];
      if (v19 <= 60.0) {
        break;
      }
      [v15 removeObject:v16];
      uint64_t v20 = [v15 lastObject];

      --v18;
      v16 = v20;
      if (v18 == -3) {
        goto LABEL_20;
      }
    }
    if (v18)
    {
      uint64_t v20 = v16;
LABEL_20:

      goto LABEL_21;
    }
    v31 = qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412290;
      id v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Profiling not started for %@, rate limited", (uint8_t *)&v32, 0xCu);
    }

    BOOL v28 = 0;
  }
  else
  {
LABEL_21:
    objc_super v29 = [v4 startDate];
    [v15 insertObject:v29 atIndex:0];

    BOOL v28 = 1;
  }

LABEL_23:
  return v28;
}

- (void)startProfilingSnapshotForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  int v61 = 0;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setObject:&off_100186FE8 forKeyedSubscript:@"version"];
  int v9 = [v6 name];
  [v8 setObject:v9 forKeyedSubscript:@"activityname"];

  id v10 = +[NSNumber numberWithUnsignedLongLong:sub_10007D2EC()];
  [v8 setObject:v10 forKeyedSubscript:@"cpuAwakeTime"];

  id v11 = +[NSTimeZone localTimeZone];
  id v12 = [v11 secondsFromGMT];

  v13 = [v6 startDate];

  if (v13)
  {
    v14 = [v6 startDate];
    [v14 timeIntervalSince1970WithTimeZoneOffset:(double)(uint64_t)v12];
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v8 setObject:v15 forKeyedSubscript:@"startTime"];
  }
  else
  {
    [v8 setObject:&off_100187000 forKeyedSubscript:@"startTime"];
  }
  v16 = +[_CDContextQueries keyPathForPluginStatus];
  v17 = [v7 objectForKeyedSubscript:v16];
  unsigned int v18 = [v17 BOOLValue];

  double v19 = +[_CDContextQueries keyPathForInUseStatus];
  uint64_t v20 = [v7 objectForKeyedSubscript:v19];

  id v21 = [v20 unsignedLongLongValue];
  int64_t v22 = [(_DASBatteryTemperatureRecorder *)self->_batteryTemperatureRecorder currentBatteryTemperature];
  uint64_t v23 = +[NSNumber numberWithInt:v18 ^ 1];
  [v8 setObject:v23 forKeyedSubscript:@"startedOnBattery"];

  v24 = +[NSNumber numberWithBool:v21 == 0];
  [v8 setObject:v24 forKeyedSubscript:@"startedInIdle"];

  v25 = +[NSNumber numberWithInteger:v22];
  [v8 setObject:v25 forKeyedSubscript:@"startBatteryTemperature"];

  activityToProfile = self->_activityToProfile;
  v27 = [v6 description];
  [(NSMutableDictionary *)activityToProfile setObject:v8 forKeyedSubscript:v27];

  if ([(_DASActivityProfiler *)self isProfilingDelayedForActivity:v6])
  {
    uint64_t v60 = 0;
    uint32_t state = notify_get_state(self->_pidToken, &v60);
    objc_super v29 = qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v60;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "PID number found for mediaanalysisd-service is (%lu)\n", buf, 0xCu);
    }
    if (state && os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR)) {
      sub_1000F8700();
    }
    if (v60) {
      [v6 setPid:];
    }
  }
  uint64_t v30 = pc_session_create();
  [v6 pid];
  int v31 = pc_session_set_procpid();
  if (v31)
  {
    int v32 = v31;
    id v33 = (void *)qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F866C((uint64_t)v6, v33, v32);
    }
    __int16 v34 = 0;
LABEL_19:
    pc_session_destroy();
    activityToSession = self->_activityToSession;
    v39 = [v6 description];
    [(NSMutableDictionary *)activityToSession removeObjectForKey:v39];
    goto LABEL_20;
  }
  __int16 v34 = +[NSValue valueWithPointer:v30];
  int v35 = pc_session_begin();
  v36 = (void *)qword_1001C41A8;
  BOOL v37 = os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG);
  if (v35)
  {
    if (v37) {
      sub_1000F85D8((uint64_t)v6, v36, v35);
    }
    goto LABEL_19;
  }
  if (v37) {
    sub_1000F8570();
  }
  v59 = self->_activityToSession;
  v39 = [v6 description];
  [(NSMutableDictionary *)v59 setObject:v34 forKeyedSubscript:v39];
LABEL_20:

  v40 = +[NSMutableDictionary dictionary];
  uint64_t v80 = 0;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  *(_OWORD *)buf = 0u;
  long long v63 = 0u;
  *__error() = 255;
  int v41 = proc_pid_rusage((int)[v6 pid], 4, (rusage_info_t *)buf);
  if (v41 << 24)
  {
    char v42 = v41;
    v43 = (void *)qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F84B4((uint64_t)v6, v43, v42);
    }
    [v40 removeObjectForKey:@"rusage"];
  }
  else
  {
    v44 = +[NSMutableDictionary dictionary];
    v45 = +[NSNumber numberWithDouble:(double)(unint64_t)v72];
    [v44 setObject:v45 forKeyedSubscript:@"qosDefault"];

    v46 = +[NSNumber numberWithDouble:(double)*((unint64_t *)&v72 + 1)];
    [v44 setObject:v46 forKeyedSubscript:@"qosMaintenance"];

    v47 = +[NSNumber numberWithDouble:(double)(unint64_t)v73];
    [v44 setObject:v47 forKeyedSubscript:@"qosBackground"];

    v48 = +[NSNumber numberWithDouble:(double)*((unint64_t *)&v73 + 1)];
    [v44 setObject:v48 forKeyedSubscript:@"qosUtility"];

    v49 = +[NSNumber numberWithDouble:(double)*((unint64_t *)&v74 + 1)];
    [v44 setObject:v49 forKeyedSubscript:@"qosUserInit"];

    v50 = +[NSNumber numberWithDouble:(double)(unint64_t)v75];
    [v44 setObject:v50 forKeyedSubscript:@"qosUserInteractive"];

    v51 = +[NSNumber numberWithDouble:(double)(unint64_t)v74];
    [v44 setObject:v51 forKeyedSubscript:@"qosLegacy"];

    v52 = +[NSNumber numberWithDouble:(double)(unint64_t)v71];
    [v44 setObject:v52 forKeyedSubscript:@"ioRead"];

    v53 = +[NSNumber numberWithDouble:(double)*((unint64_t *)&v71 + 1)];
    [v44 setObject:v53 forKeyedSubscript:@"ioWrite"];

    v54 = +[NSNumber numberWithDouble:(double)*((unint64_t *)&v78 + 1)];
    [v44 setObject:v54 forKeyedSubscript:@"billedEnergy"];

    v55 = +[NSNumber numberWithDouble:(double)(unint64_t)v79];
    [v44 setObject:v55 forKeyedSubscript:@"servicedEnergy"];

    [v40 setObject:v44 forKeyedSubscript:@"rusage"];
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F844C();
    }
  }
  v56 = [(_DASActivityProfiler *)self startRecordingNetworkTransfer:v6];
  if (v56)
  {
    [v40 setObject:v56 forKeyedSubscript:@"network"];
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F83E4();
    }
  }
  else
  {
    [v40 removeObjectForKey:@"network"];
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F837C();
    }
  }
  activityToSnapshot = self->_activityToSnapshot;
  v58 = [v6 description];
  [(NSMutableDictionary *)activityToSnapshot setObject:v40 forKeyedSubscript:v58];
}

- (void)endProfilingForActivity:(id)a3 completed:(BOOL)a4 withState:(id)a5
{
  BOOL v5 = a4;
  p_lock = &self->_lock;
  id v9 = a5;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  [(_DASActivityProfiler *)self lockedEndProfilingForActivity:v10 completed:v5 withState:v9];

  os_unfair_lock_unlock(p_lock);
}

- (void)lockedEndProfilingForActivity:(id)a3 completed:(BOOL)a4 withState:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  activityToProfile = self->_activityToProfile;
  id v11 = [v8 description];
  id v12 = [(NSMutableDictionary *)activityToProfile objectForKeyedSubscript:v11];

  if (v12)
  {
    unint64_t v13 = sub_10007D2EC();
    v14 = [v12 objectForKeyedSubscript:@"cpuAwakeTime"];
    v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13 - (void)[v14 unsignedIntegerValue]);
    [v12 setObject:v15 forKeyedSubscript:@"cpuAwakeTime"];

    v16 = +[NSDate date];
    [(_DASActivityProfiler *)self stopProfilingSnapshotForActivity:v8 endDate:v16 completionStatus:v6 currentProfile:v12 withState:v9];

    v17 = qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "endProfiling: %@", buf, 0xCu);
    }
    [(_DASBatchingQueue *)self->_writeQueue addWorkItem:v12];
    unsigned int v18 = self->_activityToProfile;
    double v19 = [v8 description];
    [(NSMutableDictionary *)v18 removeObjectForKey:v19];

    if ((unint64_t)[(NSMutableDictionary *)self->_activityToProfilerStartDates count] >= 0xB)
    {
      uint64_t v20 = [(NSMutableDictionary *)self->_activityToProfilerStartDates allKeys];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v21)
      {
        id v22 = v21;
        int v32 = v12;
        id v33 = v9;
        uint64_t v23 = 0;
        uint64_t v24 = *(void *)v35;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(v20);
            }
            uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v27 = [(NSMutableDictionary *)self->_activityToProfilerStartDates objectForKeyedSubscript:v26];
            BOOL v28 = [v27 firstObject];

            [v28 timeIntervalSinceNow];
            if (v29 < -60.0)
            {
              [(NSMutableDictionary *)self->_activityToProfilerStartDates removeObjectForKey:v26];
              ++v23;
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v22);
        id v9 = v33;
        id v12 = v32;
        if (v23)
        {
          uint64_t v30 = qword_1001C41A8;
          if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            id v40 = v23;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Cleaned up %llu stale rate-limiting records", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    int v31 = qword_1001C41A8;
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v8;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "endProfiling: %@ Didn't start profiling", buf, 0xCu);
    }
  }
}

- (void)storeProfileArrayToKnowledgeStore:(id)a3
{
  id v3 = a3;
  id v29 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v30 = +[_DKEventStream eventStreamWithName:@"/dasd/activityprofile"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v9 = objc_alloc((Class)NSDate);
        id v10 = [v8 objectForKeyedSubscript:@"endTime"];
        [v10 doubleValue];
        id v11 = [v9 initWithTimeIntervalSince1970:];

        id v12 = objc_alloc((Class)NSDate);
        unint64_t v13 = [v8 objectForKeyedSubscript:@"startTime"];
        [v13 doubleValue];
        id v14 = [v12 initWithTimeIntervalSince1970:];

        v15 = [v8 objectForKeyedSubscript:@"activityname"];
        CFStringRef v40 = @"metadata";
        id v16 = [v8 copy];
        id v41 = v16;
        v17 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        unsigned int v18 = +[_DKEvent eventWithStream:v30 startDate:v14 endDate:v11 identifierStringValue:v15 metadata:v17];

        if (v18) {
          [v29 addObject:v18];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v5);
  }

  double v19 = (void *)qword_1001C41A8;
  if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = v19;
    id v21 = [v29 count];
    id v22 = [obj count];
    *(_DWORD *)buf = 134218240;
    id v37 = v21;
    __int16 v38 = 2048;
    id v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Processed %lu events from %lu profiles", buf, 0x16u);
  }
  uint64_t v23 = self->_knowledgeStore;
  if ([v29 count])
  {
    id v31 = 0;
    [(_DKKnowledgeStore *)v23 saveObjects:v29 error:&v31];
    id v24 = v31;
    v25 = qword_1001C41A8;
    if (v24)
    {
      uint64_t v26 = v24;
      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR)) {
        sub_1000F8780();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Events sent to store successfully", buf, 2u);
    }
  }
}

- (void)stopProfilingSnapshotForActivity:(id)a3 endDate:(id)a4 completionStatus:(BOOL)a5 currentProfile:(id)a6 withState:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v14 objectForKeyedSubscript:@"startTime"];

  if (v16)
  {
    v17 = [v12 startDate];
    [v13 timeIntervalSinceDate:v17];
    double v19 = v18;

    uint64_t v20 = +[NSNumber numberWithDouble:v19];
    [v14 setObject:v20 forKeyedSubscript:@"runTime"];
  }
  else
  {
    [v14 setObject:&off_100187000 forKeyedSubscript:@"runTime"];
  }
  id v21 = +[NSTimeZone localTimeZone];
  double v22 = (double)(uint64_t)[v21 secondsFromGMT];

  [v13 timeIntervalSince1970WithTimeZoneOffset:v22];
  uint64_t v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v14 setObject:v23 forKeyedSubscript:@"endTime"];

  id v24 = +[NSNumber numberWithBool:v9];
  [v14 setObject:v24 forKeyedSubscript:@"completed"];

  v25 = +[_CDContextQueries keyPathForPluginStatus];
  uint64_t v26 = [v15 objectForKeyedSubscript:v25];
  unsigned int v27 = [v26 BOOLValue];

  BOOL v28 = +[_CDContextQueries keyPathForInUseStatus];
  id v29 = [v15 objectForKeyedSubscript:v28];

  id v30 = [v29 unsignedLongLongValue];
  int64_t v31 = [(_DASBatteryTemperatureRecorder *)self->_batteryTemperatureRecorder currentBatteryTemperature];
  long long v32 = +[NSNumber numberWithInt:v27 ^ 1];
  [v14 setObject:v32 forKeyedSubscript:@"endedOnBattery"];

  long long v33 = +[NSNumber numberWithBool:v30 == 0];
  [v14 setObject:v33 forKeyedSubscript:@"endedInIdle"];

  long long v34 = +[NSNumber numberWithInteger:v31];
  [v14 setObject:v34 forKeyedSubscript:@"endBatteryTemperature"];

  activityToSession = self->_activityToSession;
  long long v36 = [v12 description];
  id v37 = [(NSMutableDictionary *)activityToSession objectForKeyedSubscript:v36];
  id v38 = [v37 pointerValue];

  if (v38)
  {
    int v39 = pc_session_end();
    int v40 = pc_session_process();
    if (v39 | v40)
    {
      int v41 = v40;
      char v42 = qword_1001C41A8;
      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buffer[0]) = 138412802;
        *(rusage_info_t *)((char *)buffer + 4) = v12;
        WORD2(buffer[1]) = 1024;
        *(_DWORD *)((char *)&buffer[1] + 6) = v39;
        WORD1(buffer[2]) = 1024;
        HIDWORD(buffer[2]) = v41;
        _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "endProfiling: %@ : Failed to end/process session with end_ret: %d procsess_ret: %d", (uint8_t *)buffer, 0x18u);
      }
      v43 = &__kCFBooleanFalse;
    }
    else
    {
      buffer[0] = 0;
      uint64_t value = pc_session_get_value();
      v45 = [v12 description];
      LOBYTE(value) = [(_DASActivityProfiler *)self errorCheck:0x63707574696D6500 withError:value onActivity:v45];

      if ((value & 1) == 0)
      {
        *(double *)buffer = *(double *)buffer / 1000000.0;
        if (*(double *)buffer != 0.0)
        {
          v46 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v14 setObject:v46 forKeyedSubscript:@"cpuTime"];
        }
      }
      uint64_t v47 = pc_session_get_value();
      v48 = [v12 description];
      [(_DASActivityProfiler *)self errorCheck:0x6D656D64656C7461 withError:v47 onActivity:v48];

      uint64_t v49 = pc_session_get_value();
      v50 = [v12 description];
      [(_DASActivityProfiler *)self errorCheck:0x73746F7264697274 withError:v49 onActivity:v50];

      v43 = &__kCFBooleanTrue;
    }
    [v14 setObject:v43 forKeyedSubscript:@"sessionProfSuccess"];
    pc_session_destroy();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F8994();
    }
    [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:@"sessionProfSuccess"];
  }
  activityToSnapshot = self->_activityToSnapshot;
  v52 = [v12 description];
  v53 = [(NSMutableDictionary *)activityToSnapshot objectForKeyedSubscript:v52];

  v54 = [v53 objectForKeyedSubscript:@"rusage"];
  if (!v54)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F88C4();
    }
    goto LABEL_23;
  }
  uint64_t v162 = 0;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pid_rusage((int)[v12 pid], 4, buffer))
  {
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F892C();
    }
LABEL_23:
    v55 = &__kCFBooleanFalse;
    goto LABEL_58;
  }
  long long v56 = v154;
  long long v57 = v155;
  unint64_t v138 = *((void *)&v156 + 1);
  unint64_t v139 = v157;
  unint64_t v142 = *((void *)&v160 + 1);
  unint64_t v143 = v161;
  unint64_t v140 = v156;
  long long v58 = v153;
  unint64_t v141 = *((void *)&v153 + 1);
  if ((void)v154)
  {
    double v59 = (double)(unint64_t)v154;
    uint64_t v60 = [v54 objectForKeyedSubscript:@"qosDefault"];
    [v60 doubleValue];
    double v62 = (v59 - v61) / 24000.0;

    if (v62 != 0.0)
    {
      long long v63 = +[NSNumber numberWithDouble:v62];
      [v14 setObject:v63 forKeyedSubscript:@"qosDefault"];
    }
  }
  if (*((void *)&v56 + 1))
  {
    long long v64 = [v54 objectForKeyedSubscript:@"qosMaintenance"];
    [v64 doubleValue];
    double v66 = ((double)*((unint64_t *)&v56 + 1) - v65) / 24000.0;

    if (v66 != 0.0)
    {
      long long v67 = +[NSNumber numberWithDouble:v66];
      [v14 setObject:v67 forKeyedSubscript:@"qosMaintenance"];
    }
  }
  if ((void)v57)
  {
    long long v68 = [v54 objectForKeyedSubscript:@"qosBackground"];
    [v68 doubleValue];
    double v70 = ((double)(unint64_t)v57 - v69) / 24000.0;

    if (v70 != 0.0)
    {
      long long v71 = +[NSNumber numberWithDouble:v70];
      [v14 setObject:v71 forKeyedSubscript:@"qosBackground"];
    }
  }
  if (*((void *)&v57 + 1))
  {
    long long v72 = [v54 objectForKeyedSubscript:@"qosUtility"];
    [v72 doubleValue];
    double v74 = ((double)*((unint64_t *)&v57 + 1) - v73) / 24000.0;

    if (v74 != 0.0)
    {
      long long v75 = +[NSNumber numberWithDouble:v74];
      [v14 setObject:v75 forKeyedSubscript:@"qosUtility"];
    }
  }
  if (v138)
  {
    long long v76 = [v54 objectForKeyedSubscript:@"qosUserInit"];
    [v76 doubleValue];
    double v78 = ((double)v138 - v77) / 24000.0;

    if (v78 != 0.0)
    {
      long long v79 = +[NSNumber numberWithDouble:v78];
      [v14 setObject:v79 forKeyedSubscript:@"qosUserInit"];
    }
  }
  if (v139)
  {
    uint64_t v80 = [v54 objectForKeyedSubscript:@"qosUserInteractive"];
    [v80 doubleValue];
    double v82 = ((double)v139 - v81) / 24000.0;

    if (v82 != 0.0)
    {
      v83 = +[NSNumber numberWithDouble:v82];
      [v14 setObject:v83 forKeyedSubscript:@"qosUserInteractive"];
    }
  }
  if (v140)
  {
    v84 = [v54 objectForKeyedSubscript:@"qosLegacy"];
    [v84 doubleValue];
    double v86 = ((double)v140 - v85) / 24000.0;

    if (v86 != 0.0)
    {
      v87 = +[NSNumber numberWithDouble:v86];
      [v14 setObject:v87 forKeyedSubscript:@"qosLegacy"];
    }
  }
  if ((void)v58)
  {
    v88 = [v54 objectForKeyedSubscript:@"ioRead"];
    [v88 doubleValue];
    double v90 = (double)(unint64_t)v58 - v89;

    if (v90 != 0.0)
    {
      v91 = +[NSNumber numberWithDouble:v90];
      [v14 setObject:v91 forKeyedSubscript:@"ioRead"];
    }
  }
  if (v141)
  {
    v92 = [v54 objectForKeyedSubscript:@"ioWrite"];
    [v92 doubleValue];
    double v94 = (double)v141 - v93;

    if (v94 != 0.0)
    {
      v95 = +[NSNumber numberWithDouble:v94];
      [v14 setObject:v95 forKeyedSubscript:@"ioWrite"];
    }
  }
  if (v142)
  {
    v96 = [v54 objectForKeyedSubscript:@"billedEnergy"];
    [v96 doubleValue];
    double v98 = (double)v142 - v97;

    if (v98 != 0.0)
    {
      v99 = +[NSNumber numberWithDouble:v98];
      [v14 setObject:v99 forKeyedSubscript:@"billedEnergy"];
    }
  }
  if (v143)
  {
    v100 = [v54 objectForKeyedSubscript:@"servicedEnergy"];
    [v100 doubleValue];
    double v102 = (double)v143 - v101;

    if (v102 != 0.0)
    {
      v103 = +[NSNumber numberWithDouble:v102];
      [v14 setObject:v103 forKeyedSubscript:@"servicedEnergy"];
    }
  }
  v55 = &__kCFBooleanTrue;
LABEL_58:
  [v14 setObject:v55 forKeyedSubscript:@"rusageProfSuccess" v138];
  v104 = [v53 objectForKeyedSubscript:@"network"];
  if (v104)
  {
    v105 = [(_DASActivityProfiler *)self stopRecordingNetworkTransfer:v12];
    if (v105)
    {
      id v144 = v13;
      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
        sub_1000F885C();
      }
      v106 = [v105 objectForKeyedSubscript:@"wifiDown"];
      [v106 doubleValue];
      double v108 = v107;
      v109 = [v104 objectForKeyedSubscript:@"wifiDown"];
      [v109 doubleValue];
      double v111 = v108 - v110;

      if (v111 != 0.0)
      {
        v112 = +[NSNumber numberWithDouble:v111];
        [v14 setObject:v112 forKeyedSubscript:@"wifiDown"];
      }
      v113 = [v105 objectForKeyedSubscript:@"cellDown"];
      [v113 doubleValue];
      double v115 = v114;
      v116 = [v104 objectForKeyedSubscript:@"cellDown"];
      [v116 doubleValue];
      double v118 = v115 - v117;

      if (v118 != 0.0)
      {
        v119 = +[NSNumber numberWithDouble:v118];
        [v14 setObject:v119 forKeyedSubscript:@"cellDown"];
      }
      v120 = [v105 objectForKeyedSubscript:@"wifiUp"];
      [v120 doubleValue];
      double v122 = v121;
      v123 = [v104 objectForKeyedSubscript:@"wifiUp"];
      [v123 doubleValue];
      double v125 = v122 - v124;

      if (v125 != 0.0)
      {
        v126 = +[NSNumber numberWithDouble:v125];
        [v14 setObject:v126 forKeyedSubscript:@"wifiUp"];
      }
      v127 = [v105 objectForKeyedSubscript:@"cellUp"];
      [v127 doubleValue];
      double v129 = v128;
      v130 = [v104 objectForKeyedSubscript:@"cellUp"];
      [v130 doubleValue];
      double v132 = v129 - v131;

      if (v132 != 0.0)
      {
        v133 = +[NSNumber numberWithDouble:v132];
        [v14 setObject:v133 forKeyedSubscript:@"cellUp"];
      }
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"networkProfSuccess"];
      id v13 = v144;
    }
    else
    {
      [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:@"networkProfSuccess"];
      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
        sub_1000F87F4();
      }
    }
  }
  else
  {
    [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:@"networkProfSuccess"];
  }
  v134 = self->_activityToSession;
  v135 = [v12 description];
  [(NSMutableDictionary *)v134 removeObjectForKey:v135];

  v136 = self->_activityToSnapshot;
  v137 = [v12 description];
  [(NSMutableDictionary *)v136 removeObjectForKey:v137];
}

- (id)startRecordingNetworkTransfer:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  uint64_t v39 = 0;
  int v40 = (double *)&v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v35 = 0;
  long long v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v31 = 0;
  long long v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v27 = 0;
  BOOL v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v34 = 0;
  uint64_t v38 = 0;
  uint64_t v42 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", [v4 pid]);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F89FC();
    }
    goto LABEL_12;
  }
  if (![v4 pid]
    || (+[NSSet setWithObject:v7],
        (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F8A64();
    }
LABEL_12:
    id v13 = 0;
    goto LABEL_17;
  }
  id v19 = kUsageProcessProcName;
  uint64_t v43 = kSymptomAnalyticsServiceRefreshUsage;
  v44 = &__kCFBooleanTrue;
  BOOL v9 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007C880;
  v20[3] = &unk_100176CA0;
  uint64_t v23 = &v39;
  id v24 = &v31;
  v25 = &v35;
  uint64_t v26 = &v27;
  id v21 = v4;
  id v10 = v6;
  double v22 = v10;
  id v11 = objc_retainBlock(v20);
  if ([(UsageFeed *)self->_symptomsFeed usageToDateWithOptionsFor:v8 nameKind:v19 options:v9 reply:v11])
  {
    dispatch_time_t v12 = dispatch_time(0, 10000000000);
    if (!dispatch_semaphore_wait(v10, v12))
    {
      id v15 = +[NSNumber numberWithDouble:v40[3]];
      [v5 setObject:v15 forKeyedSubscript:@"wifiDown"];

      id v16 = +[NSNumber numberWithDouble:v36[3]];
      [v5 setObject:v16 forKeyedSubscript:@"wifiUp"];

      v17 = +[NSNumber numberWithDouble:v32[3]];
      [v5 setObject:v17 forKeyedSubscript:@"cellDown"];

      double v18 = +[NSNumber numberWithDouble:v28[3]];
      [v5 setObject:v18 forKeyedSubscript:@"cellUp"];

      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
        sub_1000F8ACC();
      }
      id v13 = v5;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F8B34();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F8B9C();
  }
  id v13 = 0;
LABEL_16:

LABEL_17:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v13;
}

- (id)stopRecordingNetworkTransfer:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  uint64_t v39 = 0;
  int v40 = (double *)&v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v35 = 0;
  long long v36 = (double *)&v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v31 = 0;
  long long v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v27 = 0;
  BOOL v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v34 = 0;
  uint64_t v38 = 0;
  uint64_t v42 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", [v4 pid]);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F8C74();
    }
    goto LABEL_12;
  }
  if (![v4 pid]
    || (+[NSSet setWithObject:v7],
        (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F8CDC();
    }
LABEL_12:
    id v13 = 0;
    goto LABEL_17;
  }
  id v19 = kUsageProcessProcName;
  uint64_t v43 = kSymptomAnalyticsServiceRefreshUsage;
  v44 = &__kCFBooleanTrue;
  BOOL v9 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007CF48;
  v20[3] = &unk_100176CA0;
  uint64_t v23 = &v39;
  id v24 = &v31;
  v25 = &v35;
  uint64_t v26 = &v27;
  id v21 = v4;
  id v10 = v6;
  double v22 = v10;
  id v11 = objc_retainBlock(v20);
  if ([(UsageFeed *)self->_symptomsFeed usageToDateWithOptionsFor:v8 nameKind:v19 options:v9 reply:v11])
  {
    dispatch_time_t v12 = dispatch_time(0, 10000000000);
    if (!dispatch_semaphore_wait(v10, v12))
    {
      id v15 = +[NSNumber numberWithDouble:v40[3]];
      [v5 setObject:v15 forKeyedSubscript:@"wifiDown"];

      id v16 = +[NSNumber numberWithDouble:v36[3]];
      [v5 setObject:v16 forKeyedSubscript:@"wifiUp"];

      v17 = +[NSNumber numberWithDouble:v32[3]];
      [v5 setObject:v17 forKeyedSubscript:@"cellDown"];

      double v18 = +[NSNumber numberWithDouble:v28[3]];
      [v5 setObject:v18 forKeyedSubscript:@"cellUp"];

      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
        sub_1000F8D44();
      }
      id v13 = v5;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F8DAC();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F8E14();
  }
  id v13 = 0;
LABEL_16:

LABEL_17:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v13;
}

- (BOOL)errorCheck:(unint64_t)a3 withError:(int)a4 onActivity:(id)a5
{
  id v6 = a5;
  if (a4)
  {
    if (a4 > 44)
    {
      if (a4 == 45)
      {
        if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR)) {
          sub_1000F8F54();
        }
      }
      else if (a4 == 93 && os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR))
      {
        sub_1000F9024();
      }
    }
    else if (a4 == 22)
    {
      if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR)) {
        sub_1000F8EEC();
      }
    }
    else if (a4 == 34 && os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR))
    {
      sub_1000F8FBC();
    }
  }

  return a4 != 0;
}

- (NSMutableDictionary)activityToSession
{
  return self->_activityToSession;
}

- (void)setActivityToSession:(id)a3
{
}

- (NSMutableDictionary)activityToProfile
{
  return self->_activityToProfile;
}

- (void)setActivityToProfile:(id)a3
{
}

- (NSMutableDictionary)activityToSnapshot
{
  return self->_activityToSnapshot;
}

- (void)setActivityToSnapshot:(id)a3
{
}

- (NSMutableDictionary)activityToProfilerStartDates
{
  return self->_activityToProfilerStartDates;
}

- (void)setActivityToProfilerStartDates:(id)a3
{
}

- (_DASBatchingQueue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
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

- (UsageFeed)symptomsFeed
{
  return self->_symptomsFeed;
}

- (void)setSymptomsFeed:(id)a3
{
}

- (_DASBatteryTemperatureRecorder)batteryTemperatureRecorder
{
  return self->_batteryTemperatureRecorder;
}

- (void)setBatteryTemperatureRecorder:(id)a3
{
}

- (NSArray)mediaanalysisActivities
{
  return self->_mediaanalysisActivities;
}

- (void)setMediaanalysisActivities:(id)a3
{
}

- (int)pidToken
{
  return self->_pidToken;
}

- (void)setPidToken:(int)a3
{
  self->_pidToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaanalysisActivities, 0);
  objc_storeStrong((id *)&self->_batteryTemperatureRecorder, 0);
  objc_storeStrong((id *)&self->_symptomsFeed, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_activityToProfilerStartDates, 0);
  objc_storeStrong((id *)&self->_activityToSnapshot, 0);
  objc_storeStrong((id *)&self->_activityToProfile, 0);
  objc_storeStrong((id *)&self->_activityToSession, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end