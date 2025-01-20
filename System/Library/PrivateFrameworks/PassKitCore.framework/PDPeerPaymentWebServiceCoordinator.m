@interface PDPeerPaymentWebServiceCoordinator
- (BOOL)_hasAssociatedPeerPaymentPass;
- (BOOL)_hasAssociatedPeerPaymentPassSetup;
- (BOOL)_peerPaymentPassExists;
- (BOOL)_shouldAttemptBackgroundPeerPaymentPassDownload;
- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationCoordinator;
- (PDPeerPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 paymentWebService:(id)a4 assertionManager:(id)a5 userNotificationManager:(id)a6 sharingIDSManager:(id)a7 familyCircleManager:(id)a8 dataSource:(id)a9 passStore:(id)a10 tapToRadarDelegate:(id)a11;
- (PKPaymentWebService)paymentWebService;
- (PKPeerPaymentWebService)sharedPeerPaymentWebService;
- (id)_altDSIDFromAssociatedAccountRemoteRegistrationActivityIdentifier:(id)a3;
- (id)_associatedAccountRemoteRegistrationActivityIdentifierForAltDSID:(id)a3;
- (id)_mockAccountInitialState;
- (id)pushNotificationTopics;
- (unint64_t)_peerPaymentErrorStateForRegistrationResponse:(id)a3 error:(id)a4 expectsPass:(BOOL)a5;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_archiveSharedPeerPaymentWebServiceContext;
- (void)_cancelPendingTransactionNotifications;
- (void)_completeUpdatingPreferences;
- (void)_downloadAssociatedPeerPaymentPassWithCompletion:(id)a3;
- (void)_handleUpdatedAccount:(id)a3 withOldAccount:(id)a4;
- (void)_initalizeCloudStoreIfNecessaryWithCompletion:(id)a3;
- (void)_performPeerPaymentAssociatedAccountRemoteRegistrationRequestWithActivityIdentifier:(id)a3 reason:(id)a4;
- (void)_performPeerPaymentPassDownloadActivity;
- (void)_performPeerPaymentReregisterActivityForReason:(id)a3;
- (void)_postAccountChangedNotification;
- (void)_postAssociatedAccountActiveNotificationIfNecessaryForNewAssociatedAccountInformation:(id)a3 oldAssociatedAccountInformation:(id)a4;
- (void)_postGraduationNotificationIfNecessary;
- (void)_processStaleAccountFetchAfterTranactionScheduledTask:(id)a3;
- (void)_queue_addAccountFetchRequest:(id)a3;
- (void)_queue_executeNextAccountFetchRequestIfPossible;
- (void)_queue_processRegistrationResponse:(id)a3 registrationError:(id)a4 previouslyRegistered:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7;
- (void)_removeUpcomingPaymentNotificationForRecurringPaymentIdentifier:(id)a3;
- (void)_scheduleAssociatedAccountRemoteRegistrationActivityIfNecessaryForReason:(unint64_t)a3;
- (void)_scheduleOrRemoveNotificationsForRecurringPayment:(id)a3;
- (void)_schedulePeerPaymentCoordinatorActivities;
- (void)_schedulePeerPaymentReregisterActivityForReason:(id)a3;
- (void)_updateAccountFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6;
- (void)_updateAccountWithRequest:(id)a3 completion:(id)a4;
- (void)_updateAssociatedAccountsFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6;
- (void)_updateEncryptionCertificateIfNeededForDestination:(unint64_t)a3 expectedVersion:(int64_t)a4 forceUpdate:(BOOL)a5 completion:(id)a6;
- (void)_updateEncryptionCertificatesIfNeededWithAccount:(id)a3;
- (void)_updatePreferencesWithCompletion:(id)a3;
- (void)_updatePushTopics;
- (void)_updateSharedCacheWithAccount:(id)a3;
- (void)_updateSharedCacheWithWebService:(id)a3;
- (void)_writePreferences:(id)a3 withError:(id)a4;
- (void)accountWithPreventingServerFetch:(BOOL)a3 completion:(id)a4;
- (void)applyPushNotificationToken:(id)a3;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteAccountWithCompletion:(id)a3;
- (void)deletePreferencesWithCompletion:(id)a3;
- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3;
- (void)didReceiveRemoteRegistationResult:(unint64_t)a3 fromDestination:(id)a4;
- (void)downloadPassIfNecessaryWithCompletion:(id)a3;
- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5;
- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)handleCompanionSerialNumberChanged;
- (void)handleMigratedAccount:(id)a3;
- (void)handlePassLibraryChangedWithPassUniqueIdentifier:(id)a3;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)identityVerificationResponseWithCompletion:(id)a3;
- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3;
- (void)peerPaymentPendingRequestsForRequests:(id)a3 completion:(id)a4;
- (void)performDeviceRegistrationWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7;
- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)preferencesWithCompletion:(id)a3;
- (void)receivedPeerPaymentMessage:(id)a3;
- (void)recurringPaymentsWithPreventingServerFetch:(BOOL)a3 completion:(id)a4;
- (void)registerDeviceWithForceReregister:(BOOL)a3 reason:(id)a4 completion:(id)a5;
- (void)registerDeviceWithReason:(id)a3 completion:(id)a4;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 reason:(id)a6 completion:(id)a7;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)registerObserver:(id)a3;
- (void)registrationStatusWithCompletion:(id)a3;
- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)scheduleTaskToFetchStaleAccountIfNecessary:(BOOL)a3 associatedAccountEndpoint:(BOOL)a4;
- (void)setCloudStoreNotificationCoordinator:(id)a3;
- (void)setDeviceRegistrationCoordinator:(id)a3;
- (void)setPaymentWebService:(id)a3;
- (void)setPreferences:(id)a3 completion:(id)a4;
- (void)submitDeviceScoreIdentifiersForTransaction:(id)a3 completion:(id)a4;
- (void)unregisterDeviceWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5;
- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4;
- (void)updateAccountWithCompletion:(id)a3;
- (void)updateAccountWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5;
- (void)updateAccountWithDiagnosticReasons:(id)a3 completion:(id)a4;
- (void)updateAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5;
- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4;
- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4;
- (void)updatePendingRequestsWithRequestTokens:(id)a3;
- (void)updateRecurringPaymentsWithCompletion:(id)a3;
- (void)updateSharedCache;
- (void)updateSharedWebServiceContext:(id)a3;
@end

@implementation PDPeerPaymentWebServiceCoordinator

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)accountWithPreventingServerFetch:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000842C;
    block[3] = &unk_100736830;
    block[4] = self;
    id v10 = v6;
    BOOL v11 = a3;
    dispatch_async(sharedPeerPaymentWebServiceQueue, block);
  }
}

