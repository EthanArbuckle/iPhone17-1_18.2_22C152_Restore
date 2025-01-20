@interface PKPeerPaymentService
+ (PKPeerPaymentService)sharedInstance;
- (BOOL)hasRecurringPayments;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentPreferences)preferences;
- (PKPeerPaymentService)init;
- (PKPeerPaymentWebServiceContext)sharedPeerPaymentWebServiceContext;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyForSelector:(SEL)a3;
- (id)balanceForPass:(id)a3;
- (id)lastUsedAlternateFundingSourcePassUniqueIdentifier;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_accountChanged:(id)a3;
- (void)_postAccountChangeNotificationIfNecessaryForAccount:(id)a3 previousAccount:(id)a4;
- (void)_preferencesChanged:(id)a3;
- (void)accountWithCompletion:(id)a3;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)counterpartImageDataForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)counterpartImageDataWithCompletion:(id)a3;
- (void)counterpartImageDataWithIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteAccountWithCompletion:(id)a3;
- (void)deleteAllCounterpartImageDataWithCompletion:(id)a3;
- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccount;
- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3;
- (void)deletePreferencesWithCompletion:(id)a3;
- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4;
- (void)downloadPassIfNecessaryWithCompletion:(id)a3;
- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5;
- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3;
- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6;
- (void)insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:(id)a3 amount:(id)a4 currency:(id)a5 senderName:(id)a6 completion:(id)a7;
- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 shouldScheduleNotifications:(BOOL)a4;
- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4;
- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)pendingRequestsChanged;
- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)preferencesWithCompletion:(id)a3;
- (void)presentIdentityVerificationFlowWithResponse:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)presentPeerPaymentTermsAndConditionsWithAccount:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)presentReceiverFlowWithOrientation:(id)a3 host:(unint64_t)a4 completion:(id)a5;
- (void)presentRegistrationFlowWithAccount:(id)a3 amount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 orientation:(id)a7 hostSceneIdentifier:(id)a8 hostSceneBundleIdentifier:(id)a9 completion:(id)a10;
- (void)presentRegistrationFlowWithAccount:(id)a3 orientation:(id)a4 hostSceneIdentifier:(id)a5 hostSceneBundleIdentifier:(id)a6 completion:(id)a7;
- (void)presentSenderFlowWithHost:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5;
- (void)receivedPeerPaymentMessageData:(id)a3;
- (void)recurringPaymentsChanged;
- (void)recurringPaymentsWithCompletion:(id)a3;
- (void)registerDeviceWithCompletion:(id)a3;
- (void)registerDeviceWithForceReregister:(BOOL)a3 completion:(id)a4;
- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6;
- (void)registerObserver:(id)a3;
- (void)registrationStatusWithCompletion:(id)a3;
- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5;
- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)resumeAccountChangedNotifications;
- (void)setLastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3;
- (void)setPreferences:(id)a3 completion:(id)a4;
- (void)setSharedPeerPaymentWebServiceContext:(id)a3;
- (void)sharedPeerPaymentWebServiceContextWithCompletion:(id)a3;
- (void)suspendAccountChangedNotifications;
- (void)unregisterDeviceWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAccountWithCompletion:(id)a3;
- (void)updateAssociatedAccountsWithCompletion:(id)a3;
- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6;
- (void)updateMessageReceivedDate:(id)a3 forTransactionWithIdentifier:(id)a4;
- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4;
- (void)updatePreferencesWithCompletion:(id)a3;
- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentsWithCompletion:(id)a3;
@end

@implementation PKPeerPaymentService

void __31__PKPeerPaymentService_account__block_invoke(uint64_t a1, void *a2)
{
}

void __38__PKPeerPaymentService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB403650;
  qword_1EB403650 = (uint64_t)v1;
}

- (PKPeerPaymentService)init
{
  if (!PKSecureElementIsAvailable())
  {
    v14 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_190E10000, v14, OS_LOG_TYPE_ERROR, "Peer Payment Service isn't supported on this device.", v16, 2u);
    }

    id v3 = 0;
    goto LABEL_7;
  }
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentService;
  id v3 = [(PKPeerPaymentService *)&v17 init];
  if (v3)
  {
    v4 = [PKXPCService alloc];
    v5 = PDPeerPaymentServiceInterface();
    v6 = PKPeerPaymentServiceInterface();
    uint64_t v7 = [(PKXPCService *)v4 initWithMachServiceName:@"com.apple.passd.peer-payment" remoteObjectInterface:v5 exportedObjectInterface:v6 exportedObject:v3];
    v8 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v7;

    v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v9 addObserver:v3 selector:sel__accountChanged_ name:@"PDPeerPaymentServiceAccountChangedDistributedNotification" object:0 suspensionBehavior:2];

    v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v10 addObserver:v3 selector:sel__preferencesChanged_ name:@"PDPeerPaymentServicePreferencesChangedDistributedNotification" object:0 suspensionBehavior:2];

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passkit.pkpeerpaymentservice.reply", 0);
    v12 = (void *)*((void *)v3 + 4);
    *((void *)v3 + 4) = v11;

    *((void *)v3 + 5) = 0;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    self = (PKPeerPaymentService *)*((void *)v3 + 6);
    *((void *)v3 + 6) = v13;
