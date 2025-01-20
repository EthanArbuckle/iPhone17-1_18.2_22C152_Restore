@interface PDPaymentWebServiceCoordinator
- (BOOL)_queue_automaticDeviceCheckInRequiredForRegion:(id)a3;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (BOOL)shouldStartConsistencyCheck;
- (BOOL)synchronizeWithTSM;
- (PDAccountManager)accountManager;
- (PDAppletSubcredentialManager)credentialManager;
- (PDAppletSubcredentialManager)subcredentialManager;
- (PDApplyManager)applyManager;
- (PDAssertionManager)assertionManager;
- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDDefaultPassManager)defaultPassManager;
- (PDDevicePasscodeManager)devicePasscodeManager;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator;
- (PDDeviceRegistrationServiceCoordinator)registrationCoordinator;
- (PDDiscoveryManager)discoveryManager;
- (PDExpressPassManager)expressPassManager;
- (PDFamilyCircleManager)familyCircleManager;
- (PDISO18013Manager)isoManager;
- (PDPassUpgradeController)upgradeController;
- (PDPaymentSetupFeaturesCoordinator)paymentSetupFeaturesCoordinator;
- (PDPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 passStore:(id)a5 assertionManager:(id)a6 cloudStoreCoordinator:(id)a7 idsManager:(id)a8 tapToRadarDelegate:(id)a9 receiptFileManager:(id)a10 expressPassManager:(id)a11 familyCircleManager:(id)a12;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (PDPendingProvisioningManager)pendingProvisioningManager;
- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker;
- (PDPushProvisioningManager)pushProvisioningManager;
- (PDSharingManager)sharingManager;
- (PDUserNotificationManager)userNotificationManager;
- (PKPaymentWebServiceContext)sharedWebServiceContext;
- (double)_queue_deviceCheckInRepeatInterval;
- (id)_userNotificationFromResponse:(id)a3;
- (id)accountServicePushTopics;
- (id)applyServicePushTopics;
- (id)paymentOffersServicePushTopics;
- (id)paymentPasses;
- (id)pushNotificationTopics;
- (id)sharedWebService;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_fetchPassesIfNecessaryForPushTopic:(id)a3;
- (void)_handleDeviceCheckInAction:(int64_t)a3 region:(id)a4 completion:(id)a5;
- (void)_handleDownloadedPass:(id)a3;
- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)_performDeviceCheckInTask:(id)a3;
- (void)_performNotificationActionWithUserInfo:(id)a3;
- (void)_processValueAddedServiceTransaction:(id)a3;
- (void)_queue_cancelAllDeviceCheckInTasks;
- (void)_queue_checkContextForDeviceCheckInAuthRequirement:(id)a3 completion:(id)a4;
- (void)_queue_coeleaseDeviceCheckInCompletion:(id)a3;
- (void)_queue_completeDeviceCheckInTask:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_queue_completeDeviceUpgradeTasks;
- (void)_queue_enqueueDeviceCheckInTask:(id)a3;
- (void)_queue_handleCheckInForRegion:(id)a3 action:(int64_t)a4 completion:(id)a5;
- (void)_queue_performContactInformationFetchTaskWithCompletion:(id)a3;
- (void)_queue_performOwnershipTokensRequestWithUserInfo:(id)a3;
- (void)_queue_performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_queue_performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_queue_provisionPushProvisioningSharingIdentifiers;
- (void)_queue_recreateCloudStoreTransactionZoneWithCompletion:(id)a3;
- (void)_queue_registerDeviceAtBrokerURL:(id)a3 completion:(id)a4;
- (void)_queue_scheduleDeviceCheckInWithStartTimeOffset:(double)a3 repeatInterval:(double)a4 randomizeTimes:(BOOL)a5;
- (void)_queue_setupBackgroundWebServiceWithCompletion:(id)a3;
- (void)_queue_unscheduleDeviceCheckIn;
- (void)_runDeviceUpgradeTasks;
- (void)_scheduleDeviceUpgradeTaskActivityWithRandomizeStartDate:(BOOL)a3;
- (void)_updateWebServiceConfigurationWithCompletion:(id)a3;
- (void)_updateWebServiceConfigurationWithSupportedRegionTimeInterval:(double)a3 unsupportedRegionTimeInterval:(double)a4 completion:(id)a5;
- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3;
- (void)applyPushNotificationToken:(id)a3;
- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4;
- (void)backgroundRegisterCredentialWithRequest:(id)a3;
- (void)checkSafariCredentialEligibility:(id)a3 completion:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3;
- (void)deviceStateWithCompletion:(id)a3;
- (void)didDownloadPaymentPass:(id)a3;
- (void)downloadReceiptForTransaction:(id)a3;
- (void)handleDeletionForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)handleInsertionForPaymentPass:(id)a3;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)handleRequestedActions:(id)a3 completion:(id)a4;
- (void)initiateDevicePassesDownload;
- (void)noteAccountChanged;
- (void)noteWebServiceDidChange;
- (void)passAdded:(id)a3;
- (void)passWillBeRemoved:(id)a3 withDiagnosticReason:(id)a4;
- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4;
- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4;
- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4 cloudStoreCoordinatorDelegate:(id)a5;
- (void)paymentWebService:(id)a3 didDownloadPassRemoteAssets:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 didDownloadSerialNumbersForInstalledPasses:(id)a4 inRegion:(id)a5;
- (void)paymentWebService:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6;
- (void)paymentWebServiceBackgroundSessionDidBecomeInvalid:(id)a3;
- (void)performConsistencyCheck;
- (void)performDeviceCheckInWithCompletion:(id)a3;
- (void)performHandlerOnSharedWebServiceQueue:(id)a3;
- (void)performPrimaryRegionRegistrationForce:(BOOL)a3 completion:(id)a4;
- (void)performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processValueAddedServiceTransaction:(id)a3;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)registerCredentialWithRequest:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)scheduleConsistencyCheck:(id)a3 pluggedIn:(BOOL)a4 backoffLevel:(id)a5;
- (void)scheduleConsistencyCheckIfNecessary;
- (void)scheduleDeviceCheckInIfNecessary;
- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3;
- (void)scheduleDeviceUpgradeTasksIfNecessary;
- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3;
- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setApplyManager:(id)a3;
- (void)setAssertionManager:(id)a3;
- (void)setAuxiliaryCapabilityManager:(id)a3;
- (void)setCredentialManager:(id)a3;
- (void)setDefaultPassManager:(id)a3;
- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5;
- (void)setDevicePasscodeManager:(id)a3;
- (void)setDeviceRegistrationServiceCoordinator:(id)a3;
- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5;
- (void)setDiscoveryManager:(id)a3;
- (void)setIsoManager:(id)a3;
- (void)setPaymentSetupFeaturesCoordinator:(id)a3;
- (void)setPeerPaymentWebServiceCoordinator:(id)a3;
- (void)setPendingProvisioningManager:(id)a3;
- (void)setProvisioningRequirementsChecker:(id)a3;
- (void)setPushProvisioningManager:(id)a3;
- (void)setSharedWebService:(id)a3;
- (void)setSharingManager:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)startTasksIfNecessary;
- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPass:(id)a5 handler:(id)a6;
- (void)unregisterObserver:(id)a3;
- (void)unscheduleDeviceCheckIn;
- (void)unscheduleDeviceUpgradeTaskActivity;
- (void)updateSharedWebServiceContext:(id)a3;
- (void)updateWebServiceConfigurationWithCompletion:(id)a3;
- (void)validatePreconditionsWithCompletion:(id)a3;
- (void)verificationObserver:(id)a3 didObserveVerificationCode:(id)a4;
- (void)verificationObserverDidTimeout:(id)a3;
@end

