@interface STScreenTimeOrganizationController
+ (id)keyPathsForValuesAffectingScreenTimeEnabled;
+ (id)keyPathsForValuesAffectingScreenTimeSyncingEnabled;
- (BOOL)authenticateRestrictionsPasscode:(id)a3 error:(id *)a4;
- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3;
- (BOOL)createMandatoryEntitiesIfNeeded;
- (BOOL)didReadLocalPasscode;
- (BOOL)isScreenTimeEnabled;
- (BOOL)isScreenTimeSyncingEnabled;
- (BOOL)resetAllLocalScreenTimeSettings;
- (BOOL)shouldRequestMoreTime;
- (NPSManager)watchSyncManager;
- (NSFetchedResultsController)blueprintsResultsController;
- (NSFetchedResultsController)configurationsResultsController;
- (NSFetchedResultsController)downtimeOverridesResultsController;
- (NSFetchedResultsController)organizationSettingsResultsController;
- (NSFetchedResultsController)schedulesResultsController;
- (NSFetchedResultsController)settingsResultsController;
- (NSFetchedResultsController)usageLimitsResultsController;
- (NSOperationQueue)operationQueue;
- (NSUserDefaults)userDefaults;
- (STAccountNotifying)accountNotifier;
- (STAccountStateMonitor)accountMonitor;
- (STAppMonitor)appMonitor;
- (STAppMonitorStatus)appMonitorStatus;
- (STAskForTimeManager)askForTimeManager;
- (STConcreteOrganizationControllerConfigurationAdapter)configurationAdapter;
- (STDebouncer)blueprintDebouncer;
- (STDebouncer)deviceStateDebouncer;
- (STFamilyOrganizationController)familyOrganizationController;
- (STMirroringMonitor)mirroringMonitor;
- (STOrganizationControllerConfigurationAdapter)adapter;
- (STPersistenceControllerProtocol)persistenceController;
- (STRequestManager)requestManager;
- (STScreenTimeCapabilities)capabilities;
- (STScreenTimeOrganizationController)initWithPersistenceController:(id)a3 askForTimeManager:(id)a4 mirroringMonitor:(id)a5 accountNotifier:(id)a6 capabilities:(id)a7;
- (STUsageManager)usageManager;
- (STXPCEventObserver)deviceRenameEventObserver;
- (STXPCEventObserver)keychainUnlockEventObserver;
- (id)_doesNotHaveOneMoreMinuteBlueprintPassingTest:(id)a3 error:(id *)a4;
- (id)accessLock;
- (id)getIsExplicitContentRestrictedAndReturnError:(id *)a3;
- (id)getIsRestrictionsPasscodeSetAndReturnError:(id *)a3;
- (id)getIsWebContentRestrictedAndReturnError:(id *)a3;
- (id)getNeedsToSetRestrictionsPasscodeAndReturnError:(id *)a3;
- (id)getPrimaryiCloudCardDAVAccountIdentifierWithError:(id *)a3;
- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4;
- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4;
- (void)_applyDefaultUserPoliciesWithCompletionHandler:(id)a3;
- (void)_applyImageGenerationRestrictionIfNeeded;
- (void)_didFailDMRegistration:(id)a3;
- (void)_startObservingManagedConfigurationEffectiveSettings;
- (void)_updateScreenTimeSettingsFromManagedConfigurationEffectiveSettingsWithScreenTimeSettings:(id)a3;
- (void)accountDidUpdateToState:(id)a3 initializing:(BOOL)a4;
- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3;
- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)attemptToAutomaticallyEnableScreenTimeSyncing;
- (void)cleanOrphanedDatabaseEntities;
- (void)clearNeedsUpdatePasscode;
- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4;
- (void)communicationPoliciesWithCompletionHandler:(id)a3;
- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4;
- (void)controllerDidChangeContent:(id)a3;
- (void)debouncer:(id)a3 didDebounce:(id)a4;
- (void)deleteAllLocalScreenTimeSettings;
- (void)deleteLocalUserBlueprintsFromManagedConfigurationEffectiveSettings;
- (void)didDisableCloudSync;
- (void)didDisableScreenTime;
- (void)didEnableCloudSync;
- (void)didEnableManagement;
- (void)didEnableScreenTime:(BOOL)a3;
- (void)didJoinFamily:(id)a3;
- (void)didLeaveFamily;
- (void)didReceiveBlueprintPayload:(id)a3;
- (void)didSignInToCloud:(id)a3;
- (void)didSignOutOfCloud:(id)a3;
- (void)didUpdateFamily:(id)a3;
- (void)enableRemoteManagementForDSID:(id)a3 completionHandler:(id)a4;
- (void)enableScreenTimeForDSID:(id)a3 completionHandler:(id)a4;
- (void)enableWebContentFilterWithCompletionHandler:(id)a3;
- (void)fetchMirroringMonitorStatusWithCompletionHandler:(id)a3;
- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4;
- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4;
- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)migrateLegacyRestrictionsIfNeededWithMCXSettings:(id)a3 completionHandler:(id)a4;
- (void)migrateOldDefaultsIfNeeded;
- (void)performCloudSync:(id)a3;
- (void)performMigrationFromMCXSettings:(id)a3 completionHandler:(id)a4;
- (void)performWeeklyRollupWithCompletionHandler:(id)a3;
- (void)permitWebFilterURL:(id)a3 pageTitle:(id)a4 completionHandler:(id)a5;
- (void)postOrRemoveAppAndWebsiteActivityEnabledNotification:(BOOL)a3;
- (void)processBlueprintChangesInstallOnly:(BOOL)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)requestManager:(id)a3 didPrepareBlueprintPayloads:(id)a4;
- (void)requestManager:(id)a3 didPrepareRequestPayloads:(id)a4 reason:(id)a5;
- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3;
- (void)resume;
- (void)rollupUsageDataWithCompletionHandler:(id)a3;
- (void)scheduleAppMonitorAppDiscovery;
- (void)setAccountMonitor:(id)a3;
- (void)setAccountNotifier:(id)a3;
- (void)setAppAndWebsiteActivityEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setAppMonitor:(id)a3;
- (void)setBlueprintDebouncer:(id)a3;
- (void)setBlueprintsResultsController:(id)a3;
- (void)setConfigurationsResultsController:(id)a3;
- (void)setContactManagementState:(int64_t)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setDeviceStateDebouncer:(id)a3;
- (void)setDidReadLocalPasscode:(BOOL)a3;
- (void)setDowntimeOverridesResultsController:(id)a3;
- (void)setFamilyOrganizationController:(id)a3;
- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setMirroringMonitor:(id)a3;
- (void)setNeedsUpdatePasscode;
- (void)setOrganizationSettingsResultsController:(id)a3;
- (void)setRequestManager:(id)a3;
- (void)setResetAllLocalScreenTimeSettings:(BOOL)a3;
- (void)setRestrictionsPasscode:(id)a3 error:(id *)a4;
- (void)setSchedulesResultsController:(id)a3;
- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setSettingsResultsController:(id)a3;
- (void)setUsageLimitsResultsController:(id)a3;
- (void)setUsageManager:(id)a3;
- (void)startMonitoringAccountChanges;
- (void)startObservingBlueprints;
- (void)startObservingOrganizationSettings;
- (void)startObservingScreenTimeSettings;
- (void)startupCloud;
- (void)startupCloudSync;
- (void)startupFamily:(id)a3;
- (void)startupScreenTime:(BOOL)a3;
- (void)stopObservingBlueprints;
- (void)stopObservingOrganizationSettings;
- (void)stopObservingScreenTimeSettings;
- (void)triggerDowngradeMigrationWithCompletionHandler:(id)a3;
- (void)updateDeviceName;
- (void)updateEffectiveDeviceState:(BOOL)a3;
@end

@implementation STScreenTimeOrganizationController

- (void)communicationPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100267140();
  }

  v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v7 = [v6 hasStoreLoaded];

  if (v7)
  {
    v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v9 = [v8 newBackgroundContext];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000405C;
    v11[3] = &unk_1002FCB48;
    id v12 = v9;
    id v13 = v4;
    id v10 = v9;
    [v10 performBlockAndWait:v11];
  }
  else
  {
    id v10 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v10);
  }
}

