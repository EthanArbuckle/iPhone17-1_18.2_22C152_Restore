@interface NPKCompanionAgent
- (BOOL)_shouldSyncPassFromCompanionPassLibrary:(id)a3;
- (BOOL)hasAnyWatchPaymentPasses;
- (BOOL)hasCandidateRelevantPasses;
- (BOOL)hasCompanionPaymentPassWithUniqueID:(id)a3;
- (BOOL)hasWatchPaymentPassRequiringVerificationWithUniqueID:(id)a3;
- (BOOL)hasWatchPaymentPassWithPairedTerminalIdentifier:(id)a3;
- (BOOL)hasWatchPaymentPassWithUniqueID:(id)a3;
- (BOOL)isGizmoWaitingForRelevantPasses;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldDropIDSMessages;
- (BOOL)wasLimitPush;
- (CGSize)gizmoScreenSize;
- (IDSService)generalService;
- (IDSService)relevancyService;
- (NPDBulletinManager)bulletinManager;
- (NPDCardSetupReminderNotificationScheduler)bulletinScheduler;
- (NPDCompanionMaintenanceService)maintenanceService;
- (NPDCompanionPassSyncService)passSyncService;
- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase;
- (NPDCompanionPeerPaymentStatusObserver)companionPeerPaymentStatusObserver;
- (NPDDemoModePassCopier)demoModePassCopier;
- (NPDOutstandingPassDeletionStore)outstandingDeletionStore;
- (NPKCompanionAgent)init;
- (NPKCompanionCatalogManager)companionCatalogManager;
- (NPKCompanionViewServiceConnectionManager)viewServiceConnectionManager;
- (NPKGizmoDatabase)gizmoDatabase;
- (NPKIDVRemoteDevicesManager)remoteDeviceManager;
- (NPKLowPowerModeRemoteDeviceMonitor)remoteDeviceLowPowerMonitor;
- (NPKRemoteAdminConnectionServiceAgent)remoteAdminConnectionServiceAgent;
- (NPKWorkQueue)workQueue;
- (NPSDomainAccessor)npsDomainAccessor;
- (NPSManager)npsManager;
- (NSDate)lastRelevantPassInfoSendDate;
- (NSDate)lastRelevantPassRequestDate;
- (NSHashTable)activeCompanionAgentClientsHashTable;
- (NSHashTable)activePassLibraryClientsHashTable;
- (NSMutableArray)performAfterDatabaseUnlocks;
- (NSMutableArray)performAfterDatabaseUnlocksAndPairedSyncAllowed;
- (NSMutableArray)watchOfferProvisioningCompletionHandlers;
- (NSMutableSet)reconcileWorkQueues;
- (NSNumber)lastKnownResyncID;
- (NSSet)companionPaymentPassUniqueIDs;
- (NSSet)lastSeenRelevantPassInfo;
- (NSString)initializedPairingIdentifier;
- (NSXPCListener)libraryListener;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)activeClientsQueue;
- (OS_dispatch_source)stopDroppingIDSMessagesTimer;
- (PKPassLibrary)passLibrary;
- (PSYSyncCoordinator)pairedSyncCoordinator;
- (double)gizmoScreenScale;
- (id)companionMaintenanceService:(id)a3 paymentPassForUniqueID:(id)a4;
- (id)companionPaymentPassWithUniqueID:(id)a3;
- (id)libraryHash;
- (id)pairedTerminalIdentifierForCompanionPaymentPassWithUniqueID:(id)a3;
- (id)paymentWebService;
- (id)remoteDevicesManagerPairedDeviceOSVersion:(id)a3;
- (id)serializedAddPass:(id)a3 withNewLibraryHash:(id)a4 omitHashForChunking:(BOOL)a5 catalog:(id)a6 syncID:(id)a7 resyncID:(id)a8;
- (id)serializedCatalog:(id)a3;
- (id)serializedPass:(id)a3;
- (id)serializedRemovePassWithUniqueID:(id)a3 withNewLibraryHash:(id)a4 omitHashForChunking:(BOOL)a5 catalog:(id)a6 syncID:(id)a7 resyncID:(id)a8;
- (id)serializedUpdatePass:(id)a3 fromPassWithManifestHash:(id)a4 withNewLibraryHash:(id)a5 omitHashForChunking:(BOOL)a6 catalog:(id)a7 syncID:(id)a8 resyncID:(id)a9;
- (id)temporarilyRetainedPassLibrary;
- (int)capabilityUpdateNotificationToken;
- (unint64_t)companionPassSyncService:(id)a3 settingsForPassWithUniqueID:(id)a4;
- (unint64_t)versionForCompleteHash;
- (void)_addPassToDatabaseAndPrepareForTransmissionToGizmo:(id)a3 isUpdate:(BOOL)a4 withCompletion:(id)a5;
- (void)_checkHasCandidateRelevantPassesWithCompletion:(id)a3;
- (void)_createSyncServiceIfNecessary;
- (void)_disconnectAllClients;
- (void)_doFullSyncWithResyncID:(id)a3;
- (void)_doPostUnlockPairedSyncAllowedWork;
- (void)_doSync;
- (void)_fetchRelevantPassesAndNotifyGizmo;
- (void)_handleActiveDeviceChanged:(id)a3;
- (void)_handleAddAndSendToGizmoForPass:(id)a3 syncID:(id)a4 completion:(id)a5;
- (void)_handleBulletinDistributorWillSendBulletinToGizmoWithSectionID:(id)a3;
- (void)_handleCompanionPassAddedWithID:(id)a3;
- (void)_handleCompanionPassLibraryChanged:(id)a3;
- (void)_handleCompanionPassRemovedWithID:(id)a3;
- (void)_handleCompanionPassUpdatedWithID:(id)a3;
- (void)_handleCompanionPaymentPassDatabaseChanged:(id)a3;
- (void)_handleCompanionPaymentPassDatabaseChangedBroadcastUnconditionally:(BOOL)a3;
- (void)_handleCompanionSyncDatabaseChanged:(id)a3;
- (void)_handleDeviceCapabilitiesDidChange;
- (void)_handleFirstDeviceUnlock;
- (void)_handlePassbookGlobalPreferencesChanged;
- (void)_handlePaymentOptionsDefaultsChanged;
- (void)_handlePotentialMessageServiceEnabledChangeWithPreviousSettings:(unint64_t)a3 newSettings:(unint64_t)a4 uniqueID:(id)a5;
- (void)_handlePotentialTransactionServiceEnabledChangeWithPreviousSettings:(unint64_t)a3 newSettings:(unint64_t)a4 uniqueID:(id)a5;
- (void)_handlePublicWalletPreferencesChanged:(id)a3;
- (void)_handleRelevantPassesDidChange:(id)a3;
- (void)_handleRemovalAndSendToGizmoForPassWithUniqueID:(id)a3 syncID:(id)a4 completion:(id)a5;
- (void)_handleStockholmPreferencesChanged;
- (void)_handleUpdateAndSendToGizmoForPass:(id)a3 syncID:(id)a4 completion:(id)a5;
- (void)_handleWalletPreferencesChanged:(id)a3;
- (void)_initializePairingSpecificStateForDevice:(id)a3;
- (void)_logDebugInformationWithExpectedPairedDeviceID:(id)a3;
- (void)_migrateLoggingDefaults;
- (void)_performAfterFirstDeviceUnlock:(id)a3;
- (void)_performAfterFirstDeviceUnlockAndPairedSyncAllowed:(id)a3;
- (void)_reconcileDatabaseWithCompanionPassLibraryWithAddedPassHandler:(id)a3 updatedPassHandler:(id)a4 removedPassHandler:(id)a5 completion:(id)a6;
- (void)_reconcileDatabaseWithPaymentPassDirectoryWithAddedPassHandler:(id)a3 updatedPassHandler:(id)a4 removedPassHandler:(id)a5 completion:(id)a6;
- (void)_reconcilePassesInDatabasePassingTest:(id)a3 withNewPassUniqueIDs:(id)a4 passAccessor:(id)a5 addedPassHandler:(id)a6 updatedPassHandler:(id)a7 removedPassHandler:(id)a8 completion:(id)a9;
- (void)_registerDarwinNotificationHandler;
- (void)_registerDistributedNotificationHandler;
- (void)_registerForFirstDeviceUnlockNotifications;
- (void)_removeCompanionDatabasePassWithUniqueID:(id)a3 completion:(id)a4;
- (void)_removePassFromDatabaseWithID:(id)a3;
- (void)_removePendingAppleCardNotification;
- (void)_resyncPassUniqueIDUpdates:(id)a3 andRemovals:(id)a4 withResyncID:(id)a5 completion:(id)a6;
- (void)_stopDroppingIDSMessages;
- (void)_tearDownPairingSpecificStateForPairingIdentifier:(id)a3;
- (void)_updateInitializationForActiveDevice;
- (void)companionPassSyncService:(id)a3 receivedUpdatedSettings:(unint64_t)a4 forPassWithUniqueID:(id)a5;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)didReceiveCheckCompanionPeerPaymentState;
- (void)didReceivePaymentSetupRequestForApplicationName:(id)a3;
- (void)doesWatchSupportPassLikeCompanionPassWithUniqueID:(id)a3 withCompletion:(id)a4;
- (void)encryptedServiceProviderDataForPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)fetchCatalogIfChanged:(id)a3;
- (void)fetchPendingTransactionForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)handleGizmoInitiatedAddPassRequest:(id)a3;
- (void)handleGizmoInitiatedDeletePassRequest:(id)a3;
- (void)handleGizmoReceivedNewLibraryHashRequest:(id)a3;
- (void)handleRelevantPassesNeededRequest:(id)a3;
- (void)handleUpdatedSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)lowPowerModeMonitor:(id)a3 didUpdateLowPowerModeEnabled:(BOOL)a4;
- (void)markPendingTransactionAsProcessedForPassWithUniqueID:(id)a3;
- (void)notifySettingsChangedForPassWithUniqueID:(id)a3 previousSettings:(unint64_t)a4 newSettings:(unint64_t)a5;
- (void)passLibrary:(id)a3 requestsAdditionOfPasses:(id)a4 completion:(id)a5;
- (void)passLibrary:(id)a3 requestsDeletionOfPassWithUniqueID:(id)a4 completion:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithBalances:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4 completion:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitAppletState:(id)a4;
- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4;
- (void)postAddReminderNotificationForPassWithUniqueID:(id)a3;
- (void)postVerifyReminderNotificationForPassWithUniqueID:(id)a3;
- (void)remoteDevicesManager:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5;
- (void)remoteDevicesManager:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5;
- (void)removeReminderNotificationForPassWithUniqueID:(id)a3;
- (void)resyncNeededRequest:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)serviceProviderDataForPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)setActiveClientsQueue:(id)a3;
- (void)setActiveCompanionAgentClientsHashTable:(id)a3;
- (void)setActivePassLibraryClientsHashTable:(id)a3;
- (void)setBulletinManager:(id)a3;
- (void)setBulletinScheduler:(id)a3;
- (void)setCapabilityUpdateNotificationToken:(int)a3;
- (void)setCompanionCatalogManager:(id)a3;
- (void)setCompanionPaymentPassDatabase:(id)a3;
- (void)setCompanionPeerPaymentStatusObserver:(id)a3;
- (void)setDemoModePassCopier:(id)a3;
- (void)setGeneralService:(id)a3;
- (void)setGizmoDatabase:(id)a3;
- (void)setGizmoWaitingForRelevantPasses:(BOOL)a3;
- (void)setHasCandidateRelevantPasses:(BOOL)a3;
- (void)setInitializedPairingIdentifier:(id)a3;
- (void)setLastKnownResyncID:(id)a3;
- (void)setLastRelevantPassInfoSendDate:(id)a3;
- (void)setLastRelevantPassRequestDate:(id)a3;
- (void)setLastSeenRelevantPassInfo:(id)a3;
- (void)setLibraryListener:(id)a3;
- (void)setMaintenanceService:(id)a3;
- (void)setNpsDomainAccessor:(id)a3;
- (void)setNpsManager:(id)a3;
- (void)setOutstandingDeletionStore:(id)a3;
- (void)setPairedSyncCoordinator:(id)a3;
- (void)setPassSyncService:(id)a3;
- (void)setPerformAfterDatabaseUnlocks:(id)a3;
- (void)setPerformAfterDatabaseUnlocksAndPairedSyncAllowed:(id)a3;
- (void)setReconcileWorkQueues:(id)a3;
- (void)setRelevancyService:(id)a3;
- (void)setRemoteAdminConnectionServiceAgent:(id)a3;
- (void)setShouldDropIDSMessages:(BOOL)a3;
- (void)setStopDroppingIDSMessagesTimer:(id)a3;
- (void)setViewServiceConnectionManager:(id)a3;
- (void)setWasLimitPush:(BOOL)a3;
- (void)setWatchOfferProvisioningCompletionHandlers:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
@end

@implementation NPKCompanionAgent

- (NPKCompanionAgent)init
{
  v44.receiver = self;
  v44.super_class = (Class)NPKCompanionAgent;
  v2 = [(NPKCompanionAgent *)&v44 init];
  if (v2)
  {
    v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Initializing NPKCompanionAgent", (uint8_t *)buf, 2u);
      }
    }
    NPKInitializeActiveDeviceChangedNotifications();
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleActiveDeviceChanged:" name:NPKActiveDeviceChangedNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    CFStringRef v8 = (const __CFString *)PKWalletPreferencesChangedNotification;
    [v7 addObserver:v2 selector:"_handleWalletPreferencesChanged:" name:PKWalletPreferencesChangedNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    CFStringRef v10 = (const __CFString *)PKPublicWalletPreferencesChangedNotification;
    [v9 addObserver:v2 selector:"_handlePublicWalletPreferencesChanged:" name:PKPublicWalletPreferencesChangedNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10000E1E0, v8, 0, (CFNotificationSuspensionBehavior)0);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)sub_10000E238, v10, 0, (CFNotificationSuspensionBehavior)0);
    objc_initWeak(buf, v2);
    v2->_capabilityUpdateNotificationToken = -1;
    v13 = (const char *)[NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification UTF8String];
    id v14 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000E290;
    handler[3] = &unk_10006D208;
    objc_copyWeak(&v42, buf);
    notify_register_dispatch(v13, &v2->_capabilityUpdateNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    [(NPKCompanionAgent *)v2 _registerDistributedNotificationHandler];
    [(NPKCompanionAgent *)v2 _registerDarwinNotificationHandler];
    [(NPKCompanionAgent *)v2 _migrateLoggingDefaults];
    id v15 = [objc_alloc((Class)NPKWorkQueue) initWithQueue:0 takeOutTransactions:1];
    [(NPKCompanionAgent *)v2 setWorkQueue:v15];

    v16 = [(NPKCompanionAgent *)v2 workQueue];
    [v16 setWorkQueueName:@"NPKCompanionAgent-main"];

    v17 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    [(NPKCompanionAgent *)v2 setActiveCompanionAgentClientsHashTable:v17];

    v18 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    [(NPKCompanionAgent *)v2 setActivePassLibraryClientsHashTable:v18];

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.NPKCompanionAgent.activeClients", 0);
    [(NPKCompanionAgent *)v2 setActiveClientsQueue:v19];

    v20 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.passbook"];
    [v20 setDelegate:v2];
    [(NPKCompanionAgent *)v2 setPairedSyncCoordinator:v20];
    -[NPKCompanionAgent setWasLimitPush:](v2, "setWasLimitPush:", [v20 syncRestriction] == (id)1);
    v21 = (NPKIDVRemoteDevicesManager *)[objc_alloc((Class)NPKIDVRemoteDevicesManager) initWithDataSource:v2];
    remoteDeviceManager = v2->_remoteDeviceManager;
    v2->_remoteDeviceManager = v21;

    v23 = objc_alloc_init(NPKCompanionViewServiceConnectionManager);
    viewServiceConnectionManager = v2->_viewServiceConnectionManager;
    v2->_viewServiceConnectionManager = v23;

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000E338;
    v39[3] = &unk_10006CFC0;
    v25 = v2;
    v40 = v25;
    [v25 _performAfterFirstDeviceUnlock:v39];
    dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    [v25 setStopDroppingIDSMessagesTimer:v26];

    v27 = [v25 stopDroppingIDSMessagesTimer];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000E340;
    v37[3] = &unk_10006D230;
    objc_copyWeak(&v38, buf);
    dispatch_source_set_event_handler(v27, v37);

    v28 = [v25 stopDroppingIDSMessagesTimer];
    dispatch_source_set_timer(v28, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

    v29 = [v25 stopDroppingIDSMessagesTimer];
    dispatch_resume(v29);

    id v30 = objc_alloc((Class)NSXPCListener);
    id v31 = [v30 initWithMachServiceName:_NPKCompanionServerMachServiceName];
    [v31 setDelegate:v25];
    [v25 setXpcListener:v31];
    [v31 resume];
    id v32 = objc_alloc((Class)NSXPCListener);
    id v33 = [v32 initWithMachServiceName:PKCompanionWatchPassLibraryMachServiceName];
    [v33 setDelegate:v25];
    [v25 setLibraryListener:v33];
    [v33 resume];
    id v34 = objc_alloc_init((Class)NPKLowPowerModeRemoteDeviceMonitor);
    id v35 = v25[37];
    v25[37] = v34;

    [v25[37] registerObserver:v25];
    objc_destroyWeak(&v38);

    objc_destroyWeak(&v42);
    objc_destroyWeak(buf);
  }
  return v2;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_capabilityUpdateNotificationToken)) {
    notify_cancel(self->_capabilityUpdateNotificationToken);
  }
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  BOOL v4 = [(NPKCompanionAgent *)self stopDroppingIDSMessagesTimer];
  dispatch_source_cancel(v4);

  [(NPKCompanionAgent *)self setStopDroppingIDSMessagesTimer:0];
  v5.receiver = self;
  v5.super_class = (Class)NPKCompanionAgent;
  [(NPKCompanionAgent *)&v5 dealloc];
}

