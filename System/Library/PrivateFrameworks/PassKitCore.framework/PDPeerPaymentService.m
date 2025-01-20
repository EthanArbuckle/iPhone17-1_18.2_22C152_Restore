@interface PDPeerPaymentService
- (PDDatabaseManager)databaseManager;
- (PDPeerPaymentAccountManager)peerPaymentAccountManager;
- (PDPeerPaymentService)initWithConnection:(id)a3;
- (PDPeerPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (PDUserNotificationManager)userNotificationManager;
- (PKSharingIDSManager)idsSharingManager;
- (id)_displayNameForAddress:(id)a3;
- (void)_notifyPendingRequestsChangedObservers;
- (void)_notifyRecurringPaymentsChangedObservers;
- (void)_removeAllNotificationsForPeerPaymentPendingRequests;
- (void)_removeAllNotificationsForPeerPaymentRecurringPayments;
- (void)_removeNotificationsForPeerPaymentPendingRequestWithRequestTokens:(id)a3;
- (void)_removeNotificationsForPeerPaymentRecurringPaymentsWithIdentifiers:(id)a3;
- (void)_scheduleNotificationsForPeerPaymentPendingRequests:(id)a3;
- (void)accountWithCompletion:(id)a3;
- (void)balanceForPass:(id)a3 completion:(id)a4;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)counterpartImageDataForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)counterpartImageDataWithCompletion:(id)a3;
- (void)counterpartImageDataWithIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteAccountWithCompletion:(id)a3;
- (void)deleteAllCounterpartImageDataWithCompletion:(id)a3;
- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)deletePreferencesWithCompletion:(id)a3;
- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4;
- (void)downloadPassIfNecessaryWithCompletion:(id)a3;
- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5;
- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)hasRecurringPayments:(id)a3;
- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3;
- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6;
- (void)insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:(id)a3 amount:(id)a4 currency:(id)a5 senderName:(id)a6 completion:(id)a7;
- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 shouldScheduleNotifications:(BOOL)a4 completion:(id)a5;
- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4;
- (void)lastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3;
- (void)peerPaymentAccountManagerPendingRequestsChanged;
- (void)peerPaymentAccountManagerRecurringPaymentsChanged;
- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)peerPaymentWebServiceCoordinatorPendingRequestsChanged;
- (void)peerPaymentWebServiceCoordinatorRecurringPaymentsChanged;
- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)preferencesWithCompletion:(id)a3;
- (void)presentIdentityVerificationFlowWithResponseData:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)presentPeerPaymentTermsAndConditionsWithTermsURL:(id)a3 termsIdentifier:(id)a4 passUniqueID:(id)a5 orientation:(id)a6 completion:(id)a7;
- (void)presentReceiverFlowWithOrientation:(id)a3 host:(unint64_t)a4 completion:(id)a5;
- (void)presentRegistrationFlowWithAccount:(id)a3 amount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 orientation:(id)a7 hostSceneIdentifier:(id)a8 hostSceneBundleIdentifier:(id)a9 completion:(id)a10;
- (void)presentSenderFlowWithHost:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5;
- (void)receivedPeerPaymentMessageData:(id)a3 handler:(id)a4;
- (void)recurringPaymentsWithCompletion:(id)a3;
- (void)registerDeviceWithCompletion:(id)a3;
- (void)registerDeviceWithForceReregister:(BOOL)a3 completion:(id)a4;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6;
- (void)registrationStatusWithCompletion:(id)a3;
- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setIdsSharingManager:(id)a3;
- (void)setLastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3 handler:(id)a4;
- (void)setPeerPaymentAccountManager:(id)a3;
- (void)setPeerPaymentWebServiceCoordinator:(id)a3;
- (void)setPreferences:(id)a3 completion:(id)a4;
- (void)setUserNotificationManager:(id)a3;
- (void)unregisterDeviceWithCompletion:(id)a3;
- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAccountWithCompletion:(id)a3;
- (void)updateAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6;
- (void)updateMessageReceivedDate:(id)a3 forTransactionWithIdentifier:(id)a4 handler:(id)a5;
- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4;
- (void)updatePreferencesWithCompletion:(id)a3;
- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentsWithCompletion:(id)a3;
- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPeerPaymentWebServiceContextWithHandler:(id)a4;
- (void)usingSynchronousProxy:(BOOL)a3 setSharedPeerPaymentWebServiceContext:(id)a4 withCompletion:(id)a5;
@end

