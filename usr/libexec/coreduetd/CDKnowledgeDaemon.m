@interface CDKnowledgeDaemon
+ (id)defaultDaemon;
+ (id)defaultUserDaemon;
- (ARPCorrelationTaskScheduler)airplayTaskScheduler;
- (BOOL)isClassCLocked;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDKnowledgeDaemon)init;
- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3;
- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3 storePath:(id)a4;
- (_CDIntentSpotlightIndex)intentSpotlightIndex;
- (_DKKnowledgeStorage)storage;
- (_DKSyncCoordinator)syncCoordinator;
- (id)classCError;
- (id)confirmDatabaseConnectionError;
- (void)confirmDatabaseConnectionWithReply:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4;
- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4;
- (void)deleteObjects:(id)a3 reply:(id)a4;
- (void)deleteRemoteState:(id)a3;
- (void)deviceUUIDWithReply:(id)a3;
- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)executeQuery:(id)a3 reply:(id)a4;
- (void)handleError:(id)a3;
- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5;
- (void)logSizeOfStorage:(id)a3;
- (void)maintainPrivacyWithActivity:(id)a3;
- (void)registerARPHomeControlNotificationTask;
- (void)registerAirPlayTasks;
- (void)registerCDFTCPInteractionDataCollectionTask;
- (void)registerCDInteractionDataCollectionTask;
- (void)registerCloudFamilyPredictionTask;
- (void)registerContactsAutocompleteFeedbackProcessingTask;
- (void)registerDataCollectionTasks;
- (void)registerMediaAnalysisProcessingTask;
- (void)registerPersonLinkingDataCollectionTask;
- (void)registerVisionSignalGradingDataCollectionTask;
- (void)reportEventStatistics;
- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4;
- (void)saveObjects:(id)a3 reply:(id)a4;
- (void)setAirplayTaskScheduler:(id)a3;
- (void)setIntentSpotlightIndex:(id)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)sourceDeviceIdentityWithReply:(id)a3;
- (void)synchronizeWithReply:(id)a3;
- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5;
@end

@implementation CDKnowledgeDaemon

+ (id)defaultDaemon
{
  if (qword_100040F38 != -1) {
    dispatch_once(&qword_100040F38, &stru_100038FD0);
  }
  v2 = (void *)qword_100040F30;

  return v2;
}

+ (id)defaultUserDaemon
{
  if (qword_100040F50 != -1) {
    dispatch_once(&qword_100040F50, &stru_100038FF0);
  }
  v2 = (void *)qword_100040F48;

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = _DKDaemonInterface();
  [v5 setExportedInterface:v6];

  v7 = [v5 valueForEntitlement:@"com.apple.coreduetd.allow"];
  v8 = v7;
  if (v7 && [v7 BOOLValue])
  {
    v9 = objc_alloc_init(CDKnowledgeDaemonConnection);
    [(CDKnowledgeDaemonConnection *)v9 setDaemon:self];
    memset(&audittoken, 0, sizeof(audittoken));
    if (v5) {
      [v5 auditToken];
    }
    if (proc_pidpath_audittoken(&audittoken, buffer, 0x1000u) < 1)
    {
      v12 = [v5 valueForEntitlement:@"application-identifier"];
      if (!v12)
      {
        v19 = [v5 valueForEntitlement:@"com.apple.application-identifier"];
        [(CDKnowledgeDaemonConnection *)v9 setProcessName:v19];

        goto LABEL_15;
      }
    }
    else
    {
      v10 = strrchr(buffer, 47);
      if (v10) {
        v11 = v10 + 1;
      }
      else {
        v11 = buffer;
      }
      v12 = +[NSString stringWithUTF8String:v11];
    }
    [(CDKnowledgeDaemonConnection *)v9 setProcessName:v12];
LABEL_15:

    v14 = [(CDKnowledgeDaemonConnection *)v9 processName];

    if (!v14)
    {
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"pid:%d", [v5 processIdentifier]);
      [(CDKnowledgeDaemonConnection *)v9 setProcessName:v15];
    }
    [(CDKnowledgeDaemonConnection *)v9 setAuthorizedEventStreamsToRead:0];
    [v5 setExportedObject:v9];
    [v5 setDelegate:self];
    v16 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [v5 processIdentifier];
      *(_DWORD *)buf = 67109120;
      unsigned int v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Connection from PID %d accepted", buf, 8u);
    }

    [v5 resume];
    BOOL v13 = 1;
    goto LABEL_20;
  }
  v9 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
    sub_100021F00(v5, &v9->super);
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

