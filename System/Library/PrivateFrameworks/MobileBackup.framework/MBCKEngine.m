@interface MBCKEngine
- (BOOL)_refreshCacheWithDevice:(id)a3 operationTracker:(id)a4 refreshState:(id)a5 error:(id *)a6;
- (BOOL)_refreshSnapshot:(id)a3 operationTracker:(id)a4 refreshState:(id)a5 error:(id *)a6;
- (BOOL)_verifySnapshotManifests:(id)a3 operationTracker:(id)a4 summary:(id)a5 shouldOutput:(BOOL)a6;
- (BOOL)backsUpPrimaryAccount;
- (BOOL)cancelWithError:(id)a3;
- (BOOL)encrypted;
- (BOOL)fetchDeviceToDeviceEncryptionSupportedByAccount:(BOOL *)a3 error:(id *)a4;
- (BOOL)handleCancelation:(id *)a3;
- (BOOL)hasError;
- (BOOL)isFinished;
- (BOOL)isNetworkAvailable;
- (BOOL)refreshCacheWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)shouldAdvanceState;
- (BOOL)verifyProgressModel;
- (CKOperationGroup)ckOperationGroup;
- (MBCKCache)cache;
- (MBCKDevice)device;
- (MBCKEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5;
- (MBCKManager)serviceManager;
- (MBCKOperationPolicy)ckOperationPolicy;
- (MBCKOperationTracker)ckOperationTracker;
- (MBCKProperties)properties;
- (MBCKSettingsContext)context;
- (MBCacheRefreshSummary)cacheRefreshSummary;
- (MBProgressModel)progressModel;
- (MBRetryStrategy)multistateRetryStrategy;
- (MBRetryStrategy)retryStrategy;
- (MBServiceAccount)serviceAccount;
- (NSError)engineError;
- (NSError)injectedError;
- (NSMutableDictionary)performanceStatistics;
- (NSMutableString)stateDescription;
- (NSString)powerAssertionName;
- (id)persona;
- (id)setUpOperationTrackerWithError:(id *)a3;
- (id)stateChange;
- (int)engineType;
- (int64_t)qualityOfService;
- (void)dealloc;
- (void)makeStateTransition;
- (void)performRetryablePhase:(id)a3;
- (void)replenishRetryTokens;
- (void)run;
- (void)setCache:(id)a3;
- (void)setCacheRefreshSummary:(id)a3;
- (void)setCkOperationGroup:(id)a3;
- (void)setCkOperationPolicy:(id)a3;
- (void)setCkOperationTracker:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEngineError:(id)a3;
- (void)setInjectedError:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setServiceManager:(id)a3;
- (void)setShouldAdvanceState:(BOOL)a3;
- (void)setStateChange:(id)a3;
- (void)setVerifyProgressModel:(BOOL)a3;
@end

@implementation MBCKEngine

- (MBCKEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 account];
  if (!v12) {
    __assert_rtn("-[MBCKEngine initWithSettingsContext:debugContext:domainManager:]", "MBCKEngine.m", 50, "account");
  }
  v13 = (void *)v12;
  v21.receiver = self;
  v21.super_class = (Class)MBCKEngine;
  v14 = [(MBEngine *)&v21 initWithSettingsContext:v9 debugContext:v10 domainManager:v11];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_context, a3);
    objc_storeStrong((id *)&v15->super._settingsContext, a3);
    objc_storeStrong((id *)&v15->_serviceAccount, v13);
    [(MBCKEngine *)v15 setShouldAdvanceState:1];
    if ([v10 isFlagSet:@"VerifyProgress"]) {
      [(MBCKEngine *)v15 setVerifyProgressModel:1];
    }
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    performanceStatistics = v15->_performanceStatistics;
    v15->_performanceStatistics = v16;

    v15->_qualityOfService = 17;
    v18 = objc_opt_new();
    [(MBCKEngine *)v15 setCkOperationPolicy:v18];
    v19 = [v18 operationGroupWithName:0];
    [(MBCKEngine *)v15 setCkOperationGroup:v19];
  }
  return v15;
}

- (void)dealloc
{
  [(MBCKOperationTracker *)self->_ckOperationTracker removeEngine:self];
  v3.receiver = self;
  v3.super_class = (Class)MBCKEngine;
  [(MBCKEngine *)&v3 dealloc];
}

- (id)persona
{
  return [(MBServiceAccount *)self->_serviceAccount persona];
}

- (int)engineType
{
  return 3;
}

- (MBCKOperationTracker)ckOperationTracker
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_ckOperationTracker;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCkOperationTracker:(id)a3
{
  v4 = (MBCKOperationTracker *)a3;
  v5 = self;
  objc_sync_enter(v5);
  ckOperationTracker = v5->_ckOperationTracker;
  v5->_ckOperationTracker = v4;
  v7 = v4;

  objc_sync_exit(v5);
  [(MBCKOperationTracker *)v7 addEngine:v5];
}

- (BOOL)hasError
{
  v2 = [(MBCKEngine *)self engineError];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)encrypted
{
  return 1;
}

- (MBProgressModel)progressModel
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_progressModel)
  {
    uint64_t v3 = objc_opt_new();
    progressModel = v2->_progressModel;
    v2->_progressModel = (MBProgressModel *)v3;

    if ([(MBCKEngine *)v2 verifyProgressModel]) {
      [(MBProgressModel *)v2->_progressModel setVerify:1];
    }
  }
  objc_sync_exit(v2);

  v5 = v2->_progressModel;
  return v5;
}

- (MBRetryStrategy)retryStrategy
{
  v2 = self;
  objc_sync_enter(v2);
  retryStrategy = v2->_retryStrategy;
  if (!retryStrategy)
  {
    v4 = [[MBRetryStrategy alloc] initWithEngine:v2];
    v5 = v2->_retryStrategy;
    v2->_retryStrategy = v4;

    retryStrategy = v2->_retryStrategy;
  }
  v6 = retryStrategy;
  objc_sync_exit(v2);

  return v6;
}

- (MBRetryStrategy)multistateRetryStrategy
{
  v2 = self;
  objc_sync_enter(v2);
  multistateRetryStrategy = v2->_multistateRetryStrategy;
  if (!multistateRetryStrategy)
  {
    v4 = [[MBRetryStrategy alloc] initWithEngine:v2];
    v5 = v2->_multistateRetryStrategy;
    v2->_multistateRetryStrategy = v4;

    multistateRetryStrategy = v2->_multistateRetryStrategy;
  }
  v6 = multistateRetryStrategy;
  objc_sync_exit(v2);

  return v6;
}

- (NSString)powerAssertionName
{
  return 0;
}

- (void)run
{
  *(void *)&double v51 = atomic_fetch_add_explicit(&dword_1004823B0, 1u, memory_order_relaxed);
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MBEngine *)self engineModeString];
    *(_DWORD *)buf = 138412546;
    v63 = v6;
    __int16 v64 = 2048;
    double v65 = v51;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "========== %@ starting (%ld)", buf, 0x16u);

    v45 = [(MBEngine *)self engineModeString];
    double v48 = v51;
    _MBLog();
  }
  if (![(MBEngine *)self isBackgroundRestore]) {
    MBLogDeviceProperties();
  }
  v7 = [(MBCKEngine *)self stateChange];
  if (!v7) {
    __assert_rtn("-[MBCKEngine run]", "MBCKEngine.m", 151, "stateChange");
  }
  unint64_t v8 = __ROR8__((char *)[(MBCKEngine *)self qualityOfService] - 9, 3);
  if (v8 > 3) {
    dispatch_qos_class_t v9 = QOS_CLASS_DEFAULT;
  }
  else {
    dispatch_qos_class_t v9 = dword_1003B3470[v8];
  }
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v11 = dispatch_queue_attr_make_with_qos_class(v10, v9, 0);

  uint64_t v12 = dispatch_queue_create("com.apple.backupd.stateChange", v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099F88;
  block[3] = &unk_100411B88;
  id v13 = v7;
  id v61 = v13;
  dispatch_sync(v12, block);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100099FA4;
  v57[3] = &unk_100411BD8;
  v14 = v12;
  v58 = v14;
  id v15 = v13;
  id v59 = v15;
  v16 = [(MBCKEngine *)self progressModel];
  [v16 setBlock:v57];

  id v56 = 0;
  unsigned __int8 v17 = [(MBCKEngine *)self runWithError:&v56];
  id v18 = v56;
  v19 = [(MBCKEngine *)self progressModel];
  [v19 setBlock:0];

  [(MBCKCache *)self->_cache flush];
  uint64_t v20 = MBPeakProcessMemoryUsage();
  +[NSDate timeIntervalSinceReferenceDate];
  double v22 = v21 - v4;
  if ([(MBEngine *)self isCanceled])
  {
    v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(MBEngine *)self engineModeString];
      *(_DWORD *)buf = 138412546;
      v63 = v24;
      __int16 v64 = 2048;
      double v65 = v51;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "========== %@ cancelled (%ld)", buf, 0x16u);

      v47 = [(MBEngine *)self engineModeString];
      _MBLog();
    }
    v25 = [(MBEngine *)self cancelError];

    if (!v25) {
      __assert_rtn("-[MBCKEngine run]", "MBCKEngine.m", 182, "localError");
    }
    [(MBCKEngine *)self sendEngineCompletionTelemetry:v25 duration:v20 peakMemoryUsage:v22];
    int v26 = 4;
    goto LABEL_29;
  }
  if (v17)
  {

    v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [(MBEngine *)self engineModeString];
      *(_DWORD *)buf = 138412802;
      v63 = v28;
      __int16 v64 = 2048;
      double v65 = v22;
      __int16 v66 = 2048;
      double v67 = v51;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "========== %@ finished in %0.3fs (%ld)", buf, 0x20u);

      [(MBEngine *)self engineModeString];
      double v50 = v51;
      v46 = double v49 = v22;
      _MBLog();
    }
    if (self->_performanceStatistics)
    {
      v29 = +[NSNumber numberWithDouble:v22];
      [(NSMutableDictionary *)self->_performanceStatistics setObject:v29 forKeyedSubscript:@"TotalDuration"];
    }
    -[MBCKEngine sendEngineCompletionTelemetry:duration:peakMemoryUsage:](self, "sendEngineCompletionTelemetry:duration:peakMemoryUsage:", 0, v20, v22, v46, *(void *)&v49, *(void *)&v50);
    v25 = 0;
    int v26 = 2;
    goto LABEL_29;
  }
  if ([(MBEngine *)self isRestoreEngine]
    && +[MBError isRetryableRestoreError:v18])
  {
    v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(MBEngine *)self engineModeString];
      double v32 = +[MBError loggableDescriptionForError:v18];
      v33 = +[MBError descriptionForError:v18];
      *(_DWORD *)buf = 138413058;
      v63 = v31;
      __int16 v64 = 2114;
      double v65 = v32;
      __int16 v66 = 2112;
      double v67 = *(double *)&v33;
      __int16 v68 = 2048;
      double v69 = v51;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "========== %@ encountered a retryable error: %{public}@, %@ (%ld)", buf, 0x2Au);

      v34 = [(MBEngine *)self engineModeString];
      v35 = +[MBError loggableDescriptionForError:v18];
      v36 = +[MBError descriptionForError:v18];
      _MBLog();