- (id)getIsRestrictionsPasscodeSetAndReturnError:(id *)a3
{
  v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking for a restrictions passcode", buf, 2u);
  }

  *(void *)buf = 0;
  v26 = buf;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100082268;
  v29 = sub_100082278;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100082268;
  v23 = sub_100082278;
  id v24 = 0;
  v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v7 = [v6 hasStoreLoaded];

  if (v7)
  {
    v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v9 = [v8 newBackgroundContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100004434;
    v15[3] = &unk_1002FE298;
    id v10 = v9;
    id v16 = v10;
    v17 = &v19;
    v18 = buf;
    [v10 performBlockAndWait:v15];
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v10 = (id)v20[5];
    v20[5] = v11;
  }

  id v12 = (void *)*((void *)v26 + 5);
  if (a3 && !v12)
  {
    *a3 = (id) v20[5];
    id v12 = (void *)*((void *)v26 + 5);
  }
  id v13 = v12;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (STScreenTimeOrganizationController)initWithPersistenceController:(id)a3 askForTimeManager:(id)a4 mirroringMonitor:(id)a5 accountNotifier:(id)a6 capabilities:(id)a7
{
  id v50 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v56.receiver = self;
  v56.super_class = (Class)STScreenTimeOrganizationController;
  v17 = [(STScreenTimeOrganizationController *)&v56 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_persistenceController, a3);
    uint64_t v19 = +[NSOperationQueue mainQueue];
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = (NSOperationQueue *)v19;

    uint64_t v21 = objc_opt_new();
    id accessLock = v18->_accessLock;
    v18->_id accessLock = (id)v21;

    objc_storeStrong((id *)&v18->_askForTimeManager, a4);
    objc_storeStrong((id *)&v18->_mirroringMonitor, a5);
    objc_storeStrong((id *)&v18->_accountNotifier, a6);
    objc_storeStrong((id *)&v18->_capabilities, a7);
    v23 = (STDebouncer *)[objc_alloc((Class)STDebouncer) initWithMinCoalescenceInterval:5.0 maxCoalescenceInterval:5.0];
    blueprintDebouncer = v18->_blueprintDebouncer;
    v18->_blueprintDebouncer = v23;

    [(STDebouncer *)v18->_blueprintDebouncer setDelegate:v18];
    v25 = (STDebouncer *)[objc_alloc((Class)STDebouncer) initWithMinCoalescenceInterval:5.0 maxCoalescenceInterval:5.0];
    deviceStateDebouncer = v18->_deviceStateDebouncer;
    v18->_deviceStateDebouncer = v25;

    [(STDebouncer *)v18->_deviceStateDebouncer setDelegate:v18];
    uint64_t v27 = [STRequestManager alloc];
    uint64_t v28 = STOrganizationIdentifierScreenTime;
    v29 = [(STScreenTimeOrganizationController *)v18 persistenceController];
    id v30 = [(STRequestManager *)v27 initWithOrganizationIdentifier:v28 persistenceController:v29];
    requestManager = v18->_requestManager;
    v18->_requestManager = v30;

    [(STRequestManager *)v18->_requestManager setDelegate:v18];
    v32 = [STFamilySettingsManager alloc];
    capabilities = v18->_capabilities;
    v34 = [(STScreenTimeOrganizationController *)v18 persistenceController];
    v35 = [(STFamilySettingsManager *)v32 initWithCapabilities:capabilities persistenceController:v34];

    v36 = [STConcreteOrganizationControllerConfigurationAdapter alloc];
    v37 = v18->_requestManager;
    v38 = [(STPersistenceControllerProtocol *)v18->_persistenceController persistentContainer];
    v39 = [(STConcreteOrganizationControllerConfigurationAdapter *)v36 initWithFamilySettingsManager:v35 requestManager:v37 persistentContainer:v38];
    configurationAdapter = v18->_configurationAdapter;
    v18->_configurationAdapter = v39;

    objc_initWeak(&location, v18);
    v41 = +[STXPCEventDispatcher notifydEventDispatcher];
    uint64_t v42 = [v41 registerObserverWithIdentifier:@"Restrictions Passcode Update Keychain Unlock Observer"];
    keychainUnlockEventObserver = v18->_keychainUnlockEventObserver;
    v18->_keychainUnlockEventObserver = (STXPCEventObserver *)v42;

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000781DC;
    v53[3] = &unk_1002FD1F0;
    objc_copyWeak(&v54, &location);
    [(STXPCEventObserver *)v18->_keychainUnlockEventObserver setHandler:v53];
    v44 = +[STXPCEventDispatcher notifydEventDispatcher];
    uint64_t v45 = [v44 registerObserverWithIdentifier:@"com.apple.mobile.lockdown.device_name_changed"];
    deviceRenameEventObserver = v18->_deviceRenameEventObserver;
    v18->_deviceRenameEventObserver = (STXPCEventObserver *)v45;

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100078250;
    v51[3] = &unk_1002FD1F0;
    objc_copyWeak(&v52, &location);
    [(STXPCEventObserver *)v18->_deviceRenameEventObserver setHandler:v51];
    uint64_t v47 = objc_opt_new();
    watchSyncManager = v18->_watchSyncManager;
    v18->_watchSyncManager = (NPSManager *)v47;

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }
  return v18;
}

- (STOrganizationControllerConfigurationAdapter)adapter
{
  return (STOrganizationControllerConfigurationAdapter *)[(STScreenTimeOrganizationController *)self configurationAdapter];
}

- (void)resume
{
  v3 = +[STLog checkpoint];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(STScreenTimeOrganizationController *)self capabilities];
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ScreenTimeOrganizationController resuming with capabilities: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  v5 = _os_activity_create((void *)&_mh_execute_header, "Resuming screen time organization controller", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v5, &buf);
  v6 = (void *)os_transaction_create();
  [(STScreenTimeOrganizationController *)self migrateOldDefaultsIfNeeded];
  if ([(STScreenTimeOrganizationController *)self createMandatoryEntitiesIfNeeded])
  {
    unsigned __int8 v7 = objc_opt_new();
    [v7 setOrganizationIdentifier:STOrganizationIdentifierScreenTime];
    [v7 setOrganizationDisplayName:@"ScreenTime Management"];
    [v7 setOrganizationType:DMFConfigurationOrganizationTypeScreenTime];
    v8 = +[DMFConnection systemConnection];
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_100078628;
    v17 = &unk_1002FE070;
    v18 = self;
    id v19 = v6;
    [v8 performRequest:v7 completion:&v14];

    id v9 = [(STScreenTimeOrganizationController *)self capabilities];
    unsigned __int8 v10 = [v9 supportedInfrastructure];

    if (v10)
    {
      [(STScreenTimeOrganizationController *)self startMonitoringAccountChanges];
    }
    else if ((v10 & 2) != 0)
    {
      [(STScreenTimeOrganizationController *)self applyDefaultUserPoliciesWithCompletionHandler:&stru_1002FE090];
    }
    [(STScreenTimeOrganizationController *)self startObservingScreenTimeSettings];
    [(STScreenTimeOrganizationController *)self startObservingOrganizationSettings];
    if (_os_feature_enabled_impl() && _os_feature_enabled_impl()) {
      [(STScreenTimeOrganizationController *)self _applyImageGenerationRestrictionIfNeeded];
    }
    [(STScreenTimeOrganizationController *)self startObservingBlueprints];
    [(STScreenTimeOrganizationController *)self cleanOrphanedDatabaseEntities];
    [(STScreenTimeOrganizationController *)self updateDeviceName];
    [(STScreenTimeOrganizationController *)self _startObservingManagedConfigurationEffectiveSettings];
    [(STScreenTimeOrganizationController *)self updateEffectiveDeviceState:1];
    uint64_t v11 = +[STLog checkpoint];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      *(_DWORD *)v20 = 138543362;
      uint64_t v21 = v12;
      id v13 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: resumed", v20, 0xCu);
    }
  }

  os_activity_scope_leave(&buf);
}

- (void)startupScreenTime:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[STLog checkpoint];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v26 = (id)objc_opt_class();
    id v6 = v26;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting Screen Time", buf, 0xCu);
  }
  unsigned __int8 v7 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v7);
  v8 = [STAppMonitor alloc];
  id v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [(STAppMonitor *)v8 initWithPersistenceController:v9];
  [(STScreenTimeOrganizationController *)self setAppMonitor:v10];

  uint64_t v11 = [(STScreenTimeOrganizationController *)self appMonitor];
  [v11 resume];

  id v12 = +[NSUserDefaults standardUserDefaults];
  if (_os_feature_enabled_impl())
  {
    id v13 = +[STLog screenTimeOrganizationController];
    unint64_t v14 = !v3;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 134217984;
      id v26 = (id)v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Requesting internal FamilyControls authorization for %ld", buf, 0xCu);
    }

    uint64_t v15 = +[FOAuthorizationCenter sharedCenter];
    [v15 requestInternalAuthorizationForMember:v14 completionHandler:&stru_1002FE0D0];
LABEL_11:

    goto LABEL_12;
  }
  if ([v12 BOOLForKey:@"RevokeFamilyControlsAuthorization"])
  {
    id v16 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Revoking family controls authorization", buf, 2u);
    }

    v17 = +[FOAuthorizationCenter sharedCenter];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100078C40;
    v23[3] = &unk_1002FC0B8;
    id v24 = v12;
    [v17 revokeInternalAuthorizationWithCompletionHandler:v23];

    uint64_t v15 = v24;
    goto LABEL_11;
  }
LABEL_12:
  v18 = [STUsageManager alloc];
  id v19 = [(STScreenTimeOrganizationController *)self persistenceController];
  v20 = [(STUsageManager *)v18 initWithPersistenceController:v19];
  [(STScreenTimeOrganizationController *)self setUsageManager:v20];

  uint64_t v21 = [(STScreenTimeOrganizationController *)self usageManager];
  [v21 resume];

  v22 = [(STScreenTimeOrganizationController *)self usageManager];
  [v22 setScreenTimeEnabled:1];

  objc_sync_exit(v7);
}

