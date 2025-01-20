@interface NPKRemoteAdminConnectionServiceAgent
- (BOOL)shouldStartConsistencyCheck;
- (BOOL)synchronizeWithTSM;
- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase;
- (NPKPaymentWebServiceCompanionTargetDevice)targetDevice;
- (NPKRemoteAdminConnectionServiceAgent)initWithCompanionPaymentPassDatabase:(id)a3;
- (NPKRemoteAdminConnectionServiceAgentDelegate)delegate;
- (NPSDomainAccessor)domainAccessor;
- (NSArray)secureElementApplets;
- (NSArray)secureElementIDs;
- (NSHashTable)verificationForegroundObservers;
- (OS_dispatch_queue)secureElementAppletsQueue;
- (PKAccountProvisioningController)accountProvisioningController;
- (PKPaymentVerificationObserver)verificationObserver;
- (PKPaymentWebService)webService;
- (id)accountPassProvisionCompletion;
- (id)paymentApplications;
- (id)paymentPasses;
- (id)sharedPaymentWebServiceContext;
- (int)lockStateToken;
- (void)_checkCompanionMigrationReregistrationState;
- (void)_handleCompanionPaymentPassDatabaseChanged:(id)a3;
- (void)_handleKeybagStatusChanged;
- (void)_handleMigrationReregisterTask;
- (void)_handleUpdatedTransitAppletState:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_savePaymentWebServiceBackgroundContext;
- (void)_savePaymentWebServiceContext;
- (void)_scheduleConsistencyCheck:(id)a3 pluggedIn:(BOOL)a4 backoffLevel:(id)a5;
- (void)_scheduleMigrationReregisterForDate:(id)a3;
- (void)_setupBackgroundWebServiceWithCompletion:(id)a3;
- (void)_unregisterWebServiceWithDiagnosticReason:(id)a3 completion:(id)a4;
- (void)_updatePassWithTypeIdentifier:(id)a3;
- (void)accountProvisioningController:(id)a3 displayableError:(id)a4;
- (void)accountProvisioningControllerUpdatedState:(id)a3;
- (void)archiveWebServiceBackgroundContext:(id)a3;
- (void)archiveWebServiceContext:(id)a3;
- (void)balanceReminderForBalance:(id)a3 pass:(id)a4 completion:(id)a5;
- (void)checkCompanionPeerPaymentRegistrationState;
- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)connect;
- (void)dealloc;
- (void)deleteCardsWithAIDs:(id)a3 completion:(id)a4;
- (void)deprovisionPass:(id)a3;
- (void)deviceStateWithCompletion:(id)a3;
- (void)didDownloadPaymentPass:(id)a3;
- (void)dumpRemoteLogsWithCompletion:(id)a3;
- (void)handleAppletState:(id)a3 forUniqueID:(id)a4;
- (void)handleBalanceReminderUpdate:(id)a3 balance:(id)a4 forUniqueID:(id)a5;
- (void)handleBalanceUpdate:(id)a3 forUniqueID:(id)a4;
- (void)handleCompanionMigration;
- (void)handleCompanionPeerPaymentRegistration;
- (void)handleCredentialsUpdate:(id)a3 forUniqueID:(id)a4 completion:(id)a5;
- (void)handleDeletePaymentTransactionWithIdentifier:(id)a3 passUniqueIdentifier:(id)a4;
- (void)handleDeletionForPaymentPass:(id)a3 uniqueID:(id)a4 completion:(id)a5;
- (void)handleDownloadAllPaymentPasses;
- (void)handleGizmoAddedPaymentPass:(id)a3;
- (void)handlePaymentTransactions:(id)a3 appletStates:(id)a4 forUniqueIDs:(id)a5;
- (void)handlePaymentWebServiceContextFromWatch:(id)a3;
- (void)handlePendingUnpairingWithCompletion:(id)a3;
- (void)handlePendingiCloudSignoutWithCompletion:(id)a3;
- (void)handlePreconditionNotMetWithUniqueIDs:(id)a3 preconditionDescription:(id)a4 shouldUnregister:(BOOL)a5;
- (void)handlePreferredAID:(id)a3 forPassWithUniqueID:(id)a4;
- (void)handlePreferredAID:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5;
- (void)handlePushToken:(id)a3;
- (void)handleRemoveTransactionsWithIdentifiers:(id)a3;
- (void)handleRequestedActions:(id)a3 completion:(id)a4;
- (void)handleUpdatePaymentPassWithTypeIdentifier:(id)a3;
- (void)handleUpdatedPeerPaymentWebServiceContext:(id)a3 account:(id)a4;
- (void)handleUpdatedSharedPaymentWebServiceContext:(id)a3;
- (void)initiateConsistencyCheckWithCompletion:(id)a3;
- (void)markAllAppletsForDeletionWithCompletion:(id)a3;
- (void)noteForegroundVerificationObserverActive:(BOOL)a3;
- (void)noteForegroundVerificationObserverActive:(BOOL)a3 withObserver:(id)a4;
- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4;
- (void)paymentWebService:(id)a3 didDownloadPassRemoteAssets:(id)a4 completion:(id)a5;
- (void)paymentWebService:(id)a3 didDownloadSerialNumbersForInstalledPasses:(id)a4 inRegion:(id)a5;
- (void)paymentWebService:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6;
- (void)paymentWebService:(id)a3 willCreateSessionWithConfiguration:(id)a4;
- (void)paymentWebServiceBackgroundSessionDidBecomeInvalid:(id)a3;
- (void)performConsistencyCheckWithCompletion:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)provisionPassForAccountIdentifier:(id)a3 makeDefault:(BOOL)a4 completion:(id)a5;
- (void)provisionPassForRemoteCredentialWithType:(int64_t)a3 andIdentifier:(id)a4 completion:(id)a5;
- (void)redownloadAllPaymentPassesWithCompletion:(id)a3;
- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)remoteAdminAvailabilityRequest:(id)a3;
- (void)remoteAdminPerformRequest:(id)a3;
- (void)requestAutomaticProvisioningForCompanionPaymentPass:(id)a3;
- (void)retrieveTransactionsForPassWithUniqueID:(id)a3;
- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)sendPaymentOptionsDefaultsToWatch;
- (void)sendWebServiceContextToWatch;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setAccountPassProvisionCompletion:(id)a3;
- (void)setAccountProvisioningController:(id)a3;
- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setCompanionPaymentPassDatabase:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setLockStateToken:(int)a3;
- (void)setNewAuthRandom:(id)a3;
- (void)setSecureElementApplets:(id)a3;
- (void)setSecureElementAppletsQueue:(id)a3;
- (void)setSecureElementIDs:(id)a3;
- (void)setTargetDevice:(id)a3;
- (void)setVerificationForegroundObservers:(id)a3;
- (void)setVerificationObserver:(id)a3;
- (void)setWebService:(id)a3;
- (void)showPaymentSetupForAppDisplayName:(id)a3;
- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)updateRegionSupportIfNecessary;
- (void)verificationObserver:(id)a3 didObserveVerificationCode:(id)a4;
- (void)verificationObserverDidTimeout:(id)a3;
@end

