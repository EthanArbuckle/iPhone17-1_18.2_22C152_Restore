@interface RTPersistenceMirroringManager
+ (int64_t)periodicPurgePolicy;
- (BOOL)_authorizedToMirror;
- (BOOL)_calculateStoreShouldResetFromChangeHistoryCount:(unint64_t)a3;
- (BOOL)_calculateStoreShouldResetFromTransactionHistory:(id)a3;
- (BOOL)_dataAvailableToMirror;
- (BOOL)_evaluatePersistentHistoryLengthWithManagedObjectContext:(id)a3 shouldResetSync:(BOOL *)a4 error:(id *)a5;
- (BOOL)_fetchDatabaseChangesForDatabase:(id)a3 outputURL:(id)a4 error:(id *)a5;
- (BOOL)_fetchZoneChangesForDatabase:(id)a3 outputURL:(id)a4 error:(id *)a5;
- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4;
- (BOOL)_shouldResetForChangeCountForManagedObjectContext:(id)a3 currentExporterToken:(id)a4 changeRequestError:(id *)a5;
- (BOOL)_transactionHistorySizeError:(id *)a3;
- (BOOL)disableMirroringForPerProcessMemoryLimitViolation:(id)a3 platform:(id)a4;
- (BOOL)exceedingMemoryThreshold;
- (BOOL)exportMirroringIsAvailableWithExpirationEnforcer:(id)a3 expirationDate:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)exportingAvailable;
- (BOOL)mirroringRequest:(id)a3 didFailWithError:(id)a4;
- (NSMutableArray)pendingMirroringRequests;
- (NSMutableDictionary)mirroringPolicies;
- (NSMutableDictionary)retryTimers;
- (RTInvocationDispatcher)dispatcher;
- (RTPersistenceCloudDeletionEnforcer)persistenceCloudDeletionEnforcer;
- (RTPersistenceExpirationEnforcer)persistenceExpirationEnforcer;
- (RTPersistenceManager)persistenceManager;
- (RTPersistenceMirroringManager)init;
- (RTPersistenceMirroringManager)initWithAccountManager:(id)a3 defaultsManager:(id)a4 mirroringPolicies:(id)a5 persistenceCloudDeletionEnforcer:(id)a6 persistenceExpirationEnforcer:(id)a7 persistenceManager:(id)a8 platform:(id)a9 reachabilityManager:(id)a10 timerManager:(id)a11 xpcActivityManager:(id)a12;
- (RTPersistenceMirroringManager)initWithAccountManager:(id)a3 defaultsManager:(id)a4 persistenceManager:(id)a5 platform:(id)a6 reachabilityManager:(id)a7 xpcActivityManager:(id)a8;
- (RTPersistenceMirroringMetricsDelegate)metricsDelegate;
- (RTPersistenceMirroringRequest)activeMirroringRequest;
- (RTPlatform)platform;
- (RTXPCActivityManager)xpcActivityManager;
- (id)changeCountForManagedObjectContext:(id)a3 currentExporterToken:(id)a4 changeRequestError:(id *)a5;
- (id)currentExporterTokenWithManagedObjectContext:(id)a3 error:(id *)a4;
- (id)optionsForQualityOfService:(int64_t)a3;
- (id)persistenceOperationMetricWithMirroringRequest:(id)a3 lastMirroringTransactionDate:(id)a4 recordsChanged:(unint64_t)a5 error:(id)a6;
- (id)transactionHistoryCountRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4;
- (id)transactionHistoryFetchRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4;
- (id)transactionHistoryRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4;
- (int64_t)_mirroringDelegateState;
- (void)_dequeueNextMirroringRequest;
- (void)_enqueueMirroringRequest:(id)a3 context:(id)a4;
- (void)_finalizeMirroringRequest:(id)a3;
- (void)_onCloudSyncAuthorizationChange:(id)a3;
- (void)_onMirroringDelegateInitialization:(id)a3;
- (void)_onReachabilityChange:(id)a3;
- (void)_performExportWithHandler:(id)a3;
- (void)_performImportWithHandler:(id)a3;
- (void)_performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 managedObjectContext:(id)a6 handler:(id)a7;
- (void)_persistenceAvailabilityDidChange:(id)a3;
- (void)_prepareRequestForRetryAttempt:(id)a3 retryInterval:(double)a4;
- (void)_scheduleRetryAttemptForRequest:(id)a3 referenceDate:(id)a4 handler:(id)a5;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startMirroringRequest:(id)a3 context:(id)a4;
- (void)_updateExportingAvailability:(unint64_t)a3;
- (void)_updateMirroringDelegateState;
- (void)collectMetricsFromMirroringRequest:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)fetchDiagnosticLogsWithHandler:(id)a3;
- (void)mirroringManager:(id)a3 exceededHistoryType:(unint64_t)a4 count:(unint64_t)a5 limit:(unint64_t)a6;
- (void)mirroringManager:(id)a3 mirroringRequest:(id)a4 didFailWithError:(id)a5;
- (void)mirroringManager:(id)a3 mirroringRequestDidSucceed:(id)a4;
- (void)mirroringRequestDidBegin:(id)a3;
- (void)mirroringRequestDidSucceed:(id)a3;
- (void)onCloudSyncAuthorizationChange:(id)a3;
- (void)onMirroringDelegateInitialization:(id)a3;
- (void)onReachabilityChange:(id)a3;
- (void)performExportWithHandler:(id)a3;
- (void)performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 handler:(id)a6;
- (void)performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 managedObjectContext:(id)a6 handler:(id)a7;
- (void)performPeriodicSyncWithHandler:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)persistenceAvailabilityDidChange:(id)a3;
- (void)registerForXPCActivities;
- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setActiveMirroringRequest:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setExportingAvailable:(BOOL)a3;
- (void)setMetricsDelegate:(id)a3;
- (void)setMirroringAttemptMapValue:(BOOL)a3 buildVersion:(id)a4;
- (void)setMirroringPolicies:(id)a3;
- (void)setPendingMirroringRequests:(id)a3;
- (void)setPersistenceCloudDeletionEnforcer:(id)a3;
- (void)setPersistenceExpirationEnforcer:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRetryTimers:(id)a3;
- (void)setXpcActivityManager:(id)a3;
- (void)unregisterForXPCActivities;
@end

@implementation RTPersistenceMirroringManager

- (RTPersistenceMirroringManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager_);
}

- (RTPersistenceMirroringManager)initWithAccountManager:(id)a3 defaultsManager:(id)a4 persistenceManager:(id)a5 platform:(id)a6 reachabilityManager:(id)a7 xpcActivityManager:(id)a8
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  id v14 = a7;
  id v26 = a6;
  id v15 = a5;
  id v25 = a4;
  id v24 = a3;
  v23 = [[RTPersistenceMirroringPolicy alloc] initWithQualityOfService:1];
  v22 = [[RTPersistenceMirroringPolicy alloc] initWithQualityOfService:2];
  v21 = [[RTPersistenceMirroringPolicy alloc] initWithQualityOfService:3];
  v16 = objc_opt_new();
  v17 = [[RTPersistenceExpirationEnforcer alloc] initWithPersistenceManager:v15];
  v29[0] = v23;
  v29[1] = v22;
  v29[2] = v21;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  v19 = objc_opt_new();
  v28 = [(RTPersistenceMirroringManager *)self initWithAccountManager:v24 defaultsManager:v25 mirroringPolicies:v18 persistenceCloudDeletionEnforcer:v16 persistenceExpirationEnforcer:v17 persistenceManager:v15 platform:v26 reachabilityManager:v14 timerManager:v19 xpcActivityManager:v13];

  return v28;
}

- (RTPersistenceMirroringManager)initWithAccountManager:(id)a3 defaultsManager:(id)a4 mirroringPolicies:(id)a5 persistenceCloudDeletionEnforcer:(id)a6 persistenceExpirationEnforcer:(id)a7 persistenceManager:(id)a8 platform:(id)a9 reachabilityManager:(id)a10 timerManager:(id)a11 xpcActivityManager:(id)a12
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v62 = a4;
  id v18 = a4;
  id v19 = a5;
  v20 = v17;
  id v68 = v19;
  id v21 = a6;
  id v74 = a6;
  id v63 = a7;
  id v73 = a7;
  id v72 = a8;
  id v71 = a9;
  id v70 = a10;
  id v69 = a11;
  id v22 = a12;
  v67 = v22;
  if (!v20)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: accountManager";
LABEL_38:
    _os_log_error_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_ERROR, v57, buf, 2u);
    goto LABEL_39;
  }
  if (!v18)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_38;
  }
  if (!v74)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: persistenceCloudDeletionEnforcer";
    goto LABEL_38;
  }
  if (!v73)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: persistenceExpirationEnforcer";
    goto LABEL_38;
  }
  if (!v72)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_38;
  }
  if (!v71)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: platform";
    goto LABEL_38;
  }
  if (!v70)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: reachabilityManager";
    goto LABEL_38;
  }
  if (!v69)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    v57 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_38;
  }
  if (!v22)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v57 = "Invalid parameter not satisfying: xpcActivityManager";
      goto LABEL_38;
    }
LABEL_39:

    v55 = 0;
    v54 = self;
    goto LABEL_40;
  }
  id v59 = v18;
  v60 = v20;
  v83.receiver = self;
  v83.super_class = (Class)RTPersistenceMirroringManager;
  v23 = [(RTNotifier *)&v83 init];
  if (v23)
  {
    id v24 = [RTInvocationDispatcher alloc];
    id v25 = [(RTNotifier *)v23 queue];
    uint64_t v26 = [(RTInvocationDispatcher *)v24 initWithQueue:v25];
    dispatcher = v23->_dispatcher;
    v23->_dispatcher = (RTInvocationDispatcher *)v26;

    p_accountManager = (void **)&v23->_accountManager;
    objc_storeStrong((id *)&v23->_accountManager, a3);
    objc_storeStrong((id *)&v23->_defaultsManager, v62);
    objc_storeStrong((id *)&v23->_persistenceCloudDeletionEnforcer, v21);
    objc_storeStrong((id *)&v23->_persistenceExpirationEnforcer, v63);
    objc_storeStrong((id *)&v23->_persistenceManager, a8);
    p_reachabilityManager = (void **)&v23->_reachabilityManager;
    objc_storeStrong((id *)&v23->_reachabilityManager, a10);
    objc_storeStrong((id *)&v23->_platform, a9);
    objc_storeStrong((id *)&v23->_timerManager, a11);
    objc_storeStrong((id *)&v23->_xpcActivityManager, a12);
    uint64_t v28 = objc_opt_new();
    pendingMirroringRequests = v23->_pendingMirroringRequests;
    v23->_pendingMirroringRequests = (NSMutableArray *)v28;

    uint64_t v30 = objc_opt_new();
    retryTimers = v23->_retryTimers;
    v23->_retryTimers = (NSMutableDictionary *)v30;

    v23->_cloudSyncAuthorizationState = 0;
    v23->_currentReachability = 0;
    objc_storeWeak((id *)&v23->_metricsDelegate, v23);
    v23->_syncDisabledForPerProcessMemoryLimit = [(RTPersistenceMirroringManager *)v23 disableMirroringForPerProcessMemoryLimitViolation:v23->_defaultsManager platform:v23->_platform];
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[v68 count]];
    mirroringPolicies = v23->_mirroringPolicies;
    v23->_mirroringPolicies = (NSMutableDictionary *)v32;

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v34 = v68;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v79 objects:v85 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v80 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          v40 = v23->_mirroringPolicies;
          v41 = [NSNumber numberWithInteger:[v39 qualityOfService]];
          [(NSMutableDictionary *)v40 setObject:v39 forKey:v41];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v79 objects:v85 count:16];
      }
      while (v36);
    }

    v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v42 addObserver:v23 selector:sel_onMirroringDelegateInitialization_ name:@"RTPersistenceStoreMirroringDelegateDidInitializeNotificationName" object:0];

    v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v43 addObserver:v23 selector:sel_onMirroringDelegateInitialization_ name:@"RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName" object:0];

    persistenceManager = v23->_persistenceManager;
    v45 = +[RTNotification notificationName];
    [(RTNotifier *)persistenceManager addObserver:v23 selector:sel_persistenceAvailabilityDidChange_ name:v45];

    v46 = *p_accountManager;
    v47 = +[RTNotification notificationName];
    [v46 addObserver:v23 selector:sel_onCloudSyncAuthorizationChange_ name:v47];

    v48 = *p_reachabilityManager;
    v49 = +[RTNotification notificationName];
    [v48 addObserver:v23 selector:sel_onReachabilityChange_ name:v49];

    v50 = *p_accountManager;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke;
    v77[3] = &unk_1E6B93590;
    v51 = v23;
    v78 = v51;
    [v50 fetchCloudSyncAuthorizationState:v77];
    v52 = *p_reachabilityManager;
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_3;
    v75[3] = &unk_1E6B935B8;
    v53 = v51;
    v76 = v53;
    [v52 fetchCurrentReachability:v75];
    [(RTPersistenceMirroringManager *)v53 registerForXPCActivities];
  }
  v54 = v23;
  v55 = v54;
  id v18 = v59;
  v20 = v60;
LABEL_40:

  return v55;
}

void __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_2;
  v5[3] = &unk_1E6B91248;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64) = *(void *)(result + 40);
  return result;
}

void __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_4;
  v5[3] = &unk_1E6B91248;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __233__RTPersistenceMirroringManager_initWithAccountManager_defaultsManager_mirroringPolicies_persistenceCloudDeletionEnforcer_persistenceExpirationEnforcer_persistenceManager_platform_reachabilityManager_timerManager_xpcActivityManager___block_invoke_4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = *(void *)(result + 40);
  return result;
}

- (BOOL)exportMirroringIsAvailableWithExpirationEnforcer:(id)a3 expirationDate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (a6)
  {
    if (v9)
    {
      if (v10)
      {
        if (v11)
        {
          id v24 = 0;
          id v13 = [v9 collectRecordIDsByTypeExpiredBeforeDate:v10 ownedByThisDevice:0 context:v11 error:&v24];
          id v14 = v24;
          if (v14 || [v13 count])
          {
            id v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "Suspending export mirroring due to expired records.", buf, 2u);
            }

            BOOL v16 = 0;
          }
          else
          {
            BOOL v16 = 1;
          }
          id v17 = v14;
          *a6 = v17;

          goto LABEL_24;
        }
        id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
        }

        id v21 = @"context";
      }
      else
      {
        v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate", buf, 2u);
        }

        id v21 = @"expirationDate";
      }
      _RTErrorInvalidParameterCreate((uint64_t)v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v16 = 1;
      goto LABEL_24;
    }
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationEnforcer", buf, 2u);
    }

    _RTErrorInvalidParameterCreate(@"expirationEnforcer");
    BOOL v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    BOOL v16 = 0;
  }