LABEL_7:
  }
  return (PKPeerPaymentService *)v3;
}

- (PKPeerPaymentAccount)account
{
  uint64_t v13 = 0;
  v14 = (id *)&v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__86;
  objc_super v17 = __Block_byref_object_dispose__86;
  id v18 = 0;
  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock(&self->_accountLock);
  objc_storeStrong(v14 + 5, self->_account);
  os_unfair_lock_unlock(p_accountLock);
  char v5 = [v14[5] isAccountStateDirty];
  id v6 = v14[5];
  if (v5) {
    goto LABEL_5;
  }
  int v7 = [v6 isAccountOutOfDate];
  id v6 = v14[5];
  if (!v6) {
    int v7 = 1;
  }
  if (v7 == 1)
  {
LABEL_5:
    id v8 = v6;
    v9 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __31__PKPeerPaymentService_account__block_invoke;
    v12[3] = &unk_1E56F6B08;
    v12[4] = &v13;
    [v9 accountWithCompletion:v12];

    os_unfair_lock_lock(p_accountLock);
    objc_storeStrong((id *)&self->_account, v14[5]);
    [(PKPeerPaymentService *)self _postAccountChangeNotificationIfNecessaryForAccount:self->_account previousAccount:v8];
    os_unfair_lock_unlock(p_accountLock);

    id v6 = v14[5];
  }
  id v10 = v6;
  _Block_object_dispose(&v13, 8);

  return (PKPeerPaymentAccount *)v10;
}

- (id)_synchronousRemoteObjectProxyForSelector:(SEL)a3
{
  remoteService = self->_remoteService;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKPeerPaymentService__synchronousRemoteObjectProxyForSelector___block_invoke;
  v6[3] = &unk_1E56DD328;
  v6[4] = self;
  v6[5] = a3;
  v4 = [(PKXPCService *)remoteService synchronousRemoteObjectProxyWithErrorHandler:v6];
  return v4;
}

- (void)_postAccountChangeNotificationIfNecessaryForAccount:(id)a3 previousAccount:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = v6;
  if (v6 && a4)
  {
    if ([v6 isEqual:a4]) {
      goto LABEL_12;
    }
  }
  else if (v6 == a4)
  {
    goto LABEL_12;
  }
  id v8 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Posting PKPeerPaymentServiceAccountChangedNotification", v12, 2u);
  }

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = v9;
  if (v7)
  {
    uint64_t v13 = @"account";
    v14[0] = v7;
    dispatch_queue_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v10 postNotificationName:@"PKPeerPaymentServiceAccountChangedNotification" object:self userInfo:v11];
  }
  else
  {
    [v9 postNotificationName:@"PKPeerPaymentServiceAccountChangedNotification" object:self userInfo:0];
  }

LABEL_12:
}

+ (PKPeerPaymentService)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PKPeerPaymentService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_292 != -1) {
    dispatch_once(&_MergedGlobals_292, block);
  }
  v2 = (void *)qword_1EB403650;
  return (PKPeerPaymentService *)v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentService;
  [(PKPeerPaymentService *)&v4 dealloc];
}

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
    char v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__PKPeerPaymentService__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __52__PKPeerPaymentService__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (PKPeerPaymentWebServiceContext)sharedPeerPaymentWebServiceContext
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__86;
  uint64_t v13 = __Block_byref_object_dispose__86;
  id v14 = 0;
  id v2 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKPeerPaymentService_sharedPeerPaymentWebServiceContext__block_invoke;
  v8[3] = &unk_1E56F6AB8;
  void v8[4] = &v9;
  [v2 usingSynchronousProxy:1 fetchSharedPeerPaymentWebServiceContextWithHandler:v8];

  uint64_t v3 = (void *)v10[5];
  if (!v3)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v7 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get a non nil shared peer payment web service context.", v7, 2u);
    }

    uint64_t v3 = (void *)v10[5];
  }
  id v5 = v3;
  _Block_object_dispose(&v9, 8);

  return (PKPeerPaymentWebServiceContext *)v5;
}