@implementation PDPeerPaymentService

- (void)setPeerPaymentAccountManager:(id)a3
{
  v5 = (PDPeerPaymentAccountManager *)a3;
  peerPaymentAccountManager = self->_peerPaymentAccountManager;
  if (peerPaymentAccountManager != v5)
  {
    v7 = v5;
    if (peerPaymentAccountManager) {
      [(PDPeerPaymentAccountManager *)peerPaymentAccountManager unregisterObserver:self];
    }
    objc_storeStrong((id *)&self->_peerPaymentAccountManager, a3);
    peerPaymentAccountManager = (PDPeerPaymentAccountManager *)[(PDPeerPaymentAccountManager *)self->_peerPaymentAccountManager registerObserver:self];
    v5 = v7;
  }
  _objc_release_x1(peerPaymentAccountManager, v5);
}

- (void)setPeerPaymentWebServiceCoordinator:(id)a3
{
  v5 = (PDPeerPaymentWebServiceCoordinator *)a3;
  peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
  if (peerPaymentWebServiceCoordinator != v5)
  {
    v7 = v5;
    if (peerPaymentWebServiceCoordinator) {
      [(PDPeerPaymentWebServiceCoordinator *)peerPaymentWebServiceCoordinator unregisterObserver:self];
    }
    objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, a3);
    peerPaymentWebServiceCoordinator = (PDPeerPaymentWebServiceCoordinator *)[(PDPeerPaymentWebServiceCoordinator *)self->_peerPaymentWebServiceCoordinator registerObserver:self];
    v5 = v7;
  }
  _objc_release_x1(peerPaymentWebServiceCoordinator, v5);
}

- (void)setIdsSharingManager:(id)a3
{
  v5 = (PKSharingIDSManager *)a3;
  p_idsSharingManager = &self->_idsSharingManager;
  if (self->_idsSharingManager != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_idsSharingManager, a3);
    v5 = v7;
  }
  _objc_release_x1(p_idsSharingManager, v5);
}

- (PDPeerPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PDPeerPaymentService;
  v8 = [(PDPeerPaymentService *)&v17 initWithConnection:v6];
  if (v8)
  {
    v9 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v6];
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    v11 = sub_100011FE8((uint64_t)v7);
    uint64_t v12 = sub_100011FD0((uint64_t)v11);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v12;

    v14 = PKPeerPaymentServiceInterface();
    [v6 setRemoteObjectInterface:v14];

    v15 = PDPeerPaymentServiceInterface();
    [v6 setExportedInterface:v15];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (void)accountWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000DA18;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)setUserNotificationManager:(id)a3
{
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDPeerPaymentService)initWithConnection:(id)a3
{
  return 0;
}

- (void)dealloc
{
  [(PDPeerPaymentAccountManager *)self->_peerPaymentAccountManager unregisterObserver:self];
  [(PDPeerPaymentWebServiceCoordinator *)self->_peerPaymentWebServiceCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDPeerPaymentService;
  [(PDPeerPaymentService *)&v3 dealloc];
}

- (void)usingSynchronousProxy:(BOOL)a3 fetchSharedPeerPaymentWebServiceContextWithHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
    {
      if (v4)
      {
        id v8 = [(PDPeerPaymentWebServiceCoordinator *)self->_peerPaymentWebServiceCoordinator sharedPeerPaymentWebService];
        v9 = [v8 context];
        v6[2](v6, v9);
      }
      else
      {
        v11 = PDDefaultQueue();
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10014AF64;
        v12[3] = &unk_10072E598;
        v12[4] = self;
        v13 = v6;
        dispatch_async(v11, v12);
      }
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[PDPeerPaymentService usingSynchronousProxy:fetchSharedPeerPaymentWebServiceContextWithHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
      }

      v6[2](v6, 0);
    }
  }
}

