@interface PSDSchedulerCoreAnalyticsLogger
+ (id)defaultLogger;
- (NSDate)currentLinkStartTime;
- (NSMutableSet)activeSyncTopics;
- (NSURL)sessionStateURL;
- (OS_dispatch_queue)analyticsQueue;
- (PSDSchedulerCoreAnalyticsLogger)initWithSessionState:(id)a3 URL:(id)a4;
- (PSDSchedulerCoreAnalyticsSessionState)sessionState;
- (PSYLinkUpgradeMonitor)linkUpgradeMonitor;
- (id)binNameForDuration:(double)a3 bins:(int *)a4 count:(int)a5;
- (id)updatedIdentifierForActivityIdentifier:(id)a3;
- (int64_t)_linkTypeForAmountOfTimeKey:(id)a3;
- (int64_t)currentLinkType;
- (void)_appendLinkAvailabilityForKey:(id)a3 fromDictionary:(id)a4 syncDuration:(double)a5 intoDictionary:(id)a6 outputKey:(id)a7;
- (void)_appendLinkInformationForActivity:(id)a3 inEventInfo:(id)a4 forEventDuration:(double)a5;
- (void)_appendPairedWatchInforamtionToEvent:(id)a3 withDevice:(id)a4;
- (void)_resetLinkMonitor;
- (void)_setupLinkMonitorWithPairingIdentifier:(id)a3;
- (void)_updateCurrentLinkStats;
- (void)activityDidCompleteSending:(id)a3;
- (void)clearSessionState;
- (void)didFinishActivity:(id)a3 inSession:(id)a4;
- (void)didFinishSession:(id)a3;
- (void)didStartActivity:(id)a3;
- (void)linkChangedToLinkType:(int64_t)a3;
- (void)logDurationForActivityWithIdentifier:(id)a3 bins:(int *)a4 binCount:(int)a5 inSession:(id)a6;
- (void)saveSessionState;
- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4;
- (void)scheduler:(id)a3 willStartSyncSession:(id)a4;
- (void)sendEvent:(id)a3;
- (void)setActiveSyncTopics:(id)a3;
- (void)setAnalyticsQueue:(id)a3;
- (void)setCurrentLinkStartTime:(id)a3;
- (void)setCurrentLinkType:(int64_t)a3;
- (void)setLinkUpgradeMonitor:(id)a3;
- (void)setSessionState:(id)a3;
- (void)setSessionStateURL:(id)a3;
@end

@implementation PSDSchedulerCoreAnalyticsLogger

+ (id)defaultLogger
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FA7C;
  block[3] = &unk_10002C778;
  block[4] = a1;
  if (qword_1000384E0 != -1) {
    dispatch_once(&qword_1000384E0, block);
  }
  v2 = (void *)qword_1000384D8;

  return v2;
}

- (PSDSchedulerCoreAnalyticsLogger)initWithSessionState:(id)a3 URL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PSDSchedulerCoreAnalyticsLogger;
  v9 = [(PSDSchedulerCoreAnalyticsLogger *)&v16 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PairedSync.AnalyticsQueue", v10);
    analyticsQueue = v9->_analyticsQueue;
    v9->_analyticsQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_sessionState, a3);
    objc_storeStrong((id *)&v9->_sessionStateURL, a4);
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeSyncTopics = v9->_activeSyncTopics;
    v9->_activeSyncTopics = v13;
  }
  return v9;
}

- (void)scheduler:(id)a3 willStartSyncSession:(id)a4
{
  id v5 = a4;
  analyticsQueue = self->_analyticsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FE24;
  v8[3] = &unk_10002C8B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)analyticsQueue, v8);
}

- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4
{
  id v5 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010020;
  v15[3] = &unk_10002C9A0;
  v15[4] = self;
  [v5 enumerateNewlyRunningActivitiesWithBlock:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010028;
  v14[3] = &unk_10002C9A0;
  v14[4] = self;
  [v5 enumerateChangedActivitiesWithBlock:v14];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100010094;
  dispatch_queue_t v11 = &unk_10002C978;
  v12 = self;
  id v6 = v5;
  id v13 = v6;
  [v6 enumerateNewlyCompletedActivitiesWithBlock:&v8];
  if (objc_msgSend(v6, "didUpdateCompleteSyncSession", v8, v9, v10, v11, v12))
  {
    id v7 = [v6 updatedSession];
    [(PSDSchedulerCoreAnalyticsLogger *)self didFinishSession:v7];
  }
}

- (void)_setupLinkMonitorWithPairingIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[PSYRegistrySingleton registry];
    id v6 = [v5 deviceForPairingID:v4];

    if (v6)
    {
      id v7 = (PSYLinkUpgradeMonitor *)[objc_alloc((Class)PSYLinkUpgradeMonitor) initWithRegistryDevice:v6 delegateQueue:self->_analyticsQueue];
      linkUpgradeMonitor = self->_linkUpgradeMonitor;
      self->_linkUpgradeMonitor = v7;

      [(PSYLinkUpgradeMonitor *)self->_linkUpgradeMonitor setDelegate:self];
    }
    self->_currentLinkType = (int64_t)[(PSYLinkUpgradeMonitor *)self->_linkUpgradeMonitor currentLinkType];
    uint64_t v9 = +[NSDate date];
    currentLinkStartTime = self->_currentLinkStartTime;
    self->_currentLinkStartTime = v9;

    dispatch_queue_t v11 = psd_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      id v13 = psd_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = self->_currentLinkType - 1;
        if (v14 > 3) {
          CFStringRef v15 = @"unknown";
        }
        else {
          CFStringRef v15 = off_10002CC50[v14];
        }
        int v16 = 138412290;
        CFStringRef v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "current link type: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)_resetLinkMonitor
{
  [(PSYLinkUpgradeMonitor *)self->_linkUpgradeMonitor resetCompanionLinkPreference];
  linkUpgradeMonitor = self->_linkUpgradeMonitor;
  self->_linkUpgradeMonitor = 0;
}

- (void)linkChangedToLinkType:(int64_t)a3
{
  if (self->_currentLinkType != a3)
  {
    [(PSDSchedulerCoreAnalyticsLogger *)self _updateCurrentLinkStats];
    self->_currentLinkType = a3;
  }
}

- (void)_updateCurrentLinkStats
{
  v3 = +[NSDate date];
  int64_t currentLinkType = self->_currentLinkType;
  id v5 = self->_currentLinkStartTime;
  id v6 = +[NSDate date];
  currentLinkStartTime = self->_currentLinkStartTime;
  self->_currentLinkStartTime = v6;

  id v8 = [(PSDSchedulerCoreAnalyticsLogger *)self sessionState];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_activeSyncTopics;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "updateLinkDurationForActivity:withLinkType:linkStartTime:endTime:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), currentLinkType, v5, v3, (void)v14);
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)didStartActivity:(id)a3
{
  id v4 = a3;
  analyticsQueue = self->_analyticsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010508;
  v7[3] = &unk_10002C8B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)analyticsQueue, v7);
}

- (void)activityDidCompleteSending:(id)a3
{
  id v4 = a3;
  analyticsQueue = self->_analyticsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010654;
  v7[3] = &unk_10002C8B8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)analyticsQueue, v7);
}

- (void)didFinishActivity:(id)a3 inSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyticsQueue = self->_analyticsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010790;
  block[3] = &unk_10002CC30;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)analyticsQueue, block);
}

- (void)didFinishSession:(id)a3
{
  id v4 = a3;
  analyticsQueue = self->_analyticsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000108D8;
  v7[3] = &unk_10002C8B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)analyticsQueue, v7);
}

- (void)saveSessionState
{
  v3 = [(PSDSchedulerCoreAnalyticsLogger *)self sessionState];
  id v4 = [(PSDSchedulerCoreAnalyticsLogger *)self sessionStateURL];
  id v5 = [v4 path];
  unsigned __int8 v6 = +[NSKeyedArchiver secureArchiveRootObject:v3 toFile:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = psd_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = psd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001C478(v9);
      }
    }
  }
}

- (void)clearSessionState
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(PSDSchedulerCoreAnalyticsLogger *)self sessionStateURL];
  id v11 = 0;
  unsigned __int8 v5 = [v3 removeItemAtURL:v4 error:&v11];
  id v6 = v11;

  if ((v5 & 1) == 0)
  {
    id v7 = psd_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = psd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001C9C0(v6, v9);
      }
    }
  }
  id v10 = objc_alloc_init(PSDSchedulerCoreAnalyticsSessionState);
  [(PSDSchedulerCoreAnalyticsLogger *)self setSessionState:v10];
}