@implementation PDPaymentWebServiceCoordinator

- (PKPaymentWebServiceContext)sharedWebServiceContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(PKPaymentWebService *)self->_sharedWebService context];
  os_unfair_lock_unlock(p_lock);
  return (PKPaymentWebServiceContext *)v4;
}

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (PDPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 passStore:(id)a5 assertionManager:(id)a6 cloudStoreCoordinator:(id)a7 idsManager:(id)a8 tapToRadarDelegate:(id)a9 receiptFileManager:(id)a10 expressPassManager:(id)a11 familyCircleManager:(id)a12
{
  id v58 = a3;
  id v57 = a4;
  id v56 = a5;
  id v47 = a6;
  id v55 = a6;
  id v54 = a7;
  id v48 = a8;
  id v53 = a8;
  id v52 = a9;
  id v51 = a10;
  id v50 = a11;
  id v49 = a12;
  v59.receiver = self;
  v59.super_class = (Class)PDPaymentWebServiceCoordinator;
  v18 = [(PDPaymentWebServiceCoordinator *)&v59 init];
  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("sharedWebServiceQueue", v19);
    sharedWebServiceQueue = v18->_sharedWebServiceQueue;
    v18->_sharedWebServiceQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.passd.pdpaymentWebServiceCoordinator.reply", v19);
    replyQueue = v18->_replyQueue;
    v18->_replyQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v18->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    [(PDDatabaseManager *)v18->_databaseManager setPaymentServicesDelegate:v18];
    v24 = (PKSecureElement *)objc_alloc_init((Class)PKSecureElement);
    secureElement = v18->_secureElement;
    v18->_secureElement = v24;

    objc_storeStrong((id *)&v18->_passStore, a5);
    objc_storeStrong((id *)&v18->_tapToRadarDelegate, a9);
    objc_storeStrong((id *)&v18->_receiptFileManager, a10);
    objc_storeStrong((id *)&v18->_expressPassManager, a11);
    v26 = PKSharedWebServiceContextPath();
    v27 = +[PKPaymentWebServiceContext contextWithArchive:v26];

    v28 = [[PDPaymentWebServiceArchiver alloc] initWithQueue:v18->_sharedWebServiceQueue webServiceCoordinator:v18];
    archiver = v18->_archiver;
    v18->_archiver = v28;

    v30 = [[PDPaymentWebServiceTargetDevice alloc] initWithDataSource:v18];
    v31 = (PKPaymentWebService *)[objc_alloc((Class)PKPaymentWebService) initWithContext:v27 targetDevice:v30 archiver:v18->_archiver tapToRadarDelegate:v18->_tapToRadarDelegate];
    sharedWebService = v18->_sharedWebService;
    v18->_sharedWebService = v31;

    v33 = [[PDPassUpgradeController alloc] initWithWebService:v18->_sharedWebService cardFileManager:v18->_passStore];
    upgradeController = v18->_upgradeController;
    v18->_upgradeController = v33;

    v35 = [[PDPaymentSafariCardImportManager alloc] initWithWebService:v18->_sharedWebService webServiceQueue:v18->_sharedWebServiceQueue databaseManager:v18->_databaseManager];
    safariCardImportManager = v18->_safariCardImportManager;
    v18->_safariCardImportManager = v35;

    objc_storeStrong((id *)&v18->_assertionManager, v47);
    objc_storeStrong((id *)&v18->_familyCircleManager, a12);
    objc_storeStrong((id *)&v18->_cloudStoreCoordinator, a7);
    objc_storeStrong((id *)&v18->_idsManager, v48);
    uint64_t v37 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v18->_observers;
    v18->_observers = (NSHashTable *)v37;

    [(PDAssertionManager *)v18->_assertionManager registerObserver:v18];
    [(PDPushNotificationManager *)v18->_pushNotificationManager registerConsumer:v18];
    v39 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    deviceCheckInTasks = v18->_deviceCheckInTasks;
    v18->_deviceCheckInTasks = v39;

    v41 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    fetchingReceiptUniqueIDs = v18->_fetchingReceiptUniqueIDs;
    v18->_fetchingReceiptUniqueIDs = v41;

    v18->_lock._os_unfair_lock_opaque = 0;
    v18->_observersLock._os_unfair_lock_opaque = 0;
    v43 = [[PDPaymentSetupFeaturesCoordinator alloc] initWithWebService:v18->_sharedWebService webServiceQueue:v18->_sharedWebServiceQueue databaseManager:v18->_databaseManager paymentWebServiceCoordinator:v18 accountManager:v18->_accountManager familyCircleManager:v18->_familyCircleManager discoveryManager:v18->_discoveryManager];
    paymentSetupFeaturesCoordinator = v18->_paymentSetupFeaturesCoordinator;
    v18->_paymentSetupFeaturesCoordinator = v43;
  }
  return v18;
}

- (void)dealloc
{
  [(PKPaymentWebService *)self->_sharedWebService invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PDPaymentWebServiceCoordinator;
  [(PDPaymentWebServiceCoordinator *)&v3 dealloc];
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
  id v5 = a3;
  [(PDPaymentSetupFeaturesCoordinator *)self->_paymentSetupFeaturesCoordinator setAccountManager:self->_accountManager];
}

- (void)setUserNotificationManager:(id)a3
{
  p_userNotificationManager = &self->_userNotificationManager;
  id v5 = a3;
  objc_storeWeak((id *)p_userNotificationManager, v5);
  [(PDPaymentSetupFeaturesCoordinator *)self->_paymentSetupFeaturesCoordinator setUserNotificationManager:v5];
}

- (void)unregisterObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __break(1u);
  }
  id v5 = (void (**)(void, void))v4;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v7 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v5[2](v5, *(void *)(*((void *)&v13 + 1) + 8 * i));
      }
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)connect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DB08;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  if (qword_100808B30 != -1) {
    dispatch_once(&qword_100808B30, block);
  }
}

- (void)scheduleConsistencyCheckIfNecessary
{
  if ((PDScheduledActivityExists() & 1) == 0)
  {
    objc_super v3 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No consistency check scheduled... scheduling for %@", (uint8_t *)&v5, 0xCu);
    }

    [(PDPaymentWebServiceCoordinator *)self scheduleConsistencyCheck:v3 pluggedIn:0 backoffLevel:&off_10078A9B0];
  }
}

- (void)updateWebServiceConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DD44;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sharedWebServiceQueue, v7);
}

- (void)_updateWebServiceConfigurationWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  if ([v5 needsConfiguration])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004DE18;
    v6[3] = &unk_10072FDF0;
    v7 = v4;
    [v5 configurePaymentServiceWithCompletion:v6];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)_updateWebServiceConfigurationWithSupportedRegionTimeInterval:(double)a3 unsupportedRegionTimeInterval:(double)a4 completion:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  if ([v9 needsConfigurationWithSupportedRegionTimeInterval:a3 unsupportedRegionTimeInterval:a4])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004DFDC;
    v10[3] = &unk_10072FDF0;
    uint64_t v11 = v8;
    [v9 configurePaymentServiceWithCompletion:v10];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (id)sharedWebService
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sharedWebService;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSharedWebService:(id)a3
{
  id v4 = (PKPaymentWebService *)a3;
  os_unfair_lock_lock(&self->_lock);
  sharedWebService = self->_sharedWebService;
  self->_sharedWebService = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateSharedWebServiceContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    int v5 = [(PKPaymentWebService *)self->_sharedWebService context];
    id v6 = [v5 deviceID];

    if (v6)
    {
      v7 = [v4 deviceID];

      if (!v7)
      {
        id v8 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = +[NSThread callStackSymbols];
          int v18 = 136315394;
          v19 = "-[PDPaymentWebServiceCoordinator updateSharedWebServiceContext:]";
          __int16 v20 = 2112;
          v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s archiving context without deviceID: %@", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    id v10 = [(PKPaymentWebService *)self->_sharedWebService context];
    uint64_t v11 = [v10 pushToken];

    [(PKPaymentWebService *)self->_sharedWebService setContext:v4];
    if (v11)
    {
      v12 = [(PKPaymentWebService *)self->_sharedWebService context];
      long long v13 = [v12 pushToken];
      unsigned __int8 v14 = [v11 isEqualToString:v13];

      if ((v14 & 1) == 0)
      {
        long long v15 = [(PKPaymentWebService *)self->_sharedWebService context];
        [v15 setPushToken:v11];
      }
    }
    archiver = self->_archiver;
    v17 = [(PKPaymentWebService *)self->_sharedWebService context];
    [(PDPaymentWebServiceArchiver *)archiver archiveContext:v17];

    os_unfair_lock_unlock(&self->_lock);
    [(PDPushNotificationManager *)self->_pushNotificationManager recalculatePushTopics];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error: Refusing to update webservice context with nil.", (uint8_t *)&v18, 2u);
    }
  }
}

- (void)performHandlerOnSharedWebServiceQueue:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E450;
  v7[3] = &unk_10072E598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedWebServiceQueue, v7);
}

- (void)startTasksIfNecessary
{
  [(PDPaymentWebServiceCoordinator *)self scheduleDeviceCheckInIfNecessary];
  [(PDPaymentWebServiceCoordinator *)self scheduleDeviceUpgradeTasksIfNecessary];
}

- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E594;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(sharedWebServiceQueue, v7);
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forPass:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [v12 passTypeIdentifier];
    long long v16 = [v12 serialNumber];
    *(_DWORD *)buf = 138412802;
    id v32 = v10;
    __int16 v33 = 2112;
    v34 = v15;
    __int16 v35 = 2112;
    v36 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Submitting verification code (%@) for pass (%@,%@)", buf, 0x20u);
  }
  v17 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.submit_otp");
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004EC54;
  v24[3] = &unk_10072FEA8;
  id v25 = v17;
  v26 = self;
  id v27 = v10;
  id v28 = v11;
  id v29 = v12;
  id v30 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v17;
  dispatch_async(sharedWebServiceQueue, v24);
}

- (void)performConsistencyCheck
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F0B0;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)initiateDevicePassesDownload
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F2B8;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)processValueAddedServiceTransaction:(id)a3
{
  id v4 = a3;
  int v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F494;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)applyServicePushTopics
{
  v2 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
  objc_super v3 = [v2 applyServicePushTopics];

  return v3;
}

- (id)accountServicePushTopics
{
  v2 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
  objc_super v3 = [v2 accountServicePushTopics];

  return v3;
}

- (id)paymentOffersServicePushTopics
{
  v2 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
  objc_super v3 = [v2 paymentOffersServicePushTopics];

  return v3;
}

- (void)downloadReceiptForTransaction:(id)a3
{
  id v4 = a3;
  int v5 = [v4 associatedReceiptUniqueID];
  id v6 = [v4 receiptProviderURL];
  v7 = [v4 cardNumberSuffix];
  if (v5 && v6)
  {
    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004F810;
    block[3] = &unk_10072FF48;
    block[4] = self;
    id v10 = v5;
    id v11 = v7;
    id v12 = v4;
    id v13 = v6;
    dispatch_async(sharedWebServiceQueue, block);
  }
}

- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050240;
  block[3] = &unk_10072FFE8;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = objc_alloc_init((Class)PKPaymentHardwareStatus);
  [v7 setType:a3];
  [v7 setHasSecureElement:PKSecureElementIsAvailable() != 0];
  if (PKIsHandoffClient())
  {
    if (PKIsTV())
    {
      [v7 setCanMakeRemotePayments:1];
    }
    else
    {
      objc_msgSend(v7, "setHasRemoteDevices:", -[PKIDSManager hasRemoteDevices](self->_idsManager, "hasRemoteDevices"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = [(PKIDSManager *)self->_idsManager remoteDevices];
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            if ([*(id *)(*((void *)&v13 + 1) + 8 * i) canMakePayments])
            {
              [v7 setCanMakeRemotePayments:1];
              goto LABEL_14;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  if (a3 == 1)
  {
    [v7 setIsSRD:PKIsSRD()];
    objc_msgSend(v7, "setInFailForward:", +[PKSecureElement isInFailForward](PKSecureElement, "isInFailForward"));
  }
  if (v6) {
    v6[2](v6, v7);
  }
}

- (void)validatePreconditionsWithCompletion:(id)a3
{
  objc_super v3 = (void (**)(id, void))a3;
  if (v3)
  {
    if (!PKSecureElementIsAvailable()
      || (PKCurrentUserIsGuestUser() & 1) != 0
      || (PKCurrentUserIsInSharingMode() & 1) != 0
      || !PKHasVerifiedPrimaryAppleAccount()
      || !PKPasscodeEnabled())
    {
      goto LABEL_15;
    }
    if (PKIsSRD())
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        v3[2](v3, 0);
        goto LABEL_16;
      }
      __int16 v8 = 0;
      int v5 = "Preconditions failed - is SRD";
      id v6 = (uint8_t *)&v8;
    }
    else
    {
      if (!PKIsBeneficiaryAccount())
      {
        v3[2](v3, 1);
        goto LABEL_16;
      }
      id v4 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v7 = 0;
      int v5 = "Preconditions failed - is beneficary account";
      id v6 = (uint8_t *)&v7;
    }
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    goto LABEL_14;
  }
LABEL_16:
}

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000505CC;
    block[3] = &unk_10072F788;
    id v8 = v4;
    dispatch_async(sharedWebServiceQueue, block);
  }
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100050704;
  v11[3] = &unk_10072FDC8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedWebServiceQueue, v11);
}

- (void)registerCredentialWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050834;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)backgroundRegisterCredentialWithRequest:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050920;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedWebServiceQueue, v7);
}

- (id)pushNotificationTopics
{
  v2 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
  objc_super v3 = [v2 notificationPushTopics];

  if (![v3 count])
  {
    uint64_t v4 = +[NSSet setWithObject:@"com.apple.passd"];

    objc_super v3 = (void *)v4;
  }
  return v3;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050BD8;
  block[3] = &unk_10072E238;
  id v12 = v6;
  id v13 = v7;
  long long v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100051348;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(sharedWebServiceQueue, v7);
}