@implementation NPKRemoteAdminConnectionServiceAgent

- (NPKRemoteAdminConnectionServiceAgent)initWithCompanionPaymentPassDatabase:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NPKRemoteAdminConnectionServiceAgent;
  v5 = [(NPKRemoteAdminConnectionServiceAgent *)&v39 init];
  if (v5)
  {
    if (!v4)
    {
      v6 = pk_General_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        v8 = pk_General_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v41 = "-[NPKRemoteAdminConnectionServiceAgent initWithCompanionPaymentPassDatabase:]";
          __int16 v42 = 2082;
          v43 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook/NPKCompanionAgent/NPKRemoteAdminConnectionServiceAgent.m";
          __int16 v44 = 2048;
          uint64_t v45 = 102;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil companion payment pass DB passed to -[NPKRemoteAdminConnectionServiceAgent initWithCompanionPaymentPassDatabase])", buf, 0x20u);
        }
      }
      _NPKAssertAbort();
    }
    [(NPKRemoteAdminConnectionServiceAgent *)v5 setCompanionPaymentPassDatabase:v4];
    id v9 = [objc_alloc((Class)NPKPaymentWebServiceCompanionTargetDevice) initWithContext:1 responseQueue:&_dispatch_main_q];
    [v9 setDelegate:v5];
    v10 = NPKPaymentWebServiceContextPath();
    v11 = +[PKPaymentWebServiceContext contextWithArchive:v10];

    v12 = NPKPairedDeviceSecureElementIdentifiers();
    char v13 = NPKValidatePaymentWebServiceContextAgainstWatchSEIDs();

    if ((v13 & 1) == 0)
    {
      v14 = pk_Payment_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        v16 = pk_Payment_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v11;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: Not loading invalid web service context (%@); starting fresh instead",
            buf,
            0xCu);
        }
      }
      v17 = (char *)objc_alloc_init((Class)PKPaymentWebServiceContext);

      v11 = v17;
    }
    id v18 = [objc_alloc((Class)PKPaymentWebService) initWithContext:v11 targetDevice:v9 archiver:v9];
    [(NPKRemoteAdminConnectionServiceAgent *)v5 setWebService:v18];
    [(NPKRemoteAdminConnectionServiceAgent *)v5 setTargetDevice:v9];
    v19 = [(NPKRemoteAdminConnectionServiceAgent *)v5 companionPaymentPassDatabase];
    v20 = [v19 uniqueIDs];
    BOOL v21 = [v20 count] == 0;

    if (!v21) {
      [(NPKRemoteAdminConnectionServiceAgent *)v5 _setupBackgroundWebServiceWithCompletion:0];
    }
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v5 selector:"_handleCompanionPaymentPassDatabaseChanged:" name:@"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.Changed" object:v4];

    [(NPKRemoteAdminConnectionServiceAgent *)v5 connect];
    dispatch_queue_t v23 = dispatch_queue_create("SecureElementAppletsQueue", 0);
    secureElementAppletsQueue = v5->_secureElementAppletsQueue;
    v5->_secureElementAppletsQueue = (OS_dispatch_queue *)v23;

    v25 = [(NPKRemoteAdminConnectionServiceAgent *)v5 companionPaymentPassDatabase];
    v26 = [v25 uniqueIDs];
    if ([v26 count])
    {
      char v27 = PDScheduledActivityExists();

      if (v27)
      {
LABEL_25:
        id v31 = objc_alloc((Class)NPSDomainAccessor);
        v32 = (NPSDomainAccessor *)[v31 initWithDomain:NPKDefaultsDomain];
        domainAccessor = v5->_domainAccessor;
        v5->_domainAccessor = v32;

        v5->_lockStateToken = -1;
        objc_initWeak((id *)buf, v5);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10002F6F0;
        handler[3] = &unk_10006D208;
        objc_copyWeak(&v38, (id *)buf);
        notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v5->_lockStateToken, (dispatch_queue_t)&_dispatch_main_q, handler);

        [(NPKRemoteAdminConnectionServiceAgent *)v5 _checkCompanionMigrationReregistrationState];
        uint64_t v34 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
        verificationForegroundObservers = v5->_verificationForegroundObservers;
        v5->_verificationForegroundObservers = (NSHashTable *)v34;

        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);

        goto LABEL_26;
      }
      v25 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
      v28 = pk_Payment_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        v30 = pk_Payment_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = (const char *)v25;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Warning: No consistency check background task; scheduling one for %@",
            buf,
            0xCu);
        }
      }
      [(NPKRemoteAdminConnectionServiceAgent *)v5 scheduleConsistencyCheck:v25 pluggedIn:0 backoffLevel:&off_10006FE58];
    }
    else
    {
    }
    goto LABEL_25;
  }