LABEL_24:

  return v16;
}

- (BOOL)disableMirroringForPerProcessMemoryLimitViolation:(id)a3 platform:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v5)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      LOBYTE(v11) = 1;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v18 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_11;
  }
  if (!v6)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v18 = "Invalid parameter not satisfying: platform";
    goto LABEL_14;
  }
  v8 = [v5 objectForKey:@"RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"];
  id v9 = [v7 buildVersion];
  id v10 = [v8 objectForKey:v9];
  int v11 = [v10 BOOLValue];
  if (v11)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "Disabling mirroring due to previous failures.", buf, 2u);
    }

    id v13 = [NSString alloc];
    id v14 = (void *)[v13 initWithCString:RTAnalyticsEventPersistenceMirroringMemoryLimitExceeded encoding:1];
    v23 = @"buildVersion";
    v24[0] = v9;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    log_analytics_submission(v14, v15);

    BOOL v16 = [NSString stringWithFormat:@"com.apple.%@", v14];
    id v21 = @"buildVersion";
    id v22 = v9;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    AnalyticsSendEvent();
  }
LABEL_12:

  return v11;
}

- (void)registerForXPCActivities
{
  v4 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:1 priority:1 requireNetworkConnectivity:3 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:1 allowBattery:86400.0 powerNap:43200.0];
  [(RTXPCActivityCriteria *)v4 setCpuIntensive:1];
  [(RTXPCActivityCriteria *)v4 setExpectedDuration:120.0];
  objc_initWeak(&location, self);
  xpcActivityManager = self->_xpcActivityManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke;
  v14[3] = &unk_1E6B928D0;
  v15[1] = (id)a2;
  objc_copyWeak(v15, &location);
  [(RTXPCActivityManager *)xpcActivityManager registerActivityWithIdentifier:@"com.apple.routined.persistence.mirroring.background" criteria:v4 handler:v14];
  id v6 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:0 requireNetworkConnectivity:3 requireInexpensiveNetworkConnectivity:1 networkTransferDirection:1 allowBattery:1.79769313e308 powerNap:60.0];
  [(RTXPCActivityCriteria *)v6 setCpuIntensive:1];
  [(RTXPCActivityCriteria *)v6 setUserRequestedBackgroundTask:1];
  uint64_t v7 = [(RTPersistenceMirroringManager *)self xpcActivityManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_86;
  v12[3] = &unk_1E6B90E48;
  v13[1] = (id)a2;
  v12[4] = self;
  objc_copyWeak(v13, &location);
  [v7 registerActivityWithIdentifier:@"com.apple.routined.persistence.mirroring.backup" criteria:v6 handler:v12];

  v8 = [[RTXPCActivityCriteria alloc] initWithInterval:2 gracePeriod:1 priority:1 requireNetworkConnectivity:3 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:1 allowBattery:0.0 powerNap:300.0];
  [(RTXPCActivityCriteria *)v8 setCpuIntensive:1];
  [(RTXPCActivityCriteria *)v8 setPostInstall:1];
  [(RTXPCActivityCriteria *)v8 setRequiresBuddyComplete:1];
  id v9 = [(RTPersistenceMirroringManager *)self xpcActivityManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_88;
  v10[3] = &unk_1E6B90E48;
  v11[1] = (id)a2;
  v10[4] = self;
  objc_copyWeak(v11, &location);
  [v9 registerActivityWithIdentifier:@"com.apple.routined.persistence.mirroring.post-install" criteria:v8 handler:v10];

  objc_destroyWeak(v11);
  objc_destroyWeak(v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_83;
      v10[3] = &unk_1E6B90890;
      uint64_t v12 = *(void *)(a1 + 40);
      int v11 = v5;
      [WeakRetained performPeriodicSyncWithHandler:v10];
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to sync, error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    __int16 v9 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_87;
    block[3] = &unk_1E6B935E0;
    objc_copyWeak(v14, (id *)(a1 + 40));
    id v10 = v5;
    uint64_t v11 = *(void **)(a1 + 48);
    id v13 = v10;
    v14[1] = v11;
    dispatch_async(v9, block);

    objc_destroyWeak(v14);
  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_87(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2;
    v4[3] = &unk_1E6B90890;
    uint64_t v6 = *(void *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _performExportWithHandler:v4];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to sync, error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    __int16 v9 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_89;
    block[3] = &unk_1E6B935E0;
    objc_copyWeak(v14, (id *)(a1 + 40));
    id v10 = v5;
    uint64_t v11 = *(void **)(a1 + 48);
    id v13 = v10;
    v14[1] = v11;
    dispatch_async(v9, block);

    objc_destroyWeak(v14);
  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2_90;
    v4[3] = &unk_1E6B90890;
    uint64_t v6 = *(void *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    [WeakRetained performPeriodicSyncWithHandler:v4];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
}

void __57__RTPersistenceMirroringManager_registerForXPCActivities__block_invoke_2_90(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed to sync, error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)unregisterForXPCActivities
{
  [(RTXPCActivityManager *)self->_xpcActivityManager unregisterActivityWithIdentifier:@"com.apple.routined.persistence.mirroring.background" handler:0];
  [(RTXPCActivityManager *)self->_xpcActivityManager unregisterActivityWithIdentifier:@"com.apple.routined.persistence.mirroring.backup" handler:0];
  xpcActivityManager = self->_xpcActivityManager;

  [(RTXPCActivityManager *)xpcActivityManager unregisterActivityWithIdentifier:@"com.apple.routined.persistence.mirroring.post-install" handler:0];
}

- (void)_shutdownWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  [(RTPersistenceMirroringManager *)self unregisterForXPCActivities];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_retryTimers allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(NSMutableDictionary *)self->_retryTimers objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        [v10 invalidate];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_retryTimers removeAllObjects];
  retryTimers = self->_retryTimers;
  self->_retryTimers = 0;

  [(NSMutableArray *)self->_pendingMirroringRequests removeAllObjects];
  pendingMirroringRequests = self->_pendingMirroringRequests;
  self->_pendingMirroringRequests = 0;

  [(RTNotifier *)self->_persistenceManager removeObserver:self];
  [(RTInvocationDispatcher *)self->_dispatcher shutdown];
  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 removeObserver:self];

  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(RTPersistenceMirroringManager *)self unregisterForXPCActivities];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSMutableDictionary *)self->_retryTimers allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(NSMutableDictionary *)self->_retryTimers objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v7)];
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_retryTimers removeAllObjects];
  retryTimers = self->_retryTimers;
  self->_retryTimers = 0;

  [(NSMutableArray *)self->_pendingMirroringRequests removeAllObjects];
  pendingMirroringRequests = self->_pendingMirroringRequests;
  self->_pendingMirroringRequests = 0;

  [(RTNotifier *)self->_persistenceManager removeObserver:self];
  [(RTInvocationDispatcher *)self->_dispatcher shutdown];
  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:self];

  v12.receiver = self;
  v12.super_class = (Class)RTPersistenceMirroringManager;
  [(RTPersistenceMirroringManager *)&v12 dealloc];
}

- (BOOL)_dataAvailableToMirror
{
  return [(RTPersistenceManager *)self->_persistenceManager availability] == 2;
}

- (BOOL)_authorizedToMirror
{
  return self->_cloudSyncAuthorizationState == 2;
}

- (void)performPeriodicSyncWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  id v3 = [v2[18] buildVersion];
  [v2 setMirroringAttemptMapValue:1 buildVersion:v3];

  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_2;
  v5[3] = &unk_1E6B92690;
  void v5[4] = v4;
  id v6 = *(id *)(a1 + 40);
  [v4 _performImportWithHandler:v5];
}

void __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4[18] buildVersion];
    [v4 setMirroringAttemptMapValue:0 buildVersion:v5];

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_3;
    v8[3] = &unk_1E6B923C0;
    v8[4] = v4;
    id v7 = *(id *)(a1 + 40);
    id v9 = 0;
    id v10 = v7;
    [v4 _performExportWithHandler:v8];
  }
}

void __64__RTPersistenceMirroringManager_performPeriodicSyncWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(id **)(a1 + 32);
  id v4 = [v3[18] buildVersion];
  [v3 setMirroringAttemptMapValue:0 buildVersion:v4];

  if (*(void *)(a1 + 48))
  {
    uint64_t v5 = _RTSafeArray();
    uint64_t v6 = _RTMultiErrorCreate();

    (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6);
  }
}

- (void)setMirroringAttemptMapValue:(BOOL)a3 buildVersion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"];
    if (v7)
    {
      id v8 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"];
      id v9 = (void *)[v8 mutableCopy];
    }
    else
    {
      id v9 = objc_opt_new();
    }

    uint64_t v11 = [NSNumber numberWithBool:v4];
    [v9 setObject:v11 forKey:v6];

    [(RTDefaultsManager *)self->_defaultsManager setObject:v9 forKey:@"RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"];
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: buildVersion", v12, 2u);
    }
  }
}

- (void)_performImportWithHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, id))a3;
  if ([(RTPersistenceMirroringManager *)self _dataAvailableToMirror])
  {
    id v16 = 0;
    [(RTPersistenceMirroringManager *)self _transactionHistorySizeError:&v16];
    id v6 = v16;
    if (v6)
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@ error on importing: %@, deferring import", buf, 0x16u);
      }
      if (v5) {
        v5[2](v5, v6);
      }
    }
    else
    {
      persistenceManager = self->_persistenceManager;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      id v14[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_100;
      v14[3] = &unk_1E6B918B0;
      void v14[4] = self;
      long long v15 = v5;
      [(RTPersistenceManager *)persistenceManager performImportMirroringRequestWithQualityOfService:3 handler:v14];
    }
  }
  else
  {
    dispatcher = self->_dispatcher;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke;
    v19[3] = &unk_1E6B90CE0;
    v19[4] = self;
    v20 = v5;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2;
    v17[3] = &unk_1E6B90868;
    uint64_t v18 = v20;
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    objc_super v12 = NSStringFromSelector(a2);
    [(RTInvocationDispatcher *)dispatcher enqueueBlock:v19, v17, @"%@-%@", v11, v12 failureBlock description];
  }
}

uint64_t __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performImportWithHandler:*(void *)(a1 + 40)];
}

void __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = *MEMORY[0x1E4F28568];
    v5[0] = @"Unable to complete buffered mirroring request.";
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_100(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2_101;
  block[3] = &unk_1E6B90EE0;
  char v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__RTPersistenceMirroringManager__performImportWithHandler___block_invoke_2_101(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48) || *(void *)(a1 + 32))
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "error during background import mirroring request, %@", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)_transactionHistorySizeError:(id *)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  char v25 = 0;
  int v5 = [(RTPersistenceMirroringManager *)self persistenceManager];
  uint64_t v6 = [v5 persistenceContextWithOptions:0];

  id v24 = 0;
  BOOL v7 = [(RTPersistenceMirroringManager *)self _evaluatePersistentHistoryLengthWithManagedObjectContext:v6 shouldResetSync:&v25 error:&v24];
  id v8 = v24;
  id v9 = v8;
  id v10 = 0;
  if (v25 && v7 && !v8)
  {
    char v11 = [(RTPersistenceMirroringManager *)self persistenceManager];
    objc_super v12 = [v11 persistenceStoreForType:1];

    uint64_t v30 = @"RTPersistentStoreMetadataStoreTransactionHistorySizeExceededKey";
    v31[0] = MEMORY[0x1E4F1CC38];
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    long long v14 = [v6 persistentStoreCoordinator];
    id v23 = 0;
    [v12 updateMetadata:v13 context:v6 coordinator:v14 error:&v23];
    id v15 = v23;

    if (v15)
    {
      id v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v15;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "error while updating metadata, %@", buf, 0xCu);
      }
    }
    long long v17 = [NSString stringWithFormat:@"Exceeded maximum transaction history size."];
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27 = v17;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:-9997 userInfo:v19];
    v20 = [(RTPersistenceMirroringManager *)self persistenceManager];
    id v21 = [v20 delegate];
    [v21 persistenceStore:v12 encounteredCriticalError:v10];
  }
  if (a3) {
    *a3 = v10;
  }

  return v10 == 0;
}

- (void)performExportWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__RTPersistenceMirroringManager_performExportWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__RTPersistenceMirroringManager_performExportWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performExportWithHandler:*(void *)(a1 + 40)];
}

- (void)_performExportWithHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v5 = (void (**)(id, id))a3;
  if ([(RTPersistenceMirroringManager *)self _dataAvailableToMirror])
  {
    id v16 = 0;
    [(RTPersistenceMirroringManager *)self _transactionHistorySizeError:&v16];
    id v6 = v16;
    if (v6)
    {
      BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@ error on exporting: %@, deferring export", buf, 0x16u);
      }
      if (v5) {
        v5[2](v5, v6);
      }
    }
    else
    {
      persistenceManager = self->_persistenceManager;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      id v14[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_106;
      v14[3] = &unk_1E6B918B0;
      void v14[4] = self;
      id v15 = v5;
      [(RTPersistenceManager *)persistenceManager performExportMirroringRequestWithQualityOfService:3 handler:v14];
    }
  }
  else
  {
    dispatcher = self->_dispatcher;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke;
    v19[3] = &unk_1E6B90CE0;
    v19[4] = self;
    v20 = v5;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2;
    v17[3] = &unk_1E6B90868;
    uint64_t v18 = v20;
    id v10 = (objc_class *)objc_opt_class();
    char v11 = NSStringFromClass(v10);
    objc_super v12 = NSStringFromSelector(a2);
    [(RTInvocationDispatcher *)dispatcher enqueueBlock:v19, v17, @"%@-%@", v11, v12 failureBlock description];
  }
}

uint64_t __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performExportWithHandler:*(void *)(a1 + 40)];
}