- (PDPeerPaymentWebServiceCoordinator)initWithPushNotificationManager:(id)a3 paymentWebService:(id)a4 assertionManager:(id)a5 userNotificationManager:(id)a6 sharingIDSManager:(id)a7 familyCircleManager:(id)a8 dataSource:(id)a9 passStore:(id)a10 tapToRadarDelegate:(id)a11
{
  id v68 = a3;
  id v67 = a4;
  id v66 = a5;
  id v65 = a6;
  id v64 = a7;
  id obj = a8;
  id v63 = a8;
  id v18 = a9;
  id v19 = a10;
  id v62 = a11;
  v76.receiver = self;
  v76.super_class = (Class)PDPeerPaymentWebServiceCoordinator;
  v20 = [(PDPeerPaymentWebServiceCoordinator *)&v76 init];
  if (!v20) {
    goto LABEL_21;
  }
  v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v22 = dispatch_queue_create("sharedPeerPaymentWebServiceQueue", v21);
  sharedPeerPaymentWebServiceQueue = v20->_sharedPeerPaymentWebServiceQueue;
  v20->_sharedPeerPaymentWebServiceQueue = (OS_dispatch_queue *)v22;

  dispatch_queue_t v24 = dispatch_queue_create("sharedPeerPaymentWebServiceQueue.replyQueue", v21);
  replyQueue = v20->_replyQueue;
  v20->_replyQueue = (OS_dispatch_queue *)v24;

  v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingPreferencesFetches = v20->_pendingPreferencesFetches;
  v20->_pendingPreferencesFetches = v26;

  v28 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  queuedPendingPreferencesFetches = v20->_queuedPendingPreferencesFetches;
  v20->_queuedPendingPreferencesFetches = v28;

  v30 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  accountFetchRequests = v20->_accountFetchRequests;
  v20->_accountFetchRequests = v30;

  objc_storeWeak((id *)&v20->_dataSource, v18);
  objc_storeWeak((id *)&v20->_passStore, v19);
  objc_storeStrong((id *)&v20->_assertionManager, a5);
  objc_storeStrong((id *)&v20->_paymentWebService, a4);
  objc_storeStrong((id *)&v20->_pushNotificationManager, a3);
  objc_storeStrong((id *)&v20->_userNotificationManager, a6);
  objc_storeStrong((id *)&v20->_tapToRadarDelegate, a11);
  objc_storeStrong((id *)&v20->_sharingIDSManager, a7);
  [(PKSharingIDSManager *)v20->_sharingIDSManager addDelegate:v20];
  objc_storeStrong((id *)&v20->_familyCircleManager, obj);
  v32 = PKSharedPeerPaymentWebServiceContextPath();
  v33 = +[PKPeerPaymentWebServiceContext contextWithArchive:v32];

  v34 = [[PDPeerPaymentWebServiceArchiver alloc] initWithQueue:v20->_sharedPeerPaymentWebServiceQueue];
  archiver = v20->_archiver;
  v20->_archiver = v34;

  id v36 = objc_alloc((Class)PKPeerPaymentWebService);
  id v37 = [objc_alloc((Class)PKPeerPaymentWebServiceTargetDevice) initWithTargetDeviceDelegate:v20];
  v38 = (PKPeerPaymentWebService *)[v36 initWithContext:v33 targetDevice:v37 archiver:v20->_archiver];
  sharedPeerPaymentWebService = v20->_sharedPeerPaymentWebService;
  v20->_sharedPeerPaymentWebService = v38;

  [(PDPeerPaymentWebServiceCoordinator *)v20 _updateSharedCacheWithWebService:v20->_sharedPeerPaymentWebService];
  if (([(PKPeerPaymentWebService *)v20->_sharedPeerPaymentWebService needsRegistration] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v20->_dataSource);
    uint64_t v41 = [WeakRetained peerPaymentAccount];
    account = v20->_account;
    v20->_account = (PKPeerPaymentAccount *)v41;

    id v43 = objc_loadWeakRetained((id *)&v20->_dataSource);
    uint64_t v44 = [v43 peerPaymentPreferences];
    preferences = v20->_preferences;
    v20->_preferences = (PKPeerPaymentPreferences *)v44;

    v46 = v20->_account;
    if (v46)
    {
      v47 = [(PKPeerPaymentAccount *)v46 identifier];

      if (!v47)
      {
        v52 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "The doesnt have the identifier defined on the peer payment account. Updating now.", buf, 2u);
        }

        v53 = +[NSSet setWithObject:@"CashReasonNoAccountIdentifier"];
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_10046E28C;
        v73[3] = &unk_1007534B8;
        v74 = v20;
        [(PDPeerPaymentWebServiceCoordinator *)v74 updateAccountWithDiagnosticReasons:v53 completion:v73];

        v51 = v74;
        goto LABEL_16;
      }
      if (v20->_account)
      {
        if (!v20->_preferences)
        {
          v48 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "The user is registered for peer payment but does not have any preferences. Fetching preferences now.", buf, 2u);
          }

          [(PDPeerPaymentWebServiceCoordinator *)v20 updatePreferencesWithCompletion:0];
        }
        goto LABEL_17;
      }
    }
    v49 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "The user is registered for peer payment but does not have an account. Fetching account now.", buf, 2u);
    }

    v50 = +[NSSet setWithObject:@"CashReasonMissingAccount"];
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10046E314;
    v71[3] = &unk_1007534B8;
    v72 = v20;
    [(PDPeerPaymentWebServiceCoordinator *)v72 updateAccountAndAssociatedAccountsWithDiagnosticReasons:v50 completion:v71];

    v51 = v72;
LABEL_16:
  }
LABEL_17:
  if ((PKUseMockSURFServer() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    uint64_t v54 = [(PDPeerPaymentWebServiceCoordinator *)v20 _mockAccountInitialState];
    mockAccount = v20->_mockAccount;
    v20->_mockAccount = (PKPeerPaymentAccount *)v54;
  }
  v56 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046E588;
  block[3] = &unk_10072E1E8;
  v57 = v20;
  v70 = v57;
  dispatch_async(v56, block);

  [(PDPeerPaymentWebServiceCoordinator *)v57 _updatePushTopics];
  [(PDPeerPaymentWebServiceCoordinator *)v57 _schedulePeerPaymentCoordinatorActivities];
  uint64_t v58 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
  observers = v57->_observers;
  v57->_observers = (NSHashTable *)v58;

  *(void *)&v57->_lockObservers._os_unfair_lock_opaque = 0;
LABEL_21:

  return v20;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:PDSharedPeerPaymentWebServiceDidChangeNotification object:0];

  [(PKPeerPaymentWebService *)self->_sharedPeerPaymentWebService invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PDPeerPaymentWebServiceCoordinator;
  [(PDPeerPaymentWebServiceCoordinator *)&v4 dealloc];
}

- (PKPeerPaymentWebService)sharedPeerPaymentWebService
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100020E18;
  id v10 = sub_100021200;
  id v11 = 0;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10046E700;
  v5[3] = &unk_10072FAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sharedPeerPaymentWebServiceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKPeerPaymentWebService *)v3;
}

- (void)deleteSharedWebServiceWithDiagnosticReason:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10046E7AC;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)updateSharedWebServiceContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10046EE84;
    block[3] = &unk_10072E198;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(sharedPeerPaymentWebServiceQueue, block);
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error: Refusing to update webservice context with nil.", v8, 2u);
    }
  }
}

- (void)preferencesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10046F008;
    v7[3] = &unk_10072E598;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
  }
}

- (void)handlePassLibraryChangedWithPassUniqueIdentifier:(id)a3
{
  if (a3)
  {
    account = self->_account;
    if (account)
    {
      id v5 = a3;
      id v10 = [(PKPeerPaymentAccount *)account associatedPassUniqueID];
      unsigned int v6 = [v10 isEqualToString:v5];

      if (v6)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        id v8 = [WeakRetained insertOrUpdatePeerPaymentAccount:self->_account];
        v9 = self->_account;
        self->_account = v8;
      }
    }
  }
}

- (void)receivedPeerPaymentMessage:(id)a3
{
  id v4 = a3;
  if ([(PKPeerPaymentAccount *)self->_account stage] != (id)1) {
    goto LABEL_4;
  }
  uint64_t v5 = (uint64_t)[(PKPeerPaymentAccount *)self->_account pendingPaymentCount];
  if (v5)
  {
    if (v5 >= 2) {
LABEL_4:
    }
      PKSharedCacheSetObjectForKey();
  }
  else if ([v4 hasSenderAddress])
  {
    unsigned int v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Caching sender address as a pending payment", v8, 2u);
    }

    v7 = [v4 senderAddress];
    PKSharedCacheSetObjectForKey();
  }
}

- (void)identityVerificationResponseWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10046F300;
  v7[3] = &unk_10072E598;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)registrationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10046F434;
  v7[3] = &unk_10072E598;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)handleCompanionSerialNumberChanged
{
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046F6A4;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)registerDeviceWithForceReregister:(BOOL)a3 reason:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    int v19 = 138412290;
    CFStringRef v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to register with the peer payment service. Force Re-register %@", (uint8_t *)&v19, 0xCu);
  }

  v12 = [(PKPaymentWebService *)self->_paymentWebService context];
  v13 = [v12 peerPaymentServiceURL];

  PKPeerPaymentServiceOverrideURL();
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      CFStringRef v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using overriden peer payment service url '%@'", (uint8_t *)&v19, 0xCu);
    }

    v16 = v14;
    v13 = v16;
  }
  v17 = [(PKPaymentWebService *)self->_paymentWebService context];
  id v18 = [v17 pushToken];

  [(PDPeerPaymentWebServiceCoordinator *)self registerDeviceWithRegistrationURL:v13 pushToken:v18 forceReregister:v6 completion:v9];
}