LABEL_26:

  return v5;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_lockStateToken))
  {
    notify_cancel(self->_lockStateToken);
    self->_lockStateToken = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)NPKRemoteAdminConnectionServiceAgent;
  [(NPKRemoteAdminConnectionServiceAgent *)&v3 dealloc];
}

- (void)remoteAdminPerformRequest:(id)a3
{
  objc_super v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: No longer implemented!", v6, 2u);
    }
  }
}

- (void)remoteAdminAvailabilityRequest:(id)a3
{
  objc_super v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: No longer implemented!", v6, 2u);
    }
  }
}

- (void)handlePreconditionNotMetWithUniqueIDs:(id)a3 preconditionDescription:(id)a4 shouldUnregister:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(NPKRemoteAdminConnectionServiceAgent *)self companionPaymentPassDatabase];
  v11 = [v10 uniqueIDs];

  v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      BOOL v29 = v11;
      __int16 v30 = 1024;
      BOOL v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Precondition (%@) not met with unique IDs: %@ (current %@, should unregister %d)", buf, 0x26u);
    }
  }
  id v15 = [v11 mutableCopy];
  v16 = +[NSSet setWithArray:v8];
  [v15 minusSet:v16];

  if (![v15 count])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002FAFC;
    v21[3] = &unk_10006E1F0;
    v17 = dispatch_group_create();
    v22 = v17;
    dispatch_queue_t v23 = self;
    [v8 enumerateObjectsUsingBlock:v21];
    if (v5)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10002FBC8;
      v18[3] = &unk_10006CE50;
      id v19 = v9;
      v20 = self;
      dispatch_group_notify(v17, (dispatch_queue_t)&_dispatch_main_q, v18);
    }
  }
}

- (void)handlePaymentTransactions:(id)a3 appletStates:(id)a4 forUniqueIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002FE1C;
  v21[3] = &unk_10006E218;
  void v21[4] = self;
  [v9 enumerateKeysAndObjectsUsingBlock:v21];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10002FE28;
  v19[4] = sub_10002FE38;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_10002FE28;
  v17[4] = sub_10002FE38;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002FE40;
  v12[3] = &unk_10006E240;
  id v11 = v10;
  id v15 = v19;
  v16 = v17;
  id v13 = v11;
  v14 = self;
  [v8 enumerateObjectsUsingBlock:v12];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (void)handleAppletState:(id)a3 forUniqueID:(id)a4
{
  if (a4) {
    -[NPKRemoteAdminConnectionServiceAgent _handleUpdatedTransitAppletState:forPassWithUniqueID:](self, "_handleUpdatedTransitAppletState:forPassWithUniqueID:", a3);
  }
}

- (void)handleRemoveTransactionsWithIdentifiers:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NPKGizmoDatabase sharedDatabase];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeTransactionWithIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleUpdatedTransitAppletState:(id)a3 forPassWithUniqueID:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self delegate];
    [v8 paymentPassWithUniqueIdentifier:v6 didUpdateWithTransitAppletState:v7];
  }
}

- (void)handleBalanceUpdate:(id)a3 forUniqueID:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self delegate];
    [v8 paymentPassWithUniqueIdentifier:v6 didUpdateWithBalances:v7];
  }
}

- (void)handleBalanceReminderUpdate:(id)a3 balance:(id)a4 forUniqueID:(id)a5
{
  if (a5)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = [(NPKRemoteAdminConnectionServiceAgent *)self delegate];
    [v11 paymentPassWithUniqueIdentifier:v8 didUpdateBalanceReminder:v10 forBalance:v9];
  }
}

- (void)handleCredentialsUpdate:(id)a3 forUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (v9
    && ([(NPKRemoteAdminConnectionServiceAgent *)self delegate],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    long long v12 = [(NPKRemoteAdminConnectionServiceAgent *)self delegate];
    [v12 paymentPassWithUniqueIdentifier:v9 didUpdateWithCredentials:v8 completion:v10];
  }
  else if (v10)
  {
    long long v13 = [(NPKRemoteAdminConnectionServiceAgent *)self delegate];

    if (!v13)
    {
      v14 = pk_General_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        v16 = pk_General_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315138;
          id v18 = "-[NPKRemoteAdminConnectionServiceAgent handleCredentialsUpdate:forUniqueID:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: cannot handle credentials update due to nil delegate in %s", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    v10[2](v10, 0);
  }
}

- (void)handlePushToken:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
      id v9 = [v8 context];
      id v10 = [v9 pushToken];
      *(_DWORD *)buf = 138412546;
      id v29 = v4;
      __int16 v30 = 2112;
      BOOL v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handle push token: %@ (current %@)", buf, 0x16u);
    }
  }
  if (v4)
  {
    id v11 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
    long long v12 = [v11 context];
    long long v13 = [v12 pushToken];
    unsigned __int8 v14 = [v13 isEqualToString:v4];

    if ((v14 & 1) == 0)
    {
      BOOL v15 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
      v16 = [v15 context];
      [v16 setPushToken:v4];

      int v17 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
      id v18 = [v17 context];
      id v19 = [v18 registrationDate];

      if (v19)
      {
        id v20 = pk_Payment_log();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

        if (v21)
        {
          v22 = pk_Payment_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v23 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
            v24 = [v23 context];
            id v25 = [v24 pushToken];
            *(_DWORD *)buf = 138412290;
            id v29 = v25;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notice: Re-registering with push token %@", buf, 0xCu);
          }
        }
        __int16 v26 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000309DC;
        v27[3] = &unk_10006E268;
        v27[4] = self;
        [v26 registerDeviceWithCompletion:v27];
      }
      else
      {
        [(NPKRemoteAdminConnectionServiceAgent *)self _savePaymentWebServiceContext];
      }
    }
  }
}

- (void)handleUpdatePaymentPassWithTypeIdentifier:(id)a3
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
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handle payment pass update with identifier: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(NPKRemoteAdminConnectionServiceAgent *)self _updatePassWithTypeIdentifier:v4];
}

