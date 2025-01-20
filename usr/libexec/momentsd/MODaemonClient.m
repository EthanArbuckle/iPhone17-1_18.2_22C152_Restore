@interface MODaemonClient
+ (id)getRefreshVariantName:(unint64_t)a3;
- (BOOL)acquireRefreshLock;
- (BOOL)validateIfActiveClientHasAnyEntitlementInArray:(id)a3 withErrorHandler:(id)a4;
- (MOConfigurationManager)configManager;
- (MODaemonClient)initWithUniverse:(id)a3;
- (MODaemonClientConnectionEntitlementDelegate)entitlementDelegate;
- (MODaemonSPINotifier)notifier;
- (MODataAccessManager)dataAccessManager;
- (MODefaultsManager)defaultsManager;
- (MOEngagementHistoryManager)engagementHistoryManager;
- (MOEventBundleManager)eventBundleManager;
- (MOEventManager)eventManager;
- (MOEvergreenAnnotationManager)evergreenManager;
- (MONotificationsManager)notificationsManager;
- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence;
- (MOPersistenceManager)persistenceManager;
- (NSLock)scheduledTaskLock;
- (OS_dispatch_queue)externalQueue;
- (OS_dispatch_queue)internalQueue;
- (id)_createWatchDogWithName:(id)a3;
- (void)_abortIfNeeded:(id)a3;
- (void)_analyzeTrendsInEvents:(id)a3 withContext:(id)a4 andRefreshVariant:(unint64_t)a5 andHandler:(id)a6;
- (void)_bundleEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)_checkElegibilityAndRequestDataExportForTrigger:(unint64_t)a3 withFeedback:(id)a4 requestUpload:(BOOL)a5 refreshVariant:(unint64_t)a6 context:(id)a7 reply:(id)a8;
- (void)_clearEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)_collectEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)_fetchEventBundlesWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5;
- (void)_fetchEventsWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5;
- (void)_getApplicationsWithDataAccess:(id)a3;
- (void)_getClientsWithDataAccess:(id)a3;
- (void)_getDiagnosticReporterConfiguration:(id)a3;
- (void)_getSnapshotDictionaryForAnalyticsWithHandler:(id)a3;
- (void)_isAllowedToPromptEventCategory:(unint64_t)a3 withReply:(id)a4;
- (void)_isAllowedToPromptResourceType:(unint64_t)a3 withReply:(id)a4;
- (void)_logEngagementEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5;
- (void)_printOnboardingStatusAnalytics:(id)a3;
- (void)_printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5;
- (void)_purgeEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)_refreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andSoftKindFlag:(BOOL)a5 andHandler:(id)a6;
- (void)_registerApplicationsForDataAccess:(id)a3;
- (void)_registerClientsForDataAccess:(id)a3;
- (void)_runAnalyticsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)_scheduleDatabaseUpgradeWithContext:(id)a3 andHandler:(id)a4;
- (void)_scheduleSendBarrierBlock:(id)a3;
- (void)_storeEvents:(id)a3 withContext:(id)a4 andHandler:(id)a5;
- (void)acquireBackgroundProcessingPermissionsForMomentsWithHander:(id)a3;
- (void)analyzeTrendsInEvents:(id)a3 withContext:(id)a4 andRefreshVariant:(unint64_t)a5 andHandler:(id)a6;
- (void)bundleEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)checkElegibilityAndRequestDataExportForTrigger:(unint64_t)a3 withFeedback:(id)a4 requestUpload:(BOOL)a5 reply:(id)a6;
- (void)clearEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)collectEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)didAppEntryUpdateUsingSuggestions:(id)a3 onEvent:(unint64_t)a4 duringInterval:(id)a5 withInfo:(id)a6;
- (void)fetchEventBundlesWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5;
- (void)fetchEventsWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5;
- (void)fetchPhotoAnalyticsMetricsWithContext:(id)a3 andHandler:(id)a4;
- (void)finalizeClientTaskWithName:(id)a3;
- (void)getApplicationsWithDataAccess:(id)a3;
- (void)getClientsWithDataAccess:(id)a3;
- (void)getDiagnosticReporterConfiguration:(id)a3;
- (void)getMomentsNotificationsSchedule:(id)a3;
- (void)getOnboardingFlowCompletionStatusWithHandler:(id)a3;
- (void)getOnboardingFlowRefreshCompletionStatusWithHandler:(id)a3;
- (void)getSnapshotDictionaryForAnalyticsWithHandler:(id)a3;
- (void)getStateForSetting:(unint64_t)a3 withHandler:(id)a4;
- (void)getStateForSettingFast:(unint64_t)a3 withHandler:(id)a4;
- (void)getTimeToWriteNotificationsApplicationScheduleWithContext:(id)a3 andHandler:(id)a4;
- (void)isAllowedToPromptEventCategory:(unint64_t)a3 withReply:(id)a4;
- (void)isAllowedToPromptResourceType:(unint64_t)a3 withReply:(id)a4;
- (void)logEngagementEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5;
- (void)logPerformanceEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5;
- (void)logUsageEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5;
- (void)printEvergreenBundlesWithSeed:(unint64_t)a3 handler:(id)a4;
- (void)printOnboardingStatusAnalytics:(id)a3;
- (void)printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5;
- (void)purgeEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)refreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)registerApplicationsForDataAccess:(id)a3;
- (void)registerClientsForDataAccess:(id)a3;
- (void)releaseRefreshLock;
- (void)runAnalyticsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)scheduleClientTask:(id)a3 withName:(id)a4;
- (void)scheduleDatabaseUpgradeWithContext:(id)a3 andDelegate:(id)a4;
- (void)scheduleInternalClientTask:(id)a3 withName:(id)a4;
- (void)scheduleInternalClientTask:(id)a3 withName:(id)a4 andAllowHandoffReplayQueue:(BOOL)a5;
- (void)setConfigManager:(id)a3;
- (void)setDataAccessManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setEngagementHistoryManager:(id)a3;
- (void)setEntitlementDelegate:(id)a3;
- (void)setEventBundleManager:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setEvergreenManager:(id)a3;
- (void)setNotificationsManager:(id)a3;
- (void)setOnboardingAndSettingsPersistence:(id)a3;
- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4;
- (void)setupMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setupPeriodicTimeToWriteMomentsNotificationsForApplication:(id)a3 usingDateComponents:(id)a4 withActionURL:(id)a5 withContext:(id)a6 andHandler:(id)a7;
- (void)softRefreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5;
- (void)softRefreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andIgnoreLastTrigger:(BOOL)a5 andHandler:(id)a6;
- (void)storeEvents:(id)a3 withContext:(id)a4 andHandler:(id)a5;
- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4;
- (void)triggerFeedbackAssistantFlow:(id)a3 handler:(id)a4;
@end

@implementation MODaemonClient

+ (id)getRefreshVariantName:(unint64_t)a3
{
  CFStringRef v3 = @"Full";
  CFStringRef v4 = @"Reset";
  if (a3 != 0xFFFF) {
    CFStringRef v4 = 0;
  }
  if (a3 != 1280) {
    CFStringRef v3 = v4;
  }
  CFStringRef v5 = @"Default";
  if (a3 != 768) {
    CFStringRef v5 = 0;
  }
  if (a3 == 512) {
    CFStringRef v5 = @"Light";
  }
  if ((uint64_t)a3 <= 1279) {
    CFStringRef v3 = v5;
  }
  CFStringRef v6 = @"SettingsChange";
  if (a3 != 336) {
    CFStringRef v6 = 0;
  }
  if (a3 == 256) {
    CFStringRef v6 = @"Onboarding";
  }
  if (!a3) {
    CFStringRef v6 = @"Unknown";
  }
  if ((uint64_t)a3 <= 511) {
    return (id)v6;
  }
  else {
    return (id)v3;
  }
}

- (MODaemonClient)initWithUniverse:(id)a3
{
  id v5 = a3;
  CFStringRef v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v5 getService:v10];

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  id obj = [v5 getService:v13];

  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  id v57 = [v5 getService:v15];

  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  id v56 = [v5 getService:v17];

  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  v20 = [v5 getService:v19];

  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [v5 getService:v22];

  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  v26 = [v5 getService:v25];

  v27 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v27);
  v29 = [v5 getService:v28];

  if (!v8)
  {
    v47 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[MODaemonClient initWithUniverse:]();
    }

    v48 = +[NSAssertionHandler currentHandler];
    v49 = v48;
    CFStringRef v50 = @"Invalid parameter not satisfying: eventManager";
    SEL v51 = a2;
    v52 = self;
    uint64_t v53 = 131;
    goto LABEL_12;
  }
  if (!v11)
  {
    v54 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      -[MODaemonClient initWithUniverse:]();
    }

    v48 = +[NSAssertionHandler currentHandler];
    v49 = v48;
    CFStringRef v50 = @"Invalid parameter not satisfying: eventBundleManager";
    SEL v51 = a2;
    v52 = self;
    uint64_t v53 = 132;
LABEL_12:
    [v48 handleFailureInMethod:v51 object:v52 file:@"MODaemonClient.m" lineNumber:v53 description:v50];

    v46 = 0;
    goto LABEL_13;
  }
  v59.receiver = self;
  v59.super_class = (Class)MODaemonClient;
  v30 = [(MODaemonClient *)&v59 init];
  if (v30)
  {
    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("MODaemonClient.internal", v31);
    internalQueue = v30->_internalQueue;
    v30->_internalQueue = (OS_dispatch_queue *)v32;

    v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v35 = dispatch_queue_create("MODaemonClient.external", v34);
    externalQueue = v30->_externalQueue;
    v30->_externalQueue = (OS_dispatch_queue *)v35;

    v30->_refreshLock = 0;
    uint64_t v37 = objc_opt_new();
    scheduledTaskLock = v30->_scheduledTaskLock;
    v30->_scheduledTaskLock = (NSLock *)v37;

    objc_storeStrong((id *)&v30->_eventManager, v8);
    objc_storeStrong((id *)&v30->_configManager, obj);
    objc_storeStrong((id *)&v30->_dataAccessManager, v57);
    objc_storeStrong((id *)&v30->_defaultsManager, v56);
    objc_storeStrong((id *)&v30->_eventBundleManager, v11);
    v39 = [[MOEvergreenAnnotationManager alloc] initWithUniverse:v5];
    evergreenManager = v30->_evergreenManager;
    v30->_evergreenManager = v39;

    objc_storeStrong((id *)&v30->_engagementHistoryManager, v20);
    objc_storeStrong((id *)&v30->_onboardingAndSettingsPersistence, v23);
    objc_storeStrong((id *)&v30->_notificationsManager, v26);
    v41 = [[MODaemonSPINotifier alloc] initWithName:@"DaemonClient"];
    notifier = v30->_notifier;
    v30->_notifier = v41;

    LODWORD(v43) = 10.0;
    [(MOConfigurationManagerBase *)v30->_configManager getFloatSettingForKey:@"WatchdogOverrideDefaultCadenceInSeconds" withFallback:v43];
    v30->_watchdogCadence = v44;
    objc_storeStrong((id *)&v30->_persistenceManager, v29);
    v45 = +[MODiagnosticReporter defaultReporter];
    [v45 configureWithDaemonClient:v30];
  }
  self = v30;
  v46 = self;
LABEL_13:

  return v46;
}

- (void)_scheduleSendBarrierBlock:(id)a3
{
  CFStringRef v3 = (void (**)(void))a3;
  CFStringRef v4 = +[NSXPCConnection currentConnection];
  id v5 = v4;
  if (v4) {
    [v4 scheduleSendBarrierBlock:v3];
  }
  else {
    v3[2](v3);
  }
}

- (void)scheduleClientTask:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Client Task Scheduled [%@]", (uint8_t *)&v14, 0xCu);
  }

  v9 = [(MODaemonClient *)self configManager];
  unsigned __int8 v10 = [v9 getBoolSettingForKey:@"ClientOverrideAvoidQuerySerialization" withFallback:0];

  if ((v10 & 1) == 0) {
    [(NSLock *)self->_scheduledTaskLock lock];
  }
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Client Task Started [%@]", (uint8_t *)&v14, 0xCu);
  }

  v12 = +[NSXPCConnection currentConnection];
  v13 = [(MODaemonClient *)self externalQueue];
  if (v12) {
    +[NSXPCConnection _handoffCurrentReplyToQueue:v13 block:v6];
  }
  else {
    dispatch_async(v13, v6);
  }
}

- (void)scheduleInternalClientTask:(id)a3 withName:(id)a4
{
}

- (void)scheduleInternalClientTask:(id)a3 withName:(id)a4 andAllowHandoffReplayQueue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Internal Client Task Scheduled [%@]", (uint8_t *)&v16, 0xCu);
  }

  v11 = [(MODaemonClient *)self configManager];
  unsigned __int8 v12 = [v11 getBoolSettingForKey:@"ClientOverrideAvoidQuerySerialization" withFallback:0];

  if ((v12 & 1) == 0) {
    [(NSLock *)self->_scheduledTaskLock lock];
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Internal Client Task Started [%@]", (uint8_t *)&v16, 0xCu);
  }

  int v14 = +[NSXPCConnection currentConnection];
  if (v14 && v5)
  {
    id v15 = [(MODaemonClient *)self internalQueue];
    +[NSXPCConnection _handoffCurrentReplyToQueue:v15 block:v8];
  }
  else
  {
    id v15 = [(MODaemonClient *)self internalQueue];
    dispatch_async(v15, v8);
  }
}