- (void)registerDeviceWithReason:(id)a3 completion:(id)a4
{
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6
{
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 reason:(id)a5 completion:(id)a6
{
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 reason:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10046FAA4;
  v21[3] = &unk_100753508;
  BOOL v26 = a5;
  id v24 = v14;
  id v25 = v15;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  id v20 = v15;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v21);
}

- (void)performDeviceRegistrationWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046FE54;
  block[3] = &unk_10073E0F8;
  id v20 = v12;
  id v21 = v13;
  BOOL v24 = a5;
  id v22 = self;
  id v23 = v14;
  BOOL v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)_queue_processRegistrationResponse:(id)a3 registrationError:(id)a4 previouslyRegistered:(BOOL)a5 abridgedRegistration:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [v13 domain];
  unsigned int v16 = [v15 isEqualToString:PKDisplayableErrorDomain];

  if (v16)
  {
    id v17 = [v13 userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v13 = (id)v18;
  }
  unint64_t v19 = [(PDPeerPaymentWebServiceCoordinator *)self _peerPaymentErrorStateForRegistrationResponse:v12 error:v13 expectsPass:!v8];
  id v20 = [v13 code];
  if (v12 && !v13)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1004709E8;
    v32[3] = &unk_1007535A8;
    v32[4] = self;
    v33 = (__CFString *)v12;
    id v34 = 0;
    BOOL v36 = v8;
    BOOL v37 = a5;
    id v35 = v14;
    id v21 = objc_retainBlock(v32);
    familyCircleManager = self->_familyCircleManager;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100470CB8;
    v29[3] = &unk_1007535D0;
    BOOL v31 = v8;
    v29[4] = self;
    id v30 = v21;
    id v23 = v21;
    [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:0 completion:v29];

    BOOL v24 = v33;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v25 = [v13 domain];
  if ([v25 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
  {

    if (v20 == (id)40319 || v20 == (id)40308)
    {
      BOOL v26 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v49 = v20;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to re-register due to terminal server response %li. Unscheduling peer payment re-register activity and attempting to unregister device.", buf, 0xCu);
      }

      PDScheduledActivityRemove();
      PKSetUserHasDisabledPeerPayment();
      if (v20 == (id)40308) {
        CFStringRef v27 = @"Unregister Underage Account";
      }
      else {
        CFStringRef v27 = @"Unregister, invalid email";
      }
      [(PKPeerPaymentWebService *)self->_sharedPeerPaymentWebService addDiagnosticReason:v27];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10047084C;
      v43[3] = &unk_100753580;
      v43[4] = self;
      CFStringRef v44 = v27;
      id v46 = v14;
      unint64_t v47 = v19;
      id v45 = v13;
      [(PDPeerPaymentWebServiceCoordinator *)self unregisterDeviceWithCompletion:v43];

      BOOL v24 = (__CFString *)v44;
      goto LABEL_23;
    }
  }
  else
  {
  }
  if (!a5)
  {
    if (v19 > 4) {
      CFStringRef v28 = @"unknown";
    }
    else {
      CFStringRef v28 = off_100753BB8[v19];
    }
    [(PKPeerPaymentWebService *)self->_sharedPeerPaymentWebService addDiagnosticReason:v28];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100470988;
    v38[3] = &unk_100753580;
    v38[4] = self;
    CFStringRef v39 = v28;
    id v41 = v14;
    unint64_t v42 = v19;
    id v40 = v13;
    [(PDPeerPaymentWebServiceCoordinator *)self unregisterDeviceWithCompletion:v38];

    BOOL v24 = (__CFString *)v39;
    goto LABEL_23;
  }
  if (v14) {
    (*((void (**)(id, unint64_t, id))v14 + 2))(v14, v19, v13);
  }
LABEL_24:
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to unregister from the peer payment service.", buf, 2u);
  }

  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100471134;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v8);
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObject:@"CashReasonWallet"];
  [(PDPeerPaymentWebServiceCoordinator *)self updateAccountWithDiagnosticReasons:v5 completion:v4];
}

- (void)updateAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObject:@"CashReasonWallet"];
  [(PDPeerPaymentWebServiceCoordinator *)self updateAssociatedAccountsWithDiagnosticReasons:v5 completion:v4];
}

- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObject:@"CashReasonWallet"];
  [(PDPeerPaymentWebServiceCoordinator *)self updateAccountAndAssociatedAccountsWithDiagnosticReasons:v5 completion:v4];
}

- (void)updateAccountWithDiagnosticReasons:(id)a3 completion:(id)a4
{
}

- (void)updateAccountWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateAccountFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v12 = a6;
  id v10 = a4;
  CFStringRef v11 = [[PDPeerPaymentWebServiceAccountFetch alloc] initWithCompletionHandler:v12];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 setUpdateAccount:1];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 setFromPush:v8];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 setUpdatePass:!v6];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 addDiagnosticReasons:v10];

  if (v8) {
    [(PDPeerPaymentWebServiceAccountFetch *)v11 addDiagnosticReason:@"CashReasonFromPush"];
  }
  [(PDPeerPaymentWebServiceCoordinator *)self _updateAccountWithRequest:v11 completion:v12];
}

- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4
{
}

- (void)updateAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateAssociatedAccountsFromPush:(BOOL)a3 diagnosticReasons:(id)a4 abridgedRegistration:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v12 = a6;
  id v10 = a4;
  CFStringRef v11 = [[PDPeerPaymentWebServiceAccountFetch alloc] initWithCompletionHandler:v12];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 setUpdateAssociatedAccounts:1];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 setFromPush:v8];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 setUpdatePass:!v6];
  [(PDPeerPaymentWebServiceAccountFetch *)v11 addDiagnosticReasons:v10];

  if (v8) {
    [(PDPeerPaymentWebServiceAccountFetch *)v11 addDiagnosticReason:@"CashReasonFromPush"];
  }
  [(PDPeerPaymentWebServiceCoordinator *)self _updateAccountWithRequest:v11 completion:v12];
}

- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 completion:(id)a4
{
}

- (void)updateAccountAndAssociatedAccountsWithDiagnosticReasons:(id)a3 abridgedRegistration:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PDPeerPaymentWebServiceAccountFetch alloc] initWithCompletionHandler:v8];
  [(PDPeerPaymentWebServiceAccountFetch *)v10 setUpdateAccount:1];
  [(PDPeerPaymentWebServiceAccountFetch *)v10 setUpdateAssociatedAccounts:1];
  [(PDPeerPaymentWebServiceAccountFetch *)v10 setUpdatePass:!v5];
  [(PDPeerPaymentWebServiceAccountFetch *)v10 addDiagnosticReasons:v9];

  [(PDPeerPaymentWebServiceCoordinator *)self _updateAccountWithRequest:v10 completion:v8];
}

- (void)deleteAccountWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting peer payment account.", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v7 = [WeakRetained removePeerPaymentAccount];

  account = self->_account;
  self->_account = 0;

  [(PDPeerPaymentWebServiceCoordinator *)self _postAccountChangedNotification];
  [(PDPeerPaymentWebServiceCoordinator *)self _accessObserversWithHandler:&stru_100753610];
  [(PDPeerPaymentWebServiceCoordinator *)self deletePreferencesWithCompletion:v4];
}

- (void)deletePreferencesWithCompletion:(id)a3
{
  id v9 = a3;
  PKPeerPaymentRemoveAllRecurringPaymentRecentMemoIcons();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [WeakRetained removePeerPaymentPreferences];

  preferences = self->_preferences;
  self->_preferences = 0;

  id v7 = +[NSDistributedNotificationCenter defaultCenter];
  [v7 postNotificationName:PDPeerPaymentServicePreferencesChangedDistributedNotification object:0 userInfo:0 deliverImmediately:0];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100471B98;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)handleMigratedAccount:(id)a3
{
  id v4 = a3;
  id WeakRetained = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Handling migrated peer payment account.", buf, 2u);
  }

  account = self->_account;
  if (account
    && ([(PKPeerPaymentAccount *)account lastUpdated],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v4 lastUpdated],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v7 compare:v8],
        v8,
        v7,
        v9 == (id)1))
  {
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Provided peer payment account is older than the one we have.", v12, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v10 = [WeakRetained insertOrUpdatePeerPaymentAccount:v4];
    CFStringRef v11 = self->_account;
    self->_account = v10;
  }
}