- (void)didEnableScreenTime:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v5);
  [(STScreenTimeOrganizationController *)self startupScreenTime:v3];
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  v8 = [v6 viewContext];
  id v9 = [v8 persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v9];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100078E24;
  v11[3] = &unk_1002FB6A8;
  id v10 = v7;
  id v12 = v10;
  [v10 performBlockAndWait:v11];
  [(STScreenTimeOrganizationController *)self attemptToAutomaticallyEnableScreenTimeSyncing];

  objc_sync_exit(v5);
}

- (void)didDisableScreenTime
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  id v4 = +[STLog checkpoint];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v20 = (id)objc_opt_class();
    id v5 = v20;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping Screen Time", buf, 0xCu);
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:@"AutomaticSyncEnableOccurred"];

  if (_os_feature_enabled_impl())
  {
    id v7 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Revoking family controls authorization", buf, 2u);
    }

    v8 = +[FOAuthorizationCenter sharedCenter];
    [v8 revokeInternalAuthorizationWithCompletionHandler:&stru_1002FE0F0];
  }
  id v9 = [(STScreenTimeOrganizationController *)self usageManager];
  if (!v9)
  {
    id v10 = [STUsageManager alloc];
    uint64_t v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v9 = [(STUsageManager *)v10 initWithPersistenceController:v11];
  }
  [(STUsageManager *)v9 setScreenTimeEnabled:0];
  [(STScreenTimeOrganizationController *)self setUsageManager:0];
  [(STScreenTimeOrganizationController *)self setAppMonitor:0];
  id v12 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v13 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  unint64_t v14 = [v12 viewContext];
  uint64_t v15 = [v14 persistentStoreCoordinator];
  [v13 setPersistentStoreCoordinator:v15];

  [v13 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100079230;
  v17[3] = &unk_1002FB6A8;
  id v16 = v13;
  id v18 = v16;
  [v16 performBlock:v17];

  objc_sync_exit(v3);
}

- (void)attemptToAutomaticallyEnableScreenTimeSyncing
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  id v4 = +[STLog checkpoint];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to automatically enable Screen Time syncing", buf, 2u);
  }

  id v5 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v6 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v7 = [v5 viewContext];
  v8 = [v7 persistentStoreCoordinator];
  [v6 setPersistentStoreCoordinator:v8];

  [v6 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000796DC;
  v10[3] = &unk_1002FB6A8;
  id v9 = v6;
  id v11 = v9;
  [v9 performBlockAndWait:v10];

  objc_sync_exit(v3);
}

- (void)startupCloud
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  id v4 = +[STLog checkpoint];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v14 = (id)objc_opt_class();
    id v5 = v14;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting Screen Time Cloud", buf, 0xCu);
  }
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  v8 = [v6 viewContext];
  id v9 = [v8 persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v9];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100079C40;
  v11[3] = &unk_1002FB6A8;
  id v10 = v7;
  id v12 = v10;
  [v10 performBlockAndWait:v11];
  [(STScreenTimeOrganizationController *)self applyDefaultUserPoliciesWithCompletionHandler:&stru_1002FE138];

  objc_sync_exit(v3);
}

- (void)didSignInToCloud:(id)a3
{
  id v5 = a3;
  id v4 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v4);
  [(STScreenTimeOrganizationController *)self startupCloud];
  objc_sync_exit(v4);
}

- (void)didSignOutOfCloud:(id)a3
{
  id v4 = a3;
  id v5 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v5);
  id v6 = +[STLog checkpoint];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v16 = (id)objc_opt_class();
    id v7 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping Screen Time Cloud", buf, 0xCu);
  }
  v8 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v9 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v10 = [v8 viewContext];
  id v11 = [v10 persistentStoreCoordinator];
  [v9 setPersistentStoreCoordinator:v11];

  [v9 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007A0D4;
  v13[3] = &unk_1002FB6A8;
  id v12 = v9;
  id v14 = v12;
  [v12 performBlock:v13];

  objc_sync_exit(v5);
}

- (void)startupCloudSync
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  id v4 = +[STLog checkpoint];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v5 = v15;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting Screen Time Cloud Sync", buf, 0xCu);
  }
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  v8 = [v6 viewContext];
  id v9 = [v8 persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v9];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007A664;
  v11[3] = &unk_1002FB828;
  id v10 = v7;
  id v12 = v10;
  id v13 = self;
  [v10 performBlockAndWait:v11];

  objc_sync_exit(v3);
}

- (void)didEnableCloudSync
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  [(STScreenTimeOrganizationController *)self startupCloudSync];
  id v4 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling deviceActivity.shareAcrossDevices setting", v8, 2u);
  }

  id v5 = objc_alloc((Class)MOLocalSettingsStore);
  id v6 = [v5 initWithSharedContainer:STManagedSettingsContainer];
  id v7 = [v6 deviceActivity];
  [v7 setShareAcrossDevices:&__kCFBooleanTrue];

  objc_sync_exit(v3);
}

- (void)didDisableCloudSync
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  id v4 = +[STLog checkpoint];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v22 = (id)objc_opt_class();
    id v5 = v22;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping Screen Time Cloud Sync", buf, 0xCu);
  }
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  v8 = [v6 viewContext];
  id v9 = [v8 persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v9];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10007AD28;
  id v18 = &unk_1002FB828;
  id v19 = self;
  id v10 = v7;
  id v20 = v10;
  [v10 performBlock:&v15];
  id v11 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Disabling deviceActivity.shareAcrossDevices setting", buf, 2u);
  }

  id v12 = objc_alloc((Class)MOLocalSettingsStore);
  id v13 = [v12 initWithSharedContainer:STManagedSettingsContainer];
  id v14 = [v13 deviceActivity];
  [v14 setShareAcrossDevices:&__kCFBooleanFalse];

  objc_sync_exit(v3);
}

- (void)startupFamily:(id)a3
{
  id v4 = a3;
  id v5 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v5);
  id v6 = +[STLog checkpoint];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v19 = (id)objc_opt_class();
    id v7 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting Screen Time family", buf, 0xCu);
  }
  v8 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v9 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v10 = [v8 viewContext];
  id v11 = [v10 persistentStoreCoordinator];
  [v9 setPersistentStoreCoordinator:v11];

  [v9 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007B100;
  v14[3] = &unk_1002FCB20;
  id v12 = v9;
  id v15 = v12;
  uint64_t v16 = self;
  id v13 = v4;
  id v17 = v13;
  [v12 performBlockAndWait:v14];

  objc_sync_exit(v5);
}

- (void)didJoinFamily:(id)a3
{
  id v6 = a3;
  id v4 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v4);
  [(STScreenTimeOrganizationController *)self startupFamily:v6];
  id v5 = [(STScreenTimeOrganizationController *)self familyOrganizationController];
  [v5 sendCheckinRequest];

  objc_sync_exit(v4);
}

- (void)didLeaveFamily
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  id v4 = +[STLog checkpoint];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v14 = (id)objc_opt_class();
    id v5 = v14;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping Screen Time family", buf, 0xCu);
  }
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  v8 = [v6 viewContext];
  id v9 = [v8 persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v9];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007B78C;
  v11[3] = &unk_1002FB828;
  void v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  [v10 performBlock:v11];

  objc_sync_exit(v3);
}

- (void)didUpdateFamily:(id)a3
{
  id v5 = a3;
  id v4 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v4);
  [(STScreenTimeOrganizationController *)self startupFamily:v5];
  objc_sync_exit(v4);
}

- (void)didEnableManagement
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  if (_os_feature_enabled_impl())
  {
    id v4 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requesting internal FamilyControls authorization for child", v7, 2u);
    }

    id v5 = +[FOAuthorizationCenter sharedCenter];
    [v5 requestInternalAuthorizationForMember:0 completionHandler:&stru_1002FE158];
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:@"AutomaticSyncEnableOccurred"];

  [(STScreenTimeOrganizationController *)self attemptToAutomaticallyEnableScreenTimeSyncing];
  objc_sync_exit(v3);
}

- (void)updateDeviceName
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  id v4 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v5 = STGetDeviceUUID();
  id v6 = STGetDeviceName();
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  v8 = [v4 viewContext];
  id v9 = [v8 persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v9];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007BBE0;
  v13[3] = &unk_1002FCB20;
  id v10 = v5;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  id v12 = v6;
  id v16 = v12;
  [v11 performBlock:v13];

  objc_sync_exit(v3);
}

- (void)startMonitoringAccountChanges
{
  BOOL v3 = +[STLog checkpoint];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting account change observation", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(STScreenTimeOrganizationController *)self accountNotifier];
  [v5 registerObserver:self];
}