- (void)finalizeClientTaskWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MODaemonClient *)self configManager];
  unsigned __int8 v6 = [v5 getBoolSettingForKey:@"ClientOverrideAvoidQuerySerialization" withFallback:0];

  if ((v6 & 1) == 0) {
    [(NSLock *)self->_scheduledTaskLock unlock];
  }
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Client Task Completed [%@]", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)validateIfActiveClientHasAnyEntitlementInArray:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a3;
  v21 = (void (**)(id, void *))a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    LODWORD(v10) = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        int v14 = [(MODaemonClient *)self entitlementDelegate];
        id v15 = +[NSXPCConnection currentConnection];
        LODWORD(v10) = v10 | [v14 clientConnection:v15 hasInternalEntitlement:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  if (v21 && (v10 & 1) == 0)
  {
    id v17 = [(MODaemonClient *)self _createWatchDogWithName:@"entitlementErrorResponse"];
    NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
    v18 = +[NSString stringWithFormat:@"missing Moments internal entitlement - requires any in %@", v7];
    v27 = v18;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v19 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:v10];

    [v17 pet];
    v21[2](v21, v19);
    [v17 cancel];

    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

- (void)_abortIfNeeded:(id)a3
{
  id v6 = a3;
  id v4 = [(MODaemonClient *)self configManager];
  unsigned int v5 = [v4 getIntegerSettingForKey:v6 withFallback:0];

  if (v5 == 1) {
    abort();
  }
}

- (void)storeEvents:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned __int8 v12 = NSStringFromSelector(a2);
  uint64_t v13 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  int v14 = [v12 stringByTrimmingCharactersInSet:v13];

  id v15 = +[NSString stringWithFormat:@"InterruptMethod_%@", v14];
  [(MODaemonClient *)self _abortIfNeeded:v15];
  CFStringRef v22 = @"MOStoreEvents";
  int v16 = +[NSArray arrayWithObjects:&v22 count:1];
  unsigned int v17 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v16 withErrorHandler:v11];

  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke;
    v18[3] = &unk_1002C9A78;
    v18[4] = self;
    id v19 = v9;
    id v20 = v10;
    id v21 = v11;
    [(MODaemonClient *)self scheduleInternalClientTask:v18 withName:@"storeEvents"];
  }
}

void __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke_2;
  v6[3] = &unk_1002CD928;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _storeEvents:v3 withContext:v4 andHandler:v6];
}

id __53__MODaemonClient_storeEvents_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"storeEvents"];
}

- (void)_storeEvents:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__18;
  v23[4] = __Block_byref_object_dispose__18;
  id v24 = (id)os_transaction_create();
  unsigned __int8 v12 = [(MODaemonClient *)self _createWatchDogWithName:@"StoreEvents"];
  uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "store events", buf, 2u);
  }

  eventManager = self->_eventManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke;
  v17[3] = &unk_1002CD978;
  id v15 = v12;
  id v18 = v15;
  id v16 = v10;
  id v20 = v16;
  id v21 = v23;
  id v19 = self;
  [(MOEventManager *)eventManager storeEvents:v8 handler:v17];

  _Block_object_dispose(v23, 8);
}

void __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) pet];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke_2;
  id v11 = &unk_1002CD950;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v12 = v5;
  uint64_t v13 = v6;
  id v7 = objc_retainBlock(&v8);
  [*(id *)(a1 + 40) _scheduleSendBarrierBlock:v7, v8, v9, v10, v11];
}

void __54__MODaemonClient__storeEvents_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)scheduleDatabaseUpgradeWithContext:(id)a3 andDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = NSStringFromSelector(a2);
  id v10 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v11 = [v9 stringByTrimmingCharactersInSet:v10];

  id v12 = +[NSString stringWithFormat:@"InterruptMethod_%@", v11];
  [(MODaemonClient *)self _abortIfNeeded:v12];
  CFStringRef v28 = @"MOScheduleDatabaseUpgrade";
  uint64_t v13 = +[NSArray arrayWithObjects:&v28 count:1];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke;
  v24[3] = &unk_1002CD9A0;
  id v14 = v8;
  id v25 = v14;
  unsigned int v15 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v13 withErrorHandler:v24];

  if (v15)
  {
    if ([(MODaemonClient *)self acquireRefreshLock])
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_242;
      v20[3] = &unk_1002CD9F0;
      v20[4] = self;
      id v21 = v7;
      id v22 = v14;
      [(MODaemonClient *)self scheduleInternalClientTask:v20 withName:@"scheduleDatabaseUpgradeWithContext" andAllowHandoffReplayQueue:0];
    }
    else
    {
      id v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "RefreshLock is in use. Drop the refresh.", buf, 2u);
      }

      id v17 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"The refresh is dropped due to an existing refresh.";
      id v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v19 = [v17 initWithDomain:@"MODaemonClient" code:0 userInfo:v18];

      [v14 didUpdateWithStatus:0 andError:v19];
    }
  }
}

id __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didUpdateWithStatus:0 andError:a2];
}

void __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_242(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_2;
  v6[3] = &unk_1002CD9C8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _scheduleDatabaseUpgradeWithContext:v3 andHandler:v6];
}

void __65__MODaemonClient_scheduleDatabaseUpgradeWithContext_andDelegate___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSNumber numberWithUnsignedInteger:a2];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithContext with status %@", (uint8_t *)&v9, 0xCu);
  }
  if (a2 <= 4)
  {
    if (a2 == 2)
    {
      [*(id *)(a1 + 32) didUpdateWithStatus:2 andError:v5];
      goto LABEL_9;
    }
    [*(id *)(a1 + 32) didUpdateWithStatus:a2 andError:v5];
  }
  [*(id *)(a1 + 40) releaseRefreshLock];
  [*(id *)(a1 + 40) finalizeClientTaskWithName:@"scheduleDatabaseUpgradeWithContext"];
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithContext completed", (uint8_t *)&v9, 2u);
  }

LABEL_9:
}

- (void)_scheduleDatabaseUpgradeWithContext:(id)a3 andHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
  unsigned int v9 = [v8 isAllowedToCollectAndCompute];

  id v10 = [(MODaemonClient *)self configManager];
  unsigned int v11 = [v10 getBoolSettingForKey:@"EventRefreshSchedulerOverrideForceFullRefreshAtBoot" withFallback:0];

  id v12 = [(MODaemonClient *)self configManager];
  unsigned int v13 = [v12 getBoolSettingForKey:@"EventRefreshSchedulerOverrideAvoidFullRefreshAtBoot" withFallback:0];

  id v14 = [(MODaemonClient *)self configManager];
  unsigned int v15 = [v14 getBoolSettingForKey:@"EventRefreshSchedulerOverrideAllowFullRefreshAtBoot" withFallback:1];

  if (!v9) {
    goto LABEL_15;
  }
  if ((+[MOPlatformInfo wasBuildVersionUpdated] & v15 & (v13 ^ 1) | v11) != 1)
  {
    unsigned __int8 v20 = +[MOPlatformInfo wasBuildVersionUpdated];
    id v21 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        long long v23 = "Refresh.First: build upgrade was detected but overrides prevent this task to run, skipped!";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v23, buf, 2u);
      }
    }
    else if (v22)
    {
      *(_WORD *)buf = 0;
      long long v23 = "Refresh.First: no build upgrade detected, skipped!";
      goto LABEL_13;
    }

LABEL_15:
    v7[2](v7, 1, 0);
    goto LABEL_16;
  }
  id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0x500uLL, "XPCRefreshDatabaseUpgrade", "", buf, 2u);
  }

  id v17 = [[MOPerformanceMeasurement alloc] initWithName:@"ScheduledRefreshFirstWrapper" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v17 startSession];
  v7[2](v7, 2, 0);
  id v18 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v28 = @"com.apple.momentsd.eventRefresh.first";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ detected build upgrade", buf, 0xCu);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __65__MODaemonClient__scheduleDatabaseUpgradeWithContext_andHandler___block_invoke;
  v24[3] = &unk_1002CD928;
  id v25 = v17;
  NSErrorUserInfoKey v26 = v7;
  id v19 = v17;
  [(MODaemonClient *)self _refreshEventsWithContext:v6 andRefreshVariant:1280 andSoftKindFlag:0 andHandler:v24];

LABEL_16:
}

void __65__MODaemonClient__scheduleDatabaseUpgradeWithContext_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    +[MOPlatformInfo persistBuildVersion];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0x500uLL, "XPCRefreshDatabaseUpgrade", "", v5, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

- (void)fetchEventsWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = NSStringFromSelector(a2);
  unsigned int v13 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v14 = [v12 stringByTrimmingCharactersInSet:v13];

  unsigned int v15 = +[NSString stringWithFormat:@"InterruptMethod_%@", v14];
  [(MODaemonClient *)self _abortIfNeeded:v15];
  CFStringRef v25 = @"MOFetchEvents";
  id v16 = +[NSArray arrayWithObjects:&v25 count:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke;
  v23[3] = &unk_1002CDA18;
  id v17 = v11;
  id v24 = v17;
  unsigned int v18 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v16 withErrorHandler:v23];

  if (v18)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_2;
    v19[3] = &unk_1002C9A78;
    v19[4] = self;
    id v20 = v9;
    id v21 = v10;
    id v22 = v17;
    [(MODaemonClient *)self scheduleInternalClientTask:v19 withName:@"fetchEventsWithOptions"];
  }
}

uint64_t __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_3;
  v6[3] = &unk_1002CAD10;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _fetchEventsWithOptions:v3 withContext:v4 andHandler:v6];
}

id __64__MODaemonClient_fetchEventsWithOptions_withContext_andHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"fetchEventsWithOptions"];
}

- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSStringFromSelector(a2);
  id v10 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v11 = [v9 stringByTrimmingCharactersInSet:v10];

  id v12 = +[NSString stringWithFormat:@"InterruptMethod_%@", v11];
  [(MODaemonClient *)self _abortIfNeeded:v12];
  v28[0] = @"MOUserNotifications";
  v28[1] = @"MOPromptManagerTest";
  unsigned int v13 = +[NSArray arrayWithObjects:v28 count:2];
  LODWORD(v10) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v13 withErrorHandler:v8];

  if (v10)
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__18;
    v26[4] = __Block_byref_object_dispose__18;
    id v27 = (id)os_transaction_create();
    unsigned int v15 = [(MODaemonClient *)self _createWatchDogWithName:@"testMomentsNotifications"];
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "testing moments notifications", buf, 2u);
    }

    id v17 = [(MODaemonClient *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke;
    block[3] = &unk_1002CDA68;
    id v20 = v15;
    id v21 = self;
    id v22 = v7;
    id v23 = v8;
    id v24 = v26;
    id v18 = v15;
    dispatch_async(v17, block);

    _Block_object_dispose(v26, 8);
  }
}

void __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) pet];
  uint64_t v2 = [*(id *)(a1 + 40) notificationsManager];
  uint64_t v3 = *(void *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke_2;
  v6[3] = &unk_1002CDA40;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v8 = v4;
  uint64_t v9 = v5;
  [v2 testMomentsNotificationsWithOptions:v3 handler:v6];
}

void __62__MODaemonClient_testMomentsNotificationsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 pet];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  [*(id *)(a1 + 32) cancel];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)setupPeriodicTimeToWriteMomentsNotificationsForApplication:(id)a3 usingDateComponents:(id)a4 withActionURL:(id)a5 withContext:(id)a6 andHandler:(id)a7
{
  uint64_t v9 = (void (**)(id, void *))a7;
  id v10 = NSStringFromSelector(a2);
  id v11 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v12 = [v10 stringByTrimmingCharactersInSet:v11];

  unsigned int v13 = +[NSString stringWithFormat:@"InterruptMethod_%@", v12];
  [(MODaemonClient *)self _abortIfNeeded:v13];
  CFStringRef v19 = @"MOUserNotifications";
  id v14 = +[NSArray arrayWithObjects:&v19 count:1];
  LODWORD(self) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v14 withErrorHandler:v9];

  if (self)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"Deprecated";
    unsigned int v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v16 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v15];

    v9[2](v9, v16);
  }
}

- (void)getMomentsNotificationsSchedule:(id)a3
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  id v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  uint64_t v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v25 = @"MOUserNotifications";
  id v10 = +[NSArray arrayWithObjects:&v25 count:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke;
  v23[3] = &unk_1002CDA18;
  id v11 = v5;
  id v24 = v11;
  unsigned int v12 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v23];

  if (v12)
  {
    id v14 = [(MODaemonClient *)self _createWatchDogWithName:@"getMomentsNotificationsSchedule"];
    unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "get notification schedule", buf, 2u);
    }

    id v16 = [(MODaemonClient *)self internalQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke_279;
    v18[3] = &unk_1002CAD38;
    id v19 = v14;
    id v20 = self;
    id v21 = v11;
    id v17 = v14;
    +[NSXPCConnection _handoffCurrentReplyToQueue:v16 block:v18];
  }
}

uint64_t __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __50__MODaemonClient_getMomentsNotificationsSchedule___block_invoke_279(uint64_t a1)
{
  [*(id *)(a1 + 32) pet];
  uint64_t v2 = [*(id *)(a1 + 40) notificationsManager];
  [v2 getMomentsNotificationsSchedule:*(void *)(a1 + 48)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 cancel];
}

- (void)setupMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned int v12 = NSStringFromSelector(a2);
  unsigned int v13 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v14 = [v12 stringByTrimmingCharactersInSet:v13];

  unsigned int v15 = +[NSString stringWithFormat:@"InterruptMethod_%@", v14];
  [(MODaemonClient *)self _abortIfNeeded:v15];
  CFStringRef v30 = @"MOUserNotifications";
  id v16 = +[NSArray arrayWithObjects:&v30 count:1];
  unsigned int v17 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v16 withErrorHandler:v11];

  if (v17)
  {
    id v19 = [(MODaemonClient *)self _createWatchDogWithName:@"setupMomentsNotificationsWithSchedule"];
    id v20 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "setup notifications with schedule", buf, 2u);
    }

    id v21 = [(MODaemonClient *)self internalQueue];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke;
    v23[3] = &unk_1002CA300;
    id v24 = v19;
    CFStringRef v25 = self;
    id v26 = v9;
    id v27 = v10;
    id v28 = v11;
    id v22 = v19;
    +[NSXPCConnection _handoffCurrentReplyToQueue:v21 block:v23];
  }
}

void __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) pet];
  uint64_t v2 = [*(id *)(a1 + 40) notificationsManager];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2;
  v5[3] = &unk_1002CDA90;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 64);
  [v2 setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:v3 options:v4 handler:v5];
}

id __72__MODaemonClient_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 pet];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  id v5 = *(void **)(a1 + 32);

  return [v5 cancel];
}

- (void)getTimeToWriteNotificationsApplicationScheduleWithContext:(id)a3 andHandler:(id)a4
{
  id v6 = a4;
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  id v10 = +[NSString stringWithFormat:@"InterruptMethod_%@", v9];
  [(MODaemonClient *)self _abortIfNeeded:v10];
  CFStringRef v19 = @"MOUserNotifications";
  id v11 = +[NSArray arrayWithObjects:&v19 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __87__MODaemonClient_getTimeToWriteNotificationsApplicationScheduleWithContext_andHandler___block_invoke;
  v15[3] = &unk_1002CDA18;
  id v12 = v6;
  id v16 = v12;
  LODWORD(self) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v11 withErrorHandler:v15];

  if (self)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"Deprecated";
    unsigned int v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v14 = +[NSError errorWithDomain:@"MOErrorDomain" code:5 userInfo:v13];

    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v14);
  }
}

