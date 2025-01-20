@interface RTPersistenceDriver
+ (id)persistCurrentDeviceWithIdentifier:(id)a3 inStore:(id)a4 context:(id)a5 platform:(id)a6 notificationHelper:(id)a7 error:(id *)a8;
+ (int64_t)periodicPurgePolicy;
- (BOOL)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4 isRetry:(BOOL)a5;
- (BOOL)_acquireBackgroundProcessingPermissionsForStoreType:(unint64_t)a3 isRetry:(BOOL)a4;
- (BOOL)_didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:(BOOL)a3;
- (BOOL)_evaluatePersistentHistoryForDeletedDeviceDuringResetSync:(BOOL *)a3 resetSyncContext:(id)a4 managedObjectContext:(id)a5 error:(id *)a6;
- (BOOL)_isBackgroundProcessingAssertionActive;
- (BOOL)_purgeLocalEntityRowsUsingModel:(id)a3 managedObjectContext:(id)a4 persistenceManager:(id)a5 error:(id *)a6;
- (BOOL)_releaseBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4;
- (BOOL)_releaseBackgroundProcessingPermissionsForStoreType:(unint64_t)a3;
- (BOOL)_releasePersistenceStoreBackgroundProcessingAssertions;
- (BOOL)_shouldAttemptSetupAccordingToDeviceConfiguration:(int64_t)a3;
- (BOOL)backupPersistenceStore:(id)a3 error:(id *)a4;
- (BOOL)copyPersistenceStore:(id)a3 outputURL:(id)a4 error:(id *)a5;
- (BOOL)importSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 managedObjectModel:(id)a7 configuration:(id)a8 error:(id *)a9;
- (BOOL)persistCurrentDeviceRecordInStore:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)persistenceMirroringManagerDidFinishZonePurge:(id)a3 store:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)prepareStore:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)requiresDirtyTransaction;
- (BOOL)requiresSetupTransaction;
- (BOOL)shouldResetCloudStore;
- (BOOL)store:(id)a3 validateAppleIDs:(id)a4;
- (NSMutableDictionary)fileDescriptorsForPersistenceStoreDict;
- (OS_os_transaction)setupTransaction;
- (RTAccount)currentAccount;
- (RTAccountManager)accountManager;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTKeychainManager)keychainManager;
- (RTLifeCycleManager)lifecycleManager;
- (RTPersistenceDriver)init;
- (RTPersistenceDriver)initWithAccountManager:(id)a3 dataProtectionManager:(id)a4 defaultsManager:(id)a5 keychainManager:(id)a6 lifecycleManager:(id)a7 persistenceManager:(id)a8 platform:(id)a9 timerManager:(id)a10;
- (RTPersistenceDriver)initWithPersistenceManager:(id)a3 dataProtectionManager:(id)a4 accountManager:(id)a5 platform:(id)a6 keychainManager:(id)a7 defaultsManager:(id)a8 lifecycleManager:(id)a9;
- (RTPersistenceManager)persistenceManager;
- (RTPersistenceMetricsDelegate)metricsDelegate;
- (RTPersistenceResetSyncContext)resetSyncContext;
- (RTPlatform)currentPlatform;
- (RTTimer)backgroundProcessingAssertionAcquireRetryTimer;
- (RTTimer)backgroundProcessingAssertionDeferralTimer;
- (RTTimerManager)timerManager;
- (id)_repersistPreviousDeviceWithResetSyncContext:(id)a3 persistenceManager:(id)a4 managedObjectContext:(id)a5;
- (id)appleIDsForStore:(id)a3;
- (id)cloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 context:(id)a6 error:(id *)a7;
- (id)earliestCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6;
- (id)latestCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6;
- (id)mirroringOptionsForStoreWithType:(unint64_t)a3;
- (id)optionsForStoreWithType:(unint64_t)a3 error:(id *)a4;
- (id)prepareForDatabaseRekey:(id *)a3;
- (id)remoteServerOptionsForStoreWithType:(unint64_t)a3;
- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3;
- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3;
- (int)_releaseBackgroundAssertionForFileDescriptor:(int)a3;
- (int64_t)cloudSyncAuthorization;
- (int64_t)encryptedDataAvailability;
- (unint64_t)backgroundAssertionRetryCount;
- (unint64_t)countOfCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6;
- (unint64_t)persistenceDeviceClassForPlatform;
- (void)_cleanUpFileDescriptoersForPersistenceStore;
- (void)_evaluateBackgroundProcessingAfterAssertionConfigurationChange:(int64_t)a3;
- (void)_evaluteDirtyTransactionAfterConfigurationChange:(int64_t)a3;
- (void)_onAccountChange:(id)a3;
- (void)_onBackgroundProcessingAssertionAcquireRetryExpiry;
- (void)_onBackgroundProcessingAssertionTimerExpiry;
- (void)_onCloudSyncAuthorizationChange:(id)a3;
- (void)_onDataProtectionChange:(id)a3;
- (void)_prepareFileDescriptorsForPersistenceStore;
- (void)_setupPersistenceAfterConfigurationChange:(int64_t)a3 cloudSyncAuthorization:(int64_t)a4 account:(id)a5;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startBackgroundProcessingAssertionAcquireRetryWithLatency:(double)a3;
- (void)_startBackgroundProcessingAssertionBufferTimerWithLatency:(double)a3;
- (void)_updatePersistenceContexts:(id)a3 deviceObjectID:(id)a4;
- (void)_updatePersistenceStoresWithDeviceObjectID:(id)a3;
- (void)cleanupOlderPersistentStores;
- (void)dealloc;
- (void)evaluateTransactions;
- (void)onAccountChange:(id)a3;
- (void)onCloudSyncAuthorizationChange:(id)a3;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onDataProtectionChange:(id)a3;
- (void)onDataProtectionNotification:(id)a3;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)persistenceDriver:(id)a3 persistenceMigrator:(id)a4 didFinishMigratingStore:(id)a5 withModelProvider:(id)a6;
- (void)persistenceDriver:(id)a3 persistenceMigrator:(id)a4 didStartMigratingStore:(id)a5 withModelProvider:(id)a6;
- (void)persistenceManagerDidFinishResetSync:(id)a3 userInfo:(id)a4;
- (void)persistenceManagerWillStartResetSync:(id)a3 userInfo:(id)a4 context:(id)a5;
- (void)persistenceMigrator:(id)a3 didFinishMigratingStore:(id)a4 withModelProvider:(id)a5;
- (void)persistenceMigrator:(id)a3 didStartMigratingStore:(id)a4 withModelProvider:(id)a5;
- (void)persistenceStore:(id)a3 didPrepareWithContext:(id)a4;
- (void)persistenceStore:(id)a3 encounteredCriticalError:(id)a4;
- (void)persistenceStore:(id)a3 failedWithError:(id)a4;
- (void)persistenceStoreFailedWithError:(id)a3;
- (void)persistenceStoreResetSyncWithUserInfo:(id)a3;
- (void)setBackgroundAssertionRetryCount:(unint64_t)a3;
- (void)setBackgroundProcessingAssertionAcquireRetryTimer:(id)a3;
- (void)setBackgroundProcessingAssertionDeferralTimer:(id)a3;
- (void)setCloudSyncAuthorization:(int64_t)a3;
- (void)setCurrentAccount:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setEncryptedDataAvailability:(int64_t)a3;
- (void)setFileDescriptorsForPersistenceStoreDict:(id)a3;
- (void)setLifecycleManager:(id)a3;
- (void)setMetricsDelegate:(id)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setRequiresDirtyTransaction:(BOOL)a3;
- (void)setRequiresSetupTransaction:(BOOL)a3;
- (void)setResetSyncContext:(id)a3;
- (void)setSetupTransaction:(id)a3;
- (void)setShouldResetCloudStore:(BOOL)a3;
- (void)setTimerManager:(id)a3;
- (void)start;
@end

@implementation RTPersistenceDriver

- (RTPersistenceDriver)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_dataProtectionManager_defaultsManager_keychainManager_lifecycleManager_persistenceManager_platform_timerManager_);
}

- (RTPersistenceDriver)initWithAccountManager:(id)a3 dataProtectionManager:(id)a4 defaultsManager:(id)a5 keychainManager:(id)a6 lifecycleManager:(id)a7 persistenceManager:(id)a8 platform:(id)a9 timerManager:(id)a10
{
  id v41 = a3;
  id v16 = a4;
  id v38 = a5;
  id v39 = a6;
  id v37 = a7;
  id v17 = a8;
  id v40 = a9;
  id v18 = a10;
  if (!v17)
  {
    v28 = v16;
    v27 = v18;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v26 = 0;
    goto LABEL_15;
  }
  id v35 = v16;
  if (!v16)
  {
    v27 = v18;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: dataProtectionManager";
LABEL_28:
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_29;
  }
  if (!v41)
  {
    v27 = v18;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: accountManager";
    goto LABEL_28;
  }
  if (!v40)
  {
    v27 = v18;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: platform";
    goto LABEL_28;
  }
  if (!v39)
  {
    v27 = v18;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: keychainManager";
    goto LABEL_28;
  }
  if (!v38)
  {
    v27 = v18;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_28;
  }
  if (!v18)
  {
    v27 = 0;
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v31 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_28;
    }
LABEL_29:

    v26 = 0;
    v25 = self;
LABEL_30:
    v28 = v35;
    goto LABEL_31;
  }
  id v34 = v18;
  if (v37)
  {
    v42.receiver = self;
    v42.super_class = (Class)RTPersistenceDriver;
    v19 = [(RTNotifier *)&v42 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_persistenceManager, a8);
      objc_storeStrong((id *)&v20->_dataProtectionManager, a4);
      objc_storeStrong((id *)&v20->_accountManager, a3);
      objc_storeStrong((id *)&v20->_currentPlatform, a9);
      objc_storeStrong((id *)&v20->_keychainManager, a6);
      objc_storeStrong((id *)&v20->_defaultsManager, a5);
      objc_storeStrong((id *)&v20->_lifecycleManager, a7);
      objc_storeStrong((id *)&v20->_timerManager, a10);
      objc_storeWeak((id *)&v20->_metricsDelegate, v20);
      uint64_t v21 = objc_opt_new();
      notificationHelper = v20->_notificationHelper;
      v20->_notificationHelper = (RTDarwinNotificationHelper *)v21;

      v20->_cloudSyncAuthorization = 0;
      v20->_encryptedDataAvailability = 0;
      v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      fileDescriptorsForPersistenceStoreDict = v20->_fileDescriptorsForPersistenceStoreDict;
      v20->_fileDescriptorsForPersistenceStoreDict = v23;
    }
    v25 = v20;
    v26 = v25;
    v27 = v34;
    goto LABEL_30;
  }
  v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v28 = v16;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lifecycleManager", buf, 2u);
  }

  v26 = 0;
  v27 = v34;
LABEL_15:
  v25 = self;
LABEL_31:

  return v26;
}

- (RTPersistenceDriver)initWithPersistenceManager:(id)a3 dataProtectionManager:(id)a4 accountManager:(id)a5 platform:(id)a6 keychainManager:(id)a7 defaultsManager:(id)a8 lifecycleManager:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = objc_alloc_init(RTTimerManager);
  v24 = [(RTPersistenceDriver *)self initWithAccountManager:v20 dataProtectionManager:v21 defaultsManager:v17 keychainManager:v18 lifecycleManager:v16 persistenceManager:v22 platform:v19 timerManager:v23];

  return v24;
}

- (void)start
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__RTPersistenceDriver_start__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __28__RTPersistenceDriver_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataProtectionManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = +[RTNotification notificationName];
  [v2 addObserver:v3 selector:sel_onDataProtectionChange_ name:v4];

  v5 = [*(id *)(a1 + 32) dataProtectionManager];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = +[RTNotification notificationName];
  [v5 addObserver:v6 selector:sel_onDataProtectionNotification_ name:v7];

  v8 = [*(id *)(a1 + 32) accountManager];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = +[RTNotification notificationName];
  [v8 addObserver:v9 selector:sel_onCloudSyncAuthorizationChange_ name:v10];

  v11 = [*(id *)(a1 + 32) accountManager];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = +[RTNotification notificationName];
  [v11 addObserver:v12 selector:sel_onAccountChange_ name:v13];

  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:*(void *)(a1 + 32) selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];
}

- (void)dealloc
{
  [(RTNotifier *)self->_dataProtectionManager removeObserver:self];
  [(RTNotifier *)self->_accountManager removeObserver:self];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RTPersistenceDriver;
  [(RTPersistenceDriver *)&v4 dealloc];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v8 = a3;
  [(RTPersistenceDriver *)self setSetupTransaction:0];
  objc_super v4 = [(RTPersistenceDriver *)self dataProtectionManager];
  [v4 removeObserver:self];

  v5 = [(RTPersistenceDriver *)self accountManager];
  [v5 removeObserver:self];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    v7 = v8;
  }
}

- (void)onDataProtectionChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(RTNotifier *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__RTPersistenceDriver_onDataProtectionChange___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v4 name];
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 name];
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      __int16 v14 = 2080;
      v15 = "-[RTPersistenceDriver onDataProtectionChange:]";
      __int16 v16 = 1024;
      int v17 = 240;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __46__RTPersistenceDriver_onDataProtectionChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDataProtectionChange:*(void *)(a1 + 40)];
}

- (void)onDataProtectionNotification:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__RTPersistenceDriver_onDataProtectionNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __52__RTPersistenceDriver_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v9 = [*(id *)(a1 + 32) unlockedSinceBoot];
      v10 = @"NO";
      int v13 = 138412802;
      __int16 v14 = v7;
      __int16 v15 = 2112;
      if (v9) {
        v10 = @"YES";
      }
      __int16 v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, RTDataProtectionManagerNotificationUnlockedSinceBoot, %@", (uint8_t *)&v13, 0x20u);
    }
    if (([*(id *)(a1 + 32) unlockedSinceBoot] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 40) + 80) setObject:0 forKey:@"RTDefaultsPersistenceBackgroundAssertionDate"];
      SEL v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
        int v13 = 138412546;
        __int16 v14 = v12;
        __int16 v15 = 1024;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, isDeviceUnlockedSinceBoot, %d, clearing RTDefaultsPersistenceBackgroundAssertionDate since routined has lost previous background assertion after reboot ", (uint8_t *)&v13, 0x12u);
      }
    }
  }
}

- (void)_onDataProtectionChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      __int16 v14 = "-[RTPersistenceDriver _onDataProtectionChange:]";
      __int16 v15 = 1024;
      int v16 = 271;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);
    }
  }
  -[RTPersistenceDriver setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", [v4 availability]);
  [(RTPersistenceDriver *)self _evaluateBackgroundProcessingAfterAssertionConfigurationChange:[(RTPersistenceDriver *)self encryptedDataAvailability]];
  [(RTPersistenceDriver *)self _evaluteDirtyTransactionAfterConfigurationChange:[(RTPersistenceDriver *)self encryptedDataAvailability]];
  int64_t v6 = [(RTPersistenceDriver *)self encryptedDataAvailability];
  int64_t v7 = [(RTPersistenceDriver *)self cloudSyncAuthorization];
  id v8 = [(RTPersistenceDriver *)self currentAccount];
  [(RTPersistenceDriver *)self _setupPersistenceAfterConfigurationChange:v6 cloudSyncAuthorization:v7 account:v8];
}

- (void)onCloudSyncAuthorizationChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(RTNotifier *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__RTPersistenceDriver_onCloudSyncAuthorizationChange___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    int64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v4 name];
      *(_DWORD *)buf = 138412290;
      __int16 v13 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
    int64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = [v4 name];
      *(_DWORD *)buf = 138412802;
      __int16 v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = "-[RTPersistenceDriver onCloudSyncAuthorizationChange:]";
      __int16 v16 = 1024;
      int v17 = 290;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __54__RTPersistenceDriver_onCloudSyncAuthorizationChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onCloudSyncAuthorizationChange:*(void *)(a1 + 40)];
}

- (void)_onCloudSyncAuthorizationChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      __int16 v14 = "-[RTPersistenceDriver _onCloudSyncAuthorizationChange:]";
      __int16 v15 = 1024;
      int v16 = 297;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);
    }
  }
  -[RTPersistenceDriver setCloudSyncAuthorization:](self, "setCloudSyncAuthorization:", [v4 cloudSyncAuthorizationState]);
  int64_t v6 = [(RTPersistenceDriver *)self encryptedDataAvailability];
  int64_t v7 = [(RTPersistenceDriver *)self cloudSyncAuthorization];
  id v8 = [(RTPersistenceDriver *)self currentAccount];
  [(RTPersistenceDriver *)self _setupPersistenceAfterConfigurationChange:v6 cloudSyncAuthorization:v7 account:v8];
}