- (void)startObservingScreenTimeSettings
{
  BOOL v3 = +[STLog checkpoint];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v19 = (id)objc_opt_class();
    id v4 = v19;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting Screen Time settings change observation", buf, 0xCu);
  }
  id v5 = +[STScreenTimeSettings fetchRequest];
  int v6 = +[NSSortDescriptor sortDescriptorWithKey:@"screenTimeEnabled" ascending:1];
  id v17 = v6;
  id v7 = +[NSArray arrayWithObjects:&v17 count:1];
  [v5 setSortDescriptors:v7];

  id v8 = objc_alloc((Class)NSFetchedResultsController);
  uint64_t v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v10 = [(id)v9 viewContext];
  id v11 = [v8 initWithFetchRequest:v5 managedObjectContext:v10 sectionNameKeyPath:0 cacheName:0];
  [(STScreenTimeOrganizationController *)self setSettingsResultsController:v11];

  id v12 = [(STScreenTimeOrganizationController *)self settingsResultsController];
  [v12 setDelegate:self];

  id v13 = [(STScreenTimeOrganizationController *)self settingsResultsController];
  id v16 = 0;
  LOBYTE(v9) = [v13 performFetch:&v16];
  id v14 = v16;

  if ((v9 & 1) == 0)
  {
    id v15 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100265EA4();
    }
  }
}

- (void)stopObservingScreenTimeSettings
{
}

- (void)startObservingOrganizationSettings
{
  BOOL v3 = +[STLog checkpoint];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v19 = (id)objc_opt_class();
    id v4 = v19;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting organization settings change observation", buf, 0xCu);
  }
  id v5 = +[STCoreOrganizationSettings fetchRequest];
  int v6 = +[NSSortDescriptor sortDescriptorWithKey:@"uniqueIdentifier" ascending:1];
  id v17 = v6;
  id v7 = +[NSArray arrayWithObjects:&v17 count:1];
  [v5 setSortDescriptors:v7];

  id v8 = objc_alloc((Class)NSFetchedResultsController);
  uint64_t v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v10 = [(id)v9 viewContext];
  id v11 = [v8 initWithFetchRequest:v5 managedObjectContext:v10 sectionNameKeyPath:0 cacheName:0];
  [(STScreenTimeOrganizationController *)self setOrganizationSettingsResultsController:v11];

  id v12 = [(STScreenTimeOrganizationController *)self organizationSettingsResultsController];
  [v12 setDelegate:self];

  id v13 = [(STScreenTimeOrganizationController *)self organizationSettingsResultsController];
  id v16 = 0;
  LOBYTE(v9) = [v13 performFetch:&v16];
  id v14 = v16;

  if ((v9 & 1) == 0)
  {
    id v15 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100265EA4();
    }
  }
}

- (void)stopObservingOrganizationSettings
{
}

- (void)startObservingBlueprints
{
  BOOL v3 = +[STLog checkpoint];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v71 = (id)objc_opt_class();
    id v4 = v71;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting blueprint change observation", buf, 0xCu);
  }
  id v5 = +[STBlueprint fetchRequest];
  int v6 = +[NSSortDescriptor sortDescriptorWithKey:@"uniqueIdentifier" ascending:1];
  v69 = v6;
  id v7 = +[NSArray arrayWithObjects:&v69 count:1];
  [v5 setSortDescriptors:v7];

  id v8 = objc_alloc((Class)NSFetchedResultsController);
  uint64_t v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  uint64_t v10 = [v9 viewContext];
  id v11 = [v8 initWithFetchRequest:v5 managedObjectContext:v10 sectionNameKeyPath:0 cacheName:0];
  [(STScreenTimeOrganizationController *)self setBlueprintsResultsController:v11];

  id v12 = [(STScreenTimeOrganizationController *)self blueprintsResultsController];
  [v12 setDelegate:self];

  id v13 = [(STScreenTimeOrganizationController *)self blueprintsResultsController];
  id v64 = 0;
  LOBYTE(v10) = [v13 performFetch:&v64];
  id v14 = v64;

  if ((v10 & 1) == 0)
  {
    id v15 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_1002660AC();
    }
  }
  id v16 = +[STCoreDowntimeOverride fetchRequest];

  id v17 = +[NSSortDescriptor sortDescriptorWithKey:@"downtime.uniqueIdentifier" ascending:1];
  v68 = v17;
  id v18 = +[NSArray arrayWithObjects:&v68 count:1];
  [v16 setSortDescriptors:v18];

  id v19 = objc_alloc((Class)NSFetchedResultsController);
  id v20 = [(STScreenTimeOrganizationController *)self persistenceController];
  uint64_t v21 = [v20 viewContext];
  id v22 = [v19 initWithFetchRequest:v16 managedObjectContext:v21 sectionNameKeyPath:0 cacheName:0];
  [(STScreenTimeOrganizationController *)self setDowntimeOverridesResultsController:v22];

  v23 = [(STScreenTimeOrganizationController *)self downtimeOverridesResultsController];
  [v23 setDelegate:self];

  id v24 = [(STScreenTimeOrganizationController *)self downtimeOverridesResultsController];
  id v63 = v14;
  LOBYTE(v21) = [v24 performFetch:&v63];
  id v25 = v63;

  if ((v21 & 1) == 0)
  {
    id v26 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      sub_100266044();
    }
  }
  uint64_t v27 = +[STBlueprintSchedule fetchRequest];

  uint64_t v28 = +[NSSortDescriptor sortDescriptorWithKey:@"calendarIdentifier" ascending:1];
  v67 = v28;
  v29 = +[NSArray arrayWithObjects:&v67 count:1];
  [v27 setSortDescriptors:v29];

  id v30 = objc_alloc((Class)NSFetchedResultsController);
  v31 = [(STScreenTimeOrganizationController *)self persistenceController];
  uint64_t v32 = [v31 viewContext];
  id v33 = [v30 initWithFetchRequest:v27 managedObjectContext:v32 sectionNameKeyPath:0 cacheName:0];
  [(STScreenTimeOrganizationController *)self setSchedulesResultsController:v33];

  v34 = [(STScreenTimeOrganizationController *)self schedulesResultsController];
  [v34 setDelegate:self];

  v35 = [(STScreenTimeOrganizationController *)self schedulesResultsController];
  id v62 = v25;
  LOBYTE(v32) = [v35 performFetch:&v62];
  id v36 = v62;

  if ((v32 & 1) == 0)
  {
    v37 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      sub_100265FDC();
    }
  }
  v38 = +[STBlueprintUsageLimit fetchRequest];

  v39 = +[NSSortDescriptor sortDescriptorWithKey:@"usageItemType" ascending:1];
  v66 = v39;
  v40 = +[NSArray arrayWithObjects:&v66 count:1];
  [v38 setSortDescriptors:v40];

  id v41 = objc_alloc((Class)NSFetchedResultsController);
  uint64_t v42 = [(STScreenTimeOrganizationController *)self persistenceController];
  uint64_t v43 = [v42 viewContext];
  id v44 = [v41 initWithFetchRequest:v38 managedObjectContext:v43 sectionNameKeyPath:0 cacheName:0];
  [(STScreenTimeOrganizationController *)self setUsageLimitsResultsController:v44];

  uint64_t v45 = [(STScreenTimeOrganizationController *)self usageLimitsResultsController];
  [v45 setDelegate:self];

  v46 = [(STScreenTimeOrganizationController *)self usageLimitsResultsController];
  id v61 = v36;
  LOBYTE(v43) = [v46 performFetch:&v61];
  id v47 = v61;

  if ((v43 & 1) == 0)
  {
    v48 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
      sub_100265F74();
    }
  }
  v49 = +[STBlueprintConfiguration fetchRequest];

  id v50 = +[NSSortDescriptor sortDescriptorWithKey:@"identifier" ascending:1];
  v65 = v50;
  v51 = +[NSArray arrayWithObjects:&v65 count:1];
  [v49 setSortDescriptors:v51];

  id v52 = objc_alloc((Class)NSFetchedResultsController);
  uint64_t v53 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v54 = [(id)v53 viewContext];
  id v55 = [v52 initWithFetchRequest:v49 managedObjectContext:v54 sectionNameKeyPath:0 cacheName:0];
  [(STScreenTimeOrganizationController *)self setConfigurationsResultsController:v55];

  objc_super v56 = [(STScreenTimeOrganizationController *)self configurationsResultsController];
  [v56 setDelegate:self];

  v57 = [(STScreenTimeOrganizationController *)self configurationsResultsController];
  id v60 = v47;
  LOBYTE(v53) = [v57 performFetch:&v60];
  id v58 = v60;

  if ((v53 & 1) == 0)
  {
    v59 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
      sub_100265F0C();
    }
  }
}

- (void)stopObservingBlueprints
{
  [(STScreenTimeOrganizationController *)self setBlueprintsResultsController:0];
  [(STScreenTimeOrganizationController *)self setDowntimeOverridesResultsController:0];
  [(STScreenTimeOrganizationController *)self setSchedulesResultsController:0];
  [(STScreenTimeOrganizationController *)self setUsageLimitsResultsController:0];
  [(STScreenTimeOrganizationController *)self setConfigurationsResultsController:0];
}

- (void)_startObservingManagedConfigurationEffectiveSettings
{
  id v3 = +[MCProfileConnection sharedConnection];
  [v3 registerObserver:self];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = +[STLog screentime];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detected Managed Configuration effective settings change", buf, 2u);
  }

  int v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v8 = [v6 viewContext];
  uint64_t v9 = [v8 persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v9];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007CBB8;
  v11[3] = &unk_1002FB828;
  id v12 = v7;
  id v13 = self;
  id v10 = v7;
  [v10 performBlock:v11];
}