- (BOOL)_peerPaymentPassExists
{
  id v3 = [(PKPeerPaymentAccount *)self->_account associatedPassUniqueID];
  if (v3)
  {
    id v4 = [(PKPeerPaymentAccount *)self->_account associatedPassURL];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      id v6 = [(PKPeerPaymentAccount *)self->_account associatedPassUniqueID];
      unsigned __int8 v7 = [WeakRetained passExistsWithUniqueID:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if ([(PDPeerPaymentWebServiceCoordinator *)self _hasAssociatedPeerPaymentPassSetup])
  {
    if (v4) {
      v4[2](v4, 1);
    }
  }
  else
  {
    [(PDPeerPaymentWebServiceCoordinator *)self _downloadAssociatedPeerPaymentPassWithCompletion:v4];
  }
}

- (BOOL)_hasAssociatedPeerPaymentPass
{
  id v3 = [(PKPeerPaymentAccount *)self->_account associatedPassUniqueID];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    unsigned __int8 v5 = [WeakRetained passExistsWithUniqueID:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_hasAssociatedPeerPaymentPassSetup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = [(PKPeerPaymentAccount *)self->_account associatedPassUniqueID];
  unsigned __int8 v5 = [WeakRetained passWithUniqueIdentifier:v4];
  id v6 = [v5 paymentPass];

  if (v6)
  {
    unsigned __int8 v7 = [v6 devicePrimaryPaymentApplication];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_downloadAssociatedPeerPaymentPassWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004721BC;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4
{
  id v14 = (void (**)(id, PKPeerPaymentAccount *))a4;
  mockAccount = self->_mockAccount;
  id v7 = a3;
  id v8 = [(PKPeerPaymentAccount *)mockAccount currentBalance];
  id v9 = [v8 amount];
  id v10 = [v9 decimalNumberByAdding:v7];

  id v11 = objc_alloc((Class)PKCurrencyAmount);
  id v12 = [v8 currency];
  id v13 = [v11 initWithAmount:v10 currency:v12 exponent:0];

  [(PKPeerPaymentAccount *)self->_mockAccount setCurrentBalance:v13];
  [(PDPeerPaymentWebServiceCoordinator *)self _postAccountChangedNotification];
  if (v14) {
    v14[2](v14, self->_mockAccount);
  }
}

- (void)submitDeviceScoreIdentifiersForTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10047370C;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100473990;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100473A38;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100473ADC;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100473BCC;
  v15[3] = &unk_100730578;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v15);
}

- (void)_schedulePeerPaymentCoordinatorActivities
{
  id v3 = PDDefaultQueue();
  PDScheduledActivityClientRegister();

  if ([(PDPeerPaymentWebServiceCoordinator *)self _shouldAttemptBackgroundPeerPaymentPassDownload])
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling background peer payment pass download activity task.", v6, 2u);
    }

    unsigned __int8 v5 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
    [v5 setRepeating:1];
    [v5 setRepeatInterval:3600.0];
    [v5 setRequireNetworkConnectivity:1];
    PDScheduledActivityRegister();
  }
}

- (void)_performPeerPaymentPassDownloadActivity
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Background peer payment pass download activity fired.", buf, 2u);
  }

  unsigned int v4 = [(PDPeerPaymentWebServiceCoordinator *)self _shouldAttemptBackgroundPeerPaymentPassDownload];
  BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting peer payment pass download.", buf, 2u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100473EDC;
    v11[3] = &unk_10072E1E8;
    v11[4] = self;
    id v6 = objc_retainBlock(v11);
    id v7 = v6;
    if (self->_account)
    {
      ((void (*)(void *))v6[2])(v6);
    }
    else
    {
      id v8 = +[NSSet setWithObject:@"CashReasonPassBackgroundDownload"];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100473F84;
      v9[3] = &unk_100747720;
      id v10 = v7;
      [(PDPeerPaymentWebServiceCoordinator *)self updateAccountAndAssociatedAccountsWithDiagnosticReasons:v8 completion:v9];
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unscheduling peer payment pass download activity.", buf, 2u);
    }

    PDScheduledActivityRemove();
  }
}

- (void)_schedulePeerPaymentReregisterActivityForReason:(id)a3
{
  id v3 = a3;
  unsigned int v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling peer payment re-register activity.", v6, 2u);
  }

  BOOL v5 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
  [v5 setRepeating:1];
  [v5 setRepeatInterval:900.0];
  [v5 setRequireNetworkConnectivity:1];
  [v5 setReason:v3];
  PDScheduledActivityRegister();
}

- (void)_performPeerPaymentReregisterActivityForReason:(id)a3
{
  unsigned int v4 = (__CFString *)a3;
  if (v4) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = @"default re-register";
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduled peer payment re-register activity fired because: %{public}@", buf, 0xCu);
  }

  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004741A0;
  v9[3] = &unk_10072E198;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v9);
}

- (void)_scheduleAssociatedAccountRemoteRegistrationActivityIfNecessaryForReason:(unint64_t)a3
{
  familyCircleManager = self->_familyCircleManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004743F8;
  v4[3] = &unk_10072F440;
  v4[4] = self;
  v4[5] = a3;
  [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:0 completion:v4];
}

- (id)_associatedAccountRemoteRegistrationActivityIdentifierForAltDSID:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@", @"PPRemoteRegActivity.", a3];
}

- (id)_altDSIDFromAssociatedAccountRemoteRegistrationActivityIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"PPRemoteRegActivity."])
  {
    unsigned int v4 = [v3 stringByReplacingOccurrencesOfString:@"PPRemoteRegActivity." withString:&stru_10075AAD8];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (void)_performPeerPaymentAssociatedAccountRemoteRegistrationRequestWithActivityIdentifier:(id)a3 reason:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = @"IDS message received with registration result";
  }
  id v9 = [(PDPeerPaymentWebServiceCoordinator *)self _altDSIDFromAssociatedAccountRemoteRegistrationActivityIdentifier:v6];
  id v10 = PKLogFacilityTypeGetObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing associated account remote registration activity for reason: %{public}@ and altDSID %@", buf, 0x16u);
    }

    sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100474C44;
    v13[3] = &unk_100730198;
    v13[4] = self;
    id v14 = v9;
    id v15 = @"PDPeerPaymentWebServiceCoordinator";
    id v16 = v6;
    dispatch_async(sharedPeerPaymentWebServiceQueue, v13);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot perform associated account remote registration activity since there is no altDSID defined in activity identifier %@", buf, 0xCu);
    }

    PDScheduledActivityRemove();
  }
}