- (void)passWillBeRemoved:(id)a3 withDiagnosticReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051830;
  block[3] = &unk_10072E238;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)passAdded:(id)a3
{
  id v4 = a3;
  int v5 = dispatch_get_global_queue(0, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100051A5C;
  v8[3] = &unk_10072E198;
  id v9 = v4;
  id v10 = self;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D758;
  block[3] = &unk_10072F788;
  id v12 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4
{
}

- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4 cloudStoreCoordinatorDelegate:(id)a5
{
  id v8 = a4;
  [a3 backgroundDownloadRemotePassAssets:v8 forSuffixesAndScreenScales:0 cloudStoreCoordinatorDelegate:a5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100051F48;
  v10[3] = &unk_100730170;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(PDPaymentWebServiceCoordinator *)self _accessObserversWithHandler:v10];
}

- (void)paymentWebService:(id)a3 didDownloadPassRemoteAssets:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [v7 reloadDisplayProfileOfType:0];
  id v9 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052088;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)paymentWebService:(id)a3 didDownloadSerialNumbersForInstalledPasses:(id)a4 inRegion:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Comparing server's expectation of installed passes with local passes…", buf, 2u);
  }

  id v26 = objc_alloc_init((Class)NSMutableArray);
  v24 = self;
  id v11 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v17 = [v16 passTypeIdentifier];
        if ([v17 isEqualToString:v9])
        {
          int v18 = [v16 serialNumber];
          unsigned __int8 v19 = [v8 containsObject:v18];

          if ((v19 & 1) == 0) {
            [v26 addObject:v16];
          }
        }
        else
        {
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }
  sharedWebServiceQueue = v24->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052420;
  block[3] = &unk_100730198;
  id v28 = v26;
  id v29 = v9;
  id v30 = v24;
  id v31 = v8;
  id v21 = v8;
  id v22 = v9;
  id v23 = v26;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)paymentWebService:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000527F4;
  v11[3] = &unk_1007301C0;
  id v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  [(PDPaymentWebServiceCoordinator *)v12 _accessObserversWithHandler:v11];
}

- (void)paymentWebServiceBackgroundSessionDidBecomeInvalid:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000528F0;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(sharedWebServiceQueue, v7);
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052AC0;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8 && [v8 count])
  {
    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100052D60;
    block[3] = &unk_100730238;
    void block[4] = self;
    id v15 = v8;
    BOOL v17 = a4;
    id v16 = v9;
    dispatch_async(sharedWebServiceQueue, block);

    id v11 = v15;
LABEL_8:

    goto LABEL_9;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDPaymentWebServiceCoordinator: ignoring request to register among zero regions.", buf, 2u);
  }

  if (v9)
  {
    id v13 = PDDefaultQueue();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100052D4C;
    v18[3] = &unk_10072F788;
    id v19 = v9;
    dispatch_async(v13, v18);

    id v11 = v19;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)performPrimaryRegionRegistrationForce:(BOOL)a3 completion:(id)a4
{
}

- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005346C;
  v13[3] = &unk_100730238;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(sharedWebServiceQueue, v13);
}

- (void)_queue_performRegistrationForRegion:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  id v11 = [v10 context];
  if (v8)
  {
    if (!PKRegistrationSupportedInRegionForWebService())
    {
      BOOL v17 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138543362;
      id v33 = v8;
      int v18 = "PDPaymentWebServiceCoordinator: cannot register for region %{public}@ - not supported.";
      goto LABEL_18;
    }
    id v12 = [v11 configuration];
    id v13 = [v12 brokerURLForRegion:v8];

    if (v13)
    {
      if (([v11 isRegistered] & 1) != 0
        || ([v10 primaryBrokerURL],
            id v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = PKEqualObjects(),
            v14,
            (v15 & 1) != 0))
      {
        BOOL v16 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
LABEL_13:

          [(PDPaymentWebServiceCoordinator *)self _queue_performRegistrationForBrokerURL:v13 force:v6 completion:v9];
LABEL_24:

          goto LABEL_25;
        }
        *(_DWORD *)buf = 138543362;
        id v33 = v8;
      }
      else
      {
        uint64_t v22 = PKRegistrationSupportedInCurrentRegionForWebService();
        BOOL v16 = PKLogFacilityTypeGetObject();
        BOOL v23 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v23)
          {
            *(_DWORD *)buf = 138543362;
            id v33 = v8;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDPaymentWebServiceCoordinator: initially registering for device region as precondition for registration to region %{public}@.", buf, 0xCu);
          }

          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1000538E0;
          v26[3] = &unk_100730260;
          id v27 = v8;
          id v28 = self;
          id v29 = v13;
          BOOL v31 = v6;
          id v30 = v9;
          id v13 = v13;
          [(PDPaymentWebServiceCoordinator *)self _queue_performRegistrationForBrokerURL:0 force:0 completion:v26];

          goto LABEL_24;
        }
        if (!v23) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 138543362;
        id v33 = v8;
      }
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDPaymentWebServiceCoordinator: registering for region %{public}@.", buf, 0xCu);
      goto LABEL_13;
    }
    BOOL v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v8;
      int v18 = "PDPaymentWebServiceCoordinator: cannot register for region %{public}@ - could not resolve broker URL.";
LABEL_18:
      id v19 = v17;
      uint32_t v20 = 12;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else
  {
    if (PKRegistrationSupportedInCurrentRegionForWebService())
    {
      [v11 isRegistered];
      BOOL v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDPaymentWebServiceCoordinator: registering for primary region.", buf, 2u);
      }
      id v13 = 0;
      goto LABEL_13;
    }
    BOOL v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v18 = "PDPaymentWebServiceCoordinator: cannot register for primary region - not supported.";
      id v19 = v17;
      uint32_t v20 = 2;
      goto LABEL_21;
    }
  }
LABEL_22:

  if (v9)
  {
    id v21 = PDDefaultQueue();
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100053A80;
    v24[3] = &unk_10072F788;
    id v25 = v9;
    dispatch_async(v21, v24);

    id v13 = v25;
    goto LABEL_24;
  }
LABEL_25:
}

- (void)performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100053B60;
  v13[3] = &unk_100730238;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(sharedWebServiceQueue, v13);
}

- (void)_queue_performRegistrationForBrokerURL:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  id v11 = v10;
  if (v8)
  {
    if (!a4 && ([v10 needsRegistrationForBrokerURL:v8] & 1) == 0)
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      id v13 = "PDPaymentWebServiceCoordinator: skipping registration at %@ - already registered.";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  uint64_t v14 = [v10 primaryBrokerURL];
  id v8 = (id)v14;
  if (!v14 || a4)
  {
    if (!v14)
    {
      BOOL v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PDPaymentWebServiceCoordinator: cannot register with primary region - broker URL not found.", buf, 2u);
      }

      if (!v9)
      {
        id v8 = 0;
        goto LABEL_17;
      }
      int v18 = PDDefaultQueue();
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100053EB0;
      v19[3] = &unk_10072F788;
      BOOL v16 = &v20;
      id v20 = v9;
      dispatch_async(v18, v19);

      id v8 = 0;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if ([v11 needsRegistration])
  {
LABEL_15:
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100053E84;
    v23[3] = &unk_10072E570;
    BOOL v16 = &v24;
    id v24 = v9;
    [(PDPaymentWebServiceCoordinator *)self _queue_registerDeviceAtBrokerURL:v8 completion:v23];
    goto LABEL_16;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_12;
  }
  *(_DWORD *)buf = 138412290;
  id v26 = v8;
  id v13 = "PDPaymentWebServiceCoordinator: skipping primary region registration at %@ - already registered.";
LABEL_11:
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
LABEL_12:

  if (v9)
  {
    id v15 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100053E9C;
    block[3] = &unk_10072F788;
    BOOL v16 = &v22;
    id v22 = v9;
    dispatch_async(v15, block);

LABEL_16:
  }
LABEL_17:
}

- (void)_queue_registerDeviceAtBrokerURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPaymentWebServiceCoordinator: registering with the broker at %@.", buf, 0xCu);
  }

  id v9 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100054024;
  v12[3] = &unk_1007302B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 registerDeviceAtBrokerURL:v11 consistencyCheckResults:0 completion:v12];
}

- (void)scheduleDeviceCheckInIfNecessary
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000543C8;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000547E0;
  v4[3] = &unk_10072F840;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(sharedWebServiceQueue, v4);
}