uint64_t __87__MODaemonClient_getTimeToWriteNotificationsApplicationScheduleWithContext_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchEventsWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__18;
  v30[4] = __Block_byref_object_dispose__18;
  id v31 = (id)os_transaction_create();
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCFetchEvents", "", buf, 2u);
  }

  unsigned int v13 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCFetchEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v13 startSession];
  id v14 = [(MODaemonClient *)self _createWatchDogWithName:@"FetchEvents"];
  unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetch event with options", buf, 2u);
  }

  id v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    NSErrorUserInfoKey v17 = [v9 xpcProcessName];
    *(_DWORD *)buf = 138412290;
    v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "fetch XPC context [%@]", buf, 0xCu);
  }
  eventManager = self->_eventManager;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke;
  v23[3] = &unk_1002CDB20;
  id v19 = v14;
  id v24 = v19;
  id v20 = v9;
  id v25 = v20;
  id v26 = self;
  id v21 = v10;
  id v28 = v21;
  v29 = v30;
  id v22 = v13;
  id v27 = v22;
  [(MOEventManager *)eventManager fetchEventsWithOptions:v8 CompletionHandler:v23];

  _Block_object_dispose(v30, 8);
}

void __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) pet];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [*(id *)(a1 + 40) xpcProcessName];
  [v7 setObject:v8 forKey:@"triggerSource"];

  dispatch_queue_t v35 = v6;
  if (v6)
  {
    [v7 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  else
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
    [v7 setObject:v9 forKey:@"resultNumberOfEvents"];
  }
  v33 = v7;
  uint64_t v34 = a1;
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v47 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "the number of events fetched : %lu", buf, 0xCu);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  id v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        unsigned int v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          NSErrorUserInfoKey v17 = [v15 eventIdentifier];
          *(_DWORD *)buf = 138412290;
          id v47 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "events fetched : %@", buf, 0xCu);
        }
        CFStringRef v18 = [v15 extendedAttributes];

        if (v18)
        {
          id v19 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v20 = [v15 extendedAttributes];
            id v21 = [v20 description];
            *(_DWORD *)buf = 138412290;
            id v47 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "events extended attribute : %@", buf, 0xCu);
          }
        }
        id v22 = [v15 trends:v33];

        if (v22)
        {
          id v23 = [v15 trends];
          [v23 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_21];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v12);
  }

  id v24 = [*(id *)(v34 + 48) notifier];
  [v24 sendNotification:0 withPayload:v33];

  [*(id *)(v34 + 32) pet];
  id v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCFetchEventsCompletion", "", buf, 2u);
  }

  id v26 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCFetchEventsCompletion" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v26 startSession];
  uint64_t v27 = *(void *)(v34 + 64);
  if (v27) {
    (*(void (**)(uint64_t, id, void *))(v27 + 16))(v27, obj, v35);
  }
  id v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCFetchEventsCompletion", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v26 endSession];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke_296;
  v37[3] = &unk_1002CDAF8;
  id v29 = *(id *)(v34 + 32);
  uint64_t v30 = *(void *)(v34 + 48);
  id v38 = v29;
  uint64_t v39 = v30;
  uint64_t v40 = *(void *)(v34 + 72);
  id v31 = objc_retainBlock(v37);
  [*(id *)(v34 + 48) _scheduleSendBarrierBlock:v31];
  dispatch_queue_t v32 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCFetchEvents", "", buf, 2u);
  }

  [*(id *)(v34 + 56) endSession];
}

void __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke_291(id a1, NSString *a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "events trends : %@, %@", (uint8_t *)&v8, 0x16u);
  }
}

void __65__MODaemonClient__fetchEventsWithOptions_withContext_andHandler___block_invoke_296(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = [*(id *)(a1 + 40) eventManager];
  [v2 clearCache];

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)clearEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  id v12 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];

  id v14 = +[NSString stringWithFormat:@"InterruptMethod_%@", v13];
  [(MODaemonClient *)self _abortIfNeeded:v14];
  CFStringRef v21 = @"MOPromptManagerTest";
  unsigned int v15 = +[NSArray arrayWithObjects:&v21 count:1];
  unsigned int v16 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v15 withErrorHandler:v10];

  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v17[3] = &unk_1002CDB48;
    void v17[4] = self;
    id v18 = v9;
    unint64_t v20 = a4;
    id v19 = v10;
    [(MODaemonClient *)self scheduleInternalClientTask:v17 withName:@"clearEventsWithContext"];
  }
}

void __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002CD928;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _clearEventsWithContext:v3 andRefreshVariant:v4 andHandler:v6];
}

id __70__MODaemonClient_clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"clearEventsWithContext"];
}

- (void)_clearEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__18;
  v27[4] = __Block_byref_object_dispose__18;
  id v28 = (id)os_transaction_create();
  id v11 = [(MODaemonClient *)self _createWatchDogWithName:@"ClearEvents"];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v8 xpcProcessName];
    id v14 = +[MODaemonClient getRefreshVariantName:a4];
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = v13;
    __int16 v31 = 2112;
    dispatch_queue_t v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "clear XPC context [%@] variant [%@]", buf, 0x16u);
  }
  if (a4 == 0xFFFF)
  {
    eventManager = self->_eventManager;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v23[3] = &unk_1002CD978;
    v24[0] = v11;
    id v25 = (void ***)v9;
    id v26 = v27;
    v24[1] = self;
    [(MOEventManager *)eventManager clearEventsWithRefreshVariant:0xFFFFLL andHandler:v23];
    unsigned int v16 = (id *)v24;
    NSErrorUserInfoKey v17 = v25;
  }
  else
  {
    [v11 pet];
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    unint64_t v20 = __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_3;
    CFStringRef v21 = &unk_1002CD950;
    v22[0] = v11;
    v22[1] = v27;
    NSErrorUserInfoKey v17 = objc_retainBlock(&v18);
    -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v17, v18, v19, v20, v21);
    unsigned int v16 = (id *)v22;
  }

  _Block_object_dispose(v27, 8);
}

void __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) pet];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  id v11 = &unk_1002CD950;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v12 = v5;
  uint64_t v13 = v6;
  id v7 = objc_retainBlock(&v8);
  [*(id *)(a1 + 40) _scheduleSendBarrierBlock:v7, v8, v9, v10, v11];
}

void __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __71__MODaemonClient__clearEventsWithContext_andRefreshVariant_andHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)fetchEventBundlesWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = NSStringFromSelector(a2);
  uint64_t v13 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v14 = [v12 stringByTrimmingCharactersInSet:v13];

  unsigned int v15 = +[NSString stringWithFormat:@"InterruptMethod_%@", v14];
  [(MODaemonClient *)self _abortIfNeeded:v15];
  CFStringRef v25 = @"MOFetchEventBundles";
  unsigned int v16 = +[NSArray arrayWithObjects:&v25 count:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke;
  v23[3] = &unk_1002CDA18;
  id v17 = v11;
  id v24 = v17;
  unsigned int v18 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v16 withErrorHandler:v23];

  if (v18)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_2;
    v19[3] = &unk_1002C9A78;
    v19[4] = self;
    id v20 = v9;
    id v21 = v10;
    id v22 = v17;
    [(MODaemonClient *)self scheduleClientTask:v19 withName:@"fetchEventBundlesWithOptions"];
  }
}

uint64_t __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_3;
  v6[3] = &unk_1002CAD10;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _fetchEventBundlesWithOptions:v3 withContext:v4 andHandler:v6];
}

id __70__MODaemonClient_fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"fetchEventBundlesWithOptions"];
}

- (void)_fetchEventBundlesWithOptions:(id)a3 withContext:(id)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__18;
  v32[4] = __Block_byref_object_dispose__18;
  id v33 = (id)os_transaction_create();
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "momentsd_XPCFetchEventBundle", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v13 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCFetchEventBundles" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v13 startSession];
  id v14 = [(MODaemonClient *)self _createWatchDogWithName:@"FetchEventBundles"];
  unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetch event bundles with options, %@", buf, 0xCu);
  }

  unsigned int v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v9 xpcProcessName];
    *(_DWORD *)buf = 138412290;
    id v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "fetch XPC context [%@]", buf, 0xCu);
  }
  eventBundleManager = self->_eventBundleManager;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  void v24[2] = __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke;
  v24[3] = &unk_1002CDB70;
  id v19 = v14;
  id v25 = v19;
  id v20 = v9;
  id v26 = v20;
  uint64_t v27 = self;
  id v21 = v8;
  id v28 = v21;
  id v22 = v10;
  id v30 = v22;
  __int16 v31 = v32;
  id v23 = v13;
  id v29 = v23;
  [(MOEventBundleManager *)eventBundleManager fetchEventBundlesWithOptions:v21 CompletionHandler:v24];

  _Block_object_dispose(v32, 8);
}

void __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v32 = a3;
  uint64_t v30 = a1;
  id v31 = a4;
  [*(id *)(a1 + 32) pet];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v42 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "the number of event bundles fetched : %lu", buf, 0xCu);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          unsigned int v16 = [v14 description];
          *(_DWORD *)buf = 138412290;
          id v42 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "eventBundle fetched : %@", buf, 0xCu);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }

  id v17 = [v31 mutableCopy];
  unsigned int v18 = v17;
  if (v32) {
    [v17 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  id v19 = [*(id *)(v30 + 40) xpcProcessName];
  [v18 setObject:v19 forKey:@"triggerSource"];

  id v20 = [*(id *)(v30 + 48) notifier];
  [v20 sendNotification:1 withPayload:v18];

  if ([*(id *)(v30 + 56) personalizedSensingFilter])
  {
    uint64_t v21 = +[MOPersonalizedSensingUtils getPersonalizedSensingAllowedBundles:allowVisits:](MOPersonalizedSensingUtils, "getPersonalizedSensingAllowedBundles:allowVisits:", v9, [*(id *)(v30 + 56) personalizedSensingVisitsAllowed]);

    id v9 = (id)v21;
  }
  [*(id *)(v30 + 32) pet];
  id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCFetchEventBundlesCompletion", "", buf, 2u);
  }

  id v23 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCFetchEventBundlesCompletion" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v23 startSession];
  uint64_t v24 = *(void *)(v30 + 72);
  if (v24) {
    (*(void (**)(uint64_t, id, id))(v24 + 16))(v24, v9, v32);
  }
  id v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCFetchEventBundlesCompletion", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v23 endSession];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_319;
  v33[3] = &unk_1002CD950;
  id v26 = *(id *)(v30 + 32);
  uint64_t v27 = *(void *)(v30 + 80);
  id v34 = v26;
  uint64_t v35 = v27;
  id v28 = objc_retainBlock(v33);
  [*(id *)(v30 + 48) _scheduleSendBarrierBlock:v28];
  id v29 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, 1uLL, "momentsd_XPCFetchEventBundle", " enableTelemetry=YES ", buf, 2u);
  }

  [*(id *)(v30 + 64) endSession];
}

void __71__MODaemonClient__fetchEventBundlesWithOptions_withContext_andHandler___block_invoke_319(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)collectEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  uint64_t v12 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];

  id v14 = +[NSString stringWithFormat:@"InterruptMethod_%@", v13];
  [(MODaemonClient *)self _abortIfNeeded:v14];
  CFStringRef v21 = @"MOPromptManagerTest";
  unsigned int v15 = +[NSArray arrayWithObjects:&v21 count:1];
  unsigned int v16 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v15 withErrorHandler:v10];

  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v17[3] = &unk_1002CDB48;
    void v17[4] = self;
    id v18 = v9;
    unint64_t v20 = a4;
    id v19 = v10;
    [(MODaemonClient *)self scheduleInternalClientTask:v17 withName:@"collectEventsWithContext"];
  }
}

void __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002CD928;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _collectEventsWithContext:v3 andRefreshVariant:v4 andHandler:v6];
}

id __72__MODaemonClient_collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"collectEventsWithContext"];
}

- (void)_collectEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__18;
  id v26 = (id)os_transaction_create();
  id v11 = [(MODaemonClient *)self _createWatchDogWithName:@"CollectEvents"];
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v8 xpcProcessName];
    id v14 = +[MODaemonClient getRefreshVariantName:a4];
    *(_DWORD *)buf = 138412546;
    id v28 = v13;
    __int16 v29 = 2112;
    uint64_t v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "collect XPC context [%@] variant [%@]", buf, 0x16u);
  }
  eventManager = self->_eventManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke;
  v19[3] = &unk_1002CDB98;
  id v16 = v11;
  id v20 = v16;
  id v17 = v8;
  id v21 = v17;
  id v22 = self;
  id v18 = v9;
  id v23 = v18;
  uint64_t v24 = v25;
  [(MOEventManager *)eventManager collectEventsWithRefreshVariant:a4 andHandler:v19];

  _Block_object_dispose(v25, 8);
}

void __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 pet];
  id v8 = [v7 mutableCopy];

  if (v5) {
    [v8 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  id v9 = [*(id *)(a1 + 40) xpcProcessName];
  [v8 setObject:v9 forKey:@"triggerSource"];

  id v10 = [*(id *)(a1 + 48) notifier];
  [v10 sendNotification:2 withPayload:v8];

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
  }
  unsigned int v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  id v18 = &unk_1002CD950;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 64);
  id v19 = v12;
  uint64_t v20 = v13;
  id v14 = objc_retainBlock(&v15);
  [*(id *)(a1 + 48) _scheduleSendBarrierBlock:v14, v15, v16, v17, v18];
}

void __73__MODaemonClient__collectEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)bundleEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = NSStringFromSelector(a2);
  id v12 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];

  id v14 = +[NSString stringWithFormat:@"InterruptMethod_%@", v13];
  [(MODaemonClient *)self _abortIfNeeded:v14];
  CFStringRef v21 = @"MOPromptManagerTest";
  unsigned int v15 = +[NSArray arrayWithObjects:&v21 count:1];
  unsigned int v16 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v15 withErrorHandler:v10];

  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v17[3] = &unk_1002CDB48;
    void v17[4] = self;
    id v18 = v9;
    unint64_t v20 = a4;
    id v19 = v10;
    [(MODaemonClient *)self scheduleInternalClientTask:v17 withName:@"bundleEventsWithContext"];
  }
}