- (void)_updateScreenTimeSettingsFromManagedConfigurationEffectiveSettingsWithScreenTimeSettings:(id)a3
{
  id v3 = a3;
  id v4 = +[MCProfileConnection sharedConnection];
  unsigned int v5 = [v4 effectiveBoolValueForSetting:MCFeatureEnablingRestrictionsAllowed];

  if (v5 == 2)
  {
    unsigned int v6 = [v3 screenTimeEnabled];
    unsigned int v7 = [v3 cloudSyncEnabled];
    unsigned int v8 = v7;
    if ((v6 & 1) != 0 || v7)
    {
      uint64_t v9 = +[STLog screentime];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Turning off Screen Time, restrictions now forbidden from being enabled due to MCFeatureEnablingRestrictionsAllowed", v10, 2u);
      }

      if (v6) {
        [v3 setScreenTimeEnabled:0];
      }
      if (v8) {
        [v3 setCloudSyncEnabled:0];
      }
    }
  }
}

- (void)deleteLocalUserBlueprintsFromManagedConfigurationEffectiveSettings
{
  id v3 = +[MCProfileConnection sharedConnection];
  unsigned int v4 = [v3 effectiveBoolValueForSetting:MCFeatureEnablingRestrictionsAllowed];

  if (v4 == 2)
  {
    unsigned int v5 = [(STScreenTimeOrganizationController *)self accessLock];
    objc_sync_enter(v5);
    unsigned int v6 = +[STLog screentime];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting local user blueprints. Restrictions now forbidden from being enabled due to MCFeatureEnablingRestrictionsAllowed.", buf, 2u);
    }

    unsigned int v7 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v8 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
    uint64_t v9 = [v7 viewContext];
    id v10 = [v9 persistentStoreCoordinator];
    [v8 setPersistentStoreCoordinator:v10];

    [v8 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007CFC8;
    v12[3] = &unk_1002FB6A8;
    id v11 = v8;
    id v13 = v11;
    [v11 performBlock:v12];

    objc_sync_exit(v5);
  }
}

- (void)updateEffectiveDeviceState:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[STLog checkpoint];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138543362;
      id v22 = (id)objc_opt_class();
      id v7 = v22;
      id v8 = "%{public}@: Initializing effective device state";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    }
  }
  else if (v6)
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v22 = (id)objc_opt_class();
    id v7 = v22;
    id v8 = "%{public}@: Updating effective device state";
    goto LABEL_6;
  }

  uint64_t v9 = (void *)os_transaction_create();
  id v10 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v11 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v12 = [v10 viewContext];
  id v13 = [v12 persistentStoreCoordinator];
  [v11 setPersistentStoreCoordinator:v13];

  [v11 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007D3A0;
  v16[3] = &unk_1002FCB98;
  id v17 = v9;
  id v18 = v11;
  id v19 = self;
  BOOL v20 = v3;
  id v14 = v11;
  id v15 = v9;
  [v14 performBlockAndWait:v16];
}

- (void)_applyImageGenerationRestrictionIfNeeded
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self userDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"InitialImageGenerationRestrictionApplied"];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Image Creation: restriction has not been applied yet. Applying all restrictions.", v7, 2u);
    }

    [(STScreenTimeOrganizationController *)self processBlueprintChangesInstallOnly:0];
    BOOL v6 = [(STScreenTimeOrganizationController *)self userDefaults];
    [v6 setBool:1 forKey:@"InitialImageGenerationRestrictionApplied"];
  }
}

- (void)processBlueprintChangesInstallOnly:(BOOL)a3
{
  unsigned __int8 v4 = [(STScreenTimeOrganizationController *)self requestManager];
  [v4 processBlueprintChanges];

  unsigned int v5 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v6 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v7 = [v5 viewContext];
  id v8 = [v7 persistentStoreCoordinator];
  [v6 setPersistentStoreCoordinator:v8];

  [v6 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007E1C0;
  v10[3] = &unk_1002FB6A8;
  id v11 = v6;
  id v9 = v6;
  [v9 performBlockAndWait:v10];
}

- (void)deleteAllLocalScreenTimeSettings
{
  BOOL v3 = [(STScreenTimeOrganizationController *)self accessLock];
  objc_sync_enter(v3);
  unsigned __int8 v4 = +[STLog screentime];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleting local organization, local organization settings, and blueprints.", buf, 2u);
  }

  unsigned int v5 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v6 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v7 = [v5 viewContext];
  id v8 = [v7 persistentStoreCoordinator];
  [v6 setPersistentStoreCoordinator:v8];

  [v6 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007E4F0;
  v10[3] = &unk_1002FB6A8;
  id v9 = v6;
  id v11 = v9;
  [v9 performBlock:v10];

  objc_sync_exit(v3);
}

- (void)fetchMirroringMonitorStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(STScreenTimeOrganizationController *)self mirroringMonitor];
  id v6 = [v5 fetchCurrentCloudKitSyncingStatus];
  id v7 = [v6 then];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007E874;
  v12[3] = &unk_1002FE180;
  id v13 = v5;
  id v14 = v4;
  id v8 = (uint64_t (*)(void *, void *))v7[2];
  id v9 = v5;
  id v10 = v4;
  id v11 = (id)v8(v7, v12);
}

- (void)performCloudSync:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  unsigned int v5 = [(STScreenTimeOrganizationController *)self mirroringMonitor];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 forceMirroringSync];
    id v8 = 0;
  }
  else
  {
    id v9 = objc_alloc((Class)NSError);
    uint64_t v10 = STErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Cloud monitor does not exist";
    id v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v8 = [v9 initWithDomain:v10 code:1 userInfo:v11];
  }
  v4[2](v4, v8);
}

- (void)postOrRemoveAppAndWebsiteActivityEnabledNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"Removing";
    if (v3) {
      CFStringRef v5 = @"Posting";
    }
    int v11 = 138412290;
    CFStringRef v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ App & Website Activity enabled notification", (uint8_t *)&v11, 0xCu);
  }

  id v6 = objc_opt_new();
  id v7 = objc_alloc((Class)NSNotification);
  id v8 = off_1002FE960;
  if (!v3) {
    id v8 = off_1002FE968;
  }
  id v9 = [v7 initWithName:*v8 object:v6 userInfo:0];
  uint64_t v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotification:v9];
}

- (void)_didFailDMRegistration:(id)a3
{
  id v3 = a3;
  id v4 = +[STLog checkpoint];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1002664BC(v3);
  }

  xpc_transaction_exit_clean();
}

- (void)migrateOldDefaultsIfNeeded
{
  v2 = objc_opt_new();
  if ([v2 isMigrationNeeded])
  {
    [v2 migrateUserDefaults];
  }
  else
  {
    id v3 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100266540();
    }
  }
}

- (BOOL)createMandatoryEntitiesIfNeeded
{
  v2 = self;
  id v3 = [(STScreenTimeOrganizationController *)self persistenceController];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v4 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  CFStringRef v5 = [v3 viewContext];
  id v6 = [v5 persistentStoreCoordinator];
  [v4 setPersistentStoreCoordinator:v6];

  [v4 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007EDA0;
  v9[3] = &unk_1002FE1A8;
  id v7 = v4;
  id v10 = v7;
  int v11 = v2;
  CFStringRef v12 = &v13;
  [v7 performBlockAndWait:v9];
  LOBYTE(v2) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v2;
}

- (void)cleanOrphanedDatabaseEntities
{
  v2 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v3 = [v2 newBackgroundContext];
  [v3 setName:@"cleanOrphanedDatabaseEntities"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F158;
  v5[3] = &unk_1002FB6A8;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v5];
}

- (void)accountDidUpdateToState:(id)a3 initializing:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v8 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
  id v9 = [v7 viewContext];
  id v10 = [v9 persistentStoreCoordinator];
  [v8 setPersistentStoreCoordinator:v10];

  [v8 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007F9C8;
  v13[3] = &unk_1002FCB98;
  id v14 = v8;
  id v15 = v6;
  char v16 = self;
  BOOL v17 = a4;
  id v11 = v6;
  id v12 = v8;
  [v12 performBlockAndWait:v13];
}

- (void)performWeeklyRollupWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(STScreenTimeOrganizationController *)self usageManager];

  if (v4)
  {
    CFStringRef v5 = [(STScreenTimeOrganizationController *)self usageManager];
    [v5 performWeeklyRollupWithCompletionHandler:v7];
  }
  else
  {
    id v6 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    CFStringRef v5 = +[NSError errorWithDomain:STErrorDomain code:7 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v5);
  }

  id v6 = v7;
LABEL_6:
}

- (void)rollupUsageDataWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(STScreenTimeOrganizationController *)self usageManager];

  if (v4)
  {
    CFStringRef v5 = [(STScreenTimeOrganizationController *)self usageManager];
    [v5 rollupUsageForDuration:60 isBackgroundTask:0 isRecomputingUsage:0 completionHandler:v7];
  }
  else
  {
    id v6 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    CFStringRef v5 = +[NSError errorWithDomain:STErrorDomain code:7 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v5);
  }

  id v6 = v7;
