@interface MODaemonUniverse
- (MODaemonUniverse)init;
- (MODaemonUniverse)initWithUniverseDictionary:(id)a3;
- (NSMutableDictionary)universe;
- (NSRecursiveLock)serviceDictLock;
- (id)createService:(id)a3;
- (id)getService:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setService:(id)a3 forName:(id)a4;
- (void)setServiceDictLock:(id)a3;
- (void)setUniverse:(id)a3;
- (void)setupServices;
@end

@implementation MODaemonUniverse

- (void)setupServices
{
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__9;
  v101[4] = __Block_byref_object_dispose__9;
  id v102 = (id)os_transaction_create();
  v3 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Daemon initialized, Lock", buf, 2u);
  }

  v4 = [(MODaemonUniverse *)self serviceDictLock];
  [v4 lock];

  v99 = [[MODefaultsManager alloc] initWithUniverse:self];
  v5 = [(MODaemonUniverse *)self universe];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 setObject:v99 forKeyedSubscript:v7];

  v98 = [[MOConfigurationManager alloc] initWithUniverse:self];
  v8 = [(MODaemonUniverse *)self universe];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v8 setObject:v98 forKeyedSubscript:v10];

  v97 = [[MODarwinNotifier alloc] initWithUniverse:self];
  v11 = [(MODaemonUniverse *)self universe];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  [v11 setObject:v97 forKeyedSubscript:v13];

  v96 = [[MOPersistenceManager alloc] initWithUniverse:self];
  v14 = [(MODaemonUniverse *)self universe];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v14 setObject:v96 forKeyedSubscript:v16];

  v95 = [[MODataAccessManager alloc] initWithUniverse:self];
  v17 = [(MODaemonUniverse *)self universe];
  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  [v17 setObject:v95 forKeyedSubscript:v19];

  v94 = [[MOTimeZoneManager alloc] initWithUniverse:self];
  v20 = [(MODaemonUniverse *)self universe];
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  [v20 setObject:v94 forKeyedSubscript:v22];

  v93 = [[MOEventBundleStore alloc] initWithUniverse:self];
  v23 = [(MODaemonUniverse *)self universe];
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  [v23 setObject:v93 forKeyedSubscript:v25];

  v92 = [[MOFSMStore alloc] initWithUniverse:self];
  v26 = [(MODaemonUniverse *)self universe];
  v27 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v27);
  [v26 setObject:v92 forKeyedSubscript:v28];

  v91 = [[MOEventStore alloc] initWithUniverse:self];
  v29 = [(MODaemonUniverse *)self universe];
  v30 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v30);
  [v29 setObject:v91 forKeyedSubscript:v31];

  v90 = [[MOEventManager alloc] initWithUniverse:self];
  v32 = [(MODaemonUniverse *)self universe];
  v33 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v33);
  [v32 setObject:v90 forKeyedSubscript:v34];

  v89 = [[MOEngagementHistoryManager alloc] initWithUniverse:self];
  v35 = [(MODaemonUniverse *)self universe];
  v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  [v35 setObject:v89 forKeyedSubscript:v37];

  v88 = [[MOEventBundleRanking alloc] initWithUniverse:self];
  v38 = [(MODaemonUniverse *)self universe];
  v39 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v39);
  [v38 setObject:v88 forKeyedSubscript:v40];

  v87 = [[MOEventBundleManager alloc] initWithUniverse:self];
  v41 = [(MODaemonUniverse *)self universe];
  v42 = (objc_class *)objc_opt_class();
  v43 = NSStringFromClass(v42);
  [v41 setObject:v87 forKeyedSubscript:v43];

  v86 = [[MONotificationsManager alloc] initWithUniverse:self];
  v44 = [(MODaemonUniverse *)self universe];
  v45 = (objc_class *)objc_opt_class();
  v46 = NSStringFromClass(v45);
  [v44 setObject:v86 forKeyedSubscript:v46];

  v47 = [[MOBundleClusteringManager alloc] initWithUniverse:self];
  v48 = [(MODaemonUniverse *)self universe];
  v49 = (objc_class *)objc_opt_class();
  v50 = NSStringFromClass(v49);
  [v48 setObject:v47 forKeyedSubscript:v50];

  v51 = [[MOOnboardingAndSettingsPersistence alloc] initWithUniverse:self];
  v52 = [(MODaemonUniverse *)self universe];
  v53 = (objc_class *)objc_opt_class();
  v54 = NSStringFromClass(v53);
  [v52 setObject:v51 forKeyedSubscript:v54];

  v55 = [[MOManageServer alloc] initWithUniverse:self];
  v56 = [(MODaemonUniverse *)self universe];
  v57 = (objc_class *)objc_opt_class();
  v58 = NSStringFromClass(v57);
  [v56 setObject:v55 forKeyedSubscript:v58];

  v59 = [(MOManageServer *)v55 client];
  v60 = [(MODaemonUniverse *)self universe];
  [v60 setObject:v59 forKeyedSubscript:@"DaemonClient"];

  v61 = [(MOManageServer *)v55 getNotifier];
  v62 = [(MODaemonUniverse *)self universe];
  [v62 setObject:v61 forKeyedSubscript:@"DaemonClientNotifier"];

  v63 = [[MOEventRefreshScheduler alloc] initWithUniverse:self];
  v64 = [(MODaemonUniverse *)self universe];
  v65 = (objc_class *)objc_opt_class();
  v66 = NSStringFromClass(v65);
  [v64 setObject:v63 forKeyedSubscript:v66];

  v67 = [(MOEventRefreshScheduler *)v63 notifier];
  v68 = [(MODaemonUniverse *)self universe];
  [v68 setObject:v67 forKeyedSubscript:@"EventRefreshSchedulerNotifier"];

  v69 = [[MODaemonAnalyticsManager alloc] initWithUniverse:self];
  v70 = [(MODaemonUniverse *)self universe];
  v71 = (objc_class *)objc_opt_class();
  v72 = NSStringFromClass(v71);
  [v70 setObject:v69 forKeyedSubscript:v72];

  v73 = [[MOEngagementAndSuggestionAnalyticsManager alloc] initWithUniverse:self];
  v74 = [(MODaemonUniverse *)self universe];
  v75 = (objc_class *)objc_opt_class();
  v76 = NSStringFromClass(v75);
  [v74 setObject:v73 forKeyedSubscript:v76];

  v77 = [[MOEventPatternManager alloc] initWithUniverse:self];
  v78 = [(MODaemonUniverse *)self universe];
  v79 = (objc_class *)objc_opt_class();
  v80 = NSStringFromClass(v79);
  [v78 setObject:v77 forKeyedSubscript:v80];

  v81 = [(MODaemonUniverse *)self serviceDictLock];
  [v81 unlock];

  v82 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v83 = dispatch_queue_create("MOFeatureDisabledExit", v82);

  v84 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v104 = 10;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Daemon initialized, will release transaction in %llu seconds...", buf, 0xCu);
  }

  dispatch_time_t v85 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MODaemonUniverse_SetupServices__setupServices__block_invoke;
  block[3] = &unk_1002CB4F0;
  block[4] = v101;
  dispatch_after(v85, v83, block);

  _Block_object_dispose(v101, 8);
}