void __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = *MEMORY[0x1E4F28568];
    v5[0] = @"Unable to complete buffered mirroring request.";
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_106(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2_107;
  block[3] = &unk_1E6B90EE0;
  char v11 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__RTPersistenceMirroringManager__performExportWithHandler___block_invoke_2_107(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48) || *(void *)(a1 + 32))
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "error during background export mirroring request, %@", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  objc_super v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke;
  block[3] = &unk_1E6B93630;
  void block[4] = self;
  id v16 = v10;
  int64_t v18 = a3;
  int64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 96);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_2;
  v7[3] = &unk_1E6B93608;
  uint64_t v4 = *(void *)(a1 + 56);
  v7[4] = v2;
  uint64_t v10 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = v5;
  uint64_t v11 = v6;
  id v9 = *(id *)(a1 + 48);
  [v3 createManagedObjectContext:v7];
}

void __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_3;
  v9[3] = &unk_1E6B91418;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  uint64_t v13 = v5;
  id v7 = v6;
  uint64_t v14 = *(void *)(a1 + 64);
  id v10 = v7;
  id v11 = v3;
  id v12 = *(id *)(a1 + 48);
  id v8 = v3;
  dispatch_async(v4, v9);
}

uint64_t __104__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_handler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performMirroringRequestWithType:*(void *)(a1 + 64) affectedStore:*(void *)(a1 + 40) qualityOfService:*(void *)(a1 + 72) managedObjectContext:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 managedObjectContext:(id)a6 handler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(RTNotifier *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __125__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke;
  v19[3] = &unk_1E6B91418;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  int64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, v19);
}

uint64_t __125__RTPersistenceMirroringManager_performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performMirroringRequestWithType:*(void *)(a1 + 64) affectedStore:*(void *)(a1 + 40) qualityOfService:*(void *)(a1 + 72) managedObjectContext:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_performMirroringRequestWithType:(int64_t)a3 affectedStore:(id)a4 qualityOfService:(int64_t)a5 managedObjectContext:(id)a6 handler:(id)a7
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void (**)(void, void, void))v14;
  if (a3 != 2 && self->_syncDisabledForPerProcessMemoryLimit)
  {
    if (v14)
    {
      uint64_t v67 = *MEMORY[0x1E4F28568];
      v68[0] = @"Sync is disabled due to requests exceeding the memory threshold.";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = 8;
LABEL_9:
      int64_t v19 = [v17 errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:v18 userInfo:v16];
LABEL_10:
      ((void (**)(void, void, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v19);
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (a3 != 1 || self->_exportingAvailable)
  {
    if (![(RTPersistenceMirroringManager *)self _dataAvailableToMirror])
    {
      dispatcher = self->_dispatcher;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke;
      v46[3] = &unk_1E6B91418;
      v46[4] = self;
      int64_t v50 = a3;
      id v47 = v12;
      int64_t v51 = a5;
      id v48 = v13;
      v49 = v15;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke_2;
      v44[3] = &unk_1E6B90868;
      v45 = v49;
      [(RTInvocationDispatcher *)dispatcher enqueueBlock:v46 failureBlock:v44 description:@"pending invocation for mirroring"];

      goto LABEL_13;
    }
    if (v12)
    {
      if (v13)
      {
        id v20 = [v12 options];
        id v21 = [v20 objectForKey:*MEMORY[0x1E4F1BED8]];
        id v16 = [v21 objectForKey:*MEMORY[0x1E4F1BED0]];

        if (v16)
        {
          if (!a5)
          {
            uint64_t v37 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "mirroring request with QoS none requested, returning", buf, 2u);
            }

            if (v15) {
              v15[2](v15, 0, 0);
            }
            goto LABEL_12;
          }
          mirroringPolicies = self->_mirroringPolicies;
          int64_t v23 = [NSNumber numberWithInteger:a5];
          int64_t v19 = [(NSMutableDictionary *)mirroringPolicies objectForKeyedSubscript:v23];

          if (v19)
          {
            [(RTPersistenceMirroringManager *)self optionsForQualityOfService:a5];
            uint64_t v24 = v43 = v19;
            uint64_t v25 = [RTPersistenceMirroringRequest alloc];
            uint64_t v26 = [(RTNotifier *)self queue];
            id v54 = v12;
            v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
            uint64_t v28 = v25;
            id v29 = (void *)v24;
            int64_t v19 = v43;
            uint64_t v30 = [(RTPersistenceMirroringRequest *)v28 initWithQueue:v26 requestType:a3 mirroringPolicy:v43 affectedStores:v27 options:v29 completionHandler:v15];

            [(RTPersistenceMirroringRequest *)v30 setDelegate:self];
            v31 = [(RTPersistenceMirroringRequest *)v30 request];

            if (v31)
            {
              [(RTPersistenceMirroringManager *)self _enqueueMirroringRequest:v30 context:v13];
            }
            else
            {
              v39 = v29;
              uint64_t v52 = *MEMORY[0x1E4F28568];
              v53 = @"Underlying CloudKit request was nil for mirroring request type.";
              v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
              v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:2 userInfo:v40];
              v42 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v62 = v41;
                _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "nil cloudkit request for mirroring request, %@", buf, 0xCu);
              }

              if (v15) {
                ((void (**)(void, void, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v41);
              }

              id v29 = v39;
              int64_t v19 = v43;
            }
          }
          else
          {
            if (!v15) {
              goto LABEL_11;
            }
            uint64_t v55 = *MEMORY[0x1E4F28568];
            v56 = @"There is no mirroring policy associated with the requested quality of service.";
            id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
            uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:1 userInfo:v29];
            v38 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v62 = v30;
              _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "invalid qos for mirroring request, %@", buf, 0xCu);
            }

            ((void (**)(void, void, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v30);
          }

          goto LABEL_11;
        }
        if (!v15) {
          goto LABEL_12;
        }
        uint64_t v57 = *MEMORY[0x1E4F28568];
        v58 = @"This persistent store is not associated with a mirroring delegate.";
        int64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        uint64_t v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:1 userInfo:v19];
        uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v35;
          _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "invalid mirroring delegate for mirroring request, %@", buf, 0xCu);
        }

        ((void (**)(void, void, RTPersistenceMirroringRequest *))v15)[2](v15, 0, v35);
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      if (!v15) {
        goto LABEL_13;
      }
      uint64_t v59 = *MEMORY[0x1E4F28568];
      v60 = @"Mirroring request requires specifying a managed object context.";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      int64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:1 userInfo:v16];
      v33 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      id v62 = v19;
      id v34 = "invalid managed object context for mirroring operation, %@";
    }
    else
    {
      if (!v15) {
        goto LABEL_13;
      }
      uint64_t v63 = *MEMORY[0x1E4F28568];
      v64 = @"Mirroring request requires specifying an affected store.";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      int64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:1 userInfo:v16];
      v33 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      id v62 = v19;
      id v34 = "invalid store for mirroring operation, %@";
    }
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);
LABEL_28:

    goto LABEL_10;
  }
  if (v14)
  {
    uint64_t v65 = *MEMORY[0x1E4F28568];
    v66 = @"Exports are suspended.";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 9;
    goto LABEL_9;
  }
LABEL_13:
}

uint64_t __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performMirroringRequestWithType:*(void *)(a1 + 64) affectedStore:*(void *)(a1 + 40) qualityOfService:*(void *)(a1 + 72) managedObjectContext:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

void __126__RTPersistenceMirroringManager__performMirroringRequestWithType_affectedStore_qualityOfService_managedObjectContext_handler___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = *MEMORY[0x1E4F28568];
    v5[0] = @"enqueued operation for mirroring failed because store was not available.";
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_enqueueMirroringRequest:(id)a3 context:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  v31 = v6;
  uint64_t v7 = [(NSMutableArray *)self->_pendingMirroringRequests indexOfObject:v6];
  val = self;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v6 identifier];
      id v10 = [v9 UUIDString];
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Enqueueing mirroring request with identifier, %@", buf, 0xCu);
    }
    [(NSMutableArray *)self->_pendingMirroringRequests addObject:v6];
    id v32 = v6;
  }
  else
  {
    id v32 = [(NSMutableArray *)self->_pendingMirroringRequests objectAtIndex:v7];
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = (uint64_t)v6;
      __int16 v44 = 2112;
      id v45 = v32;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Merging new mirroring request, %@ with existing mirroring request, %@", buf, 0x16u);
    }

    [v32 mergeRequest:v6];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      activeMirroringRequest = self->_activeMirroringRequest;
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)activeMirroringRequest;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "~~~~~~ACTIVE MIRRORING REQUEST: %@~~~~~~", buf, 0xCu);
    }

    id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [(NSMutableArray *)self->_pendingMirroringRequests count];
      *(_DWORD *)buf = 134217984;
      uint64_t v43 = v15;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "~~~~~~[PENDING MIRRORING REQUESTS]: %lu~~~~~~", buf, 0xCu);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = self->_pendingMirroringRequests;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v43 = v18 + i;
            __int16 v44 = 2112;
            id v45 = v21;
            _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "Pending request %lu: %@", buf, 0x16u);
          }
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
        v18 += i;
      }
      while (v17);
    }
  }
  if ([v32 isReady])
  {
    [(RTPersistenceMirroringManager *)val _startMirroringRequest:v32 context:v29];
  }
  else
  {
    int64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v31 identifier];
      uint64_t v25 = [v24 UUIDString];
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v25;
      _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "Deferring mirroring request with identifier, %@, because it is not ready to execute.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, val);
    uint64_t v26 = [v32 identifier];
    v27 = [MEMORY[0x1E4F1C9C8] date];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__RTPersistenceMirroringManager__enqueueMirroringRequest_context___block_invoke;
    v33[3] = &unk_1E6B917A0;
    objc_copyWeak(&v36, (id *)buf);
    id v28 = v26;
    id v34 = v28;
    id v35 = v29;
    [(RTPersistenceMirroringManager *)val _scheduleRetryAttemptForRequest:v32 referenceDate:v27 handler:v33];

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
}

void __66__RTPersistenceMirroringManager__enqueueMirroringRequest_context___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = WeakRetained[15];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v10 = *(void **)(a1 + 32);
          id v11 = [v9 identifier:v12];
          LODWORD(v10) = [v10 isEqual:v11];

          if (v10)
          {
            [v3 _enqueueMirroringRequest:v9 context:*(void *)(a1 + 40)];
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_startMirroringRequest:(id)a3 context:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_activeMirroringRequest)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      activeMirroringRequest = self->_activeMirroringRequest;
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = activeMirroringRequest;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "an existing request is already active, %@, deferring this request, %@.", buf, 0x16u);
    }

    goto LABEL_20;
  }
  if (![(RTPersistenceMirroringManager *)self _authorizedToMirror])
  {
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v22 = @"The mirroring request is denied due to user authorization";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    long long v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 3;
LABEL_19:
    long long v14 = [v12 errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:v13 userInfo:v11];
    [v6 completeRequestWithError:v14];

    goto LABEL_20;
  }
  if ([(RTPersistenceMirroringManager *)self _mirroringDelegateState] != 1)
  {
    if ([(RTPersistenceMirroringManager *)self _mirroringDelegateState] == 2)
    {
      uint64_t v19 = *MEMORY[0x1E4F28568];
      id v20 = @"The mirroring request failed because the mirroring delegate failed setup.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v13 = 7;
    }
    else if ([(RTPersistenceMirroringManager *)self _mirroringDelegateState])
    {
      uint64_t v13 = 0;
      id v11 = 0;
    }
    else
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
      uint64_t v18 = @"The mirroring request failed because the mirroring delegate has not initialized yet.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v13 = 5;
    }
    long long v12 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_19;
  }
  if (!self->_currentReachability)
  {
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v16 = @"The mirroring request failed because the network is not reachable.";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    long long v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 6;
    goto LABEL_19;
  }
  if ([v6 requestType] == 2)
  {
    id v10 = [(RTPersistenceMirroringManager *)self persistenceManager];
    [v10 updateStoreAvailability:1];
  }
  [v6 executeMirroringRequestWithContext:v7];
LABEL_20:
}

- (void)mirroringRequestDidBegin:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (RTPersistenceMirroringRequest *)a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    long long v14 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "mirroring request, %@ did begin", (uint8_t *)&v13, 0xCu);
  }

  activeMirroringRequest = self->_activeMirroringRequest;
  self->_activeMirroringRequest = v4;
  id v7 = v4;

  [(NSMutableArray *)self->_pendingMirroringRequests removeObject:v7];
  retryTimers = self->_retryTimers;
  id v9 = [(RTPersistenceMirroringRequest *)v7 identifier];
  id v10 = [(NSMutableDictionary *)retryTimers objectForKey:v9];
  [v10 invalidate];

  id v11 = self->_retryTimers;
  long long v12 = [(RTPersistenceMirroringRequest *)v7 identifier];
  [(NSMutableDictionary *)v11 removeObjectForKey:v12];
}

- (BOOL)mirroringRequest:(id)a3 didFailWithError:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v6;
    __int16 v53 = 2112;
    uint64_t v54 = (uint64_t)v7;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "mirroring request, %@ failed with error, %@", buf, 0x16u);
  }

  id v9 = [v7 domain];
  if ([v9 isEqualToString:@"RTPersistenceMirroringManagerErrorDomain"])
  {
    uint64_t v10 = [v7 code];

    if (v10 == 8)
    {
      id v11 = [NSString alloc];
      long long v12 = [v11 initWithCString:RTAnalyticsEventPersistenceMirroringMemoryLimitExceeded encoding:1];
      v49 = @"buildVersion";
      int v13 = [(RTPlatform *)self->_platform buildVersion];
      int64_t v50 = v13;
      long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      log_analytics_submission(v12, v14);

      uint64_t v15 = [NSString stringWithFormat:@"com.apple.%@", v12];
      id v47 = @"buildVersion";
      id v16 = [(RTPlatform *)self->_platform buildVersion];
      id v48 = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      AnalyticsSendEvent();

      goto LABEL_11;
    }
  }
  else
  {
  }
  long long v12 = [v7 domain];
  if ([v12 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v18 = [v7 userInfo];
    uint64_t v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];
    int v20 = [v19 containsString:@"was aborted because the mirroring delegate never successfully initialized due to error: Error Domain=NSCocoaErrorDomain Code=256"];

    if (!v20) {
      goto LABEL_12;
    }
    long long v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_FAULT, "Mirroring request failed due to data protection", buf, 2u);
    }
  }