- (CDKnowledgeDaemon)init
{
  return [(CDKnowledgeDaemon *)self initWithMachServiceName:_DKMachServiceName];
}

- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  id v5 = +[CDDPaths knowledgeDatabaseDirectory];
  v6 = [(CDKnowledgeDaemon *)self initWithMachServiceName:v4 storePath:v5];

  return v6;
}

- (CDKnowledgeDaemon)initWithMachServiceName:(id)a3 storePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)CDKnowledgeDaemon;
  v8 = [(CDKnowledgeDaemon *)&v42 initWithMachServiceName:v6];
  if (v8)
  {
    uint64_t v9 = +[_DKKnowledgeStorage storageWithDirectory:v7 readOnly:0];
    storage = v8->_storage;
    v8->_storage = (_DKKnowledgeStorage *)v9;

    v11 = (_DKDataProtectionStateMonitor *)objc_alloc_init((Class)_DKDataProtectionStateMonitor);
    dataProtection = v8->_dataProtection;
    v8->_dataProtection = v11;

    [(CDKnowledgeDaemon *)v8 setDelegate:v8];
    uint64_t v13 = +[_DKRateLimitPolicyEnforcer rateLimitPolicyEnforcer];
    rateLimitEnforcer = v8->_rateLimitEnforcer;
    v8->_rateLimitEnforcer = (_DKRateLimitPolicyEnforcer *)v13;

    uint64_t v15 = +[_DKPrivacyPolicyEnforcer privacyPolicyEnforcer];
    privacyEnforcer = v8->_privacyEnforcer;
    v8->_privacyEnforcer = (_DKPrivacyPolicyEnforcer *)v15;

    unsigned int v17 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.startSanitizingKnowledgeStore", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v17, &state);
    os_activity_scope_leave(&state);

    v18 = +[_CDSiriLearningSettings sharedInstance];
    [v18 startSanitizingKnowledgeStore:v8->_storage];

    objc_initWeak(&location, v8);
    v19 = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_DAY];
    [v19 doubleValue];
    double v21 = v20;
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_1000199B4;
    v38 = &unk_100039018;
    id v39 = 0;
    objc_copyWeak(&v40, &location);
    unsigned int v22 = +[_CDPeriodicSchedulerJob jobWithInterval:v6 schedulerJobName:&v35 handler:v21];

    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v45 = XPC_ACTIVITY_PRIORITY;
    v46 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    uint64_t v47 = XPC_ACTIVITY_POWER_NAP;
    v48 = XPC_ACTIVITY_ALLOW_BATTERY;
    uint64_t v49 = XPC_ACTIVITY_MEMORY_INTENSIVE;
    uint64_t v50 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    id v23 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v24 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    id v25 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    id v26 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    id v27 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    id v28 = &_xpc_BOOL_true;
    values[7] = &_xpc_BOOL_true;
    uint64_t v29 = +[NSDate distantPast];
    bookmark = v8->_bookmark;
    v8->_bookmark = (NSDate *)v29;

    xpc_object_t v31 = xpc_dictionary_create((const char *const *)&state, values, 8uLL);
    [v22 setExecutionCriteria:v31];

    v32 = +[_CDPeriodicScheduler sharedInstance];
    [v32 registerJob:v22];

    [(CDKnowledgeDaemon *)v8 resume];
    for (uint64_t i = 7; i != -1; --i)

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (BOOL)isClassCLocked
{
  return [(_DKDataProtectionStateMonitor *)self->_dataProtection isDataAvailableFor:NSFileProtectionCompleteUntilFirstUserAuthentication] ^ 1;
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  if (v4
    && +[_CDErrorUtilities isCoreDataFatalError:v4])
  {
    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.deletedDB.knowledgebase.corrupted"];
    id v5 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100022ADC();
    }

    [(_DKKnowledgeStorage *)self->_storage deleteStorage];
  }
}