void __58__PKPeerPaymentService_sharedPeerPaymentWebServiceContext__block_invoke(uint64_t a1, void *a2)
{
}

- (void)setSharedPeerPaymentWebServiceContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
    [v6 usingSynchronousProxy:1 setSharedPeerPaymentWebServiceContext:v5 withCompletion:&__block_literal_global_230];
  }
  else
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v7 = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to set the shared peer payment web service context to nil. Ignoring.", v7, 2u);
    }
  }
}

- (void)sharedPeerPaymentWebServiceContextWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  long long v7 = _Block_copy(aBlock);
  long long v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56F6AE0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 usingSynchronousProxy:0 fetchSharedPeerPaymentWebServiceContextWithHandler:v10];
}

void __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_27;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  long long v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_27(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __73__PKPeerPaymentService_sharedPeerPaymentWebServiceContextWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (PKPeerPaymentPreferences)preferences
{
  uint64_t v12 = 0;
  uint64_t v13 = (id *)&v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__86;
  v16 = __Block_byref_object_dispose__86;
  id v17 = 0;
  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock(&self->_accountLock);
  objc_storeStrong(v13 + 5, self->_preferences);
  os_unfair_lock_unlock(p_accountLock);
  if (([v13[5] isDirty] & 1) != 0
    || ((v5 = [v13[5] isOutOfDate], (v6 = v13[5]) == 0) ? (int v7 = 1) : (int v7 = v5), v7 == 1))
  {
    id v8 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__PKPeerPaymentService_preferences__block_invoke;
    v11[3] = &unk_1E56F6B30;
    v11[4] = &v12;
    [v8 preferencesWithCompletion:v11];

    os_unfair_lock_lock(p_accountLock);
    objc_storeStrong((id *)&self->_preferences, v13[5]);
    os_unfair_lock_unlock(p_accountLock);
    id v6 = v13[5];
  }
  id v9 = v6;
  _Block_object_dispose(&v12, 8);

  return (PKPeerPaymentPreferences *)v9;
}

void __35__PKPeerPaymentService_preferences__block_invoke(uint64_t a1, void *a2)
{
}

- (void)accountWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  int v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56E7250;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 accountWithCompletion:v10];
}

void __46__PKPeerPaymentService_accountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke_30;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  long long v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __46__PKPeerPaymentService_accountWithCompletion___block_invoke_30(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __46__PKPeerPaymentService_accountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PKPeerPaymentService_accountWithCompletion___block_invoke_3;
  v8[3] = &unk_1E56D89F0;
  id v5 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v5;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __46__PKPeerPaymentService_accountWithCompletion___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _postAccountChangeNotificationIfNecessaryForAccount:*(void *)(a1 + 40) previousAccount:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
  }
}

- (void)preferencesWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56F6B58;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 preferencesWithCompletion:v10];
}

void __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_31;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_31(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_3;
  v8[3] = &unk_1E56D89F0;
  id v5 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v5;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __50__PKPeerPaymentService_preferencesWithCompletion___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56E7250;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updateAccountWithCompletion:v10];
}

void __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_32;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_32(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D89F0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __52__PKPeerPaymentService_updateAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(v2 + 16);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = v4;
    id v6 = v3;

    [*(id *)(a1 + 40) _postAccountChangeNotificationIfNecessaryForAccount:*(void *)(a1 + 32) previousAccount:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)updateAssociatedAccountsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56E7250;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updateAssociatedAccountsWithCompletion:v10];
}

void __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_33;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_33(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D89F0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__PKPeerPaymentService_updateAssociatedAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(v2 + 16);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = v4;
    id v6 = v3;

    [*(id *)(a1 + 40) _postAccountChangeNotificationIfNecessaryForAccount:*(void *)(a1 + 32) previousAccount:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)updateAccountAndAssociatedAccountsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56E7250;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updateAccountAndAssociatedAccountsWithCompletion:v10];
}

void __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_34;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_34(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D89F0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__PKPeerPaymentService_updateAccountAndAssociatedAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(v2 + 16);
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = v4;
    id v6 = v3;

    [*(id *)(a1 + 40) _postAccountChangeNotificationIfNecessaryForAccount:*(void *)(a1 + 32) previousAccount:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)updatePreferencesWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56F6B58;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updatePreferencesWithCompletion:v10];
}