LABEL_11:

LABEL_12:
  uint64_t v21 = [v7 userInfo];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"Retry-After"];
  if (v22)
  {
    int64_t v23 = (void *)v22;
    unint64_t v24 = [v6 attemptCount];
    unint64_t v25 = RTPersistenceMirroringRequestRetryCountMax;

    if (v24 < v25)
    {
      id v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = [v6 identifier];
        id v28 = [v27 UUIDString];
        uint64_t v29 = [v6 attemptCount];
        *(_DWORD *)buf = 138412546;
        id v52 = v28;
        __int16 v53 = 2048;
        uint64_t v54 = v29;
        _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "will retry request with identifier, %@, attempt count, %lu", buf, 0x16u);
      }
      uint64_t v30 = [v7 userInfo];
      v31 = [v30 objectForKeyedSubscript:@"Retry-After"];
      unint64_t v32 = [v31 unsignedIntegerValue];
      double v33 = (double)v32;

      if (!v32) {
        double v33 = 30.0;
      }
      if ([v6 requestType] == 2)
      {
        id v34 = [(RTPersistenceMirroringManager *)self persistenceManager];
        [v34 updateStoreAvailability:2];
      }
      [(RTPersistenceMirroringManager *)self _prepareRequestForRetryAttempt:v6 retryInterval:v33];
      activeMirroringRequest = self->_activeMirroringRequest;
      self->_activeMirroringRequest = 0;

      BOOL v36 = 1;
      goto LABEL_27;
    }
  }
  else
  {
  }
  if ([v6 requestType] == 2)
  {
    long long v37 = [(RTPersistenceMirroringManager *)self persistenceManager];
    [v37 updateStoreAvailability:2];
  }
  long long v38 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTPersistenceMirroringManager_mirroringRequest_didFailWithError___block_invoke;
  block[3] = &unk_1E6B92F80;
  void block[4] = self;
  id v39 = v6;
  id v45 = v39;
  id v46 = v7;
  dispatch_async(v38, block);

  long long v40 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = [v39 identifier];
    v42 = [v41 UUIDString];
    *(_DWORD *)buf = 138412290;
    id v52 = v42;
    _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "will not retry request with identifier, %@", buf, 0xCu);
  }
  [(RTPersistenceMirroringManager *)self _finalizeMirroringRequest:v39];

  BOOL v36 = 0;
LABEL_27:

  return v36;
}

void __67__RTPersistenceMirroringManager_mirroringRequest_didFailWithError___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 88));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mirroringManager:a1[4] mirroringRequest:a1[5] didFailWithError:a1[6]];
  }
}

- (void)mirroringRequestDidSucceed:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = (uint64_t)v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "mirroring request, %@, succeeded", buf, 0xCu);
  }

  if (![v4 requestType])
  {
    self->_exportingAvailable = 1;
    id v7 = [(RTPersistenceManager *)self->_persistenceManager persistenceContextWithOptions:2];
    persistenceCloudDeletionEnforcer = self->_persistenceCloudDeletionEnforcer;
    id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v31 = 0;
    BOOL v10 = [(RTPersistenceCloudDeletionEnforcer *)persistenceCloudDeletionEnforcer processRequestsSinceReferenceDate:v9 context:v7 error:&v31];
    id v11 = v31;

    if (!v10 || v11 != 0)
    {
      int v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = (uint64_t)v11;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "error while processing deletion requests after import, %@", buf, 0xCu);
      }
    }
    id v6 = @"RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate";
    goto LABEL_34;
  }
  if ([v4 requestType] != 1)
  {
    if ([v4 requestType] == 2)
    {
      id v7 = [(RTPersistenceManager *)self->_persistenceManager persistenceStoreForType:1];
      long long v14 = [(RTPersistenceManager *)self->_persistenceManager persistenceContextWithOptions:1];
      uint64_t v15 = [(RTPersistenceManager *)self->_persistenceManager delegate];
      id v16 = 0;
      unint64_t v17 = 0;
      do
      {

        id v30 = 0;
        int v18 = [v15 persistenceMirroringManagerDidFinishZonePurge:self store:v7 context:v14 error:&v30];
        id v16 = v30;
        if (v16)
        {
          uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v16;
            _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Error while re-preparing the store after zone reset, %@", buf, 0xCu);
          }
        }
        int v20 = v18 ^ 1;
        if (v16) {
          int v20 = 1;
        }
      }
      while (v20 == 1 && v17++ < 4);
      if ((v20 & 1) == 0) {
        [(RTPersistenceManager *)self->_persistenceManager updateStoreAvailability:2];
      }
      uint64_t v22 = [(RTPlatform *)self->_platform buildVersion];
      [(RTPersistenceMirroringManager *)self setMirroringAttemptMapValue:0 buildVersion:v22];

      id v6 = @"RTDefaultsPersistenceMirroringManagerBackgroundLastZoneResetDate";
    }
    else
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = [v4 requestType];
        *(_DWORD *)buf = 134218498;
        uint64_t v33 = v27;
        __int16 v34 = 2080;
        id v35 = "-[RTPersistenceMirroringManager mirroringRequestDidSucceed:]";
        __int16 v36 = 1024;
        int v37 = 1105;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unhandled request type, %lu (in %s:%d)", buf, 0x1Cu);
      }
      id v6 = &stru_1F33EAD88;
    }
LABEL_34:

    goto LABEL_35;
  }
  id v6 = @"RTDefaultsPersistenceMirroringManagerBackgroundLastExportDate";
LABEL_35:
  defaultsManager = self->_defaultsManager;
  unint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
  [(RTDefaultsManager *)defaultsManager setObject:v24 forKey:v6];

  unint64_t v25 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTPersistenceMirroringManager_mirroringRequestDidSucceed___block_invoke;
  block[3] = &unk_1E6B90BF0;
  void block[4] = self;
  id v29 = v4;
  id v26 = v4;
  dispatch_async(v25, block);

  [(RTPersistenceMirroringManager *)self _finalizeMirroringRequest:v26];
}

void __60__RTPersistenceMirroringManager_mirroringRequestDidSucceed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mirroringManager:*(void *)(a1 + 32) mirroringRequestDidSucceed:*(void *)(a1 + 40)];
  }
}

- (void)_finalizeMirroringRequest:(id)a3
{
  [(NSMutableArray *)self->_pendingMirroringRequests removeObject:a3];
  activeMirroringRequest = self->_activeMirroringRequest;
  self->_activeMirroringRequest = 0;

  [(RTPersistenceMirroringManager *)self _dequeueNextMirroringRequest];
}

- (void)_dequeueNextMirroringRequest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingMirroringRequests count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = self->_pendingMirroringRequests;
    id v4 = (id)[(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v7 isReady])
          {
            id v4 = v7;
            goto LABEL_12;
          }
        }
        id v4 = (id)[(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v8 = [(RTPersistenceMirroringManager *)self persistenceManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke;
    v10[3] = &unk_1E6B92B00;
    void v10[4] = self;
    id v11 = v4;
    id v9 = v4;
    [v8 createManagedObjectContext:v10];
  }
}

void __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke_2;
  block[3] = &unk_1E6B92F80;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __61__RTPersistenceMirroringManager__dequeueNextMirroringRequest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMirroringRequest:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (void)_prepareRequestForRetryAttempt:(id)a3 retryInterval:(double)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 < 0.0)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v46 = "-[RTPersistenceMirroringManager _prepareRequestForRetryAttempt:retryInterval:]";
      __int16 v47 = 1024;
      LODWORD(v48) = 1160;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: retryInterval >= 0 (in %s:%d)", buf, 0x12u);
    }
  }
  id v8 = [v6 identifier];
  id v9 = [(NSMutableDictionary *)self->_retryTimers objectForKeyedSubscript:v8];
  if (v9)
  {
    BOOL v10 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v8 UUIDString];
      *(_DWORD *)buf = 138412290;
      id v46 = v11;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "Cancelling existing timer for mirroring operation with identifier, %@", buf, 0xCu);
    }
    [v9 invalidate];
    [(NSMutableDictionary *)self->_retryTimers removeObjectForKey:v8];
  }
  long long v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    long long v13 = [v8 UUIDString];
    *(_DWORD *)buf = 138412290;
    id v46 = v13;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "Creating new underlying mirroring request for request with identifier %@", buf, 0xCu);
  }
  [v6 _prepareMirroringRequestForRetry:v6];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke;
  v41[3] = &unk_1E6B92F80;
  id v14 = v8;
  id v42 = v14;
  uint64_t v43 = self;
  id v15 = v6;
  id v44 = v15;
  __int16 v36 = (void *)MEMORY[0x1E016DB00](v41);
  id v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v14 UUIDString];
    *(_DWORD *)buf = 138412290;
    id v46 = v17;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "Creating retry timer for request identifier %@", buf, 0xCu);
  }
  timerManager = self->_timerManager;
  uint64_t v19 = [v14 UUIDString];
  int v20 = [(RTNotifier *)self queue];
  uint64_t v21 = [(RTTimerManager *)timerManager timerWithIdentifier:v19 queue:v20 handler:v36];

  [(NSMutableDictionary *)self->_retryTimers setObject:v21 forKey:v14];
  [v21 fireAfterDelay:a4];
  [v21 resume];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    __int16 v34 = v21;
    id v35 = v14;
    uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int64_t v23 = [(NSMutableDictionary *)self->_retryTimers allKeys];
      uint64_t v24 = [v23 count];
      *(_DWORD *)buf = 134217984;
      id v46 = (const char *)v24;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "~~~~~Current active retry timers: %lu~~~~~", buf, 0xCu);
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unint64_t v25 = [(NSMutableDictionary *)self->_retryTimers allKeys];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v25);
          }
          id v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          unint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = [v31 UUIDString];
            *(_DWORD *)buf = 134218242;
            id v46 = (const char *)(v28 + i);
            __int16 v47 = 2112;
            id v48 = v33;
            _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%lu. identifier %@", buf, 0x16u);
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
        v28 += i;
      }
      while (v27);
    }

    id v14 = v35;
    uint64_t v21 = v34;
  }
}

void __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) UUIDString];
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "enqueueing retry timer block for request identifier %@", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 96);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_172;
  v6[3] = &unk_1E6B92B00;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 48);
  [v5 createManagedObjectContext:v6];
}

void __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_172(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_2;
  block[3] = &unk_1E6B92F80;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __78__RTPersistenceMirroringManager__prepareRequestForRetryAttempt_retryInterval___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueMirroringRequest:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (void)_scheduleRetryAttemptForRequest:(id)a3 referenceDate:(id)a4 handler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = a4;
  id v11 = [v8 identifier];
  long long v12 = [(NSMutableDictionary *)self->_retryTimers objectForKeyedSubscript:v11];
  if (v12)
  {
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v11 UUIDString];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v14;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "Cancelling existing timer for mirroring operation with identifier, %@", buf, 0xCu);
    }
    [v12 invalidate];
    [(NSMutableDictionary *)self->_retryTimers removeObjectForKey:v11];
  }
  id v15 = [v8 mirroringPolicy];
  [v15 timeIntervalUntilOperationAllowed];
  double v17 = v16;

  int v18 = [v10 dateByAddingTimeInterval:v17];

  uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
  int v20 = [v19 isBeforeDate:v18];
  uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v20)
  {
    id v30 = v8;
    id v31 = v9;
    if (v22)
    {
      int64_t v23 = [v11 UUIDString];
      uint64_t v24 = [v18 stringFromDate];
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = v23;
      __int16 v34 = 2112;
      id v35 = v24;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "Creating timer to fire deferred mirroring operation with identifier, %@ at, %@", buf, 0x16u);
    }
    timerManager = self->_timerManager;
    uint64_t v26 = [v11 UUIDString];
    uint64_t v27 = [(RTNotifier *)self queue];
    id v9 = v31;
    uint64_t v28 = [(RTTimerManager *)timerManager timerWithIdentifier:v26 queue:v27 handler:v31];

    [(NSMutableDictionary *)self->_retryTimers setObject:v28 forKey:v11];
    [v28 fireAfterDelay:v17];
    [v28 resume];

    id v8 = v30;
  }
  else
  {
    if (v22)
    {
      uint64_t v29 = [v11 UUIDString];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v29;
      _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "Deferral period for request with identifier, %@, already expired, firing now.", buf, 0xCu);
    }
    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)persistenceAvailabilityDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __66__RTPersistenceMirroringManager_persistenceAvailabilityDidChange___block_invoke;
    v11[3] = &unk_1E6B90BF0;
    v11[4] = self;
    id v12 = v4;
    dispatch_sync(v8, v11);
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v4 name];
      *(_DWORD *)buf = 138412802;
      id v14 = v10;
      __int16 v15 = 2080;
      double v16 = "-[RTPersistenceMirroringManager persistenceAvailabilityDidChange:]";
      __int16 v17 = 1024;
      int v18 = 1258;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __66__RTPersistenceMirroringManager_persistenceAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistenceAvailabilityDidChange:*(void *)(a1 + 40)];
}

- (void)_persistenceAvailabilityDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[RTPersistenceMirroringManager _persistenceAvailabilityDidChange:]";
      __int16 v11 = 1024;
      int v12 = 1265;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "notification name is not RTPersistenceManagerNotificationAvailabilityDidChange (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  -[RTPersistenceMirroringManager _updateExportingAvailability:](self, "_updateExportingAvailability:", [v4 availability]);
  if ([(RTPersistenceMirroringManager *)self _dataAvailableToMirror]
    && [(RTInvocationDispatcher *)self->_dispatcher invocationsPending])
  {
    [(RTInvocationDispatcher *)self->_dispatcher dispatchPendingInvocations];
  }
}

- (void)_updateExportingAvailability:(unint64_t)a3
{
  if (a3 == 2)
  {
    v9[7] = v3;
    v9[8] = v4;
    id v6 = [(RTPersistenceManager *)self->_persistenceManager persistenceContextWithOptions:0];
    persistenceExpirationEnforcer = self->_persistenceExpirationEnforcer;
    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-4838400.0];
    v9[0] = 0;
    self->_exportingAvailable = [(RTPersistenceMirroringManager *)self exportMirroringIsAvailableWithExpirationEnforcer:persistenceExpirationEnforcer expirationDate:v8 context:v6 error:v9];
  }
}

- (void)onCloudSyncAuthorizationChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __64__RTPersistenceMirroringManager_onCloudSyncAuthorizationChange___block_invoke;
    v11[3] = &unk_1E6B90BF0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v8, v11);
  }
  else
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v4 name];
      *(_DWORD *)buf = 138412802;
      id v14 = v10;
      __int16 v15 = 2080;
      double v16 = "-[RTPersistenceMirroringManager onCloudSyncAuthorizationChange:]";
      __int16 v17 = 1024;
      int v18 = 1299;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __64__RTPersistenceMirroringManager_onCloudSyncAuthorizationChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onCloudSyncAuthorizationChange:*(void *)(a1 + 40)];
}

- (void)_onCloudSyncAuthorizationChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      __int16 v11 = "-[RTPersistenceMirroringManager _onCloudSyncAuthorizationChange:]";
      __int16 v12 = 1024;
      int v13 = 1306;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "notification name is not RTAccountManagerNotificationCloudSyncAuthorizationStateChanged (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
  }
  int64_t v9 = [v4 cloudSyncAuthorizationState];
  self->_cloudSyncAuthorizationState = v9;
  if (v9 == 2 && [(RTInvocationDispatcher *)self->_dispatcher invocationsPending]) {
    [(RTInvocationDispatcher *)self->_dispatcher dispatchPendingInvocations];
  }
}

- (void)onReachabilityChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(RTNotifier *)self queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __54__RTPersistenceMirroringManager_onReachabilityChange___block_invoke;
    v11[3] = &unk_1E6B90BF0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v8, v11);
  }
  else
  {
    int64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = [v4 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      double v16 = "-[RTPersistenceMirroringManager onReachabilityChange:]";
      __int16 v17 = 1024;
      int v18 = 1324;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __54__RTPersistenceMirroringManager_onReachabilityChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onReachabilityChange:*(void *)(a1 + 40)];
}

- (void)_onReachabilityChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      int v10 = "-[RTPersistenceMirroringManager _onReachabilityChange:]";
      __int16 v11 = 1024;
      int v12 = 1331;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "notification name is not RTReachabilityMonitorNotificationReachabilityChanged (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  self->_currentReachability = [v4 reachability];
}

- (int64_t)_mirroringDelegateState
{
  uint64_t v2 = [(RTPersistenceMirroringManager *)self persistenceManager];
  int64_t v3 = [v2 mirroringDelegateStateForStoreType:1];

  return v3;
}

- (void)_updateMirroringDelegateState
{
  if ([(RTPersistenceMirroringManager *)self _mirroringDelegateState]
    && [(RTInvocationDispatcher *)self->_dispatcher invocationsPending])
  {
    dispatcher = self->_dispatcher;
    [(RTInvocationDispatcher *)dispatcher dispatchPendingInvocations];
  }
}

- (id)optionsForQualityOfService:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id result = (id)objc_opt_new();
  id v6 = result;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    char v7 = [result operationConfiguration];
    [v7 setDiscretionaryNetworkBehavior:0];

    id v8 = [v6 operationConfiguration];
    int v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    if (a3 != 1)
    {
      __break(1u);
      return result;
    }
    __int16 v11 = [result operationConfiguration];
    [v11 setDiscretionaryNetworkBehavior:2];

    id v8 = [v6 operationConfiguration];
    int v9 = v8;
    uint64_t v10 = 1;
  }
  [v8 setAutomaticallyRetryNetworkFailures:v10];

  mirroringPolicies = self->_mirroringPolicies;
  uint64_t v13 = [NSNumber numberWithInteger:a3];
  uint64_t v14 = [(NSMutableDictionary *)mirroringPolicies objectForKeyedSubscript:v13];

  if (!v14)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      uint64_t v19 = "-[RTPersistenceMirroringManager optionsForQualityOfService:]";
      __int16 v20 = 1024;
      int v21 = 1371;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "mirroring policy was nil (in %s:%d)", (uint8_t *)&v18, 0x12u);
    }
  }
  uint64_t v16 = [v14 allowsMirroringViaCellular];
  __int16 v17 = [v6 operationConfiguration];
  [v17 setAllowsCellularAccess:v16];

  return v6;
}

+ (int64_t)periodicPurgePolicy
{
  return 0;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (a3 == 1)
  {
    __int16 v11 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke;
    block[3] = &unk_1E6B93630;
    void block[4] = self;
    uint64_t v16 = 1;
    id v14 = v9;
    id v15 = v10;
    SEL v17 = a2;
    dispatch_async(v11, block);
  }
  else
  {
    int v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v19 = a3;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "RTPersistenceMirroringManager doesn't implement purge type, %ld", buf, 0xCu);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _dataAvailableToMirror] & 1) == 0)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 168);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v30[3] = &unk_1E6B90C40;
    uint64_t v14 = *(void *)(a1 + 56);
    v30[4] = v12;
    uint64_t v33 = v14;
    id v31 = *(id *)(a1 + 40);
    id v32 = *(id *)(a1 + 48);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_3;
    v27[3] = &unk_1E6B921E0;
    uint64_t v15 = *(void *)(a1 + 64);
    v27[4] = *(void *)(a1 + 32);
    uint64_t v29 = v15;
    id v28 = *(id *)(a1 + 48);
    uint64_t v16 = (objc_class *)objc_opt_class();
    SEL v17 = NSStringFromClass(v16);
    int v18 = NSStringFromSelector(*(SEL *)(a1 + 64));
    [v13 enqueueBlock:v30, v27, @"%@-%@", v17, v18 failureBlock description];

    return;
  }
  if (*(void *)(a1 + 56) != 1) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  if (v3 != 2)
  {
    id v4 = [NSString stringWithFormat:@"RTPersistenceMirroringManager not purging due to iCloud sync auth state, %ld", v3];
    int64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:3 userInfo:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_25;
  }
  id v4 = [*(id *)(v2 + 96) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 mirroringOptionsForStoreWithType:1];
    id v6 = [v5 allKeys];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      id v9 = [NSString stringWithFormat:@"RTPersistenceMirroringManager not purging due to nil mirroring delegate"];
      int v21 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v9;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v38 = *MEMORY[0x1E4F28568];
      long long v39 = v9;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      int64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:5 userInfo:v22];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      goto LABEL_24;
    }
  }
  if ([*(id *)(a1 + 32) _mirroringDelegateState] == 2)
  {
    uint64_t v5 = [NSString stringWithFormat:@"RTPersistenceMirroringManager not purging due to failed mirroring delegate."];
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v36 = *MEMORY[0x1E4F28568];
    long long v37 = v5;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 7;
LABEL_23:
    uint64_t v22 = [v10 errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:v11 userInfo:v9];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  if (![*(id *)(a1 + 32) _mirroringDelegateState])
  {
    uint64_t v5 = [NSString stringWithFormat:@"RTPersistenceMirroringManager not purging due to mirroring delegate setup state."];
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v34 = *MEMORY[0x1E4F28568];
    id v35 = v5;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 5;
    goto LABEL_23;
  }
  uint64_t v20 = [*(id *)(a1 + 32) persistenceManager];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_191;
  v25[3] = &unk_1E6B93658;
  id v26 = *(id *)(a1 + 48);
  [v20 performZoneResetMirroringRequestWithQualityOfService:3 handler:v25];

  uint64_t v5 = v26;
LABEL_26:
}

uint64_t __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPurgeOfType:*(void *)(a1 + 56) referenceDate:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F5CFE8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  uint64_t v14 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);
}

void __77__RTPersistenceMirroringManager_performPurgeOfType_referenceDate_completion___block_invoke_191(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Error during (purge) zone reset in mirroring manager, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 hasMask:1])
  {
    uint64_t v10 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__RTPersistenceMirroringManager_sendDiagnosticsToURL_options_handler___block_invoke;
    block[3] = &unk_1E6B92668;
    void block[4] = self;
    id v13 = v9;
    id v12 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __70__RTPersistenceMirroringManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _dataAvailableToMirror]
    && [*(id *)(a1 + 32) _mirroringDelegateState] == 1)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v8 = 0;
    [v2 _generateDiagnosticFilesAtURL:v3 error:&v8];
    id v4 = v8;
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
    }
  }
  else
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "skipping diagnostics from the mirroring manager due to data availability or mirroring delegate state", buf, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
    id v4 = 0;
  }
}

- (BOOL)exceedingMemoryThreshold
{
  +[RTRuntime footprint];
  return v2 > 15.0;
}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![(RTPersistenceMirroringManager *)self exceedingMemoryThreshold])
  {
    uint64_t v15 = [v7 URLByAppendingPathComponent:@"CloudKit"];
    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = 0;
    [v17 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v18 = v29;

    if (v18)
    {
      BOOL v16 = 0;
      if (a4) {
        *a4 = v18;
      }
    }
    else
    {
      int64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.CoreRoutine-3" environment:1];
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v19];
      int v21 = [v20 privateCloudDatabase];
      id v28 = 0;
      BOOL v22 = [(RTPersistenceMirroringManager *)self _fetchDatabaseChangesForDatabase:v21 outputURL:v15 error:&v28];
      id v23 = v28;

      if (!v22 || v23)
      {
        BOOL v16 = 0;
        if (a4) {
          *a4 = v23;
        }
      }
      else
      {
        uint64_t v24 = [v20 privateCloudDatabase];
        id v27 = 0;
        [(RTPersistenceMirroringManager *)self _fetchZoneChangesForDatabase:v24 outputURL:v15 error:&v27];
        id v25 = v27;

        BOOL v16 = v25 == 0;
        if (a4 && v25) {
          *a4 = v25;
        }
      }
    }

    goto LABEL_21;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = NSStringFromSelector(a2);
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138413058;
    uint64_t v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2048;
    uint64_t v37 = v12;
    __int16 v38 = 2048;
    uint64_t v39 = 15;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@, deferring attempt to generate diagnostic files; exceeding memory threshold, current footprint, %.4f MB, fo"
      "otprint threshold, %lu MB",
      buf,
      0x2Au);
  }
  if (a4)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5CFE8];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    id v31 = @"routined exceeding persistence mirroring manager's memory threshold for generating diagnostic files.";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v13 errorWithDomain:v14 code:0 userInfo:v15];
    BOOL v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  BOOL v16 = 0;
LABEL_22:

  return v16;
}

- (BOOL)_fetchDatabaseChangesForDatabase:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v56 = v9;
  id v52 = v10;
  if (!v9)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: database", buf, 2u);
    }

    if (!a5) {
      goto LABEL_17;
    }
    _RTErrorInvalidParameterCreate(@"database");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    BOOL v51 = 0;
    *a5 = v19;
    goto LABEL_30;
  }
  if (!v10)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outputURL", buf, 2u);
    }

    if (!a5) {
      goto LABEL_17;
    }
    _RTErrorInvalidParameterCreate(@"outputURL");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ([(RTPersistenceMirroringManager *)self exceedingMemoryThreshold])
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(a2);
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      id v74 = v15;
      LOWORD(v75) = 2048;
      *(void *)((char *)&v75 + 2) = 15;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, deferring attempt to fetch database changes; exceeding memory threshold, current footprint, %.4f MB, foo"
        "tprint threshold, %lu MB",
        buf,
        0x2Au);
    }
    if (a5)
    {
      BOOL v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      long long v79 = @"routined exceeding persistence mirroring manager's memory threshold for fetching database changes.";
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      *a5 = [v16 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v17];
    }
LABEL_17:
    BOOL v51 = 0;
    goto LABEL_30;
  }
  uint64_t v50 = [v52 URLByAppendingPathComponent:@"database-changes.txt"];
  int v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v22 = [v50 path];
  [v21 createFileAtPath:v22 contents:0 attributes:0];

  id v23 = (void *)MEMORY[0x1E4F28CB0];
  uint64_t v24 = [v50 path];
  uint64_t v55 = [v23 fileHandleForWritingAtPath:v24];

  BOOL v51 = v55 != 0;
  if (v55)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v74 = __Block_byref_object_copy__27;
    *(void *)&long long v75 = __Block_byref_object_dispose__27;
    *((void *)&v75 + 1) = 0;
    uint64_t v69 = 0;
    id v70 = &v69;
    uint64_t v71 = 0x2020000000;
    char v72 = 0;
    uint64_t v53 = *MEMORY[0x1E4F5CFE8];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    do
    {
      context = (void *)MEMORY[0x1E016D870]();
      id v25 = objc_alloc(MEMORY[0x1E4F1A038]);
      id v26 = (void *)[v25 initWithPreviousServerChangeToken:*(void *)(*(void *)&buf[8] + 40)];
      [v26 setFetchAllChanges:0];
      [v26 setResultsLimit:1024];
      dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke;
      v67[3] = &unk_1E6B93680;
      id v28 = v55;
      id v68 = v28;
      [v26 setRecordZoneWithIDChangedBlock:v67];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_226;
      v65[3] = &unk_1E6B93680;
      id v29 = v28;
      id v66 = v29;
      [v26 setRecordZoneWithIDWasDeletedBlock:v65];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_230;
      v63[3] = &unk_1E6B93680;
      id v30 = v29;
      id v64 = v30;
      [v26 setRecordZoneWithIDWasPurgedBlock:v63];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_234;
      v58[3] = &unk_1E6B936A8;
      id v31 = v30;
      id v59 = v31;
      v61 = buf;
      id v62 = &v69;
      id v32 = v27;
      v60 = v32;
      [v26 setFetchDatabaseChangesCompletionBlock:v58];
      [v56 addOperation:v26];
      uint64_t v33 = v32;
      __int16 v34 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v35 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v33, v35))
      {
        __int16 v36 = [MEMORY[0x1E4F1C9C8] now];
        [v36 timeIntervalSinceDate:v34];
        double v38 = v37;
        uint64_t v39 = objc_opt_new();
        uint64_t v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_22];
        v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v42 = [v41 filteredArrayUsingPredicate:v40];
        uint64_t v43 = [v42 firstObject];

        [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
        uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long v81 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v81, 2u);
        }

        id v45 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v80 = v54;
        *(void *)long long v81 = @"semaphore wait timeout";
        id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];
        __int16 v47 = [v45 errorWithDomain:v53 code:15 userInfo:v46];

        if (v47) {
      }
        }
    }
    while (*((unsigned char *)v70 + 24));
    [v31 closeFile];
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(buf, 8);
  }
  else if (a5)
  {
    uint64_t v76 = *MEMORY[0x1E4F28568];
    v77 = @"Could not open file descriptor to write diagnostics.";
    id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v48];
  }