- (void)handlePreferredAID:(id)a3 forPassWithUniqueID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NPKGizmoDatabase sharedDatabase];
  int v8 = [v7 passForUniqueID:v6];
  id v9 = [v8 paymentPass];

  id v10 = [v9 npkDevicePaymentApplicationForAID:v5];
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    long long v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138413058;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2048;
      id v20 = v9;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: unique ID %@ aid %@ pass %p application %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  if (v9)
  {
    unsigned __int8 v14 = +[NPKGizmoDatabase sharedDatabase];
    [v14 setPreferredPaymentApplication:v10 forPaymentPass:v9];
  }
}

- (void)archiveWebServiceContext:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Saving web service context", v7, 2u);
    }
  }
  [(NPKRemoteAdminConnectionServiceAgent *)self _savePaymentWebServiceContext];
}

- (void)archiveWebServiceBackgroundContext:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Saving web service background context", v7, 2u);
    }
  }
  [(NPKRemoteAdminConnectionServiceAgent *)self _savePaymentWebServiceBackgroundContext];
}

- (void)setNewAuthRandom:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  if (v4)
  {
    int v8 = v4;
    if (NPKProtectedDataAvailable())
    {
      BOOL v5 = [(NPKRemoteAdminConnectionServiceAgent *)self companionPaymentPassDatabase];
      id v6 = [v5 uniqueIDs];
      BOOL v7 = [v6 count] == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    v8[2](v8, v7);
    id v4 = v8;
  }
}

- (void)handlePaymentWebServiceContextFromWatch:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  if ([v5 needsRegistration])
  {

LABEL_4:
    BOOL v7 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
    [v7 setContext:v4];

    [(NPKRemoteAdminConnectionServiceAgent *)self _savePaymentWebServiceContext];
    notify_post((const char *)[NPKSharedPaymentWebServiceChangedDarwinNotification UTF8String]);
    goto LABEL_5;
  }
  id v6 = [v4 registrationDate];

  if (v6) {
    goto LABEL_4;
  }
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring web service from watch because we are already registered and it is not", v11, 2u);
    }
  }
LABEL_5:
}

- (void)sendWebServiceContextToWatch
{
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  id v3 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  id v4 = [v3 context];
  [v5 sendWebServiceContextToWatch:v4];
}

- (void)showPaymentSetupForAppDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self delegate];
  [v5 didReceivePaymentSetupRequestForApplicationName:v4];
}

- (void)sendPaymentOptionsDefaultsToWatch
{
  if (MKBGetDeviceLockState() - 1 > 1)
  {
    BOOL v7 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
    [v7 sendPaymentOptionsDefaultsToWatch];

    id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self domainAccessor];
    [v8 setBool:0 forKey:NPKNeedsPaymentOptionsDefault];
  }
  else
  {
    id v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Warning: Device is locked; not sending transaction defaults to watch",
          buf,
          2u);
      }
    }
    id v6 = [(NPKRemoteAdminConnectionServiceAgent *)self domainAccessor];
    [v6 setBool:1 forKey:NPKNeedsPaymentOptionsDefault];
  }
}

- (void)_handleKeybagStatusChanged
{
  id v3 = [(NPKRemoteAdminConnectionServiceAgent *)self domainAccessor];
  unsigned int v4 = [v3 BOOLForKey:NPKNeedsPaymentOptionsDefault];

  if (v4)
  {
    [(NPKRemoteAdminConnectionServiceAgent *)self sendPaymentOptionsDefaultsToWatch];
  }
}

- (void)handleUpdatedPeerPaymentWebServiceContext:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = NPKPeerPaymentWebServiceContextPath();
  [v6 archiveAtPath:v7];

  id v8 = NPKSecureArchiveObject();

  BOOL v9 = NPKPeerPaymentAccountPath();
  [v8 writeToFile:v9 atomically:1];

  notify_post((const char *)[NPKSharedPeerPaymentWebServiceChangedDarwinNotification UTF8String]);
  id v10 = (const char *)[NPKPeerPaymentAccountChangedDarwinNotification UTF8String];
  notify_post(v10);
}

- (void)handleDownloadAllPaymentPasses
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100031370;
  v2[3] = &unk_10006CFC0;
  v2[4] = self;
  [(NPKRemoteAdminConnectionServiceAgent *)self _setupBackgroundWebServiceWithCompletion:v2];
}

- (void)checkCompanionPeerPaymentRegistrationState
{
  id v2 = [(NPKRemoteAdminConnectionServiceAgent *)self delegate];
  [v2 didReceiveCheckCompanionPeerPaymentState];
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  verificationObserver = self->_verificationObserver;
  if (verificationObserver)
  {
    [(PKPaymentVerificationObserver *)verificationObserver setDelegate:0];
    [(PKPaymentVerificationObserver *)self->_verificationObserver stop];
  }
  id v8 = [v12 uniqueID];
  BOOL v9 = +[NSString stringWithFormat:@"%@-%@", @"passd", v8];

  id v10 = (PKPaymentVerificationObserver *)[objc_alloc((Class)PKPaymentVerificationObserver) initWithPaymentPass:v12 verificationChannel:v6 identifier:v9];
  id v11 = self->_verificationObserver;
  self->_verificationObserver = v10;

  [(PKPaymentVerificationObserver *)self->_verificationObserver setDelegate:self];
  [(PKPaymentVerificationObserver *)self->_verificationObserver startObservingVerificationSourceWithTimeout:120.0];
}

- (void)paymentWebService:(id)a3 didDownloadPass:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000315B8;
  block[3] = &unk_10006CF68;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)paymentWebService:(id)a3 didDownloadPassRemoteAssets:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000319CC;
  v11[3] = &unk_10006E2B8;
  id v12 = a3;
  id v13 = a4;
  unsigned __int8 v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)paymentWebService:(id)a3 didDownloadSerialNumbersForInstalledPasses:(id)a4 inRegion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Payment web service downloaded serial numbers for installed passes: %@ region: %@", buf, 0x16u);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100031CAC;
  v13[3] = &unk_10006CE50;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)paymentWebServiceBackgroundSessionDidBecomeInvalid:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000321D8;
  v5[3] = &unk_10006CE50;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)paymentWebService:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6
{
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Payment web service registered credential %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)paymentWebService:(id)a3 willCreateSessionWithConfiguration:(id)a4
{
  id v4 = a4;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Payment web service will create session with configuration. Configuring source application bundle identifier.", v8, 2u);
    }
  }
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", @"com.apple.Bridge");
}