- (void)scheduleTaskToFetchStaleAccountIfNecessary:(BOOL)a3 associatedAccountEndpoint:(BOOL)a4
{
  if (a3 || a4)
  {
    if (a3 && a4)
    {
      CFStringRef v7 = @"CashStaleAccountAndAssociatedAccount";
      if (PDScheduledActivityExists()) {
        return;
      }
LABEL_15:
      sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1004753C4;
      v9[3] = &unk_1007537C0;
      BOOL v12 = a3;
      BOOL v13 = a4;
      void v9[4] = self;
      id v10 = @"PDPeerPaymentWebServiceCoordinator";
      BOOL v11 = (__CFString *)v7;
      dispatch_async(sharedPeerPaymentWebServiceQueue, v9);

      return;
    }
    if (a3)
    {
      if ((PDScheduledActivityExists() & 1) == 0 && (PDScheduledActivityExists() & 1) == 0)
      {
        CFStringRef v7 = @"CashStaleAccount";
        goto LABEL_15;
      }
    }
    else if (a4 && (PDScheduledActivityExists() & 1) == 0 && (PDScheduledActivityExists() & 1) == 0)
    {
      CFStringRef v7 = @"CashStaleAssociatedAccount";
      goto LABEL_15;
    }
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if ([v17 isEqualToString:@"PeerPaymentPassDownload"])
  {
    [(PDPeerPaymentWebServiceCoordinator *)self _performPeerPaymentPassDownloadActivity];
    goto LABEL_8;
  }
  if ([v17 isEqualToString:@"PeerPaymentReregisterActivity"])
  {
    CFStringRef v7 = [v6 reason];
    [(PDPeerPaymentWebServiceCoordinator *)self _performPeerPaymentReregisterActivityForReason:v7];
LABEL_7:

    goto LABEL_8;
  }
  if ([v17 hasPrefix:@"PPRemoteRegActivity."])
  {
    CFStringRef v7 = [v6 reason];
    [(PDPeerPaymentWebServiceCoordinator *)self _performPeerPaymentAssociatedAccountRemoteRegistrationRequestWithActivityIdentifier:v17 reason:v7];
    goto LABEL_7;
  }
  id v8 = (__CFString *)v17;
  id v9 = v8;
  if (v8 == @"CashStaleAccountAndAssociatedAccount") {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned __int8 v10 = [(__CFString *)v8 isEqualToString:@"CashStaleAccountAndAssociatedAccount"];

    if (v10) {
      goto LABEL_18;
    }
    BOOL v11 = v9;
    if (v11 == @"CashStaleAccount"
      || (BOOL v12 = v11,
          unsigned __int8 v13 = [(__CFString *)v11 isEqualToString:@"CashStaleAccount"],
          v12,
          (v13 & 1) != 0)
      || (id v14 = v12, v14 == @"CashStaleAssociatedAccount")
      || (id v15 = v14,
          unsigned int v16 = [(__CFString *)v14 isEqualToString:@"CashStaleAssociatedAccount"], v15, v16))
    {
LABEL_18:
      [(PDPeerPaymentWebServiceCoordinator *)self _processStaleAccountFetchAfterTranactionScheduledTask:v9];
    }
  }
LABEL_8:
}

- (void)_processStaleAccountFetchAfterTranactionScheduledTask:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100475760;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6
{
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = PKCurrentCloudStoreApplePayContainerName();
  id v11 = v9;
  id v12 = v10;
  if (v12 == v11)
  {
  }
  else
  {
    unsigned __int8 v13 = v12;
    if (!v11 || !v12)
    {

      goto LABEL_11;
    }
    unsigned int v14 = [v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_11;
    }
  }
  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PDPeerPaymentWebServiceCoordinator: The %@ zone was created.", buf, 0xCu);
  }

  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100475BEC;
  v17[3] = &unk_10072E198;
  v17[4] = self;
  id v18 = v8;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v17);

LABEL_11:
}

- (void)_updatePushTopics
{
  id v3 = [(PKPeerPaymentWebService *)self->_sharedPeerPaymentWebService context];
  id v20 = [v3 pushTopic];

  id v4 = objc_alloc_init((Class)NSMutableSet);
  BOOL v5 = v4;
  if (v20) {
    [v4 addObject:v20];
  }
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v6 = [(NSSet *)self->_peerPaymentPushNotificationTopics copy];
  id v19 = [(NSSet *)self->_additionalPushNotificationTopics copy];
  if (![v5 count]) {
    [v5 addObject:@"com.apple.peerpayment"];
  }
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = [(PKPeerPaymentAccount *)self->_account additionalPushTopics];
  id v9 = [v8 preferences];
  if (v9) {
    [v7 addObject:v9];
  }
  unsigned __int8 v10 = [v8 associatedAccounts];
  id v11 = v6;
  if (v10) {
    [v7 addObject:v10];
  }
  id v12 = [v8 requests];
  if (v12) {
    [v7 addObject:v12];
  }
  unsigned __int8 v13 = [v8 endpoint];
  if (v13) {
    [v7 addObject:v13];
  }
  unsigned int v14 = (NSSet *)[v7 copy];
  additionalPushNotificationTopics = self->_additionalPushNotificationTopics;
  self->_additionalPushNotificationTopics = v14;

  unsigned int v16 = (NSSet *)[v5 copy];
  peerPaymentPushNotificationTopics = self->_peerPaymentPushNotificationTopics;
  self->_peerPaymentPushNotificationTopics = v16;

  if (!PKEqualObjects())
  {
    os_unfair_lock_unlock(&self->_lockPushTopics);

    goto LABEL_17;
  }
  char v18 = PKEqualObjects();
  os_unfair_lock_unlock(&self->_lockPushTopics);

  if ((v18 & 1) == 0) {
LABEL_17:
  }
    [(PDPushNotificationManager *)self->_pushNotificationManager recalculatePushTopics];
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  peerPaymentPushNotificationTopics = self->_peerPaymentPushNotificationTopics;
  if (peerPaymentPushNotificationTopics) {
    id v5 = [(NSSet *)peerPaymentPushNotificationTopics mutableCopy];
  }
  else {
    id v5 = objc_alloc_init((Class)NSMutableSet);
  }
  id v6 = v5;
  id v7 = [(NSSet *)self->_additionalPushNotificationTopics allObjects];
  [v6 addObjectsFromArray:v7];

  os_unfair_lock_unlock(p_lockPushTopics);
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Web Service push topics: %@", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [v6 copy];
  return v9;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received push for push topic: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lockPushTopics);
  unsigned __int8 v9 = [(NSSet *)self->_peerPaymentPushNotificationTopics containsObject:v6];
  os_unfair_lock_unlock(&self->_lockPushTopics);
  if ((v9 & 1) == 0)
  {
    unsigned __int8 v10 = [(PKPeerPaymentWebService *)self->_sharedPeerPaymentWebService context];
    id v11 = [v10 pushTopic];
    id v12 = v6;
    unsigned __int8 v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      if (!v12 || !v11)
      {

LABEL_12:
        sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1004763D8;
        v17[3] = &unk_10072E238;
        v17[4] = self;
        id v18 = v13;
        id v19 = v7;
        dispatch_async(sharedPeerPaymentWebServiceQueue, v17);

        goto LABEL_13;
      }
      unsigned __int8 v14 = [v11 isEqualToString:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  id v15 = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004762E0;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(v15, block);
LABEL_13:
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100476974;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  unsigned __int8 v9 = self;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)_cancelPendingTransactionNotifications
{
  id v3 = [(PKPeerPaymentAccount *)self->_account associatedPassUniqueID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [WeakRetained passWithUniqueIdentifier:v3];
  id v6 = [v5 paymentPass];

  id v7 = [v6 deviceTransactionSourceIdentifiers];
  id v8 = [v7 count];

  if (v8)
  {
    unsigned __int8 v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v31 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching all received peer payment transactions associated with the peer payment pass %@", buf, 0xCu);
    }
    BOOL v25 = v3;

    unsigned __int8 v10 = +[NSDate date];
    uint64_t v11 = [v10 dateByAddingTimeInterval:-604800.0];

    id v12 = objc_loadWeakRetained((id *)&self->_dataSource);
    unsigned __int8 v13 = [v6 deviceTransactionSourceIdentifiers];
    unsigned __int8 v14 = +[NSDate date];
    BOOL v24 = (void *)v11;
    id v15 = [v12 peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:v13 withPeerPaymentSubtype:2 withTransactionSource:0 withBackingData:0 startDate:v11 endDate:v14];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v22 = +[PDPeerPaymentTransactionReminderUserNotification notificationIdentifierForTransactionServiceIdentifier:v21 reminderPeriod:0];
          id v23 = +[PDPeerPaymentTransactionReminderUserNotification notificationIdentifierForTransactionServiceIdentifier:v21 reminderPeriod:1];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            BOOL v31 = v22;
            __int16 v32 = 2112;
            v33 = v23;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing peer payment reminder notifications with identifiers: One Hour: %@, Day Before: %@", buf, 0x16u);
          }

          [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v22];
          [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v23];
        }
        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }

    id v3 = v25;
  }
}