LABEL_30:

  return v51;
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016D870]();
  uint64_t v5 = [NSString stringWithFormat:@"Record Zone With ID was changed: %@", v3];
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 dataUsingEncoding:4];
  [v7 writeData:v8];
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_226(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016D870]();
  uint64_t v5 = [NSString stringWithFormat:@"Record Zone With ID was deleted: %@", v3];
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 dataUsingEncoding:4];
  [v7 writeData:v8];
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_230(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016D870]();
  uint64_t v5 = [NSString stringWithFormat:@"Record Zone With ID was purged: %@", v3];
  int v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 dataUsingEncoding:4];
  [v7 writeData:v8];
}

void __82__RTPersistenceMirroringManager__fetchDatabaseChangesForDatabase_outputURL_error___block_invoke_234(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E016D870]();
  uint64_t v11 = NSString;
  if (v9)
  {
    uint64_t v12 = [NSString stringWithFormat:@"An error occurred fetching changes: %@", v9];
  }
  else
  {
    if (a3) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    uint64_t v14 = [v8 data];
    uint64_t v15 = [v14 base64EncodedStringWithOptions:0];
    uint64_t v12 = [v11 stringWithFormat:@"MoreComing: %@. Server Notification Change Token %@", v13, v15];
  }
  BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  uint64_t v17 = *(void **)(a1 + 32);
  id v18 = [v12 dataUsingEncoding:4];
  [v17 writeData:v18];

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_fetchZoneChangesForDatabase:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v61 = v9;
  uint64_t v55 = v10;
  if (!v9)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: database", buf, 2u);
    }

    if (!a5) {
      goto LABEL_17;
    }
    _RTErrorInvalidParameterCreate(@"database");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    BOOL v54 = 0;
    *a5 = v19;
    goto LABEL_30;
  }
  if (!v10)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outputURL", buf, 2u);
    }

    if (!a5) {
      goto LABEL_17;
    }
    _RTErrorInvalidParameterCreate(@"outputURL");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ([(RTPersistenceMirroringManager *)self exceedingMemoryThreshold])
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector(a2);
      +[RTRuntime footprint];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v85 = v15;
      LOWORD(v86) = 2048;
      *(void *)((char *)&v86 + 2) = 15;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, deferring attempt to fetch zone changes; exceeding memory threshold, current footprint, %.4f MB, footpri"
        "nt threshold, %lu MB",
        buf,
        0x2Au);
    }
    if (a5)
    {
      BOOL v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v89 = *MEMORY[0x1E4F28568];
      v90 = @"routined exceeding persistence mirroring manager's memory threshold for fetching zone changes.";
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      *a5 = [v16 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v17];
    }
LABEL_17:
    BOOL v54 = 0;
    goto LABEL_30;
  }
  uint64_t v53 = [v55 URLByAppendingPathComponent:@"zone-changes.txt"];
  uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v22 = [v53 path];
  [v21 createFileAtPath:v22 contents:0 attributes:0];

  id v23 = (void *)MEMORY[0x1E4F28CB0];
  uint64_t v24 = [v53 path];
  v60 = [v23 fileHandleForWritingAtPath:v24];

  BOOL v54 = v60 != 0;
  if (v60)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v85 = __Block_byref_object_copy__27;
    *(void *)&long long v86 = __Block_byref_object_dispose__27;
    *((void *)&v86 + 1) = 0;
    uint64_t v77 = 0;
    uint64_t v78 = &v77;
    uint64_t v79 = 0x2020000000;
    char v80 = 0;
    uint64_t v59 = *MEMORY[0x1E4F19C08];
    uint64_t v56 = *MEMORY[0x1E4F5CFE8];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    do
    {
      context = (void *)MEMORY[0x1E016D870]();
      id v64 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:v59];
      id v25 = objc_opt_new();
      [v25 setPreviousServerChangeToken:*(void *)(*(void *)&buf[8] + 40)];
      [v25 setFetchNewestChangesFirst:0];
      [v25 setResultsLimit:1024];
      id v26 = objc_alloc(MEMORY[0x1E4F1A070]);
      objc_super v83 = v64;
      dispatch_semaphore_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      long long v81 = v64;
      uint64_t v82 = v25;
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      id v29 = (void *)[v26 initWithRecordZoneIDs:v27 configurationsByRecordZoneID:v28];

      [v29 setFetchAllChanges:0];
      id v30 = objc_opt_new();
      dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke;
      v74[3] = &unk_1E6B936D0;
      id v62 = v30;
      id v75 = v62;
      id v32 = v60;
      id v76 = v32;
      [v29 setRecordWasChangedBlock:v74];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_264;
      v72[3] = &unk_1E6B936F8;
      id v33 = v32;
      id v73 = v33;
      [v29 setRecordWithIDWasDeletedBlock:v72];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_269;
      v68[3] = &unk_1E6B93720;
      id v34 = v33;
      id v69 = v34;
      id v70 = buf;
      uint64_t v71 = &v77;
      [v29 setRecordZoneFetchCompletionBlock:v68];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_274;
      v65[3] = &unk_1E6B93748;
      id v58 = v34;
      id v66 = v58;
      dispatch_time_t v35 = v31;
      uint64_t v67 = v35;
      [v29 setFetchRecordZoneChangesCompletionBlock:v65];
      [v61 addOperation:v29];
      __int16 v36 = v35;
      double v37 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v38 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v36, v38))
      {
        uint64_t v39 = [MEMORY[0x1E4F1C9C8] now];
        [v39 timeIntervalSinceDate:v37];
        double v41 = v40;
        id v42 = objc_opt_new();
        uint64_t v43 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_22];
        uint64_t v44 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v45 = [v44 filteredArrayUsingPredicate:v43];
        id v46 = [v45 firstObject];

        [v42 submitToCoreAnalytics:v46 type:1 duration:v41];
        __int16 v47 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v92 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
        }

        id v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v91 = v57;
        *(void *)v92 = @"semaphore wait timeout";
        v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
        uint64_t v50 = [v48 errorWithDomain:v56 code:15 userInfo:v49];

        if (v50) {
      }
        }
    }
    while (*((unsigned char *)v78 + 24));
    [v58 closeFile];
    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(buf, 8);
  }
  else if (a5)
  {
    uint64_t v87 = *MEMORY[0x1E4F28568];
    v88 = @"Could not open file descriptor to write diagnostics.";
    BOOL v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v51];
  }
LABEL_30:

  return v54;
}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E016D870]();
  [*(id *)(a1 + 32) addObject:v8];
  uint64_t v11 = [NSString stringWithFormat:@"%lu %@", [*(id *)(a1 + 32) count], v8];
  uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v16 = v11;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v13 = *(void **)(a1 + 40);
  uint64_t v14 = [v11 dataUsingEncoding:4];
  [v13 writeData:v14];
}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_264(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E016D870]();
  id v8 = [NSString stringWithFormat:@"RecordDeleted: %@ (%@)", v5, v6];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v8 dataUsingEncoding:4];
  [v10 writeData:v11];
}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_269(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  context = (void *)MEMORY[0x1E016D870]();
  if (v12)
  {
    uint64_t v14 = NSString;
    uint64_t v15 = [v12 base64EncodedStringWithOptions:0];
    BOOL v16 = [v14 stringWithFormat:@"Client Change Token %@", v15];

    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v31 = v16;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    id v18 = (void *)a1[4];
    id v19 = [v16 dataUsingEncoding:4];
    [v18 writeData:v19];
  }
  uint64_t v20 = NSString;
  if (v13)
  {
    uint64_t v21 = [NSString stringWithFormat:@"An error occurred fetching changes: %@", v13];
    BOOL v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v31 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  else
  {
    if (a5) {
      id v23 = @"YES";
    }
    else {
      id v23 = @"NO";
    }
    uint64_t v24 = [v11 data];
    id v25 = [v24 base64EncodedStringWithOptions:0];
    uint64_t v21 = [v20 stringWithFormat:@"MoreComing: %@. Server Notification Change Token %@", v23, v25, context, v29];

    BOOL v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v31 = v21;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }

  id v26 = (void *)a1[4];
  dispatch_semaphore_t v27 = [v21 dataUsingEncoding:4];
  [v26 writeData:v27];

  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a5;
}

void __78__RTPersistenceMirroringManager__fetchZoneChangesForDatabase_outputURL_error___block_invoke_274(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E016D870]();
  if (v3)
  {
    id v5 = [NSString stringWithFormat:@"An error occurred fetching changes: %@", v3];
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 dataUsingEncoding:4];
    [v7 writeData:v8];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)onMirroringDelegateInitialization:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__RTPersistenceMirroringManager_onMirroringDelegateInitialization___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __67__RTPersistenceMirroringManager_onMirroringDelegateInitialization___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMirroringDelegateInitialization:*(void *)(a1 + 40)];
}

- (void)_onMirroringDelegateInitialization:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  if (![v5 isEqualToString:@"RTPersistenceStoreMirroringDelegateDidInitializeNotificationName"])
  {
    id v6 = [v4 name];
    char v7 = [v6 isEqualToString:@"RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName"];

    if (v7) {
      goto LABEL_6;
    }
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138413058;
      id v12 = @"RTPersistenceStoreMirroringDelegateDidInitializeNotificationName";
      __int16 v13 = 2112;
      uint64_t v14 = @"RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName";
      __int16 v15 = 2080;
      BOOL v16 = "-[RTPersistenceMirroringManager _onMirroringDelegateInitialization:]";
      __int16 v17 = 1024;
      int v18 = 1815;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "notification name is not %@ or %@ (in %s:%d)", (uint8_t *)&v11, 0x26u);
    }
  }

LABEL_6:
  id v8 = [v4 name];
  if ([v8 isEqualToString:@"RTPersistenceStoreMirroringDelegateDidInitializeNotificationName"])
  {

LABEL_9:
    [(RTPersistenceMirroringManager *)self _updateMirroringDelegateState];
    goto LABEL_10;
  }
  id v9 = [v4 name];
  int v10 = [v9 isEqualToString:@"RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName"];

  if (v10) {
    goto LABEL_9;
  }
LABEL_10:
}

- (id)changeCountForManagedObjectContext:(id)a3 currentExporterToken:(id)a4 changeRequestError:(id *)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = (void *)MEMORY[0x1E4F1C160];
  if (v10)
  {
    id v12 = [MEMORY[0x1E4F1C160] fetchHistoryAfterToken:v10];
  }
  else
  {
    __int16 v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v12 = [v11 fetchHistoryAfterDate:v13];
  }
  [v12 setResultType:6];
  uint64_t v14 = [v9 persistentStoreCoordinator];
  __int16 v15 = [(RTPersistenceMirroringManager *)self persistenceManager];
  BOOL v16 = [v15 persistenceStoreForType:1];
  __int16 v17 = [v16 URL];
  int v18 = [v14 persistentStoreForURL:v17];

  v37[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v12 setAffectedStores:v19];

  [v12 setFetchBatchSize:1024];
  id v28 = 0;
  uint64_t v20 = [v9 executeRequest:v12 error:&v28];
  id v21 = v28;
  if (v21)
  {
    BOOL v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
    }

    if (a5)
    {
      id v23 = v21;
      uint64_t v24 = 0;
LABEL_12:
      *a5 = v21;
      goto LABEL_14;
    }
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = [v20 result];
    id v25 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      id v30 = v26;
      __int16 v31 = 2112;
      uint64_t v32 = v12;
      __int16 v33 = 2112;
      id v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = 0;
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, request, %@, change count, %@, error, %@", buf, 0x2Au);
    }
    if (a5) {
      goto LABEL_12;
    }
  }
LABEL_14:

  return v24;
}

- (BOOL)_shouldResetForChangeCountForManagedObjectContext:(id)a3 currentExporterToken:(id)a4 changeRequestError:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  char v7 = [(RTPersistenceMirroringManager *)self changeCountForManagedObjectContext:a3 currentExporterToken:a4 changeRequestError:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
    }

    BOOL v10 = 0;
    if (a5) {
      *a5 = v8;
    }
  }
  else
  {
    BOOL v10 = -[RTPersistenceMirroringManager _calculateStoreShouldResetFromChangeHistoryCount:](self, "_calculateStoreShouldResetFromChangeHistoryCount:", [v7 integerValue]);
  }

  return v10;
}