void __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_35;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_35(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D89F0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __56__PKPeerPaymentService_updatePreferencesWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), *(id *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)deleteAccountWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8A18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 deleteAccountWithCompletion:v10];
}

void __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_36;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_36(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_3;
  v5[3] = &unk_1E56D8A18;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

void __52__PKPeerPaymentService_deleteAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  [*(id *)(a1 + 32) _postAccountChangeNotificationIfNecessaryForAccount:*(void *)(*(void *)(a1 + 32) + 16) previousAccount:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)deletePreferencesWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8A18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 deletePreferencesWithCompletion:v10];
}

void __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_37;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_37(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_3;
  v5[3] = &unk_1E56D8A18;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __56__PKPeerPaymentService_deletePreferencesWithCompletion___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke_2;
  v13[3] = &unk_1E56F6B80;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 setPreferences:v9 completion:v13];
}

void __50__PKPeerPaymentService_setPreferences_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke_38;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __50__PKPeerPaymentService_setPreferences_completion___block_invoke_38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __50__PKPeerPaymentService_setPreferences_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PKPeerPaymentService_setPreferences_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __50__PKPeerPaymentService_setPreferences_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)suspendAccountChangedNotifications
{
  if ((PKPeerPaymentService *)qword_1EB403650 != self) {
    ++self->_accountChangedNotificationSuspensionCount;
  }
}

- (void)resumeAccountChangedNotifications
{
  if ((PKPeerPaymentService *)qword_1EB403650 != self) {
    --self->_accountChangedNotificationSuspensionCount;
  }
}

- (void)registrationStatusWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56DE048;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 registrationStatusWithCompletion:v10];
}

void __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_40;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_40(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dispatch_get_global_queue(21, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_3;
  v6[3] = &unk_1E56D8590;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = a2;
  v6[4] = *(void *)(a1 + 32);
  id v5 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v10 = v5;
  dispatch_async(v4, block);
}

uint64_t __57__PKPeerPaymentService_registrationStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)presentIdentityVerificationFlowWithResponse:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v21 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v20 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  SEL v14 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  uint64_t v15 = [v12 rawData];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_2;
  v17[3] = &unk_1E56D8798;
  v17[4] = self;
  id v18 = v10;
  id v16 = v10;
  [v14 presentIdentityVerificationFlowWithResponseData:v15 orientation:v11 completion:v17];
}

void __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_42;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_42(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __91__PKPeerPaymentService_presentIdentityVerificationFlowWithResponse_orientation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
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
  v23 = (void (**)(void, void))v22;
  if (v16)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v37 = a2;
    id v24 = v22;
    aBlock[4] = self;
    id v36 = v24;
    id v29 = v17;
    v25 = _Block_copy(aBlock);
    [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v25];
    v26 = v30 = v23;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_2;
    v33[3] = &unk_1E56D8798;
    v33[4] = self;
    id v34 = v24;
    v27 = v29;
    [v26 presentRegistrationFlowWithAccount:v16 amount:v29 state:a5 senderAddress:v18 orientation:v19 hostSceneIdentifier:v20 hostSceneBundleIdentifier:v21 completion:v33];

    v23 = v30;
  }
  else
  {
    v27 = v17;
    v28 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Cannot present registration flow will a nil account", buf, 2u);
    }

    if (v23) {
      v23[2](v23, 0);
    }
  }
}

void __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_44;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __155__PKPeerPaymentService_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)presentRegistrationFlowWithAccount:(id)a3 orientation:(id)a4 hostSceneIdentifier:(id)a5 hostSceneBundleIdentifier:(id)a6 completion:(id)a7
{
}

- (void)presentPeerPaymentTermsAndConditionsWithAccount:(id)a3 orientation:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 termsIdentifier];
  uint64_t v13 = [v9 termsURL];
  SEL v14 = [v9 associatedPassUniqueID];
  if (!v13)
  {
    id v18 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)long long buf = 138412290;
    id v26 = v9;
    id v19 = "Cannot present terms and conditions with a nil termsURL for acount %@";
    goto LABEL_11;
  }
  if (![v12 length])
  {
    id v18 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)long long buf = 138412290;
    id v26 = v9;
    id v19 = "Cannot present terms and conditions with a nil termsIdentifier for acount %@";
    goto LABEL_11;
  }
  if ([v9 termsAcceptanceRequired])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v24 = a2;
    id v15 = v11;
    aBlock[4] = self;
    id v23 = v15;
    id v16 = _Block_copy(aBlock);
    id v17 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v16];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_2;
    v20[3] = &unk_1E56D8798;
    v20[4] = self;
    id v21 = v15;
    [v17 presentPeerPaymentTermsAndConditionsWithTermsURL:v13 termsIdentifier:v12 passUniqueID:v14 orientation:v10 completion:v20];

    goto LABEL_14;
  }
  id v18 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v9;
    id v19 = "The user does not need to accept terms for account %@";
