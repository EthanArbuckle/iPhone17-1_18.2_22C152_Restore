@interface WiFiMaintenanceTaskManager
+ (id)sharedWiFiMaintenanceTaskManager;
- (AnalyticsWorkspace)symptomsAnalyticsWorkspace;
- (NetworkPerformanceFeed)symptomsNetworkHistoryFeed;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serialQForNetworkPerformanceFeed;
- (WiFiMaintenanceTaskManager)init;
- (__WiFiManager)wifiManager;
- (void)dealloc;
- (void)networkPerformanceFeedSync;
- (void)schedule3BarsObserver;
- (void)scheduleHistoricNetworkPerformanceFeedSync;
- (void)scheduleOrphanedSetsCleanUp;
- (void)scheduleOutdatedListEntriesCleanUp;
- (void)schedulePNLMigration;
- (void)scheduleWCADownloadObserver;
- (void)setQueue:(id)a3;
- (void)setSerialQForNetworkPerformanceFeed:(id)a3;
- (void)setSymptomsAnalyticsWorkspace:(id)a3;
- (void)setSymptomsNetworkHistoryFeed:(id)a3;
- (void)setWifiManager:(__WiFiManager *)a3;
- (void)unSchedule3BarsObserver;
- (void)unScheduleHistoricNetworkPerformanceFeedSync;
- (void)unScheduleOrphanedSetsCleanUp;
- (void)unScheduleOutdatedListEntriesCleanUp;
- (void)unSchedulePNLMigration;
- (void)unScheduleWCADownloadObserver;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation WiFiMaintenanceTaskManager

+ (id)sharedWiFiMaintenanceTaskManager
{
  if (qword_10027D618 != -1) {
    dispatch_once(&qword_10027D618, &stru_10023F288);
  }
  return (id)qword_10027D610;
}

- (void)dealloc
{
  serialQForNetworkPerformanceFeed = self->_serialQForNetworkPerformanceFeed;
  if (serialQForNetworkPerformanceFeed) {
    dispatch_release(serialQForNetworkPerformanceFeed);
  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiMaintenanceTaskManager;
  [(WiFiMaintenanceTaskManager *)&v4 dealloc];
}

- (WiFiMaintenanceTaskManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)WiFiMaintenanceTaskManager;
  v2 = [(WiFiMaintenanceTaskManager *)&v10 init];
  if (v2)
  {
    if (!objc_opt_class()) {
      return 0;
    }
    id v3 = objc_alloc((Class)AnalyticsWorkspace);
    objc_super v4 = (AnalyticsWorkspace *)[v3 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
    v2->_symptomsAnalyticsWorkspace = v4;
    if (v4)
    {
      if (!objc_opt_class()) {
        return 0;
      }
      v5 = (NetworkPerformanceFeed *)[objc_alloc((Class)NetworkPerformanceFeed) initWithWorkspace:v2->_symptomsAnalyticsWorkspace];
      v2->_symptomsNetworkHistoryFeed = v5;
      if (v5)
      {
        v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifid.networkStoreController.symptomsReplyQ", v6);
        v2->_serialQForNetworkPerformanceFeed = (OS_dispatch_queue *)v7;
        if (v7)
        {
          [(NetworkPerformanceFeed *)[(WiFiMaintenanceTaskManager *)v2 symptomsNetworkHistoryFeed] setQueue:[(WiFiMaintenanceTaskManager *)v2 serialQForNetworkPerformanceFeed]];
          return v2;
        }
        return 0;
      }
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3 message:@"%s: Failed in initWithWorkspace" : @"-[WiFiMaintenanceTaskManager init]"];
      }
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:4, @"%s: Failed in initWorkspaceWithService!", @"-[WiFiMaintenanceTaskManager init]"];
      }
    }
    return 0;
  }
  return v2;
}

- (void)unscheduleFromQueue:(id)a3
{
}

- (void)unScheduleOrphanedSetsCleanUp
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiMaintenanceTaskManager unScheduleOrphanedSetsCleanUp]"];
  }

  xpc_activity_unregister("com.apple.wifimanager.OrphanedSetsCleanUpActivity");
}

- (void)scheduleOrphanedSetsCleanUp
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager scheduleOrphanedSetsCleanUp]");
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000434EC;
  handler[3] = &unk_10023F2B0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.OrphanedSetsCleanUpActivity", v4, handler);
  xpc_release(v4);
}

- (void)unScheduleOutdatedListEntriesCleanUp
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiMaintenanceTaskManager unScheduleOutdatedListEntriesCleanUp]"];
  }

  xpc_activity_unregister("com.apple.wifimanager.OutdatedListEntriesCleanUpActivity");
}