- (void)onAccountChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(RTNotifier *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__RTPersistenceDriver_onAccountChange___block_invoke;
    v10[3] = &unk_1E6B90BF0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    int64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v4 name];
      *(_DWORD *)buf = 138412290;
      __int16 v13 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
    int64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = [v4 name];
      *(_DWORD *)buf = 138412802;
      __int16 v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = "-[RTPersistenceDriver onAccountChange:]";
      __int16 v16 = 1024;
      int v17 = 313;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

uint64_t __39__RTPersistenceDriver_onAccountChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onAccountChange:*(void *)(a1 + 40)];
}

- (void)_onAccountChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = (objc_class *)objc_opt_class();
      __int16 v16 = NSStringFromClass(v15);
      int v17 = 138412802;
      uint64_t v18 = v16;
      __int16 v19 = 2080;
      id v20 = "-[RTPersistenceDriver _onAccountChange:]";
      __int16 v21 = 1024;
      int v22 = 320;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v17, 0x1Cu);
    }
  }
  int64_t v6 = [(RTPersistenceDriver *)self accountManager];
  uint64_t v7 = [v6 accountStatus];

  id v8 = [v4 latestAccount];

  if (!v8)
  {
    int v9 = [v4 oldAccount];

    if (v9 || v7 == 1)
    {
      v10 = [(RTPersistenceDriver *)self defaultsManager];
      [v10 setObject:0 forKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"];
    }
  }
  [(RTDefaultsManager *)self->_defaultsManager setObject:0 forKey:@"RTDefaultsPersistenceMirroringManagerMirroringAttemptsByBuildMap"];
  id v11 = [v4 latestAccount];
  [(RTPersistenceDriver *)self setCurrentAccount:v11];

  int64_t v12 = [(RTPersistenceDriver *)self encryptedDataAvailability];
  int64_t v13 = [(RTPersistenceDriver *)self cloudSyncAuthorization];
  __int16 v14 = [(RTPersistenceDriver *)self currentAccount];
  [(RTPersistenceDriver *)self _setupPersistenceAfterConfigurationChange:v12 cloudSyncAuthorization:v13 account:v14];
}

- (void)_startBackgroundProcessingAssertionBufferTimerWithLatency:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  timerManager = self->_timerManager;
  uint64_t v7 = [(RTNotifier *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__RTPersistenceDriver__startBackgroundProcessingAssertionBufferTimerWithLatency___block_invoke;
  v14[3] = &unk_1E6B90E70;
  v14[4] = self;
  id v8 = [(RTTimerManager *)timerManager timerWithIdentifier:@"RTPersistenceDriverBackgroundAssertionTimer" queue:v7 handler:v14];
  backgroundProcessingAssertionDeferralTimer = self->_backgroundProcessingAssertionDeferralTimer;
  self->_backgroundProcessingAssertionDeferralTimer = v8;

  [(RTTimer *)self->_backgroundProcessingAssertionDeferralTimer fireWithInterval:a3];
  [(RTTimer *)self->_backgroundProcessingAssertionDeferralTimer resume];
  v10 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (objc_class *)objc_opt_class();
    int64_t v12 = NSStringFromClass(v11);
    int64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = a3;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, interval, %.2f", buf, 0x20u);
  }
}

uint64_t __81__RTPersistenceDriver__startBackgroundProcessingAssertionBufferTimerWithLatency___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBackgroundProcessingAssertionTimerExpiry];
}

- (void)_onBackgroundProcessingAssertionTimerExpiry
{
  if ([(RTPersistenceDriver *)self _releasePersistenceStoreBackgroundProcessingAssertions])
  {
    [(RTDefaultsManager *)self->_defaultsManager setObject:0 forKey:@"RTDefaultsPersistenceBackgroundAssertionDate"];
  }
  [(RTTimer *)self->_backgroundProcessingAssertionDeferralTimer invalidate];
  backgroundProcessingAssertionDeferralTimer = self->_backgroundProcessingAssertionDeferralTimer;
  self->_backgroundProcessingAssertionDeferralTimer = 0;
}

- (void)_startBackgroundProcessingAssertionAcquireRetryWithLatency:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  backgroundProcessingAssertionAcquireRetryTimer = self->_backgroundProcessingAssertionAcquireRetryTimer;
  if (backgroundProcessingAssertionAcquireRetryTimer)
  {
    [(RTTimer *)backgroundProcessingAssertionAcquireRetryTimer invalidate];
    uint64_t v7 = self->_backgroundProcessingAssertionAcquireRetryTimer;
    self->_backgroundProcessingAssertionAcquireRetryTimer = 0;
  }
  timerManager = self->_timerManager;
  int v9 = [(RTNotifier *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__RTPersistenceDriver__startBackgroundProcessingAssertionAcquireRetryWithLatency___block_invoke;
  v17[3] = &unk_1E6B90E70;
  v17[4] = self;
  v10 = [(RTTimerManager *)timerManager timerWithIdentifier:@"RTPersistenceDriverBackgroundAssertionAcquireRetryTimer" queue:v9 handler:v17];
  id v11 = self->_backgroundProcessingAssertionAcquireRetryTimer;
  self->_backgroundProcessingAssertionAcquireRetryTimer = v10;

  [(RTTimer *)self->_backgroundProcessingAssertionAcquireRetryTimer fireWithInterval:a3];
  [(RTTimer *)self->_backgroundProcessingAssertionAcquireRetryTimer resume];
  [(RTPersistenceDriver *)self setBackgroundAssertionRetryCount:[(RTPersistenceDriver *)self backgroundAssertionRetryCount] + 1];
  int64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int64_t v13 = (objc_class *)objc_opt_class();
    __int16 v14 = NSStringFromClass(v13);
    __int16 v15 = NSStringFromSelector(a2);
    unint64_t v16 = [(RTPersistenceDriver *)self backgroundAssertionRetryCount];
    *(_DWORD *)buf = 138413058;
    __int16 v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    __int16 v22 = 2048;
    double v23 = a3;
    __int16 v24 = 2048;
    unint64_t v25 = v16;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, interval, %.2f, backgroundAssertionRetryCount, %lu", buf, 0x2Au);
  }
}

uint64_t __82__RTPersistenceDriver__startBackgroundProcessingAssertionAcquireRetryWithLatency___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onBackgroundProcessingAssertionAcquireRetryExpiry];
}

- (void)_cleanUpFileDescriptoersForPersistenceStore
{
  uint64_t v3 = [(RTPersistenceDriver *)self fileDescriptorsForPersistenceStoreDict];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_35];

  id v4 = [(RTPersistenceDriver *)self fileDescriptorsForPersistenceStoreDict];
  [v4 removeAllObjects];
}

uint64_t __66__RTPersistenceDriver__cleanUpFileDescriptoersForPersistenceStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 intValue];
  if ((result & 0x80000000) == 0)
  {
    return close(result);
  }
  return result;
}

- (void)_onBackgroundProcessingAssertionAcquireRetryExpiry
{
  backgroundProcessingAssertionAcquireRetryTimer = self->_backgroundProcessingAssertionAcquireRetryTimer;
  if (backgroundProcessingAssertionAcquireRetryTimer)
  {
    [(RTTimer *)backgroundProcessingAssertionAcquireRetryTimer invalidate];
    id v4 = self->_backgroundProcessingAssertionAcquireRetryTimer;
    self->_backgroundProcessingAssertionAcquireRetryTimer = 0;
  }
  if ([(RTPersistenceDriver *)self _didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:1])
  {
    defaultsManager = self->_defaultsManager;
    int64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    [(RTDefaultsManager *)defaultsManager setObject:v6 forKey:@"RTDefaultsPersistenceBackgroundAssertionDate"];

LABEL_9:
    [(RTPersistenceDriver *)self setBackgroundAssertionRetryCount:0];
    [(RTPersistenceDriver *)self _cleanUpFileDescriptoersForPersistenceStore];
    return;
  }
  if ([(RTPersistenceDriver *)self backgroundAssertionRetryCount] > 2) {
    goto LABEL_9;
  }

  [(RTPersistenceDriver *)self _startBackgroundProcessingAssertionAcquireRetryWithLatency:3.0];
}

- (BOOL)_isBackgroundProcessingAssertionActive
{
  uint64_t v2 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceBackgroundAssertionDate"];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:v2];
    BOOL v5 = v4 < 43200.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    int v12 = 138412290;
    int64_t v13 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, starting the attempt to acquire background processing assertion for every storeType", (uint8_t *)&v12, 0xCu);
  }
  BOOL v8 = [(RTPersistenceDriver *)self _acquireBackgroundProcessingPermissionsForStoreType:0 isRetry:v3];
  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = v9;
      if (v9 == 3) {
        break;
      }
      ++v9;
    }
    while ([(RTPersistenceDriver *)self _acquireBackgroundProcessingPermissionsForStoreType:v10 + 1 isRetry:v3]);
    LOBYTE(v8) = v10 > 2;
  }
  return v8;
}

- (BOOL)_acquireBackgroundProcessingPermissionsForStoreType:(unint64_t)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(RTPersistenceDriver *)self persistenceManager];
  BOOL v8 = [v7 URLForStoreType:a3];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v9 = [(RTPersistenceDriver *)self persistenceManager];
  unint64_t v10 = [(id)objc_opt_class() protectedStoreFilesExtensions];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (![(RTPersistenceDriver *)self _acquireBackgroundProcessingPermissionForStoreURL:v8 cacheFileExtension:*(void *)(*((void *)&v17 + 1) + 8 * i) isRetry:v4])
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_acquireBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4 isRetry:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 path];
  uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:@"sqlite" withString:v10];

  if (v5)
  {
    uint64_t v13 = [(RTPersistenceDriver *)self fileDescriptorsForPersistenceStoreDict];
    uint64_t v14 = [v13 objectForKeyedSubscript:v12];
    uint64_t v15 = [v14 intValue];

    if ((v15 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [(RTPersistenceDriver *)self _getFileDescriptorForPersistenceStoreFile:v12];
    if ((v15 & 0x80000000) == 0)
    {
LABEL_3:
      int v16 = [(RTPersistenceDriver *)self _acquireBackgroundAssertionForFileDescriptor:v15];
      BOOL v17 = v16 == 0;
      long long v18 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      long long v19 = v18;
      if (v16)
      {
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        long long v20 = NSStringFromSelector(a2);
        int v21 = *__error();
        uint64_t v22 = __error();
        double v23 = strerror(*v22);
        int v27 = 138413314;
        v28 = v20;
        __int16 v29 = 2112;
        *(void *)v30 = v9;
        *(_WORD *)&v30[8] = 1024;
        *(_DWORD *)v31 = v16;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = v21;
        __int16 v32 = 2080;
        v33 = v23;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@ Failure to acquire background processing assertion for the persistence store file %@ with code error %d and errno %d %s", (uint8_t *)&v27, 0x2Cu);
      }
      else
      {
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_13;
        }
        long long v20 = NSStringFromSelector(a2);
        int v27 = 138412802;
        v28 = v20;
        __int16 v29 = 2112;
        *(void *)v30 = v9;
        *(_WORD *)&v30[8] = 2112;
        *(void *)v31 = v10;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@ Success to acquire background processing assertion for the persistence store type %@ and the extension %@", (uint8_t *)&v27, 0x20u);
      }

LABEL_13:
      if (!v5) {
        close(v15);
      }
      goto LABEL_15;
    }
  }
  __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    int v26 = *__error();
    int v27 = 138412802;
    v28 = v12;
    __int16 v29 = 1024;
    *(_DWORD *)v30 = v5;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = v26;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Unable to to get the file descriptor for the file %@ with data protection, isRetry, %d, errno, %{errno}d", (uint8_t *)&v27, 0x18u);
  }

  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (int)_acquireBackgroundAssertionForFileDescriptor:(int)a3
{
  long long v4 = xmmword_1DA0FF6D0;
  return fcntl(a3, 108, &v4);
}

- (BOOL)_releasePersistenceStoreBackgroundProcessingAssertions
{
  BOOL v3 = [(RTPersistenceDriver *)self _releaseBackgroundProcessingPermissionsForStoreType:0];
  if (v3)
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = v4;
      if (v4 == 3) {
        break;
      }
      ++v4;
    }
    while ([(RTPersistenceDriver *)self _releaseBackgroundProcessingPermissionsForStoreType:v5 + 1]);
    LOBYTE(v3) = v5 > 2;
  }
  return v3;
}

- (BOOL)_releaseBackgroundProcessingPermissionsForStoreType:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(RTPersistenceDriver *)self persistenceManager];
  int64_t v6 = [v5 URLForStoreType:a3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(RTPersistenceDriver *)self persistenceManager];
  BOOL v8 = [(id)objc_opt_class() protectedStoreFilesExtensions];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![(RTPersistenceDriver *)self _releaseBackgroundProcessingPermissionForStoreURL:v6 cacheFileExtension:*(void *)(*((void *)&v15 + 1) + 8 * i)])
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_releaseBackgroundProcessingPermissionForStoreURL:(id)a3 cacheFileExtension:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 path];
  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"sqlite" withString:v8];

  uint64_t v11 = [(RTPersistenceDriver *)self _getFileDescriptorForPersistenceStoreFile:v10];
  if ((v11 & 0x80000000) == 0)
  {
    int v12 = v11;
    int v13 = [(RTPersistenceDriver *)self _releaseBackgroundAssertionForFileDescriptor:v11];
    BOOL v14 = v13 == 0;
    long long v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    long long v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        long long v17 = NSStringFromSelector(a2);
        int v18 = *__error();
        long long v19 = __error();
        uint64_t v20 = strerror(*v19);
        int v24 = 138413314;
        unint64_t v25 = v17;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 1024;
        *(_DWORD *)__int16 v29 = v13;
        *(_WORD *)&v29[4] = 1024;
        *(_DWORD *)&v29[6] = v18;
        __int16 v30 = 2080;
        v31 = v20;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@ Failure to release background processing assertion for the persistence store file %@ with code error %d and errno %d %s", (uint8_t *)&v24, 0x2Cu);
LABEL_10:
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v17 = NSStringFromSelector(a2);
      int v24 = 138412802;
      unint64_t v25 = v17;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      *(void *)__int16 v29 = v8;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@ Success to release background processing assertion for the persistence store type %@ and the extension %@", (uint8_t *)&v24, 0x20u);
      goto LABEL_10;
    }

    close(v12);
    goto LABEL_12;
  }
  int v21 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v23 = *__error();
    int v24 = 138412546;
    unint64_t v25 = v10;
    __int16 v26 = 1024;
    LODWORD(v27) = v23;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Unable to to get the file descriptor for the file %@ with data protection, errno, %{errno}d", (uint8_t *)&v24, 0x12u);
  }

  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (int)_releaseBackgroundAssertionForFileDescriptor:(int)a3
{
  return fcntl(a3, 109, 0);
}

- (void)_prepareFileDescriptorsForPersistenceStore
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v40 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, starting the attempt to open every file descriptor for every storeType to be handy for a retry", buf, 0xCu);
  }
  uint64_t v6 = 0;
  id v7 = @"sqlite";
  do
  {
    id v8 = [(RTPersistenceDriver *)self persistenceManager];
    uint64_t v30 = v6;
    uint64_t v9 = [v8 URLForStoreType:v6];

    uint64_t v10 = (void *)v9;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v11 = [(RTPersistenceDriver *)self persistenceManager];
    int v12 = [(id)objc_opt_class() protectedStoreFilesExtensions];

    id obj = v12;
    uint64_t v33 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (!v33) {
      goto LABEL_17;
    }
    uint64_t v13 = *(void *)v35;
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * v14);
        long long v16 = [v10 path];
        long long v17 = [v16 stringByReplacingOccurrencesOfString:v7 withString:v15];

        if (v17)
        {
          int v18 = [(RTPersistenceDriver *)self fileDescriptorsForPersistenceStoreDict];
          uint64_t v19 = [v18 objectForKeyedSubscript:v17];
          if (v19)
          {
            uint64_t v20 = (void *)v19;
            [(RTPersistenceDriver *)self fileDescriptorsForPersistenceStoreDict];
            int v21 = self;
            uint64_t v22 = v10;
            v24 = int v23 = v7;
            unint64_t v25 = [v24 objectForKeyedSubscript:v17];
            uint64_t v26 = [v25 integerValue];

            id v7 = v23;
            uint64_t v10 = v22;
            self = v21;
            uint64_t v13 = v31;

            if ((v26 & 0x8000000000000000) == 0) {
              goto LABEL_15;
            }
          }
          else
          {
          }
          int v27 = [(RTPersistenceDriver *)self _getFileDescriptorForPersistenceStoreFile:v17];
          __int16 v28 = [NSNumber numberWithInteger:v27];
          __int16 v29 = [(RTPersistenceDriver *)self fileDescriptorsForPersistenceStoreDict];
          [v29 setObject:v28 forKeyedSubscript:v17];
        }