- (id)classCError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"device is not class C unlocked";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v3 = +[NSError errorWithDomain:@"com.apple.coreduet" code:0 userInfo:v2];

  return v3;
}

- (void)saveObjects:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(CDKnowledgeDaemon *)self isClassCLocked])
  {
    v8 = [(CDKnowledgeDaemon *)self classCError];
    v7[2](v7, 0, v8);
  }
  else
  {
    v10 = [(_DKRateLimitPolicyEnforcer *)self->_rateLimitEnforcer filterObjectsByEnforcingRateLimit:v6];
    v11 = [(_DKPrivacyPolicyEnforcer *)self->_privacyEnforcer enforcePrivacy:v10];
    v12 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100022B50(v11);
    }

    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", [v11 count], @"com.apple.coreduet.knowledgeStore.saveObjectsCount");
    storage = self->_storage;
    id v17 = 0;
    id v14 = [(_DKKnowledgeStorage *)storage saveObjects:v11 error:&v17];
    id v15 = v17;
    if (v7)
    {
      v16 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v15];
      ((void (**)(id, id, void *))v7)[2](v7, v14, v16);
    }
    [(CDKnowledgeDaemon *)self handleError:v15];
  }
}

- (void)deleteObjects:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(CDKnowledgeDaemon *)self isClassCLocked])
  {
    v8 = [(CDKnowledgeDaemon *)self classCError];
    v7[2](v7, 0, v8);
  }
  else
  {
    [(_DKRateLimitPolicyEnforcer *)self->_rateLimitEnforcer creditForDeletion:v6];
    uint64_t v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100022BC8(v6);
    }

    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", [v6 count], @"com.apple.coreduet.knowledgeStore.deleteObjectsCount");
    storage = self->_storage;
    id v15 = 0;
    id v12 = [(_DKKnowledgeStorage *)storage deleteObjects:v6 error:&v15];
    id v13 = v15;
    if (v7)
    {
      id v14 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v13];
      ((void (**)(id, id, void *))v7)[2](v7, v12, v14);
    }
    [(CDKnowledgeDaemon *)self handleError:v13];
  }
}

- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = +[_DKQuery predicateForEventsWithStreamName:a3];
  [(CDKnowledgeDaemon *)self deleteAllEventsMatchingPredicate:v7 reply:v6];
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (![(CDKnowledgeDaemon *)self isClassCLocked])
  {
    if (v6)
    {
      id v15 = 0;
      unsigned int v9 = +[_DKPredicateValidator validatePredicate:v6 allowedKeys:0 error:&v15];
      id v10 = v15;
      if (!v9)
      {
        id v13 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_100022C40();
        }

        v7[2](v7, 0, v10);
        goto LABEL_10;
      }
      [v6 allowEvaluation];
    }
    storage = self->_storage;
    id v14 = 0;
    id v12 = [(_DKKnowledgeStorage *)storage deleteAllEventsMatchingPredicate:v6 error:&v14];
    id v10 = v14;
    ((void (**)(id, id, id))v7)[2](v7, v12, v10);
LABEL_10:

    goto LABEL_11;
  }
  v8 = [(CDKnowledgeDaemon *)self classCError];
  v7[2](v7, 0, v8);

LABEL_11:
}