LABEL_26:
    }
  }
  else
  {
    v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v37 = [(MBEngine *)self engineModeString];
      double v38 = +[MBError loggableDescriptionForError:v18];
      v39 = +[MBError descriptionForError:v18];
      *(_DWORD *)buf = 138413058;
      v63 = v37;
      __int16 v64 = 2114;
      double v65 = v38;
      __int16 v66 = 2112;
      double v67 = *(double *)&v39;
      __int16 v68 = 2048;
      double v69 = v51;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "========== %@ failed: %{public}@, %@ (%ld)", buf, 0x2Au);

      v34 = [(MBEngine *)self engineModeString];
      v35 = +[MBError loggableDescriptionForError:v18];
      v36 = +[MBError descriptionForError:v18];
      _MBLog();
      goto LABEL_26;
    }
  }

  [(MBCKEngine *)self sendEngineCompletionTelemetry:v18 duration:v20 peakMemoryUsage:v22];
  if (!v18) {
    __assert_rtn("-[MBCKEngine run]", "MBCKEngine.m", 197, "localError");
  }
  int v26 = 4;
  v25 = v18;
LABEL_29:
  v40 = dispatch_group_create();
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10009A05C;
  v52[3] = &unk_100411C00;
  id v41 = v15;
  id v54 = v41;
  int v55 = v26;
  id v42 = v25;
  id v53 = v42;
  dispatch_group_async(v40, v14, v52);
  dispatch_time_t v43 = dispatch_time(0, 14700000000000);
  if (dispatch_group_wait(v40, v43)) {
    __assert_rtn("-[MBCKEngine run]", "MBCKEngine.m", 220, "result == 0");
  }
  [(MBCKEngine *)self setStateChange:0];
  v44 = [(MBCKEngine *)self ckOperationTracker];
  [v44 drain];
}

- (BOOL)cancelWithError:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MBCKEngine;
  BOOL v4 = [(MBEngine *)&v9 cancelWithError:a3];
  if (!v4)
  {
    v5 = [(MBCKEngine *)self ckOperationTracker];
    [v5 cancel];

    v6 = [(MBCKEngine *)self retryStrategy];
    [v6 cancel];

    v7 = [(MBCKEngine *)self multistateRetryStrategy];
    [v7 cancel];
  }
  return v4;
}

- (BOOL)handleCancelation:(id *)a3
{
  BOOL v5 = [(MBEngine *)self isCanceled];
  if (v5)
  {
    uint64_t v6 = [(MBEngine *)self cancelError];
    if (!v6) {
      __assert_rtn("-[MBCKEngine handleCancelation:]", "MBCKEngine.m", 243, "cancelError");
    }
    v7 = (void *)v6;
    [(MBCKEngine *)self cleanUpAfterError:v6];
    if (a3) {
      *a3 = v7;
    }
  }
  return v5;
}