- (void)_updateInitializationForActiveDevice
{
  v3 = [(NPKCompanionAgent *)self initializedPairingIdentifier];
  BOOL v4 = NPKPairedOrPairingDevice();
  objc_super v5 = [v4 valueForProperty:NRDevicePropertyPairingID];
  v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    CFStringRef v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      CFStringRef v10 = v3;
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Updating initialization for active device\n\tInitialized pairing identifier: %@\n\tCurrent pairing identifier: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  if ((PKEqualObjects() & 1) == 0)
  {
    if (v3) {
      [(NPKCompanionAgent *)self _tearDownPairingSpecificStateForPairingIdentifier:v3];
    }
    if (v5) {
      [(NPKCompanionAgent *)self _initializePairingSpecificStateForDevice:v4];
    }
    [(NPKCompanionAgent *)self _disconnectAllClients];
  }
}

- (void)_initializePairingSpecificStateForDevice:(id)a3
{
  id v4 = a3;
  v57 = [v4 valueForProperty:NRDevicePropertyPairingID];
  objc_super v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v57;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Initializing pairing-specific state for pairing identifier %@", buf, 0xCu);
    }
  }
  [(NPKCompanionAgent *)self _logDebugInformationWithExpectedPairedDeviceID:v57];
  CFStringRef v8 = objc_alloc_init(NPDBulletinManager);
  [(NPKCompanionAgent *)self setBulletinManager:v8];

  id v9 = objc_alloc_init((Class)NPSManager);
  [(NPKCompanionAgent *)self setNpsManager:v9];

  id v10 = objc_alloc((Class)NPSDomainAccessor);
  id v11 = [v10 initWithDomain:NPKDefaultsDomain];
  [(NPKCompanionAgent *)self setNpsDomainAccessor:v11];

  v12 = [NPDOutstandingPassDeletionStore alloc];
  v13 = [(NPKCompanionAgent *)self npsDomainAccessor];
  id v14 = [(NPDOutstandingPassDeletionStore *)v12 initWithDomainAccessor:v13];
  [(NPKCompanionAgent *)self setOutstandingDeletionStore:v14];

  id v15 = +[NSMutableSet set];
  [(NPKCompanionAgent *)self setReconcileWorkQueues:v15];

  v16 = +[NSMutableArray array];
  [(NPKCompanionAgent *)self setWatchOfferProvisioningCompletionHandlers:v16];

  v17 = [NPDCompanionPaymentPassDatabase alloc];
  v18 = [(NPKCompanionAgent *)self outstandingDeletionStore];
  dispatch_queue_t v19 = [(NPDCompanionPaymentPassDatabase *)v17 initWithDevice:v4 outstandingDeletionStore:v18];

  [(NPKCompanionAgent *)self setCompanionPaymentPassDatabase:v19];
  v20 = pk_General_log();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    v22 = pk_General_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notice: Companion payment pass database initialized", buf, 2u);
    }
  }
  v23 = +[NSNotificationCenter defaultCenter];
  [v23 addObserver:self selector:"_handleCompanionPaymentPassDatabaseChanged:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.Changed" object:v19];

  v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"_handleCompanionSyncDatabaseChanged:" name:NPKGizmoDatabaseChangedNotificationName object:0];

  v56 = [[NPDDemoModePassCopier alloc] initWithCompanionPaymentPassDatabase:v19];
  [(NPKCompanionAgent *)self setDemoModePassCopier:v56];
  v25 = +[NSFileManager defaultManager];
  dispatch_source_t v26 = NPKHomeDirectoryPath();
  [v25 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];

  objc_initWeak(&location, self);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10000EEE4;
  v65[3] = &unk_10006D258;
  objc_copyWeak(&v68, &location);
  id v27 = v4;
  id v66 = v27;
  v67 = self;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v65];
  id v28 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.passbook.relevancy"];
  [v28 setProtobufAction:"handleRelevantPassesNeededRequest:" forIncomingRequestsOfType:3];
  id v29 = &_dispatch_main_q;
  [v28 addDelegate:self queue:&_dispatch_main_q];

  [(NPKCompanionAgent *)self setRelevancyService:v28];
  id v30 = [NPKRemoteAdminConnectionServiceAgent alloc];
  id v31 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  id v32 = [(NPKRemoteAdminConnectionServiceAgent *)v30 initWithCompanionPaymentPassDatabase:v31];

  [(NPKRemoteAdminConnectionServiceAgent *)v32 setDelegate:self];
  [(NPKCompanionAgent *)self setRemoteAdminConnectionServiceAgent:v32];
  id v33 = objc_alloc_init(NPDCompanionMaintenanceService);
  id v34 = [(NPKCompanionAgent *)self bulletinManager];
  [(NPDCompanionMaintenanceService *)v33 setBulletinManager:v34];

  [(NPDCompanionMaintenanceService *)v33 setDelegate:self];
  [(NPKCompanionAgent *)self setMaintenanceService:v33];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10000F0E4;
  v63[3] = &unk_10006CFC0;
  id v35 = v32;
  v64 = v35;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v63];
  v36 = [[NPDCompanionPeerPaymentStatusObserver alloc] initWithRemoteAdminConnectionServiceAgent:v35];
  [(NPKCompanionAgent *)self setCompanionPeerPaymentStatusObserver:v36];

  v37 = +[NPKGizmoDatabase sharedDatabase];
  [(NPKCompanionAgent *)self setGizmoDatabase:v37];

  +[NPKGizmoDatabase setMigrationDataSource:self];
  id v38 = objc_alloc_init(NPKCompanionCatalogManager);
  [(NPKCompanionAgent *)self setCompanionCatalogManager:v38];

  v39 = [(NPKCompanionAgent *)self gizmoDatabase];
  v40 = objc_msgSend(v39, "libraryHashForWatchOSMajorVersion:", -[NPKCompanionAgent versionForCompleteHash](self, "versionForCompleteHash"));
  LODWORD(v34) = v40 == 0;

  if (v34)
  {
    v41 = pk_General_log();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);

    if (v42)
    {
      v43 = pk_General_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Notice: No passes in library; doing full sync",
          buf,
          2u);
      }
    }
    -[NPKCompanionAgent _doFullSyncWithResyncID:](self, "_doFullSyncWithResyncID:", 0, &v68);
  }
  else
  {
    [(NPKCompanionAgent *)self _doSync];
  }
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10000F174;
  v61[3] = &unk_10006D280;
  objc_copyWeak(&v62, &location);
  v61[4] = self;
  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000F238;
  handler[3] = &unk_10006D2A8;
  objc_super v44 = objc_retainBlock(v61);
  id v59 = v44;
  uint32_t v45 = notify_register_dispatch("com.apple.nanopassbook.setupcomplete", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  if (v45)
  {
    v46 = pk_General_log();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

    if (v47)
    {
      v48 = pk_General_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Error: Could not register for setup complete notification!", buf, 2u);
      }
    }
  }
  [(NPKCompanionAgent *)self _handleCompanionPaymentPassDatabaseChangedBroadcastUnconditionally:0];
  [(NPKCompanionAgent *)self _doSync];
  v49 = objc_alloc_init(NPDCardSetupReminderNotificationScheduler);
  [(NPDCardSetupReminderNotificationScheduler *)v49 setDelegate:self];
  [(NPKCompanionAgent *)self setBulletinScheduler:v49];
  [(NPKCompanionAgent *)self setInitializedPairingIdentifier:v57];
  v50 = [(NPKCompanionAgent *)self remoteDeviceManager];
  [v50 deviceDidBecomeActive:v27];

  v51 = pk_General_log();
  BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);

  if (v52)
  {
    v53 = pk_General_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v57;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Notice: Initialization for pairing identifier %@ complete", buf, 0xCu);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, PKCompanionAgentServiceListenerResumedNotification, 0, 0, 1u);
  notify_post((const char *)[NPDCompanionAgentStartedDarwinNotificationName UTF8String]);

  objc_destroyWeak(&v62);
  objc_destroyWeak(v55);
  objc_destroyWeak(&location);
}

- (void)_tearDownPairingSpecificStateForPairingIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Tearing down pairing-specific state for previous pairing identifier %@", (uint8_t *)&v17, 0xCu);
    }
  }
  CFStringRef v8 = [(NPKCompanionAgent *)self remoteAdminConnectionServiceAgent];
  [v8 setDelegate:0];
  [(NPKCompanionAgent *)self setRemoteAdminConnectionServiceAgent:0];
  [(NPKCompanionAgent *)self setLastSeenRelevantPassInfo:0];
  [(NPKCompanionAgent *)self setLastRelevantPassInfoSendDate:0];
  [(NPKCompanionAgent *)self setLastRelevantPassRequestDate:0];
  [(NPKCompanionAgent *)self setGizmoWaitingForRelevantPasses:0];
  [(NPKCompanionAgent *)self setHasCandidateRelevantPasses:0];
  [(NPKCompanionAgent *)self setGizmoDatabase:0];
  [(NPKCompanionAgent *)self setCompanionPaymentPassDatabase:0];
  [(NPKCompanionAgent *)self setCompanionCatalogManager:0];
  [(NPKCompanionAgent *)self setBulletinManager:0];
  [(NPKCompanionAgent *)self setBulletinScheduler:0];
  [(NPKCompanionAgent *)self setCompanionPeerPaymentStatusObserver:0];
  [(NPKCompanionAgent *)self setNpsManager:0];
  [(NPKCompanionAgent *)self setNpsDomainAccessor:0];
  [(NPKCompanionAgent *)self setOutstandingDeletionStore:0];
  [(NPKCompanionAgent *)self setReconcileWorkQueues:0];
  [(NPKCompanionAgent *)self setWatchOfferProvisioningCompletionHandlers:0];
  id v9 = [(NPKCompanionAgent *)self generalService];
  [v9 removeDelegate:self];
  [(NPKCompanionAgent *)self setGeneralService:0];
  id v10 = [(NPKCompanionAgent *)self relevancyService];
  [v10 removeDelegate:self];
  [(NPKCompanionAgent *)self setRelevancyService:0];
  id v11 = [(NPKCompanionAgent *)self passSyncService];
  [v11 teardownSync];
  [(NPKCompanionAgent *)self setPassSyncService:0];
  [(NPKCompanionAgent *)self setMaintenanceService:0];
  [(NPKCompanionAgent *)self setDemoModePassCopier:0];
  [(NPKCompanionAgent *)self setInitializedPairingIdentifier:0];
  v12 = [(NPKCompanionAgent *)self remoteDeviceManager];
  [v12 deviceDidBecomeInactive];

  v13 = +[NPKGizmoDatabase sharedDatabase];
  [v13 teardownDB];

  id v14 = pk_General_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    v16 = pk_General_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Teardown for previous pairing identifier %@ complete", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)_disconnectAllClients
{
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notice: Disconnecting all daemon clients", buf, 2u);
    }
  }
  *(void *)buf = 0;
  BOOL v42 = buf;
  uint64_t v43 = 0x3032000000;
  objc_super v44 = sub_10000FAAC;
  uint32_t v45 = sub_10000FABC;
  id v46 = 0;
  objc_super v5 = [(NPKCompanionAgent *)self activeClientsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FAC4;
  block[3] = &unk_10006CD78;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(v5, block);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = *((id *)v42 + 5);
  id v7 = [v6 countByEnumeratingWithState:&v36 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v37;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v11 = pk_General_log();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

        if (v12)
        {
          v13 = pk_General_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v14 = [v10 remoteProcessIdentifier];
            BOOL v15 = [v10 remoteProcessApplicationIdentifier];
            v16 = [v10 remoteProcessBundleIdentifier];
            *(_DWORD *)BOOL v52 = 67109634;
            *(_DWORD *)&v52[4] = v14;
            *(_WORD *)v53 = 2112;
            *(void *)&v53[2] = v15;
            *(_WORD *)&v53[10] = 2112;
            *(void *)&v53[12] = v16;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Tearing down client connection to PID %d (%@ %@)", v52, 0x1Cu);
          }
        }
        int v17 = [v10 connection];
        [v17 invalidate];
      }
      id v7 = [v6 countByEnumeratingWithState:&v36 objects:v56 count:16];
    }
    while (v7);
  }

  *(void *)BOOL v52 = 0;
  *(void *)v53 = v52;
  *(void *)&v53[8] = 0x3032000000;
  *(void *)&v53[16] = sub_10000FAAC;
  v54 = sub_10000FABC;
  id v55 = 0;
  id v18 = [(NPKCompanionAgent *)self activeClientsQueue];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000FB2C;
  v35[3] = &unk_10006CD78;
  v35[4] = self;
  v35[5] = v52;
  dispatch_sync(v18, v35);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = *(id *)(*(void *)v53 + 40);
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        v24 = pk_General_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (v25)
        {
          dispatch_source_t v26 = pk_General_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v27 = [v23 remoteProcessIdentifier];
            id v28 = [v23 remoteProcessApplicationIdentifier];
            *(_DWORD *)BOOL v47 = 67109378;
            unsigned int v48 = v27;
            __int16 v49 = 2112;
            v50 = v28;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Notice: Tearing down pass library connection to PID %d (%@)", v47, 0x12u);
          }
        }
        id v29 = [v23 connection];
        [v29 invalidate];
      }
      id v20 = [v19 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v20);
  }

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_createSyncServiceIfNecessary
{
  int v3 = NPKIsPairedDeviceStandalone();
  id v4 = [(NPKCompanionAgent *)self generalService];
  objc_super v5 = v4;
  if (v3)
  {
    id v6 = [(NPKCompanionAgent *)self passSyncService];

    if (!v6)
    {
      id v7 = NPKPairedOrPairingDevice();
      sub_10000B838();

      uint64_t v8 = [NPDCompanionPassSyncService alloc];
      id v9 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
      id v10 = [(NPDCompanionPassSyncService *)v8 initWithCompanionPaymentPassDatabase:v9];

      [(NPDCompanionPassSyncService *)v10 setDelegate:self];
      [(NPDCompanionPassSyncService *)v10 setDataSource:self];
      [(NPKCompanionAgent *)self setPassSyncService:v10];
      [(NPDCompanionPassSyncService *)v10 start];
      if (v5) {
        [(NPDCompanionPassSyncService *)v10 handlePassLibraryChanged];
      }
      else {
        [(NPDCompanionPassSyncService *)v10 initiateSync];
      }
    }
    if (v5)
    {
      id v18 = pk_Payment_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        id v20 = pk_Payment_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Notice: Tearing down general service now that paired device is standalone", v23, 2u);
        }
      }
      [v5 removeDelegate:self];
      [(NPKCompanionAgent *)self setGeneralService:0];
    }
  }
  else
  {

    if (!v5)
    {
      id v11 = pk_Payment_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        v13 = pk_Payment_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Creating general service for non-standalone device", buf, 2u);
        }
      }
      id v14 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.passbook.general"];
      [v14 setProtobufAction:"resyncNeededRequest:" forIncomingRequestsOfType:4];
      [v14 setProtobufAction:"handleGizmoInitiatedAddPassRequest:" forIncomingRequestsOfType:10];
      [v14 setProtobufAction:"handleGizmoInitiatedDeletePassRequest:" forIncomingRequestsOfType:6];
      [v14 setProtobufAction:"handleGizmoReceivedNewLibraryHashRequest:" forIncomingRequestsOfType:9];
      [v14 addDelegate:self queue:&_dispatch_main_q];
      [(NPKCompanionAgent *)self setGeneralService:v14];
    }
    objc_super v5 = [(NPKCompanionAgent *)self passSyncService];
    if (v5)
    {
      BOOL v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        int v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error: Paired device downgraded to non-standalone. This is not a supported configuration!", v21, 2u);
        }
      }
      [v5 teardownSync];
      [(NPKCompanionAgent *)self setPassSyncService:0];
    }
  }
}