- (void)didReceiveRemoteRegistationResult:(unint64_t)a3 fromDestination:(id)a4
{
  id v6 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100476F8C;
  block[3] = &unk_10072F7D0;
  uint64_t v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)peerPaymentPendingRequestsForRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004775F8;
  block[3] = &unk_100731830;
  unsigned __int8 v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)updatePendingRequestsWithRequestTokens:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PKPeerPaymentPendingRequestsRequest);
  [v5 setRequestTokens:v4];
  sharedPeerPaymentWebService = self->_sharedPeerPaymentWebService;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100477B6C;
  v8[3] = &unk_1007538C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(PKPeerPaymentWebService *)sharedPeerPaymentWebService peerPaymentPendingRequestsWithRequest:v5 completion:v8];
}

- (void)recurringPaymentsWithPreventingServerFetch:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10047805C;
  block[3] = &unk_10073A378;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004781A0;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004788BC;
  v13[3] = &unk_100753978;
  id v15 = v9;
  unint64_t v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v13);
}

- (void)_scheduleOrRemoveNotificationsForRecurringPayment:(id)a3
{
  id v4 = a3;
  if ([v4 sentByMe])
  {
    id v5 = [v4 createdDate];
    id v6 = [v4 startDate];
    if (v5)
    {
      [v5 timeIntervalSinceNow];
      if (v7 > -180.0 && v6 != 0)
      {
        id v9 = +[NSCalendar currentCalendar];
        unsigned __int8 v10 = [v9 isDateInToday:v6];

        if ((v10 & 1) == 0)
        {
          id v11 = [PDPeerPaymentRecurringPaymentSetupNotification alloc];
          id v12 = [(PKPeerPaymentAccount *)self->_account associatedPassUniqueID];
          unsigned __int8 v13 = [(PDPeerPaymentRecurringPaymentSetupNotification *)v11 initWithPassUniqueIdentifier:v12 recurringPayment:v4];

          [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v13];
        }
      }
    }
    if (([v4 status] == (id)1 || objc_msgSend(v4, "status") == (id)3)
      && ([v4 upcomingPaymentDates],
          id v14 = objc_claimAutoreleasedReturnValue(),
          id v15 = [v14 count],
          v14,
          v15))
    {
      unint64_t v16 = [v4 upcomingPaymentDates];
      id v17 = [v16 firstObject];

      id v18 = +[NSCalendar currentCalendar];
      unsigned __int8 v19 = [v18 isDateInToday:v17];

      if ((v19 & 1) == 0)
      {
        sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100478FAC;
        block[3] = &unk_10072E238;
        id v22 = v4;
        id v23 = self;
        id v24 = v17;
        dispatch_async(sharedPeerPaymentWebServiceQueue, block);
      }
    }
    else
    {
      id v17 = [v4 identifier];
      [(PDPeerPaymentWebServiceCoordinator *)self _removeUpcomingPaymentNotificationForRecurringPaymentIdentifier:v17];
    }
  }
}

- (void)_removeUpcomingPaymentNotificationForRecurringPaymentIdentifier:(id)a3
{
  id v4 = +[PDPeerPaymentRecurringPaymentUpcomingPaymentNotification notificationIdentifierForRecurringPaymentIdentifier:a3];
  [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v4];
}

- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    id v9 = [(PKPeerPaymentAccount *)self->_account encryptionCertificatesVersions];
    id v10 = [v9 certificatesVersionForDestination:a3];

    [(PDPeerPaymentWebServiceCoordinator *)self _updateEncryptionCertificateIfNeededForDestination:a3 expectedVersion:v10 forceUpdate:v5 completion:v8];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unknown encryption certificate destination, ignoring.", v12, 2u);
    }

    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
}

- (void)_updateEncryptionCertificatesIfNeededWithAccount:(id)a3
{
  id v6 = a3;
  id v4 = [v6 encryptionCertificatesVersions];
  id v5 = [v4 certificatesVersionForDestination:1];

  [(PDPeerPaymentWebServiceCoordinator *)self _updateEncryptionCertificateIfNeededForDestination:1 expectedVersion:v5 forceUpdate:0 completion:0];
}

- (void)_updateEncryptionCertificateIfNeededForDestination:(unint64_t)a3 expectedVersion:(int64_t)a4 forceUpdate:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004795A8;
  block[3] = &unk_1007539F0;
  unint64_t v15 = a3;
  int64_t v16 = a4;
  BOOL v17 = a5;
  void block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100479900;
    v10[3] = &unk_100753A58;
    v10[4] = self;
    id v11 = v8;
    id v12 = v9;
    [(PDPeerPaymentWebServiceCoordinator *)self encryptionCertificateForDestination:a4 forceUpdate:0 completion:v10];
  }
}

- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100479D2C;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  unsigned __int8 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (BOOL)_shouldAttemptBackgroundPeerPaymentPassDownload
{
  unsigned __int8 v3 = [(PKPeerPaymentWebService *)self->_sharedPeerPaymentWebService needsRegistration];
  account = self->_account;
  unsigned int v5 = ![(PDPeerPaymentWebServiceCoordinator *)self _peerPaymentPassExists];
  if (!account) {
    LOBYTE(v5) = 1;
  }
  if (v3) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)_queue_addAccountFetchRequest:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  p_super = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Peer Payment account fetch request incoming. %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_accountFetchRequests;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "coalesceWithRequest:", v4, (void)v12))
        {
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            BOOL v17 = v4;
            __int16 v18 = 2112;
            unsigned __int8 v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Peer Payment account fetch request coalesced %@ onto existing request %@", buf, 0x16u);
          }

          p_super = &v4->super.super;
          goto LABEL_18;
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    [(NSMutableArray *)self->_accountFetchRequests addObject:v4];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Peer Payment account fetch request queued %@", buf, 0xCu);
    }
    id v6 = v4;
LABEL_18:
  }
}

- (void)_queue_executeNextAccountFetchRequestIfPossible
{
  if (!self->_currentAccountFetchRequest)
  {
    unsigned __int8 v3 = [(NSMutableArray *)self->_accountFetchRequests firstObject];
    currentAccountFetchRequest = self->_currentAccountFetchRequest;
    self->_currentAccountFetchRequest = v3;

    if (self->_currentAccountFetchRequest)
    {
      [(NSMutableArray *)self->_accountFetchRequests removeObjectAtIndex:0];
      unsigned int v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = self->_currentAccountFetchRequest;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment account fetch request starting %@", (uint8_t *)&buf, 0xCu);
      }

      sharedPeerPaymentWebService = self->_sharedPeerPaymentWebService;
      id v8 = [(PDPeerPaymentWebServiceAccountFetch *)self->_currentAccountFetchRequest diagnosticReasonString];
      [(PKPeerPaymentWebService *)sharedPeerPaymentWebService addDiagnosticReason:v8];

      uint64_t v9 = [(PKPeerPaymentAccount *)self->_account identifier];
      id v10 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10047A420;
      v19[3] = &unk_100730730;
      v19[4] = self;
      id v11 = v9;
      id v20 = v11;
      p_long long buf = &buf;
      [v10 addOperation:v19];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10047AD70;
      v16[3] = &unk_100730730;
      v16[4] = self;
      id v12 = v11;
      id v17 = v12;
      __int16 v18 = &buf;
      [v10 addOperation:v16];
      kdebug_trace();
      long long v13 = +[NSNull null];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10047B860;
      v15[3] = &unk_1007405D8;
      v15[4] = self;
      void v15[5] = &buf;
      id v14 = [v10 evaluateWithInput:v13 completion:v15];

      _Block_object_dispose(&buf, 8);
    }
  }
}

- (void)_postGraduationNotificationIfNecessary
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(PKPeerPaymentAccount *)self->_account associatedAccountInformation];
  unsigned int v5 = [v4 associatedAccountRemovalRecords];

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v10 hasPresentedNotification] & 1) == 0
          && [v10 reason] == (id)1)
        {
          id v11 = [v10 date];
          if (v11)
          {
            id v12 = +[NSDate date];
            [v12 timeIntervalSinceDate:v11];
            double v14 = v13;

            if (v14 <= 259200.0) {
              [v3 addObject:v10];
            }
          }
          else
          {
            long long v15 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              char v24 = v10;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "There is no removal date set on the removal record %@", buf, 0xCu);
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    familyCircleManager = self->_familyCircleManager;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10047BCDC;
    v17[3] = &unk_100745D18;
    v17[4] = self;
    id v18 = v3;
    [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:1 completion:v17];
  }
}