LABEL_11:
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
  }
LABEL_12:

  if (v11) {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
LABEL_14:
}

void __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_45;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_45(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __95__PKPeerPaymentService_presentPeerPaymentTermsAndConditionsWithAccount_orientation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)receivedPeerPaymentMessageData:(id)a3
{
  if (a3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__PKPeerPaymentService_receivedPeerPaymentMessageData___block_invoke;
    aBlock[3] = &unk_1E56DE608;
    aBlock[4] = self;
    void aBlock[5] = a2;
    id v4 = a3;
    id v5 = _Block_copy(aBlock);
    id v6 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__PKPeerPaymentService_receivedPeerPaymentMessageData___block_invoke_46;
    v7[3] = &unk_1E56D8AE0;
    v7[4] = self;
    [v6 receivedPeerPaymentMessageData:v4 handler:v7];
  }
}

void __55__PKPeerPaymentService_receivedPeerPaymentMessageData___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)updateMessageReceivedDate:(id)a3 forTransactionWithIdentifier:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__PKPeerPaymentService_updateMessageReceivedDate_forTransactionWithIdentifier___block_invoke;
      aBlock[3] = &unk_1E56DE608;
      aBlock[4] = self;
      void aBlock[5] = a2;
      id v6 = a4;
      id v7 = a3;
      id v8 = _Block_copy(aBlock);
      char v9 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v8];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __79__PKPeerPaymentService_updateMessageReceivedDate_forTransactionWithIdentifier___block_invoke_47;
      v10[3] = &unk_1E56D8AE0;
      v10[4] = self;
      [v9 updateMessageReceivedDate:v7 forTransactionWithIdentifier:v6 handler:v10];
    }
  }
}

void __79__PKPeerPaymentService_updateMessageReceivedDate_forTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)updateMockAccountBalanceByAddingAmount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = (void (**)(void, void))v8;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke;
    aBlock[3] = &unk_1E56D8590;
    SEL v19 = a2;
    id v10 = v8;
    aBlock[4] = self;
    id v18 = v10;
    id v11 = _Block_copy(aBlock);
    id v12 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_2;
    v15[3] = &unk_1E56F6BA8;
    v15[4] = self;
    id v16 = v10;
    [v12 updateMockAccountBalanceByAddingAmount:v7 completion:v15];
  }
  else
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SEL v14 = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring request to update mock account balance with nil amount", v14, 2u);
    }

    if (v9) {
      v9[2](v9, 0);
    }
  }
}

void __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_48;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_48(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __74__PKPeerPaymentService_updateMockAccountBalanceByAddingAmount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)balanceForPass:(id)a3
{
  id v5 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__86;
  id v14 = __Block_byref_object_dispose__86;
  id v15 = 0;
  uint64_t v6 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PKPeerPaymentService_balanceForPass___block_invoke;
  v9[3] = &unk_1E56F6BD0;
  void v9[4] = &v10;
  [v6 balanceForPass:v5 completion:v9];
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __39__PKPeerPaymentService_balanceForPass___block_invoke(uint64_t a1, void *a2)
{
}

- (void)setLastUsedAlternateFundingSourcePassUniqueIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
  [v6 setLastUsedAlternateFundingSourcePassUniqueIdentifier:v5 handler:&__block_literal_global_51_2];
}

- (id)lastUsedAlternateFundingSourcePassUniqueIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__86;
  uint64_t v11 = __Block_byref_object_dispose__86;
  id v12 = 0;
  id v3 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PKPeerPaymentService_lastUsedAlternateFundingSourcePassUniqueIdentifier__block_invoke;
  v6[3] = &unk_1E56F6BF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 lastUsedAlternateFundingSourcePassUniqueIdentifier:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __74__PKPeerPaymentService_lastUsedAlternateFundingSourcePassUniqueIdentifier__block_invoke(uint64_t a1, void *a2)
{
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8798;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 downloadPassIfNecessaryWithCompletion:v10];
}

void __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_53;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_53(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __62__PKPeerPaymentService_downloadPassIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)registerDeviceWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 registerDeviceWithCompletion:v10];
}