LABEL_6:
}

- (STAppMonitorStatus)appMonitorStatus
{
  v2 = [(STScreenTimeOrganizationController *)self appMonitor];
  id v3 = [STAppMonitorStatus alloc];
  id v4 = [v2 running];
  if (v2)
  {
    CFStringRef v5 = [v2 cachedAppBundleIdentifiers];
    id v6 = v3;
    uint64_t v7 = 1;
  }
  else
  {
    CFStringRef v5 = objc_opt_new();
    id v6 = v3;
    uint64_t v7 = 0;
  }
  id v8 = [(STAppMonitorStatus *)v6 initWithInstanceExists:v7 instanceRunning:v4 cachedAppBundleIdentifiers:v5];

  return v8;
}

- (void)scheduleAppMonitorAppDiscovery
{
  id v2 = [(STScreenTimeOrganizationController *)self appMonitor];
  [v2 _scheduleAppDiscoveryBackgroundActivity];
}

- (void)migrateLegacyRestrictionsIfNeededWithMCXSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setMcxSettings:v7];

  LOBYTE(v7) = [v8 hasMigratorRun];
  id v9 = +[STLog screenTimeOrganizationController];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10) {
      sub_1002668AC();
    }

    if (v6) {
      v6[2](v6, 0);
    }
  }
  else
  {
    if (v10) {
      sub_1002668E0();
    }

    id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v12 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:2];
    uint64_t v13 = [v11 viewContext];
    id v14 = [v13 persistentStoreCoordinator];
    [v12 setPersistentStoreCoordinator:v14];

    [v12 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000804CC;
    v16[3] = &unk_1002FE1F8;
    id v17 = v8;
    id v18 = v12;
    id v19 = v6;
    id v15 = v12;
    [v15 performBlockAndWait:v16];
  }
}

- (void)_applyDefaultUserPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Default user policy applicator triggered", buf, 2u);
  }

  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008068C;
  v8[3] = &unk_1002FC068;
  id v9 = v4;
  id v7 = v4;
  [v6 performBackgroundTaskAndWait:v8];
}

- (void)setNeedsUpdatePasscode
{
  id v2 = [(STScreenTimeOrganizationController *)self keychainUnlockEventObserver];
  [v2 setConfiguration:&off_100310008];
}

- (void)clearNeedsUpdatePasscode
{
  id v2 = [(STScreenTimeOrganizationController *)self keychainUnlockEventObserver];
  [v2 setConfiguration:0];
}

+ (id)keyPathsForValuesAffectingScreenTimeEnabled
{
  id v2 = +[NSString stringWithFormat:@"%@.%@", @"userDefaults", @"ScreenTimeEnabled"];
  id v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, 0);

  return v3;
}

- (BOOL)isScreenTimeEnabled
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ScreenTimeEnabled"];

  return v3;
}

- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 67109120;
    BOOL v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting Screen Time enabled: %d", buf, 8u);
  }

  if (_os_feature_enabled_impl() && v4)
  {
    [(STScreenTimeOrganizationController *)self setAppAndWebsiteActivityEnabled:1 completionHandler:v6];
  }
  else
  {
    id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    unsigned __int8 v9 = [v8 hasStoreLoaded];

    if (v9)
    {
      BOOL v10 = [(STScreenTimeOrganizationController *)self persistenceController];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100080ACC;
      v12[3] = &unk_1002FE220;
      BOOL v14 = v4;
      void v12[4] = self;
      id v13 = v6;
      [v10 performBackgroundTaskAndWait:v12];
    }
    else
    {
      id v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
      (*((void (**)(id, void *))v6 + 2))(v6, v11);
    }
  }
}

- (void)setAppAndWebsiteActivityEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 67109120;
    BOOL v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting App & Website Activity enabled: %d", buf, 8u);
  }

  id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v9 = [v8 hasStoreLoaded];

  if (v9)
  {
    BOOL v10 = [(STScreenTimeOrganizationController *)self persistenceController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100081004;
    v12[3] = &unk_1002FE248;
    id v13 = v6;
    BOOL v14 = v4;
    [v10 performBackgroundTaskAndWait:v12];

    id v11 = v13;
  }
  else
  {
    id v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

- (void)enableScreenTimeForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100266B50();
  }

  unsigned __int8 v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100081404;
    v13[3] = &unk_1002FC090;
    id v14 = v6;
    id v15 = v7;
    [v11 performBackgroundTaskAndWait:v13];

    id v12 = v14;
  }
  else
  {
    id v12 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)enableRemoteManagementForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100266BBC();
  }

  unsigned __int8 v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100081714;
    v13[3] = &unk_1002FC090;
    id v14 = v6;
    id v15 = v7;
    [v11 performBackgroundTaskAndWait:v13];

    id v12 = v14;
  }
  else
  {
    id v12 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

+ (id)keyPathsForValuesAffectingScreenTimeSyncingEnabled
{
  id v2 = +[NSString stringWithFormat:@"%@.%@", @"userDefaults", @"SyncEnabled"];
  unsigned __int8 v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, 0);

  return v3;
}

- (BOOL)isScreenTimeSyncingEnabled
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"SyncEnabled"];

  return v3;
}

- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100266C90(a3, v7);
  }

  id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v9 = [v8 hasStoreLoaded];

  if (v9)
  {
    unsigned __int8 v10 = [(STScreenTimeOrganizationController *)self persistenceController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100081ABC;
    v12[3] = &unk_1002FE248;
    BOOL v14 = a3;
    id v13 = v6;
    [v10 performBackgroundTaskAndWait:v12];

    id v11 = v13;
  }
  else
  {
    id v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100266D74();
  }

  unsigned __int8 v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v12 = [v11 newBackgroundContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100081D84;
    v14[3] = &unk_1002FE1F8;
    id v15 = v6;
    id v16 = v12;
    id v17 = v7;
    id v13 = v12;
    [v13 performBlockAndWait:v14];
  }
  else
  {
    id v13 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
  }
}

- (BOOL)clearRestrictionsPasscodeWithError:(id *)a3
{
  CFStringRef v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing restrictions passcode from daemon", buf, 2u);
  }

  *(void *)os_activity_scope_state_s buf = 0;
  id v15 = buf;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100082268;
  id v18 = sub_100082278;
  id v19 = 0;
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v7 = [v6 hasStoreLoaded];

  if ((v7 & 1) == 0)
  {
    if (!a3)
    {
      BOOL v10 = 0;
      goto LABEL_11;
    }
    id v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100082280;
  v13[3] = &unk_1002FE270;
  void v13[4] = self;
  v13[5] = buf;
  [v8 performBackgroundTaskAndWait:v13];

  unsigned __int8 v9 = (void *)*((void *)v15 + 5);
  BOOL v10 = v9 == 0;
  if (a3 && v9)
  {
    id v11 = v9;
LABEL_9:
    *a3 = v11;
  }
LABEL_11:
  _Block_object_dispose(buf, 8);

  return v10;
}

- (id)getNeedsToSetRestrictionsPasscodeAndReturnError:(id *)a3
{
  CFStringRef v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if the restrictions passcode needs to be set", buf, 2u);
  }

  *(void *)os_activity_scope_state_s buf = 0;
  id v26 = buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100082268;
  v29 = sub_100082278;
  id v30 = 0;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100082268;
  v23 = sub_100082278;
  id v24 = 0;
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v7 = [v6 hasStoreLoaded];

  if (v7)
  {
    id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v9 = [v8 newBackgroundContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100082B50;
    v15[3] = &unk_1002FE298;
    id v10 = v9;
    id v16 = v10;
    id v17 = &v19;
    id v18 = buf;
    [v10 performBlockAndWait:v15];
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v10 = (id)v20[5];
    v20[5] = v11;
  }

  id v12 = (void *)*((void *)v26 + 5);
  if (a3 && !v12)
  {
    *a3 = (id) v20[5];
    id v12 = (void *)*((void *)v26 + 5);
  }
  id v13 = v12;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)setRestrictionsPasscode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating restrictions passcode", buf, 2u);
  }

  *(void *)os_activity_scope_state_s buf = 0;
  uint64_t v19 = buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100082268;
  id v22 = sub_100082278;
  id v23 = 0;
  id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v9 = [v8 hasStoreLoaded];

  if (v9)
  {
    id v10 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v11 = [v10 newBackgroundContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100082DF4;
    v14[3] = &unk_1002FBFA0;
    id v12 = v11;
    id v15 = v12;
    id v17 = buf;
    id v16 = v6;
    [v12 performBlockAndWait:v14];
  }
  else
  {
    uint64_t v13 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v12 = (id)*((void *)v19 + 5);
    *((void *)v19 + 5) = v13;
  }

  if (a4) {
    *a4 = *((id *)v19 + 5);
  }
  _Block_object_dispose(buf, 8);
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void, uint64_t, uint64_t))a3;
  CFStringRef v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Getting a restrictions passcode attempt count and timeout date", buf, 2u);
  }

  *(void *)os_activity_scope_state_s buf = 0;
  uint64_t v27 = buf;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100082268;
  id v30 = sub_100082278;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100082268;
  id v24 = sub_100082278;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100082268;
  id v18 = sub_100082278;
  id v19 = 0;
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  if ([v6 hasStoreLoaded])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100083174;
    v9[3] = &unk_1002FE2C0;
    id v7 = [v6 newBackgroundContext];
    id v10 = v7;
    id v11 = &v14;
    id v12 = buf;
    uint64_t v13 = &v20;
    [v7 performBlockAndWait:v9];
  }
  else
  {
    uint64_t v8 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v7 = (id)v15[5];
    v15[5] = v8;
  }

  v4[2](v4, *((void *)v27 + 5), v21[5], v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);
}