- (void)_postAssociatedAccountActiveNotificationIfNecessaryForNewAssociatedAccountInformation:(id)a3 oldAssociatedAccountInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  id v9 = objc_alloc_init((Class)NSMutableSet);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = [v6 associatedAccounts];
  id v11 = [v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v50;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (([v15 hasDisplayedAssociatedAccountActiveNotification] & 1) == 0)
        {
          int64_t v16 = [v15 altDSID];
          [v9 addObject:v16];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v12);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v17 = [v7 associatedAccountInvitations];
  id v18 = [v17 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v46;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
        if ([v22 status] == (id)1)
        {
          uint64_t v23 = [v22 altDSID];
          [v8 addObject:v23];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v19);
  }

  id v24 = [v8 mutableCopy];
  [v24 intersectSet:v9];
  if ([v9 count])
  {
    id v37 = v7;
    id v38 = v6;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v25 = v9;
    id v26 = [v25 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v42;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * (void)k);
          BOOL v31 = [(PKPeerPaymentAccount *)self->_account associatedAccountInformation];
          [v31 markAssociatedAccountActiveWithAltDSID:v30 hasPresentedNotification:1];
        }
        id v27 = [v25 countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v27);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v33 = [WeakRetained insertOrUpdatePeerPaymentAccount:self->_account];
    account = self->_account;
    self->_account = v33;

    id v7 = v37;
    id v6 = v38;
  }
  if (objc_msgSend(v24, "count", v37, v38))
  {
    id v35 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v54 = v24;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "There are new associated accounts that just became active for altDSIDs %@", buf, 0xCu);
    }

    familyCircleManager = self->_familyCircleManager;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10047C7AC;
    v39[3] = &unk_100745D18;
    v39[4] = self;
    id v40 = v24;
    [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:0 completion:v39];
  }
}

- (void)_postAccountChangedNotification
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posting PDPeerPaymentServiceAccountChangedDistributedNotification", v4, 2u);
  }

  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 postNotificationName:PDPeerPaymentServiceAccountChangedDistributedNotification object:0 userInfo:0 deliverImmediately:0];
}

- (void)_updateAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10047CEE4;
  block[3] = &unk_1007315D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)_updatePreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10047D0A4;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)_writePreferences:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7 && !v8)
  {
    objc_storeStrong((id *)&self->_preferences, a3);
    [(PKPeerPaymentPreferences *)self->_preferences setDirty:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v11 = [WeakRetained insertOrUpdatePeerPaymentPreferences:v7];

    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received an updated preferences %@.", (uint8_t *)&v16, 0xCu);
    }

    id v13 = +[NSDistributedNotificationCenter defaultCenter];
    [v13 postNotificationName:PDPeerPaymentServicePreferencesChangedDistributedNotification object:0 userInfo:0 deliverImmediately:0];
    goto LABEL_10;
  }
  double v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error: Failed to fetch an updated peer payment preferences with error: %@.", (uint8_t *)&v16, 0xCu);
  }

  if (self->_account)
  {
    [(PKPeerPaymentPreferences *)self->_preferences setDirty:1];
    id v13 = objc_loadWeakRetained((id *)&self->_dataSource);
    id v15 = [v13 insertOrUpdatePeerPaymentPreferences:self->_preferences];
LABEL_10:
  }
}

- (void)_completeUpdatingPreferences
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedPeerPaymentWebServiceQueue);
  self->_isFetchingPreferences = 0;
  id v3 = [(NSMutableArray *)self->_pendingPreferencesFetches copy];
  [(NSMutableArray *)self->_pendingPreferencesFetches removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "completionHandler", (void)v11);
        id v10 = (void *)v9;
        if (v9) {
          (*(void (**)(uint64_t, PKPeerPaymentPreferences *))(v9 + 16))(v9, self->_preferences);
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  if ([(NSMutableArray *)self->_queuedPendingPreferencesFetches count])
  {
    [(NSMutableArray *)self->_pendingPreferencesFetches addObjectsFromArray:self->_queuedPendingPreferencesFetches];
    [(NSMutableArray *)self->_queuedPendingPreferencesFetches removeAllObjects];
    [(PDPeerPaymentWebServiceCoordinator *)self _updatePreferencesWithCompletion:0];
  }
  kdebug_trace();
}

- (void)_handleUpdatedAccount:(id)a3 withOldAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 stage] != (id)1
    || (id v8 = [v6 pendingPaymentCount], (uint64_t)v8 < (uint64_t)objc_msgSend(v7, "pendingPaymentCount")))
  {
    PKSharedCacheSetObjectForKey();
  }
  if (v7)
  {
    uint64_t v9 = [v7 associatedAccountInformation];
    if (v9) {
      [v6 setAssociatedAccountInformation:v9];
    }
  }
  else
  {
    [v6 setAssociatedAccountInformation:0];
  }
  if ([v6 role] == (id)1)
  {
    id v10 = [v7 sendRestrictionType];
    if (v10 != [v6 sendRestrictionType])
    {
      long long v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Purging recipient cache since the person to person restriction type has changed.", buf, 2u);
      }

      long long v12 = +[PKPeerPaymentRecipientCache sharedCache];
      unsigned __int8 v13 = [v12 purgeCache];

      if ((v13 & 1) == 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to purge the peer payment recipient cache.", buf, 2u);
        }
      }
    }
  }
  [(PDPeerPaymentWebServiceCoordinator *)self _updatePushTopics];
  if ((char *)[v6 state] - 3 <= (char *)1)
  {
    id v14 = [v7 state];
    if (v14 != [v6 state]) {
      [(PDPeerPaymentWebServiceCoordinator *)self _cancelPendingTransactionNotifications];
    }
  }
  unsigned int v15 = [v6 hasRecurringPayments];
  if (v15 != [v7 hasRecurringPayments]) {
    [(PDPeerPaymentWebServiceCoordinator *)self updateRecurringPaymentsWithCompletion:0];
  }
  [(PDPeerPaymentWebServiceCoordinator *)self _updateEncryptionCertificatesIfNeededWithAccount:v6];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10047D994;
  v18[3] = &unk_100753B98;
  v18[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  [(PDPeerPaymentWebServiceCoordinator *)self _accessObserversWithHandler:v18];
}

- (void)_archiveSharedPeerPaymentWebServiceContext
{
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10047DA6C;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(sharedPeerPaymentWebServiceQueue, block);
}

- (void)_initalizeCloudStoreIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  sharedPeerPaymentWebServiceQueue = self->_sharedPeerPaymentWebServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10047DBAC;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sharedPeerPaymentWebServiceQueue, v7);
}

- (void)_updateSharedCacheWithWebService:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    unsigned __int8 v5 = [v4 needsRegistration];
    PKSharedCacheSetBoolForKey();
    if ((v5 & 1) == 0)
    {
      PKPeerPaymentSetMessagesExtensionIsVisible();
      goto LABEL_6;
    }
  }
  else
  {
    PKSharedCacheSetBoolForKey();
  }
  PKUserHasDisabledPeerPayment();
  PKPeerPaymentSetMessagesExtensionIsVisible();
  [(PDPeerPaymentWebServiceCoordinator *)self _updateSharedCacheWithAccount:0];
LABEL_6:
}

- (void)updateSharedCache
{
}