- (void)executeQuery:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(CDKnowledgeDaemon *)self isClassCLocked])
  {
    v8 = [(CDKnowledgeDaemon *)self classCError];
    v7[2](v7, 0, v8);
  }
  else
  {
    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.knowledgeStore.executeQueryCount"];
    storage = self->_storage;
    id v13 = 0;
    id v10 = [(_DKKnowledgeStorage *)storage executeQuery:v6 error:&v13];
    id v11 = v13;
    id v12 = +[_CDErrorUtilities transformErrorForNSSecureCoding:v11];
    ((void (**)(id, void *, void *))v7)[2](v7, v10, v12);

    [(CDKnowledgeDaemon *)self handleError:v11];
  }
}

- (void)maintainPrivacyWithActivity:(id)a3
{
  id v4 = (_xpc_activity_s *)a3;
  NSErrorUserInfoKey v5 = (void *)os_transaction_create();
  v43 = self;
  +[_DKStandingQueryExecutor executeAllStandingQueriesWithStorage:self->_storage activity:v4];
  if (!v4 || !xpc_activity_should_defer(v4))
  {
    id v40 = v5;
    activity = v4;
    id v45 = objc_alloc_init((Class)NSMutableArray);
    id v8 = objc_alloc_init((Class)NSMutableArray);
    +[LSApplicationRecord enumeratorWithOptions:0];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v46 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v53 != v46) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v14 = [v12 bundleIdentifier];
          if (v14) {
            [v45 addObject:v14];
          }
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v15 = [v12 applicationExtensionRecords:v40];
          id v16 = [v15 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v49;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v49 != v18) {
                  objc_enumerationMutation(v15);
                }
                double v20 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) effectiveBundleIdentifier];
                if (v20) {
                  [v8 addObject:v20];
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }
            while (v17);
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v10);
    }

    id v7 = v45;
    id v21 = v8;
    id v4 = activity;
    if (activity)
    {
      unsigned int v22 = v43;
      if (xpc_activity_should_defer(activity))
      {
        uint64_t v23 = +[_CDLogging knowledgeChannel];
        NSErrorUserInfoKey v5 = v40;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v24 = "Privacy maintenance deferred after installedApps query.";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:v43->_storage installedApps:v7 installedAppExtensions:v21 deleteMaxCount:4000 objectMaxCount:100000 objectMaxLifespan:activity activity:2419200.0];
      if (xpc_activity_should_defer(activity))
      {
        uint64_t v23 = +[_CDLogging knowledgeChannel];
        NSErrorUserInfoKey v5 = v40;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v24 = "Privacy maintenance deferred after maintain privacy.";
          goto LABEL_31;
        }
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {
      unsigned int v22 = v43;
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:v43->_storage installedApps:v7 installedAppExtensions:v21 deleteMaxCount:4000 objectMaxCount:100000 objectMaxLifespan:0 activity:2419200.0];
    }
    id v28 = [(CDKnowledgeDaemon *)v22 airplayTaskScheduler];
    [v28 executeCorrelationTask];

    id v29 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.AirPlayRoutePrediction"];
    v30 = +[NSDate date];
    uint64_t v31 = [v29 objectForKey:@"LastAnalyticsCollectionDate"];
    v32 = (void *)v31;
    if (v31) {
      v33 = (void *)v31;
    }
    else {
      v33 = v30;
    }
    id v34 = v33;

    v35 = [v30 laterDate:v34];
    if ([v34 compare:v35] == (id)-1)
    {
      id v36 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v34 endDate:v35];
      ARPCollectAndSendAnalyticsEvents();
    }
    [v29 setObject:v30 forKey:@"LastAnalyticsCollectionDate" v40];

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10001A870;
    v47[3] = &unk_100038A78;
    v47[4] = v22;
    uint64_t v23 = objc_retainBlock(v47);
    v37 = [(CDKnowledgeDaemon *)v22 intentSpotlightIndex];

    v38 = v22;
    NSErrorUserInfoKey v5 = v41;
    if (v37)
    {
      id v39 = [(CDKnowledgeDaemon *)v38 intentSpotlightIndex];
      [v39 triggerIndexIncludingAdditions:1 completion:v23];
    }
    else
    {
      (*(void (**)(uint64_t))(v23 + 16))(v23);
    }
    goto LABEL_40;
  }
  id v7 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Privacy maintenance deferred after standing queries.", buf, 2u);
  }