- (BOOL)authenticateRestrictionsPasscode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Authenticating a restrictions passcode", buf, 2u);
  }

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  *(void *)os_activity_scope_state_s buf = 0;
  id v19 = buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100082268;
  uint64_t v22 = sub_100082278;
  id v23 = 0;
  uint64_t v8 = [(STScreenTimeOrganizationController *)self persistenceController];
  if ([v8 hasStoreLoaded])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100083488;
    v13[3] = &unk_1002FE2E8;
    id v9 = [v8 newBackgroundContext];
    id v14 = v9;
    uint64_t v16 = buf;
    id v17 = &v24;
    id v15 = v6;
    [v9 performBlockAndWait:v13];
  }
  else
  {
    uint64_t v10 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v9 = (id)*((void *)v19 + 5);
    *((void *)v19 + 5) = v10;
  }

  if (a4) {
    *a4 = *((id *)v19 + 5);
  }
  char v11 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (NSUserDefaults)userDefaults
{
  return +[NSUserDefaults standardUserDefaults];
}

- (void)performMigrationFromMCXSettings:(id)a3 completionHandler:(id)a4
{
}

- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3
{
}

- (BOOL)shouldRequestMoreTime
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v2 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v3 = [v2 newBackgroundContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100083698;
  v6[3] = &unk_1002FC558;
  id v4 = v3;
  id v7 = v4;
  uint64_t v8 = &v9;
  [v4 performBlockAndWait:v6];
  LOBYTE(v2) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100267174();
  }

  uint64_t v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    uint64_t v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v12 = [v11 newBackgroundContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000838B0;
    v14[3] = &unk_1002FE1F8;
    id v15 = v6;
    id v16 = v12;
    id v17 = v7;
    id v13 = v12;
    [v13 performBlockAndWait:v14];
  }
  else
  {
    id v13 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v13);
  }
}

- (id)getPrimaryiCloudCardDAVAccountIdentifierWithError:(id *)a3
{
  id v3 = objc_opt_new();
  id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  CFStringRef v5 = v4;
  if (v4)
  {
    id v6 = [v4 childCardDAVAccountIdentifier];
  }
  else
  {
    id v7 = +[STLog screenTimeOrganizationController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1002671E0();
    }

    id v6 = 0;
  }

  return v6;
}

- (void)setContactManagementState:(int64_t)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100267220((uint64_t)v8, a3, v10);
  }

  uint64_t v11 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v12 = [v11 hasStoreLoaded];

  if (v12)
  {
    id v13 = [(STScreenTimeOrganizationController *)self persistenceController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100083BA8;
    v15[3] = &unk_1002FE310;
    id v16 = v8;
    int64_t v18 = a3;
    id v17 = v9;
    [v13 performBackgroundTaskAndWait:v15];

    id v14 = v16;
  }
  else
  {
    id v14 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }
}

- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100267310();
  }

  id v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    uint64_t v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v12 = [v11 newBackgroundContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100083E74;
    v14[3] = &unk_1002FE1F8;
    id v15 = v6;
    id v16 = v12;
    id v17 = v7;
    id v13 = v12;
    [v13 performBlockAndWait:v14];
  }
  else
  {
    id v13 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
  }
}

- (void)permitWebFilterURL:(id)a3 pageTitle:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding URL to web filter whitelist: %@", buf, 0xCu);
  }

  id v12 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v13 = [v12 hasStoreLoaded];

  if (v13)
  {
    id v14 = [(STScreenTimeOrganizationController *)self persistenceController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10008413C;
    v16[3] = &unk_1002FE338;
    id v19 = v10;
    id v17 = v8;
    id v18 = v9;
    [v14 performBackgroundTaskAndWait:v16];

    id v15 = v19;
  }
  else
  {
    id v15 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (id)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 error:(id *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000844B8;
  v9[3] = &unk_1002FE360;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(STScreenTimeOrganizationController *)self _doesNotHaveOneMoreMinuteBlueprintPassingTest:v9 error:a4];

  return v7;
}

- (id)shouldAllowOneMoreMinuteForWebDomain:(id)a3 error:(id *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000845F4;
  v9[3] = &unk_1002FE360;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(STScreenTimeOrganizationController *)self _doesNotHaveOneMoreMinuteBlueprintPassingTest:v9 error:a4];

  return v7;
}

- (id)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 error:(id *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100084730;
  v9[3] = &unk_1002FE360;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(STScreenTimeOrganizationController *)self _doesNotHaveOneMoreMinuteBlueprintPassingTest:v9 error:a4];

  return v7;
}