- (void)_updateSharedCacheWithAccount:(id)a3
{
  id v14 = a3;
  if (v14)
  {
    [(PDPeerPaymentWebServiceCoordinator *)self _hasAssociatedPeerPaymentPassSetup];
    PKSharedCacheSetBoolForKey();
    id v4 = [v14 associatedAccountInformation];
    unsigned __int8 v5 = [v4 associatedAccounts];
    [v5 count];
    PKSharedCacheSetBoolForKey();

    [v14 supportsSendToUser];
  }
  else
  {
    PKSharedCacheSetBoolForKey();
    PKSharedCacheSetBoolForKey();
  }
  PKSharedCacheSetBoolForKey();
  id v6 = [v14 currentBalance];
  id v7 = [v6 currency];
  PKSharedCacheSetObjectForKey();

  id v8 = [v14 sendToUserFeatureDescriptor];
  uint64_t v9 = [v8 minimumAmount];
  id v10 = [v9 stringValue];
  PKSharedCacheSetObjectForKey();

  long long v11 = [v14 sendToUserFeatureDescriptor];
  long long v12 = [v11 maximumAmount];
  unsigned __int8 v13 = [v12 stringValue];
  PKSharedCacheSetObjectForKey();
}

- (unint64_t)_peerPaymentErrorStateForRegistrationResponse:(id)a3 error:(id)a4 expectsPass:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = v6;
  account = self->_account;
  unsigned int v9 = [(PDPeerPaymentWebServiceCoordinator *)self _peerPaymentPassExists];
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v7) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    if (account) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    int v18 = 138544130;
    CFStringRef v19 = v12;
    if (v9) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    __int16 v20 = 2114;
    CFStringRef v21 = v13;
    __int16 v22 = 2114;
    CFStringRef v23 = v14;
    if (v5) {
      CFStringRef v11 = @"YES";
    }
    __int16 v24 = 2114;
    CFStringRef v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registered for peer payment with success: %{public}@, account exists: %{public}@, pass exists: %{public}@, expects pass: %{public}@", (uint8_t *)&v18, 0x2Au);
  }
  uint64_t v15 = 3;
  if (v9) {
    uint64_t v15 = 4;
  }
  if (!v5) {
    uint64_t v15 = 4;
  }
  if (!account) {
    uint64_t v15 = 2;
  }
  if (v7) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = 1;
  }

  return v16;
}

- (id)_mockAccountInitialState
{
  id v2 = objc_alloc_init((Class)PKPeerPaymentAccount);
  [v2 setCountryCode:@"US"];
  [v2 setState:1];
  CFStringRef v39 = v2;
  [v2 setStage:3];
  id v3 = +[NSDecimalNumber decimalNumberWithString:@"200.00"];
  id v4 = PKCurrencyAmountCreate(v3, @"USD", 0);
  [v2 setCurrentBalance:v4];

  id v5 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v5 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierLoadFromCard];
  BOOL v6 = +[NSDecimalNumber decimalNumberWithString:@"10.00"];
  [v5 setMinimumAmount:v6];

  int v7 = +[NSDecimalNumber decimalNumberWithString:@"10000.00"];
  [v5 setMaximumAmount:v7];

  [v5 setMerchantIdentifier:@"com.apple.test"];
  long long v42 = v5;
  [v5 setMerchantCapabilities:11];
  v46[0] = PKPaymentNetworkVisa;
  v46[1] = PKPaymentNetworkMasterCard;
  id v8 = +[NSArray arrayWithObjects:v46 count:2];
  [v5 setSupportedNetworks:v8];

  id v9 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v9 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierTransferToBank];
  id v10 = +[NSDecimalNumber decimalNumberWithString:@"1.00"];
  long long v41 = v9;
  [v9 setMinimumAmount:v10];

  CFStringRef v11 = +[NSDecimalNumber decimalNumberWithString:@"10000.00"];
  [v9 setMaximumAmount:v11];

  id v12 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v12 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierInstantWithdrawal];
  CFStringRef v13 = +[NSDecimalNumber decimalNumberWithString:@"1.00"];
  [v12 setMinimumAmount:v13];

  CFStringRef v14 = +[NSDecimalNumber decimalNumberWithString:@"10000.00"];
  [v12 setMaximumAmount:v14];

  [v12 setMerchantIdentifier:@"com.apple.test"];
  id v40 = v12;
  [v12 setMerchantCapabilities:3];
  PKPaymentNetwork v45 = PKPaymentNetworkVisa;
  uint64_t v15 = +[NSArray arrayWithObjects:&v45 count:1];
  [v12 setSupportedNetworks:v15];

  id v16 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v16 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierSendToUser];
  id v17 = +[NSDecimalNumber decimalNumberWithString:@"1.00"];
  [v16 setMinimumAmount:v17];

  int v18 = +[NSDecimalNumber decimalNumberWithString:@"10000.00"];
  [v16 setMaximumAmount:v18];

  [v16 setMerchantIdentifier:@"com.apple.test"];
  [v16 setMerchantCapabilities:3];
  v44[0] = PKPaymentNetworkVisa;
  v44[1] = PKPaymentNetworkMasterCard;
  v44[2] = PKPaymentNetworkAmex;
  v44[3] = PKPaymentNetworkDiscover;
  CFStringRef v19 = +[NSArray arrayWithObjects:v44 count:4];
  [v16 setSupportedNetworks:v19];

  id v20 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v20 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierRequestFromUser];
  CFStringRef v21 = +[NSDecimalNumber decimalNumberWithString:@"1.00"];
  [v20 setMinimumAmount:v21];

  __int16 v22 = +[NSDecimalNumber decimalNumberWithString:@"10000.00"];
  id v38 = v20;
  [v20 setMaximumAmount:v22];

  id v23 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v23 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierCardBalancePromotion];
  __int16 v24 = +[NSDecimalNumber decimalNumberWithString:@"10.00"];
  [v23 setMinimumAmount:v24];

  CFStringRef v25 = +[NSDecimalNumber decimalNumberWithString:@"20000.00"];
  [v23 setMaximumAmount:v25];

  id v26 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v26 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierRecurringPayments];
  id v27 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v27 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierThresholdTopUp];
  v43[0] = v5;
  v43[1] = v41;
  v43[2] = v40;
  v43[3] = v16;
  v43[4] = v20;
  void v43[5] = v23;
  v43[6] = v26;
  v43[7] = v27;
  uint64_t v28 = v26;
  long long v29 = +[NSArray arrayWithObjects:v43 count:8];
  id v30 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  [v30 setIdentifier:PKPeerPaymentAccountFeatureDescriptorIdentifierDeviceTap];
  id v31 = [v29 arrayByAddingObject:v30];
  id v32 = objc_alloc_init((Class)PKPeerPaymentPaymentModeIdentifiers);
  [v32 setDeviceTap:@"12345678"];
  [v39 setPaymentModeIdentifiers:v32];
  id v33 = objc_alloc_init((Class)PKPeerPaymentEncryptionCertificatesVersions);
  [v33 setRecipientData:1];
  [v39 setEncryptionCertificatesVersions:v33];
  id v34 = +[NSSet setWithArray:v29];
  [v39 setSupportedFeatureDescriptors:v34];

  id v35 = PKMockPeerPaymentPassSerialNumber();
  [v39 setAssociatedPassSerialNumber:v35];

  BOOL v36 = PKMockPeerPaymentPassPassTypeID();
  [v39 setAssociatedPassTypeIdentifier:v36];

  return v39;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10047E718;
    v8[3] = &unk_10072FDC8;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator
{
  return self->_cloudStoreNotificationCoordinator;
}

- (void)setCloudStoreNotificationCoordinator:(id)a3
{
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationCoordinator
{
  return self->_deviceRegistrationCoordinator;
}

- (void)setDeviceRegistrationCoordinator:(id)a3
{
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_deviceRegistrationCoordinator, 0);
  objc_storeStrong((id *)&self->_cloudStoreNotificationCoordinator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentAccountFetchRequest, 0);
  objc_storeStrong((id *)&self->_accountFetchRequests, 0);
  objc_storeStrong((id *)&self->_additionalPushNotificationTopics, 0);
  objc_storeStrong((id *)&self->_peerPaymentPushNotificationTopics, 0);
  objc_storeStrong((id *)&self->_tapToRadarDelegate, 0);
  objc_storeStrong((id *)&self->_queuedPendingPreferencesFetches, 0);
  objc_storeStrong((id *)&self->_pendingPreferencesFetches, 0);
  objc_destroyWeak((id *)&self->_passStore);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_mockAccount, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_sharedPeerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_sharedPeerPaymentWebServiceQueue, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_sharingIDSManager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
}

@end