LABEL_41:
}

- (void)logSizeOfStorage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 directory];
  if (v4
    && (NSErrorUserInfoKey v5 = (void *)v4,
        [v3 databaseName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [v3 directory];
    v29[0] = v7;
    id v8 = [v3 databaseName];
    v29[1] = v8;
    id v9 = +[NSArray arrayWithObjects:v29 count:2];
    id v10 = +[NSString pathWithComponents:v9];

    id v11 = +[NSString stringWithFormat:@"%@C.db", v10];
    id v12 = +[NSFileManager defaultManager];
    id v13 = [v12 attributesOfItemAtPath:v11 error:0];

    if (v13)
    {
      id v14 = (char *)[v13 fileSize];
      id v15 = +[NSString stringWithFormat:@"%@C.db-wal", v10];
      id v16 = +[NSFileManager defaultManager];
      id v17 = [v16 attributesOfItemAtPath:v15 error:0];

      if (v17)
      {
        uint64_t v18 = &v14[(void)[v17 fileSize]];
        v19 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v26 = v11;
          __int16 v27 = 2048;
          id v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "DatabaseSize for %@: %lluB", buf, 0x16u);
        }

        if (v18)
        {
          double v20 = [v3 databaseName];
          unsigned int v21 = [v20 containsString:@"sync"];

          unsigned int v22 = +[_CDLogging knowledgeSignpost];
          BOOL v23 = os_signpost_enabled(v22);
          if (v21)
          {
            if (v23)
            {
              *(_DWORD *)buf = 134349056;
              id v26 = v18;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SyncDatabaseSize", "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ", buf, 0xCu);
            }
            CFStringRef v24 = @"com.apple.coreduet.knowledgeStore.syncDatabaseSize";
          }
          else
          {
            if (v23)
            {
              *(_DWORD *)buf = 134349056;
              id v26 = v18;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DatabaseSize", "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ", buf, 0xCu);
            }
            CFStringRef v24 = @"com.apple.coreduet.knowledgeStore.databaseSize";
          }

          +[_CDDiagnosticDataReporter setValue:v18 forScalarKey:v24];
        }
      }
    }
  }
  else
  {
    id v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100022CB4();
    }
  }
}

- (void)reportEventStatistics
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.reportEventStatistics", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  uint64_t v18 = self;
  uint64_t v4 = [(_DKKnowledgeStorage *)self->_storage eventCountPerStreamName];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [v4 objectForKeyedSubscript:v10];
        id v12 = [v11 unsignedIntegerValue];

        v7 += (uint64_t)v12;
        id v13 = [v10 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
        id v14 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.coreduet.knowledgeStore.eventCount", v13];
        +[_CDDiagnosticDataReporter setValue:v12 forScalarKey:v14 limitingSigDigs:2];
        _cdknowledge_signpost_event_count();
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v15 = +[NSString stringWithFormat:@"%@.total", @"com.apple.coreduet.knowledgeStore.eventCount"];
  +[_CDDiagnosticDataReporter setValue:v7 forScalarKey:v15 limitingSigDigs:2];
  id v16 = [(_DKKnowledgeStorage *)v18->_storage storage];
  [(CDKnowledgeDaemon *)v18 logSizeOfStorage:v16];

  id v17 = [(_DKKnowledgeStorage *)v18->_storage syncStorage];
  [(CDKnowledgeDaemon *)v18 logSizeOfStorage:v17];
}

- (id)confirmDatabaseConnectionError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"unable to confirm underlying database connection.";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  id v3 = +[NSError errorWithDomain:@"com.apple.coreduet" code:0 userInfo:v2];

  return v3;
}