- (BOOL)_refreshSnapshot:(id)a3 operationTracker:(id)a4 refreshState:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 251, "snapshot");
  }
  if (!v9) {
    __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 252, "tracker");
  }
  if (!v10) {
    __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 253, "refreshState");
  }
  if (!a6) {
    __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 254, "error");
  }
  v74 = v9;
  v75 = v10;
  v79 = v8;
  v77 = [(MBCKEngine *)self cache];
  if (!v77) {
    __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 256, "cache");
  }
  if ([v8 snapshotFormat] != (id)3)
  {
    v73 = [v8 snapshotID];
    uint64_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v73;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Refreshing snapshot %{public}@", buf, 0xCu);
      __int16 v68 = v73;
      _MBLog();
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v14 = v13;
    id v15 = [v77 path];
    v72 = [v15 stringByDeletingLastPathComponent];

    v16 = [[MBCKRefreshManifestDomainCache alloc] initWithCacheDirPath:v72 error:a6];
    if (!v16)
    {
      BOOL v11 = 0;
LABEL_79:

      goto LABEL_80;
    }
    if ([(MBCKEngine *)self handleCancelation:a6]) {
      goto LABEL_12;
    }
    if ([v75 hasRefreshedSnapshotID:v73])
    {
      unsigned __int8 v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v73;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Skipping snapshot %{public}@ since it's was already refreshed", buf, 0xCu);
        _MBLog();
      }
      BOOL v11 = 1;
      goto LABEL_78;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v148 = sub_10009B4F8;
    v149 = sub_10009B508;
    id v150 = 0;
    uint64_t v136 = 0;
    v137 = &v136;
    uint64_t v138 = 0x3032000000;
    v139 = sub_10009B4F8;
    v140 = sub_10009B508;
    id v141 = 0;
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x2020000000;
    v108 = 0;
    *(void *)v142 = 0;
    *(void *)&v142[8] = v142;
    *(void *)&v142[16] = 0x2020000000;
    id v143 = 0;
    uint64_t v132 = 0;
    v133 = &v132;
    uint64_t v134 = 0x2020000000;
    uint64_t v135 = 0;
    v19 = dispatch_group_create();
    dispatch_group_enter(v19);
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_10009B510;
    v127[3] = &unk_100411C28;
    v127[4] = self;
    v129 = v142;
    v130 = &v132;
    v70 = v16;
    v128 = v70;
    v131 = &v136;
    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472;
    v123[2] = sub_10009B750;
    v123[3] = &unk_100411C50;
    v123[4] = self;
    v125 = &v136;
    v126 = &v105;
    id v124 = v73;
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_10009B9F0;
    v116[3] = &unk_100411C78;
    v119 = buf;
    id v71 = v124;
    id v117 = v71;
    v120 = &v105;
    v121 = &v132;
    v122 = v142;
    uint64_t v20 = v19;
    v118 = v20;
    [v8 fetchManifestsWithOperationTracker:v9 referenceFetchProgress:v127 manifestProgress:v123 snapshotCompletion:v116];
    MBGroupWaitForever();
    double v21 = (void *)v137[5];
    if (v21 || (double v21 = *(void **)(*(void *)&buf[8] + 40)) != 0)
    {
      char v22 = 0;
      *a6 = v21;
    }
    else
    {
      char v22 = 1;
    }

    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(v142, 8);
    _Block_object_dispose(&v105, 8);
    _Block_object_dispose(&v136, 8);

    _Block_object_dispose(buf, 8);
    if ((v22 & 1) == 0)
    {
LABEL_12:
      if (!*a6) {
        __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 335, "*error");
      }
      unsigned __int8 v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = *a6;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v73;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to refresh snapshot %{public}@: %{public}@", buf, 0x16u);
        _MBLog();
      }
      BOOL v11 = 0;
      goto LABEL_78;
    }
    if ([(MBEngine *)self isRestoreEngine])
    {
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = [v79 snapshotID];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "RestoreApps: Populating restoreApps for snapshot: %@", buf, 0xCu);

        __int16 v68 = [v79 snapshotID];
        _MBLog();
      }
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      v25 = [v79 manifestsByDomainName];
      id v26 = [v25 countByEnumeratingWithState:&v112 objects:v146 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v113;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v113 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = *(void *)(*((void *)&v112 + 1) + 8 * i);
            v31 = [v79 manifestsByDomainName];
            double v32 = [v31 objectForKeyedSubscript:v29];

            v33 = [v32 domainName];
            v34 = [v32 dependentDomainNames];
            v35 = MBGetDefaultLog();
            BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
            if (v34)
            {
              if (v36)
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v33;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v34;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "RestoreApps: %@ -> %@", buf, 0x16u);
                __int16 v68 = v33;
                double v69 = v34;
                _MBLog();
              }

              v35 = [(MBCKEngine *)self cache];
              id v37 = [v35 addDependentDomains:v34 forApp:v33];
            }
            else if (v36)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v33;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "RestoreApps: %@", buf, 0xCu);
              __int16 v68 = v33;
              _MBLog();
            }
          }
          id v26 = [v25 countByEnumeratingWithState:&v112 objects:v146 count:16];
        }
        while (v26);
      }
    }
    double v38 = +[MBBehaviorOptions sharedOptions];
    id v39 = [v38 numberOfRecordsToFetchBeforeCancellingPrivilegedSnapshotDownload];

    v40 = [v79 manifestsByDomainName];
    id v41 = [v40 count];

    id v42 = dispatch_group_create();
    dispatch_group_enter(v42);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v148 = sub_10009B4F8;
    v149 = sub_10009B508;
    id v150 = 0;
    uint64_t v136 = 0;
    v137 = &v136;
    uint64_t v138 = 0x3032000000;
    v139 = sub_10009B4F8;
    v140 = sub_10009B508;
    id v141 = 0;
    uint64_t v132 = 0;
    v133 = &v132;
    uint64_t v134 = 0x2020000000;
    uint64_t v135 = 0;
    v111[0] = 0;
    v111[1] = v111;
    v111[2] = 0x2020000000;
    v111[3] = 0;
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x3032000000;
    v108 = sub_10009B4F8;
    v109 = sub_10009B508;
    id v110 = [v75 queryCursorForSnapshotID:v71];
    if (v106[5])
    {
      dispatch_time_t v43 = MBGetDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = v106[5];
        *(_DWORD *)v142 = 138544130;
        *(void *)&v142[4] = @"PrivilegedSnapshotDownload";
        *(_WORD *)&v142[12] = 2114;
        *(void *)&v142[14] = v71;
        *(_WORD *)&v142[22] = 2048;
        id v143 = v41;
        __int16 v144 = 2114;
        uint64_t v145 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Resuming %{public}@ query for snapshot %{public}@ (%lu manifests) with cursor: %{public}@", v142, 0x2Au);
        _MBLog();
      }

      id v45 = objc_alloc((Class)CKQueryOperation);
      unsigned __int8 v17 = [v45 initWithCursor:v106[5]];
    }
    else
    {
      v46 = MBGetDefaultLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v142 = 138543874;
        *(void *)&v142[4] = @"PrivilegedSnapshotDownload";
        *(_WORD *)&v142[12] = 2114;
        *(void *)&v142[14] = v71;
        *(_WORD *)&v142[22] = 2048;
        id v143 = v41;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ query for snapshot %{public}@ (%lu manifests)", v142, 0x20u);
        _MBLog();
      }

      v47 = [v79 recordID];
      double v48 = +[NSPredicate predicateWithFormat:@"recordID==%@", v47];

      id v49 = [objc_alloc((Class)CKQuery) initWithRecordType:@"PrivilegedSnapshotDownload" predicate:v48];
      unsigned __int8 v17 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v49];
    }
    if (!v17) {
      __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 382, "op");
    }
    if ([(MBEngine *)self isBackupEngine]) {
      +[MBCKFile keysToFetchWithoutContents];
    }
    else {
    double v50 = +[MBCKFile keysToFetchWithContents];
    }
    [v17 setDesiredKeys:v50];

    [v17 setFetchAllResults:1];
    [v17 setShouldFetchAssetContent:0];
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_10009BBCC;
    v100[3] = &unk_100411CA0;
    v103 = &v105;
    v101 = @"PrivilegedSnapshotDownload";
    id v51 = v71;
    id v102 = v51;
    v104 = &v132;
    [v17 setQueryCursorFetchedBlock:v100];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10009BCF8;
    v89[3] = &unk_100411CC8;
    id v99 = v39;
    v96 = &v132;
    v90 = @"PrivilegedSnapshotDownload";
    id v52 = v51;
    id v91 = v52;
    v92 = self;
    id v53 = v70;
    v93 = v53;
    v97 = &v136;
    id v94 = v77;
    id v54 = v79;
    id v95 = v54;
    v98 = v111;
    [v17 setRecordFetchedBlock:v89];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10009C2C4;
    v81[3] = &unk_100411CF0;
    v82 = @"PrivilegedSnapshotDownload";
    id v55 = v52;
    v86 = buf;
    v87 = &v132;
    id v83 = v55;
    v84 = self;
    v88 = v111;
    v16 = v42;
    v85 = v16;
    [v17 setQueryCompletionBlock:v81];
    [v74 addDatabaseOperation:v17];
    MBGroupWaitForever();
    [v54 forgetManifests];
    id v80 = 0;
    LOBYTE(v52) = [(MBCKRefreshManifestDomainCache *)v53 close:&v80];
    id v56 = v80;
    if ((v52 & 1) == 0)
    {
      v57 = MBGetDefaultLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v142 = 138412290;
        *(void *)&v142[4] = v56;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Error closing file to domain cache: %@", v142, 0xCu);
        _MBLog();
      }
    }
    v58 = (void *)v137[5];
    if (v58)
    {
      *a6 = v58;
    }
    else
    {
      v62 = *(void **)(*(void *)&buf[8] + 40);
      if (!v62)
      {
        [v75 addRefreshedSnapshotID:v55];
        +[NSDate timeIntervalSinceReferenceDate];
        double v66 = v65;
        v60 = MBGetDefaultLog();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v142 = 138543618;
          *(void *)&v142[4] = v55;
          *(_WORD *)&v142[12] = 2048;
          *(double *)&v142[14] = v66 - v14;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Finished refreshing snapshot %{public}@ in %.3fs", v142, 0x16u);
          _MBLog();
        }
        BOOL v11 = 1;
        goto LABEL_77;
      }
      *a6 = v62;
      if (v106[5]
        && +[MBError isResumableCacheRefreshError:*(void *)(*(void *)&buf[8] + 40)])
      {
        v63 = MBGetDefaultLog();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v64 = v106[5];
          *(_DWORD *)v142 = 138543618;
          *(void *)&v142[4] = v55;
          *(_WORD *)&v142[12] = 2114;
          *(void *)&v142[14] = v64;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Updating the query cursor for snapshot %{public}@: %{public}@", v142, 0x16u);
          _MBLog();
        }

        [v75 addQueryCursor:v106[5] forSnapshotID:v55];
        goto LABEL_62;
      }
    }
    id v59 = MBGetDefaultLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v142 = 138543362;
      *(void *)&v142[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Resetting the query cursor for snapshot %{public}@", v142, 0xCu);
      _MBLog();
    }

    [v75 forgetSnapshotID:v55];
LABEL_62:
    if (!*a6) {
      __assert_rtn("-[MBCKEngine _refreshSnapshot:operationTracker:refreshState:error:]", "MBCKEngine.m", 473, "*error");
    }
    v60 = MBGetDefaultLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      id v61 = *a6;
      *(_DWORD *)v142 = 138543618;
      *(void *)&v142[4] = v55;
      *(_WORD *)&v142[12] = 2114;
      *(void *)&v142[14] = v61;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Failed to refresh snapshot %{public}@: %{public}@", v142, 0x16u);
      _MBLog();
    }
    BOOL v11 = 0;
LABEL_77:

    _Block_object_dispose(&v105, 8);
    _Block_object_dispose(v111, 8);
    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(&v136, 8);

    _Block_object_dispose(buf, 8);
LABEL_78:

    goto LABEL_79;
  }
  BOOL v11 = 1;
LABEL_80:

  return v11;
}

- (BOOL)_verifySnapshotManifests:(id)a3 operationTracker:(id)a4 summary:(id)a5 shouldOutput:(BOOL)a6
{
  BOOL v55 = a6;
  id v62 = a3;
  id v57 = a4;
  id v58 = a5;
  id v53 = self;
  id v59 = [(MBCKEngine *)self cache];
  if (!v59) {
    __assert_rtn("-[MBCKEngine _verifySnapshotManifests:operationTracker:summary:shouldOutput:]", "MBCKEngine.m", 481, "cache");
  }
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v62 snapshotID];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Verifying snapshot %{public}@", buf, 0xCu);

    v46 = [v62 snapshotID];
    _MBLog();
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  if ([v62 snapshotFormat] == (id)3)
  {
    LOBYTE(v13) = 1;
    goto LABEL_53;
  }
  [v62 manifestIDs];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (!v14)
  {
    BOOL v13 = 1;
    goto LABEL_48;
  }
  uint64_t v15 = *(void *)v73;
  while (2)
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v73 != v15) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v17 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      id v18 = [obj indexOfObject:v17];
      if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        double v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to find manifest %{public}@ - cannot validate cache", buf, 0xCu);
          _MBLog();
        }