void __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002CD928;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _bundleEventsWithContext:v3 andRefreshVariant:v4 andHandler:v6];
}

id __71__MODaemonClient_bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"bundleEventsWithContext"];
}

- (void)_bundleEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__18;
  id v26 = (id)os_transaction_create();
  uint64_t v11 = [(MODaemonClient *)self _createWatchDogWithName:@"BundleEvents"];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v8 xpcProcessName];
    id v14 = +[MODaemonClient getRefreshVariantName:a4];
    *(_DWORD *)buf = 138412546;
    id v28 = v13;
    __int16 v29 = 2112;
    uint64_t v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "bundle XPC context [%@] variant [%@]", buf, 0x16u);
  }
  eventBundleManager = self->_eventBundleManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke;
  v19[3] = &unk_1002CDB98;
  id v16 = v11;
  id v20 = v16;
  id v17 = v8;
  id v21 = v17;
  id v22 = self;
  id v18 = v9;
  id v23 = v18;
  uint64_t v24 = v25;
  [(MOEventBundleManager *)eventBundleManager bundleEventsWithRefreshVariant:a4 andHandler:v19];

  _Block_object_dispose(v25, 8);
}

void __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 pet];
  id v8 = [v7 mutableCopy];

  if (v5) {
    [v8 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  id v9 = [*(id *)(a1 + 40) xpcProcessName];
  [v8 setObject:v9 forKey:@"triggerSource"];

  id v10 = [*(id *)(a1 + 48) notifier];
  [v10 sendNotification:3 withPayload:v8];

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
  }
  unsigned int v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  id v18 = &unk_1002CD950;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 64);
  id v19 = v12;
  uint64_t v20 = v13;
  id v14 = objc_retainBlock(&v15);
  [*(id *)(a1 + 48) _scheduleSendBarrierBlock:v14, v15, v16, v17, v18];
}

void __72__MODaemonClient__bundleEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)purgeEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = NSStringFromSelector(a2);
  id v12 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];

  id v14 = +[NSString stringWithFormat:@"InterruptMethod_%@", v13];
  [(MODaemonClient *)self _abortIfNeeded:v14];
  CFStringRef v21 = @"MOPromptManagerTest";
  unsigned int v15 = +[NSArray arrayWithObjects:&v21 count:1];
  unsigned int v16 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v15 withErrorHandler:v10];

  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v17[3] = &unk_1002CDB48;
    void v17[4] = self;
    id v18 = v9;
    unint64_t v20 = a4;
    id v19 = v10;
    [(MODaemonClient *)self scheduleInternalClientTask:v17 withName:@"purgeEventsWithContext"];
  }
}

void __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002CD928;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _purgeEventsWithContext:v3 andRefreshVariant:v4 andHandler:v6];
}

id __70__MODaemonClient_purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"purgeEventsWithContext"];
}

- (void)_purgeEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__18;
  v32[4] = __Block_byref_object_dispose__18;
  id v33 = (id)os_transaction_create();
  uint64_t v11 = [(MODaemonClient *)self _createWatchDogWithName:@"PurgeEvents"];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__18;
  v30[4] = __Block_byref_object_dispose__18;
  id v31 = 0;
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v8 xpcProcessName];
    id v14 = +[MODaemonClient getRefreshVariantName:a4];
    *(_DWORD *)buf = 138412546;
    uint64_t v35 = v13;
    __int16 v36 = 2112;
    long long v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "purge XPC context [%@] variant [%@]", buf, 0x16u);
  }
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  eventManager = self->_eventManager;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke;
  v21[3] = &unk_1002CDBE8;
  id v17 = v11;
  id v22 = v17;
  id v18 = v15;
  id v23 = v18;
  uint64_t v24 = self;
  uint64_t v27 = v30;
  unint64_t v29 = a4;
  id v19 = v8;
  id v25 = v19;
  id v20 = v9;
  id v26 = v20;
  id v28 = v32;
  [(MOEventManager *)eventManager cleanUpEventsWithRefreshVariant:a4 andHandler:v21];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) pet];
  if (v6)
  {
    [*(id *)(a1 + 40) setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
  }
  [*(id *)(a1 + 40) addEntriesFromDictionary:v7];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "purge: Calling purge bundles", buf, 2u);
  }

  id v9 = *(void **)(*(void *)(a1 + 48) + 88);
  uint64_t v10 = *(void *)(a1 + 88);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_342;
  v17[3] = &unk_1002CDBC0;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 72);
  id v18 = v11;
  uint64_t v23 = v12;
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 48);
  id v19 = v13;
  uint64_t v20 = v14;
  id v22 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 80);
  id v21 = v15;
  uint64_t v24 = v16;
  [v9 cleanUpEventBundlesWithRefreshVariant:v10 andHandler:v17];
}

void __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_342(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v10 = *(void **)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    id v9 = v10;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = v5;
    }
    objc_storeStrong(v8, v11);
  }
  [*(id *)(a1 + 32) addEntriesFromDictionary:v6];
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Purge expired events and bundles all completed", buf, 2u);
  }

  id v13 = *(void **)(a1 + 32);
  uint64_t v14 = [*(id *)(a1 + 40) xpcProcessName];
  [v13 setObject:v14 forKey:@"triggerSource"];

  id v15 = [*(id *)(a1 + 48) notifier];
  [v15 sendNotification:4 withPayload:*(void *)(a1 + 32)];

  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    (*(void (**)(uint64_t, void))(v16 + 16))(v16, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_343;
  uint64_t v23 = &unk_1002CD950;
  id v17 = *(id *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 80);
  id v24 = v17;
  uint64_t v25 = v18;
  id v19 = objc_retainBlock(&v20);
  [*(id *)(a1 + 48) _scheduleSendBarrierBlock:v19, v20, v21, v22, v23];
}

void __71__MODaemonClient__purgeEventsWithContext_andRefreshVariant_andHandler___block_invoke_343(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)runAnalyticsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  uint64_t v12 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v13 = [v11 stringByTrimmingCharactersInSet:v12];

  uint64_t v14 = +[NSString stringWithFormat:@"InterruptMethod_%@", v13];
  [(MODaemonClient *)self _abortIfNeeded:v14];
  CFStringRef v21 = @"MOPromptManagerTest";
  id v15 = +[NSArray arrayWithObjects:&v21 count:1];
  unsigned int v16 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v15 withErrorHandler:v10];

  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke;
    v17[3] = &unk_1002CDB48;
    void v17[4] = self;
    id v18 = v9;
    unint64_t v20 = a4;
    id v19 = v10;
    [(MODaemonClient *)self scheduleInternalClientTask:v17 withName:@"runAnalyticsWithContext"];
  }
}

void __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v6[3] = &unk_1002CD928;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _runAnalyticsWithContext:v3 andRefreshVariant:v4 andHandler:v6];
}

id __71__MODaemonClient_runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"runAnalyticsWithContext"];
}

- (void)_runAnalyticsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__18;
  id v26 = (id)os_transaction_create();
  id v11 = [(MODaemonClient *)self _createWatchDogWithName:@"RunAnalytics"];
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v8 xpcProcessName];
    uint64_t v14 = +[MODaemonClient getRefreshVariantName:a4];
    *(_DWORD *)buf = 138412546;
    id v28 = v13;
    __int16 v29 = 2112;
    uint64_t v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "analytics XPC context [%@] variant [%@]", buf, 0x16u);
  }
  eventManager = self->_eventManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke;
  v19[3] = &unk_1002CDB98;
  id v16 = v11;
  id v20 = v16;
  id v17 = v8;
  id v21 = v17;
  id v22 = self;
  id v18 = v9;
  id v23 = v18;
  id v24 = v25;
  [(MOEventManager *)eventManager runAnalyticsWithRefreshVariant:a4 andHandler:v19];

  _Block_object_dispose(v25, 8);
}

void __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 pet];
  id v8 = [v7 mutableCopy];

  if (v5) {
    [v8 setObject:&__kCFBooleanFalse forKey:@"resultOverallSuccess"];
  }
  id v9 = [*(id *)(a1 + 40) xpcProcessName];
  [v8 setObject:v9 forKey:@"triggerSource"];

  id v10 = [*(id *)(a1 + 48) notifier];
  [v10 sendNotification:5 withPayload:v8];

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
  }
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  id v18 = &unk_1002CD950;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 64);
  id v19 = v12;
  uint64_t v20 = v13;
  uint64_t v14 = objc_retainBlock(&v15);
  [*(id *)(a1 + 48) _scheduleSendBarrierBlock:v14, v15, v16, v17, v18];
}

void __72__MODaemonClient__runAnalyticsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)analyzeTrendsInEvents:(id)a3 withContext:(id)a4 andRefreshVariant:(unint64_t)a5 andHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = NSStringFromSelector(a2);
  id v15 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v16 = [v14 stringByTrimmingCharactersInSet:v15];

  id v17 = +[NSString stringWithFormat:@"InterruptMethod_%@", v16];
  [(MODaemonClient *)self _abortIfNeeded:v17];
  CFStringRef v28 = @"MOPromptManagerTest";
  id v18 = +[NSArray arrayWithObjects:&v28 count:1];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke;
  v26[3] = &unk_1002CDA18;
  id v19 = v13;
  id v27 = v19;
  unsigned int v20 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v18 withErrorHandler:v26];

  if (v20)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2;
    v21[3] = &unk_1002CABE8;
    void v21[4] = self;
    id v22 = v11;
    id v23 = v12;
    unint64_t v25 = a5;
    id v24 = v19;
    [(MODaemonClient *)self scheduleInternalClientTask:v21 withName:@"analyzeTrendsInEvents"];
  }
}

uint64_t __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3;
  v7[3] = &unk_1002CAD10;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v2 _analyzeTrendsInEvents:v3 withContext:v5 andRefreshVariant:v4 andHandler:v7];
}

id __81__MODaemonClient_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"analyzeTrendsInEvents"];
}

- (void)_analyzeTrendsInEvents:(id)a3 withContext:(id)a4 andRefreshVariant:(unint64_t)a5 andHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28[0] = 0;
  v28[1] = v28;
  void v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__18;
  v28[4] = __Block_byref_object_dispose__18;
  id v29 = (id)os_transaction_create();
  uint64_t v14 = [(MODaemonClient *)self _createWatchDogWithName:@"AnalyzeTrends"];
  id v15 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "run trends analytics", buf, 2u);
  }

  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v11 xpcProcessName];
    id v18 = +[MODaemonClient getRefreshVariantName:a5];
    *(_DWORD *)buf = 138412546;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "trends XPC context [%@] variant [%@]", buf, 0x16u);
  }
  id v19 = objc_opt_new();
  unsigned int v20 = [v19 buildAnalyticsPlans];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke;
  v23[3] = &unk_1002CDC38;
  id v21 = v14;
  id v24 = v21;
  id v22 = v12;
  id v26 = v22;
  id v27 = v28;
  unint64_t v25 = self;
  [v19 analyzeEvents:v10 analyticsPlans:v20 handler:v23];

  _Block_object_dispose(v28, 8);
}

void __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) pet];
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "trends analytics completes", buf, 2u);
  }

  if (v6)
  {
    *(void *)buf = 0;
    id v23 = buf;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_359;
    v19[3] = &unk_1002CDC10;
    id v20 = *(id *)(a1 + 32);
    id v21 = buf;
    [v6 enumerateKeysAndObjectsUsingBlock:v19];
    [*(id *)(a1 + 32) pet];
    if (v23[24])
    {
      id v8 = 0;
    }
    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2;
      v17[3] = &unk_1002C9AA0;
      id v9 = (id)objc_opt_new();
      id v18 = v9;
      [v6 enumerateKeysAndObjectsUsingBlock:v17];
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      id v27 = v9;
      id v10 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v8 = +[NSError errorWithDomain:@"MOErrorDomain" code:0 userInfo:v10];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = 0;
  }
  [*(id *)(a1 + 32) pet];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3;
  v14[3] = &unk_1002CD950;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 56);
  id v15 = v11;
  uint64_t v16 = v12;
  id v13 = objc_retainBlock(v14);
  [*(id *)(a1 + 40) _scheduleSendBarrierBlock:v13];
}

void __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_359(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 pet];
  LODWORD(v6) = [v7 unsignedIntValue];

  if ((v6 - 4) >= 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

id __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"(%@:%@)", a2, a3];
}

void __82__MODaemonClient__analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)softRefreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andIgnoreLastTrigger:(BOOL)a5 andHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting softRefresh", buf, 2u);
  }

  uint64_t v14 = NSStringFromSelector(a2);
  id v15 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v16 = [v14 stringByTrimmingCharactersInSet:v15];

  id v17 = +[NSString stringWithFormat:@"InterruptMethod_%@", v16];
  [(MODaemonClient *)self _abortIfNeeded:v17];
  if (a4 == 512)
  {
    v47[0] = @"MORefreshLight";
    v47[1] = @"MOPromptManagerTest";
    id v18 = +[NSArray arrayWithObjects:v47 count:2];
    unsigned __int8 v19 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v18 withErrorHandler:v12];

    if ((v19 & 1) == 0) {
      goto LABEL_27;
    }
LABEL_7:
    id v22 = +[NSDate distantPast];
    id v23 = [(MODaemonClient *)self defaultsManager];
    uint64_t v24 = [v23 objectForKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v24;

        id v22 = v25;
      }
    }
    NSErrorUserInfoKey v26 = [(MODaemonClient *)self configManager];
    LODWORD(v27) = 1155596288;
    [v26 getFloatSettingForKey:@"EventRefreshSchedulerBlackoutTimeWindowForSoftRefresh" withFallback:v27];
    float v29 = v28;

    uint64_t v30 = +[NSDate now];
    [v30 timeIntervalSinceDate:v22];
    double v32 = v31;

    if (!v22 || (float v33 = v32, v33 <= 0.0) || v29 <= v33 || a5)
    {
      unsigned __int8 v37 = [(MODaemonClient *)self acquireRefreshLock];
      long long v38 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
      if (v37)
      {
        if (v39)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "RefreshLock is acquired. Eligible to run soft refresh", buf, 2u);
        }

        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = __97__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke;
        v40[3] = &unk_1002CDB48;
        v40[4] = self;
        id v41 = v11;
        unint64_t v43 = a4;
        id v42 = v12;
        [(MODaemonClient *)self scheduleInternalClientTask:v40 withName:@"softRefreshEventsWithContext"];

        goto LABEL_26;
      }
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "RefreshLock is in use. Drop the soft refresh.", buf, 2u);
      }

      if (!v12) {
        goto LABEL_26;
      }
    }
    else
    {
      id v34 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(float *)&double v35 = v33;
        __int16 v36 = +[NSNumber numberWithFloat:v35];
        *(_DWORD *)buf = 138412290;
        v45 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "softRefreshEventsWithContext had nothing to do because we refreshed %@ seconds ago", buf, 0xCu);
      }
      if (!v12) {
        goto LABEL_26;
      }
    }
    (*((void (**)(id, void))v12 + 2))(v12, 0);