- (void)_registerDistributedNotificationHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  int v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    objc_super v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Registering for distributed notifications", (uint8_t *)buf, 2u);
    }
  }
  objc_initWeak(buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FFE4;
  v6[3] = &unk_10006D2F8;
  v6[4] = self;
  objc_copyWeak(&v7, buf);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_registerDarwinNotificationHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  int v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    objc_super v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Registering for Darwin notifications", (uint8_t *)buf, 2u);
    }
  }
  objc_initWeak(buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000106C4;
  v6[3] = &unk_10006D2F8;
  v6[4] = self;
  objc_copyWeak(&v7, buf);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_logDebugInformationWithExpectedPairedDeviceID:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NRPairedDeviceRegistry sharedInstance];
  objc_super v5 = [v4 getActivePairedDevice];
  id v6 = [v5 valueForProperty:NRDevicePropertyPairingID];
  id v7 = [v6 UUIDString];

  uint64_t v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Current pairing ID: %@", buf, 0xCu);
    }
  }
  if (([v7 isEqualToString:v3] & 1) == 0)
  {
    id v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Current pairing ID doesn't match expected ID:%@", buf, 0xCu);
      }
    }
  }
  if (PKIsInternalInstall())
  {
    id v14 = +[NSMutableDictionary dictionary];
    BOOL v15 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
    BOOL v16 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v15];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100010DD0;
    v37[3] = &unk_10006D320;
    id v17 = v14;
    id v38 = v17;
    [v16 enumerateObjectsUsingBlock:v37];
    if (!v7)
    {
LABEL_22:
      if ([v17 count])
      {
        BOOL v25 = pk_General_log();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

        if (v26)
        {
          unsigned int v27 = pk_General_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v40 = v17;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Notice: Other pairing IDs and SEIDs: %@", buf, 0xCu);
          }
        }
      }
      id v28 = +[PKSecureElement secureElementIdentifiers];
      if ((unint64_t)[v28 count] < 2)
      {
        id v34 = [v28 count];
        id v35 = pk_General_log();
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

        if (!v34)
        {
          if (!v36) {
            goto LABEL_37;
          }
          long long v31 = pk_General_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Notice: No companion SEIDs", buf, 2u);
          }
          goto LABEL_36;
        }
        if (v36)
        {
          long long v31 = pk_General_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            long long v32 = [v28 firstObject];
            *(_DWORD *)buf = 138412290;
            id v40 = v32;
            long long v33 = "Notice: Companion SEID: %@";
            goto LABEL_35;
          }
LABEL_36:
        }
      }
      else
      {
        id v29 = pk_General_log();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

        if (v30)
        {
          long long v31 = pk_General_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            long long v32 = [v28 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138412290;
            id v40 = v32;
            long long v33 = "Notice: Companion SEIDs: %@";
LABEL_35:
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);

            goto LABEL_36;
          }
          goto LABEL_36;
        }
      }
LABEL_37:

      goto LABEL_38;
    }
    id v18 = [v17 objectForKey:v7];
    id v19 = [v18 count];
    id v20 = pk_General_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if ((unint64_t)v19 < 2)
    {
      if (v21)
      {
        v22 = pk_General_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [v18 firstObject];
          *(_DWORD *)buf = 138412290;
          id v40 = v23;
          v24 = "Notice: Current SEID: %@";
          goto LABEL_19;
        }
LABEL_20:
      }
    }
    else if (v21)
    {
      v22 = pk_General_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v18 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        id v40 = v23;
        v24 = "Notice: Current SEIDs: %@";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);

        goto LABEL_20;
      }
      goto LABEL_20;
    }
    [v17 removeObjectForKey:v7];

    goto LABEL_22;
  }
LABEL_38:
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4 = a4;
  objc_super v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: IDS service accounts changed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v4 = a4;
  objc_super v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: IDS service devices changed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  BOOL v16 = pk_General_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    id v18 = pk_General_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138413314;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error: IDS service incoming unhandled protobuf: %@ %@ %@ %@ %@", (uint8_t *)&v19, 0x34u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  BOOL v16 = pk_General_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    id v18 = pk_General_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138413314;
      __int16 v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 1024;
      BOOL v31 = v8;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Notice: IDS service did send with success: %@ %@ %@ %d %@", (uint8_t *)&v24, 0x30u);
    }
  }
  int v19 = [(NPKCompanionAgent *)self outstandingDeletionStore];
  [v19 noteDeliveryForMessageID:v14];

  if (!v8)
  {
    id v20 = [(NPKCompanionAgent *)self generalService];
    if (v20 != v12)
    {
LABEL_9:

      goto LABEL_10;
    }
    id v21 = [v15 code];

    if (v21 == (id)32)
    {
      [(NPKCompanionAgent *)self setShouldDropIDSMessages:1];
      id v22 = [(NPKCompanionAgent *)self passSyncService];
      [v22 setDropAllMessages:1];

      id v20 = [(NPKCompanionAgent *)self stopDroppingIDSMessagesTimer];
      dispatch_time_t v23 = dispatch_walltime(0, 300000000000);
      dispatch_source_set_timer(v20, v23, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (void)_stopDroppingIDSMessages
{
  [(NPKCompanionAgent *)self setShouldDropIDSMessages:0];
  id v3 = [(NPKCompanionAgent *)self passSyncService];
  [v3 setDropAllMessages:0];

  [(NPKCompanionAgent *)self _doFullSyncWithResyncID:0];
}

- (id)companionMaintenanceService:(id)a3 paymentPassForUniqueID:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  id v7 = [v6 paymentPassWithUniqueID:v5];

  return v7;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 pairedDevice];
  id v7 = [v6 valueForProperty:NRDevicePropertyName];
  BOOL v8 = [v6 valueForProperty:NRDevicePropertyPairingID];
  unsigned int v9 = [v5 syncSessionType];
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 UUIDString];
      id v14 = NSStringfromPSYSyncSessionType();
      int v19 = 138413058;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 1024;
      unsigned int v24 = v9;
      __int16 v25 = 2112;
      __int16 v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Received start sync command from paired sync:\n\tUUID: %@\n\tDevice name: %@\n\tSync type: %d (%@)", (uint8_t *)&v19, 0x26u);
    }
  }
  id v15 = [(NPKCompanionAgent *)self remoteAdminConnectionServiceAgent];
  [v15 updateRegionSupportIfNecessary];

  [(NPKCompanionAgent *)self _doPostUnlockPairedSyncAllowedWork];
  BOOL v16 = [(NPKCompanionAgent *)self demoModePassCopier];
  BOOL v17 = [(NPKCompanionAgent *)self passLibrary];
  [v16 performFullSyncWithPassLibrary:v17];

  if ([v5 syncSessionType])
  {
    if ([v5 syncSessionType] == (id)2)
    {
      id v18 = [(NPKCompanionAgent *)self remoteAdminConnectionServiceAgent];
      [v18 handleCompanionMigration];
    }
    [(NPKCompanionAgent *)self _doSync];
  }
  else
  {
    [(NPKCompanionAgent *)self _doFullSyncWithResyncID:0];
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v4 = [a3 syncRestriction];
  if (v4)
  {
    if (v4 == (id)1)
    {
      [(NPKCompanionAgent *)self setWasLimitPush:1];
    }
  }
  else
  {
    [(NPKCompanionAgent *)self _doPostUnlockPairedSyncAllowedWork];
    if ([(NPKCompanionAgent *)self wasLimitPush])
    {
      [(NPKCompanionAgent *)self setWasLimitPush:0];
      [(NPKCompanionAgent *)self _doSync];
    }
  }
}

- (BOOL)hasWatchPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  BOOL v6 = [v5 paymentPassWithUniqueID:v4];

  return v6 != 0;
}

- (BOOL)hasWatchPaymentPassRequiringVerificationWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  BOOL v6 = [v5 paymentPassWithUniqueID:v4];

  id v7 = NPKPairedDeviceSecureElementIdentifiers();
  if (v7) {
    [v6 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v7];
  }
  BOOL v8 = [v6 activationState] == (id)1;

  return v8;
}

- (BOOL)hasCompanionPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self passLibrary];
  BOOL v6 = [v5 passWithUniqueID:v4];

  return v6 != 0;
}

- (BOOL)hasWatchPaymentPassWithPairedTerminalIdentifier:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v65 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Checking whether watch has payment pass with paired terminal identifier %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    BOOL v8 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
    unsigned int v9 = [v8 uniqueIDs];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v59;
      uint64_t v49 = *(void *)v59;
      v50 = self;
      BOOL v52 = v10;
      while (2)
      {
        id v14 = 0;
        id v51 = v12;
        do
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8 * (void)v14);
          BOOL v16 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
          BOOL v17 = [v16 paymentPassWithUniqueID:v15];

          if (v17)
          {
            id v18 = NPKPairedDeviceSecureElementIdentifiers();
            if ([v18 count])
            {
              [v17 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v18];
              int v19 = +[NPKGizmoDatabase sharedDatabase];
              id v20 = [v19 subcredentialsForPassWithUniqueID:v15];

              __int16 v21 = [v17 devicePrimaryPaymentApplication];
              [v21 setSubcredentials:v20];
            }
            v53 = v18;
            id v22 = pk_General_log();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

            if (v23)
            {
              unsigned int v24 = pk_General_log();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v25 = [v17 devicePrimaryPaymentApplication];
                *(_DWORD *)buf = 138412290;
                CFStringRef v65 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Notice: Evaluating whether the device primary payment application (%@) contains a matching identifier.", buf, 0xCu);
              }
            }
            __int16 v26 = [v17 pairedTerminalIdentifier];
            unsigned __int8 v27 = [(__CFString *)v4 isEqualToString:v26];

            if (v27)
            {
LABEL_41:

              BOOL v41 = 1;
              goto LABEL_43;
            }
            __int16 v28 = [v17 paymentApplications];
            id v29 = pk_General_log();
            BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

            if (v30)
            {
              BOOL v31 = pk_General_log();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v65 = v28;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Notice: Evaluating whether any payment applications (%@) contain a matching identifier.", buf, 0xCu);
              }
            }
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            __int16 v32 = v28;
            id v33 = [(__CFString *)v32 countByEnumeratingWithState:&v54 objects:v62 count:16];
            if (v33)
            {
              id v34 = v33;
              uint64_t v35 = *(void *)v55;
              while (2)
              {
                for (i = 0; i != v34; i = (char *)i + 1)
                {
                  if (*(void *)v55 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  long long v37 = [*(id *)(*((void *)&v54 + 1) + 8 * i) subcredentials];
                  id v38 = [v37 anyObject];

                  if (v38)
                  {
                    long long v39 = [v38 pairedReaderIdentifier];
                    unsigned int v40 = [(__CFString *)v4 isEqualToString:v39];

                    if (v40)
                    {

                      id v10 = v52;
                      goto LABEL_41;
                    }
                  }
                }
                id v34 = [(__CFString *)v32 countByEnumeratingWithState:&v54 objects:v62 count:16];
                if (v34) {
                  continue;
                }
                break;
              }
            }

            uint64_t v13 = v49;
            self = v50;
            id v10 = v52;
            id v12 = v51;
          }

          id v14 = (char *)v14 + 1;
        }
        while (v14 != v12);
        id v12 = [v10 countByEnumeratingWithState:&v58 objects:v63 count:16];
        BOOL v41 = 0;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v41 = 0;
    }
LABEL_43:

    goto LABEL_44;
  }
  BOOL v42 = pk_General_log();
  BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);

  if (v43)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error: Expected to be provided a paired terminal identifier for consideration.", buf, 2u);
    }
    BOOL v41 = 0;
LABEL_44:

    goto LABEL_45;
  }
  BOOL v41 = 0;
LABEL_45:
  objc_super v44 = pk_General_log();
  BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);

  if (v45)
  {
    id v46 = pk_General_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v47 = @"NO";
      if (v41) {
        CFStringRef v47 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v65 = v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Notice: Has matching payment pass: %@", buf, 0xCu);
    }
  }
  return v41;
}

- (id)pairedTerminalIdentifierForCompanionPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Checking paired terminal identifier for companion payment pass with unique id %@", (uint8_t *)&v16, 0xCu);
    }
  }
  BOOL v8 = [(NPKCompanionAgent *)self passLibrary];
  unsigned int v9 = [v8 passWithUniqueID:v4];
  id v10 = [v9 paymentPass];

  id v11 = [v10 pairedTerminalIdentifier];
  id v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v10;
      __int16 v18 = 2112;
      int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Found pass %@ with paired terminal identifier %@", (uint8_t *)&v16, 0x16u);
    }
  }
  return v11;
}

- (void)doesWatchSupportPassLikeCompanionPassWithUniqueID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Checking whether watch supports adding passes like the companion payment pass with unique id %@", buf, 0xCu);
    }
  }
  id v11 = [(NPKCompanionAgent *)self passLibrary];
  id v12 = [v11 passWithUniqueID:v6];

  if (v12)
  {
    BOOL v13 = [v12 secureElementPass];
    unsigned int v14 = [v13 isCarKeyPass];

    if (!v14) {
      goto LABEL_13;
    }
    id v15 = objc_alloc_init((Class)PKAddCarKeyPassConfiguration);
    int v16 = [v12 secureElementPass];
    id v17 = [v16 devicePrimaryPaymentApplication];
    __int16 v18 = [v17 subcredentials];
    int v19 = [v18 anyObject];

    uint64_t v20 = (uint64_t)[v19 supportedRadioTechnologies];
    if (!v20)
    {
      __int16 v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Defaulting to NFC due to missing or invalid radioTechnologies: %lu", buf, 0xCu);
      }

      uint64_t v20 = 1;
    }
    [v15 setSupportedRadioTechnologies:v20];
    id v22 = [v19 manufacturerIdentifier];
    [v15 setManufacturerIdentifier:v22];

    BOOL v23 = [v19 brandIdentifier];
    [v15 setIssuerIdentifier:v23];

    if (v15)
    {
      unsigned int v24 = [(NPKCompanionAgent *)self paymentWebService];
      __int16 v25 = [v24 targetDevice];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100012410;
      v32[3] = &unk_10006D348;
      id v34 = v7;
      id v33 = v12;
      [v25 paymentWebService:v24 canAddSecureElementPassWithConfiguration:v15 completion:v32];
    }
    else
    {
LABEL_13:
      __int16 v26 = pk_General_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        __int16 v28 = pk_General_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v6;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Notice: Pass with unique id %@ doesn't have special support considerations; continuing...",
            buf,
            0xCu);
        }
      }
      if (v7) {
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
      }
    }
  }
  else
  {
    id v29 = pk_General_log();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      BOOL v31 = pk_General_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v6;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Warning: No companion payment pass for unique ID %@ was found!", buf, 0xCu);
      }
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (BOOL)hasAnyWatchPaymentPasses
{
  v2 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  id v3 = [v2 uniqueIDs];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)postAddReminderNotificationForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self passLibrary];
  id v6 = [v5 passWithUniqueID:v4];

  id v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Posting add reminder notification for %@", buf, 0xCu);
    }
  }
  id v10 = [v6 paymentPass];
  int v11 = NPKIsAddToWatchSupportedForCompanionPaymentPass();

  if (v11)
  {
    id v12 = [v6 paymentPass];
    unsigned int v13 = [v12 isAccessPass];

    if (v13)
    {
      unsigned int v14 = +[NSBundle bundleForClass:objc_opt_class()];
      id v15 = v14;
      CFStringRef v16 = @"SETUP_REMINDER_MESSAGE_ACCESS_SPECIFIC";
    }
    else
    {
      int v20 = NPKReferredToAsAccount();
      unsigned int v14 = +[NSBundle bundleForClass:objc_opt_class()];
      id v15 = v14;
      if (v20) {
        CFStringRef v16 = @"SETUP_REMINDER_MESSAGE_ACCOUNT_SPECIFIC";
      }
      else {
        CFStringRef v16 = @"SETUP_REMINDER_MESSAGE_SPECIFIC";
      }
    }
    __int16 v21 = [v14 localizedStringForKey:v16 value:&stru_10006EFD0 table:@"NanoPassKit"];
    id v22 = [v6 localizedDescription];
    int v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v22);

    BOOL v23 = [(NPKCompanionAgent *)self bulletinManager];
    unsigned int v24 = +[NSBundle bundleForClass:objc_opt_class()];
    __int16 v25 = [v24 localizedStringForKey:@"APPLE_WATCH" value:&stru_10006EFD0 table:@"NanoPassKit"];
    [v23 insertBridgeBulletinWithTitle:v25 message:v19 actionURL:0 forPass:v6];