- (void)_updatePassWithTypeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Update pass with type identifier %@", buf, 0xCu);
    }
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000324F0;
  v8[3] = &unk_10006CFC0;
  v8[4] = self;
  [(NPKRemoteAdminConnectionServiceAgent *)self _setupBackgroundWebServiceWithCompletion:v8];
}

- (void)_savePaymentWebServiceContext
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
      id v7 = [v6 context];
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Saving web service context %@", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v8 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  id v9 = [v8 context];
  id v10 = NPKPaymentWebServiceContextPath();
  [v9 archiveAtPath:v10];
}

- (void)_savePaymentWebServiceBackgroundContext
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
      id v7 = [v6 backgroundContext];
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Saving web service background context %@", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v8 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  id v9 = [v8 backgroundContext];
  id v10 = NPKPaymentWebServiceBackgroundContextPath();
  [v9 archiveAtPath:v10];
}

- (void)updateRegionSupportIfNecessary
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Updating region support", buf, 2u);
    }
  }
  [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000328AC;
  v7[3] = &unk_10006D488;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v8;
  +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:v6 completion:v7];
}

- (void)_unregisterWebServiceWithDiagnosticReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Unregistering and removing web service…", buf, 2u);
    }
  }
  int v11 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  id v12 = [v11 targetDevice];
  [v11 invalidateBackgroundSession];
  [v11 setArchiver:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100032C2C;
  v31[3] = &unk_10006D5E0;
  id v13 = v11;
  id v32 = v13;
  id v14 = v7;
  id v33 = v14;
  id v15 = objc_retainBlock(v31);
  if (([v13 needsRegistration] & 1) == 0)
  {
    id v16 = (void *)MGCopyAnswer();
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100032D08;
    v27[3] = &unk_10006E330;
    id v28 = v13;
    id v29 = v16;
    __int16 v30 = v15;
    id v17 = v16;
    [v28 diagnosticSessionWithReason:v6 sessionHandler:v27];
  }
  id v18 = +[NSFileManager defaultManager];
  __int16 v19 = NPKPaymentWebServiceContextPath();
  [v18 removeItemAtPath:v19 error:0];

  id v20 = +[NSFileManager defaultManager];
  __int16 v21 = NPKPaymentWebServiceBackgroundContextPath();
  [v20 removeItemAtPath:v21 error:0];

  id v22 = objc_alloc_init((Class)PKPaymentWebServiceContext);
  id v23 = [objc_alloc((Class)PKPaymentWebService) initWithContext:v22 targetDevice:v12 archiver:v12];
  [v23 configurePaymentServiceWithCompletion:&stru_10006E370];
  [(NPKRemoteAdminConnectionServiceAgent *)self setWebService:v23];
  if ([v13 needsRegistration])
  {
    v24 = pk_Payment_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      __int16 v26 = pk_Payment_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Notice: Unregister of web service not needed.", buf, 2u);
      }
    }
    ((void (*)(void *))v15[2])(v15);
  }
  notify_post((const char *)[NPKSharedPaymentWebServiceChangedDarwinNotification UTF8String]);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4 = a4;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: IDS service activate accounts changed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = pk_Payment_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    id v17 = pk_Payment_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138413314;
      id v19 = v11;
      __int16 v20 = 2112;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      __int16 v24 = 1024;
      BOOL v25 = v8;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Notice: IDS service did send with success: %@ %@ %@ %d %@", (uint8_t *)&v18, 0x30u);
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
  BOOL v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    int v18 = pk_Payment_log();
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

- (void)connect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000333B4;
  block[3] = &unk_10006CFC0;
  void block[4] = self;
  if (qword_10007ADE0 != -1) {
    dispatch_once(&qword_10007ADE0, block);
  }
  PDScheduledActivityClientRegister();
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v5 = a3;
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Handling background task: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if ([v5 isEqualToString:@"ConsistencyCheck"])
  {
    id v9 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
    [(NPKRemoteAdminConnectionServiceAgent *)self _scheduleConsistencyCheck:v9 pluggedIn:1 backoffLevel:0];

    [(NPKRemoteAdminConnectionServiceAgent *)self performConsistencyCheckWithCompletion:&stru_10006E3D8];
  }
  else if ([v5 isEqualToString:@"MigrationReregister"])
  {
    [(NPKRemoteAdminConnectionServiceAgent *)self _handleMigrationReregisterTask];
  }
}

- (void)_handleCompanionPaymentPassDatabaseChanged:(id)a3
{
  +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3, 180.0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NPKRemoteAdminConnectionServiceAgent *)self _scheduleConsistencyCheck:v4 pluggedIn:0 backoffLevel:&off_10006FE58];
}

- (void)initiateConsistencyCheckWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033730;
  v5[3] = &unk_10006DD50;
  id v6 = a3;
  id v4 = v6;
  [(NPKRemoteAdminConnectionServiceAgent *)self performConsistencyCheckWithCompletion:v5];
}

- (void)performConsistencyCheckWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Starting consistency check process", buf, 2u);
    }
  }
  BOOL v8 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033858;
  v10[3] = &unk_10006E400;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 secureElementAppletsWithCompletion:v10];
}

- (void)redownloadAllPaymentPassesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Redownloading all payment passes", buf, 2u);
    }
  }
  BOOL v8 = [(NPKRemoteAdminConnectionServiceAgent *)self companionPaymentPassDatabase];
  id v9 = [v8 outstandingDeletionStore];
  [v9 clearStore];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100033D14;
  v11[3] = &unk_10006D5E0;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(NPKRemoteAdminConnectionServiceAgent *)self _setupBackgroundWebServiceWithCompletion:v11];
}