LABEL_26:

    goto LABEL_27;
  }
  CFStringRef v46 = @"MOPromptManagerTest";
  id v20 = +[NSArray arrayWithObjects:&v46 count:1];
  unsigned int v21 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v20 withErrorHandler:v12];

  if (v21) {
    goto LABEL_7;
  }
LABEL_27:
}

void __97__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __97__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke_2;
  v4[3] = &unk_1002CDA90;
  v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v1 _refreshEventsWithContext:v2 andRefreshVariant:v3 andSoftKindFlag:1 andHandler:v4];
}

id __97__MODaemonClient_softRefreshEventsWithContext_andRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 releaseRefreshLock];
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "RefreshLock is released.", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) finalizeClientTaskWithName:@"softRefreshEventsWithContext"];
}

- (void)softRefreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
}

- (BOOL)acquireRefreshLock
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL refreshLock = v2->_refreshLock;
  if (!v2->_refreshLock) {
    v2->_BOOL refreshLock = 1;
  }
  BOOL v4 = !refreshLock;
  objc_sync_exit(v2);

  return v4;
}

- (void)releaseRefreshLock
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Release an invalid refresh lock", v2, v3, v4, v5, v6);
}

- (void)refreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  id v12 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v13 = [v11 stringByTrimmingCharactersInSet:v12];

  uint64_t v14 = +[NSString stringWithFormat:@"InterruptMethod_%@", v13];
  [(MODaemonClient *)self _abortIfNeeded:v14];
  if (a4 == 512)
  {
    v31[0] = @"MORefreshLight";
    v31[1] = @"MOPromptManagerTest";
    id v15 = +[NSArray arrayWithObjects:v31 count:2];
    unsigned __int8 v16 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v15 withErrorHandler:v10];

    if ((v16 & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    CFStringRef v30 = @"MOPromptManagerTest";
    id v17 = +[NSArray arrayWithObjects:&v30 count:1];
    unsigned int v18 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v17 withErrorHandler:v10];

    if (!v18) {
      goto LABEL_11;
    }
  }
  if ([(MODaemonClient *)self acquireRefreshLock])
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke;
    v23[3] = &unk_1002CDB48;
    void v23[4] = self;
    id v24 = v9;
    unint64_t v26 = a4;
    id v25 = v10;
    [(MODaemonClient *)self scheduleInternalClientTask:v23 withName:@"refreshEventsWithContext"];
  }
  else
  {
    unsigned __int8 v19 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "RefreshLock is in use. Drop the refresh.", buf, 2u);
    }

    if (v10)
    {
      id v20 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"The refresh is dropped due to an existing refresh.";
      unsigned int v21 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v22 = [v20 initWithDomain:@"MODaemonClient" code:0 userInfo:v21];

      (*((void (**)(id, id))v10 + 2))(v10, v22);
    }
  }
LABEL_11:
}

void __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke_2;
  v4[3] = &unk_1002CDA90;
  v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v1 _refreshEventsWithContext:v2 andRefreshVariant:v3 andSoftKindFlag:0 andHandler:v4];
}

id __72__MODaemonClient_refreshEventsWithContext_andRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 releaseRefreshLock];
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "RefreshLock is released.", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) finalizeClientTaskWithName:@"refreshEventsWithContext"];
}

- (void)_refreshEventsWithContext:(id)a3 andRefreshVariant:(unint64_t)a4 andSoftKindFlag:(BOOL)a5 andHandler:(id)a6
{
  BOOL v52 = a5;
  id v9 = a3;
  id v10 = a6;
  id v11 = [(MODaemonClient *)self _createWatchDogWithName:@"refreshEvents"];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v9 xpcProcessName];
    uint64_t v14 = +[NSNumber numberWithBool:v52];
    id v15 = +[MODaemonClient getRefreshVariantName:a4];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v115 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "refresh XPC context [%@] soft kind [%@] variant [%@]", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v115 = __Block_byref_object_copy__18;
  v116 = __Block_byref_object_dispose__18;
  id v117 = 0;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x3032000000;
  v110[3] = __Block_byref_object_copy__18;
  v110[4] = __Block_byref_object_dispose__18;
  id v111 = (id)os_transaction_create();
  unsigned __int8 v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v17 = v16;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)v112 = 134349056;
    unint64_t v113 = a4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, a4, "momentsd_XPCRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", v112, 0xCu);
  }

  unsigned int v18 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefresh" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v18 startSession];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke;
  v102[3] = &unk_1002CDC60;
  unint64_t v109 = a4;
  id v19 = v11;
  id v103 = v19;
  id v48 = v10;
  id v106 = v48;
  v104 = self;
  v107 = buf;
  v108 = v110;
  v49 = v18;
  v105 = v49;
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_390;
  v99[3] = &unk_1002CDCB0;
  unint64_t v101 = a4;
  v99[4] = self;
  CFStringRef v50 = objc_retainBlock(v102);
  id v100 = v50;
  id v20 = objc_retainBlock(v99);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_395;
  v93[3] = &unk_1002CABE8;
  unint64_t v98 = a4;
  id v21 = v19;
  id v94 = v21;
  v95 = self;
  id v22 = v9;
  id v96 = v22;
  id v23 = v20;
  id v97 = v23;
  id v24 = objc_retainBlock(v93);
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_401;
  v84[3] = &unk_1002CDD28;
  unint64_t v91 = a4;
  id v25 = v21;
  id v85 = v25;
  v86 = self;
  id v26 = v22;
  id v87 = v26;
  v90 = buf;
  BOOL v92 = v52;
  double v27 = v23;
  id v88 = v27;
  SEL v51 = v24;
  id v89 = v51;
  NSErrorUserInfoKey v28 = objc_retainBlock(v84);
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_406;
  v77[3] = &unk_1002CDD78;
  unint64_t v83 = a4;
  id v29 = v25;
  id v78 = v29;
  v79 = self;
  id v30 = v26;
  id v80 = v30;
  v82 = buf;
  double v31 = v28;
  id v81 = v31;
  double v32 = objc_retainBlock(v77);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_411;
  v67[3] = &unk_1002CDDC8;
  unint64_t v75 = a4;
  id v33 = v29;
  id v68 = v33;
  v69 = self;
  id v34 = v30;
  id v70 = v34;
  v74 = buf;
  double v35 = v27;
  id v71 = v35;
  BOOL v76 = v52;
  __int16 v36 = v31;
  id v72 = v36;
  unsigned __int8 v37 = v32;
  id v73 = v37;
  long long v38 = objc_retainBlock(v67);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_416;
  v60[3] = &unk_1002CDD78;
  unint64_t v66 = a4;
  id v39 = v33;
  id v61 = v39;
  v62 = self;
  id v40 = v34;
  id v63 = v40;
  v65 = buf;
  id v41 = v38;
  id v64 = v41;
  id v42 = objc_retainBlock(v60);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_421;
  v53[3] = &unk_1002CDD78;
  unint64_t v59 = a4;
  id v43 = v39;
  id v54 = v43;
  v55 = self;
  id v44 = v40;
  id v56 = v44;
  v58 = buf;
  v45 = v42;
  id v57 = v45;
  CFStringRef v46 = objc_retainBlock(v53);
  id v47 = [(MODaemonClient *)self internalQueue];
  dispatch_async(v47, v46);

  _Block_object_dispose(v110, 8);
  _Block_object_dispose(buf, 8);
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshCompletion", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshCompletion" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  [*(id *)(a1 + 32) pet];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_389;
  v16[3] = &unk_1002CDAF8;
  int8x16_t v15 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v15.i64[0];
  int8x16_t v17 = vextq_s8(v15, v15, 8uLL);
  uint64_t v18 = *(void *)(a1 + 72);
  id v8 = objc_retainBlock(v16);
  [*(id *)(a1 + 40) _scheduleSendBarrierBlock:v8];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 80);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v11, "XPCRefreshCompletion", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v5 endSession];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 80);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134349056;
    os_signpost_id_t v20 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v14, "momentsd_XPCRefresh", " variant=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", buf, 0xCu);
  }

  [*(id *)(a1 + 48) endSession];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_389(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventManager];
  [v2 clearCache];

  [*(id *)(a1 + 40) cancel];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  os_signpost_id_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_390(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshNotificationService", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshNotificationService" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  uint64_t v6 = [*(id *)(a1 + 32) notificationsManager];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_394;
  id v13 = &unk_1002CDC88;
  uint64_t v7 = *(void *)(a1 + 48);
  os_signpost_id_t v14 = v5;
  uint64_t v15 = v7;
  id v8 = v5;
  [v6 serviceSuggestionsNotificationsWithHandler:&v10];

  id v9 = [*(id *)(a1 + 32) internalQueue:v10, v11, v12, v13];
  dispatch_async(v9, *(dispatch_block_t *)(a1 + 40));
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_394(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Notification scheduling complete, error: %@", (uint8_t *)&v8, 0xCu);
  }

  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "XPCRefreshNotificationService", "", (uint8_t *)&v8, 2u);
  }

  [*(id *)(a1 + 32) endSession];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_395(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshDataDump", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshDataDump" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  [*(id *)(a1 + 32) pet];
  uint64_t v6 = *(void *)(a1 + 64);
  os_signpost_id_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_399;
  v12[3] = &unk_1002CDCD8;
  uint64_t v17 = v6;
  id v13 = v5;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = *(id *)(a1 + 56);
  uint64_t v11 = v5;
  [v7 _checkElegibilityAndRequestDataExportForTrigger:2 withFeedback:0 requestUpload:1 refreshVariant:v6 context:v8 reply:v12];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_399(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, v4, "XPCRefreshDataDump", "", v7, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_399_cold_1();
  }

  [*(id *)(a1 + 40) pet];
  uint64_t v6 = [*(id *)(a1 + 48) internalQueue];
  dispatch_async(v6, *(dispatch_block_t *)(a1 + 56));
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_401(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshBundleEvents", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshBundleEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  [*(id *)(a1 + 32) pet];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 80);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_405;
  v13[3] = &unk_1002CDD00;
  uint64_t v9 = *(void *)(a1 + 72);
  id v14 = v5;
  uint64_t v19 = v9;
  uint64_t v20 = v8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  uint64_t v16 = v11;
  char v21 = *(unsigned char *)(a1 + 88);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v12 = v5;
  [v6 _bundleEventsWithContext:v7 andRefreshVariant:v8 andHandler:v13];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_405(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 80);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "XPCRefreshBundleEvents", "", buf, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id v10 = *(void **)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  [*(id *)(a1 + 40) pet];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v20[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Refresh: All completed!", (uint8_t *)v20, 2u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_405_cold_2();
    }

    id v14 = [*(id *)(a1 + 48) internalQueue];
    id v15 = (dispatch_block_t *)(a1 + 56);
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 48) defaultsManager];
    id v17 = +[NSDate now];
    [v16 setObject:v17 forKey:@"EventRefreshSchedulerLastSuccessfulTrigger"];

    id v18 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_405_cold_1();
    }

    int v19 = *(unsigned __int8 *)(a1 + 88);
    id v14 = [*(id *)(a1 + 48) internalQueue];
    id v15 = (dispatch_block_t *)(a1 + 64);
    if (v19) {
      id v15 = (dispatch_block_t *)(a1 + 56);
    }
  }
  dispatch_async(v14, *v15);
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_406(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshAnalytics", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshAnalytics" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  [*(id *)(a1 + 32) pet];
  os_signpost_id_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_410;
  v13[3] = &unk_1002CDD50;
  uint64_t v9 = *(void *)(a1 + 64);
  id v14 = v5;
  uint64_t v18 = v9;
  uint64_t v19 = v8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = *(id *)(a1 + 56);
  id v12 = v5;
  [v6 _runAnalyticsWithContext:v7 andRefreshVariant:v8 andHandler:v13];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_410(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "XPCRefreshAnalytics", "", (uint8_t *)v13, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  [*(id *)(a1 + 40) pet];
  id v12 = [*(id *)(a1 + 48) internalQueue];
  dispatch_async(v12, *(dispatch_block_t *)(a1 + 56));
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_411(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 88);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshCollect", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshCollect" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  [*(id *)(a1 + 32) pet];
  os_signpost_id_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 88);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_415;
  v13[3] = &unk_1002CDDA0;
  uint64_t v9 = *(void *)(a1 + 80);
  id v14 = v5;
  uint64_t v20 = v9;
  uint64_t v21 = v8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = *(id *)(a1 + 56);
  char v22 = *(unsigned char *)(a1 + 96);
  id v18 = *(id *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v12 = v5;
  [v6 _collectEventsWithContext:v7 andRefreshVariant:v8 andHandler:v13];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_415(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  os_signpost_id_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 88);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v18[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, v7, "XPCRefreshCollect", "", (uint8_t *)v18, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v11 = *(void **)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  id v10 = v11;
  if (v11) {
    id v12 = v10;
  }
  else {
    id v12 = v4;
  }
  objc_storeStrong(v9, v12);
  [*(id *)(a1 + 40) pet];
  if (v4
    && (([v4 code] & 0x400) != 0 || objc_msgSend(v4, "code") == (id)22)
    && ([v4 domain],
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == @"MOErrorDomain"))
  {
    id v17 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_415_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a2);
    id v15 = [*(id *)(a1 + 48) internalQueue];
    uint64_t v16 = (dispatch_block_t *)(a1 + 56);
  }
  else
  {
    int v14 = *(unsigned __int8 *)(a1 + 96);
    id v15 = [*(id *)(a1 + 48) internalQueue];
    uint64_t v16 = (dispatch_block_t *)(a1 + 72);
    if (v14) {
      uint64_t v16 = (dispatch_block_t *)(a1 + 64);
    }
  }
  dispatch_async(v15, *v16);
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_416(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshPurge", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshPurge" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  [*(id *)(a1 + 32) pet];
  os_signpost_id_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_420;
  v13[3] = &unk_1002CDD50;
  uint64_t v9 = *(void *)(a1 + 64);
  int v14 = v5;
  uint64_t v18 = v9;
  uint64_t v19 = v8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = *(id *)(a1 + 56);
  id v12 = v5;
  [v6 _purgeEventsWithContext:v7 andRefreshVariant:v8 andHandler:v13];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_420(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "XPCRefreshPurge", "", (uint8_t *)v13, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  [*(id *)(a1 + 40) pet];
  id v12 = [*(id *)(a1 + 48) internalQueue];
  dispatch_async(v12, *(dispatch_block_t *)(a1 + 56));
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_421(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "XPCRefreshClearEvents", "", buf, 2u);
  }

  id v5 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCRefreshClearEvents" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v5 startSession];
  [*(id *)(a1 + 32) pet];
  os_signpost_id_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_425;
  v13[3] = &unk_1002CDD50;
  uint64_t v9 = *(void *)(a1 + 64);
  int v14 = v5;
  uint64_t v18 = v9;
  uint64_t v19 = v8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = *(id *)(a1 + 56);
  id v12 = v5;
  [v6 _clearEventsWithContext:v7 andRefreshVariant:v8 andHandler:v13];
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_425(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "XPCRefreshClearEvents", "", (uint8_t *)v13, 2u);
  }

  [*(id *)(a1 + 32) endSession];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v3;
  }
  objc_storeStrong(v8, v11);
  [*(id *)(a1 + 40) pet];
  id v12 = [*(id *)(a1 + 48) internalQueue];
  dispatch_async(v12, *(dispatch_block_t *)(a1 + 56));
}