LABEL_15:
    goto LABEL_16;
  }
  id v17 = pk_General_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    int v19 = pk_General_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Notice: Add to watch is not supported for payment pass with unique id %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)postVerifyReminderNotificationForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  id v13 = [v5 paymentPassWithUniqueID:v4];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"VERIFY_REMINDER_MESSAGE_SPECIFIC" value:&stru_10006EFD0 table:@"NanoPassKit"];
  BOOL v8 = [v13 localizedDescription];
  BOOL v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  id v10 = [(NPKCompanionAgent *)self bulletinManager];
  int v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"APPLE_WATCH" value:&stru_10006EFD0 table:@"NanoPassKit"];
  [v10 insertBridgeBulletinWithTitle:v12 message:v9 actionURL:0 forPass:v13];
}

- (void)removeReminderNotificationForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self bulletinManager];
  [v5 removeBridgeBulletinsForPassWithUniqueID:v4];
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = sub_10000FAAC;
  id v27 = sub_10000FABC;
  id v28 = 0;
  BOOL v8 = [(NPKCompanionAgent *)self activeClientsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D54;
  block[3] = &unk_10006CD78;
  block[4] = self;
  block[5] = &v23;
  dispatch_sync(v8, block);

  BOOL v9 = pk_Payment_log();
  LODWORD(v8) = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v24[5];
      *(_DWORD *)buf = 138412546;
      id v31 = v6;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Transaction received for source identifier %@; sending to %@",
        buf,
        0x16u);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = (id)v24[5];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        CFStringRef v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v15), "connection", (void)v18);
        id v17 = [v16 remoteObjectProxy];

        [v17 transactionSourceIdentifier:v6 didReceiveTransaction:v7];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v13);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  __int16 v26 = sub_10000FAAC;
  id v27 = sub_10000FABC;
  id v28 = 0;
  BOOL v8 = [(NPKCompanionAgent *)self activeClientsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001307C;
  block[3] = &unk_10006CD78;
  block[4] = self;
  block[5] = &v23;
  dispatch_sync(v8, block);

  BOOL v9 = pk_Payment_log();
  LODWORD(v8) = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v24[5];
      *(_DWORD *)buf = 138412802;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      uint64_t v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Transaction with identifier: %@ for source identifier: %@ removed; sending to %@",
        buf,
        0x20u);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = (id)v24[5];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        CFStringRef v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v15), "connection", (void)v18);
        id v17 = [v16 remoteObjectProxy];

        [v17 transactionSourceIdentifier:v6 didRemoveTransactionWithIdentifier:v7];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v13);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitAppletState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Got updated transit applet state %@ for pass with unique ID %@. Processing subject to first unlock and paired sync.", buf, 0x16u);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100013254;
  v13[3] = &unk_10006CF68;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v13];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithBalances:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: (PKPaymentBalance set) Got updated balances %@ for pass with unique ID %@. Processing subject to first unlock and paired sync.", buf, 0x16u);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001384C;
  v13[3] = &unk_10006CF68;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v13];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: (PKPaymentBalanceReminder set) Got updated balance reminder %@ for balance %@ and pass with unique ID %@. Processing subject to first unlock and paired sync.", buf, 0x20u);
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013DF0;
  v17[3] = &unk_10006D3C0;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v8;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v17];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: (PKAppletSubcredential set) Got updated credentials %@ for pass with unique ID %@. Processing subject to first unlock and paired sync.", buf, 0x16u);
    }
  }
  id v16 = v8;
  id v17 = v7;
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  NPKGuaranteeMainThread();
}

- (void)didReceivePaymentSetupRequestForApplicationName:(id)a3
{
  id v10 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"REMOTE_SETUP_ALERT_TITLE" value:&stru_10006EFD0 table:@"NanoPassKit"];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v10)
  {
    id v7 = [v6 localizedStringForKey:@"REMOTE_SETUP_ALERT_BODY" value:&stru_10006EFD0 table:@"NanoPassKit"];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v10);
  }
  else
  {
    id v8 = [v6 localizedStringForKey:@"REMOTE_SETUP_ALERT_BODY_NO_APP_NAME" value:&stru_10006EFD0 table:@"NanoPassKit"];
  }

  id v9 = [(NPKCompanionAgent *)self bulletinManager];
  [v9 insertBridgeBulletinWithTitle:v5 message:v8 actionURL:0 forPass:0];
}

- (void)didReceiveCheckCompanionPeerPaymentState
{
  id v2 = [(NPKCompanionAgent *)self companionPeerPaymentStatusObserver];
  [v2 handleWatchRequestForCompanionPeerPaymentRegistrationState];
}

- (void)companionPassSyncService:(id)a3 receivedUpdatedSettings:(unint64_t)a4 forPassWithUniqueID:(id)a5
{
}

- (unint64_t)companionPassSyncService:(id)a3 settingsForPassWithUniqueID:(id)a4
{
  id v5 = a4;
  id v6 = +[NPKGizmoDatabase sharedDatabase];
  id v7 = [v6 passForUniqueID:v5];

  id v8 = [(NPKCompanionAgent *)self passLibrary];
  id v9 = [v8 passWithUniqueID:v5];
  id v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 secureElementPass];

    if (!v11)
    {
      __int16 v20 = pk_General_log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
        id v22 = pk_General_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          id v25 = v5;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notice: Returning settings for non-payment pass with unique ID %@", (uint8_t *)&v24, 0xCu);
        }
      }
      id v15 = v10;
      goto LABEL_19;
    }
  }
  if (v7)
  {
    BOOL v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      id v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        id v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Returning settings for pass in the watch's pass library with unique ID %@", (uint8_t *)&v24, 0xCu);
      }
    }
    id v15 = v7;
LABEL_19:
    id v19 = [v15 settings];
    goto LABEL_20;
  }
  id v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    id v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412290;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error: Unable to find settings for pass with unique ID %@", (uint8_t *)&v24, 0xCu);
    }
  }
  id v19 = 0;
LABEL_20:

  return (unint64_t)v19;
}

- (PKPassLibrary)passLibrary
{
  p_passLibrary = &self->_passLibrary;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibrary);
  if (!WeakRetained)
  {
    id WeakRetained = objc_alloc_init((Class)PKPassLibrary);
    objc_storeWeak((id *)p_passLibrary, WeakRetained);
  }
  return (PKPassLibrary *)WeakRetained;
}

- (id)temporarilyRetainedPassLibrary
{
  id v2 = [(NPKCompanionAgent *)self passLibrary];
  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  id v4 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015010;
  block[3] = &unk_10006CFC0;
  id v5 = v2;
  id v8 = v5;
  dispatch_after(v3, v4, block);

  return v5;
}

- (id)libraryHash
{
  dispatch_time_t v3 = [(NPKCompanionAgent *)self gizmoDatabase];
  id v4 = objc_msgSend(v3, "libraryHashForWatchOSMajorVersion:", -[NPKCompanionAgent versionForCompleteHash](self, "versionForCompleteHash"));

  return v4;
}

- (void)_handleCompanionPassLibraryChanged:(id)a3
{
  id v4 = a3;
  if ([(NPKCompanionAgent *)self shouldDropIDSMessages]) {
    goto LABEL_39;
  }
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library changed (%@)", buf, 0xCu);
    }
  }
  id v8 = [(NPKCompanionAgent *)self pairedSyncCoordinator];
  if ([v8 syncRestriction])
  {
    int IsTinker = NPKPairedOrPairingDeviceIsTinker();

    if (!IsTinker)
    {
      id v10 = pk_General_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        BOOL v12 = pk_General_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Paired sync restriction in place...suppressing library changed notification", buf, 2u);
        }
      }
      goto LABEL_39;
    }
  }
  else
  {
  }
  if (NPKIsPairedDeviceStandalone())
  {
    BOOL v13 = [v4 name];
    unsigned int v14 = [v13 isEqualToString:PKPassSettingsDidChangeNotification];

    if (!v14)
    {
      __int16 v23 = [v4 name];
      unsigned int v24 = [v23 isEqualToString:PKPassLibraryCatalogDidChangeNotification];

      if (v24)
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10001567C;
        v43[3] = &unk_10006D460;
        v43[4] = self;
        [(NPKCompanionAgent *)self fetchCatalogIfChanged:v43];
        goto LABEL_32;
      }
      id v16 = [(NPKCompanionAgent *)self passSyncService];
      [v16 handlePassLibraryChanged];
      goto LABEL_31;
    }
    id v15 = [v4 userInfo];
    id v16 = [v15 objectForKeyedSubscript:PKPassLibraryUniqueIDUserInfoKey];

    BOOL v17 = [v4 userInfo];
    id v18 = [v17 objectForKeyedSubscript:PKPassLibrarySettingsUserInfoKey];

    if (v16 && v18)
    {
      id v19 = [(NPKCompanionAgent *)self passLibrary];
      __int16 v20 = [v19 passWithUniqueID:v16];

      if ([(NPKCompanionAgent *)self _shouldSyncPassFromCompanionPassLibrary:v20])
      {
        uint64_t v21 = [v18 unsignedIntValue];
        id v22 = [(NPKCompanionAgent *)self passSyncService];
        [v22 handleSettingsChanged:v21 forPassWithUniqueID:v16];
      }
      else
      {
        id v27 = pk_General_log();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

        if (!v28) {
          goto LABEL_29;
        }
        id v22 = pk_General_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v16;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notice: Not syncing companion settings change for pass with unique ID %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v25 = pk_General_log();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (!v26)
      {
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      __int16 v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v45 = v16;
        __int16 v46 = 2112;
        CFStringRef v47 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Warning: Missing pass unique ID (%@) or settings (%@) in notification", buf, 0x16u);
      }
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:
  id v29 = [v4 name];
  unsigned int v30 = [v29 isEqualToString:PKPassLibraryDidAddPassNotification];

  if (v30)
  {
    id v31 = [v4 userInfo];
    __int16 v32 = [v31 objectForKeyedSubscript:PKPassLibraryUniqueIDUserInfoKey];

    [(NPKCompanionAgent *)self _handleCompanionPassAddedWithID:v32];
LABEL_38:

    goto LABEL_39;
  }
  id v33 = [v4 name];
  if ([v33 isEqualToString:PKPassLibraryDidUpdatePassNotification])
  {

LABEL_37:
    id v36 = [v4 userInfo];
    __int16 v32 = [v36 objectForKeyedSubscript:PKPassLibraryUniqueIDUserInfoKey];

    [(NPKCompanionAgent *)self _handleCompanionPassUpdatedWithID:v32];
    goto LABEL_38;
  }
  __int16 v34 = [v4 name];
  unsigned int v35 = [v34 isEqualToString:PKPassSettingsDidChangeNotification];

  if (v35) {
    goto LABEL_37;
  }
  long long v37 = [v4 name];
  unsigned int v38 = [v37 isEqualToString:PKPassLibraryDidRemovePassNotification];

  if (v38)
  {
    long long v39 = [v4 userInfo];
    __int16 v32 = [v39 objectForKeyedSubscript:PKPassLibraryUniqueIDUserInfoKey];

    [(NPKCompanionAgent *)self _handleCompanionPassRemovedWithID:v32];
    goto LABEL_38;
  }
  unsigned int v40 = [v4 name];
  unsigned int v41 = [v40 isEqualToString:PKPassLibraryCatalogDidChangeNotification];

  if (v41 && (NPKIsRunningInUIOnlyDemoMode() & 1) == 0 && (NPKIsRunningInStoreDemoMode() & 1) == 0)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000156F4;
    v42[3] = &unk_10006D460;
    v42[4] = self;
    [(NPKCompanionAgent *)self fetchCatalogIfChanged:v42];
  }
LABEL_39:
}

- (void)_migrateLoggingDefaults
{
  if (PKIsInternalInstall())
  {
    CFStringRef v3 = (const __CFString *)NPKDefaultsDomain;
    CFPreferencesSetAppValue(@"Log", 0, NPKDefaultsDomain);
    CFPreferencesSetAppValue(@"Log.General", 0, v3);
    CFPreferencesSetAppValue(@"Log.Stockholm", 0, v3);
    CFPreferencesSetAppValue(@"Log.Relevance", 0, v3);
    CFPreferencesSetAppValue(@"LogCrashReporter", 0, PKStockholmDomain);
    [(NPKCompanionAgent *)self _handlePassbookGlobalPreferencesChanged];
  }
}

- (void)_handleCompanionPaymentPassDatabaseChanged:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Companion payment pass database changed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(NPKCompanionAgent *)self _handleCompanionPaymentPassDatabaseChangedBroadcastUnconditionally:1];
}

- (void)_handleCompanionSyncDatabaseChanged:(id)a3
{
  id v3 = a3;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Companion sync database changed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id v7 = +[NSDistributedNotificationCenter defaultCenter];
  [v7 postNotificationName:_NPKCompanionServerPaymentPassesChangedNotification object:0 userInfo:&__NSDictionary0__struct];
}

- (void)_handleCompanionPaymentPassDatabaseChangedBroadcastUnconditionally:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Payment pass directory changed (broadcast unconditionally = %d)", buf, 8u);
    }
  }
  int v8 = [(NPKCompanionAgent *)self workQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100015E84;
  v9[3] = &unk_10006D528;
  v9[4] = self;
  BOOL v10 = v3;
  [v8 performWork:v9];
}

- (void)_handleStockholmPreferencesChanged
{
  uint64_t v3 = PKStockholmDomain;
  CFPreferencesSynchronize(PKStockholmDomain, kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  id v4 = +[NSSet setWithObjects:@"EnvironmentName", @"EnvironmentDisplayName", @"ConfigURL", @"MerchantServicesURL", @"auth", @"RemoteAdminV2", @"LogPreActivation", @"LogPostActivation", @"LogAPDU", @"LogAPI", @"LogNCI", @"LogTSM", @"LogXPC", @"LogCrashReporter", 0];
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      BOOL v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Stockholm preferences changed; synchronizing to watch: %@ %@",
        buf,
        0x16u);
    }
  }
  int v8 = [(NPKCompanionAgent *)self npsManager];
  [v8 synchronizeUserDefaultsDomain:v3 keys:v4];
}