- (void)confirmDatabaseConnectionWithReply:(id)a3
{
  uint64_t v8 = (void (**)(id, void, void *))a3;
  if ([(CDKnowledgeDaemon *)self isClassCLocked])
  {
    uint64_t v4 = [(CDKnowledgeDaemon *)self classCError];
    v8[2](v8, 0, v4);
  }
  else
  {
    NSErrorUserInfoKey v5 = [(CDKnowledgeDaemon *)self storage];
    CFStringRef v6 = [v5 storage];
    unsigned int v7 = [v6 confirmDatabaseConnectionFor:NSFileProtectionCompleteUntilFirstUserAuthentication];

    if (v7)
    {
      v8[2](v8, 1, 0);
      goto LABEL_7;
    }
    uint64_t v4 = [(CDKnowledgeDaemon *)self confirmDatabaseConnectionError];
    v8[2](v8, 0, v4);
  }

LABEL_7:
}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  NSErrorUserInfoKey v5 = (void (**)(id, void *, id))a4;
  id v6 = objc_alloc((Class)BMAccessClient);
  id v7 = [v6 initWithUseCase:BMUseCaseConnectionProxy];
  id v10 = 0;
  uint64_t v8 = [v7 requestEndpointForDomain:v4 error:&v10];
  id v9 = v10;
  v5[2](v5, v8, v9);
}

- (void)registerDataCollectionTasks
{
  if (+[_CDDeviceInfo isRunningOnInternalBuild])
  {
    [(CDKnowledgeDaemon *)self registerCDInteractionDataCollectionTask];
    [(CDKnowledgeDaemon *)self registerCDFTCPInteractionDataCollectionTask];
    [(CDKnowledgeDaemon *)self registerPersonLinkingDataCollectionTask];
    [(CDKnowledgeDaemon *)self registerVisionSignalGradingDataCollectionTask];
  }
  [(CDKnowledgeDaemon *)self registerAirPlayTasks];
  [(CDKnowledgeDaemon *)self macSleepModelingDataCollectionTasks];

  [(CDKnowledgeDaemon *)self registerMailIntelligencePETDataCollectionTask];
}

- (void)registerCDInteractionDataCollectionTask
{
}

- (void)registerCDFTCPInteractionDataCollectionTask
{
}

- (void)registerAirPlayTasks
{
  if (!self->_airplayTaskScheduler)
  {
    id v3 = objc_alloc((Class)ARPCorrelationTaskScheduler);
    id v6 = [(CDKnowledgeDaemon *)self storage];
    BOOL v4 = (ARPCorrelationTaskScheduler *)[v3 initWithKnowledgeStore:v6];
    airplayTaskScheduler = self->_airplayTaskScheduler;
    self->_airplayTaskScheduler = v4;
  }
}

- (void)registerPersonLinkingDataCollectionTask
{
}

- (void)registerVisionSignalGradingDataCollectionTask
{
}

- (void)registerCloudFamilyPredictionTask
{
}

- (void)registerContactsAutocompleteFeedbackProcessingTask
{
}

- (void)registerARPHomeControlNotificationTask
{
  v2 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100022D28(v2);
  }

  xpc_activity_register("com.apple.coreduetd.homecontrolsuggestion.notification.task", XPC_ACTIVITY_CHECK_IN, &stru_1000390F8);
}

- (void)registerMediaAnalysisProcessingTask
{
  id v3 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100022D6C(v3);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001C124;
  handler[3] = &unk_100038B60;
  handler[4] = self;
  xpc_activity_register("com.apple.coreduetd.mediaanalysis.proc.task", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)synchronizeWithReply:(id)a3
{
  id v4 = a3;
  NSErrorUserInfoKey v5 = [(CDKnowledgeDaemon *)self syncCoordinator];

  if (v5)
  {
    id v6 = [(CDKnowledgeDaemon *)self syncCoordinator];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001C540;
    v8[3] = &unk_100039140;
    id v9 = v4;
    [v6 syncWithReply:v8];
  }
  else
  {
    id v7 = +[_DKSyncErrors unavailableForCurrentUser];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CDKnowledgeDaemon *)self syncCoordinator];

  if (v10)
  {
    id v11 = [(CDKnowledgeDaemon *)self syncCoordinator];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001C6CC;
    v13[3] = &unk_100039140;
    id v14 = v9;
    [v11 synchronizeWithUrgency:a3 client:v8 reply:v13];
  }
  else
  {
    id v12 = +[_DKSyncErrors unavailableForCurrentUser];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
  }
}