- (void)checkElegibilityAndRequestDataExportForTrigger:(unint64_t)a3 withFeedback:(id)a4 requestUpload:(BOOL)a5 reply:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = NSStringFromSelector(a2);
  int v14 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v15 = [v13 stringByTrimmingCharactersInSet:v14];

  uint64_t v16 = +[NSString stringWithFormat:@"InterruptMethod_%@", v15];
  [(MODaemonClient *)self _abortIfNeeded:v16];
  CFStringRef v27 = @"MOPromptManagerTest";
  id v17 = +[NSArray arrayWithObjects:&v27 count:1];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke;
  v25[3] = &unk_1002CDA18;
  id v18 = v12;
  id v26 = v18;
  unsigned int v19 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v17 withErrorHandler:v25];

  if (v19)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_2;
    v20[3] = &unk_1002CDE18;
    v20[4] = self;
    unint64_t v23 = a3;
    id v21 = v11;
    BOOL v24 = a5;
    id v22 = v18;
    [(MODaemonClient *)self scheduleInternalClientTask:v20 withName:@"dataDumpWithFeedback"];
  }
}

uint64_t __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_3;
  v7[3] = &unk_1002CDDF0;
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v2 _checkElegibilityAndRequestDataExportForTrigger:v5 withFeedback:v3 requestUpload:v4 refreshVariant:0 context:0 reply:v7];
}

id __98__MODaemonClient_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"dataDumpWithFeedback"];
}

- (void)_checkElegibilityAndRequestDataExportForTrigger:(unint64_t)a3 withFeedback:(id)a4 requestUpload:(BOOL)a5 refreshVariant:(unint64_t)a6 context:(id)a7 reply:(id)a8
{
  BOOL v11 = a5;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__18;
  v35[4] = __Block_byref_object_dispose__18;
  id v36 = (id)os_transaction_create();
  id v18 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  unint64_t v28 = a3;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "dataDumpWithFeedback", buf, 2u);
  }

  unsigned int v19 = [(MODaemonClient *)self _createWatchDogWithName:@"DataUpload"];
  uint64_t v20 = objc_opt_new();
  id v21 = +[NSNumber numberWithUnsignedInteger:a6];
  id v22 = [v21 stringValue];
  [v20 setObject:v22 forKey:@"kMORefreshVariant"];

  unint64_t v23 = [&off_1002F5720 stringValue];
  [v20 setObject:v23 forKey:@"kMORefreshSource"];

  if (v15)
  {
    BOOL v24 = [v15 xpcProcessName];
    [v20 setObject:v24 forKey:@"kMORefreshClientContext"];
  }
  eventBundleManager = self->_eventBundleManager;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke;
  v29[3] = &unk_1002CD978;
  id v26 = v19;
  id v30 = v26;
  id v27 = v16;
  id v32 = v27;
  id v33 = v35;
  double v31 = self;
  [(MOEventBundleManager *)eventBundleManager captureCurrentDBStateForTrigger:v28 withFeedback:v14 additionalMetadata:v20 shouldUpload:v11 andHandler:v29];

  _Block_object_dispose(v35, 8);
}

void __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) pet];
  uint64_t v7 = [v6 objectForKey:@"kMODataDumpEnabled"];

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    if (v5 || !v7)
    {
      id v9 = 0;
      id v10 = v5;
    }
    else
    {
      id v9 = v6;
      id v10 = 0;
    }
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v10);
  }
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke_2;
  id v17 = &unk_1002CD950;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 56);
  id v18 = v11;
  uint64_t v19 = v12;
  id v13 = objc_retainBlock(&v14);
  [*(id *)(a1 + 40) _scheduleSendBarrierBlock:v13, v14, v15, v16, v17];
}

void __122__MODaemonClient__checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_refreshVariant_context_reply___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)getSnapshotDictionaryForAnalyticsWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v17 = @"MOPromptManagerTest";
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke;
  v15[3] = &unk_1002CDA18;
  id v11 = v5;
  id v16 = v11;
  unsigned int v12 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v15];

  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2;
    v13[3] = &unk_1002CCDC0;
    void v13[4] = self;
    id v14 = v11;
    [(MODaemonClient *)self scheduleInternalClientTask:v13 withName:@"getSnapshotDictionaryForAnalyticsWithHandler"];
  }
}

uint64_t __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_3;
  v4[3] = &unk_1002CDDF0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _getSnapshotDictionaryForAnalyticsWithHandler:v4];
}

id __63__MODaemonClient_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 finalizeClientTaskWithName:@"getSnapshotDictionaryForAnalyticsWithHandler"];
}

- (void)_getSnapshotDictionaryForAnalyticsWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, id, void))a3;
  id v5 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
  id v6 = [v5 getSnapshotDictionaryForAnalytics];

  v4[2](v4, v6, 0);
}

- (void)fetchPhotoAnalyticsMetricsWithContext:(id)a3 andHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  id v9 = [(MODaemonClient *)self _createWatchDogWithName:@"FetchPhotoAnlytics"];
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "run analytics", (uint8_t *)&v15, 2u);
  }

  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = [v6 xpcProcessName];
    int v15 = 138412290;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "photo analytics XPC context [%@]", (uint8_t *)&v15, 0xCu);
  }
  id v13 = objc_opt_new();
  [v13 setValue:@"1.0.1" forKey:@"version"];
  id v14 = +[NSNumber numberWithInt:arc4random_uniform(0x4Au)];
  [v13 setValue:v14 forKey:@"seed"];

  v7[2](v7, v13, 0);
  [v9 cancel];
}

- (void)isAllowedToPromptResourceType:(unint64_t)a3 withReply:(id)a4
{
  id v7 = a4;
  uint64_t v8 = NSStringFromSelector(a2);
  id v9 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];

  id v11 = +[NSString stringWithFormat:@"InterruptMethod_%@", v10];
  [(MODaemonClient *)self _abortIfNeeded:v11];
  CFStringRef v17 = @"MOReadPermissions";
  unsigned int v12 = +[NSArray arrayWithObjects:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __58__MODaemonClient_isAllowedToPromptResourceType_withReply___block_invoke;
  v15[3] = &unk_1002CDA18;
  id v13 = v7;
  id v16 = v13;
  unsigned int v14 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v12 withErrorHandler:v15];

  if (v14) {
    [(MODaemonClient *)self _isAllowedToPromptResourceType:a3 withReply:v13];
  }
}

uint64_t __58__MODaemonClient_isAllowedToPromptResourceType_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_isAllowedToPromptResourceType:(unint64_t)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, BOOL, void))a4;
  v22[0] = 0;
  v22[1] = v22;
  void v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__18;
  v22[4] = __Block_byref_object_dispose__18;
  id v23 = (id)os_transaction_create();
  uint64_t v8 = [(MODaemonClient *)self _createWatchDogWithName:@"IsAllowedToPromptResourceType"];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "isAllowedToPrompt resource category %@", buf, 0xCu);
  }
  BOOL v11 = [(MOConfigurationManager *)self->_configManager isAllowedToPromptResourceType:a3];
  unsigned int v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = +[NSNumber numberWithBool:v11];
    *(_DWORD *)buf = 138412290;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "isAllowedToPrompt result: %@", buf, 0xCu);
  }
  v6[2](v6, v11, 0);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = __59__MODaemonClient__isAllowedToPromptResourceType_withReply___block_invoke;
  uint64_t v19 = &unk_1002CD950;
  id v14 = v8;
  id v20 = v14;
  id v21 = v22;
  int v15 = objc_retainBlock(&v16);
  -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v15, v16, v17, v18, v19);

  _Block_object_dispose(v22, 8);
}

void __59__MODaemonClient__isAllowedToPromptResourceType_withReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)isAllowedToPromptEventCategory:(unint64_t)a3 withReply:(id)a4
{
  id v7 = a4;
  uint64_t v8 = NSStringFromSelector(a2);
  id v9 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];

  BOOL v11 = +[NSString stringWithFormat:@"InterruptMethod_%@", v10];
  [(MODaemonClient *)self _abortIfNeeded:v11];
  CFStringRef v17 = @"MOReadPermissions";
  unsigned int v12 = +[NSArray arrayWithObjects:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __59__MODaemonClient_isAllowedToPromptEventCategory_withReply___block_invoke;
  v15[3] = &unk_1002CDA18;
  id v13 = v7;
  id v16 = v13;
  unsigned int v14 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v12 withErrorHandler:v15];

  if (v14) {
    [(MODaemonClient *)self _isAllowedToPromptEventCategory:a3 withReply:v13];
  }
}

uint64_t __59__MODaemonClient_isAllowedToPromptEventCategory_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_isAllowedToPromptEventCategory:(unint64_t)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, BOOL, void))a4;
  v22[0] = 0;
  v22[1] = v22;
  void v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__18;
  v22[4] = __Block_byref_object_dispose__18;
  id v23 = (id)os_transaction_create();
  uint64_t v8 = [(MODaemonClient *)self _createWatchDogWithName:@"IsAllowedToPromptEventCategory"];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "isAllowedToPrompt event category %@", buf, 0xCu);
  }
  BOOL v11 = [(MOConfigurationManager *)self->_configManager isAllowedToPromptEventCategory:a3];
  unsigned int v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = +[NSNumber numberWithBool:v11];
    *(_DWORD *)buf = 138412290;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "isAllowedToPrompt result: %@", buf, 0xCu);
  }
  v6[2](v6, v11, 0);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = __60__MODaemonClient__isAllowedToPromptEventCategory_withReply___block_invoke;
  uint64_t v19 = &unk_1002CD950;
  id v14 = v8;
  id v20 = v14;
  id v21 = v22;
  int v15 = objc_retainBlock(&v16);
  -[MODaemonClient _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", v15, v16, v17, v18, v19);

  _Block_object_dispose(v22, 8);
}

void __60__MODaemonClient__isAllowedToPromptEventCategory_withReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)logEngagementEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned int v12 = NSStringFromSelector(a2);
  id v13 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v14 = [v12 stringByTrimmingCharactersInSet:v13];

  int v15 = +[NSString stringWithFormat:@"InterruptMethod_%@", v14];
  [(MODaemonClient *)self _abortIfNeeded:v15];
  CFStringRef v18 = @"MOLogEngagement";
  id v16 = +[NSArray arrayWithObjects:&v18 count:1];
  unsigned int v17 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v16 withErrorHandler:&__block_literal_global_458];

  if (v17) {
    [(MODaemonClient *)self _logEngagementEvent:v9 timestamp:v10 withContext:v11];
  }
}

void __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);
  }
}

- (void)_logEngagementEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v23 = a4;
  id v9 = a5;
  id v10 = [(MODaemonClient *)self configManager];
  id v11 = [v10 getTrialExperimentIdentifiers];

  unsigned int v12 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
  id v13 = [v12 getSnapshotDictionaryForAnalytics];

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__18;
  v43[4] = __Block_byref_object_dispose__18;
  id v44 = (id)os_transaction_create();
  id v14 = [(MODaemonClient *)self _createWatchDogWithName:@"logEngagementEvent"];
  int v15 = [v9 objectForKeyedSubscript:@"eventBundles"];
  id v16 = self->_engagementHistoryManager;
  unsigned int v17 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Trial id: %@", buf, 0xCu);
  }

  CFStringRef v18 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v46 = v8;
    __int16 v47 = 2112;
    id v48 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "logEngagementEvent %@ for bundles: '%@'", buf, 0x16u);
  }

  if (v15)
  {
    uint64_t v19 = [[MOEventBundleFetchOptions alloc] initWithIdentifiers:v15 ascending:0 filterBundle:0];
    eventBundleManager = self->_eventBundleManager;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke;
    v33[3] = &unk_1002CDE88;
    id v34 = v14;
    double v35 = v16;
    id v36 = v8;
    id v37 = v23;
    id v38 = v9;
    id v39 = v11;
    id v40 = v13;
    id v41 = self;
    id v42 = v43;
    [(MOEventBundleManager *)eventBundleManager fetchEventBundlesWithOptions:v19 CompletionHandler:v33];
  }
  else
  {
    id v21 = [(MODaemonClient *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_465;
    block[3] = &unk_1002CDEB0;
    id v25 = v14;
    id v26 = v16;
    id v27 = v8;
    id v28 = v23;
    id v29 = v9;
    id v30 = v11;
    id v31 = v13;
    id v32 = v43;
    dispatch_async(v21, block);

    uint64_t v19 = v25;
  }

  _Block_object_dispose(v43, 8);
}

void __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) pet];
  [*(id *)(a1 + 40) didEngagementEventPosted:*(void *)(a1 + 48) withBundles:v7 timestamp:*(void *)(a1 + 56) withContext:*(void *)(a1 + 64) withTrialExperimentIDs:*(void *)(a1 + 72) withOnboardingStatus:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) pet];
  if (([*(id *)(a1 + 48) isEqualToString:@"suggestionsSelected"] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:@"suggestionsQuickAddEntry"] & 1) != 0
    || [*(id *)(a1 + 48) isEqualToString:@"suggestionsDeleted"])
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Selected, quick add, or deleted engagement logged; trigger notification servicing",
        buf,
        2u);
    }

    unsigned int v12 = [*(id *)(a1 + 88) notificationsManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_464;
    v17[3] = &unk_1002CDE60;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 96);
    id v18 = v13;
    uint64_t v19 = v14;
    [v12 serviceSuggestionsNotificationsWithHandler:v17];
  }
  else
  {
    [*(id *)(a1 + 32) cancel];
    uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
}