- (void)_handlePassbookGlobalPreferencesChanged
{
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  uint64_t v3 = +[NSSet setWithObjects:@"PKBypassStockholmRegionCheck", @"PKDisableStockholmInRegion", PKAllowHTTPKey, PKUIOnlyDemoModeEnabledKey, PKHandsOnDemoModeEnabledKey, PKBypassCertValidationKey, PKIgnoreSignaturesKey, @"PKSimulateFailForward", PKUseMockSURFServerKey, PKPeerPaymentServiceOverrideURLKey, PKBroadwayEnableDynamicCardDuringPaymentKey, PKBroadwayEnableDynamicCardInWalletKey, @"PKDisableAvailableBalance", 0];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v14 = @".GlobalPreferences";
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Wallet global preferences changed; synchronizing to watch: %@ %@",
        buf,
        0x16u);
    }
  }
  id v7 = [(NPKCompanionAgent *)self npsManager];
  [v7 synchronizeUserDefaultsDomain:@".GlobalPreferences" keys:v3];

  int v8 = +[NSSet setWithObject:@"PKNFCPassKeyOptional"];
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    __int16 v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v14 = (const __CFString *)PKPassdBundleIdentifier;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Wallet passd preferences changed; synchronizing to watch: %@ %@",
        buf,
        0x16u);
    }
  }
  BOOL v12 = [(NPKCompanionAgent *)self npsManager];
  [v12 synchronizeUserDefaultsDomain:PKPassdBundleIdentifier keys:v8];
}

- (void)_handleWalletPreferencesChanged:(id)a3
{
  uint64_t v4 = PKWalletDomain;
  CFPreferencesSynchronize(PKWalletDomain, kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  BOOL v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", PKRegionFeatureOverrideKey, 0);
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      BOOL v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Wallet preferences changed; synchronizing to watch: %@ %@",
        buf,
        0x16u);
    }
  }
  id v9 = [(NPKCompanionAgent *)self npsManager];
  [v9 synchronizeUserDefaultsDomain:v4 keys:v5];
}

- (void)_handlePublicWalletPreferencesChanged:(id)a3
{
  uint64_t v4 = PKPublicWalletDomain;
  CFPreferencesSynchronize(PKPublicWalletDomain, kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  BOOL v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", PKAllowHTTPKey, 0);
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      BOOL v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Public Wallet preferences changed; synchronizing to watch: %@ %@",
        buf,
        0x16u);
    }
  }
  id v9 = [(NPKCompanionAgent *)self npsManager];
  [v9 synchronizeUserDefaultsDomain:v4 keys:v5];
}

- (void)_handlePaymentOptionsDefaultsChanged
{
  id v2 = [(NPKCompanionAgent *)self remoteAdminConnectionServiceAgent];
  [v2 handlePaymentOptionsDefaultsChanged];
}

- (void)_handleRelevantPassesDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = pk_Relevance_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Relevance_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Relevant passes changed (notification %@), fetching...", buf, 0xCu);
    }
  }
  int v8 = [(NPKCompanionAgent *)self temporarilyRetainedPassLibrary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016E70;
  v9[3] = &unk_10006D590;
  v9[4] = self;
  [v8 fetchCurrentRelevantPassInfo:v9];
}

- (void)_handleBulletinDistributorWillSendBulletinToGizmoWithSectionID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKCompanionAgent *)self remoteDeviceLowPowerMonitor];
  unsigned int v6 = [v5 isLowPowerModeEnabled];

  BOOL v7 = pk_Relevance_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (v8)
    {
      id v9 = pk_Relevance_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Low power mode enabled will ignore Bulletin distributor event.", (uint8_t *)&v11, 2u);
      }
    }
  }
  else
  {
    if (v8)
    {
      BOOL v10 = pk_Relevance_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        id v12 = v4;
        __int16 v13 = 1024;
        unsigned int v14 = [(NPKCompanionAgent *)self hasCandidateRelevantPasses];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Bulletin distributor will send bulletin to watch for section ID %@ (has candidates %d)", (uint8_t *)&v11, 0x12u);
      }
    }
    [(NPKCompanionAgent *)self _fetchRelevantPassesAndNotifyGizmo];
  }
}

- (void)_fetchRelevantPassesAndNotifyGizmo
{
  if ([(NPKCompanionAgent *)self hasCandidateRelevantPasses])
  {
    uint64_t v3 = [(NPKCompanionAgent *)self lastRelevantPassRequestDate];

    if (v3)
    {
      id v4 = [(NPKCompanionAgent *)self lastRelevantPassInfoSendDate];
      BOOL v5 = v4;
      if (v4)
      {
        [v4 timeIntervalSinceNow];
        BOOL v7 = fabs(v6) > NPKMaximumRelevancyResultsAge;
      }
      else
      {
        BOOL v7 = 1;
      }
      BOOL v8 = [(NPKCompanionAgent *)self lastRelevantPassRequestDate];
      [v8 timeIntervalSinceNow];
      double v10 = fabs(v9);

      if (v10 < 10.0 || !v7)
      {
        __int16 v23 = pk_Relevance_log();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

        if (v24)
        {
          id v25 = pk_Relevance_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            double v30 = v10;
            __int16 v31 = 1024;
            BOOL v32 = v7;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Notice: Not requesting fetch of relevant passes; requested %.2f seconds ago, lastRelevantPassRequestDate:%d",
              buf,
              0x12u);
          }
        }
        goto LABEL_16;
      }
    }
    if ((NPKIsPairedDeviceStandalone() & 1) == 0)
    {
      id v11 = objc_alloc_init((Class)NPKProtoRelevantPassesPendingRequest);
      id v12 = objc_alloc((Class)IDSProtobuf);
      __int16 v13 = [v11 data];
      id v14 = [v12 initWithProtobufData:v13 type:2 isResponse:0];

      __int16 v15 = [(NPKCompanionAgent *)self relevancyService];
      BOOL v26 = v14;
      v27[0] = IDSSendMessageOptionTimeoutKey;
      v27[1] = IDSSendMessageOptionForceLocalDeliveryKey;
      v28[0] = &off_10006FE40;
      v28[1] = &__kCFBooleanTrue;
      v27[2] = IDSSendMessageOptionBypassDuetKey;
      v27[3] = IDSSendMessageOptionNonWakingKey;
      v28[2] = &__kCFBooleanTrue;
      v28[3] = &__kCFBooleanTrue;
      v27[4] = IDSSendMessageOptionQueueOneIdentifierKey;
      v28[4] = @"relevancyPendingQueueOne";
      id v16 = v14;
      BOOL v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
      id v18 = (id)NPKProtoSendWithOptions();
    }
    id v19 = pk_Relevance_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      uint64_t v21 = pk_Relevance_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Notice: Telling PKPassLibrary to do low-power update of relevant passes", buf, 2u);
      }
    }
    id v22 = [(NPKCompanionAgent *)self temporarilyRetainedPassLibrary];
    [v22 recomputeRelevantPassesWithSearchMode:0];

    [(NPKCompanionAgent *)self setGizmoWaitingForRelevantPasses:1];
    BOOL v5 = +[NSDate date];
    [(NPKCompanionAgent *)self setLastRelevantPassRequestDate:v5];
LABEL_16:
  }
}

- (void)_handleActiveDeviceChanged:(id)a3
{
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    double v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Got active device changed notification; waiting for first unlock before handling",
        buf,
        2u);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017C20;
  v7[3] = &unk_10006CFC0;
  v7[4] = self;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlock:v7];
}

- (void)_handleDeviceCapabilitiesDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v3 = [(NPKCompanionAgent *)self passSyncService];

  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    if (v5)
    {
      double v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Refreshing companion passes library that can be sync.", buf, 2u);
      }
    }
    BOOL v7 = [(NPKCompanionAgent *)self passSyncService];
    [v7 updatePassLibrary];
LABEL_7:

    return;
  }
  if (v5)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service is not setup yet. Can't request to sync yet.", v8, 2u);
    }
    goto LABEL_7;
  }
}

- (void)lowPowerModeMonitor:(id)a3 didUpdateLowPowerModeEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = pk_Relevance_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    double v9 = pk_Relevance_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 1024;
      BOOL v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: lowPowerModeMonitor:%@  didUpdateLowPowerModeEnabled:%d", (uint8_t *)&v10, 0x12u);
    }
  }
  if (!v4) {
    [(NPKCompanionAgent *)self _fetchRelevantPassesAndNotifyGizmo];
  }
}

- (void)resyncNeededRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NPKProtoResyncNeededRequest);
  id v6 = [v4 data];

  id v7 = [v5 initWithData:v6];
  BOOL v8 = [v7 expectedHash];
  __int16 v23 = [v8 hashData];

  double v9 = [v7 uniqueIDs];
  int v10 = [v7 manifestHashes];
  unsigned int v11 = [v7 fullResyncNeeded];
  if ([v7 hasResyncID])
  {
    __int16 v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 resyncID]);
  }
  else
  {
    __int16 v12 = 0;
  }
  BOOL v13 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9];
  id v14 = pk_General_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = pk_General_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = +[NPKGizmoDatabase sharedDatabase];
      id v18 = objc_msgSend(v17, "libraryHashForWatchOSMajorVersion:", -[NPKCompanionAgent versionForCompleteHash](self, "versionForCompleteHash"));
      *(_DWORD *)buf = 138412802;
      id v29 = v23;
      __int16 v30 = 2112;
      __int16 v31 = v18;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: Gizmo's database is out of sync (expected hash %@, ours %@, resync ID %@)!", buf, 0x20u);
    }
  }
  if (v11)
  {
    id v19 = pk_General_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      uint64_t v21 = pk_General_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Warning: Full resync requested", buf, 2u);
      }
    }
    [(NPKCompanionAgent *)self _doFullSyncWithResyncID:v12];
  }
  else
  {
    id v22 = [(NPKCompanionAgent *)self workQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100018214;
    v24[3] = &unk_10006D398;
    v24[4] = self;
    id v25 = v13;
    id v26 = v9;
    id v27 = v12;
    [v22 performWork:v24];
  }
}

- (void)handleGizmoInitiatedAddPassRequest:(id)a3
{
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Gizmo sent us an add pass request", buf, 2u);
    }
  }
  id v8 = objc_alloc((Class)NPKProtoGizmoInitiatedAddPassRequest);
  double v9 = [v4 data];

  id v10 = [v8 initWithData:v9];
  unsigned int v11 = [v10 passData];
  id v31 = 0;
  id v12 = +[PKPass createWithData:v11 warnings:0 error:&v31];
  id v13 = v31;

  id v14 = [v12 paymentPass];

  if (v14)
  {
    BOOL v15 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
    id v16 = [v12 uniqueID];
    BOOL v17 = [v15 paymentPassWithUniqueID:v16];

    if (v17
      && ([v12 sequenceCounter],
          id v18 = objc_claimAutoreleasedReturnValue(),
          [v17 sequenceCounter],
          id v19 = objc_claimAutoreleasedReturnValue(),
          id v20 = [v18 compare:v19],
          v19,
          v18,
          v20 != (id)1))
    {
      id v26 = pk_Payment_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (!v27) {
        goto LABEL_11;
      }
      uint64_t v21 = pk_Payment_log();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      id v22 = [v12 sequenceCounter];
      BOOL v28 = [v17 sequenceCounter];
      *(_DWORD *)buf = 138412546;
      id v34 = v22;
      __int16 v35 = 2112;
      id v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Notice: Not saving incoming payment pass because its sequence counter (%@) is not newer than what's already on disk (%@)", buf, 0x16u);
    }
    else
    {
      uint64_t v21 = [(NPKCompanionAgent *)self remoteAdminConnectionServiceAgent];
      id v22 = [v12 paymentPass];
      [v21 handleGizmoAddedPaymentPass:v22];
    }

LABEL_10:
    goto LABEL_11;
  }
  if (v12)
  {
    BOOL v17 = [(NPKCompanionAgent *)self passLibrary];
    __int16 v23 = [v12 passTypeIdentifier];
    BOOL v24 = [v12 serialNumber];
    id v25 = [v17 passWithPassTypeIdentifier:v23 serialNumber:v24];

    if (v25)
    {
      [v17 replacePassWithPass:v12];
      goto LABEL_11;
    }
    id v32 = v12;
    uint64_t v21 = +[NSArray arrayWithObjects:&v32 count:1];
    [v17 addPasses:v21 withCompletionHandler:0];
    goto LABEL_10;
  }
  id v29 = pk_General_log();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

  if (!v30) {
    goto LABEL_12;
  }
  BOOL v17 = pk_General_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error: Unable to create pass from data: %@", buf, 0xCu);
  }
LABEL_11:

LABEL_12:
}

- (void)handleGizmoInitiatedDeletePassRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NPKProtoGizmoInitiatedDeletePassRequest);
  BOOL v6 = [v4 data];

  id v7 = [v5 initWithData:v6];
  id v8 = [v7 passID];
  double v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    unsigned int v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      __int16 v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Gizmo sent us a delete request for pass with ID %@", (uint8_t *)&v22, 0xCu);
    }
  }
  id v12 = +[NPKGizmoDatabase sharedDatabase];
  id v13 = [v12 passForUniqueID:v8];
  id v14 = [v13 paymentPass];

  if (v14)
  {
    if (NPKIsPairedDeviceStandalone())
    {
      BOOL v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v16)
      {
LABEL_13:
        [(NPKCompanionAgent *)self _removeCompanionDatabasePassWithUniqueID:v8 completion:0];
        id v18 = [(NPKCompanionAgent *)self remoteDeviceManager];
        [v18 deviceDidDeletePass:v14];

        goto LABEL_14;
      }
      BOOL v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error: Got gizmo-initiated delete pass request for standalone device!", (uint8_t *)&v22, 2u);
      }
    }
    else
    {
      BOOL v17 = [(NPKCompanionAgent *)self remoteAdminConnectionServiceAgent];
      [v17 deprovisionPass:v14];
    }

    goto LABEL_13;
  }
  [(NPKCompanionAgent *)self _removeCompanionDatabasePassWithUniqueID:v8 completion:0];
LABEL_14:
  id v19 = [(NPKCompanionAgent *)self passLibrary];
  id v20 = [v19 passWithUniqueID:v8];
  uint64_t v21 = v20;
  if (v20 && [v20 passType] != (id)1) {
    [v19 removePass:v21];
  }
}

- (void)handleGizmoReceivedNewLibraryHashRequest:(id)a3
{
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Heard back from gizmo that it received the newest hash, so notifying paired sync coordinator that sync did complete", v9, 2u);
    }
  }
  id v7 = [(NPKCompanionAgent *)self pairedSyncCoordinator];
  id v8 = [v7 activeSyncSession];
  [v8 syncDidComplete];
}

- (void)handleRelevantPassesNeededRequest:(id)a3
{
  id v4 = pk_Relevance_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Relevance_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received relevant passes needed request from gizmo", v7, 2u);
    }
  }
  [(NPKCompanionAgent *)self _fetchRelevantPassesAndNotifyGizmo];
}

- (id)serializedPass:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NPKProtoPass);
  BOOL v5 = NPKSecureArchiveObject();

  [v4 setPassData:v5];
  return v4;
}

- (id)serializedCatalog:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init((Class)NPKProtoCatalog);
    BOOL v5 = NPKSecureArchiveObject();

    [v4 setCatalogData:v5];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)serializedAddPass:(id)a3 withNewLibraryHash:(id)a4 omitHashForChunking:(BOOL)a5 catalog:(id)a6 syncID:(id)a7 resyncID:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a3;
  id v19 = objc_alloc_init((Class)NPKProtoAddPassRequest);
  id v20 = [(NPKCompanionAgent *)self serializedPass:v18];

  [v19 setPass:v20];
  if (!a5)
  {
    id v21 = objc_alloc_init((Class)NPKProtoHash);
    [v21 setHashData:v14];
    [v19 setLibraryHash:v21];
  }
  int v22 = [(NPKCompanionAgent *)self serializedCatalog:v15];
  [v19 setCatalog:v22];

  if (v16) {
    objc_msgSend(v19, "setSyncID:", objc_msgSend(v16, "unsignedIntValue"));
  }
  if (v17) {
    objc_msgSend(v19, "setResyncID:", objc_msgSend(v17, "unsignedIntValue"));
  }
  __int16 v23 = [(NPKCompanionAgent *)self lastKnownResyncID];

  if (v23)
  {
    BOOL v24 = [(NPKCompanionAgent *)self lastKnownResyncID];
    objc_msgSend(v19, "setLastKnownResyncID:", objc_msgSend(v24, "unsignedIntValue"));
  }
  id v25 = [v19 data];

  return v25;
}