- (void)_queue_scheduleDeviceCheckInWithStartTimeOffset:(double)a3 repeatInterval:(double)a4 randomizeTimes:(BOOL)a5
{
  BOOL v5 = a5;
  [(PDPaymentWebServiceCoordinator *)self connect];
  id v8 = PDScheduledActivityGetCriteria();
  if (!v8)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    if (v5)
    {
      double v11 = (double)arc4random_uniform(0xE10u);
      double v12 = (double)arc4random_uniform(0xE10u);
    }
    double v13 = v12 + a4;
    id v9 = +[NSDate dateWithTimeIntervalSinceNow:v11 + a3];
    id v10 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v9];
    [v10 setRequireNetworkConnectivity:1];
    [v10 setRepeating:1];
    [v10 setRepeatInterval:v13];
    [v10 setReason:@"Device Check In"];
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v10 debugDescription];
      int v16 = 138412290;
      BOOL v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "passd scheduling device check in: %@", (uint8_t *)&v16, 0xCu);
    }
    PDScheduledActivityRegister();
    goto LABEL_9;
  }
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 debugDescription];
    int v16 = 138412290;
    BOOL v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device check in already scheduled: %@", (uint8_t *)&v16, 0xCu);
LABEL_9:
  }
}

- (BOOL)_queue_automaticDeviceCheckInRequiredForRegion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 deviceCheckInPushTopic];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = PKDeviceBuildVersion();
    uint64_t v7 = [v3 lastDeviceCheckInBuildVersion];
    id v8 = (void *)v7;
    if (v6 && v7 && ![v6 compare:v7 options:1])
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v13 = [v3 regionCode];
        int v14 = 138412802;
        id v15 = v13;
        __int16 v16 = 2112;
        BOOL v17 = v6;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device check in for region: %@ is not required as %@ is equal to %@", (uint8_t *)&v14, 0x20u);
      }
      BOOL v11 = 0;
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v3 regionCode];
        int v14 = 138412802;
        id v15 = v10;
        __int16 v16 = 2112;
        BOOL v17 = v6;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device check in for region: %@ is required as %@ is not equal to %@", (uint8_t *)&v14, 0x20u);
      }
      BOOL v11 = 1;
    }
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device check in required as no deviceCheckInPushTopic found in context", (uint8_t *)&v14, 2u);
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (double)_queue_deviceCheckInRepeatInterval
{
  v2 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
  id v3 = [v2 configuration];
  id v4 = [v2 primaryRegion];
  id v5 = [v4 regionCode];
  [v3 deviceCheckInIntervalForRegion:v5];
  if (v6 <= 0.0) {
    double v7 = 21600.0;
  }
  else {
    double v7 = 1.0;
  }

  return v7;
}

- (void)unscheduleDeviceCheckIn
{
  id v3 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054DF0;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_queue_unscheduleDeviceCheckIn
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unscheduling device check in", v4, 2u);
  }

  [(PDPaymentWebServiceCoordinator *)self connect];
  PDScheduledActivityRemove();
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054F1C;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedWebServiceQueue, v7);
}

- (void)_queue_enqueueDeviceCheckInTask:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_deviceCheckInTasks addObject:v4];
  BOOL deviceCheckInRunning = self->_deviceCheckInRunning;
  id v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (deviceCheckInRunning)
  {
    if (v7)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device check in already running waiting", v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device check in not running starting immediately", buf, 2u);
    }

    [(PDPaymentWebServiceCoordinator *)self _performDeviceCheckInTask:v4];
  }
}

- (void)_queue_coeleaseDeviceCheckInCompletion:(id)a3
{
  id v7 = a3;
  id v4 = [(NSMutableArray *)self->_deviceCheckInTasks lastObject];
  if (!v4)
  {
    id v4 = objc_alloc_init(PDDeviceCheckInTask);
    [(NSMutableArray *)self->_deviceCheckInTasks addObject:v4];
  }
  if (v7)
  {
    id v5 = [(PDDeviceCheckInTask *)v4 completionHandlers];
    id v6 = objc_retainBlock(v7);
    [v5 addObject:v6];
  }
  if (!self->_deviceCheckInRunning) {
    [(PDPaymentWebServiceCoordinator *)self _performDeviceCheckInTask:v4];
  }
}

- (void)_queue_cancelAllDeviceCheckInTasks
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_deviceCheckInTasks;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "setCancelled:", 1, (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_performDeviceCheckInTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing device check in task", buf, 2u);
  }

  self->_BOOL deviceCheckInRunning = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100055434;
  v8[3] = &unk_10072E238;
  id v9 = (id)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.check_in.pre_configure");
  long long v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v9;
  [(PDPaymentWebServiceCoordinator *)self _updateWebServiceConfigurationWithCompletion:v8];
}

- (void)_queue_completeDeviceCheckInTask:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSMutableArray *)self->_deviceCheckInTasks removeObject:v8];
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005605C;
  block[3] = &unk_100730438;
  id v11 = v8;
  id v24 = v11;
  BOOL v26 = a4;
  id v12 = v9;
  id v25 = v12;
  dispatch_async(replyQueue, block);
  double v13 = [(NSMutableArray *)self->_deviceCheckInTasks firstObject];
  int v14 = v13;
  if (v13)
  {
    if ([v13 cancelled]) {
      [(PDPaymentWebServiceCoordinator *)self _queue_completeDeviceCheckInTask:v14 success:0 error:0];
    }
    else {
      [(PDPaymentWebServiceCoordinator *)self _performDeviceCheckInTask:v14];
    }
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "All device check in tasks are complete", buf, 2u);
    }

    self->_BOOL deviceCheckInRunning = 0;
    if (v12) {
      a4 = 0;
    }
    uint64_t v16 = 0;
    if (!a4)
    {
      [(PDPaymentWebServiceCoordinator *)self _queue_deviceCheckInRepeatInterval];
      uint64_t v16 = v17;
    }
    BOOL v18 = !a4;
    id v19 = PDDefaultQueue();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100056160;
    v20[3] = &unk_10072E120;
    v20[4] = self;
    BOOL v21 = v18;
    v20[5] = v16;
    dispatch_async(v19, v20);
  }
}

- (void)_queue_checkContextForDeviceCheckInAuthRequirement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if ([v6 canPromptForAuth])
  {
    id v8 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
    id v9 = [v8 regions];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000563B4;
    v15[3] = &unk_100730460;
    v15[4] = &v16;
    [v9 enumerateKeysAndObjectsUsingBlock:v15];
  }
  if (*((unsigned char *)v17 + 24))
  {
    long long v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting grand slam token renew for device check in", buf, 2u);
    }

    id v11 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005649C;
    v12[3] = &unk_1007304B0;
    v12[4] = self;
    id v13 = v7;
    [v11 _renewAppleAccountWithCompletionHandler:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)_queue_handleCheckInForRegion:(id)a3 action:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000568DC;
  v22[3] = &unk_100730500;
  id v10 = v8;
  id v23 = v10;
  id v24 = self;
  id v11 = v9;
  id v25 = v11;
  id v12 = objc_retainBlock(v22);
  id v13 = v12;
  if (a4)
  {
    ((void (*)(void *, int64_t))v12[2])(v12, a4);
  }
  else
  {
    int v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "passd requesting device check in for region: %@", buf, 0xCu);
    }

    id v15 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.check_in");
    uint64_t v16 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100056A2C;
    v18[3] = &unk_100730528;
    id v19 = v15;
    id v20 = v11;
    id v21 = v13;
    id v17 = v15;
    [v16 deviceCheckInDeviceCheckInForRegion:v10 completion:v18];
  }
}