LABEL_47:

        BOOL v13 = 0;
        goto LABEL_48;
      }
      v19 = [v17 substringFromIndex:objc_msgSend(@"M:", "length")];
      id v71 = 0;
      uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t))[v59 checksumForManifest:v19 error:&v71];
      double v21 = v71;
      char v22 = [v62 manifestChecksums];
      v23 = [v22 objectAtIndexedSubscript:v18];
      v24 = (uint64_t (*)(uint64_t, uint64_t))[v23 longLongValue];

      if (v21)
      {
        v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v21;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to compute the checksum for the cached manifest %{public}@: %{public}@", buf, 0x16u);
          v46 = v19;
          double v48 = v21;
          _MBLog();
        }
        goto LABEL_25;
      }
      if (v24 != v20)
      {
        id v26 = [v59 countFilesForManifestID:v19 error:0];
        v25 = [v59 domainNameForManifestID:v19 error:0];
        uint64_t v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2048;
          v78 = v24;
          *(_WORD *)v79 = 2048;
          *(void *)&v79[2] = v20;
          *(_WORD *)&v79[10] = 2048;
          *(void *)&v79[12] = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Found a checksum mismatch for cached manifest %{public}@ %{public}@: %llx != %llx (%llu)", buf, 0x34u);
          id v51 = v20;
          id v52 = v26;
          double v48 = v25;
          double v50 = v24;
          v46 = v19;
          _MBLog();
        }

        v28 = [v62 snapshotID];
        [v58 trackVerificationFailureForSnapshot:v28 manifestID:v17 domain:v25 serverChecksum:v24 localChecksum:v20 localFileCount:v26];

LABEL_25:
        if (v55)
        {
          if (([v62 hasFetchedManifests] & 1) == 0)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v78 = sub_10009B4F8;
            *(void *)v79 = sub_10009B508;
            *(void *)&v79[8] = 0;
            dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
            double v69 = buf;
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472;
            v70[2] = sub_10009CF60;
            v70[3] = &unk_100411D18;
            v70[4] = v53;
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_10009CFA4;
            v67[3] = &unk_100410FC8;
            v30 = v29;
            __int16 v68 = v30;
            [v62 fetchManifestsWithOperationTracker:v57 referenceFetchProgress:0 manifestProgress:v70 snapshotCompletion:v67];
            MBSemaphoreWaitForever();
            v31 = *(id *)(*(void *)&buf[8] + 40);

            _Block_object_dispose(buf, 8);
            double v21 = v31;
          }
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          objc_msgSend(v62, "manifestsByDomainName", v46, v48, v50, v51, v52);
          id v54 = (id)objc_claimAutoreleasedReturnValue();
          id v32 = [v54 countByEnumeratingWithState:&v63 objects:v76 count:16];
          if (v32)
          {
            uint64_t v56 = *(void *)v64;
LABEL_30:
            uint64_t v33 = 0;
            while (1)
            {
              if (*(void *)v64 != v56) {
                objc_enumerationMutation(v54);
              }
              uint64_t v34 = *(void *)(*((void *)&v63 + 1) + 8 * v33);
              v35 = [v62 manifestsByDomainName];
              BOOL v36 = [v35 objectForKeyedSubscript:v34];

              id v37 = [v36 manifestID];
              LOBYTE(v34) = [v37 isEqualToString:v19];

              if (v34) {
                break;
              }

              if (v32 == (id)++v33)
              {
                id v32 = [v54 countByEnumeratingWithState:&v63 objects:v76 count:16];
                if (v32) {
                  goto LABEL_30;
                }
                goto LABEL_36;
              }
            }
          }
          else
          {
LABEL_36:
            BOOL v36 = 0;
          }

          double v38 = MBGetDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            id v39 = [v36 domainName];
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v39;
            *(_WORD *)&buf[22] = 2048;
            v78 = v20;
            *(_WORD *)v79 = 2048;
            *(void *)&v79[2] = v24;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Manifest %{public}@ (%{public}@) may be corrupted in the cache: 0x%llx != 0x%llx", buf, 0x2Au);

            id v49 = [v36 domainName];
            _MBLog();
          }
          if (MBIsInternalInstall()
            && !dword_1004823B4
            && !atomic_fetch_add_explicit(&dword_1004823B4, 1u, memory_order_relaxed))
          {
            v40 = MBGetDefaultLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "Snapshot did not verify", buf, 2u);
              _MBLog();
            }
          }
        }

        goto LABEL_47;
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
    BOOL v13 = 1;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_48:

  +[NSDate timeIntervalSinceReferenceDate];
  double v42 = v41;
  dispatch_time_t v43 = MBGetDefaultLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = [v62 snapshotID];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v44;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v42 - v12;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v78) = v13;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Finished verifying snapshot %{public}@ in %.3fs: %d", buf, 0x1Cu);

    v47 = [v62 snapshotID];
    _MBLog();
  }
  if (v13) {
    [v62 forgetManifests];
  }

LABEL_53:
  return v13;
}