LABEL_15:

        ++v14;
      }
      while (v33 != v14);
      uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v33);
LABEL_17:

    uint64_t v6 = v30 + 1;
  }
  while (v30 != 3);
}

- (int)_getFileDescriptorForPersistenceStoreFile:(id)a3
{
  return open_dprotected_np((const char *)[a3 UTF8String], 2, 2, 0, 416);
}

- (void)_evaluateBackgroundProcessingAfterAssertionConfigurationChange:(int64_t)a3
{
  if ([(RTPersistenceDriver *)self encryptedDataAvailability] == 3)
  {
    if ([(RTPersistenceDriver *)self _isBackgroundProcessingAssertionActive])
    {
      backgroundProcessingAssertionDeferralTimer = self->_backgroundProcessingAssertionDeferralTimer;
      if (backgroundProcessingAssertionDeferralTimer)
      {
        [(RTTimer *)backgroundProcessingAssertionDeferralTimer invalidate];
        unint64_t v5 = self->_backgroundProcessingAssertionDeferralTimer;
        self->_backgroundProcessingAssertionDeferralTimer = 0;
LABEL_14:

        return;
      }
    }
    [(RTPersistenceDriver *)self _cleanUpFileDescriptoersForPersistenceStore];
    if ([(RTPersistenceDriver *)self _didPersistenceStoreBackgroundProcessingAssertionsSucceedWithRetry:0])
    {
      defaultsManager = self->_defaultsManager;
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [(RTDefaultsManager *)defaultsManager setObject:v11 forKey:@"RTDefaultsPersistenceBackgroundAssertionDate"];
      unint64_t v5 = v11;
      goto LABEL_14;
    }
    [(RTPersistenceDriver *)self _prepareFileDescriptorsForPersistenceStore];
    [(RTPersistenceDriver *)self _startBackgroundProcessingAssertionAcquireRetryWithLatency:3.0];
  }
  else if ([(RTPersistenceDriver *)self encryptedDataAvailability] == 2)
  {
    backgroundProcessingAssertionAcquireRetryTimer = self->_backgroundProcessingAssertionAcquireRetryTimer;
    if (backgroundProcessingAssertionAcquireRetryTimer)
    {
      [(RTTimer *)backgroundProcessingAssertionAcquireRetryTimer invalidate];
      id v7 = self->_backgroundProcessingAssertionAcquireRetryTimer;
      self->_backgroundProcessingAssertionAcquireRetryTimer = 0;

      [(RTPersistenceDriver *)self _cleanUpFileDescriptoersForPersistenceStore];
    }
    if ([(RTPersistenceDriver *)self _isBackgroundProcessingAssertionActive])
    {
      [(RTPersistenceDriver *)self _startBackgroundProcessingAssertionBufferTimerWithLatency:30.0];
    }
  }
  else if ([(RTPersistenceDriver *)self encryptedDataAvailability] == 1)
  {
    uint64_t v9 = self->_backgroundProcessingAssertionAcquireRetryTimer;
    if (v9)
    {
      [(RTTimer *)v9 invalidate];
      uint64_t v10 = self->_backgroundProcessingAssertionAcquireRetryTimer;
      self->_backgroundProcessingAssertionAcquireRetryTimer = 0;

      [(RTPersistenceDriver *)self _cleanUpFileDescriptoersForPersistenceStore];
    }
  }
}

- (void)_evaluteDirtyTransactionAfterConfigurationChange:(int64_t)a3
{
  [(RTPersistenceDriver *)self setRequiresDirtyTransaction:0];
  unint64_t v5 = [(RTPersistenceDriver *)self persistenceManager];
  uint64_t v6 = [v5 availability];

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 && v6 == 2) {
    [(RTPersistenceDriver *)self setRequiresDirtyTransaction:1];
  }

  [(RTPersistenceDriver *)self evaluateTransactions];
}

- (BOOL)_shouldAttemptSetupAccordingToDeviceConfiguration:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v11) = 0;
      unint64_t v4 = "encrypted data availability unknown";
      break;
    case 1:
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "encrypted data unavailable", (uint8_t *)&v11, 2u);
      }

      BOOL v8 = [(RTPersistenceDriver *)self _isBackgroundProcessingAssertionActive];
      BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      BOOL v9 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        BOOL v5 = 1;
        if (v9)
        {
          int v11 = 67109120;
          int v12 = 1;
          _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "Background Processing Assertion is still active, set attemptSetup to %d", (uint8_t *)&v11, 8u);
        }
      }
      else
      {
        if (v9)
        {
          int v11 = 67109120;
          int v12 = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "Background Processing Assertion is not active, set attemptSetup to %d", (uint8_t *)&v11, 8u);
        }
        BOOL v5 = 0;
      }
      goto LABEL_14;
    case 2:
      BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v11) = 0;
      unint64_t v4 = "encrypted data became available";
      break;
    case 3:
      BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v11) = 0;
      unint64_t v4 = "encrypted data transitioning to unavailable";
      break;
    default:
      return 1;
  }
  _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v11, 2u);
LABEL_13:
  BOOL v5 = 1;
LABEL_14:

  return v5;
}

- (void)_setupPersistenceAfterConfigurationChange:(int64_t)a3 cloudSyncAuthorization:(int64_t)a4 account:(id)a5
{
  BOOL v7 = -[RTPersistenceDriver _shouldAttemptSetupAccordingToDeviceConfiguration:](self, "_shouldAttemptSetupAccordingToDeviceConfiguration:", a3, a4, a5);
  if (a4 == 2)
  {
    BOOL v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    BOOL v9 = "cloud sync state enabled";
LABEL_19:
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, v9, buf, 2u);
    goto LABEL_10;
  }
  if (a4 == 1)
  {
    BOOL v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    BOOL v9 = "cloud sync state disabled";
    goto LABEL_19;
  }
  if (a4) {
    goto LABEL_11;
  }
  BOOL v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "cloud sync state unknown", buf, 2u);
  }
  BOOL v7 = 0;
LABEL_10:

LABEL_11:
  uint64_t v10 = [(RTPersistenceDriver *)self persistenceManager];
  uint64_t v11 = [v10 availability];

  if (v11 != 2)
  {
    [(RTPersistenceDriver *)self setRequiresSetupTransaction:1];
    [(RTPersistenceDriver *)self evaluateTransactions];
    int v12 = [(RTPersistenceDriver *)self accountManager];
    uint64_t v13 = [v12 accountStatus];

    if (v13) {
      BOOL v14 = v7;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      uint64_t v15 = [(RTPersistenceDriver *)self persistenceManager];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__RTPersistenceDriver__setupPersistenceAfterConfigurationChange_cloudSyncAuthorization_account___block_invoke;
      v16[3] = &unk_1E6B94CE0;
      v16[4] = self;
      [v15 setupPersistenceContainers:v16];
    }
  }
}

uint64_t __96__RTPersistenceDriver__setupPersistenceAfterConfigurationChange_cloudSyncAuthorization_account___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) setRequiresSetupTransaction:0];
    BOOL v3 = *(void **)(v2 + 32);
    return [v3 evaluateTransactions];
  }
  return result;
}

- (void)evaluateTransactions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(RTPersistenceDriver *)self requiresDirtyTransaction]
    || [(RTPersistenceDriver *)self requiresSetupTransaction])
  {
    unint64_t v4 = [(RTPersistenceDriver *)self setupTransaction];

    if (!v4)
    {
      BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        BOOL v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138412290;
        int v23 = v7;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, acquiring transaction", buf, 0xCu);
      }
      BOOL v8 = NSString;
      BOOL v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(a2);
      id v12 = [v8 stringWithFormat:@"%@-%@", v10, v11];
      [v12 UTF8String];
      uint64_t v13 = (void *)os_transaction_create();
      [(RTPersistenceDriver *)self setSetupTransaction:v13];

      BOOL v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        int v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        int v23 = v20;
        __int16 v24 = 2112;
        unint64_t v25 = v21;
        _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v15 = [(RTPersistenceDriver *)self setupTransaction];

    if (v15)
    {
      long long v16 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = (objc_class *)objc_opt_class();
        int v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138412290;
        int v23 = v18;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, releasing transactions", buf, 0xCu);
      }
      [(RTPersistenceDriver *)self setSetupTransaction:0];
    }
  }
}

- (BOOL)store:(id)a3 validateAppleIDs:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(RTPersistenceDriver *)self currentAccount];
  BOOL v7 = [v6 appleIDs];

  if ([v7 count] || objc_msgSend(v5, "count")) {
    char v8 = [v7 intersectsSet:v5];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (id)appleIDsForStore:(id)a3
{
  BOOL v3 = [(RTPersistenceDriver *)self currentAccount];
  unint64_t v4 = [v3 appleIDs];

  return v4;
}

- (id)optionsForStoreWithType:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (id)mirroringOptionsForStoreWithType:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceManagerDisableMirroringDelegate2"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  unint64_t v7 = [(RTPersistenceDriver *)self persistenceDeviceClassForPlatform] & v6;
  unint64_t v8 = [(RTPersistenceDriver *)self persistenceDeviceClassForPlatform];
  BOOL v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7 == v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v23 = v6;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "sync is disabled for device, current mask, %lu", buf, 0xCu);
    }
    uint64_t v11 = 0;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v23 = a3;
      __int16 v24 = 2048;
      int64_t v25 = [(RTPersistenceDriver *)self cloudSyncAuthorization];
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "mirroring options for store with type, %lu, cloud sync auth, %ld", buf, 0x16u);
    }

    if (a3 != 1 || [(RTPersistenceDriver *)self cloudSyncAuthorization] != 2)
    {
      uint64_t v11 = 0;
      goto LABEL_23;
    }
    id v12 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceManagerMirroringOverrideDefaultContainer"];

    if ([(RTPlatform *)self->_currentPlatform internalInstall] && v12)
    {
      uint64_t v13 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceManagerMirroringOverrideDefaultContainer"];
      BOOL v9 = [objc_alloc(MEMORY[0x1E4F1C058]) initWithContainerIdentifier:v13];
      BOOL v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "override default container is set, setting mirroring delegate option", buf, 2u);
      }
    }
    else
    {
      BOOL v9 = [objc_alloc(MEMORY[0x1E4F1C058]) initWithContainerIdentifier:@"com.apple.CoreRoutine-3"];
    }
    [v9 setUseDeviceToDeviceEncryption:1];
    [v9 setOperationMemoryThresholdBytes:&unk_1F3450EA0];
    [v9 setPreserveLegacyRecordMetadataBehavior:1];
    uint64_t v15 = objc_opt_new();
    [v15 setUseZoneWidePCS:1];
    [v15 setBypassPCSEncryption:0];
    long long v16 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceManagerMirroringDisablePCSEncryption"];
    int v17 = [v16 BOOLValue];

    if ([(RTPlatform *)self->_currentPlatform internalInstall] && v17)
    {
      [v9 setUseDeviceToDeviceEncryption:0];
      [v15 setUseZoneWidePCS:0];
      [v15 setBypassPCSEncryption:1];
      int v18 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "disable PCS encryption is set, setting container option", buf, 2u);
      }
    }
    [v9 setContainerOptions:v15];
    uint64_t v20 = @"RTPersistenceDriverMirroringDelegateOptionsKey";
    int v21 = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  }
LABEL_23:

  return v11;
}

- (id)remoteServerOptionsForStoreWithType:(unint64_t)a3
{
  unint64_t v4 = [(RTPersistenceDriver *)self currentPlatform];
  int v5 = [v4 internalInstall];

  uint64_t v6 = 0;
  if (a3 <= 1 && v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = MEMORY[0x1E4F1CC38];
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BFD8]];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1BFC8]];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1BEF0]];
    [v6 setObject:*MEMORY[0x1E4F28348] forKeyedSubscript:*MEMORY[0x1E4F1BEC0]];
    if (a3 == 1)
    {
      [v6 setObject:@"com.apple.routined.store.cloud" forKeyedSubscript:*MEMORY[0x1E4F1BFE8]];
      uint64_t v9 = *MEMORY[0x1E4F1BE80];
      unint64_t v8 = (__CFString *)MEMORY[0x1E4F1CC08];
    }
    else
    {
      unint64_t v8 = @"com.apple.routined.store.cache";
      uint64_t v9 = *MEMORY[0x1E4F1BFE8];
    }
    [v6 setObject:v8 forKeyedSubscript:v9];
  }

  return v6;
}

- (void)cleanupOlderPersistentStores
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = [&unk_1F3452CE8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v16;
    *(void *)&long long v3 = 138412546;
    long long v13 = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(&unk_1F3452CE8);
        }
        uint64_t v7 = [MEMORY[0x1E4F28CB8] pathInCacheDirectory:*(void *)(*((void *)&v15 + 1) + 8 * v6) v13];
        unint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v9 = [v8 fileExistsAtPath:v7];

        if (v9)
        {
          BOOL v10 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v14 = 0;
          [v10 removeItemAtPath:v7 error:&v14];
          id v11 = v14;

          if (v11)
          {
            id v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v13;
              uint64_t v20 = v7;
              __int16 v21 = 2112;
              id v22 = v11;
              _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "older core routine persistent store file, %@, existed but couldn't be removed due to error, %@", buf, 0x16u);
            }
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1F3452CE8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }
}

+ (id)persistCurrentDeviceWithIdentifier:(id)a3 inStore:(id)a4 context:(id)a5 platform:(id)a6 notificationHelper:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v14)
  {
    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceStore", buf, 2u);
    }

    if (a8)
    {
      uint64_t v20 = @"persistenceStore";
LABEL_17:
      _RTErrorInvalidParameterCreate((uint64_t)v20);
      id v18 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    id v18 = 0;
    goto LABEL_19;
  }
  if (!v15)
  {
    __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a8)
    {
      uint64_t v20 = @"context";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  *(void *)buf = 0;
  id v40 = buf;
  uint64_t v41 = 0x3032000000;
  objc_super v42 = __Block_byref_object_copy__48;
  v43 = __Block_byref_object_dispose__48;
  id v44 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__48;
  long long v37 = __Block_byref_object_dispose__48;
  id v38 = 0;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  int64_t v25 = __108__RTPersistenceDriver_persistCurrentDeviceWithIdentifier_inStore_context_platform_notificationHelper_error___block_invoke;
  uint64_t v26 = &unk_1E6B94D08;
  id v27 = v16;
  id v28 = v13;
  id v29 = v15;
  uint64_t v31 = &v33;
  id v30 = v14;
  uint64_t v32 = buf;
  [v29 performBlockAndWait:&v23];
  if (*((void *)v40 + 5) && !v34[5]) {
    [v17 postNotification:@"kRTPersistenceDeviceIdentityChanged" v23, v24, v25, v26, v27, v28, v29];
  }
  if (a8) {
    *a8 = (id) v34[5];
  }
  id v18 = *((id *)v40 + 5);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:

  return v18;
}