- (id)serializedUpdatePass:(id)a3 fromPassWithManifestHash:(id)a4 withNewLibraryHash:(id)a5 omitHashForChunking:(BOOL)a6 catalog:(id)a7 syncID:(id)a8 resyncID:(id)a9
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc_init((Class)NPKProtoUpdatePassRequest);
  int v22 = [(NPKCompanionAgent *)self serializedPass:v20];

  [v21 setPass:v22];
  [v21 setPreviousManifestHash:v19];

  if (!a6)
  {
    id v23 = objc_alloc_init((Class)NPKProtoHash);
    [v23 setHashData:v15];
    [v21 setLibraryHash:v23];
  }
  BOOL v24 = [(NPKCompanionAgent *)self serializedCatalog:v16];
  [v21 setCatalog:v24];

  if (v17) {
    objc_msgSend(v21, "setSyncID:", objc_msgSend(v17, "unsignedIntValue"));
  }
  if (v18) {
    objc_msgSend(v21, "setResyncID:", objc_msgSend(v18, "unsignedIntValue"));
  }
  id v25 = [(NPKCompanionAgent *)self lastKnownResyncID];

  if (v25)
  {
    id v26 = [(NPKCompanionAgent *)self lastKnownResyncID];
    objc_msgSend(v21, "setLastKnownResyncID:", objc_msgSend(v26, "unsignedIntValue"));
  }
  BOOL v27 = [v21 data];

  return v27;
}

- (id)serializedRemovePassWithUniqueID:(id)a3 withNewLibraryHash:(id)a4 omitHashForChunking:(BOOL)a5 catalog:(id)a6 syncID:(id)a7 resyncID:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a3;
  id v19 = objc_alloc_init((Class)NPKProtoRemovePassRequest);
  [v19 setPassID:v18];

  if (!a5)
  {
    id v20 = objc_alloc_init((Class)NPKProtoHash);
    [v20 setHashData:v14];
    [v19 setLibraryHash:v20];
  }
  id v21 = [(NPKCompanionAgent *)self serializedCatalog:v15];
  [v19 setCatalog:v21];

  if (v16) {
    objc_msgSend(v19, "setSyncID:", objc_msgSend(v16, "unsignedIntValue"));
  }
  if (v17) {
    objc_msgSend(v19, "setResyncID:", objc_msgSend(v17, "unsignedIntValue"));
  }
  int v22 = [(NPKCompanionAgent *)self lastKnownResyncID];

  if (v22)
  {
    id v23 = [(NPKCompanionAgent *)self lastKnownResyncID];
    objc_msgSend(v19, "setLastKnownResyncID:", objc_msgSend(v23, "unsignedIntValue"));
  }
  BOOL v24 = [v19 data];

  return v24;
}

- (void)_handleAddAndSendToGizmoForPass:(id)a3 syncID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(void))a5;
  if ([(NPKCompanionAgent *)self shouldDropIDSMessages])
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000194D4;
    v20[3] = &unk_10006D5E0;
    id v11 = v8;
    id v21 = v11;
    int v22 = v10;
    id v12 = objc_retainBlock(v20);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3042000000;
    v18[3] = sub_100019538;
    v18[4] = sub_100019544;
    objc_initWeak(&v19, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001954C;
    v14[3] = &unk_10006D630;
    id v13 = v12;
    id v16 = v13;
    id v17 = v18;
    id v15 = v9;
    [(NPKCompanionAgent *)self _addPassToDatabaseAndPrepareForTransmissionToGizmo:v11 isUpdate:0 withCompletion:v14];

    _Block_object_dispose(v18, 8);
    objc_destroyWeak(&v19);
  }
}

- (void)_handleUpdateAndSendToGizmoForPass:(id)a3 syncID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(void))a5;
  if ([(NPKCompanionAgent *)self shouldDropIDSMessages])
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100019F80;
    v20[3] = &unk_10006D5E0;
    id v11 = v8;
    id v21 = v11;
    int v22 = v10;
    id v12 = objc_retainBlock(v20);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3042000000;
    v18[3] = sub_100019538;
    v18[4] = sub_100019544;
    objc_initWeak(&v19, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100019FE4;
    v14[3] = &unk_10006D630;
    id v13 = v12;
    id v16 = v13;
    id v17 = v18;
    id v15 = v9;
    [(NPKCompanionAgent *)self _addPassToDatabaseAndPrepareForTransmissionToGizmo:v11 isUpdate:1 withCompletion:v14];

    _Block_object_dispose(v18, 8);
    objc_destroyWeak(&v19);
  }
}

- (void)_handleRemovalAndSendToGizmoForPassWithUniqueID:(id)a3 syncID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(void))a5;
  if (![(NPKCompanionAgent *)self shouldDropIDSMessages])
  {
    id v11 = +[NPKGizmoDatabase sharedDatabase];
    id v12 = [v11 passForUniqueID:v8];

    id v13 = [(NPKCompanionAgent *)self remoteDeviceManager];
    [v13 deviceDidDeletePass:v12];

    [(NPKCompanionAgent *)self _removePassFromDatabaseWithID:v8];
    if (NPKIsPairedDeviceStandalone())
    {
      id v14 = pk_General_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        id v16 = pk_General_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Paired device is standalone; not sending removal to gizmo using legacy code path",
            buf,
            2u);
        }
      }
    }
    else
    {
      if ((NPKIsRunningInUIOnlyDemoMode() & 1) == 0 && (NPKIsRunningInStoreDemoMode() & 1) == 0)
      {
        id v17 = [(NPKCompanionAgent *)self libraryHash];
        *(void *)buf = 0;
        BOOL v27 = buf;
        uint64_t v28 = 0x3042000000;
        id v29 = sub_100019538;
        BOOL v30 = sub_100019544;
        objc_initWeak(&v31, self);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10001A924;
        v19[3] = &unk_10006D6A8;
        id v20 = v8;
        id v18 = v17;
        id v21 = v18;
        id v25 = buf;
        id v22 = v9;
        id v23 = self;
        BOOL v24 = v10;
        [(NPKCompanionAgent *)self fetchCatalogIfChanged:v19];

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v31);

        goto LABEL_13;
      }
      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    v10[2](v10);
    goto LABEL_13;
  }
  if (v10) {
    v10[2](v10);
  }
LABEL_14:
}

- (void)_handleCompanionPassAddedWithID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKCompanionAgent *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AE6C;
  v7[3] = &unk_10006D6D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performWork:v7];
}

- (void)_handleCompanionPassUpdatedWithID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKCompanionAgent *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B174;
  v7[3] = &unk_10006D6D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performWork:v7];
}

- (void)_handleCompanionPassRemovedWithID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKCompanionAgent *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B480;
  v7[3] = &unk_10006D6D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performWork:v7];
}

- (CGSize)gizmoScreenSize
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getDevices];

  double v4 = 0.0;
  if (v3)
  {
    double v5 = 0.0;
    if (![v3 count]) {
      goto LABEL_30;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v25 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (!v7) {
      goto LABEL_28;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = NRDevicePropertyScreenSize;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) valueForProperty:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          id v14 = (const char *)[v13 objCType];
          if (v13 && !strcmp(v14, "{CGSize=dd}"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              BOOL v15 = pk_General_log();
              BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

              if (v16)
              {
                id v17 = pk_General_log();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  *(void *)&uint8_t buf[4] = "-[NPKCompanionAgent gizmoScreenSize]";
                  *(_WORD *)&buf[12] = 2082;
                  *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook/NPKCompanionAgent/NPKCompanionAgent.m";
                  __int16 v31 = 2048;
                  uint64_t v32 = 1933;
                  __int16 v33 = 2112;
                  id v34 = v13;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: NRPairedDeviceRegistry vended screen size value not of type NSValue: %@)", buf, 0x2Au);
                }
              }
              _NPKAssertAbort();
            }
            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = 0;
            [v13 getValue:buf size:16];
            if (*(double *)buf > v5) {
              double v5 = *(double *)buf;
            }
            if (*(double *)&buf[8] > v4) {
              double v4 = *(double *)&buf[8];
            }
          }
        }
        else
        {
          id v18 = pk_General_log();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

          if (!v19) {
            goto LABEL_26;
          }
          id v13 = pk_General_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error: NRPairedDeviceRegistry vended screen size value not of type NSValue: %@", buf, 0xCu);
          }
        }

LABEL_26:
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (!v8)
      {
LABEL_28:

        id v3 = v25;
        goto LABEL_30;
      }
    }
  }
  double v5 = 0.0;
LABEL_30:
  id v20 = pk_General_log();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    id v22 = pk_General_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notice: Retrieved gizmo screen size of %f x %f", buf, 0x16u);
    }
  }
  double v23 = v5;
  double v24 = v4;
  result.height = v24;
  result.width = v23;
  return result;
}

- (double)gizmoScreenScale
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getDevices];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = NRDevicePropertyScreenScale;
    double v10 = 2.0;
    *(void *)&long long v6 = 136446978;
    long long v21 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "valueForProperty:", v9, v21, (void)v22);
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v13 = pk_General_log();
            BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

            if (v14)
            {
              BOOL v15 = pk_General_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v21;
                long long v27 = "-[NPKCompanionAgent gizmoScreenScale]";
                __int16 v28 = 2082;
                long long v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook/NPKCompanionAgent/NPKCompanionAgent.m";
                __int16 v30 = 2048;
                uint64_t v31 = 1956;
                __int16 v32 = 2112;
                __int16 v33 = v12;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: NRPairedDeviceRegistry vended screen scale not of type NSNumber: %@)", buf, 0x2Au);
              }
            }
            _NPKAssertAbort();
          }
          [v12 floatValue];
          double v10 = v16;
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    double v10 = 2.0;
  }

  id v17 = pk_General_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    BOOL v19 = pk_General_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      long long v27 = *(const char **)&v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Notice: Retrieved gizmo screen scale %f", buf, 0xCu);
    }
  }
  return v10;
}

- (void)_addPassToDatabaseAndPrepareForTransmissionToGizmo:(id)a3 isUpdate:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  NPKGizmoScreenScale();
  objc_msgSend(v8, "setPreferredImageScale:");
  [v8 setPreferredImageSuffix:NPKWatchSpecificAssetSuffix];
  id v11 = NPKPairedDeviceSecureElementIdentifiers();
  if (v11)
  {
    id v12 = [v8 paymentPass];
    [v12 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v11];
  }
  [v8 flushLoadedImageSets];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001BECC;
  v28[3] = &unk_10006CF68;
  id v13 = v8;
  id v29 = v13;
  __int16 v30 = self;
  BOOL v14 = v10;
  uint64_t v31 = v14;
  [v13 loadImageSetAsync:4 preheat:1 withCompletion:v28];
  dispatch_group_enter(v14);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001C190;
  v26[3] = &unk_10006CFC0;
  BOOL v15 = v14;
  long long v27 = v15;
  [v13 loadContentAsyncWithCompletion:v26];
  dispatch_group_enter(v15);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001C198;
  v24[3] = &unk_10006CFC0;
  long long v25 = v15;
  float v16 = v15;
  [v13 loadImageSetAsync:1 preheat:1 withCompletion:v24];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C1A0;
  block[3] = &unk_10006D6F8;
  id v20 = v13;
  long long v21 = self;
  BOOL v23 = a4;
  id v22 = v9;
  id v17 = v9;
  id v18 = v13;
  dispatch_group_notify(v16, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_removePendingAppleCardNotification
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v3 localizedStringForKey:@"ACCOUNTPASS_PRODUCT_NAME" value:&stru_10006EFD0 table:@"AccountPass"];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ACCOUNTPASS_PROVISIONING_ERROR" value:&stru_10006EFD0 table:@"AccountPass"];

  long long v6 = [(NPKCompanionAgent *)self bulletinManager];
  [v6 removeBridgeBulletinsWithTitle:v7 message:v5 actionURL:0];
}

- (void)_removePassFromDatabaseWithID:(id)a3
{
  id v6 = a3;
  id v4 = [(NPKCompanionAgent *)self gizmoDatabase];
  id v5 = [v4 removePassWithUniqueID:v6];
}

- (void)_resyncPassUniqueIDUpdates:(id)a3 andRemovals:(id)a4 withResyncID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  if ([(NPKCompanionAgent *)self shouldDropIDSMessages]
    || NPKIsPairedDeviceStandalone())
  {
    if (v13) {
      v13[2](v13);
    }
  }
  else
  {
    BOOL v14 = +[NSNumber numberWithUnsignedInt:arc4random()];
    BOOL v15 = pk_General_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      id v17 = pk_General_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&unsigned char buf[22] = 2112;
        long long v61 = v11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Notice: Resyncing with sync ID: %@ pass updates: %@ removals: %@", buf, 0x20u);
      }
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    long long v61 = sub_10000FAAC;
    id v62 = sub_10000FABC;
    id v18 = self;
    v63 = v18;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v57[3] = 0;
    uint64_t v53 = 0;
    long long v54 = &v53;
    uint64_t v55 = 0x2020000000;
    long long v56 = 0;
    BOOL v19 = (char *)[v10 count];
    long long v56 = &v19[(void)[v11 count]];
    if ((NPKIsRunningInUIOnlyDemoMode() & 1) != 0 || NPKIsRunningInStoreDemoMode())
    {
      if (v13) {
        v13[2](v13);
      }
    }
    else
    {
      [(NPKCompanionAgent *)v18 setLastKnownResyncID:v12];
      dispatch_group_t v20 = dispatch_group_create();
      if (v54[3])
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10001CEC4;
        v44[3] = &unk_10006D798;
        id v21 = v12;
        id v45 = v21;
        CFStringRef v47 = v57;
        unsigned int v48 = &v53;
        uint64_t v49 = buf;
        id v22 = v14;
        id v46 = v22;
        [v11 enumerateObjectsUsingBlock:v44];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10001D77C;
        v37[3] = &unk_10006D7E8;
        id v38 = v21;
        unsigned int v41 = v57;
        BOOL v42 = &v53;
        long long v39 = v20;
        BOOL v43 = buf;
        id v40 = v22;
        [v10 enumerateObjectsUsingBlock:v37];

        id v23 = v45;
      }
      else
      {
        long long v24 = pk_General_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (v25)
        {
          long long v26 = pk_General_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v58 = 138412290;
            id v59 = v12;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Notice: We have zero adds / removes to send; the companion just probably has an outdated expected hash.  S"
              "ending new expected hash (resync ID %@).",
              v58,
              0xCu);
          }
        }
        id v23 = objc_alloc_init((Class)NPKProtoNewLibraryHashRequest);
        id v34 = objc_alloc_init((Class)NPKProtoHash);
        long long v27 = +[NPKGizmoDatabase sharedDatabase];
        __int16 v28 = objc_msgSend(v27, "libraryHashForWatchOSMajorVersion:", -[NPKCompanionAgent versionForCompleteHash](v18, "versionForCompleteHash"));
        [v34 setHashData:v28];

        [v23 setLibraryHash:v34];
        objc_msgSend(v23, "setSyncID:", objc_msgSend(v14, "unsignedIntValue"));
        if (v12) {
          objc_msgSend(v23, "setResyncID:", objc_msgSend(v12, "unsignedIntValue"));
        }
        id v29 = [(NPKCompanionAgent *)v18 lastKnownResyncID];

        if (v29)
        {
          __int16 v30 = [(NPKCompanionAgent *)v18 lastKnownResyncID];
          objc_msgSend(v23, "setLastKnownResyncID:", objc_msgSend(v30, "unsignedIntValue"));
        }
        id v31 = objc_alloc((Class)IDSProtobuf);
        __int16 v32 = [v23 data];
        id v33 = [v31 initWithProtobufData:v32 type:8 isResponse:0];

        if (v33)
        {
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_10001CC74;
          v50[3] = &unk_10006CD78;
          BOOL v52 = buf;
          id v51 = v33;
          [(NPKCompanionAgent *)v18 _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v50];
        }
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001E170;
      block[3] = &unk_10006CDC8;
      id v36 = v13;
      dispatch_group_notify(v20, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(v57, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)_shouldSyncPassFromCompanionPassLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 npkCompleteHash];
  if (v4 && [v3 passType] != (id)1) {
    char v5 = NPKShouldUseStandaloneSyncForPass();
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_doFullSyncWithResyncID:(id)a3
{
  id v4 = a3;
  if (NPKIsPairedDeviceStandalone())
  {
    char v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Telling sync engine to sync (full sync was requested with resync ID %@)", buf, 0xCu);
      }
    }
    id v8 = [(NPKCompanionAgent *)self passSyncService];
    [v8 initiateSync];
  }
  id v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Performing full sync with resync ID %@", buf, 0xCu);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001E3C0;
  v13[3] = &unk_10006CE50;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v13];
}