- (BOOL)_refreshCacheWithDevice:(id)a3 operationTracker:(id)a4 refreshState:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v191 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 554, "device");
  }
  v188 = v11;
  if (!v11) {
    __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 555, "tracker");
  }
  if (!v191) {
    __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 556, "refreshState");
  }
  if (!a6) {
    __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 557, "error");
  }
  uint64_t v12 = [(MBCKEngine *)self serviceManager];
  if (!v12) {
    __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 559, "serviceManager");
  }
  BOOL v13 = (void *)v12;
  uint64_t v14 = [v11 account];
  if (!v14) {
    __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 561, "serviceAccount");
  }
  uint64_t v15 = (void *)v14;
  v16 = (NSMutableString *)objc_opt_new();
  stateDescription = self->_stateDescription;
  self->_stateDescription = v16;

  if ([(MBCKEngine *)self handleCancelation:a6])
  {
    LOBYTE(v18) = 0;
    goto LABEL_209;
  }
  v184 = a6;
  v19 = [(MBCKEngine *)self cache];
  uint64_t v20 = v19;
  if (!v19)
  {
    +[MBError errorWithCode:1 format:@"nil cache"];
    LOBYTE(v18) = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_208;
  }
  v181 = v15;
  [v19 beginBatch];
  v194 = self;
  double v21 = objc_opt_new();
  [(MBCKEngine *)v194 setCacheRefreshSummary:v21];
  char v22 = [(MBCKEngine *)v194 context];
  v23 = [v22 backupUDID];
  v24 = MBDeviceUUID();
  unsigned int v25 = [v23 isEqualToString:v24];

  v182 = v21;
  if (v25)
  {
    +[MBCKJournal journalForDevice:v10 cache:v20 engine:v194];
    uint64_t v235 = 0;
    id v234 = 0;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v26 = [obj replayWithOperationTracker:v188 actionCount:&v235 error:&v234];
    id v27 = v234;
    [v21 setJournalActionCount:v235];
    if ((v26 & 1) == 0 && v27)
    {
      v178 = v10;
      id v28 = v27;
      id *v184 = v28;
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v238 = *(double *)&v28;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to replay journal %@", buf, 0xCu);
        _MBLog();
      }

      LOBYTE(v18) = 0;
      uint64_t v15 = v181;
      goto LABEL_206;
    }
    [v21 setJournalReplaySucceeded:v26];
  }
  if (([v10 hasFetchedSnapshots] & 1) == 0)
  {
    if (![v10 fetchSnapshotsWithOperationTracker:v188 error:v184])
    {
      LOBYTE(v18) = 0;
      uint64_t v15 = v181;
      goto LABEL_207;
    }
    dispatch_semaphore_t v29 = [(MBEngine *)v194 watchdog];
    [v29 resume];
  }
  v197 = v20;
  v179 = v13;
  v30 = [v10 snapshots];
  v178 = v10;
  v31 = [v10 snapshots];
  objc_msgSend(v21, "setServerSnapshotCount:", objc_msgSend(v31, "count"));

  id v32 = +[NSDate date];
  [v32 timeIntervalSinceReferenceDate];
  double v34 = v33;

  id v28 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v30, "count"));
  long long v230 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  id obj = v30;
  id v35 = [obj countByEnumeratingWithState:&v230 objects:v249 count:16];
  v195 = v28;
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v231;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v231 != v37) {
          objc_enumerationMutation(obj);
        }
        id v39 = *(void **)(*((void *)&v230 + 1) + 8 * i);
        double v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          double v42 = v41;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v43 = [v195 count];
            *(_DWORD *)buf = 134218242;
            double v238 = *(double *)&v43;
            __int16 v239 = 2114;
            v240 = v39;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Found device record snapshot (%lu): %{public}@", buf, 0x16u);
          }

          id v28 = v195;
          double v170 = COERCE_DOUBLE([v195 count]);
          v173 = v39;
          _MBLog();
        }

        uint64_t v44 = [v39 snapshotID];
        [v28 addObject:v44];
      }
      id v36 = [obj countByEnumeratingWithState:&v230 objects:v249 count:16];
    }
    while (v36);
  }

  id v45 = MBGetDefaultLog();
  BOOL v13 = v179;
  uint64_t v15 = v181;
  uint64_t v20 = v197;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = v45;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = [v28 count];
      *(_DWORD *)buf = 134217984;
      double v238 = *(double *)&v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Found %lu snapshots in the device record", buf, 0xCu);
    }

    double v170 = COERCE_DOUBLE([v28 count]);
    _MBLog();
  }

  v227[0] = _NSConcreteStackBlock;
  v227[1] = 3221225472;
  v227[2] = sub_10009EC08;
  v227[3] = &unk_100411D40;
  id v198 = (id)objc_opt_new();
  id v228 = v198;
  id v196 = v182;
  id v229 = v196;
  id v186 = [v197 enumerateSnapshots:v227];
  if (v186)
  {
    double v48 = MBGetDefaultLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v49 = v48;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v238 = *(double *)&v186;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to fetch the snapshots from the local cache: %@", buf, 0xCu);
      }

      double v170 = *(double *)&v186;
      _MBLog();
    }

    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v50 = v18;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Resetting the cache (failed to enumerate the snapshots from the local cache)", buf, 2u);
      }

      _MBLog();
    }

    LODWORD(v18) = [v179 resetCacheWithAccount:v181 error:v184];
    id v226 = 0;
    id v51 = [v179 openCacheWithAccount:v181 accessType:1 error:&v226];
    id v52 = v226;
    [(MBCKEngine *)v194 setCache:v51];
    if (!v18)
    {
LABEL_166:
      id v143 = v186;
      goto LABEL_205;
    }
    if (!v51) {
      __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 633, "cache");
    }
  }
  id v53 = MBGetDefaultLog();
  id v54 = v196;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v55 = v53;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      id v56 = [v198 count];
      *(_DWORD *)buf = 134217984;
      double v238 = *(double *)&v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Found %lu snapshots in the local cache", buf, 0xCu);
    }

    double v170 = COERCE_DOUBLE([v198 count]);
    _MBLog();
  }

  id v57 = [v198 mutableCopy];
  [v57 minusSet:v28];
  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  id v177 = v57;
  id v58 = [v57 allObjects];
  id v59 = [v58 countByEnumeratingWithState:&v222 objects:v248 count:16];
  BOOL v190 = v59 != 0;
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v223;
    do
    {
      for (j = 0; j != v60; j = (char *)j + 1)
      {
        if (*(void *)v223 != v61) {
          objc_enumerationMutation(v58);
        }
        long long v63 = *(void **)(*((void *)&v222 + 1) + 8 * (void)j);
        long long v64 = MBGetDefaultLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          long long v65 = v64;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            double v238 = *(double *)&v63;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Removing cache-only snapshot %{public}@", buf, 0xCu);
          }

          double v170 = *(double *)&v63;
          _MBLog();
          id v54 = v196;
        }

        objc_msgSend(v54, "setCacheOnlySnapshotCount:", (char *)objc_msgSend(v54, "cacheOnlySnapshotCount") + 1);
        id v66 = [v197 removeSnapshotID:v63];
        [v198 removeObject:v63];
      }
      id v60 = [v58 countByEnumeratingWithState:&v222 objects:v248 count:16];
    }
    while (v60);
  }

  long long v220 = 0u;
  long long v221 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id v67 = obj;
  id v68 = [v67 countByEnumeratingWithState:&v218 objects:v247 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v219;
    id v71 = v197;
    do
    {
      for (k = 0; k != v69; k = (char *)k + 1)
      {
        if (*(void *)v219 != v70) {
          objc_enumerationMutation(v67);
        }
        long long v73 = *(void **)(*((void *)&v218 + 1) + 8 * (void)k);
        long long v75 = [v73 snapshotID];
        if ([v198 containsObject:v75])
        {
          v76 = v73;
          v77 = v196;
          if (![(MBCKEngine *)v194 _verifySnapshotManifests:v76 operationTracker:v188 summary:v196 shouldOutput:0])
          {
            v78 = MBGetDefaultLog();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              v79 = v78;
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                double v238 = *(double *)&v75;
                _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Removing unverified snapshot %{public}@", buf, 0xCu);
              }

              _MBLog();
              v77 = v196;
            }

            objc_msgSend(v77, "setJournalVerificationErrorCount:", (char *)objc_msgSend(v77, "journalVerificationErrorCount") + 1);
            id v71 = v197;
            id v80 = [v197 removeSnapshotID:v75];
            [v198 removeObject:v75];
            [v191 forgetSnapshotID:v75];
            [(NSMutableString *)v194->_stateDescription appendFormat:@"mismatch(%@),", v75];
            BOOL v190 = 1;
          }
        }
      }
      id v69 = [v67 countByEnumeratingWithState:&v218 objects:v247 count:16];
    }
    while (v69);
  }
  else
  {
    id v71 = v197;
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v82 = v81 - v34;
  id v83 = MBGetDefaultLog();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    v84 = v83;
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v238 = v82;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Analyzed existing cache in %0.3fs", buf, 0xCu);
    }

    double v170 = v82;
    _MBLog();
  }

  v85 = +[NSNumber numberWithDouble:v82];
  [(NSMutableDictionary *)v194->_performanceStatistics setObject:v85 forKeyedSubscript:@"CacheAnalysis"];

  if ([v196 journalVerificationErrorCount])
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v87 = v86;
    id v88 = [v71 removeAllOrphanedItems];
    +[NSDate timeIntervalSinceReferenceDate];
    double v90 = v89;
    id v91 = MBGetDefaultLog();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      double v92 = v90 - v87;
      v93 = v91;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v238 = v92;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Removed orphaned items in %0.3fs", buf, 0xCu);
      }

      double v170 = v92;
      _MBLog();
    }
  }
  id v94 = +[NSDate date];
  [v94 timeIntervalSinceReferenceDate];
  double v96 = v95;

  v97 = [(MBCKEngine *)v194 progressModel];
  objc_msgSend(v97, "willTransferItemsWithSize:count:", 0, objc_msgSend(v67, "count"));

  v192 = objc_opt_new();
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id v98 = v67;
  id v99 = [v98 countByEnumeratingWithState:&v214 objects:v246 count:16];
  if (v99)
  {
    id v100 = v99;
    uint64_t v101 = *(void *)v215;
    do
    {
      for (m = 0; m != v100; m = (char *)m + 1)
      {
        if (*(void *)v215 != v101) {
          objc_enumerationMutation(v98);
        }
        v103 = *(void **)(*((void *)&v214 + 1) + 8 * (void)m);
        v104 = objc_msgSend(v103, "snapshotID", v171, v174, v175);
        uint64_t v105 = [v103 productVersion];
        v106 = [v103 requiredProductVersion];
        uint64_t v107 = MBGetDefaultLog();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          v108 = v107;
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            double v238 = *(double *)&v104;
            __int16 v239 = 2114;
            v240 = v105;
            __int16 v241 = 2114;
            id v242 = v106;
            _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "snapshot:%{public}@, productVersion:%{public}@, requiredProductVersion:%{public}@", buf, 0x20u);
          }

          v174 = v105;
          id v175 = v106;
          id v171 = v104;
          _MBLog();
        }

        if (v105) {
          [v192 setObject:v106 forKeyedSubscript:v105];
        }
      }
      id v100 = [v98 countByEnumeratingWithState:&v214 objects:v246 count:16];
    }
    while (v100);
  }

  v109 = MBGetDefaultLog();
  BOOL v13 = v179;
  p_isa = (id *)&v194->super.super.isa;
  id v28 = v195;
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v111 = v109;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v238 = *(double *)&v192;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "requiredProductVersionByProductVersion: %{public}@", buf, 0xCu);
    }

    id v171 = v192;
    _MBLog();
  }

  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  id v183 = v98;
  id v112 = [v183 countByEnumeratingWithState:&v210 objects:v245 count:16];
  if (!v112)
  {
    id v186 = 0;
    goto LABEL_153;
  }
  id v113 = v112;
  uint64_t v114 = *(void *)v211;
  uint64_t v180 = *(void *)v211;
  while (2)
  {
    long long v115 = 0;
    id v187 = v113;
    do
    {
      if (*(void *)v211 != v114) {
        objc_enumerationMutation(v183);
      }
      v116 = *(void **)(*((void *)&v210 + 1) + 8 * (void)v115);
      v118 = [v116 snapshotID];
      v119 = [v116 productVersion];
      if (v119)
      {
        id v120 = [v192 objectForKeyedSubscript:v119];
      }
      else
      {
        id v120 = 0;
      }
      v121 = objc_msgSend(v116, "device", v171);
      v189 = [v121 deviceClass];

      v122 = MBGetDefaultLog();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        v123 = v122;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          double v238 = *(double *)&v118;
          __int16 v239 = 2114;
          v240 = v119;
          __int16 v241 = 2114;
          id v242 = v120;
          __int16 v243 = 2114;
          v244 = v189;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "snapshot:%{public}@, productVersion:%{public}@, requiredProductVersion:%{public}@, snapshotDeviceClass:%{public}@", buf, 0x2Au);
        }

        id v175 = v120;
        v176 = v189;
        id v171 = v118;
        v174 = v119;
        _MBLog();
      }

      if ([(MBEngine *)v194 isRestoreEngine])
      {
        id v124 = MBProductVersion();
        int v125 = MBIsRestoreCompatible();

        if (!v125)
        {
          id v186 = 0;
LABEL_148:
          p_isa = (id *)&v194->super.super.isa;
          goto LABEL_152;
        }
      }
      if ([(MBEngine *)v194 isBackupEngine])
      {
        v126 = MBProductVersion();
        uint64_t v127 = MBCompareVersionStrings();

        if (v127 == -1)
        {
          id v186 = +[MBError errorWithCode:203 format:@"Version incompatible. iCloud contains a backup for this device from a newer OS version"];
          goto LABEL_148;
        }
      }
      if ([v198 containsObject:v118])
      {
        v128 = MBGetDefaultLog();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
        {
          v128 = v128;
          p_isa = (id *)&v194->super.super.isa;
          id v129 = v187;
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            double v238 = *(double *)&v118;
            _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "Skipping snapshot %{public}@ since it's already in the cache", buf, 0xCu);
          }

          id v171 = v118;
          _MBLog();
        }
        else
        {
          p_isa = (id *)&v194->super.super.isa;
          id v129 = v187;
        }
      }
      else
      {
        id v185 = v120;
        objc_msgSend(v196, "setDownloadedSnapshotCount:", (char *)objc_msgSend(v196, "downloadedSnapshotCount") + 1);
        id v209 = 0;
        v130 = v194;
        unsigned int v131 = [(MBCKEngine *)v194 _refreshSnapshot:v116 operationTracker:v188 refreshState:v191 error:&v209];
        uint64_t v132 = v209;
        if (!v131)
        {
          id v186 = v132;
          goto LABEL_151;
        }
        v133 = v132;
        [(NSMutableString *)v194->_stateDescription appendFormat:@"fetched(%@),", v118];
        if ([(MBCKEngine *)v194 _verifySnapshotManifests:v116 operationTracker:v188 summary:v196 shouldOutput:1])
        {
          v128 = v133;
          BOOL v190 = 1;
          p_isa = (id *)&v194->super.super.isa;
        }
        else
        {
          uint64_t v134 = MBGetDefaultLog();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          {
            uint64_t v135 = v134;
            if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              double v238 = *(double *)&v118;
              _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_ERROR, "Failed to verify snapshot %{public}@", buf, 0xCu);
            }

            id v171 = v118;
            _MBLog();
          }

          objc_msgSend(v196, "setDownloadedSnapshotVerificationFailureCount:", (char *)objc_msgSend(v196, "downloadedSnapshotVerificationFailureCount") + 1);
          if (MBIsInternalInstall())
          {
            uint64_t v136 = [(MBEngine *)v194 debugContext];
            unsigned int v137 = [v136 BOOLForName:@"CacheRefreshTest"];

            if (v137) {
              MBExit(-1);
            }
          }
          objc_msgSend(v191, "forgetSnapshotID:", v118, v171);
          v208 = v133;
          v130 = v194;
          unsigned int v138 = [(MBCKEngine *)v194 _refreshSnapshot:v116 operationTracker:v188 refreshState:v191 error:&v208];
          v128 = v208;

          if (!v138)
          {
            id v186 = v128;
LABEL_151:
            p_isa = (id *)&v130->super.super.isa;
            id v120 = v185;
LABEL_152:

            BOOL v13 = v179;
            goto LABEL_153;
          }
          [(NSMutableString *)v194->_stateDescription appendFormat:@"fetched(%@),", v118];
          BOOL v190 = 1;
          p_isa = (id *)&v194->super.super.isa;
        }
        id v129 = v187;
        uint64_t v114 = v180;
        id v120 = v185;
      }

      long long v115 = (char *)v115 + 1;
    }
    while (v129 != v115);
    id v113 = [v183 countByEnumeratingWithState:&v210 objects:v245 count:16];
    id v186 = 0;
    BOOL v13 = v179;
    if (v113) {
      continue;
    }
    break;
  }