- (void)usingSynchronousProxy:(BOOL)a3 setSharedPeerPaymentWebServiceContext:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    if (v6)
    {
      [(PDPeerPaymentWebServiceCoordinator *)self->_peerPaymentWebServiceCoordinator updateSharedWebServiceContext:v8];
      if (v9) {
        v9[2](v9);
      }
    }
    else
    {
      uint64_t v12 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10014B1A4;
      block[3] = &unk_10072E9D8;
      void block[4] = self;
      id v14 = v8;
      v15 = v9;
      dispatch_async(v12, block);
    }
  }
  else
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v17 = "-[PDPeerPaymentService usingSynchronousProxy:setSharedPeerPaymentWebServiceContext:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)preferencesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014B314;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    BOOL v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014B554;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    BOOL v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)updateAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014B794;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    BOOL v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014B9D4;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    BOOL v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)updatePreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014BC14;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    BOOL v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10014BE7C;
    v10[3] = &unk_10072E9D8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v9 = v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v14 = v9;
    dispatch_async(v8, block);
  }
}

- (void)deleteAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014C0B8;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)deletePreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014C2F4;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014C554;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)registrationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014C79C;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)presentIdentityVerificationFlowWithResponseData:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10014CAF0;
    v17[3] = &unk_10073A2B0;
    v17[4] = self;
    id v18 = v9;
    id v19 = v10;
    id v11 = objc_retainBlock(v17);
    id v12 = v11;
    if (v8)
    {
      ((void (*)(void *, id))v11[2])(v11, v8);
    }
    else
    {
      id v14 = [(PDPeerPaymentService *)self peerPaymentWebServiceCoordinator];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10014CC88;
      v15[3] = &unk_10073A2D8;
      id v16 = v12;
      [v14 identityVerificationResponseWithCompletion:v15];
    }
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[PDPeerPaymentService presentIdentityVerificationFlowWithResponseData:orientation:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)presentRegistrationFlowWithAccount:(id)a3 amount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 orientation:(id)a7 hostSceneIdentifier:(id)a8 hostSceneBundleIdentifier:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v23 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014CF2C;
    block[3] = &unk_10073A300;
    void block[4] = self;
    id v26 = v16;
    id v27 = v17;
    unint64_t v33 = a5;
    id v28 = v18;
    id v29 = v19;
    id v30 = v20;
    id v31 = v21;
    id v32 = v22;
    dispatch_async(v23, block);
  }
  else
  {
    v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[PDPeerPaymentService presentRegistrationFlowWithAccount:amount:state:senderAddress:orientation:hostSceneId"
            "entifier:hostSceneBundleIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v22) {
      (*((void (**)(id, void))v22 + 2))(v22, 0);
    }
  }
}

- (void)presentPeerPaymentTermsAndConditionsWithTermsURL:(id)a3 termsIdentifier:(id)a4 passUniqueID:(id)a5 orientation:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v17 = PDDefaultQueue();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10014D234;
    v19[3] = &unk_10072FEA8;
    id v20 = v12;
    id v21 = v13;
    id v22 = self;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    dispatch_async(v17, v19);
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[PDPeerPaymentService presentPeerPaymentTermsAndConditionsWithTermsURL:termsIdentifier:passUniqueID:orienta"
            "tion:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v16) {
      (*((void (**)(id, void))v16 + 2))(v16, 0);
    }
  }
}