void __108__RTPersistenceDriver_persistCurrentDeviceWithIdentifier_inStore_context_platform_notificationHelper_error___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) internalInstall])
  {
    uint64_t v2 = [*(id *)(a1 + 32) userAssignedDeviceName];
  }
  else
  {
    uint64_t v2 = 0;
  }
  long long v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
  }
  uint64_t v5 = v4;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v5 UUIDString];
    *(_DWORD *)buf = 138412290;
    v51 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "creating new device record with identifier, %@", buf, 0xCu);
  }
  unint64_t v8 = (void *)MEMORY[0x1E4F1C0A8];
  int v9 = +[NSManagedObject entityName];
  BOOL v10 = [v8 insertNewObjectForEntityForName:v9 inManagedObjectContext:*(void *)(a1 + 48)];

  [v10 setIdentifier:v5];
  [v10 setDeviceName:v2];
  id v11 = [*(id *)(a1 + 32) deviceClass];
  [v10 setDeviceClass:v11];

  id v12 = [*(id *)(a1 + 32) systemModel];
  [v10 setDeviceModel:v12];

  id v13 = [MEMORY[0x1E4F1C9C8] date];
  [v10 setCreationDate:v13];

  if (v10
    && ([v10 identifier], id v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v5 UUIDString];
      *(_DWORD *)buf = 138412290;
      v51 = v16;
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "created new device record with identifier, %@", buf, 0xCu);
    }
    id v17 = *(void **)(a1 + 48);
    id v47 = 0;
    int v18 = [v17 save:&v47];
    id v19 = v47;
    id v20 = v47;
    __int16 v21 = v20;
    if (!v18 || v20)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v19);
      uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v21;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "failed to save generated device record due to error, %@", buf, 0xCu);
      }
    }
    else
    {
      id v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v10 objectID];
        *(_DWORD *)buf = 138412290;
        v51 = v23;
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "will persist device MOID %@ to store metadata", buf, 0xCu);
      }
      uint64_t v24 = [*(id *)(a1 + 48) persistentStoreCoordinator];
      int64_t v25 = [*(id *)(a1 + 56) URL];
      uint64_t v26 = [v24 persistentStoreForURL:v25];

      id v27 = [*(id *)(a1 + 48) persistentStoreCoordinator];
      id v28 = [v27 metadataForPersistentStore:v26];
      id v29 = v28;
      if (!v28) {
        id v28 = (void *)MEMORY[0x1E4F1CC08];
      }
      id v30 = (void *)[v28 mutableCopy];

      uint64_t v31 = [v10 identifier];
      uint64_t v32 = [v31 UUIDString];
      [v30 setObject:v32 forKey:@"RTPersistentStoreMetadataDeviceRecordIDKey"];

      uint64_t v33 = [*(id *)(a1 + 48) persistentStoreCoordinator];
      [v33 setMetadata:v30 forPersistentStore:v26];

      long long v34 = *(void **)(a1 + 48);
      id v46 = 0;
      int v35 = [v34 save:&v46];
      id v36 = v46;
      id v37 = v46;
      __int16 v21 = v37;
      if (!v35 || v37)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v36);
        objc_super v42 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v21;
          _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "failed to save device MOID to store metadata due to error, %@", buf, 0xCu);
        }
      }
      else
      {
        id v38 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v39 = [v10 objectID];
          *(_DWORD *)buf = 138412290;
          v51 = v39;
          _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "did persist device MOID %@ to store metadata", buf, 0xCu);
        }
        uint64_t v40 = [v10 objectID];
        uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
        objc_super v42 = *(NSObject **)(v41 + 40);
        *(void *)(v41 + 40) = v40;
      }
    }
  }
  else
  {
    v43 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "failed to create device record, record or identifier is nil", buf, 2u);
    }

    uint64_t v48 = *MEMORY[0x1E4F28568];
    v49 = @"Failed to create device record, record or identifier is nil.";
    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceErrorDomain" code:0 userInfo:v21];
    uint64_t v45 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v26 = *(NSObject **)(v45 + 40);
    *(void *)(v45 + 40) = v44;
  }
}

- (BOOL)persistCurrentDeviceRecordInStore:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = v9;
  if (!v8)
  {
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: store", buf, 2u);
    }

    if (a5)
    {
      id v27 = @"store";
LABEL_18:
      _RTErrorInvalidParameterCreate((uint64_t)v27);
      BOOL v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_19:
    BOOL v23 = 0;
    goto LABEL_21;
  }
  if (!v9)
  {
    id v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a5)
    {
      id v27 = @"context";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  id v11 = [v8 URL];
  unint64_t v12 = +[RTPersistenceManager storeTypeForURL:v11];

  if (v12 == 1)
  {
    *(void *)buf = 0;
    id v37 = buf;
    uint64_t v38 = 0x3032000000;
    id v39 = __Block_byref_object_copy__48;
    uint64_t v40 = __Block_byref_object_dispose__48;
    id v41 = 0;
    id v13 = [v10 persistentStoreCoordinator];
    id v14 = [v8 URL];
    id v15 = [v13 persistentStoreForURL:v14];

    id v16 = [v10 persistentStoreCoordinator];
    id v17 = [v16 metadataForPersistentStore:v15];
    int v18 = v17;
    if (!v17) {
      id v17 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v19 = (void *)[v17 mutableCopy];

    id v20 = [v19 objectForKeyedSubscript:@"RTPersistentStoreMetadataDeviceRecordIDKey"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __71__RTPersistenceDriver_persistCurrentDeviceRecordInStore_context_error___block_invoke;
    v30[3] = &unk_1E6B94D58;
    id v21 = v20;
    id v31 = v21;
    id v32 = v8;
    id v33 = v10;
    long long v34 = self;
    int v35 = buf;
    [v33 performBlockAndWait:v30];
    id v22 = (void *)*((void *)v37 + 5);
    BOOL v23 = v22 == 0;
    if (a5 && v22)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      int64_t v25 = [v22 userInfo];
      *a5 = [v24 errorWithDomain:@"RTPersistenceErrorDomain" code:0 userInfo:v25];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v23 = 1;
  }
LABEL_21:

  return v23;
}

void __71__RTPersistenceDriver_persistCurrentDeviceRecordInStore_context_error___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      long long v3 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v55 = v3;
      _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "metadata has device record with identifier %@", buf, 0xCu);
    }

    id v4 = +[RTDeviceMO fetchRequest];
    uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 32)];
    uint64_t v7 = [v5 predicateWithFormat:@"%K == %@", @"identifier", v6];
    [v4 setPredicate:v7];

    [v4 setFetchLimit:1];
    id v8 = *(void **)(a1 + 48);
    id v52 = 0;
    id v9 = [v8 executeFetchRequest:v4 error:&v52];
    id v10 = v52;
    id v11 = v52;
    if (v11)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v10);
      unint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "failed to fetch device record due to error, %@", buf, 0xCu);
      }
LABEL_7:

      goto LABEL_34;
    }
    if ([v9 count])
    {
      id v21 = [v9 firstObject];
      id v22 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        BOOL v23 = [v21 identifier];
        *(_DWORD *)buf = 138412290;
        v55 = v23;
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "fetched device record with identifier %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int64_t v25 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v55 = v25;
        _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "device record with identifier %@ was lost, creating a new one.", buf, 0xCu);
      }

      uint64_t v26 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v29 = *(void *)(a1 + 56);
      uint64_t v30 = *(void *)(v29 + 64);
      uint64_t v31 = *(void *)(v29 + 144);
      id v51 = 0;
      id v22 = +[RTPersistenceDriver persistCurrentDeviceWithIdentifier:v26 inStore:v27 context:v28 platform:v30 notificationHelper:v31 error:&v51];
      id v32 = v51;
      unint64_t v12 = v51;

      if (!v22 || v12)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v32);
        v49 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v12;
          _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "error creating new device record, %@", buf, 0xCu);
        }

        goto LABEL_7;
      }
      id v21 = [*(id *)(a1 + 48) objectWithID:v22];
    }

    id v33 = [v21 creationDate];

    if (!v33)
    {
      long long v34 = [MEMORY[0x1E4F1C9C8] date];
      [v21 setCreationDate:v34];

      int v35 = *(void **)(a1 + 48);
      id v50 = 0;
      int v36 = [v35 save:&v50];
      id v37 = v50;
      uint64_t v38 = v37;
      if (!v36 || v37)
      {
        id v39 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v38;
          _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "unable to update device record creation date when there was none previously due to error, %@", buf, 0xCu);
        }
      }
    }

    goto LABEL_31;
  }
  id v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = *(void *)(v16 + 144);
  id v53 = 0;
  id v11 = +[RTPersistenceDriver persistCurrentDeviceWithIdentifier:v13 inStore:v14 context:v15 platform:v17 notificationHelper:v18 error:&v53];
  id v19 = v53;
  id v4 = v53;

  if (v11) {
    BOOL v20 = v4 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20)
  {
    id v21 = [*(id *)(a1 + 48) objectWithID:v11];
    id v4 = v11;
LABEL_31:

    uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      id v41 = [v21 objectID];
      objc_super v42 = [v21 identifier];
      *(_DWORD *)buf = 138412546;
      v55 = v41;
      __int16 v56 = 2112;
      v57 = v42;
      _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "setting moid, %@, of current device record with identifier, %@", buf, 0x16u);
    }
    v43 = [v21 objectID];
    uint64_t v44 = [*(id *)(a1 + 40) userInfo];
    [v44 setObject:v43 forKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];

    uint64_t v45 = [v21 objectID];
    id v46 = [*(id *)(a1 + 48) userInfo];
    [v46 setObject:v45 forKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];

    id v47 = *(void **)(a1 + 56);
    id v11 = [v47 persistenceManager];
    id v9 = [v11 outstandingContexts];
    uint64_t v48 = [v21 objectID];
    [v47 _updatePersistenceContexts:v9 deviceObjectID:v48];

    id v4 = v21;
    goto LABEL_34;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v19);
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v4;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "error creating new device record, %@", buf, 0xCu);
  }
LABEL_34:
}

- (BOOL)prepareStore:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: store", buf, 2u);
    }

    if (a5)
    {
      uint64_t v15 = @"store";
LABEL_13:
      _RTErrorInvalidParameterCreate((uint64_t)v15);
      BOOL v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_21;
  }
  if (!v9)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v21 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v21, 2u);
    }

    if (a5)
    {
      uint64_t v15 = @"context";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  [(RTPersistenceDriver *)self cleanupOlderPersistentStores];
  id v11 = [v8 URL];
  unint64_t v12 = +[RTPersistenceManager storeTypeForURL:v11];

  if (v12 == 1)
  {
    id v20 = 0;
    [(RTPersistenceDriver *)self persistCurrentDeviceRecordInStore:v8 context:v10 error:&v20];
    id v13 = v20;
  }
  else
  {
    id v13 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained persistenceStore:v8 didPrepareWithContext:v10];
  }
  if (a5) {
    *a5 = v13;
  }
  BOOL v17 = v13 == 0;

LABEL_21:
  return v17;
}

- (void)persistenceStore:(id)a3 failedWithError:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained persistenceStoreFailedWithError:v6];
  }
}

- (void)persistenceStore:(id)a3 encounteredCriticalError:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Exiting due to critical error, %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(RTPersistenceDriver *)self lifecycleManager];
  [v7 exit];
}

- (BOOL)copyPersistenceStore:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v121 = a4;
  if (![(RTPlatform *)self->_currentPlatform internalInstall])
  {
    BOOL v109 = 1;
    goto LABEL_60;
  }
  v115 = a5;
  id v9 = objc_opt_new();
  uint64_t v10 = [v8 URL];
  id v11 = [v10 path];

  [v9 addObject:v11];
  unint64_t v12 = [v11 stringByDeletingPathExtension];
  id v13 = [v12 stringByAppendingString:@".bak"];
  v118 = v11;
  uint64_t v14 = [v11 pathExtension];
  uint64_t v15 = [v13 stringByAppendingPathExtension:v14];
  [v9 addObject:v15];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v17 = [v8 URL];
  uint64_t v18 = [v17 path];
  id v19 = [v18 stringByAppendingString:@"-wal"];
  id v20 = [v16 fileURLWithPath:v19];
  id v21 = [v20 path];

  [v9 addObject:v21];
  id v22 = [v21 stringByDeletingPathExtension];
  BOOL v23 = [v22 stringByAppendingString:@".bak"];
  v117 = v21;
  uint64_t v24 = [v21 pathExtension];
  int64_t v25 = [v23 stringByAppendingPathExtension:v24];
  [v9 addObject:v25];

  uint64_t v26 = (void *)MEMORY[0x1E4F1CB10];
  id v119 = v8;
  uint64_t v27 = [v8 URL];
  uint64_t v28 = [v27 path];
  uint64_t v29 = [v28 stringByAppendingString:@"-shm"];
  uint64_t v30 = [v26 fileURLWithPath:v29];
  uint64_t v31 = [v30 path];

  [v9 addObject:v31];
  id v32 = [v31 stringByDeletingPathExtension];
  id v33 = [v32 stringByAppendingString:@".bak"];
  v116 = v31;
  long long v34 = [v31 pathExtension];
  int v35 = [v33 stringByAppendingPathExtension:v34];
  [v9 addObject:v35];

  v122 = objc_opt_new();
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = v9;
  uint64_t v36 = [obj countByEnumeratingWithState:&v131 objects:v147 count:16];
  uint64_t v38 = v121;
  if (!v36) {
    goto LABEL_51;
  }
  uint64_t v39 = v36;
  unint64_t v40 = 0x1E4F28000uLL;
  uint64_t v126 = *(void *)v132;
  *(void *)&long long v37 = 138413570;
  long long v114 = v37;
  do
  {
    uint64_t v41 = 0;
    uint64_t v123 = v39;
    do
    {
      if (*(void *)v132 != v126) {
        objc_enumerationMutation(obj);
      }
      objc_super v42 = *(void **)(*((void *)&v131 + 1) + 8 * v41);
      v43 = [v38 path:v114];
      uint64_t v44 = [v43 stringByAppendingPathComponent:v42];

      uint64_t v45 = [v44 stringByDeletingLastPathComponent];
      id v46 = [*(id *)(v40 + 3256) defaultManager];
      char v47 = [v46 fileExistsAtPath:v42];

      if ((v47 & 1) == 0)
      {
        v63 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          v68 = (objc_class *)objc_opt_class();
          v69 = NSStringFromClass(v68);
          v70 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v138 = v69;
          __int16 v139 = 2112;
          uint64_t v140 = (uint64_t)v70;
          __int16 v141 = 2112;
          id v142 = v42;
          _os_log_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_INFO, "%@ %@, skipping, %@, file does not exist at path", buf, 0x20u);
        }
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v48 = [*(id *)(v40 + 3256) defaultManager];
      char v49 = [v48 fileExistsAtPath:v45];

      if ((v49 & 1) == 0)
      {
        id v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          id v51 = (objc_class *)objc_opt_class();
          id v52 = NSStringFromClass(v51);
          id v53 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v138 = v52;
          __int16 v139 = 2112;
          uint64_t v140 = (uint64_t)v53;
          __int16 v141 = 2112;
          id v142 = v45;
          _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%@ %@, creating destination directory, %@", buf, 0x20u);
        }
        v54 = [*(id *)(v40 + 3256) defaultManager];
        id v130 = 0;
        int v55 = [v54 createDirectoryAtPath:v45 withIntermediateDirectories:1 attributes:0 error:&v130];
        id v56 = v130;

        if (!v55 || v56)
        {
          v57 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v93 = (objc_class *)objc_opt_class();
            v120 = NSStringFromClass(v93);
            uint64_t v94 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            v138 = v120;
            __int16 v139 = 2112;
            uint64_t v140 = v94;
            v95 = (void *)v94;
            __int16 v141 = 2112;
            id v142 = v45;
            __int16 v143 = 2112;
            *(void *)v144 = v56;
            _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "%@ %@, failed to create directory, %@, error, %@", buf, 0x2Au);
          }
          if (v56) {
            [v122 addObject:v56];
          }
        }
      }
      uint64_t v58 = [v42 pathExtension];
      int v59 = [v58 isEqualToString:@".sqlite"];

      if (v59)
      {
        ppDb = 0;
        id v60 = v42;
        int v61 = sqlite3_open_v2((const char *)[v60 UTF8String], &ppDb, 1, 0);
        if (v61)
        {
          int v62 = v61;
          v63 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = (objc_class *)objc_opt_class();
            v65 = NSStringFromClass(v64);
            v66 = NSStringFromSelector(a2);
            v67 = sqlite3_errmsg(ppDb);
            *(_DWORD *)buf = 138413314;
            v138 = v65;
            __int16 v139 = 2112;
            uint64_t v140 = (uint64_t)v66;
            __int16 v141 = 2112;
            id v142 = v60;
            __int16 v143 = 1024;
            *(_DWORD *)v144 = v62;
            *(_WORD *)&v144[4] = 2080;
            *(void *)&v144[6] = v67;
            _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "%@ %@, failed to open source database, %@, error, %d, %s", buf, 0x30u);

            uint64_t v39 = v123;
          }
          goto LABEL_24;
        }
        db = 0;
        id v79 = v44;
        int v80 = sqlite3_open_v2((const char *)[v79 UTF8String], &db, 6, 0);
        if (v80)
        {
          int v81 = v80;
          v82 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            v99 = (objc_class *)objc_opt_class();
            v100 = NSStringFromClass(v99);
            v101 = NSStringFromSelector(a2);
            v102 = sqlite3_errmsg(db);
            *(_DWORD *)buf = 138413314;
            v138 = v100;
            __int16 v139 = 2112;
            uint64_t v140 = (uint64_t)v101;
            __int16 v141 = 2112;
            id v142 = v79;
            __int16 v143 = 1024;
            *(_DWORD *)v144 = v81;
            *(_WORD *)&v144[4] = 2080;
            *(void *)&v144[6] = v102;
            _os_log_error_impl(&dword_1D9BFA000, v82, OS_LOG_TYPE_ERROR, "%@ %@, failed to open destination database, %@, error, %d, %s", buf, 0x30u);

            uint64_t v39 = v123;
          }

          p_ppDb = &ppDb;
        }
        else
        {
          v84 = db;
          id v85 = [v79 lastPathComponent];
          v86 = (const char *)[v85 UTF8String];
          v87 = ppDb;
          id v88 = [v60 lastPathComponent];
          v89 = sqlite3_backup_init(v84, v86, v87, (const char *)[v88 UTF8String]);

          if (v89)
          {
            sqlite3_backup_step(v89, -1);
            sqlite3_backup_finish(v89);
          }
          int v90 = sqlite3_errcode(db);
          uint64_t v38 = v121;
          unint64_t v40 = 0x1E4F28000;
          uint64_t v39 = v123;
          if (v90)
          {
            int v91 = v90;
            v92 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              v103 = (objc_class *)objc_opt_class();
              v104 = NSStringFromClass(v103);
              v105 = NSStringFromSelector(a2);
              v106 = sqlite3_errmsg(db);
              *(_DWORD *)buf = v114;
              v138 = v104;
              __int16 v139 = 2112;
              uint64_t v140 = (uint64_t)v105;
              __int16 v141 = 2112;
              id v142 = v60;
              __int16 v143 = 2112;
              *(void *)v144 = v79;
              *(_WORD *)&v144[8] = 1024;
              *(_DWORD *)&v144[10] = v91;
              __int16 v145 = 2080;
              v146 = v106;
              _os_log_error_impl(&dword_1D9BFA000, v92, OS_LOG_TYPE_ERROR, "%@ %@, failed to copy source, %@, to destination, %@, error, %d, %s", buf, 0x3Au);

              unint64_t v40 = 0x1E4F28000;
              uint64_t v39 = v123;
            }
          }
          sqlite3_close(ppDb);
          p_ppDb = &db;
        }
        sqlite3_close(*p_ppDb);