LABEL_153:

  uint64_t v15 = v181;
  uint64_t v20 = v197;
  if (MBIsInternalInstall())
  {
    if ([v196 downloadedSnapshotCount]
      && [v196 cachedSnapshotCount]
      && !dword_1004823B8
      && !atomic_fetch_add_explicit(&dword_1004823B8, 1u, memory_order_relaxed))
    {
      v139 = MBGetDefaultLog();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_FAULT))
      {
        v140 = v139;
        if (os_log_type_enabled(v140, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v238 = *(double *)&v196;
          _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_FAULT, "Downloaded snapshot during cache refresh: %@", buf, 0xCu);
        }

        id v171 = v196;
        _MBLog();
      }
    }
    id v141 = objc_msgSend(v181, "persona", v171, v174, v175, v176);
    v142 = [v196 dictionaryRepresentation];
    [v141 setPreferencesValue:v142 forKey:@"WasSnapshotDownloadedDuringCacheRefresh"];
  }
  if (objc_msgSend(p_isa, "handleCancelation:", v184, v171))
  {
    LOBYTE(v18) = 0;
    id v52 = v177;
    id v51 = v192;
    goto LABEL_166;
  }
  if (v186)
  {
    id v143 = v186;
    LOBYTE(v18) = 0;
    id *v184 = v143;
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v145 = v144 - v96;
    v146 = +[NSNumber numberWithDouble:v145];
    [p_isa[28] setObject:v146 forKeyedSubscript:@"CacheFetchTime"];

    v147 = MBGetDefaultLog();
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
    {
      v148 = v147;
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v238 = v145;
        _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "Fetched all missing snapshots in %0.3fs", buf, 0xCu);
      }

      double v172 = v145;
      _MBLog();
    }

    if (!v190) {
      goto LABEL_201;
    }
    v149 = +[NSDate date];
    [v149 timeIntervalSinceReferenceDate];
    double v151 = v150;

    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    id v152 = v183;
    id v153 = [v152 countByEnumeratingWithState:&v204 objects:v236 count:16];
    if (v153)
    {
      id v154 = v153;
      int v155 = 0;
      uint64_t v156 = *(void *)v205;
      do
      {
        for (n = 0; n != v154; n = (char *)n + 1)
        {
          if (*(void *)v205 != v156) {
            objc_enumerationMutation(v152);
          }
          v155 |= objc_msgSend(p_isa, "_verifySnapshotManifests:operationTracker:summary:shouldOutput:", *(void *)(*((void *)&v204 + 1) + 8 * (void)n), v188, v196, 1, *(void *)&v172) ^ 1;
        }
        id v154 = [v152 countByEnumeratingWithState:&v204 objects:v236 count:16];
      }
      while (v154);
    }
    else
    {
      LOBYTE(v155) = 0;
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v159 = v158 - v151;
    v160 = MBGetDefaultLog();
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
    {
      v161 = v160;
      if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v238 = v159;
        _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEFAULT, "Validated all snapshots in %0.3fs", buf, 0xCu);
      }

      double v172 = v159;
      _MBLog();
    }

    v162 = +[NSNumber numberWithDouble:v159];
    [p_isa[28] setObject:v162 forKeyedSubscript:@"CacheValidationTime"];

    if (v155)
    {
      v163 = MBGetDefaultLog();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
      {
        v164 = v163;
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_ERROR, "CK Cache is corrupted - continuing anyways", buf, 2u);
        }

        _MBLog();
      }

      [p_isa[27] appendFormat:@"forced-rebuild,"];
    }
    v199[0] = _NSConcreteStackBlock;
    v199[1] = 3221225472;
    v199[2] = sub_10009ED34;
    v199[3] = &unk_100411D68;
    id v200 = v197;
    id v201 = v152;
    v202 = p_isa;
    id v203 = v178;
    v165 = [v200 performInTransaction:v199];
    if (v165)
    {
      v166 = MBGetDefaultLog();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
      {
        v167 = v166;
        if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          double v238 = *(double *)&v165;
          _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_ERROR, "Failed to save the snapshots and update the FileChanges table: %{public}@", buf, 0xCu);
        }

        double v172 = *(double *)&v165;
        _MBLog();
      }

      id *v184 = v165;
      int v168 = 78;
    }
    else
    {
      int v168 = 0;
    }
    uint64_t v15 = v181;

    if (v168 == 78)
    {
      if (!*v184) {
        __assert_rtn("-[MBCKEngine _refreshCacheWithDevice:operationTracker:refreshState:error:]", "MBCKEngine.m", 808, "*error");
      }
      id v143 = 0;
      LOBYTE(v18) = 0;
    }
    else
    {
LABEL_201:
      objc_msgSend(v197, "flush", *(void *)&v172);
      id v143 = 0;
      LOBYTE(v18) = 1;
    }
  }
  id v52 = v177;
  id v51 = v192;
LABEL_205:

LABEL_206:
  id v10 = v178;
LABEL_207:

LABEL_208:
LABEL_209:

  return (char)v18;
}