- (void)_doSync
{
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    char v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Sync requested", buf, 2u);
    }
  }
  if (NPKIsPairedDeviceStandalone())
  {
    BOOL v6 = [(NPKCompanionAgent *)self passSyncService];
    [v6 initiateSync];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001ED54;
  v7[3] = &unk_10006CFC0;
  void v7[4] = self;
  [(NPKCompanionAgent *)self _performAfterFirstDeviceUnlockAndPairedSyncAllowed:v7];
}

- (void)_checkHasCandidateRelevantPassesWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(NPKCompanionAgent *)self temporarilyRetainedPassLibrary];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F7FC;
  v7[3] = &unk_10006D9E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchHasCandidatePasses:v7];
}

- (void)_reconcilePassesInDatabasePassingTest:(id)a3 withNewPassUniqueIDs:(id)a4 passAccessor:(id)a5 addedPassHandler:(id)a6 updatedPassHandler:(id)a7 removedPassHandler:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v52 = a7;
  id v53 = a8;
  id v55 = a9;
  id v18 = [a4 mutableCopy];
  BOOL v19 = +[NSMutableSet set];
  dispatch_group_t v20 = +[NSMutableSet set];
  id v21 = +[NPKGizmoDatabase sharedDatabase];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10001FEFC;
  v74[3] = &unk_10006DA08;
  id v22 = v15;
  id v78 = v22;
  id v23 = v16;
  id v79 = v23;
  v74[4] = self;
  id v24 = v19;
  id v75 = v24;
  id v25 = v20;
  id v76 = v25;
  id v26 = v18;
  id v77 = v26;
  [v21 enumerateAllPassesWithBlock:v74 includeImageSets:0];

  id v27 = [objc_alloc((Class)NPKWorkQueue) initWithQueue:&_dispatch_main_q];
  __int16 v28 = +[NSString stringWithFormat:@"reconcile-%d", (rand() % 1000)];
  [v27 setWorkQueueName:v28];

  id v29 = [(NPKCompanionAgent *)self reconcileWorkQueues];
  [v29 addObject:v27];

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_100020050;
  v69[3] = &unk_10006DA58;
  id v30 = v27;
  id v70 = v30;
  id v31 = v23;
  id v71 = v31;
  id v72 = v17;
  id v32 = v22;
  id v73 = v32;
  id v57 = v17;
  [v26 enumerateObjectsUsingBlock:v69];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1000202F0;
  v64[3] = &unk_10006DA58;
  id v33 = v30;
  id v65 = v33;
  id v66 = v31;
  id v67 = v52;
  id v68 = v32;
  id v34 = v32;
  __int16 v35 = v24;
  id v36 = v34;
  id v37 = v52;
  id v38 = v31;
  [v35 enumerateObjectsUsingBlock:v64];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100020590;
  v61[3] = &unk_10006DAA8;
  id v39 = v33;
  id v62 = v39;
  id v63 = v53;
  id v54 = v53;
  [v25 enumerateObjectsUsingBlock:v61];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100020750;
  v58[3] = &unk_10006DAD0;
  id v59 = v39;
  id v60 = v55;
  uint8_t v58[4] = self;
  id v40 = v39;
  id v41 = v55;
  [v40 performWork:v58];
  BOOL v42 = pk_General_log();
  LODWORD(v30) = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    BOOL v43 = pk_General_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v44 = [v26 count];
      id v56 = v41;
      id v45 = v26;
      id v46 = v38;
      id v47 = v37;
      id v48 = v36;
      uint64_t v49 = v35;
      unsigned int v50 = [v35 count];
      unsigned int v51 = [v25 count];
      *(_DWORD *)buf = 67109632;
      unsigned int v81 = v44;
      __int16 v82 = 1024;
      unsigned int v83 = v50;
      __int16 v35 = v49;
      id v36 = v48;
      id v37 = v47;
      id v38 = v46;
      id v26 = v45;
      id v41 = v56;
      __int16 v84 = 1024;
      unsigned int v85 = v51;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Notice: Reconciled passes with pass library: %u adds; %u updates; %u removals",
        buf,
        0x14u);
    }
  }
}

- (void)_reconcileDatabaseWithPaymentPassDirectoryWithAddedPassHandler:(id)a3 updatedPassHandler:(id)a4 removedPassHandler:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  id v15 = [v14 uniqueIDs];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100020960;
  v16[3] = &unk_10006DB38;
  v16[4] = self;
  [(NPKCompanionAgent *)self _reconcilePassesInDatabasePassingTest:&stru_10006DB10 withNewPassUniqueIDs:v15 passAccessor:v16 addedPassHandler:v13 updatedPassHandler:v12 removedPassHandler:v11 completion:v10];
}

- (void)_reconcileDatabaseWithCompanionPassLibraryWithAddedPassHandler:(id)a3 updatedPassHandler:(id)a4 removedPassHandler:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[NSMutableDictionary dictionary];
  id v15 = [(NPKCompanionAgent *)self passLibrary];
  id v16 = [v15 passes];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100020C04;
  v29[3] = &unk_10006DB60;
  id v17 = v14;
  id v30 = v17;
  [v16 enumerateObjectsUsingBlock:v29];

  id v18 = [v17 allKeys];
  BOOL v19 = +[NSSet setWithArray:v18];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100020C68;
  v28[3] = &unk_10006DB88;
  void v28[4] = self;
  dispatch_group_t v20 = objc_retainBlock(v28);
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_100020C74;
  id v26 = &unk_10006DB38;
  id v27 = v17;
  id v21 = v17;
  id v22 = objc_retainBlock(&v23);
  -[NPKCompanionAgent _reconcilePassesInDatabasePassingTest:withNewPassUniqueIDs:passAccessor:addedPassHandler:updatedPassHandler:removedPassHandler:completion:](self, "_reconcilePassesInDatabasePassingTest:withNewPassUniqueIDs:passAccessor:addedPassHandler:updatedPassHandler:removedPassHandler:completion:", v20, v19, v22, v13, v12, v11, v10, v23, v24, v25, v26);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKCompanionAgent *)self initializedPairingIdentifier];

  if (!v8)
  {
    id v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    BOOL v11 = 0;
    if (!v13) {
      goto LABEL_28;
    }
    id v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NPKPairedOrPairingDevice();
      *(_DWORD *)buf = 138412802;
      id v45 = v7;
      __int16 v46 = 2112;
      id v47 = v6;
      __int16 v48 = 2112;
      uint64_t v49 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Warning: Daemon is not initialized; rejecting incoming connection %@ on listener %@\n\tPaired device: %@",
        buf,
        0x20u);
    }
    goto LABEL_20;
  }
  id v9 = [(NPKCompanionAgent *)self xpcListener];

  if (v9 == v6)
  {
    id v16 = pk_General_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      id v18 = pk_General_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Notice: new NPKCompanionAgent standard listener: %@", buf, 0xCu);
      }
    }
    id v14 = [v7 valueForEntitlement:@"com.apple.NPKCompanionAgent.client"];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v14 BOOLValue])
        {
          BOOL v19 = [[NPDCompanionAgentClient alloc] initWithConnection:v7];
          [(NPDCompanionAgentClient *)v19 setDelegate:self];
          [(NPDCompanionAgentClient *)v19 setDataSource:self];
          dispatch_group_t v20 = NPKCompanionClientProtocolInterface();
          [v7 setRemoteObjectInterface:v20];

          id v21 = NPKCompanionServerProtocolInterface();
          [v7 setExportedInterface:v21];

          [v7 setExportedObject:v19];
          objc_initWeak((id *)buf, v7);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100021244;
          v41[3] = &unk_10006D280;
          objc_copyWeak(&v43, (id *)buf);
          id v22 = v19;
          BOOL v42 = v22;
          [v7 setInvalidationHandler:v41];
          [v7 resume];
          id v23 = [(NPKCompanionAgent *)self activeClientsQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100021328;
          block[3] = &unk_10006CE50;
          void block[4] = self;
          id v40 = v22;
          uint64_t v24 = v22;
          dispatch_sync(v23, block);

          objc_destroyWeak(&v43);
          objc_destroyWeak((id *)buf);
LABEL_26:
          BOOL v11 = 1;
          goto LABEL_27;
        }
      }
    }
    id v25 = pk_General_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      id v27 = pk_General_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        signed int v28 = [v7 processIdentifier];
        *(_DWORD *)buf = 134217984;
        id v45 = (id)v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error: A process with PID %llu attempted to connect to NPKCompanionAgent but lacks the \"com.apple.NPKCompanionAgent.client\" entitlement", buf, 0xCu);
      }
    }
LABEL_20:
    BOOL v11 = 0;
LABEL_27:

    goto LABEL_28;
  }
  id v10 = [(NPKCompanionAgent *)self libraryListener];

  if (v10 == v6)
  {
    id v29 = pk_General_log();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      id v31 = pk_General_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v7;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Notice: new NPKCompanionAgent library listener: %@", buf, 0xCu);
      }
    }
    id v32 = [NPDCompanionPassLibrary alloc];
    id v33 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
    id v34 = [(NPDCompanionPassLibrary *)v32 initWithConnection:v7 companionPaymentPassDatabase:v33 dataSource:self];

    [(NPDPassLibrary *)v34 setDelegate:self];
    [v7 setExportedObject:v34];
    [v7 resume];
    __int16 v35 = [(NPKCompanionAgent *)self activeClientsQueue];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002137C;
    v37[3] = &unk_10006CE50;
    void v37[4] = self;
    id v38 = v34;
    id v14 = v34;
    dispatch_sync(v35, v37);

    goto LABEL_26;
  }
  BOOL v11 = 0;
LABEL_28:

  return v11;
}

- (NSSet)companionPaymentPassUniqueIDs
{
  id v2 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  id v3 = [v2 uniqueIDs];

  return (NSSet *)v3;
}

- (id)companionPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  char v5 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  id v6 = [v5 paymentPassWithUniqueID:v4];

  return v6;
}

- (id)paymentWebService
{
  id v2 = [(NPKCompanionAgent *)self remoteAdminConnectionServiceAgent];
  id v3 = [v2 webService];

  return v3;
}

- (void)serviceProviderDataForPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(NPKCompanionAgent *)self paymentWebService];
  id v9 = [v8 targetDevice];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 serviceProviderDataForPassWithUniqueIdentifier:v6 encrypted:0 completion:v7];
  }
  else
  {
    id v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      id v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = [v9 description];
        int v15 = 138412546;
        id v16 = v13;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error: Current target device: %@, does not support request service provider data for unique ID: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = +[NSError errorWithDomain:NPKErrorDomain code:-1006 userInfo:0];
    v7[2](v7, 0, v14);
  }
}

- (void)encryptedServiceProviderDataForPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKCompanionAgent *)self paymentWebService];
  id v9 = [v8 targetDevice];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021880;
    v15[3] = &unk_10006DBB0;
    id v16 = v7;
    [v9 serviceProviderDataForPassWithUniqueIdentifier:v6 encrypted:1 completion:v15];
    id v10 = v16;
  }
  else
  {
    BOOL v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      BOOL v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = [v9 description];
        *(_DWORD *)buf = 138412546;
        id v18 = v14;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error: Current target device: %@, does not support request encrypted service provider data for unique ID: %@", buf, 0x16u);
      }
    }
    id v10 = +[NSError errorWithDomain:NPKErrorDomain code:-1006 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(NPKCompanionAgent *)self paymentWebService];
  id v9 = [v8 targetDevice];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 paymentSetupFeaturesForConfiguration:v6 completion:v7];
  }
  else
  {
    id v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      BOOL v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = [v9 description];
        int v14 = 138412546;
        int v15 = v13;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error: Current target device: %@ does not support request payment setup features for configuration: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    v7[2](v7, 0);
  }
}

- (id)remoteDevicesManagerPairedDeviceOSVersion:(id)a3
{
  id v3 = [(NPKCompanionAgent *)self paymentWebService];
  id v4 = [v3 targetDevice];
  char v5 = [v4 osVersion];

  return v5;
}

- (void)remoteDevicesManager:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5
{
  id v5 = a5;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromNPKIDVRemoteDeviceCredentialType();
      *(_DWORD *)buf = 138412290;
      BOOL v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested provisionedCredentialCountsForType:%@", buf, 0xCu);
    }
  }
  id v10 = v5;
  NPKGuaranteeMainThread();
}

- (void)remoteDevicesManager:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5
{
  id v5 = a5;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromNPKIDVRemoteDeviceCredentialType();
      *(_DWORD *)buf = 138412290;
      BOOL v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested remoteBiometricAuthenticationStatusForCredentialType:%@", buf, 0xCu);
    }
  }
  id v10 = v5;
  NPKGuaranteeMainThread();
}

- (void)passLibrary:(id)a3 requestsDeletionOfPassWithUniqueID:(id)a4 completion:(id)a5
{
}

- (void)passLibrary:(id)a3 requestsAdditionOfPasses:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v18 = a5;
  id v8 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 passType] == (id)1)
        {
          dispatch_group_enter(v8);
          int v15 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
          __int16 v16 = [v14 paymentPass];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1000224F0;
          v21[3] = &unk_10006DC50;
          id v22 = v8;
          [v15 savePaymentPass:v16 requireExisting:0 requireNewer:0 completion:v21];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000224F8;
  block[3] = &unk_10006CDC8;
  id v20 = v18;
  id v17 = v18;
  dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v5 = a4;
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Got property did change notification (property: %@)", buf, 0xCu);
    }
  }
  NPKGuaranteeMainThread();
}

- (void)fetchCatalogIfChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self companionCatalogManager];
  id v6 = [(NPKCompanionAgent *)self passLibrary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022724;
  v9[3] = &unk_10006DCA0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 getPassesAndCatalog:0 withHandler:v9];
}

- (void)_handleFirstDeviceUnlock
{
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Handling first unlock notification", v6, 2u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(NPKCompanionAgent *)self _doPostUnlockPairedSyncAllowedWork];
}

- (void)_doPostUnlockPairedSyncAllowedWork
{
}

- (void)_performAfterFirstDeviceUnlockAndPairedSyncAllowed:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  NPKGuaranteeMainThread();
}

- (void)_performAfterFirstDeviceUnlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  NPKGuaranteeMainThread();
}

- (void)_registerForFirstDeviceUnlockNotifications
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023440;
  block[3] = &unk_10006CFC0;
  void block[4] = self;
  if (qword_10007ADD8 != -1) {
    dispatch_once(&qword_10007ADD8, block);
  }
}

- (void)_removeCompanionDatabasePassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKCompanionAgent *)self companionPaymentPassDatabase];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000235CC;
  v10[3] = &unk_10006DD50;
  id v11 = v6;
  id v9 = v6;
  [v8 removePaymentPassWithUniqueID:v7 completion:v10];
}

- (unint64_t)versionForCompleteHash
{
  return 2;
}