- (void)logDurationForActivityWithIdentifier:(id)a3 bins:(int *)a4 binCount:(int)a5 inSession:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(PSDSchedulerCoreAnalyticsLogger *)self sessionState];
  id v13 = [(PSDSchedulerCoreAnalyticsLogger *)self updatedIdentifierForActivityIdentifier:v10];
  if ([v12 hasDurationForActivity:v10 milestone:1])
  {
    [v12 durationForActivity:v10 milestone:1];
    double v15 = v14;
    unint64_t v16 = vcvtpd_u64_f64(v14);
    long long v17 = -[PSDSchedulerCoreAnalyticsLogger binNameForDuration:bins:count:](self, "binNameForDuration:bins:count:", a4, v7);
    v27[0] = v13;
    v26[0] = @"activityIdentifier";
    v26[1] = @"duration";
    v18 = +[NSNumber numberWithUnsignedLongLong:v16];
    v26[2] = @"distribution";
    v27[1] = v18;
    v27[2] = v17;
    v19 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    v20 = [v19 mutableCopy];

    [v11 syncSessionType];
    v21 = NSStringfromPSYSyncSessionType();
    [v20 setObject:v21 forKeyedSubscript:@"syncType"];

    [(PSDSchedulerCoreAnalyticsLogger *)self _appendLinkInformationForActivity:v10 inEventInfo:v20 forEventDuration:v15];
    v22 = +[PSYRegistrySingleton registry];
    v23 = [v22 getActiveDevice];

    [(PSDSchedulerCoreAnalyticsLogger *)self _appendPairedWatchInforamtionToEvent:v20 withDevice:v23];
    [(PSDSchedulerCoreAnalyticsLogger *)self sendEvent:v20];

LABEL_6:
    goto LABEL_7;
  }
  v24 = psd_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

  if (v25)
  {
    v20 = psd_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10001CA58((uint64_t)v10, v20);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_appendLinkInformationForActivity:(id)a3 inEventInfo:(id)a4 forEventDuration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PSDSchedulerCoreAnalyticsLogger *)self sessionState];
  v26 = v8;
  id v11 = [v10 linkDurationsForActivity:v8];
  [(PSDSchedulerCoreAnalyticsLogger *)self _appendLinkAvailabilityForKey:@"amountOfTimeLinkOnBT" fromDictionary:v11 syncDuration:v9 intoDictionary:@"percentOfTimeLinkOnBT" outputKey:a5];
  [(PSDSchedulerCoreAnalyticsLogger *)self _appendLinkAvailabilityForKey:@"amountOfTimeLinkOnAWDL" fromDictionary:v11 syncDuration:v9 intoDictionary:@"percentOfTimeLinkOnAWDL" outputKey:a5];
  [(PSDSchedulerCoreAnalyticsLogger *)self _appendLinkAvailabilityForKey:@"amountOfTimeLinkOnInfraWiFi" fromDictionary:v11 syncDuration:v9 intoDictionary:@"percentOfTimeLinkOnInfraWiFi" outputKey:a5];
  [(PSDSchedulerCoreAnalyticsLogger *)self _appendLinkAvailabilityForKey:@"amountOfTimeLinkOnOther" fromDictionary:v11 syncDuration:v9 intoDictionary:@"percentOfTimeLinkOnOther" outputKey:a5];
  [(PSDSchedulerCoreAnalyticsLogger *)self _appendLinkAvailabilityForKey:@"amountOfTimeLinkInactive" fromDictionary:v11 syncDuration:v9 intoDictionary:@"percentOfTimeLinkInactive" outputKey:a5];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    int64_t v15 = 0;
    uint64_t v16 = *(void *)v28;
    float v17 = 0.0;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v20 = [v12 objectForKeyedSubscript:v19];
        [v20 floatValue];
        float v22 = v21;

        if (v22 > v17)
        {
          int64_t v15 = [(PSDSchedulerCoreAnalyticsLogger *)self _linkTypeForAmountOfTimeKey:v19];
          v23 = [v12 objectForKeyedSubscript:v19];
          [v23 floatValue];
          float v17 = v24;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }
  else
  {
    int64_t v15 = 0;
  }

  BOOL v25 = +[NSNumber numberWithInteger:v15];
  [v9 setObject:v25 forKeyedSubscript:@"linkType"];
}