- (void)dumpRemoteLogsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033E28;
  v7[3] = &unk_10006DD50;
  id v8 = v4;
  id v6 = v4;
  [v5 dumpLogsWithCompletion:v7];
}

- (void)deleteCardsWithAIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock(v7);
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Delete cards with AIDs: %@ completion: %@", buf, 0x16u);
    }
  }
  id v12 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000340B4;
  v14[3] = &unk_10006DD50;
  id v15 = v7;
  id v13 = v7;
  [v12 removeAIDsFromSecureElement:v6 withCompletion:v14];
}

- (void)handleDeletionForPaymentPass:(id)a3 uniqueID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v11 handlePendingRemovalOfPaymentPass:v10 uniqueID:v9 completion:v8];
}

- (void)handlePreferredAID:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v11 handlePreferredAID:v10 forPassWithUniqueID:v9 completion:v8];
}

- (void)handleCompanionMigration
{
  NPKSetCompanionMigrationNeeded();
  id v3 = +[NSDate date];
  [(NPKRemoteAdminConnectionServiceAgent *)self _scheduleMigrationReregisterForDate:v3];
}

- (void)deprovisionPass:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)PKPaymentDeprovisionRequest) initWithPaymentPass:v4];
  id v6 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003446C;
  v11[3] = &unk_10006E428;
  id v12 = v4;
  id v7 = v4;
  [v6 deprovisionForRequest:v5 completion:v11];

  id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  id v9 = [v8 context];
  id v10 = [v7 uniqueID];
  [v9 removeVerificationRequestRecordForUniqueID:v10];

  [(NPKRemoteAdminConnectionServiceAgent *)self _savePaymentWebServiceContext];
}

- (void)handlePendingUnpairingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling pending unpairing", v8, 2u);
    }
  }
  [(NPKRemoteAdminConnectionServiceAgent *)self _unregisterWebServiceWithDiagnosticReason:@"Pending unpairing" completion:v4];
}

- (void)handlePendingiCloudSignoutWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling pending iCloud signout", buf, 2u);
    }
  }
  id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v8 handleCompanioniCloudSignout];

  if (NPKPairedOrPairingDeviceIsTinker())
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v25 = "-[NPKRemoteAdminConnectionServiceAgent handlePendingiCloudSignoutWithCompletion:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Guardian companion is iCloud signing out. %s", buf, 0xCu);
      }
    }
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    dispatch_group_t v12 = dispatch_group_create();
    id v13 = [(NPKRemoteAdminConnectionServiceAgent *)self companionPaymentPassDatabase];
    id v14 = [v13 uniqueIDs];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003491C;
    v21[3] = &unk_10006D0F0;
    id v15 = v12;
    id v22 = v15;
    __int16 v23 = self;
    [v14 enumerateObjectsUsingBlock:v21];
    dispatch_group_enter(v15);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000349E8;
    v19[3] = &unk_10006CFC0;
    id v20 = v15;
    BOOL v16 = v15;
    [(NPKRemoteAdminConnectionServiceAgent *)self _unregisterWebServiceWithDiagnosticReason:@"Pending iCloud signout" completion:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000349F0;
    v17[3] = &unk_10006CDC8;
    __int16 v18 = v4;
    dispatch_group_notify(v16, (dispatch_queue_t)&_dispatch_main_q, v17);
  }
}

- (BOOL)synchronizeWithTSM
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Synchronizing with TSM", buf, 2u);
    }
  }
  dispatch_group_t v6 = dispatch_group_create();
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  __int16 v23 = buf;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  id v9 = [v8 context];
  BOOL v10 = [v9 TSMPushTopics];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100034C44;
  v18[3] = &unk_10006E478;
  id v11 = v6;
  id v19 = v11;
  id v20 = self;
  __int16 v21 = buf;
  [v10 enumerateObjectsUsingBlock:v18];

  dispatch_group_t v12 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100034E50;
  v15[3] = &unk_10006CEF0;
  dispatch_semaphore_t v16 = v7;
  id v17 = buf;
  v15[4] = self;
  id v13 = v7;
  dispatch_group_notify(v11, v12, v15);

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v7) = v23[24];

  _Block_object_dispose(buf, 8);
  return (char)v7;
}

- (void)didDownloadPaymentPass:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100035150;
  v5[3] = &unk_10006CE50;
  id v6 = a3;
  dispatch_semaphore_t v7 = self;
  id v4 = v6;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (id)paymentPasses
{
  id v2 = [(NPKRemoteAdminConnectionServiceAgent *)self companionPaymentPassDatabase];
  id v3 = [v2 uniqueIDs];
  id v4 = [v3 allObjects];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003565C;
  v11[3] = &unk_10006E4F0;
  id v12 = v2;
  id v5 = v2;
  id v6 = [v4 npkComprehension:v11];
  dispatch_semaphore_t v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      dispatch_semaphore_t v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: unique IDs: %@ paymentPasses: %@", buf, 0x16u);
    }
  }
  return v6;
}

- (void)deviceStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100035780;
    v9[3] = &unk_10006E518;
    v9[4] = self;
    BOOL v10 = v4;
    [v5 secureElementAppletsWithCompletion:v9];

    id v6 = v10;
  }
  else
  {
    dispatch_semaphore_t v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (!v8) {
      goto LABEL_4;
    }
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: No completion provided for device state, aborting.", buf, 2u);
    }
  }

LABEL_4:
}

- (BOOL)shouldStartConsistencyCheck
{
  int v2 = NPKIsPairedDeviceStandalone();
  if (v2)
  {
    id v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_semaphore_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Warning: Not performing consistency check for for standalone device", v7, 2u);
      }
    }
  }
  return v2 ^ 1;
}