- (BOOL)refreshCacheWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKEngine refreshCacheWithError:]", "MBCKEngine.m", 835, "error");
  }
  BOOL v5 = [(MBCKEngine *)self device];
  uint64_t v6 = v5;
  if (!v5) {
    __assert_rtn("-[MBCKEngine refreshCacheWithError:]", "MBCKEngine.m", 837, "device");
  }
  id v43 = [v5 deviceUUID];
  id v45 = [(MBCKEngine *)self serviceManager];
  if (!v45) {
    __assert_rtn("-[MBCKEngine refreshCacheWithError:]", "MBCKEngine.m", 840, "serviceManager");
  }
  v7 = [(MBCKEngine *)self cache];
  if (!v7) {
    __assert_rtn("-[MBCKEngine refreshCacheWithError:]", "MBCKEngine.m", 842, "cache");
  }
  uint64_t v44 = [(MBCKEngine *)self serviceAccount];
  if (!v44) {
    __assert_rtn("-[MBCKEngine refreshCacheWithError:]", "MBCKEngine.m", 844, "serviceAccount");
  }
  id v8 = +[MBCacheRefreshState loadFromCache:v7];
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v52 = v43;
    __int16 v53 = 2114;
    double v54 = *(double *)&v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting cache refresh for device %{public}@ with cache refresh state: %{public}@", buf, 0x16u);
    id v39 = v43;
    double v40 = *(double *)&v8;
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v11 = v10;
  if (![(MBCKEngine *)self handleCancelation:a3])
  {
    BOOL v13 = [(MBCKEngine *)self ckOperationTracker];
    if (!v13)
    {
      uint64_t v14 = [(MBCKEngine *)self ckOperationPolicy];
      uint64_t v15 = v14;
      if (!v14) {
        __assert_rtn("-[MBCKEngine refreshCacheWithError:]", "MBCKEngine.m", 859, "policy");
      }
      id v16 = [v14 operationGroupWithName:@"refreshCache" processName:0];
      unsigned __int8 v17 = [v45 databaseManager];
      BOOL v13 = +[MBCKOperationTracker operationTrackerWithAccount:v44 databaseManager:v17 policy:v15 error:a3];

      [v13 setCkOperationGroup:v16];
      if (!v13)
      {
        BOOL v12 = 0;
        goto LABEL_39;
      }
      [(MBCKEngine *)self setCkOperationTracker:v13];
    }
    id v18 = v6;
    objc_sync_enter(v18);
    id v50 = 0;
    double v42 = v13;
    unsigned __int8 v19 = [(MBCKEngine *)self _refreshCacheWithDevice:v18 operationTracker:v13 refreshState:v8 error:&v50];
    id v16 = v50;
    objc_sync_exit(v18);

    +[NSDate timeIntervalSinceReferenceDate];
    double v21 = v20;
    char v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = v21 - v11;
      *(_DWORD *)buf = 138543874;
      id v52 = v43;
      __int16 v53 = 2048;
      double v54 = v23;
      __int16 v55 = 2114;
      id v56 = v8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Finished cache refresh for device %{public}@ in %.3fs with state: %{public}@", buf, 0x20u);
      double v41 = v8;
      double v40 = v23;
      id v39 = v43;
      _MBLog();
    }

    if (v19)
    {
      if (MBIsInternalInstall())
      {
        v24 = [(MBEngine *)self debugContext];
        unsigned int v25 = [v24 BOOLForName:@"CacheRefreshTest"];

        if (v25)
        {
          id v26 = MBGetDefaultLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Resetting the cache - CacheRefreshTest", buf, 2u);
            _MBLog();
          }

          [v45 resetCacheWithAccount:v44 error:a3];
          uint64_t v47 = 0;
          id v27 = [v45 openCacheWithAccount:v44 accessType:1 error:&v47];
          [(MBCKEngine *)self setCache:v27];
          BOOL v12 = [(MBCKEngine *)self refreshCacheWithError:a3];

          goto LABEL_38;
        }
      }
      id v46 = v16;
      unsigned __int8 v32 = +[MBCacheRefreshState saveRefreshState:toCache:error:](MBCacheRefreshState, "saveRefreshState:toCache:error:", 0, v7, &v46, v39, *(void *)&v40, v41);
      id v33 = v46;

      if (v32)
      {
        BOOL v12 = 1;
        id v16 = v33;
LABEL_38:
        uint64_t v15 = v42;
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v37 = MBGetDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v33;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to clear cache refresh state: %@", buf, 0xCu);
        _MBLog();
      }

      id v38 = v33;
      *a3 = v38;
      id v16 = v38;
      if (!v38) {
LABEL_44:
      }
        __assert_rtn("-[MBCKEngine refreshCacheWithError:]", "MBCKEngine.m", 905, "result || *error");
LABEL_37:
      BOOL v12 = 0;
      goto LABEL_38;
    }
    id v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v52 = v43;
      __int16 v53 = 2112;
      double v54 = *(double *)&v16;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed cache refresh for device %{public}@: %@", buf, 0x16u);
      _MBLog();
    }

    id v29 = v16;
    *a3 = v29;
    if (+[MBError isResumableCacheRefreshError:v29])
    {
      id v49 = v29;
      unsigned __int8 v30 = +[MBCacheRefreshState saveRefreshState:v8 toCache:v7 error:&v49];
      id v16 = v49;

      if (v30) {
        goto LABEL_36;
      }
      v31 = MBGetDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v16;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to set cache refresh state: %@", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      double v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v29;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Not saving cache refresh state for non-resumable error: %@", buf, 0xCu);
        _MBLog();
      }

      id v48 = v29;
      unsigned __int8 v35 = +[MBCacheRefreshState saveRefreshState:0 toCache:v7 error:&v48];
      id v16 = v48;

      if (v35)
      {
LABEL_36:
        if (!*a3) {
          goto LABEL_44;
        }
        goto LABEL_37;
      }
      v31 = MBGetDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v16;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to clear cache refresh state: %@", buf, 0xCu);
        _MBLog();
      }
    }

    goto LABEL_36;
  }
  BOOL v12 = 0;
LABEL_40:

  return v12;
}

- (BOOL)setUpWithError:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self serviceManager];
  if (!v5) {
    __assert_rtn("-[MBCKEngine setUpWithError:]", "MBCKEngine.m", 911, "serviceManager");
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(MBCKEngine *)self serviceAccount];
  if (!v7) {
    __assert_rtn("-[MBCKEngine setUpWithError:]", "MBCKEngine.m", 913, "serviceAccount");
  }
  id v8 = (void *)v7;
  uint64_t v9 = [(MBCKEngine *)self cache];
  if (v9)
  {
    double v10 = (void *)v9;
  }
  else
  {
    double v10 = [v6 openCacheWithAccount:v8 accessType:1 error:a3];
    if (!v10)
    {
      BOOL v11 = 0;
      goto LABEL_8;
    }
    [(MBCKEngine *)self setCache:v10];
  }
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (BOOL)runWithError:(id *)a3
{
  return 0;
}

- (void)makeStateTransition
{
  if (![(MBCKEngine *)self isFinished] && [(MBCKEngine *)self shouldAdvanceState])
  {
    stateDescription = self->_stateDescription;
    self->_stateDescription = 0;

    [(MBCKEngine *)self makeStateTransition];
  }
}

- (void)performRetryablePhase:(id)a3
{
  BOOL v4 = (uint64_t (**)(id, id *))a3;
  uint64_t v5 = [(MBCKEngine *)self injectedError];

  if (v5)
  {
    [(MBCKEngine *)self setIsFinished:1];
    uint64_t v6 = [(MBCKEngine *)self injectedError];
    [(MBCKEngine *)self setEngineError:v6];

    uint64_t v7 = [(MBCKEngine *)self injectedError];
    [(MBCKEngine *)self cleanUpAfterError:v7];
  }
  else
  {
    id v8 = [(MBCKEngine *)self retryStrategy];
    [v8 reset];

    uint64_t v9 = [(MBEngine *)self watchdog];
    [v9 resume];

    id v36 = 0;
    unsigned __int8 v11 = [(MBCKEngine *)self handleCancelation:&v36];
    id v12 = v36;
    if (v11)
    {
LABEL_4:
      -[MBCKEngine setIsFinished:](self, "setIsFinished:", 1, v30, v32);
      [(MBCKEngine *)self setEngineError:v12];
    }
    else
    {
      BOOL v13 = ATClientController_ptr;
      while (1)
      {
        id v35 = 0;
        uint64_t v14 = -[MBCKEngine setUpOperationTrackerWithError:](self, "setUpOperationTrackerWithError:", &v35, v30, v32);
        id v15 = v35;
        id v16 = v15;
        if (!v14)
        {
          [(MBCKEngine *)self setIsFinished:1];
          [(MBCKEngine *)self setEngineError:v16];
LABEL_20:
          id v27 = v12;
          goto LABEL_21;
        }

        id v34 = 0;
        char v17 = v4[2](v4, &v34);
        id v18 = v34;
        id v16 = v18;
        if (v17) {
          goto LABEL_20;
        }
        if (!v18)
        {
          unsigned __int8 v19 = [v13[146] stringWithFormat:@"block returned NO without setting an out error: %@", self];
          if (MBIsInternalInstall())
          {
            double v20 = v13;
            double v21 = +[NSAssertionHandler currentHandler];
            char v22 = [v20[146] stringWithUTF8String:"-[MBCKEngine performRetryablePhase:]"];
            [v21 handleFailureInFunction:v22 file:@"MBCKEngine.m" lineNumber:982 description:v19];
          }
          else
          {
            double v21 = MBGetDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v19;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
              v31 = v19;
              _MBLog();
            }
          }

          BOOL v13 = ATClientController_ptr;
        }
        double v23 = [(MBCKEngine *)self retryStrategy];
        unsigned __int8 v24 = [v23 shouldRetryAfterError:v16];

        if ((v24 & 1) == 0) {
          break;
        }
        unsigned int v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v38 = self;
          __int16 v39 = 2112;
          double v40 = v16;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Retrying transition for %{public}@ after error: %@", buf, 0x16u);
          unsigned __int8 v30 = self;
          unsigned __int8 v32 = v16;
          _MBLog();
        }

        id v36 = 0;
        unsigned __int8 v26 = [(MBCKEngine *)self handleCancelation:&v36];
        id v12 = v36;
        if (v26) {
          goto LABEL_4;
        }
      }
      id v33 = v12;
      unsigned int v28 = [(MBCKEngine *)self handleCancelation:&v33];
      id v27 = v33;

      if (v28)
      {
        [(MBCKEngine *)self setIsFinished:1];
        [(MBCKEngine *)self setEngineError:v27];
      }
      else
      {
        id v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          id v38 = self;
          __int16 v39 = 2112;
          double v40 = v16;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Not retrying transition for %{public}@ after error: %@", buf, 0x16u);
          _MBLog();
        }

        [(MBCKEngine *)self setIsFinished:1];
        [(MBCKEngine *)self setEngineError:v16];
        [(MBCKEngine *)self cleanUpAfterError:v16];
      }