- (void)handleUpdatedSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v57 = a3;
      __int16 v58 = 2112;
      unint64_t v59 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Handling updated settings %lu for pass with unique ID %@", buf, 0x16u);
    }
  }
  id v10 = [(NPKCompanionAgent *)self passLibrary];
  id v11 = [v10 passWithUniqueID:v6];
  uint64_t v12 = v11;
  if (!v11 || [v11 passType] == (id)1)
  {
    BOOL v13 = +[NPKGizmoDatabase sharedDatabase];
    int v14 = [v13 passForUniqueID:v6];

    if (v14)
    {
      id v15 = [v14 settings];
      __int16 v16 = pk_Sync_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        id v18 = pk_Sync_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          unint64_t v57 = (unint64_t)v6;
          __int16 v58 = 2048;
          unint64_t v59 = (unint64_t)v15;
          __int16 v60 = 2048;
          unint64_t v61 = a3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Notice: Checking for settings update for watch pass with unique ID: %@. Current settings: %lu, new settings: %lu", buf, 0x20u);
        }
      }
      id v50 = v15;
      if (v15 == (id)a3) {
        goto LABEL_41;
      }
      uint64_t v49 = self;
      __int16 v19 = [v14 passTypeIdentifier];
      id v20 = [v19 copy];

      id v21 = pk_General_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        long long v23 = pk_General_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          long long v24 = [v14 uniqueID];
          [v20 length];
          long long v25 = NSStringFromBOOL();
          *(_DWORD *)buf = 138412802;
          unint64_t v57 = (unint64_t)v24;
          __int16 v58 = 2048;
          unint64_t v59 = a3;
          __int16 v60 = 2112;
          unint64_t v61 = (unint64_t)v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Notice: Updating settings for watch pass with uniqueID: %@ to settings: %lu. Pass has pass type identifier?: %@", buf, 0x20u);
        }
      }
      [v14 setSettings:a3];
      long long v26 = +[NPKGizmoDatabase sharedDatabase];
      id v27 = [v26 savePass:v14 isLocalPass:0];

      if ((a3 & 8) == 0)
      {
        signed int v28 = pk_Payment_log();
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

        if (v29)
        {
          BOOL v30 = pk_Payment_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v57 = (unint64_t)v6;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Notice: Removing transactions for %@ from local database", buf, 0xCu);
          }
        }
        __int16 v46 = v20;
        unint64_t v47 = a3;
        __int16 v48 = v10;
        id v31 = [v14 paymentPass];
        id v32 = [v31 deviceTransactionSourceIdentifiers];

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v33 = v32;
        id v34 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v52;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v52 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              id v39 = +[NPKGizmoDatabase sharedDatabase];
              [v39 removeTransactionsForTransactionSource:v38];
            }
            id v35 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
          }
          while (v35);
        }

        a3 = v47;
        id v10 = v48;
        id v20 = v46;
      }
      [(NPKCompanionAgent *)v49 notifySettingsChangedForPassWithUniqueID:v6 previousSettings:v50 newSettings:a3];
    }
    else
    {
      id v43 = pk_Sync_log();
      BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

      if (!v44)
      {
LABEL_41:

        goto LABEL_42;
      }
      id v45 = pk_Sync_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v57 = (unint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Warning: Got updated settings for pass %@ that is not in companion or watch pass libraries", buf, 0xCu);
      }
      id v20 = v45;
    }

    goto LABEL_41;
  }
  id v40 = pk_Sync_log();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

  if (v41)
  {
    BOOL v42 = pk_Sync_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v57 = (unint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Notice: Updating settings for companion pass %@", buf, 0xCu);
    }
  }
  [v12 setSettings:a3];
LABEL_42:
}

- (void)fetchPendingTransactionForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKCompanionAgent *)self maintenanceService];
  [v8 fetchPendingTransactionForPassWithUniqueID:v7 completion:v6];
}

- (void)markPendingTransactionAsProcessedForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgent *)self maintenanceService];
  [v5 markPendingTransactionAsProcessedForPassWithUniqueID:v4];
}

- (void)notifySettingsChangedForPassWithUniqueID:(id)a3 previousSettings:(unint64_t)a4 newSettings:(unint64_t)a5
{
  id v8 = a3;
  id v9 = +[NSDistributedNotificationCenter defaultCenter];
  v12[0] = PKPassLibraryUniqueIDUserInfoKey;
  v12[1] = PKPassLibrarySettingsUserInfoKey;
  v13[0] = v8;
  id v10 = +[NSNumber numberWithUnsignedInteger:a5];
  v13[1] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v9 postNotificationName:@"PKPassLibraryRemotePassSettingsDidChangeNotification" object:0 userInfo:v11];

  [(NPKCompanionAgent *)self _handlePotentialTransactionServiceEnabledChangeWithPreviousSettings:a4 newSettings:a5 uniqueID:v8];
  [(NPKCompanionAgent *)self _handlePotentialMessageServiceEnabledChangeWithPreviousSettings:a4 newSettings:a5 uniqueID:v8];
}

- (void)_handlePotentialTransactionServiceEnabledChangeWithPreviousSettings:(unint64_t)a3 newSettings:(unint64_t)a4 uniqueID:(id)a5
{
  unsigned int v6 = a3;
  id v8 = a5;
  if (((v6 >> 3) & 1) != ((a4 >> 3) & 1))
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    BOOL v29 = sub_10000FAAC;
    BOOL v30 = sub_10000FABC;
    id v31 = 0;
    id v9 = [(NPKCompanionAgent *)self activeClientsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024078;
    block[3] = &unk_10006CD78;
    void block[4] = self;
    void block[5] = &v26;
    dispatch_sync(v9, block);

    id v10 = pk_Payment_log();
    LODWORD(v9) = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    unint64_t v11 = a4 & 8;
    if (v9)
    {
      uint64_t v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v13 = @"disabled";
        uint64_t v14 = v27[5];
        *(_DWORD *)buf = 138412802;
        if (v11) {
          CFStringRef v13 = @"enabled";
        }
        CFStringRef v34 = v13;
        __int16 v35 = 2112;
        id v36 = v8;
        __int16 v37 = 2112;
        uint64_t v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Transactions svc %@ for pass with unique ID %@; sending to %@",
          buf,
          0x20u);
      }
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = (id)v27[5];
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          __int16 v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "connection", (void)v21);
          id v20 = [v19 remoteObjectProxy];

          [v20 paymentPassWithUniqueIdentifier:v8 didEnableTransactionService:v11 != 0];
          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
      }
      while (v16);
    }

    _Block_object_dispose(&v26, 8);
  }
}

- (void)_handlePotentialMessageServiceEnabledChangeWithPreviousSettings:(unint64_t)a3 newSettings:(unint64_t)a4 uniqueID:(id)a5
{
  unsigned int v6 = a3;
  id v8 = a5;
  if (((v6 >> 6) & 1) != ((a4 >> 6) & 1))
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    BOOL v29 = sub_10000FAAC;
    BOOL v30 = sub_10000FABC;
    id v31 = 0;
    id v9 = [(NPKCompanionAgent *)self activeClientsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000243CC;
    block[3] = &unk_10006CD78;
    void block[4] = self;
    void block[5] = &v26;
    dispatch_sync(v9, block);

    id v10 = pk_Payment_log();
    LODWORD(v9) = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    unint64_t v11 = a4 & 0x40;
    if (v9)
    {
      uint64_t v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v13 = @"disabled";
        uint64_t v14 = v27[5];
        *(_DWORD *)buf = 138412802;
        if (v11) {
          CFStringRef v13 = @"enabled";
        }
        CFStringRef v34 = v13;
        __int16 v35 = 2112;
        id v36 = v8;
        __int16 v37 = 2112;
        uint64_t v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Message svc %@ for pass with unique ID %@; sending to %@",
          buf,
          0x20u);
      }
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = (id)v27[5];
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          __int16 v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "connection", (void)v21);
          id v20 = [v19 remoteObjectProxy];

          [v20 paymentPassWithUniqueIdentifier:v8 didEnableMessageService:v11 != 0];
          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v15 countByEnumeratingWithState:&v21 objects:v32 count:16];
      }
      while (v16);
    }

    _Block_object_dispose(&v26, 8);
  }
}

- (NSNumber)lastKnownResyncID
{
  return self->_lastKnownResyncID;
}

- (void)setLastKnownResyncID:(id)a3
{
}

- (BOOL)shouldDropIDSMessages
{
  return self->_shouldDropIDSMessages;
}

- (void)setShouldDropIDSMessages:(BOOL)a3
{
  self->_shouldDropIDSMessages = a3;
}

- (OS_dispatch_source)stopDroppingIDSMessagesTimer
{
  return self->_stopDroppingIDSMessagesTimer;
}

- (void)setStopDroppingIDSMessagesTimer:(id)a3
{
}

- (NSString)initializedPairingIdentifier
{
  return self->_initializedPairingIdentifier;
}

- (void)setInitializedPairingIdentifier:(id)a3
{
}

- (PSYSyncCoordinator)pairedSyncCoordinator
{
  return self->_pairedSyncCoordinator;
}

- (void)setPairedSyncCoordinator:(id)a3
{
}

- (BOOL)wasLimitPush
{
  return self->_wasLimitPush;
}

- (void)setWasLimitPush:(BOOL)a3
{
  self->_wasLimitPush = a3;
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcListener:(id)a3
{
}

- (NSXPCListener)libraryListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLibraryListener:(id)a3
{
}

- (NPKWorkQueue)workQueue
{
  return (NPKWorkQueue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)activeClientsQueue
{
  return self->_activeClientsQueue;
}

- (void)setActiveClientsQueue:(id)a3
{
}

- (NSHashTable)activeCompanionAgentClientsHashTable
{
  return self->_activeCompanionAgentClientsHashTable;
}

- (void)setActiveCompanionAgentClientsHashTable:(id)a3
{
}

- (NSHashTable)activePassLibraryClientsHashTable
{
  return self->_activePassLibraryClientsHashTable;
}

- (void)setActivePassLibraryClientsHashTable:(id)a3
{
}

- (NPKRemoteAdminConnectionServiceAgent)remoteAdminConnectionServiceAgent
{
  return (NPKRemoteAdminConnectionServiceAgent *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRemoteAdminConnectionServiceAgent:(id)a3
{
}

- (NSSet)lastSeenRelevantPassInfo
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastSeenRelevantPassInfo:(id)a3
{
}

- (NSDate)lastRelevantPassInfoSendDate
{
  return self->_lastRelevantPassInfoSendDate;
}

- (void)setLastRelevantPassInfoSendDate:(id)a3
{
}

- (NSDate)lastRelevantPassRequestDate
{
  return self->_lastRelevantPassRequestDate;
}

- (void)setLastRelevantPassRequestDate:(id)a3
{
}

- (BOOL)isGizmoWaitingForRelevantPasses
{
  return self->_gizmoWaitingForRelevantPasses;
}

- (void)setGizmoWaitingForRelevantPasses:(BOOL)a3
{
  self->_gizmoWaitingForRelevantPasses = a3;
}

- (BOOL)hasCandidateRelevantPasses
{
  return self->_hasCandidateRelevantPasses;
}

- (void)setHasCandidateRelevantPasses:(BOOL)a3
{
  self->_hasCandidateRelevantPasses = a3;
}

- (NPKGizmoDatabase)gizmoDatabase
{
  return (NPKGizmoDatabase *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGizmoDatabase:(id)a3
{
}

- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase
{
  return (NPDCompanionPaymentPassDatabase *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCompanionPaymentPassDatabase:(id)a3
{
}

- (NPKCompanionCatalogManager)companionCatalogManager
{
  return (NPKCompanionCatalogManager *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCompanionCatalogManager:(id)a3
{
}

- (NPDBulletinManager)bulletinManager
{
  return self->_bulletinManager;
}

- (void)setBulletinManager:(id)a3
{
}

- (NPDCardSetupReminderNotificationScheduler)bulletinScheduler
{
  return self->_bulletinScheduler;
}

- (void)setBulletinScheduler:(id)a3
{
}

- (NPDCompanionPeerPaymentStatusObserver)companionPeerPaymentStatusObserver
{
  return self->_companionPeerPaymentStatusObserver;
}

- (void)setCompanionPeerPaymentStatusObserver:(id)a3
{
}

- (NPSManager)npsManager
{
  return (NPSManager *)objc_getProperty(self, a2, 184, 1);
}

- (void)setNpsManager:(id)a3
{
}

- (NPSDomainAccessor)npsDomainAccessor
{
  return (NPSDomainAccessor *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNpsDomainAccessor:(id)a3
{
}

- (NSMutableArray)performAfterDatabaseUnlocksAndPairedSyncAllowed
{
  return self->_performAfterDatabaseUnlocksAndPairedSyncAllowed;
}

- (void)setPerformAfterDatabaseUnlocksAndPairedSyncAllowed:(id)a3
{
}

- (NSMutableArray)performAfterDatabaseUnlocks
{
  return self->_performAfterDatabaseUnlocks;
}

- (void)setPerformAfterDatabaseUnlocks:(id)a3
{
}

- (NPDOutstandingPassDeletionStore)outstandingDeletionStore
{
  return self->_outstandingDeletionStore;
}

- (void)setOutstandingDeletionStore:(id)a3
{
}

- (NSMutableSet)reconcileWorkQueues
{
  return self->_reconcileWorkQueues;
}

- (void)setReconcileWorkQueues:(id)a3
{
}

- (NSMutableArray)watchOfferProvisioningCompletionHandlers
{
  return self->_watchOfferProvisioningCompletionHandlers;
}

- (void)setWatchOfferProvisioningCompletionHandlers:(id)a3
{
}

- (IDSService)generalService
{
  return self->_generalService;
}

- (void)setGeneralService:(id)a3
{
}

- (IDSService)relevancyService
{
  return self->_relevancyService;
}

- (void)setRelevancyService:(id)a3
{
}

- (NPDCompanionPassSyncService)passSyncService
{
  return self->_passSyncService;
}

- (void)setPassSyncService:(id)a3
{
}

- (NPDCompanionMaintenanceService)maintenanceService
{
  return self->_maintenanceService;
}

- (void)setMaintenanceService:(id)a3
{
}

- (NPDDemoModePassCopier)demoModePassCopier
{
  return self->_demoModePassCopier;
}

- (void)setDemoModePassCopier:(id)a3
{
}

- (NPKIDVRemoteDevicesManager)remoteDeviceManager
{
  return self->_remoteDeviceManager;
}

- (NPKCompanionViewServiceConnectionManager)viewServiceConnectionManager
{
  return self->_viewServiceConnectionManager;
}

- (void)setViewServiceConnectionManager:(id)a3
{
}

- (int)capabilityUpdateNotificationToken
{
  return self->_capabilityUpdateNotificationToken;
}

- (void)setCapabilityUpdateNotificationToken:(int)a3
{
  self->_capabilityUpdateNotificationToken = a3;
}

- (NPKLowPowerModeRemoteDeviceMonitor)remoteDeviceLowPowerMonitor
{
  return self->_remoteDeviceLowPowerMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceLowPowerMonitor, 0);
  objc_storeStrong((id *)&self->_viewServiceConnectionManager, 0);
  objc_storeStrong((id *)&self->_remoteDeviceManager, 0);
  objc_storeStrong((id *)&self->_demoModePassCopier, 0);
  objc_storeStrong((id *)&self->_maintenanceService, 0);
  objc_storeStrong((id *)&self->_passSyncService, 0);
  objc_storeStrong((id *)&self->_relevancyService, 0);
  objc_storeStrong((id *)&self->_generalService, 0);
  objc_storeStrong((id *)&self->_watchOfferProvisioningCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_reconcileWorkQueues, 0);
  objc_storeStrong((id *)&self->_outstandingDeletionStore, 0);
  objc_storeStrong((id *)&self->_performAfterDatabaseUnlocks, 0);
  objc_storeStrong((id *)&self->_performAfterDatabaseUnlocksAndPairedSyncAllowed, 0);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_companionPeerPaymentStatusObserver, 0);
  objc_storeStrong((id *)&self->_bulletinScheduler, 0);
  objc_storeStrong((id *)&self->_bulletinManager, 0);
  objc_storeStrong((id *)&self->_companionCatalogManager, 0);
  objc_storeStrong((id *)&self->_companionPaymentPassDatabase, 0);
  objc_storeStrong((id *)&self->_gizmoDatabase, 0);
  objc_storeStrong((id *)&self->_lastRelevantPassRequestDate, 0);
  objc_storeStrong((id *)&self->_lastRelevantPassInfoSendDate, 0);
  objc_storeStrong((id *)&self->_lastSeenRelevantPassInfo, 0);
  objc_storeStrong((id *)&self->_remoteAdminConnectionServiceAgent, 0);
  objc_storeStrong((id *)&self->_activePassLibraryClientsHashTable, 0);
  objc_storeStrong((id *)&self->_activeCompanionAgentClientsHashTable, 0);
  objc_storeStrong((id *)&self->_activeClientsQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_libraryListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_initializedPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_stopDroppingIDSMessagesTimer, 0);
  objc_storeStrong((id *)&self->_lastKnownResyncID, 0);
  objc_destroyWeak((id *)&self->_passLibrary);
}

@end