void __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_464(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Notification scheduling complete, error: %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) cancel];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __60__MODaemonClient__logEngagementEvent_timestamp_withContext___block_invoke_465(uint64_t a1)
{
  [*(id *)(a1 + 32) pet];
  [*(id *)(a1 + 40) didEngagementEventPosted:*(void *)(a1 + 48) withBundles:0 timestamp:*(void *)(a1 + 56) withContext:*(void *)(a1 + 64) withTrialExperimentIDs:*(void *)(a1 + 72) withOnboardingStatus:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 88) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)logPerformanceEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  id v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v12 = @"MOLogPerformance";
  id v10 = +[NSArray arrayWithObjects:&v12 count:1];
  LODWORD(self) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:&__block_literal_global_467];

  if (self)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MODaemonClient logPerformanceEvent:timestamp:withContext:]();
    }
  }
}

void __60__MODaemonClient_logPerformanceEvent_timestamp_withContext___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);
  }
}

- (void)logUsageEvent:(id)a3 timestamp:(id)a4 withContext:(id)a5
{
  id v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v12 = @"MOLogUsage";
  id v10 = +[NSArray arrayWithObjects:&v12 count:1];
  LODWORD(self) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:&__block_literal_global_469];

  if (self)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MODaemonClient logUsageEvent:timestamp:withContext:]();
    }
  }
}

void __54__MODaemonClient_logUsageEvent_timestamp_withContext___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);
  }
}

- (void)didAppEntryUpdateUsingSuggestions:(id)a3 onEvent:(unint64_t)a4 duringInterval:(id)a5 withInfo:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = NSStringFromSelector(a2);
  uint64_t v15 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v16 = [v14 stringByTrimmingCharactersInSet:v15];

  unsigned int v17 = +[NSString stringWithFormat:@"InterruptMethod_%@", v16];
  [(MODaemonClient *)self _abortIfNeeded:v17];
  CFStringRef v47 = @"MOAppEntryEngagement";
  id v18 = +[NSArray arrayWithObjects:&v47 count:1];
  LODWORD(v15) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v18 withErrorHandler:&__block_literal_global_471];

  if (v15)
  {
    uint64_t v19 = [(MODaemonClient *)self configManager];
    id v31 = [v19 getTrialExperimentIdentifiers];

    id v20 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
    id v21 = [v20 getSnapshotDictionaryForAnalytics];

    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x3032000000;
    id v44 = __Block_byref_object_copy__18;
    v45 = __Block_byref_object_dispose__18;
    id v46 = (id)os_transaction_create();
    id v22 = v11;
    id v23 = self->_engagementHistoryManager;
    BOOL v24 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[MODaemonClient didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]((uint64_t)v22, a4, v24);
    }

    id v25 = [(MODaemonClient *)self _createWatchDogWithName:@"didAppEntryUpdateUsingSuggestions"];
    id v26 = v25;
    if (v22)
    {
      id v27 = [[MOEventBundleFetchOptions alloc] initWithIdentifiers:v22 ascending:0 filterBundle:0];
      eventBundleManager = self->_eventBundleManager;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = __84__MODaemonClient_didAppEntryUpdateUsingSuggestions_onEvent_duringInterval_withInfo___block_invoke_476;
      v32[3] = &unk_1002CDF38;
      id v33 = v26;
      id v34 = v23;
      unint64_t v40 = a4;
      id v35 = v12;
      id v36 = v13;
      id v37 = v31;
      id v38 = v21;
      id v39 = &v41;
      [(MOEventBundleManager *)eventBundleManager fetchEventBundlesWithOptions:v27 CompletionHandler:v32];
    }
    else
    {
      [v25 pet];
      id v29 = +[NSDate now];
      -[MOEngagementHistoryManager didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:](v23, "didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:", a4, 0, v29, v12, v13, v31, v21, context);

      [v26 cancel];
      id v27 = (MOEventBundleFetchOptions *)v42[5];
      v42[5] = 0;
    }

    _Block_object_dispose(&v41, 8);
  }
}

void __84__MODaemonClient_didAppEntryUpdateUsingSuggestions_onEvent_duringInterval_withInfo___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);
  }
}

void __84__MODaemonClient_didAppEntryUpdateUsingSuggestions_onEvent_duringInterval_withInfo___block_invoke_476(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 pet];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 88);
  int v7 = +[NSDate now];
  [v5 didAppEntryEventPosted:v6 withBundles:v4 timestamp:v7 duringInterval:*(void *)(a1 + 48) withInfo:*(void *)(a1 + 56) withTrialExperimentIDs:*(void *)(a1 + 64) withOnboardingStatus:*(void *)(a1 + 72)];

  [*(id *)(a1 + 32) cancel];
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)getDiagnosticReporterConfiguration:(id)a3
{
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  v15[0] = @"MOPromptManagerTest";
  v15[1] = @"MOOnboardingAndSettings";
  id v10 = +[NSArray arrayWithObjects:v15 count:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __53__MODaemonClient_getDiagnosticReporterConfiguration___block_invoke;
  v13[3] = &unk_1002CDA18;
  id v11 = v5;
  id v14 = v11;
  unsigned int v12 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v13];

  if (v12) {
    [(MODaemonClient *)self _getDiagnosticReporterConfiguration:v11];
  }
}

void __53__MODaemonClient_getDiagnosticReporterConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)_getDiagnosticReporterConfiguration:(id)a3
{
  id v30 = (void (**)(id, void *, void))a3;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__18;
  v35[4] = __Block_byref_object_dispose__18;
  id v36 = (id)os_transaction_create();
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "getDiagnosticReporterConfiguration", buf, 2u);
  }

  id v21 = [(MODaemonClient *)self _createWatchDogWithName:@"GetDiagnosticReporterConfiguration"];
  v37[0] = @"DiagnosticReporterRefractoryPeriodAfterAcceptance";
  id v29 = [(MODaemonClient *)self configManager];
  LODWORD(v5) = 1202241536;
  [v29 getFloatSettingForKey:@"DiagnosticReporterOverrideRefractoryPeriodAfterAcceptance" withFallback:v5];
  id v28 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v38[0] = v28;
  v37[1] = @"DiagnosticReporterRefractoryPeriodAfterRejection";
  id v27 = [(MODaemonClient *)self configManager];
  LODWORD(v6) = 1185464320;
  [v27 getFloatSettingForKey:@"DiagnosticReporterOverrideRefractoryPeriodAfterRejection" withFallback:v6];
  id v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v38[1] = v26;
  v37[2] = @"DiagnosticReporterAvoidNotification";
  id v25 = [(MODaemonClient *)self configManager];
  BOOL v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 getBoolSettingForKey:@"DiagnosticReporterOverrideAvoidNotification" withFallback:0]);
  v38[2] = v24;
  v37[3] = @"DiagnosticReporterForceNotification";
  id v23 = [(MODaemonClient *)self configManager];
  id v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v23 getBoolSettingForKey:@"DiagnosticReporterOverrideForceNotification" withFallback:0]);
  v38[3] = v22;
  void v37[4] = @"DiagnosticReporterTimeOfLastNotification";
  int v7 = [(MODaemonClient *)self configManager];
  [v7 getDoubleSettingForKey:@"DiagnosticReporterLastIncidentTime" withFallback:0.0];
  uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[4] = v8;
  v37[5] = @"DiagnosticReporterIsInternalBuild";
  id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MOPlatformInfo isInternalBuild]);
  v38[5] = v9;
  v37[6] = @"DiagnosticReporterOnboardingStatus";
  id v10 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 getOnboardingFlowCompletionStatus]);
  v38[6] = v11;
  v37[7] = @"DiagnosticReporterMaxTimeout";
  unsigned int v12 = [(MODaemonClient *)self configManager];
  id v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 getIntegerSettingForKey:@"DiagnosticReporterOverrideMaxTimeout" withFallback:10]);
  v38[7] = v13;
  v37[8] = @"DiagnosticReporterIsOnboardedOnDiagnosticReporter";
  id v14 = [(MODaemonClient *)self configManager];
  uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v14 getBoolSettingForKey:@"DiagnosticReporterOverrideIsOnboardedOnDiagnosticReporter" withFallback:0]);
  v38[8] = v15;
  id v20 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:9];

  [v21 pet];
  if (v30)
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[MODaemonClient _getDiagnosticReporterConfiguration:]();
    }

    v30[2](v30, v20, 0);
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  void v31[2] = __54__MODaemonClient__getDiagnosticReporterConfiguration___block_invoke;
  v31[3] = &unk_1002CD950;
  id v17 = v21;
  id v32 = v17;
  id v33 = v35;
  id v18 = objc_retainBlock(v31);
  [(MODaemonClient *)self _scheduleSendBarrierBlock:v18];

  _Block_object_dispose(v35, 8);
}

void __54__MODaemonClient__getDiagnosticReporterConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)getApplicationsWithDataAccess:(id)a3
{
  id v5 = a3;
  double v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  v15[0] = @"MOPromptManagerTest";
  v15[1] = @"MOOnboardingAndSettings";
  id v10 = +[NSArray arrayWithObjects:v15 count:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __48__MODaemonClient_getApplicationsWithDataAccess___block_invoke;
  v13[3] = &unk_1002CDA18;
  id v11 = v5;
  id v14 = v11;
  unsigned int v12 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v13];

  if (v12) {
    [(MODaemonClient *)self _getApplicationsWithDataAccess:v11];
  }
}

void __48__MODaemonClient_getApplicationsWithDataAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)_getApplicationsWithDataAccess:(id)a3
{
  id v4 = a3;
  id v5 = [(MODaemonClient *)self dataAccessManager];
  [v5 getApplicationsWithDataAccess:v4];
}

- (void)registerApplicationsForDataAccess:(id)a3
{
  id v5 = a3;
  double v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  v12[0] = @"MOPromptManagerTest";
  v12[1] = @"MOOnboardingAndSettings";
  id v10 = +[NSArray arrayWithObjects:v12 count:2];
  unsigned int v11 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:&__block_literal_global_503];

  if (v11) {
    [(MODaemonClient *)self _registerApplicationsForDataAccess:v5];
  }
}

void __52__MODaemonClient_registerApplicationsForDataAccess___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);
  }
}

- (void)_registerApplicationsForDataAccess:(id)a3
{
  id v4 = a3;
  id v5 = [(MODaemonClient *)self dataAccessManager];
  [v5 registerApplicationsForDataAccess:v4];
}

- (void)getClientsWithDataAccess:(id)a3
{
  id v5 = a3;
  double v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  v15[0] = @"MOPromptManagerTest";
  v15[1] = @"MOOnboardingAndSettings";
  id v10 = +[NSArray arrayWithObjects:v15 count:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __43__MODaemonClient_getClientsWithDataAccess___block_invoke;
  v13[3] = &unk_1002CDA18;
  id v11 = v5;
  id v14 = v11;
  unsigned int v12 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v13];

  if (v12) {
    [(MODaemonClient *)self _getClientsWithDataAccess:v11];
  }
}

void __43__MODaemonClient_getClientsWithDataAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)_getClientsWithDataAccess:(id)a3
{
  id v4 = a3;
  id v5 = [(MODaemonClient *)self dataAccessManager];
  [v5 getClientsWithDataAccess:v4];
}

- (void)registerClientsForDataAccess:(id)a3
{
  id v5 = a3;
  double v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  v12[0] = @"MOPromptManagerTest";
  v12[1] = @"MOOnboardingAndSettings";
  id v10 = +[NSArray arrayWithObjects:v12 count:2];
  unsigned int v11 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:&__block_literal_global_505];

  if (v11) {
    [(MODaemonClient *)self _registerClientsForDataAccess:v5];
  }
}

void __47__MODaemonClient_registerClientsForDataAccess___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(v2);
  }
}

- (void)_registerClientsForDataAccess:(id)a3
{
  id v4 = a3;
  id v5 = [(MODaemonClient *)self dataAccessManager];
  [v5 registerClientsForDataAccess:v4];
}

- (void)printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned int v12 = NSStringFromSelector(a2);
  id v13 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v14 = [v12 stringByTrimmingCharactersInSet:v13];

  uint64_t v15 = +[NSString stringWithFormat:@"InterruptMethod_%@", v14];
  [(MODaemonClient *)self _abortIfNeeded:v15];
  CFStringRef v18 = @"MOPromptManagerTest";
  id v16 = +[NSArray arrayWithObjects:&v18 count:1];
  unsigned int v17 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v16 withErrorHandler:v11];

  if (v17) {
    [(MODaemonClient *)self _printSettingValue:v9 withType:v10 handler:v11];
  }
}

- (void)_printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "printSettingValue", (uint8_t *)&v20, 2u);
  }

  unsigned int v12 = [(MODaemonClient *)self _createWatchDogWithName:@"PrintSettingValue"];
  if (([v9 isEqual:@"string"] & 1) != 0
    || [v9 isEqual:@"str"])
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(MODaemonClient *)self configManager];
      uint64_t v15 = [v14 getStringSettingForKey:v8 withFallback:&stru_1002D2AC8];
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v15;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "printSettingValue: name=%@, value=%@, type=%@", (uint8_t *)&v20, 0x20u);
    }
    goto LABEL_16;
  }
  if (([v9 isEqual:@"integer"] & 1) != 0
    || [v9 isEqual:@"int"])
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    id v16 = [(MODaemonClient *)self configManager];
    unsigned int v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v16 getIntegerSettingForKey:v8 withFallback:0]);
    int v20 = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v9;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "printSettingValue: name=%@, value=%@, type=%@", (uint8_t *)&v20, 0x20u);

    goto LABEL_16;
  }
  if (([v9 isEqual:@"BOOLean"] & 1) != 0
    || [v9 isEqual:@"BOOL"])
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    id v16 = [(MODaemonClient *)self configManager];
    unsigned int v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 getBoolSettingForKey:v8 withFallback:0]);
    int v20 = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v9;
    goto LABEL_15;
  }
  if ([v9 isEqual:@"float"])
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    id v16 = [(MODaemonClient *)self configManager];
    [v16 getFloatSettingForKey:v8 withFallback:0.0];
    unsigned int v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    int v20 = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v9;
    goto LABEL_15;
  }
  unsigned int v18 = [v9 isEqual:@"double"];
  uint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  id v13 = v19;
  if (v18)
  {
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    id v16 = [(MODaemonClient *)self configManager];
    [v16 getDoubleSettingForKey:v8 withFallback:0.0];
    unsigned int v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    int v20 = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v9;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[MODaemonClient _printSettingValue:withType:handler:]();
  }