void __48__MODaemonUniverse_SetupServices__setupServices__block_invoke(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Daemon initialized, transaction released", v5, 2u);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (MODaemonUniverse)init
{
  return [(MODaemonUniverse *)self initWithUniverseDictionary:0];
}

- (MODaemonUniverse)initWithUniverseDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MODaemonUniverse;
  v5 = [(MODaemonUniverse *)&v12 init];
  if (v5)
  {
    if (v4) {
      v6 = (NSMutableDictionary *)[v4 mutableCopy];
    }
    else {
      v6 = (NSMutableDictionary *)objc_opt_new();
    }
    universe = v5->_universe;
    v5->_universe = v6;

    v8 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    serviceDictLock = v5->_serviceDictLock;
    v5->_serviceDictLock = v8;

    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v3 = [(MODaemonUniverse *)self universe];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)MODaemonUniverse;
  [(MODaemonUniverse *)&v4 dealloc];
}

- (id)getService:(id)a3
{
  id v5 = a3;
  v6 = [(MODaemonUniverse *)self serviceDictLock];
  [v6 lock];

  v7 = [(MODaemonUniverse *)self universe];
  v8 = [v7 valueForKey:v5];

  if (!v8)
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No service named [%@] is not initiated, look for it in classes", buf, 0xCu);
    }

    uint64_t v10 = [(MODaemonUniverse *)self createService:v5];
    if (v10)
    {
      v8 = (void *)v10;
      v11 = [(MODaemonUniverse *)self universe];
      [v11 setObject:v8 forKeyedSubscript:v5];
    }
    else
    {
      objc_super v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MODaemonUniverse getService:]();
      }

      v11 = +[NSAssertionHandler currentHandler];
      [v11 handleFailureInMethod:a2, self, @"MODaemonUniverse.m", 51, @"service named [%@] failed to be initiated (in %s:%d)", v5, "-[MODaemonUniverse getService:]", 51 object file lineNumber description];
      v8 = 0;
    }
  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "get service named [%@] release lock", buf, 0xCu);
  }

  v14 = [(MODaemonUniverse *)self serviceDictLock];
  [v14 unlock];

  return v8;
}