LABEL_25:
        id v71 = 0;
        goto LABEL_26;
      }
      v72 = [*(id *)(v40 + 3256) defaultManager];
      id v127 = 0;
      int v73 = [v72 copyItemAtPath:v42 toPath:v44 error:&v127];
      id v71 = v127;

      v74 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v75 = v74;
      if (!v73 || v71)
      {
        uint64_t v39 = v123;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v96 = (objc_class *)objc_opt_class();
          v97 = NSStringFromClass(v96);
          v98 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          v138 = v97;
          __int16 v139 = 2112;
          uint64_t v140 = (uint64_t)v98;
          __int16 v141 = 2112;
          id v142 = v42;
          __int16 v143 = 2112;
          *(void *)v144 = v71;
          _os_log_error_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_ERROR, "%@ %@, error while copying up file %@, error, %@", buf, 0x2Au);

          uint64_t v39 = v123;
        }

        if (v71) {
          [v122 addObject:v71];
        }
        unint64_t v40 = 0x1E4F28000;
      }
      else
      {
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v76 = (objc_class *)objc_opt_class();
          v77 = NSStringFromClass(v76);
          v78 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          v138 = v77;
          __int16 v139 = 2112;
          uint64_t v140 = (uint64_t)v78;
          __int16 v141 = 2112;
          id v142 = v42;
          __int16 v143 = 2112;
          *(void *)v144 = v44;
          _os_log_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_INFO, "%@ %@, finished copying file %@ to %@", buf, 0x2Au);
        }
        id v71 = 0;
        unint64_t v40 = 0x1E4F28000;
        uint64_t v39 = v123;
      }
LABEL_26:

      ++v41;
    }
    while (v39 != v41);
    uint64_t v107 = [obj countByEnumeratingWithState:&v131 objects:v147 count:16];
    uint64_t v39 = v107;
  }
  while (v107);
LABEL_51:

  if ([v122 count])
  {
    id v8 = v119;
    if ((unint64_t)[v122 count] > 1)
    {
      v110 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v111 = *MEMORY[0x1E4F5CFE8];
      uint64_t v135 = *MEMORY[0x1E4F5CFE0];
      v136 = v122;
      v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      id v108 = [v110 errorWithDomain:v111 code:9 userInfo:v112];
    }
    else
    {
      id v108 = [v122 firstObject];
    }
    if (v115)
    {
      id v108 = v108;
      id *v115 = v108;
    }
  }
  else
  {
    id v108 = 0;
    id v8 = v119;
  }
  BOOL v109 = v108 == 0;

LABEL_60:
  return v109;
}

- (BOOL)backupPersistenceStore:(id)a3 error:(id *)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(RTPlatform *)self->_currentPlatform internalInstall])
  {
    BOOL v39 = 1;
    goto LABEL_46;
  }
  int v59 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = [v6 URL];
  id v9 = [v8 path];
  [v7 addObject:v9];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CB10];
  id v11 = [v6 URL];
  unint64_t v12 = [v11 path];
  id v13 = [v12 stringByAppendingString:@"-wal"];
  uint64_t v14 = [v10 fileURLWithPath:v13];
  uint64_t v15 = [v14 path];
  [v7 addObject:v15];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CB10];
  id v60 = v6;
  BOOL v17 = [v6 URL];
  uint64_t v18 = [v17 path];
  id v19 = [v18 stringByAppendingString:@"-shm"];
  id v20 = [v16 fileURLWithPath:v19];
  id v21 = [v20 path];
  [v7 addObject:v21];

  v63 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v73 objects:v86 count:16];
  id obj = v22;
  if (!v23)
  {

    goto LABEL_19;
  }
  uint64_t v24 = v23;
  char v61 = 0;
  id v65 = *(id *)v74;
  uint64_t v25 = *MEMORY[0x1E4F282C0];
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(id *)v74 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      uint64_t v28 = [v27 stringByDeletingPathExtension:v59];
      uint64_t v29 = [v28 stringByAppendingString:@".bak"];
      uint64_t v30 = [v27 pathExtension];
      uint64_t v31 = [v29 stringByAppendingPathExtension:v30];

      id v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v72 = 0;
      id v33 = [v32 attributesOfItemAtPath:v31 error:&v72];
      id v34 = v72;

      int v35 = [v33 objectForKeyedSubscript:v25];
      uint64_t v36 = [MEMORY[0x1E4F28CB8] defaultManager];
      if ([v36 fileExistsAtPath:v31])
      {
        long long v37 = [v35 laterDate:v63];
        int v38 = [v37 isEqualToDate:v35];

        if (!v38) {
          goto LABEL_13;
        }
        uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          int v81 = v31;
          __int16 v82 = 2112;
          id v83 = v63;
          __int16 v84 = 2112;
          id v85 = v35;
          _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "a backup already exists at the path %@ or is recent (%@, %@), skipping", buf, 0x20u);
        }
        char v61 = 1;
      }

LABEL_13:
    }
    id v22 = obj;
    uint64_t v24 = [obj countByEnumeratingWithState:&v73 objects:v86 count:16];
  }
  while (v24);

  if (v61)
  {
    BOOL v39 = 1;
    id v6 = v60;
    goto LABEL_45;
  }
LABEL_19:
  int v62 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v66 = v22;
  uint64_t v40 = [v66 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v69 != v42) {
          objc_enumerationMutation(v66);
        }
        uint64_t v44 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        uint64_t v45 = [v44 stringByDeletingPathExtension:v59];
        id v46 = [v45 stringByAppendingString:@".bak"];
        char v47 = [v44 pathExtension];
        uint64_t v48 = [v46 stringByAppendingPathExtension:v47];

        char v49 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v67 = 0;
        LODWORD(v46) = [v49 copyItemAtPath:v44 toPath:v48 error:&v67];
        id v50 = v67;

        id v51 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        id v52 = v51;
        if (v46) {
          BOOL v53 = v50 == 0;
        }
        else {
          BOOL v53 = 0;
        }
        if (v53)
        {
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            int v81 = v44;
            __int16 v82 = 2112;
            id v83 = v48;
            _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "finished backing up file %@ to %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            int v81 = v44;
            __int16 v82 = 2112;
            id v83 = v50;
            _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "error while backing up file %@, error, %@", buf, 0x16u);
          }

          if (v50) {
            [v62 addObject:v50];
          }
        }
      }
      uint64_t v41 = [v66 countByEnumeratingWithState:&v68 objects:v79 count:16];
    }
    while (v41);
  }

  if ([v62 count])
  {
    if ((unint64_t)[v62 count] > 1)
    {
      int v55 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F5CFE8];
      uint64_t v77 = *MEMORY[0x1E4F5CFE0];
      v78 = v62;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      id v54 = [v55 errorWithDomain:v56 code:9 userInfo:v57];
    }
    else
    {
      id v54 = [v62 firstObject];
    }
    id v6 = v60;
    id v22 = obj;
    if (v59)
    {
      id v54 = v54;
      *int v59 = v54;
    }
  }
  else
  {
    id v54 = 0;
    id v6 = v60;
    id v22 = obj;
  }
  BOOL v39 = v54 == 0;

LABEL_45:
LABEL_46:

  return v39;
}

- (BOOL)persistenceMirroringManagerDidFinishZonePurge:(id)a3 store:(id)a4 context:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "device record was deleted in a zone purge, creating a new one.", (uint8_t *)&buf, 2u);
  }

  uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
  currentPlatform = self->_currentPlatform;
  notificationHelper = self->_notificationHelper;
  id v32 = 0;
  BOOL v17 = +[RTPersistenceDriver persistCurrentDeviceWithIdentifier:v14 inStore:v11 context:v12 platform:currentPlatform notificationHelper:notificationHelper error:&v32];
  id v18 = v32;

  if (v17) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    long long v37 = __Block_byref_object_copy__48;
    int v38 = __Block_byref_object_dispose__48;
    id v39 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __89__RTPersistenceDriver_persistenceMirroringManagerDidFinishZonePurge_store_context_error___block_invoke;
    v26[3] = &unk_1E6B94D30;
    id v27 = v12;
    id v28 = v17;
    p_long long buf = &buf;
    id v29 = v11;
    uint64_t v30 = self;
    [v27 performBlockAndWait:v26];
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    BOOL v21 = v22 == 0;
    if (v22)
    {
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)id v33 = 138412290;
        uint64_t v34 = v25;
        _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "error getting new device record, %@", v33, 0xCu);
      }

      if (a6) {
        *a6 = *(id *)(*((void *)&buf + 1) + 40);
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "error creating new device record, %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v21 = 0;
    if (a6) {
      *a6 = v18;
    }
  }

  return v21;
}

void __89__RTPersistenceDriver_persistenceMirroringManagerDidFinishZonePurge_store_context_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 existingObjectWithID:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v5 objectID];
      id v8 = [v5 identifier];
      *(_DWORD *)long long buf = 138412546;
      BOOL v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "setting moid, %@, of current device record with identifier, %@", buf, 0x16u);
    }
    id v9 = [v5 objectID];
    id v10 = [*(id *)(a1 + 48) userInfo];
    [v10 setObject:v9 forKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];

    id v11 = [v5 objectID];
    id v12 = [*(id *)(a1 + 32) userInfo];
    [v12 setObject:v11 forKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];

    id v13 = *(void **)(a1 + 56);
    uint64_t v14 = [v5 objectID];
    [v13 _updatePersistenceStoresWithDeviceObjectID:v14];

    uint64_t v15 = *(void **)(a1 + 56);
    uint64_t v16 = [v15 persistenceManager];
    BOOL v17 = [v16 outstandingContexts];
    id v18 = [v5 objectID];
    [v15 _updatePersistenceContexts:v17 deviceObjectID:v18];
  }
}

- (void)persistenceManagerWillStartResetSync:(id)a3 userInfo:(id)a4 context:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8)
  {
    if (v10)
    {
LABEL_3:
      id v12 = objc_opt_new();
      [(RTPersistenceDriver *)self setResetSyncContext:v12];

      id v13 = [(RTPersistenceDriver *)self resetSyncContext];
      [v13 setManagedObjectContext:v11];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained persistenceStoreResetSyncWithUserInfo:v9];
      }
      uint64_t v15 = [(RTPersistenceDriver *)self persistenceManager];
      uint64_t v16 = [v15 historyTokenForStoreType:1];
      BOOL v17 = [(RTPersistenceDriver *)self resetSyncContext];
      [v17 setHistoryToken:v16];

      defaultsManager = self->_defaultsManager;
      BOOL v19 = [MEMORY[0x1E4F1C9C8] date];
      [(RTDefaultsManager *)defaultsManager setObject:v19 forKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __77__RTPersistenceDriver_persistenceManagerWillStartResetSync_userInfo_context___block_invoke;
      v21[3] = &unk_1E6B90BF0;
      v21[4] = self;
      id v22 = v11;
      [v22 performBlockAndWait:v21];

      goto LABEL_11;
    }
  }
  else
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v24 = "-[RTPersistenceDriver persistenceManagerWillStartResetSync:userInfo:context:]";
      __int16 v25 = 1024;
      int v26 = 1534;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager (in %s:%d)", buf, 0x12u);
    }

    if (v11) {
      goto LABEL_3;
    }
  }
  id WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }
LABEL_11:
}

void __77__RTPersistenceDriver_persistenceManagerWillStartResetSync_userInfo_context___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];
  uint64_t v4 = [*(id *)(a1 + 32) resetSyncContext];
  [v4 setCurrentDeviceObjectID:v3];

  id v5 = [*(id *)(a1 + 40) currentDevice];
  id v6 = [v5 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) resetSyncContext];
  [v7 setCurrentDeviceIdentifier:v6];

  id v8 = *(void **)(a1 + 40);
  id v9 = [v8 currentDevice];
  [v8 refreshObject:v9 mergeChanges:0];

  [*(id *)(a1 + 40) reset];
  id v10 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [*(id *)(a1 + 32) resetSyncContext];
    id v12 = [v11 currentDeviceObjectID];
    id v13 = [*(id *)(a1 + 32) resetSyncContext];
    uint64_t v14 = [v13 currentDeviceIdentifier];
    uint64_t v15 = [v14 UUIDString];
    int v16 = 138412546;
    BOOL v17 = v12;
    __int16 v18 = 2112;
    BOOL v19 = v15;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "cached current device information, MOID, %@, identifier, %@", (uint8_t *)&v16, 0x16u);
  }
}

- (BOOL)_evaluatePersistentHistoryForDeletedDeviceDuringResetSync:(BOOL *)a3 resetSyncContext:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v10)
  {
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: resetSyncContext", buf, 2u);
    }

    if (a6)
    {
      BOOL v19 = @"resetSyncContext";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v19);
      BOOL v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_15:
    BOOL v21 = 0;
    goto LABEL_21;
  }
  if (!v11)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }

    if (a6)
    {
      BOOL v19 = @"managedObjectContext";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v13 = objc_opt_new();
  *(void *)long long buf = 0;
  id v33 = buf;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  __int16 v25 = __125__RTPersistenceDriver__evaluatePersistentHistoryForDeletedDeviceDuringResetSync_resetSyncContext_managedObjectContext_error___block_invoke;
  int v26 = &unk_1E6B94D58;
  id v27 = v10;
  id v28 = self;
  id v29 = v12;
  id v14 = v13;
  id v30 = v14;
  uint64_t v31 = buf;
  [v29 performBlockAndWait:&v23];
  uint64_t v15 = _RTSafeArray();
  int v16 = _RTMultiErrorCreate();

  if (a3)
  {
    if (objc_msgSend(v14, "count", 1, v23, v24, v25, v26, v27, v28, v29)) {
      char v17 = 1;
    }
    else {
      char v17 = v33[24];
    }
    *a3 = v17;
  }
  if (a6) {
    *a6 = v16;
  }
  BOOL v21 = v16 == 0;

  _Block_object_dispose(buf, 8);
LABEL_21:

  return v21;
}