- (void)_handleDeviceCheckInAction:(int64_t)a3 region:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  switch(a3)
  {
    case 0:
      id v11 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v39 = v8;
      id v12 = "No action taken from device check in for: %@";
      goto LABEL_10;
    case 1:
      sharedWebServiceQueue = self->_sharedWebServiceQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100057430;
      block[3] = &unk_10072E9D8;
      id v22 = v8;
      id v23 = v10;
      id v24 = v9;
      dispatch_async(sharedWebServiceQueue, block);

      int v14 = v22;
      goto LABEL_7;
    case 2:
      id v15 = self->_sharedWebServiceQueue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100057190;
      v25[3] = &unk_100730578;
      id v26 = v8;
      id v27 = self;
      id v28 = v10;
      id v29 = v9;
      dispatch_async(v15, v25);

      int v14 = v26;
      goto LABEL_7;
    case 3:
      uint64_t v16 = self->_sharedWebServiceQueue;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100056EDC;
      v33[3] = &unk_100730578;
      id v34 = v8;
      long long v35 = self;
      id v36 = v10;
      id v37 = v9;
      dispatch_async(v16, v33);

      int v14 = v34;
LABEL_7:

      break;
    case 4:
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v8;
        id v12 = "Device check in requires auth for: %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
LABEL_11:

      if (v9) {
        (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
      }
      break;
    case 5:
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device check in requested reregister for peer payment: %@", buf, 0xCu);
      }

      uint64_t v18 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator.check_in.re_register_peer_payment");
      peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100057178;
      v30[3] = &unk_1007305A0;
      id v31 = v18;
      id v32 = v9;
      id v20 = v18;
      [(PDPeerPaymentWebServiceCoordinator *)peerPaymentWebServiceCoordinator registerDeviceWithReason:@"Registering peer payment for device check in" completion:v30];

      break;
    default:
      break;
  }
}

- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000576D8;
  v13[3] = &unk_10072E170;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(sharedWebServiceQueue, v13);
}

- (void)verificationObserver:(id)a3 didObserveVerificationCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000578EC;
  block[3] = &unk_10072E238;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)verificationObserverDidTimeout:(id)a3
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057C4C;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)handleInsertionForPaymentPass:(id)a3
{
  if (a3)
  {
    [(PDPushNotificationManager *)self->_pushNotificationManager recalculatePushTopics];
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:180.0];
    [(PDPaymentWebServiceCoordinator *)self scheduleConsistencyCheck:v4 pluggedIn:0 backoffLevel:0];
  }
}

- (void)handleDeletionForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  if (objc_msgSend(a3, "hasPrefix:", @"paymentpass", a4))
  {
    pushNotificationManager = self->_pushNotificationManager;
    [(PDPushNotificationManager *)pushNotificationManager recalculatePushTopics];
  }
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4
{
  id v5 = a4;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057EBC;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(sharedWebServiceQueue, v8);
}

- (BOOL)synchronizeWithTSM
{
  id v3 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  id v4 = [v3 context];
  unsigned __int8 v5 = [v4 isRegistered];

  if (v5)
  {
    id v6 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
    id v7 = [v6 TSMPushTopics];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = -[PKSecureElement queueConnectionToServerWithPushTopic:](self->_secureElement, "queueConnectionToServerWithPushTopic:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        }
        BOOL v14 = v13;
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device needs to register; we will not sync with TSM",
        buf,
        2u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (void)didDownloadPaymentPass:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000581E8;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)paymentPasses
{
  v2 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
  id v3 = [v2 allObjects];

  return v3;
}

- (void)deviceStateWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v23 = v3;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = sub_10002074C;
    v43 = sub_100020E98;
    id v44 = objc_alloc_init((Class)PKSecureElementConsistencyCheckDeviceState);
    id v4 = (void *)v40[5];
    unsigned __int8 v5 = [(PDDatabaseManager *)self->_databaseManager deviceSpecificPaymentApplications];
    id v6 = [v5 allObjects];
    [v4 setDevicePaymentApplications:v6];

    id v27 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    long long v35 = 0u;
    id v8 = [(PDDatabaseManager *)self->_databaseManager passesWithISO18013Credentials];
    id v9 = [v8 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v9)
    {
      id obj = v8;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "iso18013BlobsForSecureElementIdentifiers:", v27, v23);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v31 objects:v45 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v32;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v32 != v14) {
                  objc_enumerationMutation(v12);
                }
                long long v16 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
                long long v17 = [v12 objectForKey:v16];
                long long v18 = [v17 SHA256Hash];
                long long v19 = [v16 identifier];
                [v7 setObject:v18 forKeyedSubscript:v19];
              }
              id v13 = [v12 countByEnumeratingWithState:&v31 objects:v45 count:16];
            }
            while (v13);
          }
        }
        id v8 = obj;
        id v9 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
      }
      while (v9);
    }

    if ([v7 count])
    {
      id v20 = (void *)v40[5];
      id v21 = [v7 copy];
      [v20 setPassIsoBlobHashForCredentialIdentifier:v21];
    }
    sharingManager = self->_sharingManager;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100058618;
    v28[3] = &unk_100730690;
    id v30 = &v39;
    v28[4] = self;
    id v29 = v23;
    [(PDSharingManager *)sharingManager pendingCredentialsBeingProvisioned:v28];

    _Block_object_dispose(&v39, 8);
    id v3 = v23;
  }
}