LABEL_16:

  [v12 pet];
  v10[2](v10, 0);

  [v12 cancel];
}

- (void)printOnboardingStatusAnalytics:(id)a3
{
  id v5 = a3;
  double v6 = NSStringFromSelector(a2);
  int v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v12 = @"MOPromptManagerTest";
  id v10 = +[NSArray arrayWithObjects:&v12 count:1];
  unsigned int v11 = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v5];

  if (v11) {
    [(MODaemonClient *)self _printOnboardingStatusAnalytics:v5];
  }
}

- (void)_printOnboardingStatusAnalytics:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "printOnboardingStatusAnalytics", v8, 2u);
  }

  double v6 = [(MODaemonClient *)self _createWatchDogWithName:@"PrintOnboardingStatusAnalytics"];
  int v7 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
  [v7 publishOnboardingStatusAnalytics];

  [v6 pet];
  v4[2](v4, 0);

  [v6 cancel];
}

- (void)printEvergreenBundlesWithSeed:(unint64_t)a3 handler:(id)a4
{
  id v7 = a4;
  id v8 = NSStringFromSelector(a2);
  id v9 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];

  unsigned int v11 = +[NSString stringWithFormat:@"InterruptMethod_%@", v10];
  [(MODaemonClient *)self _abortIfNeeded:v11];
  CFStringRef v25 = @"MOFetchEventBundles";
  CFStringRef v12 = +[NSArray arrayWithObjects:&v25 count:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke;
  v23[3] = &unk_1002CDA18;
  id v13 = v7;
  id v24 = v13;
  LODWORD(v9) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v12 withErrorHandler:v23];

  if (v9)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__18;
    void v21[4] = __Block_byref_object_dispose__18;
    id v22 = (id)os_transaction_create();
    id v14 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonClient);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[MODaemonClient printEvergreenBundlesWithSeed:handler:]();
    }

    uint64_t v15 = [(MODaemonClient *)self evergreenManager];
    id v16 = +[NSDate now];
    unsigned int v17 = +[NSDate now];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke_540;
    v18[3] = &unk_1002CDFA0;
    id v19 = v13;
    int v20 = v21;
    [v15 performAnnotationWithSeed:a3 startDate:v16 endDate:v17 handler:v18];

    _Block_object_dispose(v21, 8);
  }
}

uint64_t __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__MODaemonClient_printEvergreenBundlesWithSeed_handler___block_invoke_540(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218242;
    id v11 = [v5 count];
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "evergreen annotation manager event bundles, %lu, error, %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)triggerFeedbackAssistantFlow:(id)a3 handler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  +[MOFeedbackAssistant triggerFeedbackAssistantFlowWithFlowIdentifier:a3];
  v5[2](v5, 0);
}

- (void)getOnboardingFlowCompletionStatusWithHandler:(id)a3
{
  id v5 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__18;
  void v17[4] = __Block_byref_object_dispose__18;
  id v18 = (id)os_transaction_create();
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v19 = @"MOOnboardingAndSettings";
  int v10 = +[NSArray arrayWithObjects:&v19 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke;
  v15[3] = &unk_1002CDA18;
  id v11 = v5;
  id v16 = v11;
  LOBYTE(v7) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v15];

  if (v7)
  {
    __int16 v12 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
    (*((void (**)(id, id))v11 + 2))(v11, [v12 getOnboardingFlowCompletionStatus]);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke_2;
    v14[3] = &unk_1002CB4F0;
    void v14[4] = v17;
    id v13 = objc_retainBlock(v14);
    [(MODaemonClient *)self _scheduleSendBarrierBlock:v13];
  }
  _Block_object_dispose(v17, 8);
}

uint64_t __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MODaemonClient_getOnboardingFlowCompletionStatusWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__18;
  void v14[4] = __Block_byref_object_dispose__18;
  id v15 = (id)os_transaction_create();
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v16 = @"MOOnboardingAndSettings";
  int v10 = +[NSArray arrayWithObjects:&v16 count:1];
  LOBYTE(v7) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:&__block_literal_global_545];

  if (v7)
  {
    id v11 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
    [v11 setOnboardingFlowCompletionStatus:a3];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __52__MODaemonClient_setOnboardingFlowCompletionStatus___block_invoke_2;
    v13[3] = &unk_1002CB4F0;
    void v13[4] = v14;
    __int16 v12 = objc_retainBlock(v13);
    [(MODaemonClient *)self _scheduleSendBarrierBlock:v12];
  }
  _Block_object_dispose(v14, 8);
}

void __52__MODaemonClient_setOnboardingFlowCompletionStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)getOnboardingFlowRefreshCompletionStatusWithHandler:(id)a3
{
  id v5 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__18;
  void v17[4] = __Block_byref_object_dispose__18;
  id v18 = (id)os_transaction_create();
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[NSString stringWithFormat:@"InterruptMethod_%@", v8];
  [(MODaemonClient *)self _abortIfNeeded:v9];
  CFStringRef v19 = @"MOOnboardingAndSettings";
  int v10 = +[NSArray arrayWithObjects:&v19 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke;
  v15[3] = &unk_1002CDA18;
  id v11 = v5;
  id v16 = v11;
  LOBYTE(v7) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v10 withErrorHandler:v15];

  if (v7)
  {
    __int16 v12 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
    (*((void (**)(id, id))v11 + 2))(v11, [v12 getOnboardingFlowRefreshCompletionStatus]);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2;
    v14[3] = &unk_1002CB4F0;
    void v14[4] = v17;
    id v13 = objc_retainBlock(v14);
    [(MODaemonClient *)self _scheduleSendBarrierBlock:v13];
  }
  _Block_object_dispose(v17, 8);
}

uint64_t __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__MODaemonClient_getOnboardingFlowRefreshCompletionStatusWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)getStateForSetting:(unint64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__18;
  void v19[4] = __Block_byref_object_dispose__18;
  id v20 = (id)os_transaction_create();
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  int v10 = [v8 stringByTrimmingCharactersInSet:v9];

  id v11 = +[NSString stringWithFormat:@"InterruptMethod_%@", v10];
  [(MODaemonClient *)self _abortIfNeeded:v11];
  CFStringRef v21 = @"MOOnboardingAndSettings";
  __int16 v12 = +[NSArray arrayWithObjects:&v21 count:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __49__MODaemonClient_getStateForSetting_withHandler___block_invoke;
  v17[3] = &unk_1002CDA18;
  id v13 = v7;
  id v18 = v13;
  LOBYTE(v9) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v12 withErrorHandler:v17];

  if (v9)
  {
    id v14 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
    (*((void (**)(id, id))v13 + 2))(v13, [v14 getStateForSetting:a3]);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __49__MODaemonClient_getStateForSetting_withHandler___block_invoke_2;
    v16[3] = &unk_1002CB4F0;
    void v16[4] = v19;
    id v15 = objc_retainBlock(v16);
    [(MODaemonClient *)self _scheduleSendBarrierBlock:v15];
  }
  _Block_object_dispose(v19, 8);
}

uint64_t __49__MODaemonClient_getStateForSetting_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__MODaemonClient_getStateForSetting_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)getStateForSettingFast:(unint64_t)a3 withHandler:(id)a4
{
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__18;
  void v19[4] = __Block_byref_object_dispose__18;
  id v20 = (id)os_transaction_create();
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  int v10 = [v8 stringByTrimmingCharactersInSet:v9];

  id v11 = +[NSString stringWithFormat:@"InterruptMethod_%@", v10];
  [(MODaemonClient *)self _abortIfNeeded:v11];
  CFStringRef v21 = @"MOOnboardingAndSettings";
  __int16 v12 = +[NSArray arrayWithObjects:&v21 count:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke;
  v17[3] = &unk_1002CDA18;
  id v13 = v7;
  id v18 = v13;
  LOBYTE(v9) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v12 withErrorHandler:v17];

  if (v9)
  {
    id v14 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
    (*((void (**)(id, id))v13 + 2))(v13, [v14 getStateForSettingFast:a3]);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke_2;
    v16[3] = &unk_1002CB4F0;
    void v16[4] = v19;
    id v15 = objc_retainBlock(v16);
    [(MODaemonClient *)self _scheduleSendBarrierBlock:v15];
  }
  _Block_object_dispose(v19, 8);
}

uint64_t __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__MODaemonClient_getStateForSettingFast_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  BOOL v5 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__18;
  void v16[4] = __Block_byref_object_dispose__18;
  id v17 = (id)os_transaction_create();
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
  int v10 = [v8 stringByTrimmingCharactersInSet:v9];

  id v11 = +[NSString stringWithFormat:@"InterruptMethod_%@", v10];
  [(MODaemonClient *)self _abortIfNeeded:v11];
  CFStringRef v18 = @"MOOnboardingAndSettings";
  __int16 v12 = +[NSArray arrayWithObjects:&v18 count:1];
  LOBYTE(v9) = [(MODaemonClient *)self validateIfActiveClientHasAnyEntitlementInArray:v12 withErrorHandler:&__block_literal_global_550];

  if (v9)
  {
    id v13 = [(MODaemonClient *)self onboardingAndSettingsPersistence];
    [v13 setState:v5 forSetting:a4];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = __38__MODaemonClient_setState_forSetting___block_invoke_2;
    v15[3] = &unk_1002CB4F0;
    void v15[4] = v16;
    id v14 = objc_retainBlock(v15);
    [(MODaemonClient *)self _scheduleSendBarrierBlock:v14];
  }
  _Block_object_dispose(v16, 8);
}

void __38__MODaemonClient_setState_forSetting___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)_createWatchDogWithName:(id)a3
{
  configManager = self->_configManager;
  id v5 = a3;
  id v6 = +[NSString stringWithFormat:@"%@_%@", @"WatchdogOverrideDefaultCadenceInSeconds", v5];
  *(float *)&double v7 = self->_watchdogCadence;
  [(MOConfigurationManagerBase *)configManager getFloatSettingForKey:v6 withFallback:v7];
  int v9 = v8;

  int v10 = [MOWatchDog alloc];
  LODWORD(v11) = v9;
  __int16 v12 = [(MOWatchDog *)v10 initWithName:v5 cadenceInSeconds:0 andHandler:v11];

  return v12;
}

- (void)acquireBackgroundProcessingPermissionsForMomentsWithHander:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(MODaemonClient *)self persistenceManager];
  id v6 = [v5 acquireBackgroundProcessingPermissions];

  double v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    CFStringRef v8 = @"fail";
    if (v6) {
      CFStringRef v8 = @"success";
    }
    int v9 = 138412290;
    CFStringRef v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "acquireBackgroundProcessingPermissionsForDB, result, %@", (uint8_t *)&v9, 0xCu);
  }

  v4[2](v4, v6);
}

- (MODaemonSPINotifier)notifier
{
  return self->_notifier;
}

- (MODaemonClientConnectionEntitlementDelegate)entitlementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entitlementDelegate);

  return (MODaemonClientConnectionEntitlementDelegate *)WeakRetained;
}

- (void)setEntitlementDelegate:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (NSLock)scheduledTaskLock
{
  return self->_scheduledTaskLock;
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
}

- (MODataAccessManager)dataAccessManager
{
  return self->_dataAccessManager;
}

- (void)setDataAccessManager:(id)a3
{
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (MOEventBundleManager)eventBundleManager
{
  return self->_eventBundleManager;
}

- (void)setEventBundleManager:(id)a3
{
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (void)setEngagementHistoryManager:(id)a3
{
}

- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence
{
  return self->_onboardingAndSettingsPersistence;
}

- (void)setOnboardingAndSettingsPersistence:(id)a3
{
}

- (MONotificationsManager)notificationsManager
{
  return self->_notificationsManager;
}

- (void)setNotificationsManager:(id)a3
{
}

- (MOEvergreenAnnotationManager)evergreenManager
{
  return self->_evergreenManager;
}

- (void)setEvergreenManager:(id)a3
{
}

- (MOPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_evergreenManager, 0);
  objc_storeStrong((id *)&self->_notificationsManager, 0);
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_eventBundleManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataAccessManager, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_scheduledTaskLock, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_entitlementDelegate);

  objc_storeStrong((id *)&self->_notifier, 0);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventManager", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventBundleManager", v2, v3, v4, v5, v6);
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_399_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Finished data dump if allowed.", v2, v3, v4, v5, v6);
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_405_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Refresh finished.", v2, v3, v4, v5, v6);
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_405_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Refresh finished with error.", v2, v3, v4, v5, v6);
}

void __89__MODaemonClient__refreshEventsWithContext_andRefreshVariant_andSoftKindFlag_andHandler___block_invoke_415_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Refresh: Exiting early due to errors in collect: %@", v1, 0xCu);
}

void __59__MODaemonClient_logEngagementEvent_timestamp_withContext___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 userInfo];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "client entitlement error: %@", v4, v5, v6, v7, v8);
}

- (void)logPerformanceEvent:timestamp:withContext:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "logPerformanceEvent not implemented", v2, v3, v4, v5, v6);
}

- (void)logUsageEvent:timestamp:withContext:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "logUsageEvent not implemented", v2, v3, v4, v5, v6);
}

- (void)didAppEntryUpdateUsingSuggestions:(os_log_t)log onEvent:duringInterval:withInfo:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "didAppEntryUpdateUsingSuggestions event %lu was created for bundles: '%@'", (uint8_t *)&v3, 0x16u);
}

- (void)_getDiagnosticReporterConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Sending diagnostic reporter configuration %@", v1, 0xCu);
}

- (void)_printSettingValue:withType:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "printSettingValue: could not understand requested setting name=%@, type=%@", v2, 0x16u);
}

- (void)printEvergreenBundlesWithSeed:handler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "printEvergreenBundlesWithSeed, seed, %lu _test", v1, 0xCu);
}

@end