- (int64_t)_linkTypeForAmountOfTimeKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"amountOfTimeLinkOnBT"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"amountOfTimeLinkOnAWDL"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"amountOfTimeLinkOnOther"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"amountOfTimeLinkOnInfraWiFi"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_appendLinkAvailabilityForKey:(id)a3 fromDictionary:(id)a4 syncDuration:(double)a5 intoDictionary:(id)a6 outputKey:(id)a7
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a7;
  id v13 = [v10 objectForKeyedSubscript:v17];

  if (v13)
  {
    id v14 = [v10 objectForKeyedSubscript:v17];
    [v14 doubleValue];
    int64_t v15 = +[PSDAnalyticsUtils binPercentageRangeForInputDuration:withTotalDuration:](PSDAnalyticsUtils, "binPercentageRangeForInputDuration:withTotalDuration:");

    [v11 setObject:v15 forKeyedSubscript:v12];
    uint64_t v16 = [v10 objectForKeyedSubscript:v17];
    [v11 setObject:v16 forKeyedSubscript:v17];
  }
}

- (void)_appendPairedWatchInforamtionToEvent:(id)a3 withDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 systemBuildVersion];
    id v9 = [v7 valueForProperty:PDRDevicePropertyKeyHWModelString];
    if ([v7 supportsCapability:1863581443]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    id v11 = +[NSNumber numberWithInt:v10];
    [v5 setObject:v11 forKeyedSubscript:@"syncVersion"];

    [v5 setObject:v8 forKeyedSubscript:@"pairedDeviceBuildVersion"];
    if ((unint64_t)[v8 length] >= 2)
    {
      id v12 = [v8 substringToIndex:2];
      [v5 setObject:v12 forKeyedSubscript:@"pairedDeviceBuildPrefix"];
    }
    [v5 setObject:v9 forKeyedSubscript:@"pairedDeviceModel"];
    id v13 = [v7 valueForProperty:PDRDevicePropertyKeyIsInternalInstall];
    [v5 setObject:v13 forKeyedSubscript:@"pairedDeviceHasInternalInstall"];
  }
  else
  {
    id v14 = psd_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (!v15) {
      goto LABEL_9;
    }
    id v8 = psd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "skipping adding paired device information as device is nil", v16, 2u);
    }
  }

LABEL_9:
}

- (void)sendEvent:(id)a3
{
  id v3 = (char *)a3;
  int64_t v4 = psd_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    if (v5)
    {
      id v6 = psd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PSDSchedulerCoreAnalyticsLogger Sending Event: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    AnalyticsSendEvent();
  }
  else if (v5)
  {
    uint64_t v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[PSDSchedulerCoreAnalyticsLogger sendEvent:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: No event passed.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)updatedIdentifierForActivityIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"pairedsync.%@", a3];
}

- (id)binNameForDuration:(double)a3 bins:(int *)a4 count:(int)a5
{
  if (a5 < 1)
  {
LABEL_5:
    +[NSString stringWithFormat:@">%d", a3, a4[a5 - 1], v10];
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0xFFFFFFFF00000000;
    while (1)
    {
      uint64_t v7 = a4[v5];
      if ((double)(int)v7 > a3) {
        break;
      }
      ++v5;
      v6 += (uint64_t)&_mh_execute_header;
      if (a5 == v5) {
        goto LABEL_5;
      }
    }
    if (v5 * 4) {
      +[NSString stringWithFormat:@"%d-%d", a3, *(unsigned int *)((char *)a4 + (v6 >> 30)), v7];
    }
    else {
      +[NSString stringWithFormat:@"<%d", a3, *a4, v10];
    }
  int v8 = };

  return v8;
}

- (PSDSchedulerCoreAnalyticsSessionState)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
}

- (NSURL)sessionStateURL
{
  return self->_sessionStateURL;
}

- (void)setSessionStateURL:(id)a3
{
}

- (int64_t)currentLinkType
{
  return self->_currentLinkType;
}

- (void)setCurrentLinkType:(int64_t)a3
{
  self->_int64_t currentLinkType = a3;
}

- (NSDate)currentLinkStartTime
{
  return self->_currentLinkStartTime;
}

- (void)setCurrentLinkStartTime:(id)a3
{
}

- (PSYLinkUpgradeMonitor)linkUpgradeMonitor
{
  return self->_linkUpgradeMonitor;
}

- (void)setLinkUpgradeMonitor:(id)a3
{
}

- (NSMutableSet)activeSyncTopics
{
  return self->_activeSyncTopics;
}

- (void)setActiveSyncTopics:(id)a3
{
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (void)setAnalyticsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_activeSyncTopics, 0);
  objc_storeStrong((id *)&self->_linkUpgradeMonitor, 0);
  objc_storeStrong((id *)&self->_currentLinkStartTime, 0);
  objc_storeStrong((id *)&self->_sessionStateURL, 0);

  objc_storeStrong((id *)&self->_sessionState, 0);
}

@end