void __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_54;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_54(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __53__PKPeerPaymentService_registerDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)registerDeviceWithForceReregister:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v16 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v15 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_2;
  v12[3] = &unk_1E56D8928;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 registerDeviceWithForceReregister:v4 completion:v12];
}

void __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_56;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_56(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __69__PKPeerPaymentService_registerDeviceWithForceReregister_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)registerDeviceWithRegistrationURL:(id)a3 pushToken:(id)a4 forceReregister:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v22 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v21 = v12;
  id v13 = a4;
  id v14 = a3;
  char v15 = _Block_copy(aBlock);
  SEL v16 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_2;
  v18[3] = &unk_1E56D8928;
  v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 registerDeviceWithRegistrationURL:v14 pushToken:v13 forceReregister:v6 completion:v18];
}

void __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_57;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  BOOL v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_57(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __95__PKPeerPaymentService_registerDeviceWithRegistrationURL_pushToken_forceReregister_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 unregisterDeviceWithCompletion:v10];
}

void __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_58;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_58(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __55__PKPeerPaymentService_unregisterDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 initalizeCloudStoreIfNecessaryWithHandler:v10];
}

void __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_59;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_59(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __66__PKPeerPaymentService_initalizeCloudStoreIfNecessaryWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56F4850;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 cloudStoreStatusWithCompletion:v10];
}

void __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_60;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

void __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_3;
  v14[3] = &unk_1E56E4828;
  id v10 = *(id *)(a1 + 40);
  char v19 = a3;
  id v15 = v7;
  id v16 = v8;
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v10;
  id v11 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v21 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, block);
}

uint64_t __55__PKPeerPaymentService_cloudStoreStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40));
  }
  return result;
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 checkTLKsMissingWithCompletion:v10];
}

void __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_62;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_62(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __55__PKPeerPaymentService_checkTLKsMissingWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8928;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 resetApplePayManateeViewWithCompletion:v10];
}

void __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_63;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_63(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __63__PKPeerPaymentService_resetApplePayManateeViewWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)remoteRegistrationRequest:(id)a3 forHandle:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_2;
  v16[3] = &unk_1E56D8770;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 remoteRegistrationRequest:v12 forHandle:v11 completion:v16];
}

void __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_64;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_64(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __71__PKPeerPaymentService_remoteRegistrationRequest_forHandle_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_accountChanged:(id)a3
{
  if (self->_accountChangedNotificationSuspensionCount <= 0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40__PKPeerPaymentService__accountChanged___block_invoke;
    v3[3] = &unk_1E56F6C20;
    v3[4] = self;
    [(PKPeerPaymentService *)self accountWithCompletion:v3];
  }
}

- (void)_preferencesChanged:(id)a3
{
  p_accountLock = &self->_accountLock;
  os_unfair_lock_lock(&self->_accountLock);
  id v5 = self->_preferences;
  os_unfair_lock_unlock(p_accountLock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PKPeerPaymentService__preferencesChanged___block_invoke;
  v7[3] = &unk_1E56F6C48;
  id v8 = v5;
  id v9 = self;
  uint64_t v6 = v5;
  [(PKPeerPaymentService *)self preferencesWithCompletion:v7];
}

void __44__PKPeerPaymentService__preferencesChanged___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v3)
    {
      id v8 = @"preferences";
      v9[0] = v3;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [v5 postNotificationName:@"PKPeerPaymentServicePreferencesChangedNotification" object:v6 userInfo:v7];
    }
    else
    {
      [v4 postNotificationName:@"PKPeerPaymentServicePreferencesChangedNotification" object:v6 userInfo:0];
    }
  }
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithFailureHandler:a3];
}

void __65__PKPeerPaymentService__synchronousRemoteObjectProxyForSelector___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_2;
  v13[3] = &unk_1E56D89C8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 peerPaymentPendingRequestsForRequestTokens:v9 completion:v13];
}

void __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_74;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_74(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __78__PKPeerPaymentService_peerPaymentPendingRequestsForRequestTokens_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D89C8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:v10];
}

void __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_76;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_76(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __86__PKPeerPaymentService_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 shouldScheduleNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PKPeerPaymentService_insertOrUpdatePeerPaymentPendingRequests_shouldScheduleNotifications___block_invoke;
  aBlock[3] = &unk_1E56DE608;
  aBlock[4] = self;
  void aBlock[5] = a2;
  id v7 = a3;
  id v8 = _Block_copy(aBlock);
  id v9 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Calling -[PKPeerPaymentService %@];", buf, 0xCu);
  }
  id v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PKPeerPaymentService_insertOrUpdatePeerPaymentPendingRequests_shouldScheduleNotifications___block_invoke_77;
  v12[3] = &unk_1E56D8AE0;
  void v12[4] = self;
  [v11 insertOrUpdatePeerPaymentPendingRequests:v7 shouldScheduleNotifications:v4 completion:v12];
}