LABEL_21:
    }
  }
}

- (BOOL)fetchDeviceToDeviceEncryptionSupportedByAccount:(BOOL *)a3 error:(id *)a4
{
  uint64_t v7 = [(MBCKEngine *)self serviceManager];
  if (!v7) {
    __assert_rtn("-[MBCKEngine fetchDeviceToDeviceEncryptionSupportedByAccount:error:]", "MBCKEngine.m", 1011, "serviceManager");
  }
  id v8 = v7;
  uint64_t v9 = [v7 databaseManager];
  double v10 = [(MBCKEngine *)self serviceAccount];
  unsigned __int8 v11 = [v9 fetchDeviceToDeviceEncryptionSupportedByAccount:a3 account:v10 error:a4];

  return v11;
}

- (void)replenishRetryTokens
{
  id v2 = [(MBCKEngine *)self retryStrategy];
  [v2 replenishRetryTokens];
}

- (BOOL)backsUpPrimaryAccount
{
  id v2 = [(MBCKEngine *)self serviceAccount];
  if (!v2) {
    __assert_rtn("-[MBCKEngine backsUpPrimaryAccount]", "MBCKEngine.m", 1023, "serviceAccount");
  }
  double v3 = v2;
  unsigned __int8 v4 = [v2 isPrimaryAccount];

  return v4;
}

- (BOOL)isNetworkAvailable
{
  double v3 = [(MBCKEngine *)self serviceManager];
  if (!v3) {
    __assert_rtn("-[MBCKEngine isNetworkAvailable]", "MBCKEngine.m", 1035, "serviceManager");
  }
  unsigned __int8 v4 = v3;
  unsigned int v5 = [v3 networkConnectivity];
  uint64_t v6 = [(MBCKEngine *)self ckOperationPolicy];
  uint64_t v7 = [v6 cellularAccess];

  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v12 = v5 & 1;
    __int16 v13 = 1024;
    int v14 = (v5 >> 8) & 1;
    __int16 v15 = 1024;
    int v16 = HIWORD(v5) & 1;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "isOnWiFi:%d, isOnCellular:%d(%d), cellularAccess:%{public}@", buf, 0x1Eu);
    _MBLog();
  }

  if (v5)
  {
LABEL_8:
    unsigned __int8 v9 = 1;
    goto LABEL_9;
  }
  unsigned __int8 v9 = 0;
  if ((v5 & 0x100) != 0 && v7)
  {
    if ((v5 & 0x10000) != 0)
    {
      unsigned __int8 v9 = [v7 allowsExpensiveNetworkAccess];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (id)setUpOperationTrackerWithError:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self serviceAccount];
  if (!v5) {
    __assert_rtn("-[MBCKEngine setUpOperationTrackerWithError:]", "MBCKEngine.m", 1051, "serviceAccount");
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(MBCKEngine *)self serviceManager];
  if (!v7) {
    __assert_rtn("-[MBCKEngine setUpOperationTrackerWithError:]", "MBCKEngine.m", 1053, "serviceManager");
  }
  id v8 = (void *)v7;
  unsigned __int8 v9 = [(MBCKEngine *)self ckOperationTracker];
  double v10 = v9;
  if (v9)
  {
    unsigned __int8 v11 = [v9 ckOperationPolicy];
    uint64_t v12 = [v10 ckOperationGroup];
    __int16 v13 = (void *)v12;
    if (v11)
    {
      if (v12) {
        goto LABEL_6;
      }
      goto LABEL_27;
    }
  }
  else
  {
    __int16 v13 = 0;
  }
  unsigned __int8 v11 = [(MBCKEngine *)self ckOperationPolicy];
  if (v13)
  {
LABEL_6:
    if (v11) {
      goto LABEL_7;
    }
LABEL_28:
    __assert_rtn("-[MBCKEngine setUpOperationTrackerWithError:]", "MBCKEngine.m", 1067, "policy");
  }
LABEL_27:
  __int16 v13 = [(MBCKEngine *)self ckOperationGroup];
  if (!v11) {
    goto LABEL_28;
  }
LABEL_7:
  if (!v13) {
    __assert_rtn("-[MBCKEngine setUpOperationTrackerWithError:]", "MBCKEngine.m", 1068, "group");
  }
  int v14 = [v11 cellularAccess];
  if ([(MBEngine *)self isRestoreEngine] && [(MBEngine *)self restoreType] == 2)
  {
    uint64_t v15 = objc_msgSend(v8, "cellularAccessForRestoreType:account:", -[MBEngine restoreType](self, "restoreType"), v6);
  }
  else
  {
    uint64_t v15 = [v11 cellularAccess];
  }
  int v16 = (void *)v15;
  unsigned __int8 v26 = v8;
  if (v10 && (v14 == (void *)v15 || ([v14 isEqual:v15] & 1) != 0))
  {
    id v17 = v11;
    id v18 = v10;
  }
  else
  {
    id v17 = [v11 copy];

    [v17 setCellularAccess:v16];
    unsigned __int8 v19 = [v8 databaseManager];
    id v18 = +[MBCKOperationTracker operationTrackerWithAccount:v6 databaseManager:v19 policy:v17 group:v13 error:a3];

    if (!v18) {
      goto LABEL_22;
    }
    double v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      unsigned int v28 = v16;
      __int16 v29 = 2114;
      unsigned __int8 v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Created a new operation tracker with cellularAccess:%{public}@ for %{public}@", buf, 0x16u);
      unsigned __int8 v24 = v16;
      unsigned int v25 = self;
      _MBLog();
    }

    [(MBCKEngine *)self setCkOperationTracker:v18];
    if ([(MBEngine *)self isCanceled]) {
      [v18 cancel];
    }
  }
  int64_t v21 = [(MBCKEngine *)self qualityOfService];
  char v22 = [v18 ckOperationPolicy];
  [v22 setQualityOfService:v21];

LABEL_22:
  return v18;
}

- (MBCKProperties)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
}

- (MBCKOperationPolicy)ckOperationPolicy
{
  return self->_ckOperationPolicy;
}

- (void)setCkOperationPolicy:(id)a3
{
}

- (CKOperationGroup)ckOperationGroup
{
  return self->_ckOperationGroup;
}

- (void)setCkOperationGroup:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (NSError)engineError
{
  return self->_engineError;
}

- (void)setEngineError:(id)a3
{
}

- (NSError)injectedError
{
  return self->_injectedError;
}

- (void)setInjectedError:(id)a3
{
}

- (BOOL)shouldAdvanceState
{
  return self->_shouldAdvanceState;
}

- (void)setShouldAdvanceState:(BOOL)a3
{
  self->_shouldAdvanceState = a3;
}

- (MBCKSettingsContext)context
{
  return self->_context;
}

- (MBCKCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (MBCKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (MBCKManager)serviceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceManager);
  return (MBCKManager *)WeakRetained;
}

- (void)setServiceManager:(id)a3
{
}

- (NSMutableString)stateDescription
{
  return self->_stateDescription;
}

- (NSMutableDictionary)performanceStatistics
{
  return self->_performanceStatistics;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (id)stateChange
{
  return self->_stateChange;
}

- (void)setStateChange:(id)a3
{
}

- (MBServiceAccount)serviceAccount
{
  return self->_serviceAccount;
}

- (MBCacheRefreshSummary)cacheRefreshSummary
{
  return self->_cacheRefreshSummary;
}

- (void)setCacheRefreshSummary:(id)a3
{
}

- (BOOL)verifyProgressModel
{
  return self->_verifyProgressModel;
}

- (void)setVerifyProgressModel:(BOOL)a3
{
  self->_verifyProgressModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheRefreshSummary, 0);
  objc_storeStrong((id *)&self->_serviceAccount, 0);
  objc_storeStrong(&self->_stateChange, 0);
  objc_storeStrong((id *)&self->_performanceStatistics, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_injectedError, 0);
  objc_storeStrong((id *)&self->_engineError, 0);
  objc_storeStrong((id *)&self->_ckOperationGroup, 0);
  objc_storeStrong((id *)&self->_ckOperationPolicy, 0);
  objc_storeStrong((id *)&self->properties, 0);
  objc_storeStrong((id *)&self->_multistateRetryStrategy, 0);
  objc_storeStrong((id *)&self->_retryStrategy, 0);
  objc_storeStrong((id *)&self->_progressModel, 0);
  objc_storeStrong((id *)&self->_ckOperationTracker, 0);
}

@end