void __125__RTPersistenceDriver__evaluatePersistentHistoryForDeletedDeviceDuringResetSync_resetSyncContext_managedObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) historyToken];

  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "using history change token for history query", buf, 2u);
    }

    id v5 = (void *)MEMORY[0x1E4F1C160];
    id v6 = [*(id *)(a1 + 32) historyToken];
    uint64_t v7 = [v5 fetchHistoryAfterToken:v6];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "using date for history query", buf, 2u);
    }

    id v6 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastResetSyncDate"];
    uint64_t v7 = [MEMORY[0x1E4F1C160] fetchHistoryAfterDate:v6];
  }
  id v8 = (void *)v7;

  [v8 setResultType:5];
  [v8 setFetchBatchSize:10];
  id v9 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  id v10 = [MEMORY[0x1E4F1C178] entityDescription];
  id v11 = [v10 name];
  id v12 = (void *)[v9 initWithEntityName:v11];

  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"author", @"NSCloudKitMirroringDelegate.reset"];
  [v12 setPredicate:v13];

  [v8 setFetchRequest:v12];
  id v14 = *(void **)(a1 + 48);
  id v57 = 0;
  uint64_t v15 = [v14 executeRequest:v8 error:&v57];
  id v16 = v57;
  if (v16)
  {
    char v17 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v60 = (uint64_t)v16;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "error querying persistent history, %@", buf, 0xCu);
    }

    [*(id *)(a1 + 56) addObject:v16];
  }
  else
  {
    __int16 v18 = [v15 result];

    if (v18)
    {
      uint64_t v42 = v12;
      v43 = v8;
      uint64_t v41 = v15;
      BOOL v19 = [v15 result];
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        BOOL v21 = [*(id *)(a1 + 32) currentDeviceObjectID];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v60 = (uint64_t)v21;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "searching for device record with MOID, %@", buf, 0xCu);
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v19;
      uint64_t v47 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v47)
      {
        uint64_t v45 = *MEMORY[0x1E4F1BDB8];
        uint64_t v46 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v54 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            context = (void *)MEMORY[0x1E016D870]();
            uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              uint64_t v25 = [v23 transactionNumber];
              int v26 = [v23 author];
              *(_DWORD *)long long buf = 134218242;
              uint64_t v60 = v25;
              __int16 v61 = 2112;
              int v62 = v26;
              _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "transaction ID, %lld, transaction author, %@", buf, 0x16u);
            }
            id v27 = [v23 objectIDNotification];
            id v28 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              id v29 = [v27 userInfo];
              *(_DWORD *)long long buf = 138412290;
              uint64_t v60 = (uint64_t)v29;
              _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "objectIDNotification, %@", buf, 0xCu);
            }
            id v30 = [v27 userInfo];
            uint64_t v31 = [v30 objectForKey:v45];

            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v32 = v31;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v58 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v50;
              while (2)
              {
                for (uint64_t j = 0; j != v34; ++j)
                {
                  if (*(void *)v50 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  long long v37 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                  int v38 = [*(id *)(a1 + 32) currentDeviceObjectID];
                  LODWORD(v37) = [v37 isEqual:v38];

                  if (v37)
                  {
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
                    id v39 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)long long buf = 0;
                      _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "previous current device was deleted.", buf, 2u);
                    }

                    goto LABEL_36;
                  }
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v58 count:16];
                if (v34) {
                  continue;
                }
                break;
              }
            }
LABEL_36:
          }
          uint64_t v47 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v47);
      }

      id v12 = v42;
      id v8 = v43;
      uint64_t v15 = v41;
      id v16 = 0;
    }
    else
    {
      uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "error while fetching history; historyResult is nil",
          buf,
          2u);
      }
    }
  }
}

- (void)persistenceManagerDidFinishResetSync:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTPersistenceDriver *)self resetSyncContext];

  if (!v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_FAULT, "error recreating device record during reset-sync because there was no context.", buf, 2u);
    }

    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Error recreating device record during reset-sync because there was no context." userInfo:0];
    objc_exception_throw(v13);
  }
  id v9 = [v6 persistenceContextWithOptions:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__RTPersistenceDriver_persistenceManagerDidFinishResetSync_userInfo___block_invoke;
  v14[3] = &unk_1E6B92F80;
  v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v10 = v6;
  id v11 = v9;
  [v11 performBlockAndWait:v14];
  [(RTPersistenceDriver *)self setResetSyncContext:0];
}

void __69__RTPersistenceDriver_persistenceManagerDidFinishResetSync_userInfo___block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v33 = 0;
  id v2 = a1[4];
  uint64_t v3 = [v2 resetSyncContext];
  id v4 = a1[5];
  id v32 = 0;
  [v2 _evaluatePersistentHistoryForDeletedDeviceDuringResetSync:&v33 resetSyncContext:v3 managedObjectContext:v4 error:&v32];
  id v5 = v32;

  id v6 = a1[5];
  id v7 = [a1[4] resetSyncContext];
  id v8 = [v7 currentDeviceObjectID];
  id v31 = 0;
  id v9 = [v6 existingObjectWithID:v8 error:&v31];
  id v10 = v31;

  if (v33 || v10 || v5)
  {
    id v14 = a1[4];
    id v15 = [v14 resetSyncContext];
    id v16 = [v14 _repersistPreviousDeviceWithResetSyncContext:v15 persistenceManager:a1[6] managedObjectContext:a1[5]];

    if (!v16)
    {
      id v28 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_FAULT, "failed to recreate device record after reset sync", buf, 2u);
      }

      id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"failed to recreate device record after reset sync" userInfo:0];
      objc_exception_throw(v29);
    }
    id v13 = [a1[5] existingObjectWithID:v16 error:0];
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v9 objectID];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v35 = v12;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "keeping the previous device after reset sync, %@", buf, 0xCu);
    }
    id v13 = v9;
  }
  char v17 = [v13 objectID];
  __int16 v18 = [a1[5] userInfo];
  [v18 setObject:v17 forKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];

  id v19 = a1[4];
  uint64_t v20 = [v13 objectID];
  [v19 _updatePersistenceStoresWithDeviceObjectID:v20];

  id v21 = a1[4];
  id v22 = [a1[6] outstandingContexts];
  uint64_t v23 = [v13 objectID];
  [v21 _updatePersistenceContexts:v22 deviceObjectID:v23];

  id v24 = a1[4];
  uint64_t v25 = [a1[6] latestModel];
  id v26 = a1[5];
  id v27 = a1[6];
  uint64_t v30 = 0;
  [v24 _purgeLocalEntityRowsUsingModel:v25 managedObjectContext:v26 persistenceManager:v27 error:&v30];
}

- (id)_repersistPreviousDeviceWithResetSyncContext:(id)a3 persistenceManager:(id)a4 managedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)long long buf = 0;
    id v14 = "Invalid parameter not satisfying: resetSyncContext";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)long long buf = 0;
    id v14 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_11;
  }
  if (v10)
  {
    *(void *)long long buf = 0;
    uint64_t v23 = buf;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__48;
    id v26 = __Block_byref_object_dispose__48;
    id v27 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__RTPersistenceDriver__repersistPreviousDeviceWithResetSyncContext_persistenceManager_managedObjectContext___block_invoke;
    v16[3] = &unk_1E6B94D58;
    id v17 = v9;
    id v21 = buf;
    id v18 = v8;
    id v19 = v11;
    uint64_t v20 = self;
    [v19 performBlockAndWait:v16];
    id v12 = *((id *)v23 + 5);

    _Block_object_dispose(buf, 8);
    goto LABEL_13;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    id v14 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_11;
  }
LABEL_12:

  id v12 = 0;
LABEL_13:

  return v12;
}

void __108__RTPersistenceDriver__repersistPreviousDeviceWithResetSyncContext_persistenceManager_managedObjectContext___block_invoke(uint64_t a1, __n128 a2)
{
  unint64_t v3 = 0;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  a2.n128_u64[0] = 138412290;
  __n128 v27 = a2;
  while (1)
  {
    id v4 = [*(id *)(a1 + 32) persistenceStoreForType:1, *(_OWORD *)&v27];
    id v5 = [*(id *)(a1 + 40) currentDeviceIdentifier];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(v7 + 64);
    uint64_t v9 = *(void *)(v7 + 144);
    id v28 = 0;
    uint64_t v10 = +[RTPersistenceDriver persistCurrentDeviceWithIdentifier:v5 inStore:v4 context:v6 platform:v8 notificationHelper:v9 error:&v28];
    id v11 = v28;
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;

    if (!v11) {
      break;
    }
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = v27.n128_u32[0];
      id v32 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "error attempting to re-persist device to the store after reset sync, %@", buf, 0xCu);
    }

    if (v3 > 3) {
      goto LABEL_17;
    }
LABEL_11:

    ++v3;
  }

  id v15 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v15) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v3 >= 4;
  }
  if (!v16) {
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_17:
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = v27.n128_u32[0];
      id v32 = v11;
      _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "failed to recreate device record after reset sync, %@", buf, 0xCu);
    }

    uint64_t v29 = *MEMORY[0x1E4F28A50];
    id v30 = v11;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3B8];
    uint64_t v25 = @"failed to recreate device record after reset sync";
    goto LABEL_20;
  }
  int v17 = [v15 isTemporaryID];
  id v18 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  id v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "objectID of freshly persisted device is temporary", buf, 2u);
    }

    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3B8];
    uint64_t v25 = @"objectID of freshly persisted device is temporary";
    uint64_t v22 = 0;
LABEL_20:
    id v26 = [v23 exceptionWithName:v24 reason:v25 userInfo:v22];
    objc_exception_throw(v26);
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)long long buf = v27.n128_u32[0];
    id v32 = v20;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "successfully re-persisted device after reset sync with MOID, %@", buf, 0xCu);
  }
}

- (BOOL)_purgeLocalEntityRowsUsingModel:(id)a3 managedObjectContext:(id)a4 persistenceManager:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v9)
  {
    id v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectModel", buf, 2u);
    }

    if (!a6) {
      goto LABEL_20;
    }
    id v19 = @"managedObjectModel";
    goto LABEL_19;
  }
  if (!v10)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }

    if (!a6) {
      goto LABEL_20;
    }
    id v19 = @"managedObjectContext";
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v19);
    BOOL v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v11)
  {
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    if (a6)
    {
      id v19 = @"persistenceManager";
      goto LABEL_19;
    }
LABEL_20:
    BOOL v17 = 0;
    goto LABEL_21;
  }
  id v13 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__RTPersistenceDriver__purgeLocalEntityRowsUsingModel_managedObjectContext_persistenceManager_error___block_invoke;
  v23[3] = &unk_1E6B92F80;
  id v24 = v12;
  id v25 = v10;
  id v14 = v13;
  id v26 = v14;
  [v25 performBlockAndWait:v23];
  id v15 = _RTSafeArray();
  BOOL v16 = _RTMultiErrorCreate();

  if (a6) {
    *a6 = v16;
  }
  BOOL v17 = v16 == 0;

LABEL_21:
  return v17;
}

void __101__RTPersistenceDriver__purgeLocalEntityRowsUsingModel_managedObjectContext_persistenceManager_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) latestModel];
  uint64_t v3 = [v2 entitiesForConfiguration:@"Cache"];
  __n128 v27 = v2;
  uint64_t v4 = [v2 entitiesForConfiguration:@"Local"];
  id v26 = (void *)v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  id v25 = (void *)v4;
  uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v4];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v13 = objc_alloc(MEMORY[0x1E4F1C0D0]);
        id v14 = [v12 name];
        id v15 = (void *)[v13 initWithEntityName:v14];

        BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v15];
        BOOL v17 = *(void **)(a1 + 40);
        id v28 = 0;
        id v18 = (id)[v17 executeRequest:v16 error:&v28];
        id v19 = v28;
        if (v19)
        {
          [*(id *)(a1 + 48) addObject:v19];
          uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
            goto LABEL_12;
          }
          id v21 = [v12 name];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v34 = v21;
          __int16 v35 = 2112;
          id v36 = v19;
          uint64_t v22 = v20;
          uint64_t v23 = "error batch deleting entity type during reset sync, %@, error, %@";
          uint32_t v24 = 22;
        }
        else
        {
          uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
            goto LABEL_12;
          }
          id v21 = [v12 name];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v34 = v21;
          uint64_t v22 = v20;
          uint64_t v23 = "batch deleting entity type during reset sync, %@";
          uint32_t v24 = 12;
        }
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);

LABEL_12:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v9);
  }
}

- (void)_updatePersistenceStoresWithDeviceObjectID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Updating stores with new device MOID %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v6 = [(RTPersistenceDriver *)self persistenceManager];
  uint64_t v7 = [v6 countOfPersistenceStores];

  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = [(RTPersistenceDriver *)self persistenceManager];
      uint64_t v10 = [v9 persistenceStoreForType:i];

      id v11 = [v10 userInfo];
      [v11 setObject:v4 forKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];
    }
  }
}

- (void)_updatePersistenceContexts:(id)a3 deviceObjectID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v22 = [v5 count];
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Updating %lu contexts with new device MOID %@", buf, 0x16u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __65__RTPersistenceDriver__updatePersistenceContexts_deviceObjectID___block_invoke;
        v14[3] = &unk_1E6B90BF0;
        v14[4] = v13;
        id v15 = v6;
        [v13 performBlockAndWait:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

void __65__RTPersistenceDriver__updatePersistenceContexts_deviceObjectID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) queryGenerationToken];
  uint64_t v3 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
  if (!v2 || ([v2 isEqual:v3] & 1) != 0) {
    goto LABEL_9;
  }
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    long long v19 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "updating query generation for MOC %@ to current generation", buf, 0xCu);
  }

  id v6 = *(void **)(a1 + 32);
  id v17 = 0;
  [v6 setQueryGenerationFromToken:v3 error:&v17];
  id v7 = v17;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v16 = [MEMORY[0x1E4F1C1A0] currentQueryGenerationToken];
      *(_DWORD *)long long buf = 138412546;
      long long v19 = v16;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "error while setting the query generation to the current generation (%@), %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_9:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      long long v19 = v11;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "updating MOC %@ with current device MOID, %@", buf, 0x16u);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) userInfo];
    [v14 setObject:v13 forKeyedSubscript:@"RTPersistenceDriverUserInfoDeviceMOIDKey"];

    id v15 = *(void **)(a1 + 32);
    id v8 = [v15 currentDevice];
    [v15 refreshObject:v8 mergeChanges:1];
  }
}

- (unint64_t)persistenceDeviceClassForPlatform
{
  uint64_t v3 = [(RTPersistenceDriver *)self currentPlatform];
  char v4 = [v3 iPhonePlatform];

  if (v4) {
    return 1;
  }
  id v6 = [(RTPersistenceDriver *)self currentPlatform];
  char v7 = [v6 watchPlatform];

  if (v7) {
    return 2;
  }
  id v8 = [(RTPersistenceDriver *)self currentPlatform];
  char v9 = [v8 macOSPlatform];

  if (v9) {
    return 4;
  }
  uint64_t v10 = [(RTPersistenceDriver *)self currentPlatform];
  char v11 = [v10 simulatorPlatform];

  if (v11) {
    return 8;
  }
  uint64_t v12 = [(RTPersistenceDriver *)self currentPlatform];
  int v13 = [v12 realityDevice];

  if (v13) {
    return 32;
  }
  else {
    return 0;
  }
}

- (void)persistenceMigrator:(id)a3 didStartMigratingStore:(id)a4 withModelProvider:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained persistenceDriver:self persistenceMigrator:v11 didStartMigratingStore:v8 withModelProvider:v9];
  }
}

- (void)persistenceMigrator:(id)a3 didFinishMigratingStore:(id)a4 withModelProvider:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained persistenceDriver:self persistenceMigrator:v11 didFinishMigratingStore:v8 withModelProvider:v9];
  }
}

- (BOOL)shouldResetCloudStore
{
  id v2 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsPersistenceShouldResetCloudStore"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setShouldResetCloudStore:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RTPersistenceDriver *)self defaultsManager];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"RTDefaultsPersistenceShouldResetCloudStore"];
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if (a3 != 3)
  {
    id v11 = v9;
    uint64_t v12 = [(RTPersistenceDriver *)self persistenceManager];
    int v13 = [v12 persistenceContextWithOptions:0];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__RTPersistenceDriver_performPurgeOfType_referenceDate_completion___block_invoke;
    v16[3] = &unk_1E6B917F0;
    void v16[4] = self;
    id v17 = v13;
    id v18 = v11;
    SEL v19 = a2;
    id v14 = v11;
    id v15 = v13;
    [v15 performBlockAndWait:v16];
  }
  if (v10) {
    v10[2](v10, 0);
  }
}

void __67__RTPersistenceDriver_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) persistenceManager];
  BOOL v3 = [v2 URLForStoreType:2];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v4 = [*(id *)(a1 + 40) persistentStoreCoordinator];
  id v5 = [v4 persistentStores];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
      id v11 = [v10 URL];
      char v12 = [v11 isEqual:v3];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_21;
    }
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138412290;
      long long v31 = v15;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "purging transaction history for the local store prior to %@", buf, 0xCu);
    }

    long long v16 = [MEMORY[0x1E4F1C160] deleteHistoryBeforeDate:*(void *)(a1 + 48)];
    id v34 = v13;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v16 setAffectedStores:v17];

    [v16 setResultType:2];
    id v18 = *(void **)(a1 + 40);
    id v25 = 0;
    SEL v19 = [v18 executeRequest:v16 error:&v25];
    id v20 = v25;
    id v21 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    uint64_t v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)long long buf = 138412546;
        long long v31 = v23;
        __int16 v32 = 2112;
        id v33 = v20;
        _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, encountered error purging transaction history for the local store, error, %@", buf, 0x16u);