void __93__PKPeerPaymentService_insertOrUpdatePeerPaymentPendingRequests_shouldScheduleNotifications___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_deletePeerPaymentPendingRequestsForRequestTokens___block_invoke;
  aBlock[3] = &unk_1E56DE608;
  aBlock[4] = self;
  void aBlock[5] = a2;
  id v4 = a3;
  id v5 = _Block_copy(aBlock);
  uint64_t v6 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKPeerPaymentService_deletePeerPaymentPendingRequestsForRequestTokens___block_invoke_78;
  v7[3] = &unk_1E56D8AE0;
  void v7[4] = self;
  [v6 deletePeerPaymentPendingRequestsForRequestTokens:v4 completion:v7];
}

void __73__PKPeerPaymentService_deletePeerPaymentPendingRequestsForRequestTokens___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccount
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentService_deletePeerPaymentPendingRequestsForPeerPaymentAccount__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  id v3 = _Block_copy(aBlock);
  int v4 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPeerPaymentService_deletePeerPaymentPendingRequestsForPeerPaymentAccount__block_invoke_79;
  v5[3] = &unk_1E56D8AE0;
  v5[4] = self;
  [v4 deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:v5];
}

void __77__PKPeerPaymentService_deletePeerPaymentPendingRequestsForPeerPaymentAccount__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)pendingRequestsChanged
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Calling -[PKPeerPaymentService %@];", (uint8_t *)&v6, 0xCu);
  }
  [(PKPeerPaymentService *)self _accessObserversWithHandler:&__block_literal_global_82_2];
}

void __46__PKPeerPaymentService_pendingRequestsChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 pendingRequestsChanged];
  }
}

- (void)recurringPaymentsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D89C8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 recurringPaymentsWithCompletion:v10];
}

void __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_85;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_85(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __56__PKPeerPaymentService_recurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v23 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = _Block_copy(aBlock);
  SEL v17 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_2;
  v19[3] = &unk_1E56F6C90;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 updateAutoReloadAmount:v15 threshold:v14 identifier:v13 completion:v19];
}

void __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_86;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_86(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __79__PKPeerPaymentService_updateAutoReloadAmount_threshold_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateRecurringPaymentsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56DD728;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updateRecurringPaymentsWithCompletion:v10];
}

void __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_88;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_88(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __62__PKPeerPaymentService_updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_2;
  v13[3] = &unk_1E56D83D8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 insertOrUpdateRecurringPayments:v9 completion:v13];
}

void __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_90;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_90(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __67__PKPeerPaymentService_insertOrUpdateRecurringPayments_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_2;
  v13[3] = &unk_1E56D83D8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteRecurringPaymentsForIdentifiers:v9 completion:v13];
}

void __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_91;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_91(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__PKPeerPaymentService_deleteRecurringPaymentsForIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D83D8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 deleteAllRecurringPaymentsWithCompletion:v10];
}

void __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_92;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_92(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65__PKPeerPaymentService_deleteAllRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performRecurringPaymentAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_2;
  v15[3] = &unk_1E56F6CB8;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 performRecurringPaymentAction:a3 identifier:v11 completion:v15];
}

void __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_93;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_93(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __76__PKPeerPaymentService_performRecurringPaymentAction_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v20 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_2;
  v16[3] = &unk_1E56F6C90;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 updateRecurringPaymentMemo:v12 identifier:v11 completion:v16];
}

void __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_95;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_95(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __73__PKPeerPaymentService_updateRecurringPaymentMemo_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_2;
  v15[3] = &unk_1E56F6C90;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 updateRecurringPaymentStatus:a3 identifier:v11 completion:v15];
}

void __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_96;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_96(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __75__PKPeerPaymentService_updateRecurringPaymentStatus_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recurringPaymentsChanged
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Calling -[PKPeerPaymentService %@];", (uint8_t *)&v6, 0xCu);
  }
  [(PKPeerPaymentService *)self _accessObserversWithHandler:&__block_literal_global_98];
}

void __48__PKPeerPaymentService_recurringPaymentsChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 recurringPaymentsChanged];
  }
}