- (id)createService:(id)a3
{
  id v5 = (NSString *)a3;
  v6 = NSClassFromString(v5);
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Find corresponding class and will initiate the service [%@]", buf, 0xCu);
    }

    id v9 = [v6 alloc];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MODaemonUniverse createService:]();
      }

      v11 = +[NSAssertionHandler currentHandler];
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MODaemonUniverse.m", 79, @"service named [%@] does not conform the protocol. (in %s:%d)", v5, "-[MODaemonUniverse createService:]", 79);
      id v10 = 0;
      goto LABEL_17;
    }
    id v10 = [v9 initWithUniverse:self];
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        v13 = "successfully initiated the service [%@]";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      v13 = "failed to initiate the service [%@]";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MODaemonUniverse createService:]();
  }

  id v9 = +[NSAssertionHandler currentHandler];
  [v9 handleFailureInMethod:a2, self, @"MODaemonUniverse.m", 66, @"No class named [%@] (in %s:%d)", v5, "-[MODaemonUniverse createService:]", 66 object file lineNumber description];
  id v10 = 0;
LABEL_18:

  return v10;
}

- (void)setService:(id)a3 forName:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [(MODaemonUniverse *)self serviceDictLock];
    [v8 lock];

    id v9 = [(MODaemonUniverse *)self universe];
    [v9 setObject:v7 forKeyedSubscript:v6];

    id v10 = [(MODaemonUniverse *)self serviceDictLock];
    [v10 unlock];
  }
}

- (void)run
{
  if (!self)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v3 = dispatch_queue_create("MOFeatureDisabledExit", v2);

    objc_super v4 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = 10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Nothing to be enabled, scheduling exit in %llu seconds...", (uint8_t *)&v7, 0xCu);
    }

    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    dispatch_after(v5, v3, &__block_literal_global_41);
  }
  dispatch_time_t v6 = dispatch_time(0, 0);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_20);
  dispatch_main();
}

void __23__MODaemonUniverse_run__block_invoke(id a1)
{
  v1 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Nothing to be enabled and grace delay elapsed, exiting...", v2, 2u);
  }

  exit(0);
}

- (NSMutableDictionary)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
}

- (NSRecursiveLock)serviceDictLock
{
  return self->_serviceDictLock;
}

- (void)setServiceDictLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDictLock, 0);

  objc_storeStrong((id *)&self->_universe, 0);
}

- (void)getService:.cold.1()
{
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "service named [%@] failed to be initiated (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)createService:.cold.1()
{
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "No class named [%@] (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)createService:.cold.2()
{
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "service named [%@] does not conform the protocol. (in %s:%d)", v2, v3, v4, v5, v6);
}

@end