- (void)scheduleConsistencyCheck:(id)a3 pluggedIn:(BOOL)a4 backoffLevel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = PDDefaultQueue();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100058940;
  v13[3] = &unk_1007306E0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (BOOL)shouldStartConsistencyCheck
{
  int IsAvailable = PKSecureElementIsAvailable();
  if (IsAvailable)
  {
    secureElement = self->_secureElement;
    if (secureElement) {
      LOBYTE(IsAvailable) = ((unint64_t)[(PKSecureElement *)secureElement ownershipStateForCurrentUser] & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    else {
      LOBYTE(IsAvailable) = 1;
    }
  }
  return IsAvailable;
}

- (void)handleRequestedActions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v38 = objc_alloc_init((Class)NSMutableArray);
  id v42 = objc_alloc_init((Class)NSMutableSet);
  id v43 = objc_alloc_init((Class)NSMutableArray);
  id v41 = objc_alloc_init((Class)NSMutableArray);
  id v40 = objc_alloc_init((Class)NSMutableArray);
  id v37 = objc_alloc_init((Class)NSMutableArray);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v76;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        id v12 = [v11 deviceCredential];
        unsigned __int8 v13 = [v11 actions];
        id v14 = [v12 type];
        if (v14 == (id)2)
        {
          long long v18 = [v12 isoProperties];
          id v15 = [v18 isoIdentifier];

          if ((v13 & 8) != 0) {
            [v43 safelyAddObject:v15];
          }
          if ((v13 & 0x10) != 0) {
            [v41 safelyAddObject:v15];
          }
          if ((v13 & 0x20) != 0) {
            [v40 safelyAddObject:v15];
          }
          if ((v13 & 0x40) != 0)
          {
            long long v19 = [v11 address];
            [v37 safelyAddObject:v19];
          }
          goto LABEL_24;
        }
        if (v14 == (id)1)
        {
          long long v17 = [v12 address];
          id v15 = [v17 subcredentialIdentifier];

          if ((v13 & 4) != 0) {
            [v38 safelyAddObject:v15];
          }
          if ((v13 & 8) != 0 && v15) {
            [v42 addObject:v15];
          }
          goto LABEL_24;
        }
        if (!v14 && (v13 & 8) != 0)
        {
          id v15 = [v12 address];
          BOOL v16 = [v15 appletIdentifier];
          [v7 safelyAddObject:v16];

LABEL_24:
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v8);
  }

  id v20 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 1;
  if ([v7 count])
  {
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100059490;
    v70[3] = &unk_100730730;
    v70[4] = self;
    id v71 = v7;
    v72 = v73;
    [v20 addOperation:v70];
  }
  id v34 = v7;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v21 = v38;
  id v22 = [v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v67;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v67 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v66 + 1) + 8 * (void)j);
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_10005959C;
        v65[3] = &unk_100730730;
        v65[4] = self;
        v65[5] = v25;
        v65[6] = v73;
        objc_msgSend(v20, "addOperation:", v65, v34, v36);
      }
      id v22 = [v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
    }
    while (v22);
  }

  if ([v42 count])
  {
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1000596B8;
    v62[3] = &unk_100730730;
    v62[4] = self;
    id v63 = v42;
    v64 = v73;
    [v20 addOperation:v62];
  }
  if (objc_msgSend(v43, "count", v34))
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100059844;
    v59[3] = &unk_100730730;
    v59[4] = self;
    id v60 = v43;
    v61 = v73;
    [v20 addOperation:v59];
  }
  if ([v41 count])
  {
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100059954;
    v56[3] = &unk_100730730;
    v56[4] = self;
    id v57 = v41;
    id v58 = v73;
    [v20 addOperation:v56];
  }
  if ([v40 count])
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100059A64;
    v53[3] = &unk_100730730;
    v53[4] = self;
    id v54 = v40;
    id v55 = v73;
    [v20 addOperation:v53];
  }
  uint64_t v39 = v21;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v26 = v37;
  id v27 = [v26 countByEnumeratingWithState:&v49 objects:v79 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v50;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v49 + 1) + 8 * (void)k);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100059B74;
        v48[3] = &unk_100730730;
        v48[4] = self;
        v48[5] = v30;
        v48[6] = v73;
        [v20 addOperation:v48];
      }
      id v27 = [v26 countByEnumeratingWithState:&v49 objects:v79 count:16];
    }
    while (v27);
  }

  long long v31 = +[NSNull null];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100059D9C;
  v45[3] = &unk_10072E660;
  id v32 = v36;
  id v46 = v32;
  id v47 = v73;
  id v33 = [v20 evaluateWithInput:v31 completion:v45];

  _Block_object_dispose(v73, 8);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling Scheduled Activity: %@", buf, 0xCu);
  }

  if ([v6 isEqualToString:@"ConsistencyCheck"])
  {
    uint64_t v9 = [(PDAssertionManager *)self->_assertionManager assertionsOfType:1];
    id v10 = [v9 count];

    if (v10)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Provisioning is in progress, rescheduling consistency check…", buf, 2u);
      }

      id v11 = +[NSDate dateWithTimeIntervalSinceNow:120.0];
      [(PDPaymentWebServiceCoordinator *)self scheduleConsistencyCheck:v11 pluggedIn:0 backoffLevel:0];
    }
    else
    {
      [(PDPaymentWebServiceCoordinator *)self performConsistencyCheck];
    }
  }
  else if ([v6 hasPrefix:@"VASTransactionProcessor."])
  {
    id v12 = [v6 substringFromIndex:objc_msgSend(@"VASTransactionProcessor.", "length")];
    unsigned __int8 v13 = [(PDDatabaseManager *)self->_databaseManager valueAddedServiceTransactionWithIdentifier:v12];
    if (v13)
    {
      [(PDPaymentWebServiceCoordinator *)self _processValueAddedServiceTransaction:v13];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find VAS Transaction in our database", buf, 2u);
      }
    }
  }
  else if ([v6 isEqualToString:@"DeviceCheckIn"])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "passd requesting device check in from scheduled activity", buf, 2u);
    }

    sharedWebServiceQueue = self->_sharedWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005A0E8;
    block[3] = &unk_10072E1E8;
    void block[4] = self;
    dispatch_async(sharedWebServiceQueue, block);
  }
  else if ([v6 isEqualToString:@"DeviceUpgradeTasks"])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "passd starting device upgrade tasks from scheduled activity", buf, 2u);
    }

    [(PDPaymentWebServiceCoordinator *)self _runDeviceUpgradeTasks];
  }
}

- (void)_processValueAddedServiceTransaction:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A1C0;
  v7[3] = &unk_100730810;
  id v8 = [objc_alloc((Class)PKValueAddedServiceWebService) initWithValueAddedServiceTransaction:v4];
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = v8;
  [v6 downloadMerchantPayloadWithCompletion:v7];
}

- (void)_performNotificationActionWithUserInfo:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A54C;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(sharedWebServiceQueue, v7);
}

- (id)_userNotificationFromResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 aps];
  id v5 = [v4 objectForKey:@"alert"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 PKStringForKey:@"loc-key"];
    id v7 = v6;
    if (v6)
    {
      PKLocalizedString(v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (![v8 isEqualToString:v7])
      {
LABEL_8:

        goto LABEL_12;
      }
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Did not find a localized key for this string not showing the message", buf, 2u);
      }
    }
    id v8 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }
LABEL_12:
  if ([v8 length])
  {
    id v10 = [v3 requestID];
    if ([v10 length])
    {
      id v11 = [v3 action];
      if ([v11 isEqualToString:PKNotificationActionOpenIDMSCardOnFile])
      {
        id v12 = +[NSString stringWithFormat:@"%@/%@", PKURLActionPaymentSetupIDMSCardOnFile, v10];
        unsigned __int8 v13 = [(PDGenericUserNotification *)[PDWalletUserNotification alloc] initWithMessage:v8];
        id v14 = v13;
        if (v12) {
          [(PDUserNotification *)v13 setCustomActionRoute:v12];
        }
      }
      else
      {
        id v12 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v16 = [v3 action];
          id v17 = [v3 requestID];
          *(_DWORD *)buf = 138412546;
          id v20 = v16;
          __int16 v21 = 2112;
          id v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unsupported action found:%@ for requestID:%@", buf, 0x16u);
        }
        id v14 = 0;
      }
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No requestID in response", buf, 2u);
      }
      id v14 = 0;
    }
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v3 requestID];
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No valid message found in response for requestID :%@", buf, 0xCu);
    }
    id v14 = 0;
  }

  return v14;
}

- (void)_fetchPassesIfNecessaryForPushTopic:(id)a3
{
  id v4 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005AADC;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedWebServiceQueue, v7);
}

- (void)_handleDownloadedPass:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PDOSTransactionCreate("PDPaymentWebServiceCoordinator");
  if ([v4 isIdentityPass]
    && (databaseManager = self->_databaseManager,
        [v4 uniqueID],
        id v8 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(databaseManager) = [(PDDatabaseManager *)databaseManager passExistsWithUniqueID:v8], v8, (databaseManager & 1) == 0))
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 uniqueID];
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing stale pass %@", buf, 0xCu);
    }
    id v11 = [objc_alloc((Class)PKPaymentDeprovisionRequest) initWithPaymentPass:v4];
    id v12 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005B100;
    v14[3] = &unk_100730120;
    id v15 = v11;
    id v13 = v11;
    [v12 diagnosticSessionWithReason:@"pass previously deleted" sessionHandler:v14];
  }
  else
  {
    [(PDCardFileManager *)self->_passStore writeCard:v4 source:1 error:0];
  }
}

- (void)_queue_setupBackgroundWebServiceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKBackgroundWebServiceContextPath();
  id v7 = +[PKPaymentWebServiceBackgroundContext contextWithArchive:v5];

  id v6 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  [v6 startBackgroundURLSessionWithIdentifier:@"com.apple.passd" context:v7 backgroundDelegate:self completion:v4];
}

- (void)noteAccountChanged
{
  id v2 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  [v2 _resetSupportInRegionCache];
}