- (void)scheduleOutdatedListEntriesCleanUp
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiMaintenanceTaskManager scheduleOutdatedListEntriesCleanUp]"];
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_8_HOURS);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000438A0;
  handler[3] = &unk_10023F2B0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.OutdatedListEntriesCleanUpActivity", v4, handler);
  xpc_release(v4);
}

- (void)schedule3BarsObserver
{
  if (qword_10027DD68) {
    [qword_10027DD68 WFLog:3 message:@"-[WiFiMaintenanceTaskManager schedule3BarsObserver]"];
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_PREVENT_DEVICE_SLEEP, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100043C24;
  handler[3] = &unk_10023F2B0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.3BarsObserverActivity", v4, handler);
  xpc_release(v4);
}

- (void)unSchedule3BarsObserver
{
  if (qword_10027DD68) {
    [qword_10027DD68 WFLog:3 message:@"-[WiFiMaintenanceTaskManager unSchedule3BarsObserver]"];
  }

  xpc_activity_unregister("com.apple.wifimanager.3BarsObserverActivity");
}

- (void)unSchedulePNLMigration
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unSchedulePNLMigration]");
  }

  xpc_activity_unregister("com.apple.wifimanager.ListMigrationActivity");
}

- (void)schedulePNLMigration
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiMaintenanceTaskManager schedulePNLMigration]"];
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100044060;
  handler[3] = &unk_10023F2B0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.ListMigrationActivity", v4, handler);
  xpc_release(v4);
}

- (void)unScheduleHistoricNetworkPerformanceFeedSync
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiMaintenanceTaskManager unScheduleHistoricNetworkPerformanceFeedSync]");
  }

  xpc_activity_unregister("com.apple.wifimanager.HistoricNetworkPerformanceFeedActivity");
}

- (void)scheduleHistoricNetworkPerformanceFeedSync
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiMaintenanceTaskManager scheduleHistoricNetworkPerformanceFeedSync]"];
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 10080 * XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)((double)XPC_ACTIVITY_INTERVAL_1_MIN * 720.0));
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004442C;
  handler[3] = &unk_10023F2B0;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.HistoricNetworkPerformanceFeedActivity", v4, handler);
  xpc_release(v4);
}

- (void)networkPerformanceFeedSync
{
  id v2 = [[+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager") copyAllStoredNetworkSsids];
  id v3 = +[NSMutableArray array];
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: step 1 - syncing scores for %d networks", "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]", objc_msgSend(v2, "count"));
  }
  v5 = dispatch_semaphore_create(0);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [v2 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    uint64_t v9 = kSymptomAnalyticsServiceNetworkAttachmentHistorical;
    id obj = v2;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        id v11 = v3;
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v25 = v9;
        uint64_t v26 = v12;
        v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: step 2 - getting perf feed for %@", "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]", v12 message];
        }
        v15 = [(WiFiMaintenanceTaskManager *)self symptomsNetworkHistoryFeed];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10004479C;
        v20[3] = &unk_10023F2D8;
        v20[4] = v13;
        v20[5] = v12;
        id v3 = v11;
        v20[6] = v11;
        v20[7] = v5;
        if ([(NetworkPerformanceFeed *)v15 fullScorecardFor:1 options:v13 reply:v20])dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL); {
      }
        }
      id v2 = obj;
      id v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }
  if ([v3 count])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: step 3 - Submit syncd network performance feed for %d networks", "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]", objc_msgSend(v3, "count"));
    }
    sub_100057530((uint64_t)v3);
  }
  dispatch_release(v5);
  if (v2) {
    CFRelease(v2);
  }
}

- (void)scheduleWCADownloadObserver
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_activity_register("com.apple.wifimanager.wcaDownloadActivity", v2, &stru_10023F318);

  xpc_release(v2);
}

- (void)unScheduleWCADownloadObserver
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiMaintenanceTaskManager unScheduleWCADownloadObserver]"];
  }

  xpc_activity_unregister("com.apple.wifimanager.wcaDownloadActivity");
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (AnalyticsWorkspace)symptomsAnalyticsWorkspace
{
  return self->_symptomsAnalyticsWorkspace;
}

- (void)setSymptomsAnalyticsWorkspace:(id)a3
{
}

- (NetworkPerformanceFeed)symptomsNetworkHistoryFeed
{
  return self->_symptomsNetworkHistoryFeed;
}

- (void)setSymptomsNetworkHistoryFeed:(id)a3
{
}

- (OS_dispatch_queue)serialQForNetworkPerformanceFeed
{
  return self->_serialQForNetworkPerformanceFeed;
}

- (void)setSerialQForNetworkPerformanceFeed:(id)a3
{
}

@end