- (void)fetchDiagnosticLogsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = NSString;
  if ([*(id *)(a1 + 32) _dataAvailableToMirror]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v5 = [v3 stringWithFormat:@"persistence manager, available, %@, mirroring delegate state, %ld\n", v4, [*(id *)(a1 + 32) _mirroringDelegateState]];
  [v2 addObject:v5];

  if ([*(id *)(a1 + 32) _dataAvailableToMirror])
  {
    id v6 = [*(id *)(a1 + 32) persistenceManager];
    char v7 = [v6 persistenceContextWithOptions:2];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke_2;
    v9[3] = &unk_1E6B92F80;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v11 = v2;
    id v8 = v7;
    [v8 performBlockAndWait:v9];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __64__RTPersistenceMirroringManager_fetchDiagnosticLogsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v1 = [*(id *)(a1 + 32) persistenceManager];
  double v2 = [v1 latestModel];
  id v3 = [v2 entitiesByName];
  id v4 = [v3 allValues];

  id obj = v4;
  uint64_t v72 = [v4 countByEnumeratingWithState:&v83 objects:v90 count:16];
  if (v72)
  {
    uint64_t v71 = *(void *)v84;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v84 != v71) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v83 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1E016D870]();
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        uint64_t v7 = [&unk_1F3452A18 countByEnumeratingWithState:&v79 objects:v89 count:16];
        uint64_t v8 = a1;
        uint64_t v74 = v5;
        if (v7)
        {
          uint64_t v9 = *(void *)v80;
          while (2)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v80 != v9) {
                objc_enumerationMutation(&unk_1F3452A18);
              }
              id v11 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              id v12 = [v6 attributesByName];
              __int16 v13 = [v12 objectForKey:v11];

              if (v13)
              {
                id v18 = v11;
                if (v18)
                {
                  id v19 = v18;
                  id v20 = objc_alloc(MEMORY[0x1E4F1C0D0]);
                  id v21 = [v6 managedObjectClassName];
                  BOOL v22 = (void *)[v20 initWithEntityName:v21];

                  [v22 setResultType:2];
                  id v70 = v19;
                  uint64_t v23 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v19];
                  id v24 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
                  [v24 setName:@"firstDate"];
                  id v25 = (void *)MEMORY[0x1E4F28C68];
                  id v69 = (void *)v23;
                  id v26 = [MEMORY[0x1E4F1C978] arrayWithObject:v23];
                  dispatch_semaphore_t v27 = [v25 expressionForFunction:@"min:" arguments:v26];
                  [v24 setExpression:v27];

                  [v24 setExpressionResultType:900];
                  id v28 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
                  [v28 setName:@"lastDate"];
                  id v29 = (void *)MEMORY[0x1E4F28C68];
                  id v30 = [MEMORY[0x1E4F1C978] arrayWithObject:v23];
                  __int16 v31 = [v29 expressionForFunction:@"max:" arguments:v30];
                  [v28 setExpression:v31];

                  [v28 setExpressionResultType:900];
                  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24, v28];
                  [v22 setPropertiesToFetch:v32];

                  __int16 v33 = [*(id *)(a1 + 40) executeFetchRequest:v22 error:0];
                  id v34 = [v33 lastObject];
                  uint64_t v35 = [v34 valueForKey:@"firstDate"];

                  uint64_t v36 = [v33 lastObject];
                  uint64_t v15 = [v36 valueForKey:@"lastDate"];

                  id v14 = (void *)v35;
                  __int16 v17 = 0;
                  if (v35 && v15)
                  {
                    id v37 = objc_alloc(MEMORY[0x1E4F1C0D0]);
                    dispatch_time_t v38 = [v6 managedObjectClassName];
                    uint64_t v39 = (void *)[v37 initWithEntityName:v38];

                    uint64_t v8 = a1;
                    uint64_t v7 = [*(id *)(a1 + 40) countForFetchRequest:v39 error:0];
                    double v40 = [v6 attributesByName];
                    double v41 = [v40 valueForKey:@"flags"];

                    if (v41)
                    {
                      id v42 = +[RTCloudManagedObject tombstonedPredicate];
                      [v39 setPredicate:v42];

                      __int16 v17 = [NSNumber numberWithUnsignedInteger:[v39 countForFetchRequest:0]];
                    }
                    else
                    {
                      __int16 v17 = 0;
                    }
                  }
                  else
                  {
                    uint64_t v7 = 0;
                    uint64_t v8 = a1;
                  }
                  BOOL v16 = v70;
                }
                else
                {
                  id v14 = 0;
                  uint64_t v15 = 0;
                  BOOL v16 = 0;
                  __int16 v17 = 0;
                  uint64_t v7 = 0;
                }
                goto LABEL_25;
              }
            }
            uint64_t v7 = [&unk_1F3452A18 countByEnumeratingWithState:&v79 objects:v89 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
        id v14 = 0;
        uint64_t v15 = 0;
        BOOL v16 = 0;
        __int16 v17 = 0;
LABEL_25:
        uint64_t v43 = *(void **)(v8 + 48);
        uint64_t v44 = NSString;
        id v45 = [v6 name];
        id v46 = [NSNumber numberWithUnsignedInteger:v7];
        __int16 v47 = [v14 stringFromDate];
        [v15 stringFromDate];
        v49 = id v48 = v14;
        uint64_t v50 = [v44 stringWithFormat:@"%@ count, %@, tombstoneCount, %@, firstInsertDate, %@, lastInsertDate, %@", v45, v46, v17, v47, v49];
        [v43 addObject:v50];

        uint64_t v5 = v74 + 1;
      }
      while (v74 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    }
    while (v72);
  }

  if ([*(id *)(a1 + 32) _mirroringDelegateState] == 1)
  {
    BOOL v51 = *(void **)(a1 + 32);
    uint64_t v52 = *(void *)(a1 + 40);
    id v78 = 0;
    uint64_t v53 = [v51 changeCountForManagedObjectContext:v52 currentExporterToken:0 changeRequestError:&v78];
    id v54 = v78;
    if (!v54)
    {
      uint64_t v55 = *(void **)(a1 + 48);
      uint64_t v56 = [NSString stringWithFormat:@"Change count, %@", v53];
      [v55 addObject:v56];
    }
    uint64_t v57 = *(void **)(a1 + 32);
    uint64_t v58 = *(void *)(a1 + 40);
    id v77 = 0;
    uint64_t v59 = [v57 currentExporterTokenWithManagedObjectContext:v58 error:&v77];
    id v60 = v77;
    v61 = [v57 transactionHistoryCountRequestWithManagedObjectContext:v58 currentExporterToken:v59];

    if (!v60)
    {
      id v62 = *(void **)(a1 + 40);
      id v76 = 0;
      uint64_t v63 = [v62 executeRequest:v61 error:&v76];
      id v60 = v76;
      if (v60)
      {
        id v64 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v88 = v60;
          _os_log_error_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
        }
      }
      uint64_t v65 = [v63 result];
      id v66 = *(void **)(a1 + 48);
      uint64_t v67 = [NSString stringWithFormat:@"Transaction count, %@", v65];
      [v66 addObject:v67];
    }
  }
}

- (id)currentExporterTokenWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v4 = [v37 currentDevice];
  uint64_t v5 = [v4 objectID];

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__27;
  uint64_t v55 = __Block_byref_object_dispose__27;
  id v56 = 0;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__27;
  v49 = __Block_byref_object_dispose__27;
  id v50 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __84__RTPersistenceMirroringManager_currentExporterTokenWithManagedObjectContext_error___block_invoke;
  v40[3] = &unk_1E6B93770;
  uint64_t v43 = &v45;
  id v7 = v5;
  id v41 = v7;
  uint64_t v44 = &v51;
  uint64_t v8 = v6;
  id v42 = v8;
  dispatch_time_t v38 = (void *)MEMORY[0x1E016DB00](v40);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C060]) initWithOptions:0 completionBlock:v38];
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  [v9 setObjectIDsToFetch:v10];

  id v39 = 0;
  id v34 = [v37 executeRequest:v9 error:&v39];
  id v36 = v39;
  id v11 = v8;
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13)) {
    goto LABEL_6;
  }
  id v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  __int16 v17 = objc_opt_new();
  id v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_22];
  id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v20 = [v19 filteredArrayUsingPredicate:v18];
  id v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  BOOL v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
  v60[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v60 count:1];
  id v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;

    char v27 = 0;
  }
  else
  {
LABEL_6:
    id v26 = 0;
    char v27 = 1;
  }

  id v28 = v26;
  if ((v27 & 1) == 0)
  {
    if (a4)
    {
LABEL_18:
      id v29 = 0;
      *a4 = v36;
      goto LABEL_20;
    }
LABEL_19:
    id v29 = 0;
    goto LABEL_20;
  }
  if (!v34 || v36)
  {
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v58 = 2112;
      id v59 = v36;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, encountered error during export progress request, error, %@", buf, 0x16u);
    }
    if (a4) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (a4) {
    *a4 = (id) v52[5];
  }
  id v29 = (id)v46[5];
LABEL_20:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v29;
}

void __84__RTPersistenceMirroringManager_currentExporterTokenWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 success])
  {
    id v4 = [v3 objectIDToLastExportedToken];
    uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = [v3 error];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v3 error];
      int v12 = 138412290;
      dispatch_time_t v13 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "export progress request failed with error, %@", (uint8_t *)&v12, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)transactionHistoryFetchRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C178];
  id v6 = a4;
  id v7 = [v5 entityDescriptionWithContext:a3];
  id v8 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v9 = [v7 name];
  id v10 = (void *)[v8 initWithEntityName:v9];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@ && %K == %@", @"token", v6, @"author", @"ExpirationEnforcer"];

  [v10 setPredicate:v11];

  return v10;
}

- (id)transactionHistoryRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4
{
  id v4 = [(RTPersistenceMirroringManager *)self transactionHistoryFetchRequestWithManagedObjectContext:a3 currentExporterToken:a4];
  uint64_t v5 = [MEMORY[0x1E4F1C160] fetchHistoryWithFetchRequest:v4];
  [v5 setResultType:3];

  return v5;
}

- (id)transactionHistoryCountRequestWithManagedObjectContext:(id)a3 currentExporterToken:(id)a4
{
  id v4 = [(RTPersistenceMirroringManager *)self transactionHistoryFetchRequestWithManagedObjectContext:a3 currentExporterToken:a4];
  uint64_t v5 = [MEMORY[0x1E4F1C160] fetchHistoryWithFetchRequest:v4];
  [v5 setResultType:2];

  return v5;
}

- (BOOL)_evaluatePersistentHistoryLengthWithManagedObjectContext:(id)a3 shouldResetSync:(BOOL *)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5)
  {
    if (v8)
    {
      if (a4)
      {
        uint64_t v29 = 0;
        id v30 = &v29;
        uint64_t v31 = 0x2020000000;
        char v32 = 0;
        if ([(RTPersistenceMirroringManager *)self _mirroringDelegateState] == 1)
        {
          *(void *)buf = 0;
          id v24 = buf;
          uint64_t v25 = 0x3032000000;
          id v26 = __Block_byref_object_copy__27;
          char v27 = __Block_byref_object_dispose__27;
          id v28 = 0;
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __112__RTPersistenceMirroringManager__evaluatePersistentHistoryLengthWithManagedObjectContext_shouldResetSync_error___block_invoke;
          v19[3] = &unk_1E6B93798;
          v19[4] = self;
          id v20 = v9;
          id v21 = buf;
          BOOL v22 = &v29;
          [v20 performBlockAndWait:v19];
          id v10 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            int v18 = *((unsigned __int8 *)v30 + 24);
            *(_DWORD *)__int16 v33 = 67109120;
            int v34 = v18;
            _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "calculated value for shouldResetSync: %d", v33, 8u);
          }

          *a4 = *((unsigned char *)v30 + 24);
          *a5 = *((id *)v24 + 5);
          BOOL v11 = *((void *)v24 + 5) == 0;

          _Block_object_dispose(buf, 8);
        }
        else
        {
          double v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "mirroring delegate not ready to evaluate export progress, skipping.", buf, 2u);
          }

          *a4 = *((unsigned char *)v30 + 24);
          BOOL v11 = 1;
        }
        _Block_object_dispose(&v29, 8);
        goto LABEL_22;
      }
      double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: shouldResetSync != NULL", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"shouldResetSync != NULL");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      dispatch_time_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
      }

      _RTErrorInvalidParameterCreate(@"managedObjectContext");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v11 = 0;
    *a5 = v14;
    goto LABEL_22;
  }
  int v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  BOOL v11 = 0;
LABEL_22:

  return v11;
}

void __112__RTPersistenceMirroringManager__evaluatePersistentHistoryLengthWithManagedObjectContext_shouldResetSync_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 currentExporterTokenWithManagedObjectContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) transactionHistoryRequestWithManagedObjectContext:*(void *)(a1 + 40) currentExporterToken:v5];
    id v7 = *(void **)(a1 + 40);
    id v16 = 0;
    id v8 = [v7 executeRequest:v6 error:&v16];
    uint64_t v9 = v16;
    if (v9)
    {
      id v10 = v9;
      BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "error while querying persistent history, %@", buf, 0xCu);
      }
    }
    else
    {
      BOOL v11 = [v8 result];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _calculateStoreShouldResetFromTransactionHistory:v11];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        id v10 = 0;
      }
      else
      {
        int v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        id v15 = 0;
        char v14 = [v12 _shouldResetForChangeCountForManagedObjectContext:v13 currentExporterToken:v5 changeRequestError:&v15];
        id v10 = v15;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "current exporter token is nil, shouldReset, NO", buf, 2u);
    }
  }
}

- (BOOL)_calculateStoreShouldResetFromChangeHistoryCount:(unint64_t)a3
{
  unint64_t v3 = a3 >> 4;
  if (a3 >> 4 >= 0x271)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained mirroringManager:self exceededHistoryType:1 count:a3 limit:10000];
    }
  }
  return v3 > 0x270;
}

- (BOOL)_calculateStoreShouldResetFromTransactionHistory:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      BOOL v22 = self;
      id v23 = v4;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = ((char *)v9 + 1);
          if ((unint64_t)v9 >= 0x19)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&v22->_metricsDelegate);
            if (objc_opt_respondsToSelector()) {
              [WeakRetained mirroringManager:v22 exceededHistoryType:2 count:v9 limit:25];
            }

            BOOL v19 = 1;
            goto LABEL_20;
          }
          int v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = [v12 timestamp];
          int v14 = [v13 isOnOrAfter:v5];

          if (v14)
          {
            id v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v29 = v9;
              _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "Reset reset-sync window transaction count %lu", buf, 0xCu);
            }

            id v16 = v5;
            __int16 v17 = [v12 timestamp];
            uint64_t v5 = [v17 dateByAddingTimeInterval:86400.0];

            int v18 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v29 = v5;
              __int16 v30 = 2112;
              uint64_t v31 = v16;
              _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "Reset reset-sync window, new window, %@, old window, %@", buf, 0x16u);
            }

            uint64_t v9 = 0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      BOOL v19 = 0;
LABEL_20:
      id v4 = v23;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "export progress request had no results", buf, 2u);
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (RTPersistenceMirroringMetricsDelegate)metricsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);

  return (RTPersistenceMirroringMetricsDelegate *)WeakRetained;
}

- (void)setMetricsDelegate:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (NSMutableDictionary)mirroringPolicies
{
  return self->_mirroringPolicies;
}

- (void)setMirroringPolicies:(id)a3
{
}

- (NSMutableDictionary)retryTimers
{
  return self->_retryTimers;
}

- (void)setRetryTimers:(id)a3
{
}

- (NSMutableArray)pendingMirroringRequests
{
  return self->_pendingMirroringRequests;
}

- (void)setPendingMirroringRequests:(id)a3
{
}

- (RTPersistenceMirroringRequest)activeMirroringRequest
{
  return self->_activeMirroringRequest;
}

- (void)setActiveMirroringRequest:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTPersistenceCloudDeletionEnforcer)persistenceCloudDeletionEnforcer
{
  return self->_persistenceCloudDeletionEnforcer;
}

- (void)setPersistenceCloudDeletionEnforcer:(id)a3
{
}