LABEL_18:
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
      id v24 = [v19 result];
      *(_DWORD *)long long buf = 138412546;
      long long v31 = v23;
      __int16 v32 = 2112;
      id v33 = v24;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, purged %@ transaction history items in the local store", buf, 0x16u);

      goto LABEL_18;
    }

    goto LABEL_20;
  }
LABEL_9:
  id v13 = v5;
LABEL_20:

LABEL_21:
}

- (id)prepareForDatabaseRekey:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "preparing for database rekey", buf, 2u);
  }

  uint64_t v6 = [(RTPersistenceDriver *)self keychainManager];
  id v24 = 0;
  uint64_t v7 = [v6 encryptionKeyWithSize:0 identifier:@"com.apple.routined.security.database.rekey" error:&v24];
  id v8 = v24;

  if (v8)
  {
    uint64_t v9 = [v8 userInfo];
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v10)
    {
      if ([v10 code] == -25300)
      {

        goto LABEL_7;
      }
      id v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v8;
        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "error while checking to see if re-key key material already exists in database, %@", buf, 0xCu);
      }

      if (!a3)
      {
LABEL_27:
        long long v16 = 0;
        goto LABEL_31;
      }
    }
    else if (!a3)
    {
      goto LABEL_27;
    }
    id v14 = v8;
    goto LABEL_22;
  }
LABEL_7:
  if (v7)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "found pre-existing re-key data, attempting to remove it.", buf, 2u);
    }

    char v12 = [(RTPersistenceDriver *)self keychainManager];
    id v23 = 0;
    [v12 removeEncryptionKeyWithIdentifier:@"com.apple.routined.security.database.rekey" error:&v23];
    id v10 = v23;

    if (v10)
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "error while removing pre-existing re-key key from keychain, %@", buf, 0xCu);
      }

      if (a3)
      {
        id v14 = v10;
LABEL_22:
        id v19 = v14;
        long long v16 = 0;
        goto LABEL_23;
      }
      goto LABEL_27;
    }
  }
  id v15 = [(RTPersistenceDriver *)self keychainManager];
  id v22 = 0;
  long long v16 = [v15 createSymmetricKeyWithSize:0 identifier:@"com.apple.routined.security.database.rekey" storeInKeychain:1 error:&v22];
  id v10 = v22;

  id v17 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  id v18 = v17;
  if (v10)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "error while creating new re-key key, %@", buf, 0xCu);
    }

    if (a3)
    {
      id v19 = v10;
LABEL_23:
      *a3 = v19;
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "successfully generated re-key data", buf, 2u);
    }
  }
LABEL_31:

  return v16;
}

- (BOOL)importSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 managedObjectModel:(id)a7 configuration:(id)a8 error:(id *)a9
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = v20;
  if (!v15)
  {
    uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceStore", buf, 2u);
    }

    if (!a9) {
      goto LABEL_38;
    }
    long long v37 = @"sourceStore";
    goto LABEL_37;
  }
  if (!v16)
  {
    uint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceCoordinator", buf, 2u);
    }

    if (!a9) {
      goto LABEL_38;
    }
    long long v37 = @"sourceCoordinator";
    goto LABEL_37;
  }
  if (!v17)
  {
    id v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationStore", buf, 2u);
    }

    if (!a9) {
      goto LABEL_38;
    }
    long long v37 = @"destinationStore";
    goto LABEL_37;
  }
  if (!v18)
  {
    uint64_t v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationCoordinator", buf, 2u);
    }

    if (!a9) {
      goto LABEL_38;
    }
    long long v37 = @"destinationCoordinator";
    goto LABEL_37;
  }
  if (!v19)
  {
    uint64_t v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectModel", buf, 2u);
    }

    if (!a9) {
      goto LABEL_38;
    }
    long long v37 = @"managedObjectModel";
LABEL_37:
    _RTErrorInvalidParameterCreate((uint64_t)v37);
    BOOL v43 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if (!v20)
  {
    uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration", buf, 2u);
    }

    if (a9)
    {
      long long v37 = @"configuration";
      goto LABEL_37;
    }
LABEL_38:
    BOOL v43 = 0;
    goto LABEL_39;
  }
  id v66 = v19;
  id v67 = v20;
  id v22 = NSString;
  id v23 = (objc_class *)objc_opt_class();
  id v24 = NSStringFromClass(v23);
  id v25 = NSStringFromSelector(a2);
  id v26 = [v22 stringWithFormat:@"%@-%@", v24, v25];
  [v26 UTF8String];
  id v65 = (void *)os_transaction_create();

  uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v47 = (objc_class *)objc_opt_class();
    uint64_t v48 = NSStringFromClass(v47);
    long long v49 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412546;
    id v72 = v48;
    __int16 v73 = 2112;
    long long v74 = v49;
    _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  long long v28 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  id v19 = v66;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v63 = [v15 URL];
    __int16 v61 = [v63 path];
    uint64_t v60 = [v61 lastPathComponent];
    long long v29 = [v60 stringByDeletingPathExtension];
    uint64_t v58 = [v17 URL];
    long long v56 = [v58 path];
    long long v30 = [v56 lastPathComponent];
    long long v31 = [v30 stringByDeletingPathExtension];
    *(_DWORD *)long long buf = 138412546;
    id v72 = v29;
    __int16 v73 = 2112;
    long long v74 = v31;
    _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "preparing to import data from store, %@ to store, %@", buf, 0x16u);
  }
  __int16 v32 = [[RTPersistenceStoreImporter alloc] initWithManagedObjectModel:v66 configuration:v67 sourceStore:v15 sourceCoordinator:v16 destinationStore:v17 destinationCoordinator:v18];
  id v33 = objc_opt_new();
  id v70 = 0;
  uint64_t v64 = v32;
  BOOL v34 = [(RTPersistenceStoreImporter *)v32 import:&v70];
  id v35 = v70;
  int v62 = v35;
  if (v35)
  {
    [v33 addObject:v35];
  }
  else if (v34 && [v67 isEqualToString:@"Cloud"])
  {
    id v69 = 0;
    uint64_t v45 = [v15 retrieveMetadataWithCoordinator:v16 error:&v69];
    id v46 = v69;
    if (v46)
    {
      [v33 addObject:v46];
    }
    else
    {
      id v57 = (void *)[v45 mutableCopy];
      long long v50 = [v45 allKeys];
      uint64_t v51 = [v15 _validateKeys:v50];

      int v59 = (void *)v51;
      [v57 removeObjectsForKeys:v51];
      id v68 = 0;
      [v17 updateMetadata:v57 coordinator:v18 error:&v68];
      id v52 = v68;
      if (v52) {
        [v33 addObject:v52];
      }

      id v46 = 0;
    }
  }
  long long v53 = v33;
  long long v54 = _RTSafeArray();
  long long v55 = _RTMultiErrorCreate();

  if (a9) {
    *a9 = v55;
  }
  BOOL v43 = v55 == 0;

  id v21 = v67;
LABEL_39:

  return v43;
}

- (RTPersistenceManager)persistenceManager
{
  return (RTPersistenceManager *)objc_getProperty(self, a2, 40, 1);
}

- (RTDataProtectionManager)dataProtectionManager
{
  return (RTDataProtectionManager *)objc_getProperty(self, a2, 48, 1);
}

- (RTAccountManager)accountManager
{
  return (RTAccountManager *)objc_getProperty(self, a2, 56, 1);
}

- (RTPlatform)currentPlatform
{
  return (RTPlatform *)objc_getProperty(self, a2, 64, 1);
}

- (RTKeychainManager)keychainManager
{
  return (RTKeychainManager *)objc_getProperty(self, a2, 72, 1);
}

- (RTDefaultsManager)defaultsManager
{
  return (RTDefaultsManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTLifeCycleManager)lifecycleManager
{
  return (RTLifeCycleManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLifecycleManager:(id)a3
{
}

- (OS_os_transaction)setupTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSetupTransaction:(id)a3
{
}

- (BOOL)requiresDirtyTransaction
{
  return self->_requiresDirtyTransaction;
}

- (void)setRequiresDirtyTransaction:(BOOL)a3
{
  self->_requiresDirtyTransaction = a3;
}

- (BOOL)requiresSetupTransaction
{
  return self->_requiresSetupTransaction;
}

- (void)setRequiresSetupTransaction:(BOOL)a3
{
  self->_requiresSetupTransaction = a3;
}

- (int64_t)cloudSyncAuthorization
{
  return self->_cloudSyncAuthorization;
}

- (void)setCloudSyncAuthorization:(int64_t)a3
{
  self->_cloudSyncAuthorization = a3;
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (RTAccount)currentAccount
{
  return (RTAccount *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentAccount:(id)a3
{
}

- (RTPersistenceMetricsDelegate)metricsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);

  return (RTPersistenceMetricsDelegate *)WeakRetained;
}

- (void)setMetricsDelegate:(id)a3
{
}

- (RTPersistenceResetSyncContext)resetSyncContext
{
  return (RTPersistenceResetSyncContext *)objc_getProperty(self, a2, 136, 1);
}

- (void)setResetSyncContext:(id)a3
{
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return (RTDarwinNotificationHelper *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNotificationHelper:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTTimer)backgroundProcessingAssertionDeferralTimer
{
  return self->_backgroundProcessingAssertionDeferralTimer;
}

- (void)setBackgroundProcessingAssertionDeferralTimer:(id)a3
{
}

- (RTTimer)backgroundProcessingAssertionAcquireRetryTimer
{
  return self->_backgroundProcessingAssertionAcquireRetryTimer;
}

- (void)setBackgroundProcessingAssertionAcquireRetryTimer:(id)a3
{
}

- (unint64_t)backgroundAssertionRetryCount
{
  return self->_backgroundAssertionRetryCount;
}

- (void)setBackgroundAssertionRetryCount:(unint64_t)a3
{
  self->_backgroundAssertionRetryCount = a3;
}

- (NSMutableDictionary)fileDescriptorsForPersistenceStoreDict
{
  return self->_fileDescriptorsForPersistenceStoreDict;
}

- (void)setFileDescriptorsForPersistenceStoreDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileDescriptorsForPersistenceStoreDict, 0);
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionAcquireRetryTimer, 0);
  objc_storeStrong((id *)&self->_backgroundProcessingAssertionDeferralTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_resetSyncContext, 0);
  objc_destroyWeak((id *)&self->_metricsDelegate);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_setupTransaction, 0);
  objc_storeStrong((id *)&self->_lifecycleManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_currentPlatform, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);

  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

- (void)persistenceStore:(id)a3 didPrepareWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    char v12 = "Invalid parameter not satisfying: store";
LABEL_11:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)long long buf = 0;
    char v12 = "Invalid parameter not satisfying: context";
    goto LABEL_11;
  }
  uint64_t v9 = [v6 storeBaseName];
  char v10 = [v9 isEqualToString:@"Cloud-V2"];

  if ((v10 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__RTPersistenceDriver_Metrics__persistenceStore_didPrepareWithContext___block_invoke;
    v13[3] = &unk_1E6B90BF0;
    id v14 = v8;
    id v15 = self;
    [v14 performBlockAndWait:v13];
    id v11 = v14;
LABEL_8:
  }
}