- (void)receivedPeerPaymentMessageData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v8 = dispatch_get_global_queue(21, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10014D4E0;
    v11[3] = &unk_10072E9D8;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v9 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v15 = v9;
    dispatch_async(v8, block);
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1005155A4(v10);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)updateMessageReceivedDate:(id)a3 forTransactionWithIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v11 = dispatch_get_global_queue(21, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10014DA8C;
    v14[3] = &unk_100730578;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    id v12 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v19 = v12;
    dispatch_async(v11, block);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1005155E8(v13);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)balanceForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v8 = [(PDPeerPaymentService *)self peerPaymentWebServiceCoordinator];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10014DD84;
    v9[3] = &unk_10072F7F8;
    id v10 = v6;
    id v11 = v7;
    [v8 accountWithPreventingServerFetch:1 completion:v9];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)lastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014DF54;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
}

- (void)setLastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014E178;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014E3F4;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)registerDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014E588;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)registerDeviceWithForceReregister:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v7 = dispatch_get_global_queue(21, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10014E794;
    v9[3] = &unk_10073A378;
    void v9[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    id v8 = v9;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v13 = v8;
    dispatch_async(v7, block);
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v13 = dispatch_get_global_queue(21, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10014E9F8;
    v15[3] = &unk_100732C18;
    void v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    BOOL v19 = a5;
    id v18 = v12;
    id v14 = v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v21 = v14;
    dispatch_async(v13, block);
  }
  else if (v12)
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014EB94;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014ED8C;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014EF88;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014F180;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10014F378;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v10 = v6;
    dispatch_async(v5, block);
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v11 = dispatch_get_global_queue(21, 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10014F5B4;
    v13[3] = &unk_100730578;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    id v12 = v13;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D83C;
    block[3] = &unk_10072F788;
    id v18 = v12;
    dispatch_async(v11, block);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014F7B0;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014F9F0;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 shouldScheduleNotifications:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(21, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10014FC64;
  v14[3] = &unk_100730238;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = a4;
  id v11 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, block);
}

- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014FED0;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100150110;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)recurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100150350;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = dispatch_get_global_queue(21, 0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100150604;
  v20[3] = &unk_100731F38;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v20;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v26 = v15;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v14, block);
}

- (void)updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100150848;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100150AB0;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100150D10;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100150F50;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(21, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001511C0;
  v14[3] = &unk_100731AD8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v11 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, block);
}

- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(21, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100151454;
  v16[3] = &unk_100730578;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v21 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v11, block);
}

- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(21, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001516C8;
  v14[3] = &unk_100731AD8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v11 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, block);
}

- (void)hasRecurringPayments:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015190C;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)_removeNotificationsForPeerPaymentRecurringPaymentsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing notifications for peer payment recurring payment identifiers: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[PDPeerPaymentRecurringPaymentUpcomingPaymentNotification notificationIdentifierForRecurringPaymentIdentifier:](PDPeerPaymentRecurringPaymentUpcomingPaymentNotification, "notificationIdentifierForRecurringPaymentIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_removeAllNotificationsForPeerPaymentRecurringPayments
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all notifications for peer payment recurring payments", v4, 2u);
  }

  [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsOfType:73];
}

- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100151D6C;
  v12[3] = &unk_100731600;
  id v13 = v8;
  unint64_t v14 = a3;
  BOOL v15 = a4;
  v12[4] = self;
  id v10 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v17 = v10;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(21, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100151FDC;
  v14[3] = &unk_100731AD8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v19 = v11;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, block);
}