- (void)handleRequestedActions:(id)a3 completion:(id)a4
{
  id v19 = self;
  id v5 = a3;
  id v21 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "actions", v19);
        id v12 = [v10 deviceCredential];
        if ([v12 type]) {
          BOOL v13 = 0;
        }
        else {
          BOOL v13 = v11 == (id)8;
        }
        if (v13)
        {
          id v17 = [v12 address];
          dispatch_semaphore_t v16 = [v17 appletIdentifier];

          [0 safelyAddObject:v16];
        }
        else
        {
          id v14 = pk_General_log();
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

          if (!v15) {
            goto LABEL_15;
          }
          dispatch_semaphore_t v16 = pk_General_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v10;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: Consistency check requested an unsupported action: %@", buf, 0xCu);
          }
        }

LABEL_15:
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }
  if (objc_msgSend(0, "count", v19))
  {
    __int16 v18 = [v20 targetDevice];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100035D50;
    v22[3] = &unk_10006DD50;
    id v23 = v21;
    [v18 removeAIDsFromSecureElement:0 withCompletion:v22];
  }
}

- (id)paymentApplications
{
  id v3 = [(NPKRemoteAdminConnectionServiceAgent *)self secureElementIDs];
  BOOL v4 = +[NSMutableArray array];
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self paymentPasses];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100036004;
  BOOL v15 = &unk_10006E540;
  id v6 = v4;
  id v16 = v6;
  id v7 = v3;
  id v17 = v7;
  [v5 enumerateObjectsUsingBlock:&v12];

  uint64_t v8 = pk_Payment_log();
  LODWORD(v5) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: SEIDs %@ payment applications %@", buf, 0x16u);
    }
  }
  id v10 = objc_msgSend(v6, "copy", v12, v13, v14, v15);

  return v10;
}

- (void)setSecureElementApplets:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self secureElementAppletsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036128;
  v7[3] = &unk_10006CE50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSArray)secureElementApplets
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10002FE28;
  id v11 = sub_10002FE38;
  id v12 = 0;
  id v3 = [(NPKRemoteAdminConnectionServiceAgent *)self secureElementAppletsQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100036288;
  v6[3] = &unk_10006CD78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v8 registerCredentialsWithIdentifiers:v7 completion:v6];
}

- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v8 revokeCredentialsWithIdentifiers:v7 completion:v6];
}

- (void)_scheduleConsistencyCheck:(id)a3 pluggedIn:(BOOL)a4 backoffLevel:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100036498;
  v10[3] = &unk_10006E590;
  id v11 = a3;
  id v12 = self;
  BOOL v14 = a4;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)retrieveTransactionsForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v5 retrieveTransactionsForPassWithUniqueID:v4];
}

- (void)handleDeletePaymentTransactionWithIdentifier:(id)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v8 handleDeletePaymentTransactionWithIdentifier:v7 passUniqueIdentifier:v6];
}

- (void)markAllAppletsForDeletionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v5 markAllAppletsForDeletionWithCompletion:v4];
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v14 setBalanceReminder:v13 forBalance:v12 pass:v11 completion:v10];
}

- (void)balanceReminderForBalance:(id)a3 pass:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v11 balanceReminderForBalance:v10 pass:v9 completion:v8];
}

- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v11 commutePlanReminderForCommutePlan:v10 pass:v9 withCompletion:v8];
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v14 setCommutePlanReminder:v13 forCommutePlan:v12 pass:v11 completion:v10];
}

- (void)verificationObserver:(id)a3 didObserveVerificationCode:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036BB0;
  block[3] = &unk_10006CF68;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)verificationObserverDidTimeout:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036F84;
  block[3] = &unk_10006CFC0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3 withObserver:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  verificationForegroundObservers = self->_verificationForegroundObservers;
  if (v4) {
    [(NSHashTable *)verificationForegroundObservers addObject:v6];
  }
  else {
    [(NSHashTable *)verificationForegroundObservers removeObject:v6];
  }
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_verificationForegroundObservers;
      v12[0] = 67109634;
      v12[1] = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: After handling active %d for observer %@, all observers is now %@", (uint8_t *)v12, 0x1Cu);
    }
  }
}

- (void)handleUpdatedSharedPaymentWebServiceContext:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handle updated shared payment web service context: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v4)
  {
    id v8 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
    [v8 setContext:v4];

    [(NPKRemoteAdminConnectionServiceAgent *)self _savePaymentWebServiceContext];
  }
}

- (id)sharedPaymentWebServiceContext
{
  int v2 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  id v3 = [v2 context];

  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Returning shared payment web service context: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return v3;
}

- (void)handleGizmoAddedPaymentPass:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  [(NPKRemoteAdminConnectionServiceAgent *)self paymentWebService:v5 didDownloadPass:v4];
}

- (void)handleCompanionPeerPaymentRegistration
{
  id v2 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v2 handleCompanionPeerPaymentRegistration];
}

- (void)_setupBackgroundWebServiceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Setting up background web service", v11, 2u);
    }
  }
  int v8 = NPKPaymentWebServiceBackgroundContextPath();
  int v9 = +[PKPaymentWebServiceBackgroundContext contextWithArchive:v8];

  id v10 = [(NPKRemoteAdminConnectionServiceAgent *)self webService];
  [v10 startBackgroundURLSessionWithIdentifier:@"com.apple.NPKCompanionAgent" context:v9 backgroundDelegate:self completion:v4];
}