- (void)noteWebServiceDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005B264;
  v2[3] = &unk_1007301E8;
  v2[4] = self;
  [(PDPaymentWebServiceCoordinator *)self _accessObserversWithHandler:v2];
}

- (void)_queue_recreateCloudStoreTransactionZoneWithCompletion:(id)a3
{
}

- (void)_queue_provisionPushProvisioningSharingIdentifiers
{
  p_pushProvisioningManager = &self->_pushProvisioningManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushProvisioningManager);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_pushProvisioningManager);
    [v4 provisionAvailablePushProvisioningSharingIdentifiers];
  }
}

- (void)_queue_performOwnershipTokensRequestWithUserInfo:(id)a3
{
  id v4 = [a3 objectForKey:@"reason"];
  uint64_t v5 = PKPaymentSendOwnershipTokensRequestReasonFromString();

  id v6 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
  [v6 sendOwnershipTokensForReason:v5 completion:&stru_100730880];
}

- (void)checkSafariCredentialEligibility:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B584;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)scheduleDeviceUpgradeTasksIfNecessary
{
}

- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005B618;
  v4[3] = &unk_10072F078;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(sharedWebServiceQueue, v4);
}

- (void)_scheduleDeviceUpgradeTaskActivityWithRandomizeStartDate:(BOOL)a3
{
  BOOL v5 = PDDefaultQueue();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005B940;
  v6[3] = &unk_10072F078;
  void v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)unscheduleDeviceUpgradeTaskActivity
{
  id v3 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BBE4;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_queue_completeDeviceUpgradeTasks
{
  PDSetUpgradeTasksRetryCount();
  id v3 = [(PDPaymentWebServiceCoordinator *)self sharedWebServiceContext];
  [v3 atomicallyUpdatePrimaryRegion:&stru_1007308A0];
  [(PDPaymentWebServiceArchiver *)self->_archiver archiveContext:v3];
  [(PDPaymentWebServiceCoordinator *)self unscheduleDeviceUpgradeTaskActivity];
}

- (void)_runDeviceUpgradeTasks
{
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005BDC0;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(sharedWebServiceQueue, block);
}

- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5
{
  id v8 = a3;
  sharedWebServiceQueue = self->_sharedWebServiceQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005CA94;
  v11[3] = &unk_1007309B8;
  int64_t v13 = a4;
  int64_t v14 = a5;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(sharedWebServiceQueue, v11);
}

- (void)_queue_performContactInformationFetchTaskWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:1])
  {
    uint64_t v5 = +[PKContactInformation contactInformationFromKeychain];
    if (!v5)
    {
      id v8 = objc_alloc_init((Class)PKContactInformationRequest);
      id v9 = [(PDPaymentWebServiceCoordinator *)self sharedWebService];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10005CD00;
      v10[3] = &unk_1007309E0;
      id v11 = v4;
      [v9 contactInformationWithRequest:v8 completion:v10];

      goto LABEL_9;
    }
    id v6 = v5;
    BOOL v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ContactInformation is already stored in Keychain. Ignoring fetch on upgrade and marking task complete.", buf, 2u);
    }
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User doesn't have any SecureElement passes. Ignoring contact information fetch on upgrade and marking task complete.", buf, 2u);
    }
  }

  (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_9:
}

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedWebServiceQueue);
  [(PDPaymentWebServiceCoordinator *)self _queue_setupBackgroundWebServiceWithCompletion:0];
}

- (PDApplyManager)applyManager
{
  return self->_applyManager;
}

- (PDCardFileManager)cardFileManager
{
  return self->_passStore;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDAppletSubcredentialManager)subcredentialManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_credentialManager);
  return (PDAppletSubcredentialManager *)WeakRetained;
}

- (PDExpressPassManager)expressPassManager
{
  return self->_expressPassManager;
}

- (PDPassUpgradeController)upgradeController
{
  return self->_upgradeController;
}

- (PDDeviceRegistrationServiceCoordinator)registrationCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (PDFamilyCircleManager)familyCircleManager
{
  return self->_familyCircleManager;
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setApplyManager:(id)a3
{
}

- (PDAppletSubcredentialManager)credentialManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_credentialManager);
  return (PDAppletSubcredentialManager *)WeakRetained;
}

- (void)setCredentialManager:(id)a3
{
}

- (PDPushProvisioningManager)pushProvisioningManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushProvisioningManager);
  return (PDPushProvisioningManager *)WeakRetained;
}

- (void)setPushProvisioningManager:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userNotificationManager);
  return (PDUserNotificationManager *)WeakRetained;
}

- (PDDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
}

- (PDPaymentSetupFeaturesCoordinator)paymentSetupFeaturesCoordinator
{
  return self->_paymentSetupFeaturesCoordinator;
}

- (void)setPaymentSetupFeaturesCoordinator:(id)a3
{
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (void)setDeviceRegistrationServiceCoordinator:(id)a3
{
}

- (PDDefaultPassManager)defaultPassManager
{
  return self->_defaultPassManager;
}

- (void)setDefaultPassManager:(id)a3
{
}

- (PDDevicePasscodeManager)devicePasscodeManager
{
  return self->_devicePasscodeManager;
}

- (void)setDevicePasscodeManager:(id)a3
{
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (void)setPeerPaymentWebServiceCoordinator:(id)a3
{
}

- (PDISO18013Manager)isoManager
{
  return self->_isoManager;
}

- (void)setIsoManager:(id)a3
{
}

- (PDPendingProvisioningManager)pendingProvisioningManager
{
  return self->_pendingProvisioningManager;
}

- (void)setPendingProvisioningManager:(id)a3
{
}

- (PDSharingManager)sharingManager
{
  return self->_sharingManager;
}

- (void)setSharingManager:(id)a3
{
}

- (PDProvisioningRequirementsChecker)provisioningRequirementsChecker
{
  return self->_provisioningRequirementsChecker;
}

- (void)setProvisioningRequirementsChecker:(id)a3
{
}

- (PDAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setAssertionManager:(id)a3
{
}

- (PDAuxiliaryCapabilityManager)auxiliaryCapabilityManager
{
  return self->_auxiliaryCapabilityManager;
}

- (void)setAuxiliaryCapabilityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryCapabilityManager, 0);
  objc_storeStrong((id *)&self->_provisioningRequirementsChecker, 0);
  objc_storeStrong((id *)&self->_sharingManager, 0);
  objc_storeStrong((id *)&self->_pendingProvisioningManager, 0);
  objc_storeStrong((id *)&self->_isoManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_devicePasscodeManager, 0);
  objc_storeStrong((id *)&self->_defaultPassManager, 0);
  objc_storeStrong((id *)&self->_deviceRegistrationServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_destroyWeak((id *)&self->_userNotificationManager);
  objc_destroyWeak((id *)&self->_pushProvisioningManager);
  objc_destroyWeak((id *)&self->_credentialManager);
  objc_storeStrong((id *)&self->_applyManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_safariCardImportManager, 0);
  objc_storeStrong((id *)&self->_fetchingReceiptUniqueIDs, 0);
  objc_storeStrong((id *)&self->_tapToRadarDelegate, 0);
  objc_storeStrong((id *)&self->_deviceCheckInTasks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_sharedWebServiceQueue, 0);
  objc_storeStrong((id *)&self->_activeConsistencyChecker, 0);
  objc_storeStrong((id *)&self->_paymentSetupFeaturesCoordinator, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_receiptFileManager, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_verificationObserver, 0);
  objc_storeStrong((id *)&self->_upgradeController, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_sharedWebService, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_passStore, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
}

@end