- (void)presentSenderFlowWithHost:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v10 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001522A4;
    v12[3] = &unk_100731AD8;
    v12[4] = self;
    unint64_t v15 = a3;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v17 = "-[PDPeerPaymentService presentSenderFlowWithHost:userInfo:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (void)presentReceiverFlowWithOrientation:(id)a3 host:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist peerPaymentAllAccess])
  {
    id v10 = PDDefaultQueue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001524FC;
    v12[3] = &unk_100731AD8;
    v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    id v14 = v9;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v17 = "-[PDPeerPaymentService presentReceiverFlowWithOrientation:host:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client is not entitled for method: %s", buf, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = dispatch_get_global_queue(21, 0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100152738;
  v20[3] = &unk_100731F38;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  unint64_t v15 = v20;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v26 = v15;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v14, block);
}

- (void)insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:(id)a3 amount:(id)a4 currency:(id)a5 senderName:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = dispatch_get_global_queue(21, 0);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100152A14;
  v24[3] = &unk_10072FEA8;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v18 = v24;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v31 = v18;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  dispatch_async(v17, block);
}

- (void)counterpartImageDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100152D8C;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)counterpartImageDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10015300C;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)counterpartImageDataForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10015328C;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (void)deleteAllCounterpartImageDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001534E8;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100153750;
  v12[3] = &unk_10072E9D8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

- (id)_displayNameForAddress:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[PKContactResolver defaultContactResolver];
    v5 = [v4 contactForHandle:v3];
    id v6 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v3 contact:v5];
    if (!v6) {
      id v6 = v3;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_scheduleNotificationsForPeerPaymentPendingRequests:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 expiryDate];
        BOOL v14 = v13 == 0;

        v9 |= v14;
        id v15 = [v12 requestToken];
        [v5 addObject:v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100153B70;
  v21[3] = &unk_10072FC20;
  v21[4] = self;
  id v16 = objc_retainBlock(v21);
  id v17 = v16;
  if (v9)
  {
    peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100153FE4;
    v19[3] = &unk_1007346F0;
    void v19[4] = self;
    id v20 = v16;
    [(PDPeerPaymentWebServiceCoordinator *)peerPaymentWebServiceCoordinator peerPaymentPendingRequestsForRequests:v6 completion:v19];
  }
  else
  {
    ((void (*)(void *, id))v16[2])(v16, v6);
  }
}

- (void)_removeAllNotificationsForPeerPaymentPendingRequests
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all notifications for peer payment pending requests", buf, 2u);
  }

  id v4 = [(PDPeerPaymentService *)self peerPaymentAccountManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001542AC;
  v5[3] = &unk_10072FC20;
  v5[4] = self;
  [v4 peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:v5];
}

- (void)_removeNotificationsForPeerPaymentPendingRequestWithRequestTokens:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing notifications for peer payment pending requests with tokens: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[PDPeerPaymentPendingRequestReceivedUserNotification notificationIdentifierForRequestToken:](PDPeerPaymentPendingRequestReceivedUserNotification, "notificationIdentifierForRequestToken:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_notifyPendingRequestsChangedObservers
{
  id v3 = dispatch_get_global_queue(21, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100154658;
  v5[3] = &unk_10072E1E8;
  v5[4] = self;
  id v4 = v5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v7 = v4;
  dispatch_async(v3, block);
}

- (void)_notifyRecurringPaymentsChangedObservers
{
  id v3 = dispatch_get_global_queue(21, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001547B8;
  v5[3] = &unk_10072E1E8;
  v5[4] = self;
  id v4 = v5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D83C;
  block[3] = &unk_10072F788;
  id v7 = v4;
  dispatch_async(v3, block);
}

- (void)peerPaymentAccountManagerPendingRequestsChanged
{
}

- (void)peerPaymentAccountManagerRecurringPaymentsChanged
{
}

- (void)peerPaymentWebServiceCoordinatorPendingRequestsChanged
{
}

- (void)peerPaymentWebServiceCoordinatorRecurringPaymentsChanged
{
}

- (PDPeerPaymentAccountManager)peerPaymentAccountManager
{
  return self->_peerPaymentAccountManager;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (PKSharingIDSManager)idsSharingManager
{
  return self->_idsSharingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsSharingManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end