- (BOOL)hasRecurringPayments
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(PKPeerPaymentService *)self _synchronousRemoteObjectProxyForSelector:a2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PKPeerPaymentService_hasRecurringPayments__block_invoke;
  v5[3] = &unk_1E56DC988;
  v5[4] = v2;
  void v5[5] = &v6;
  [v3 hasRecurringPayments:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__PKPeerPaymentService_hasRecurringPayments__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)encryptionCertificateForDestination:(unint64_t)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v18 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v17 = v10;
  id v11 = _Block_copy(aBlock);
  id v12 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_2;
  v14[3] = &unk_1E56F6CE0;
  void v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 encryptionCertificateForDestination:a3 forceUpdate:v5 completion:v14];
}

void __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_101;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_101(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __83__PKPeerPaymentService_encryptionCertificateForDestination_forceUpdate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)encryptData:(id)a3 usingCertificateWithDestination:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_2;
  v15[3] = &unk_1E56F6D08;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 encryptData:v11 usingCertificateWithDestination:a4 completion:v15];
}

void __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_103;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_103(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __79__PKPeerPaymentService_encryptData_usingCertificateWithDestination_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentSenderFlowWithHost:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v18 = v10;
  id v11 = a4;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_2;
  v15[3] = &unk_1E56D8798;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 presentSenderFlowWithHost:a3 userInfo:v11 completion:v15];
}

void __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_105;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_105(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __70__PKPeerPaymentService_presentSenderFlowWithHost_userInfo_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)presentReceiverFlowWithOrientation:(id)a3 host:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v19 = a2;
  id v10 = v9;
  aBlock[4] = self;
  id v18 = v10;
  id v11 = a3;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_2;
  v15[3] = &unk_1E56D8798;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 presentReceiverFlowWithOrientation:v11 host:a4 completion:v15];
}

void __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_106;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_106(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __75__PKPeerPaymentService_presentReceiverFlowWithOrientation_host_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6
{
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v23 = a2;
  id v12 = v11;
  aBlock[4] = self;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = _Block_copy(aBlock);
  id v17 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_2;
  v19[3] = &unk_1E56D8798;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:v15 memo:v14 counterpartAppearanceData:v13 completion:v19];
}

void __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_107;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_107(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __139__PKPeerPaymentService_insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier_memo_counterpartAppearanceData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:(id)a3 amount:(id)a4 currency:(id)a5 senderName:(id)a6 completion:(id)a7
{
  id v13 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v26 = a2;
  id v14 = v13;
  aBlock[4] = self;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  SEL v19 = _Block_copy(aBlock);
  id v20 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v19];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_2;
  v22[3] = &unk_1E56D8798;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier:v18 amount:v17 currency:v16 senderName:v15 completion:v22];
}

void __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_108;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_108(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __136__PKPeerPaymentService_insertOrUpdateNearbyPeerPaymentSetupNotificationWithTransactionIdentifier_amount_currency_senderName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)counterpartImageDataWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D89C8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 counterpartImageDataWithCompletion:v10];
}

void __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_109;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_109(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __59__PKPeerPaymentService_counterpartImageDataWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)counterpartImageDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F6D30;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 counterpartImageDataWithIdentifier:v9 completion:v13];
}

void __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_110;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_110(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __70__PKPeerPaymentService_counterpartImageDataWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)counterpartImageDataForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F6D30;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 counterpartImageDataForTransactionWithIdentifier:v9 completion:v13];
}

void __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_112;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  uint64_t v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_112(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __84__PKPeerPaymentService_counterpartImageDataForTransactionWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteAllCounterpartImageDataWithCompletion:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v14 = a2;
  id v6 = v5;
  aBlock[4] = self;
  id v13 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D83D8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 deleteAllCounterpartImageDataWithCompletion:v10];
}

void __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_113;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_113(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  int v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __68__PKPeerPaymentService_deleteAllCounterpartImageDataWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reportFailureDiagnostic:(id)a3 completion:(id)a4
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke;
  aBlock[3] = &unk_1E56D8590;
  SEL v17 = a2;
  id v8 = v7;
  aBlock[4] = self;
  id v16 = v8;
  id v9 = a3;
  id v10 = _Block_copy(aBlock);
  id v11 = [(PKPeerPaymentService *)self _remoteObjectProxyWithFailureHandler:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_2;
  v13[3] = &unk_1E56D8928;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 reportFailureDiagnostic:v9 completion:v13];
}

void __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  int v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_114;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v10 = __dispatch_async_ar_block_invoke_24;
  id v11 = &unk_1E56D8360;
  id v12 = v6;
  dispatch_async(v4, &buf);
}

uint64_t __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_114(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_24;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__PKPeerPaymentService_reportFailureDiagnostic_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end