void __71__RTPersistenceDriver_Metrics__persistenceStore_didPrepareWithContext___block_invoke(uint64_t a1)
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v2 = +[RTDeviceMO fetchRequest];
  [v2 setFetchBatchSize:10];
  BOOL v3 = *(void **)(a1 + 32);
  id v170 = 0;
  char v4 = [v3 executeFetchRequest:v2 error:&v170];
  id v5 = v170;
  if (!v5)
  {
    v122 = v2;
    uint64_t v126 = [MEMORY[0x1E4F1C9C8] date];
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    id v121 = v4;
    id obj = v4;
    uint64_t v125 = [obj countByEnumeratingWithState:&v166 objects:v173 count:16];
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    if (v125)
    {
      uint64_t v142 = 0;
      uint64_t v124 = *(void *)v167;
      id v8 = &off_1E6B8E000;
      uint64_t v9 = &off_1E6B8E000;
      do
      {
        uint64_t v10 = 0;
        do
        {
          uint64_t v140 = v7;
          if (*(void *)v167 != v124) {
            objc_enumerationMutation(obj);
          }
          uint64_t v136 = v10;
          id v11 = *(void **)(*((void *)&v166 + 1) + 8 * v10);
          context = (void *)MEMORY[0x1E016D870]();
          uint64_t v148 = [v11 creationDate];
          char v12 = (void *)MEMORY[0x1E4F28F60];
          v129 = v11;
          id v13 = [v11 identifier];
          uint64_t v14 = [v12 predicateWithFormat:@"%K.%K == %@", @"device", @"identifier", v13];

          id v15 = *(void **)(a1 + 40);
          id v16 = [v8[401] entity];
          uint64_t v17 = *(void *)(a1 + 32);
          uint64_t v165 = 0;
          id v18 = [v15 latestCloudManagedObjectWithEntityDescription:v16 predicate:v14 context:v17 error:&v165];

          id v19 = *(void **)(a1 + 40);
          id v20 = [v9[414] entity];
          uint64_t v21 = *(void *)(a1 + 32);
          uint64_t v164 = 0;
          id v22 = [v19 latestCloudManagedObjectWithEntityDescription:v20 predicate:v14 context:v21 error:&v164];

          id v23 = *(void **)(a1 + 40);
          id v24 = +[RTLearnedTransitionMO entity];
          uint64_t v25 = *(void *)(a1 + 32);
          id v163 = 0;
          id v26 = [v23 latestCloudManagedObjectWithEntityDescription:v24 predicate:v14 context:v25 error:&v163];
          id v27 = v163;

          v138 = v18;
          uint64_t v28 = [v18 creationDate];
          v137 = v22;
          uint64_t v29 = [v22 creationDate];
          uint64_t v135 = v26;
          uint64_t v30 = [v26 creationDate];
          long long v31 = objc_opt_new();
          __int16 v32 = v31;
          if (v28) {
            [v31 addObject:v28];
          }
          if (v29) {
            [v32 addObject:v29];
          }
          uint64_t v141 = v6;
          v146 = (void *)v29;
          v147 = (void *)v28;
          if (v30) {
            [v32 addObject:v30];
          }
          __int16 v145 = (void *)v30;
          [v32 sortUsingSelector:sel_compare_];
          v144 = [v32 lastObject];

          id v33 = *(void **)(a1 + 40);
          BOOL v34 = [v8[401] entity];
          uint64_t v35 = *(void *)(a1 + 32);
          uint64_t v162 = 0;
          uint64_t v36 = [v33 earliestCloudManagedObjectWithEntityDescription:v34 predicate:v14 context:v35 error:&v162];

          long long v37 = *(void **)(a1 + 40);
          uint64_t v38 = [v9[414] entity];
          uint64_t v39 = *(void *)(a1 + 32);
          uint64_t v161 = 0;
          uint64_t v40 = [v37 earliestCloudManagedObjectWithEntityDescription:v38 predicate:v14 context:v39 error:&v161];

          uint64_t v41 = *(void **)(a1 + 40);
          uint64_t v42 = +[RTLearnedTransitionMO entity];
          uint64_t v43 = *(void *)(a1 + 32);
          id v160 = 0;
          uint64_t v44 = (void *)v14;
          uint64_t v45 = [v41 earliestCloudManagedObjectWithEntityDescription:v42 predicate:v14 context:v43 error:&v160];
          id v46 = v160;

          long long v133 = v36;
          uint64_t v47 = [v36 creationDate];
          long long v132 = v40;
          uint64_t v48 = [v40 creationDate];
          long long v131 = v45;
          long long v49 = [v45 creationDate];
          long long v50 = objc_opt_new();
          uint64_t v51 = v50;
          if (v47) {
            [v50 addObject:v47];
          }
          id v130 = (void *)v47;
          if (v48) {
            [v51 addObject:v48];
          }
          v128 = (void *)v48;
          long long v134 = v32;
          id v52 = v44;
          if (v49) {
            [v51 addObject:v49];
          }
          [v51 sortUsingSelector:sel_compare_];
          id v127 = [v51 firstObject];

          long long v53 = *(void **)(a1 + 40);
          long long v54 = [v8[401] entity];
          uint64_t v55 = *(void *)(a1 + 32);
          uint64_t v159 = 0;
          uint64_t v143 = [v53 countOfCloudManagedObjectWithEntityDescription:v54 predicate:v44 context:v55 error:&v159];

          long long v56 = *(void **)(a1 + 40);
          id v57 = +[RTLearnedVisitMO entity];
          uint64_t v58 = *(void *)(a1 + 32);
          uint64_t v158 = 0;
          uint64_t v59 = [v56 countOfCloudManagedObjectWithEntityDescription:v57 predicate:v44 context:v58 error:&v158];

          uint64_t v60 = *(void **)(a1 + 40);
          __int16 v61 = +[RTLearnedTransitionMO entity];
          uint64_t v62 = *(void *)(a1 + 32);
          id v157 = 0;
          uint64_t v63 = [v60 countOfCloudManagedObjectWithEntityDescription:v61 predicate:v52 context:v62 error:&v157];
          id v64 = v157;

          id v65 = objc_opt_new();
          id v66 = NSNumber;
          double v67 = -1.0;
          double v68 = -1.0;
          if (v148) {
            [v126 timeIntervalSinceDate:v148];
          }
          id v69 = [v66 numberWithDouble:v68];
          [v65 setObject:v69 forKeyedSubscript:@"deviceAge"];

          id v70 = [NSNumber numberWithUnsignedInteger:v143];
          [v65 setObject:v70 forKeyedSubscript:@"devicePlaceCount"];

          long long v71 = [NSNumber numberWithUnsignedInteger:v59];
          [v65 setObject:v71 forKeyedSubscript:@"deviceVisitCount"];

          id v72 = [NSNumber numberWithUnsignedInteger:v63];
          [v65 setObject:v72 forKeyedSubscript:@"deviceTransitionCount"];

          __int16 v73 = [v129 deviceClass];

          [v65 setObject:v73 forKeyedSubscript:@"deviceClass"];
          long long v74 = NSNumber;
          if (v147)
          {
            [v126 timeIntervalSinceDate:x0];
            double v67 = v75;
          }
          long long v76 = [v74 numberWithDouble:v67];
          [v65 setObject:v76 forKeyedSubscript:@"deviceLastPlaceAge"];

          uint64_t v77 = NSNumber;
          double v78 = -1.0;
          double v79 = -1.0;
          if (v146) {
            [v126 timeIntervalSinceDate:-1.0];
          }
          int v80 = [v77 numberWithDouble:v79];
          [v65 setObject:v80 forKeyedSubscript:@"deviceLastVisitAge"];

          int v81 = NSNumber;
          if (v145)
          {
            [v126 timeIntervalSinceDate:v145];
            double v78 = v82;
          }
          id v83 = [v81 numberWithDouble:v78];
          [v65 setObject:v83 forKeyedSubscript:@"deviceLastTransitionAge"];

          __int16 v84 = NSNumber;
          double v85 = -1.0;
          double v86 = -1.0;
          if (v144) {
            [v126 timeIntervalSinceDate:-1.0];
          }
          uint64_t v87 = [v84 numberWithDouble:v86];
          [v65 setObject:v87 forKeyedSubscript:@"ageOfMostRecentRecord"];

          id v88 = NSNumber;
          if (v127)
          {
            [v126 timeIntervalSinceDate:v127];
            double v85 = v89;
          }
          v142 += v143;
          uint64_t v7 = v59 + v140;
          uint64_t v6 = v63 + v141;
          int v90 = [v88 numberWithDouble:v85];
          [v65 setObject:v90 forKeyedSubscript:@"ageOfOldestRecord"];

          id v91 = [NSString alloc];
          v92 = (void *)[v91 initWithCString:RTAnalyticsEventPersistenceMirroringDeviceProfile encoding:1];
          log_analytics_submission(v92, v65);
          v93 = [NSString stringWithFormat:@"com.apple.%@", v92];
          AnalyticsSendEvent();

          uint64_t v10 = v136 + 1;
          id v8 = &off_1E6B8E000;
          uint64_t v9 = &off_1E6B8E000;
        }
        while (v125 != v136 + 1);
        uint64_t v125 = [obj countByEnumeratingWithState:&v166 objects:v173 count:16];
      }
      while (v125);
    }
    else
    {
      uint64_t v142 = 0;
    }

    uint64_t v94 = objc_opt_new();
    v95 = [NSNumber numberWithUnsignedInteger:v142];
    [v94 setObject:v95 forKeyedSubscript:@"totalPlaceCount"];

    v96 = [NSNumber numberWithUnsignedInteger:v7];
    [v94 setObject:v96 forKeyedSubscript:@"totalVisitCount"];

    v97 = [NSNumber numberWithUnsignedInteger:v6];
    [v94 setObject:v97 forKeyedSubscript:@"totalTransitionCount"];

    v98 = objc_opt_new();
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v99 = obj;
    uint64_t v100 = [v99 countByEnumeratingWithState:&v153 objects:v172 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v154;
      do
      {
        for (uint64_t i = 0; i != v101; ++i)
        {
          if (*(void *)v154 != v102) {
            objc_enumerationMutation(v99);
          }
          uint64_t v104 = [*(id *)(*((void *)&v153 + 1) + 8 * i) deviceClass];
          v105 = (void *)v104;
          if (v104) {
            v106 = (__CFString *)v104;
          }
          else {
            v106 = @"Unknown";
          }
          uint64_t v107 = v106;

          id v108 = [v98 objectForKeyedSubscript:v107];
          BOOL v109 = [NSNumber numberWithUnsignedInteger:objc_msgSend(v108, "unsignedIntegerValue") + 1];
          [v98 setObject:v109 forKeyedSubscript:v107];
        }
        uint64_t v101 = [v99 countByEnumeratingWithState:&v153 objects:v172 count:16];
      }
      while (v101);
    }

    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    v110 = [v98 allKeys];
    uint64_t v111 = [v110 countByEnumeratingWithState:&v149 objects:v171 count:16];
    if (v111)
    {
      uint64_t v112 = v111;
      uint64_t v113 = *(void *)v150;
      do
      {
        for (uint64_t j = 0; j != v112; ++j)
        {
          if (*(void *)v150 != v113) {
            objc_enumerationMutation(v110);
          }
          uint64_t v115 = *(void *)(*((void *)&v149 + 1) + 8 * j);
          v116 = [NSString stringWithFormat:@"%@_%@", @"countInDeviceClass", v115];
          if (v116)
          {
            v117 = [v98 objectForKeyedSubscript:v115];
            [v94 setObject:v117 forKeyedSubscript:v116];
          }
        }
        uint64_t v112 = [v110 countByEnumeratingWithState:&v149 objects:v171 count:16];
      }
      while (v112);
    }

    id v118 = [NSString alloc];
    id v119 = (void *)[v118 initWithCString:RTAnalyticsEventPersistenceMirroringAccountProfile encoding:1];
    log_analytics_submission(v119, v94);
    v120 = [NSString stringWithFormat:@"com.apple.%@", v119];
    AnalyticsSendEvent();

    char v4 = v121;
    id v2 = v122;
    id v5 = 0;
  }
}

- (unint64_t)countOfCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = v11;
  if (!v9)
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a6)
    {
      id v15 = @"entityDescription";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v15);
      unint64_t v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    unint64_t v13 = 0;
    goto LABEL_16;
  }
  if (!v11)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      id v15 = @"context";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  *(void *)long long buf = 0;
  uint64_t v25 = buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__75;
  uint64_t v28 = __Block_byref_object_dispose__75;
  id v29 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __103__RTPersistenceDriver_Metrics__countOfCloudManagedObjectWithEntityDescription_predicate_context_error___block_invoke;
  v18[3] = &unk_1E6B947E8;
  id v19 = v9;
  id v20 = v10;
  id v22 = &v30;
  id v21 = v12;
  id v23 = buf;
  [v21 performBlockAndWait:v18];
  if (a6) {
    *a6 = *((id *)v25 + 5);
  }
  unint64_t v13 = v31[3];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v30, 8);
LABEL_16:

  return v13;
}

void __103__RTPersistenceDriver_Metrics__countOfCloudManagedObjectWithEntityDescription_predicate_context_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  BOOL v3 = [*(id *)(a1 + 32) name];
  char v4 = (void *)[v2 initWithEntityName:v3];

  [v4 setPredicate:*(void *)(a1 + 40)];
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v5 countForFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
}

- (id)latestCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = (void *)MEMORY[0x1E4F29008];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 sortDescriptorWithKey:@"creationDate" ascending:0];
  v18[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v16 = [(RTPersistenceDriver *)self cloudManagedObjectWithEntityDescription:v13 predicate:v12 sortDescriptors:v15 context:v11 error:a6];

  return v16;
}

- (id)earliestCloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = (void *)MEMORY[0x1E4F29008];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 sortDescriptorWithKey:@"creationDate" ascending:1];
  v18[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v16 = [(RTPersistenceDriver *)self cloudManagedObjectWithEntityDescription:v13 predicate:v12 sortDescriptors:v15 context:v11 error:a6];

  return v16;
}

- (id)cloudManagedObjectWithEntityDescription:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 context:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (!v11)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a7)
    {
      id v18 = @"entityDescription";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v18);
      id v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    id v16 = 0;
    goto LABEL_16;
  }
  if (!v14)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a7)
    {
      id v18 = @"context";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(void *)long long buf = 0;
  uint64_t v35 = buf;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__75;
  uint64_t v38 = __Block_byref_object_dispose__75;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__75;
  uint64_t v32 = __Block_byref_object_dispose__75;
  id v33 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __112__RTPersistenceDriver_Metrics__cloudManagedObjectWithEntityDescription_predicate_sortDescriptors_context_error___block_invoke;
  v21[3] = &unk_1E6B971E8;
  id v22 = v11;
  id v23 = v13;
  id v24 = v12;
  id v25 = v15;
  uint64_t v26 = &v28;
  id v27 = buf;
  [v25 performBlockAndWait:v21];
  if (a7) {
    *a7 = (id) v29[5];
  }
  id v16 = *((id *)v35 + 5);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:

  return v16;
}

void __112__RTPersistenceDriver_Metrics__cloudManagedObjectWithEntityDescription_predicate_sortDescriptors_context_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  BOOL v3 = [*(id *)(a1 + 32) name];
  char v4 = (void *)[v2 initWithEntityName:v3];

  [v4 setSortDescriptors:*(void *)(a1 + 40)];
  [v4 setFetchLimit:1];
  [v4 setPredicate:*(void *)(a1 + 48)];
  id v5 = *(void **)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v5 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)persistenceStoreFailedWithError:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v11 = (id)[[v3 alloc] initWithCapacity:1];
  id v5 = NSNumber;
  uint64_t v6 = [v4 code];

  uint64_t v7 = [v5 numberWithInteger:v6];
  [v11 setObject:v7 forKeyedSubscript:@"reason"];
  id v8 = [NSString alloc];
  uint64_t v9 = (void *)[v8 initWithCString:RTAnalyticsEventPersistenceStoreDestruction encoding:1];
  log_analytics_submission(v9, v11);
  id v10 = [NSString stringWithFormat:@"com.apple.%@", v9];
  AnalyticsSendEvent();
}

- (void)persistenceStoreResetSyncWithUserInfo:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v12 = (id)[[v3 alloc] initWithCapacity:2];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1BDA0]];
  uint64_t v6 = NSNumber;
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  id v8 = [v6 numberWithInteger:[v7 code]];

  [v12 setObject:v5 forKeyedSubscript:@"reason"];
  [v12 setObject:v8 forKeyedSubscript:@"code"];
  id v9 = [NSString alloc];
  id v10 = (void *)[v9 initWithCString:RTAnalyticsEventPersistenceMirroringResetSync encoding:1];
  log_analytics_submission(v10, v12);
  id v11 = [NSString stringWithFormat:@"com.apple.%@", v10];
  AnalyticsSendEvent();
}

- (void)persistenceDriver:(id)a3 persistenceMigrator:(id)a4 didStartMigratingStore:(id)a5 withModelProvider:(id)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    int v9 = 138412290;
    id v10 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)persistenceDriver:(id)a3 persistenceMigrator:(id)a4 didFinishMigratingStore:(id)a5 withModelProvider:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = (void *)[[v8 alloc] initWithCapacity:5];
  uint64_t v11 = NSNumber;
  id v12 = [v9 migrationEndDate];
  id v13 = [v9 migrationStartDate];
  [v12 timeIntervalSinceDate:v13];
  id v33 = [v11 numberWithDouble:];

  id v14 = NSNumber;
  id v15 = [v7 URL];
  uint64_t v32 = [v14 numberWithUnsignedInteger:+[RTPersistenceManager storeTypeForURL:](RTPersistenceManager, "storeTypeForURL:", v15)];

  long long v31 = [[NSNumber numberWithBool:[v9 didVacuumStore]];
  id v16 = NSNumber;
  uint64_t v17 = [v9 status];

  uint64_t v30 = [v16 numberWithUnsignedInteger:v17];
  id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v34 = v7;
  id v19 = [v7 URL];
  id v20 = [v19 path];
  id v35 = 0;
  id v21 = [v18 attributesOfItemAtPath:v20 error:&v35];
  id v22 = v35;

  if (v21)
  {
    id v23 = [NSNumber numberWithUnsignedLongLong:[v21 fileSize]];
  }
  else
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = [v34 URL];
      id v29 = [v28 path];
      *(_DWORD *)long long buf = 138412546;
      long long v37 = v29;
      __int16 v38 = 2112;
      id v39 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "error fetching file attributes for store, %@, error, %@", buf, 0x16u);
    }
    id v23 = &unk_1F3451308;
  }
  [v10 setObject:v33 forKeyedSubscript:@"migrationDuration"];
  [v10 setObject:v32 forKeyedSubscript:@"storeType"];
  [v10 setObject:v31 forKeyedSubscript:@"didVacuum"];
  [v10 setObject:v23 forKeyedSubscript:@"storeSize"];
  [v10 setObject:v30 forKeyedSubscript:@"migrationStatus"];
  id v25 = [NSString alloc];
  uint64_t v26 = (void *)[v25 initWithCString:RTAnalyticsEventPersistenceStoreMigration encoding:1];
  log_analytics_submission(v26, v10);
  id v27 = [NSString stringWithFormat:@"com.apple.%@", v26];
  AnalyticsSendEvent();
}

- (void)onDailyMetricsNotification:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  char v6 = [v5 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if ((v6 & 1) == 0)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v31 = [v4 name];
      *(_DWORD *)long long buf = 138412802;
      BOOL v34 = v31;
      __int16 v35 = 2080;
      uint64_t v36 = "-[RTPersistenceDriver(Metrics) onDailyMetricsNotification:]";
      __int16 v37 = 1024;
      int v38 = 382;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
  id v8 = [v4 name];
  char v9 = [v8 isEqualToString:@"RTMetricManagerDailyMetricNotification"];

  if (v9)
  {
    id v10 = objc_opt_new();
    int64_t v11 = [(RTPersistenceDriver *)self cloudSyncAuthorization];
    uint64_t v12 = MEMORY[0x1E4F1CC28];
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    if (v11 == 2) {
      uint64_t v14 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F1CC28];
    }
    [v10 setObject:v14 forKeyedSubscript:@"cloudSyncAuthorization"];
    id v15 = [(RTPersistenceDriver *)self currentAccount];

    if (v15) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = v12;
    }
    [v10 setObject:v16 forKeyedSubscript:@"iCloudAccountPresent"];
    uint64_t v17 = [(RTPersistenceDriver *)self defaultsManager];
    id v18 = [v17 objectForKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate"];

    id v19 = [(RTPersistenceDriver *)self defaultsManager];
    id v20 = [v19 objectForKey:@"RTDefaultsPersistenceMirroringManagerBackgroundLastExportDate"];

    id v21 = [MEMORY[0x1E4F1C9C8] date];
    [v21 timeIntervalSinceDate:v18];
    double v23 = v22;
    [v21 timeIntervalSinceDate:v20];
    double v25 = v24;
    uint64_t v26 = [NSNumber numberWithDouble:v23];
    [v10 setObject:v26 forKeyedSubscript:@"durationSinceLastImport"];

    id v27 = [NSNumber numberWithDouble:v25];
    [v10 setObject:v27 forKeyedSubscript:@"durationSinceLastExport"];

    id v28 = [NSString alloc];
    id v29 = (void *)[v28 initWithCString:RTAnalyticsEventPersistenceMirroringEngagement encoding:1];
    log_analytics_submission(v29, v10);
    uint64_t v30 = [NSString stringWithFormat:@"com.apple.%@", v29];
    AnalyticsSendEvent();
  }
  else
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = [v4 name];
      *(_DWORD *)long long buf = 138412290;
      BOOL v34 = v32;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
    }
  }
}

@end