- (id)_doesNotHaveOneMoreMinuteBlueprintPassingTest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(STScreenTimeOrganizationController *)self persistenceController];
  if ([v7 hasStoreLoaded])
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = sub_100082268;
    char v27 = sub_100082278;
    id v28 = 0;
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = sub_100082268;
    id v21 = sub_100082278;
    id v22 = 0;
    id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v9 = [v8 newBackgroundContext];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000849E0;
    v13[3] = &unk_1002FE388;
    id v15 = &v23;
    id v14 = v6;
    id v16 = &v17;
    [v9 performBlockAndWait:v13];
    id v10 = (void *)v18[5];
    if (a4 && !v10)
    {
      *a4 = (id) v24[5];
      id v10 = (void *)v18[5];
    }
    id v11 = v10;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else if (a4)
  {
    +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)getIsExplicitContentRestrictedAndReturnError:(id *)a3
{
  CFStringRef v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10026745C();
  }

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100082268;
  v29 = sub_100082278;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100082268;
  uint64_t v23 = sub_100082278;
  id v24 = 0;
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v7 = [v6 hasStoreLoaded];

  if (v7)
  {
    id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v9 = [v8 newBackgroundContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100084E78;
    v15[3] = &unk_1002FE298;
    id v10 = v9;
    id v16 = v10;
    uint64_t v17 = &v19;
    id v18 = &v25;
    [v10 performBlockAndWait:v15];
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v10 = (id)v20[5];
    v20[5] = v11;
  }

  id v12 = (void *)v26[5];
  if (a3 && !v12)
  {
    *a3 = (id) v20[5];
    id v12 = (void *)v26[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (id)getIsWebContentRestrictedAndReturnError:(id *)a3
{
  CFStringRef v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1002674F8();
  }

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100082268;
  v29 = sub_100082278;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100082268;
  uint64_t v23 = sub_100082278;
  id v24 = 0;
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v7 = [v6 hasStoreLoaded];

  if (v7)
  {
    id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v9 = [v8 newBackgroundContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100085550;
    v15[3] = &unk_1002FE298;
    id v10 = v9;
    id v16 = v10;
    uint64_t v17 = &v19;
    id v18 = &v25;
    [v10 performBlockAndWait:v15];
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    id v10 = (id)v20[5];
    v20[5] = v11;
  }

  id v12 = (void *)v26[5];
  if (a3 && !v12)
  {
    *a3 = (id) v20[5];
    id v12 = (void *)v26[5];
  }
  id v13 = v12;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (void)enableWebContentFilterWithCompletionHandler:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling web content filter for local user", buf, 2u);
  }

  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v7 = [v6 hasStoreLoaded];

  if (v7)
  {
    id v8 = [(STScreenTimeOrganizationController *)self persistenceController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100085B3C;
    v10[3] = &unk_1002FC068;
    id v11 = v4;
    [v8 performBackgroundTaskAndWait:v10];

    id v9 = v11;
  }
  else
  {
    id v9 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Applying introduction model for dsid: %@", buf, 0xCu);
  }

  id v12 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v13 = [v12 hasStoreLoaded];

  if (v13)
  {
    id v14 = [(STScreenTimeOrganizationController *)self persistenceController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100085E58;
    v16[3] = &unk_1002FB4D8;
    id v17 = v9;
    id v18 = v8;
    id v19 = v10;
    [v14 performBackgroundTaskAndWait:v16];

    id v15 = v17;
  }
  else
  {
    id v15 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10026786C();
  }

  id v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    id v12 = [v11 newBackgroundContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100086578;
    v14[3] = &unk_1002FE1F8;
    id v15 = v6;
    id v16 = v12;
    id v17 = v7;
    id v13 = v12;
    [v13 performBlockAndWait:v14];
  }
  else
  {
    id v13 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
  }
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100267A44(a3, (uint64_t)v8, v10);
  }

  id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v12 = [v11 hasStoreLoaded];

  if (v12)
  {
    id v13 = [(STScreenTimeOrganizationController *)self persistenceController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100086C58;
    v15[3] = &unk_1002FE3B0;
    id v16 = v8;
    id v17 = v9;
    BOOL v18 = a3;
    [v13 performBackgroundTaskAndWait:v15];

    id v14 = v16;
  }
  else
  {
    id v14 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }
}

- (void)triggerDowngradeMigrationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  CFStringRef v5 = objc_opt_new();
  id v6 = [(STScreenTimeOrganizationController *)self persistenceController];
  id v7 = [(STScreenTimeOrganizationController *)self requestManager];
  id v9 = 0;
  [v5 triggerMigrationWithPersistenceController:v6 andRequestManager:v7 outError:&v9];
  id v8 = v9;

  v4[2](v4, v8);
}

- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching last comm limits modification date for dsid: %{public}@", buf, 0xCu);
  }

  id v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000874E0;
    v13[3] = &unk_1002FC090;
    id v14 = v6;
    id v15 = v7;
    [v11 performBackgroundTask:v13];

    unsigned __int8 v12 = v14;
  }
  else
  {
    unsigned __int8 v12 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138543362;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching last modification date for dsid: %{public}@", buf, 0xCu);
  }

  id v9 = [(STScreenTimeOrganizationController *)self persistenceController];
  unsigned __int8 v10 = [v9 hasStoreLoaded];

  if (v10)
  {
    id v11 = [(STScreenTimeOrganizationController *)self persistenceController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000878C4;
    v13[3] = &unk_1002FC090;
    id v14 = v6;
    id v15 = v7;
    [v11 performBackgroundTask:v13];

    unsigned __int8 v12 = v14;
  }
  else
  {
    unsigned __int8 v12 = +[NSError errorWithDomain:STErrorDomain code:22 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)didReceiveBlueprintPayload:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(STScreenTimeOrganizationController *)self requestManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100087C44;
  v6[3] = &unk_1002FB738;
  void v6[4] = self;
  [v5 persistBlueprintsFromBlueprintPayload:v4 withCompletion:v6];
}

- (void)requestManager:(id)a3 didPrepareRequestPayloads:(id)a4 reason:(id)a5
{
  id v6 = a4;
  id v7 = +[STLog screenTimeOrganizationController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Declaration manager did prepare declaration request payloads: %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      unsigned __int8 v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
        id v14 = [(STScreenTimeOrganizationController *)self requestManager];
        [v14 installFromRequest:v13];

        unsigned __int8 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)requestManager:(id)a3 didPrepareBlueprintPayloads:(id)a4
{
  id v5 = a4;
  id v6 = [(STScreenTimeOrganizationController *)self familyOrganizationController];
  [v6 sendPayloads:v5];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v9 = a3;
  id v4 = [(STScreenTimeOrganizationController *)self settingsResultsController];

  if (v4 == v9)
  {
    id v6 = [(STScreenTimeOrganizationController *)self deviceStateDebouncer];
  }
  else
  {
    id v5 = [(STScreenTimeOrganizationController *)self organizationSettingsResultsController];

    if (v5 == v9)
    {
      id v7 = [(STScreenTimeOrganizationController *)self deviceStateDebouncer];
      [v7 bounce:0];
    }
    else
    {
      [(STScreenTimeOrganizationController *)self downtimeOverridesResultsController];
    }
    id v6 = [(STScreenTimeOrganizationController *)self blueprintDebouncer];
  }
  id v8 = v6;
  [v6 bounce:0];
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  id v8 = a3;
  id v5 = [(STScreenTimeOrganizationController *)self deviceStateDebouncer];

  if (v5 == v8)
  {
    notify_post(STSettingsDidChangeNotification);
    [(STScreenTimeOrganizationController *)self updateEffectiveDeviceState:0];
  }
  else
  {
    id v6 = [(STScreenTimeOrganizationController *)self blueprintDebouncer];

    id v7 = v8;
    if (v6 != v8) {
      goto LABEL_6;
    }
    [(STScreenTimeOrganizationController *)self processBlueprintChangesInstallOnly:0];
  }
  id v7 = v8;
LABEL_6:
}

- (STFamilyOrganizationController)familyOrganizationController
{
  return self->familyOrganizationController;
}

- (void)setFamilyOrganizationController:(id)a3
{
}

- (STRequestManager)requestManager
{
  return (STRequestManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequestManager:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (id)accessLock
{
  return self->_accessLock;
}

- (STAskForTimeManager)askForTimeManager
{
  return self->_askForTimeManager;
}

- (STAccountStateMonitor)accountMonitor
{
  return self->_accountMonitor;
}

- (void)setAccountMonitor:(id)a3
{
}

- (STXPCEventObserver)keychainUnlockEventObserver
{
  return self->_keychainUnlockEventObserver;
}

- (STXPCEventObserver)deviceRenameEventObserver
{
  return self->_deviceRenameEventObserver;
}

- (STAppMonitor)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
}

- (STMirroringMonitor)mirroringMonitor
{
  return self->_mirroringMonitor;
}

- (void)setMirroringMonitor:(id)a3
{
}

- (STAccountNotifying)accountNotifier
{
  return self->_accountNotifier;
}

- (void)setAccountNotifier:(id)a3
{
}

- (NSFetchedResultsController)settingsResultsController
{
  return self->_settingsResultsController;
}

- (void)setSettingsResultsController:(id)a3
{
}

- (NSFetchedResultsController)organizationSettingsResultsController
{
  return self->_organizationSettingsResultsController;
}

- (void)setOrganizationSettingsResultsController:(id)a3
{
}

- (NSFetchedResultsController)blueprintsResultsController
{
  return self->_blueprintsResultsController;
}

- (void)setBlueprintsResultsController:(id)a3
{
}

- (NSFetchedResultsController)downtimeOverridesResultsController
{
  return self->_downtimeOverridesResultsController;
}

- (void)setDowntimeOverridesResultsController:(id)a3
{
}

- (NSFetchedResultsController)schedulesResultsController
{
  return self->_schedulesResultsController;
}

- (void)setSchedulesResultsController:(id)a3
{
}

- (NSFetchedResultsController)usageLimitsResultsController
{
  return self->_usageLimitsResultsController;
}

- (void)setUsageLimitsResultsController:(id)a3
{
}

- (NSFetchedResultsController)configurationsResultsController
{
  return self->_configurationsResultsController;
}

- (void)setConfigurationsResultsController:(id)a3
{
}

- (STUsageManager)usageManager
{
  return self->_usageManager;
}

- (void)setUsageManager:(id)a3
{
}

- (BOOL)didReadLocalPasscode
{
  return self->_didReadLocalPasscode;
}

- (void)setDidReadLocalPasscode:(BOOL)a3
{
  self->_didReadLocalPasscode = a3;
}

- (NPSManager)watchSyncManager
{
  return self->_watchSyncManager;
}

- (STScreenTimeCapabilities)capabilities
{
  return (STScreenTimeCapabilities *)objc_getProperty(self, a2, 184, 1);
}

- (STConcreteOrganizationControllerConfigurationAdapter)configurationAdapter
{
  return (STConcreteOrganizationControllerConfigurationAdapter *)objc_getProperty(self, a2, 192, 1);
}

- (STDebouncer)blueprintDebouncer
{
  return self->_blueprintDebouncer;
}

- (void)setBlueprintDebouncer:(id)a3
{
}

- (STDebouncer)deviceStateDebouncer
{
  return self->_deviceStateDebouncer;
}

- (void)setDeviceStateDebouncer:(id)a3
{
}

- (BOOL)resetAllLocalScreenTimeSettings
{
  return self->_resetAllLocalScreenTimeSettings;
}

- (void)setResetAllLocalScreenTimeSettings:(BOOL)a3
{
  self->_resetAllLocalScreenTimeSettings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceStateDebouncer, 0);
  objc_storeStrong((id *)&self->_blueprintDebouncer, 0);
  objc_storeStrong((id *)&self->_configurationAdapter, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_watchSyncManager, 0);
  objc_storeStrong((id *)&self->_usageManager, 0);
  objc_storeStrong((id *)&self->_configurationsResultsController, 0);
  objc_storeStrong((id *)&self->_usageLimitsResultsController, 0);
  objc_storeStrong((id *)&self->_schedulesResultsController, 0);
  objc_storeStrong((id *)&self->_downtimeOverridesResultsController, 0);
  objc_storeStrong((id *)&self->_blueprintsResultsController, 0);
  objc_storeStrong((id *)&self->_organizationSettingsResultsController, 0);
  objc_storeStrong((id *)&self->_settingsResultsController, 0);
  objc_storeStrong((id *)&self->_accountNotifier, 0);
  objc_storeStrong((id *)&self->_mirroringMonitor, 0);
  objc_storeStrong((id *)&self->_appMonitor, 0);
  objc_storeStrong((id *)&self->_deviceRenameEventObserver, 0);
  objc_storeStrong((id *)&self->_keychainUnlockEventObserver, 0);
  objc_storeStrong((id *)&self->_accountMonitor, 0);
  objc_storeStrong((id *)&self->_askForTimeManager, 0);
  objc_storeStrong(&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->familyOrganizationController, 0);
}

@end