- (void)deleteRemoteState:(id)a3
{
  id v4 = a3;
  NSErrorUserInfoKey v5 = [(CDKnowledgeDaemon *)self syncCoordinator];

  if (v5)
  {
    id v6 = [(CDKnowledgeDaemon *)self syncCoordinator];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001C834;
    v8[3] = &unk_100039140;
    id v9 = v4;
    [v6 deleteRemoteStateWithReply:v8];
  }
  else
  {
    id v7 = +[_DKSyncErrors unavailableForCurrentUser];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (void)sourceDeviceIdentityWithReply:(id)a3
{
  id v7 = (void (**)(id, void, void *))a3;
  if ([(CDKnowledgeDaemon *)self isClassCLocked])
  {
    id v4 = [(CDKnowledgeDaemon *)self classCError];
    v7[2](v7, 0, v4);
  }
  else
  {
    NSErrorUserInfoKey v5 = [(CDKnowledgeDaemon *)self storage];
    id v4 = [v5 sourceDeviceIdentity];

    if (v4)
    {
      ((void (**)(id, void *, void *))v7)[2](v7, v4, 0);
    }
    else
    {
      id v6 = +[_DKSyncErrors unavailableForCurrentUser];
      v7[2](v7, 0, v6);
    }
  }
}

- (void)deviceUUIDWithReply:(id)a3
{
  id v7 = (void (**)(id, void, void *))a3;
  if ([(CDKnowledgeDaemon *)self isClassCLocked])
  {
    id v4 = [(CDKnowledgeDaemon *)self classCError];
    v7[2](v7, 0, v4);
  }
  else
  {
    NSErrorUserInfoKey v5 = [(CDKnowledgeDaemon *)self storage];
    id v4 = [v5 deviceUUID];

    if (v4)
    {
      ((void (**)(id, void *, void *))v7)[2](v7, v4, 0);
    }
    else
    {
      id v6 = +[_DKSyncErrors unavailableForCurrentUser];
      v7[2](v7, 0, v6);
    }
  }
}

- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void))a5;
  +[_DKSync2Policy disableSyncPolicyForFeature:a3 transportType:a4 disabled:1];
  v7[2](v7, 1, 0);
}

- (void)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4 withReply:(id)a5
{
  id v7 = a5;
  (*((void (**)(id, void, void))v7 + 2))(v7, +[_DKSync2Policy isSyncPolicyDisabledForFeature:a3 transportType:a4], 0);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v12 = v7;
  if (v5)
  {
    [v7 invoke];
  }
  else
  {
    id v8 = [a3 exportedObject];
    id v9 = [v8 processName];

    id v10 = [&off_10003BBA8 objectForKeyedSubscript:v9];
    unsigned int v11 = [v10 unsignedIntValue];

    if (v11 > 0x32) {
      [v12 invoke];
    }
    else {
      ((void (*)(id))*(&off_100039160 + v11))(v12);
    }
  }
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (_DKSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (_CDIntentSpotlightIndex)intentSpotlightIndex
{
  return self->_intentSpotlightIndex;
}

- (void)setIntentSpotlightIndex:(id)a3
{
}

- (ARPCorrelationTaskScheduler)airplayTaskScheduler
{
  return self->_airplayTaskScheduler;
}

- (void)setAirplayTaskScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayTaskScheduler, 0);
  objc_storeStrong((id *)&self->_intentSpotlightIndex, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_privacyEnforcer, 0);
  objc_storeStrong((id *)&self->_rateLimitEnforcer, 0);

  objc_storeStrong((id *)&self->_dataProtection, 0);
}

@end