- (void)_checkCompanionMigrationReregistrationState
{
  id v3 = PDScheduledActivityGetCriteria();
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      long long v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Current companion migration task criteria: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  if (NPKIsCompanionMigrationNeeded())
  {
    if (!v3)
    {
      id v17 = pk_Payment_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        id v12 = pk_Payment_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          __int16 v13 = "Warning: Companion migration needed, but no background task scheduled. Scheduling now.";
          goto LABEL_23;
        }
LABEL_24:
      }
LABEL_25:
      PDScheduledActivityRemove();
      id v21 = +[NSDate date];
      [(NPKRemoteAdminConnectionServiceAgent *)self _scheduleMigrationReregisterForDate:v21];

      goto LABEL_26;
    }
    id v7 = [v3 startDate];
    [v7 timeIntervalSinceNow];
    double v9 = v8;

    if (v9 < 0.0)
    {
      id v10 = pk_Payment_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        id v12 = pk_Payment_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          __int16 v13 = "Notice: Background task scheduled has start date in the past. Scheduling now.";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 2u);
          goto LABEL_24;
        }
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    id v19 = pk_Payment_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v9 > 86400.0)
    {
      if (v20)
      {
        id v12 = pk_Payment_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          __int16 v13 = "Notice: Background task scheduled for >1 day away. Scheduling now.";
          goto LABEL_23;
        }
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (v20)
    {
      id v22 = pk_Payment_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v3 startDate];
        int v24 = 138412290;
        long long v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notice: Background task already scheduled for %@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  else
  {
    id v14 = pk_Payment_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      id v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notice: Companion migration not needed", (uint8_t *)&v24, 2u);
      }
    }
    PDScheduledActivityRemove();
  }
LABEL_26:
}

- (void)_scheduleMigrationReregisterForDate:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003792C;
  v5[3] = &unk_10006CE50;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_handleMigrationReregisterTask
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Handling migration reregister task", buf, 2u);
    }
  }
  id v6 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037B38;
  v7[3] = &unk_10006E5E0;
  void v7[4] = self;
  [v6 handleCompanionMigrationWithCompletion:v7];
}

- (void)provisionPassForAccountIdentifier:(id)a3 makeDefault:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v6) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      CFStringRef v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) provisionPassForAccountIdentifier %@ makeDefault %@", buf, 0x16u);
    }
  }
  id v14 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100038088;
  v17[3] = &unk_10006E630;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  BOOL v21 = v6;
  id v15 = v9;
  id v16 = v8;
  [v14 updatedAccountsForProvisioningWithCompletion:v17];
}

- (void)provisionPassForRemoteCredentialWithType:(int64_t)a3 andIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      int64_t v15 = a3;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: (apple-balance-pass-provisioning) provisionPassForRemoteCredentialType %ld identifier: %@ ", (uint8_t *)&v14, 0x16u);
    }
  }
  CFStringRef v13 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v13 provisionPassForRemoteCredentialWithType:a3 andIdentifier:v8 completion:v9];
}

- (void)requestAutomaticProvisioningForCompanionPaymentPass:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKRemoteAdminConnectionServiceAgent *)self targetDevice];
  [v5 requestAutomaticProvisioningForCompanionPaymentPass:v4];
}

- (void)accountProvisioningControllerUpdatedState:(id)a3
{
  id v4 = (PKAccountProvisioningController *)a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = [(PKAccountProvisioningController *)v4 provisionLocalPassState];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) accountProvisioningControllerUpdatedState %lu", (uint8_t *)&v10, 0xCu);
    }
  }
  if (self->_accountProvisioningController == v4
    && [(PKAccountProvisioningController *)v4 provisionLocalPassState] == (id)3)
  {
    (*((void (**)(void))self->_accountPassProvisionCompletion + 2))();
    accountProvisioningController = self->_accountProvisioningController;
    self->_accountProvisioningController = 0;

    id accountPassProvisionCompletion = self->_accountPassProvisionCompletion;
    self->_id accountPassProvisionCompletion = 0;
  }
}

- (void)accountProvisioningController:(id)a3 displayableError:(id)a4
{
  BOOL v6 = (PKAccountProvisioningController *)a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    int v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      id v14 = [(PKAccountProvisioningController *)v6 provisionLocalPassState];
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) accountProvisioningController: %lu displayableError %@", (uint8_t *)&v13, 0x16u);
    }
  }
  if (self->_accountProvisioningController == v6)
  {
    (*((void (**)(void))self->_accountPassProvisionCompletion + 2))();
    accountProvisioningController = self->_accountProvisioningController;
    self->_accountProvisioningController = 0;

    id accountPassProvisionCompletion = self->_accountPassProvisionCompletion;
    self->_id accountPassProvisionCompletion = 0;
  }
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (NPKRemoteAdminConnectionServiceAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKRemoteAdminConnectionServiceAgentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPKPaymentWebServiceCompanionTargetDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
}

- (NPDCompanionPaymentPassDatabase)companionPaymentPassDatabase
{
  return (NPDCompanionPaymentPassDatabase *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompanionPaymentPassDatabase:(id)a3
{
}

- (OS_dispatch_queue)secureElementAppletsQueue
{
  return self->_secureElementAppletsQueue;
}

- (void)setSecureElementAppletsQueue:(id)a3
{
}

- (NSArray)secureElementIDs
{
  return self->_secureElementIDs;
}

- (void)setSecureElementIDs:(id)a3
{
}

- (int)lockStateToken
{
  return self->_lockStateToken;
}

- (void)setLockStateToken:(int)a3
{
  self->_lockStateToken = a3;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (PKPaymentVerificationObserver)verificationObserver
{
  return self->_verificationObserver;
}

- (void)setVerificationObserver:(id)a3
{
}

- (NSHashTable)verificationForegroundObservers
{
  return self->_verificationForegroundObservers;
}

- (void)setVerificationForegroundObservers:(id)a3
{
}

- (PKAccountProvisioningController)accountProvisioningController
{
  return self->_accountProvisioningController;
}

- (void)setAccountProvisioningController:(id)a3
{
}

- (id)accountPassProvisionCompletion
{
  return self->_accountPassProvisionCompletion;
}

- (void)setAccountPassProvisionCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountPassProvisionCompletion, 0);
  objc_storeStrong((id *)&self->_accountProvisioningController, 0);
  objc_storeStrong((id *)&self->_verificationForegroundObservers, 0);
  objc_storeStrong((id *)&self->_verificationObserver, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_secureElementIDs, 0);
  objc_storeStrong((id *)&self->_secureElementAppletsQueue, 0);
  objc_storeStrong((id *)&self->_companionPaymentPassDatabase, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_secureElementApplets, 0);
}

@end