- (RTPersistenceExpirationEnforcer)persistenceExpirationEnforcer
{
  return self->_persistenceExpirationEnforcer;
}

- (void)setPersistenceExpirationEnforcer:(id)a3
{
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (BOOL)exportingAvailable
{
  return self->_exportingAvailable;
}

- (void)setExportingAvailable:(BOOL)a3
{
  self->_exportingAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_persistenceExpirationEnforcer, 0);
  objc_storeStrong((id *)&self->_persistenceCloudDeletionEnforcer, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_activeMirroringRequest, 0);
  objc_storeStrong((id *)&self->_pendingMirroringRequests, 0);
  objc_storeStrong((id *)&self->_retryTimers, 0);
  objc_storeStrong((id *)&self->_mirroringPolicies, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_destroyWeak((id *)&self->_metricsDelegate);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

- (void)mirroringManager:(id)a3 mirroringRequestDidSucceed:(id)a4
{
}

- (void)mirroringManager:(id)a3 mirroringRequest:(id)a4 didFailWithError:(id)a5
{
}

- (void)collectMetricsFromMirroringRequest:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = NSString;
  id v10 = [NSString alloc];
  BOOL v11 = (void *)[v10 initWithCString:RTAnalyticsEventPersistenceMirroringOperation encoding:1];
  int v12 = [v9 stringWithFormat:@"com.apple.%@", v11];
  int IsEventUsed = AnalyticsIsEventUsed();

  int v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = NSStringFromSelector(a2);
    id v16 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v23 = v15;
    if (IsEventUsed) {
      id v16 = @"YES";
    }
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v16;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, mirroringRequest, %@, error, %@, isEventActive, %@", buf, 0x2Au);
  }
  if (IsEventUsed)
  {
    __int16 v17 = [(RTPersistenceMirroringManager *)self persistenceManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke;
    v18[3] = &unk_1E6B94D80;
    v18[4] = self;
    SEL v21 = a2;
    id v19 = v7;
    id v20 = v8;
    [v17 createManagedObjectContext:v18];
  }
}

void __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) persistenceManager];
  uint64_t v5 = [v4 persistenceStoreForType:1];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [v3 persistentStoreCoordinator];
  id v7 = [v6 persistentStores];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    SEL v21 = v3;
    uint64_t v10 = *(void *)v30;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
      uint64_t v13 = [v12 URL];
      int v14 = [v5 URL];
      char v15 = [v13 isEqual:v14];

      if (v15) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v9) {
          goto LABEL_3;
        }
        id v3 = v21;
        goto LABEL_12;
      }
    }
    id v16 = v12;

    id v3 = v21;
    if (!v16) {
      goto LABEL_13;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke_2;
    v22[3] = &unk_1E6B91E58;
    id v23 = v16;
    id v17 = v21;
    uint64_t v18 = *(void *)(a1 + 56);
    id v24 = v17;
    uint64_t v28 = v18;
    id v25 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 32);
    id v26 = v19;
    uint64_t v27 = v20;
    id v7 = v16;
    [v17 performBlockAndWait:v22];
  }
LABEL_12:

LABEL_13:
}

void __83__RTPersistenceMirroringManager_Metrics__collectMetricsFromMirroringRequest_error___block_invoke_2(uint64_t a1)
{
  v112[1] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v74 = [MEMORY[0x1E4F1C9C8] date];
  id v73 = [v74 dateByAddingTimeInterval:-4838400.0];
  id v3 = [MEMORY[0x1E4F1C160] fetchHistoryAfterDate:];
  [v3 setResultType:3];
  [v3 setFetchLimit:5];
  v112[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:1];
  [v3 setAffectedStores:v4];

  uint64_t v85 = 0;
  uint64_t v83 = 0;
  uint64_t v5 = 0;
  uint64_t v81 = a1;
  id v75 = v3;
  while (1)
  {
    id v78 = (void *)MEMORY[0x1E016D870]();
    id v6 = *(void **)(a1 + 40);
    id v98 = 0;
    id v7 = [v6 executeRequest:v3 error:&v98];
    id v8 = v98;
    if (v8) {
      break;
    }
    uint64_t v9 = [v7 result];
    uint64_t v10 = [v9 count];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obj = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v94 objects:v111 count:16];
    uint64_t v76 = v10;
    id v77 = v7;
    if (!v11) {
      goto LABEL_26;
    }
    uint64_t v12 = v11;
    uint64_t v86 = *(void *)v95;
    uint64_t v13 = v5;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v79 = v13;
      uint64_t v80 = v12 + v13;
      do
      {
        uint64_t v15 = v12;
        if (*(void *)v95 != v86) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v94 + 1) + 8 * v14);
        context = (void *)MEMORY[0x1E016D870]();
        id v17 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 72));
          uint64_t v19 = [v16 transactionNumber];
          uint64_t v20 = [v16 timestamp];
          SEL v21 = [v20 stringFromDate];
          *(_DWORD *)buf = 138412802;
          v101 = v18;
          __int16 v102 = 2048;
          uint64_t v103 = v19;
          __int16 v104 = 2112;
          uint64_t v105 = (uint64_t)v21;
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, transaction, %llu , timestamp, %@", buf, 0x20u);
        }
        BOOL v22 = [v16 author];
        int v23 = [v22 containsString:@"NSCloudKitMirroringDelegate"];

        if (v23)
        {
          uint64_t v24 = [v16 timestamp];

          double v2 = (void *)v24;
        }
        id v25 = [v16 author];
        if (![v25 containsString:@"NSCloudKitMirroringDelegate"]) {
          goto LABEL_18;
        }
        id v26 = [v16 timestamp];
        uint64_t v27 = [*(id *)(a1 + 48) enqueueDate];
        int v28 = [v26 isOnOrAfter:v27];

        if (v28)
        {
          ++v83;
          long long v29 = (void *)MEMORY[0x1E4F1C160];
          long long v30 = [v16 token];
          id v25 = [v29 fetchHistoryTransactionForToken:v30];

          [v25 setResultType:6];
          uint64_t v110 = *(void *)(a1 + 32);
          long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
          [v25 setAffectedStores:v31];

          long long v32 = *(void **)(a1 + 40);
          id v93 = 0;
          uint64_t v33 = [v32 executeRequest:v25 error:&v93];
          id v34 = v93;
          if (v34)
          {
            id v42 = v34;
            uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v101 = v42;
              _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "error while fetching changes history, %@", buf, 0xCu);
            }
            uint64_t v5 = v79 + v14 + 1;

            a1 = v81;
            goto LABEL_26;
          }
          uint64_t v35 = [v33 result];
          uint64_t v36 = [v35 unsignedIntegerValue];

          id v37 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            dispatch_time_t v38 = NSStringFromSelector(*(SEL *)(a1 + 72));
            uint64_t v39 = [v16 transactionNumber];
            double v40 = [v16 timestamp];
            [v40 stringFromDate];
            v41 = long long v82 = v2;
            *(_DWORD *)buf = 138413058;
            v101 = v38;
            __int16 v102 = 2048;
            uint64_t v103 = v39;
            a1 = v81;
            __int16 v104 = 2112;
            uint64_t v105 = (uint64_t)v41;
            __int16 v106 = 2048;
            uint64_t v107 = v36;
            _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@, transaction, %llu, timestamp, %@, changesResultCount, %lu", buf, 0x2Au);

            double v2 = v82;
          }
          v85 += v36;

          [*(id *)(a1 + 40) reset];
LABEL_18:
          uint64_t v12 = v15;

          goto LABEL_20;
        }
        uint64_t v12 = v15;
LABEL_20:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v94 objects:v111 count:16];
      uint64_t v5 = v80;
      uint64_t v13 = v80;
      if (v12) {
        continue;
      }
      break;
    }
LABEL_26:

    id v3 = v75;
    [v75 setFetchOffset:[v75 fetchOffset] + v76];
    [*(id *)(a1 + 40) reset];

    if (!v76)
    {
      uint64_t v45 = 0;
      goto LABEL_31;
    }
  }
  uint64_t v45 = v8;
  uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v101 = v45;
    _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "error while fetching transaction history, %@", buf, 0xCu);
  }

LABEL_31:
  id v46 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    uint64_t v47 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v48 = *(void *)(v81 + 48);
    *(_DWORD *)buf = 138413314;
    v101 = v47;
    __int16 v102 = 2112;
    uint64_t v103 = v48;
    __int16 v104 = 2048;
    uint64_t v105 = v5;
    __int16 v106 = 2048;
    uint64_t v107 = v83;
    __int16 v108 = 2048;
    uint64_t v109 = v85;
    _os_log_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_INFO, "%@, mirroringRequest, %@, transactionCount, %lu, transactionAfterMirroringRequestCount, %lu, changeCount, %lu", buf, 0x34u);

    a1 = v81;
  }

  if (v5)
  {
    v49 = [*(id *)(a1 + 56) userInfo];
    id v50 = [v49 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    uint64_t v51 = [*(id *)(a1 + 56) domain];
    if ([v51 isEqualToString:*MEMORY[0x1E4F5CFE8]])
    {
      uint64_t v52 = [*(id *)(a1 + 56) code];

      if (v52 == 9)
      {
        uint64_t v53 = [*(id *)(a1 + 56) userInfo];
        id v54 = [v53 objectForKeyedSubscript:*MEMORY[0x1E4F5CFE0]];

        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v55 = v54;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v89 objects:v99 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          contexta = v45;
          uint64_t v58 = *(void *)v90;
          do
          {
            id v59 = v55;
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v90 != v58) {
                objc_enumerationMutation(v59);
              }
              v61 = [*(id *)(v81 + 64) persistenceOperationMetricWithMirroringRequest:*(void *)(v81 + 48) lastMirroringTransactionDate:v2 recordsChanged:v85 error:*(void *)(*((void *)&v89 + 1) + 8 * i)];
              id v62 = [NSString alloc];
              uint64_t v63 = v2;
              id v64 = (void *)[v62 initWithCString:RTAnalyticsEventPersistenceMirroringOperation encoding:1];
              log_analytics_submission(v64, v61);
              uint64_t v65 = [NSString stringWithFormat:@"com.apple.%@", v64];
              AnalyticsSendEvent();

              double v2 = v63;
            }
            id v55 = v59;
            uint64_t v57 = [v59 countByEnumeratingWithState:&v89 objects:v99 count:16];
          }
          while (v57);
          id v66 = v59;
          uint64_t v45 = contexta;
        }
        else
        {
          id v66 = v55;
        }
        goto LABEL_48;
      }
    }
    else
    {
    }
    if (v50)
    {
      uint64_t v67 = [*(id *)(a1 + 64) persistenceOperationMetricWithMirroringRequest:*(void *)(a1 + 48) lastMirroringTransactionDate:v2 recordsChanged:v85 error:v50];
      id v68 = [NSString alloc];
      id v69 = (void *)[v68 initWithCString:RTAnalyticsEventPersistenceMirroringOperation encoding:1];
      log_analytics_submission(v69, v67);
      id v70 = [NSString stringWithFormat:@"com.apple.%@", v69];
      AnalyticsSendEvent();
    }
    id v66 = [*(id *)(a1 + 64) persistenceOperationMetricWithMirroringRequest:*(void *)(a1 + 48) lastMirroringTransactionDate:v2 recordsChanged:v85 error:*(void *)(a1 + 56)];
    id v71 = [NSString alloc];
    id v55 = (id)[v71 initWithCString:RTAnalyticsEventPersistenceMirroringOperation encoding:1];
    log_analytics_submission(v55, v66);
    uint64_t v72 = [NSString stringWithFormat:@"com.apple.%@", v55];
    AnalyticsSendEvent();

LABEL_48:
    id v3 = v75;
  }
}

- (id)persistenceOperationMetricWithMirroringRequest:(id)a3 lastMirroringTransactionDate:(id)a4 recordsChanged:(unint64_t)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = NSNumber;
  uint64_t v14 = [v9 mirroringPolicy];
  uint64_t v15 = [v13 numberWithInteger:[v14 qualityOfService]];
  [v12 setObject:v15 forKeyedSubscript:@"qualityOfService"];

  id v16 = [NSNumber numberWithInteger:[v9 requestType]];
  [v12 setObject:v16 forKeyedSubscript:@"requestType"];

  id v17 = [NSNumber numberWithUnsignedInteger:a5];
  [v12 setObject:v17 forKeyedSubscript:@"recordsChanged"];

  uint64_t v18 = [MEMORY[0x1E4F1C9C8] distantPast];
  LODWORD(v16) = [v10 isEqualToDate:v18];

  if (v16)
  {
    [v12 setObject:&unk_1F3453878 forKeyedSubscript:@"timeIntervalSinceLastOperation"];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v20 = NSNumber;
    [v19 timeIntervalSinceDate:v10];
    SEL v21 = [v20 numberWithDouble:];
    [v12 setObject:v21 forKeyedSubscript:@"timeIntervalSinceLastOperation"];
  }
  BOOL v22 = NSNumber;
  [v9 duration];
  int v23 = [v22 numberWithDouble:];
  [v12 setObject:v23 forKeyedSubscript:@"durationOfOperation"];

  if (v11)
  {
    uint64_t v24 = [v11 domain];
    [v12 setObject:v24 forKeyedSubscript:@"errorDomain"];

    id v25 = [NSNumber numberWithInteger:[v11 code]];
    [v12 setObject:v25 forKeyedSubscript:@"errorCode"];
  }

  return v12;
}

- (void)mirroringManager:(id)a3 exceededHistoryType:(unint64_t)a4 count:(unint64_t)a5 limit:(unint64_t)a6
{
  id v15 = (id)objc_opt_new();
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  [v15 setObject:v9 forKeyedSubscript:@"type"];

  id v10 = [NSNumber numberWithUnsignedInteger:a5];
  [v15 setObject:v10 forKeyedSubscript:@"count"];

  id v11 = [NSNumber numberWithUnsignedInteger:a6];
  [v15 setObject:v11 forKeyedSubscript:@"limit"];

  id v12 = [NSString alloc];
  uint64_t v13 = (void *)[v12 initWithCString:RTAnalyticsEventPersistenceMirroringHistoryLimitExceeded encoding:1];
  log_analytics_submission(v13, v15);
  uint64_t v14 = [NSString stringWithFormat:@"com.apple.%@", v13];
  AnalyticsSendEvent();
}

@end