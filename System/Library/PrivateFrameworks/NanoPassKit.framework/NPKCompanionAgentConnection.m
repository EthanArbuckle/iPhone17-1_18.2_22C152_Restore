@interface NPKCompanionAgentConnection
+ (BOOL)isSetupAssistantProvisioningSupported;
+ (id)watchPaymentWebService;
+ (id)watchPeerPaymentWebService;
+ (id)watchProvisioningURL;
+ (id)watchProvisioningURLForPaymentPasses:(id)a3;
- (BOOL)hasQueuedPaymentPasses;
- (BOOL)isIssuerAppProvisioningSupported;
- (BOOL)pairedWatchHasApplicationWithBundleID:(id)a3;
- (BOOL)queueAppropriateFailedActions;
- (BOOL)shouldShowWatchExtensionInstallationForPaymentPass:(id)a3;
- (NPKCompanionAgentConnection)init;
- (NPKCompanionAgentConnectionDelegate)delegate;
- (NSMutableDictionary)cachedPasses;
- (NSMutableDictionary)connectionAvailableActions;
- (NSMutableSet)cachedUniqueIDs;
- (PKPaymentWebServiceContext)connectionUnavailableWebServiceContext;
- (PKXPCService)remoteService;
- (id)_cachedPassForUniqueID:(id)a3;
- (id)_cachedUniqueIDs;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_installedCompanionApplicationBundleIDForPaymentPass:(id)a3;
- (id)_remoteObjectProxySynchronize:(BOOL)a3 withFailureHandler:(id)a4;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)peerPaymentAccountForDevice:(id)a3;
- (id)sharedPaymentWebServiceContext;
- (id)sharedPaymentWebServiceContextForDevice:(id)a3;
- (id)sharedPeerPaymentWebServiceContextForDevice:(id)a3;
- (id)watchPaymentWebService;
- (unint64_t)_isApplePaySupportedInCurrentRegion;
- (void)_addPassToCache:(id)a3;
- (void)_applyPropertiesToPass:(id)a3;
- (void)_clearCaches;
- (void)_handleDefaultCardChanged:(id)a3;
- (void)_handleServerPaymentPassesChanged:(id)a3;
- (void)_invalidateCachedPassWithUniqueID:(id)a3;
- (void)_removePassWithUniqueIDFromCache:(id)a3;
- (void)_savePaymentPass:(id)a3 atURL:(id)a4 forDevice:(id)a5 completion:(id)a6;
- (void)_setCachedUniqueIDs:(id)a3;
- (void)_shouldShowApplePaySettingsForTinkerWithCompletion:(id)a3;
- (void)_shouldShowApplePaySettingsWithCompletion:(id)a3;
- (void)balanceReminderForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)beginPairedWatchInstallationOfApplicationForPaymentPass:(id)a3 completion:(id)a4;
- (void)beginPairedWatchInstallationOfWalletWithCompletion:(id)a3;
- (void)beginProvisioningFromWatchOfferForPaymentPass:(id)a3 withCompletion:(id)a4;
- (void)beginProvisioningFromWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4;
- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)consistencyCheckWithCompletion:(id)a3;
- (void)countOfPassesSynchronous:(BOOL)a3 completion:(id)a4;
- (void)credentialedPassUniqueIDsSynchronous:(BOOL)a3 reply:(id)a4;
- (void)dealloc;
- (void)defaultCardUniqueID:(id)a3;
- (void)defaultPaymentApplicationForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)deletePaymentTransactionWithIdentifier:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (void)deviceIDSIdentifierSynchronous:(BOOL)a3 completion:(id)a4;
- (void)expressModeEnabledForPassIdentifier:(id)a3 completion:(id)a4;
- (void)fetchPendingTransactionForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)handleDeviceUnlockedForPendingProvisioningRequestFromGizmo;
- (void)handlePeerPaymentTermsAndConditionsRequestFromGizmo;
- (void)handlePendingUnpairingWithCompletion:(id)a3;
- (void)handlePendingiCloudSignoutWithCompletion:(id)a3;
- (void)hasActiveExternallySharedPasses:(id)a3;
- (void)hasActiveExternallySharedPassesWithCompletion:(id)a3;
- (void)initiateLostModeExitAuthWithCompletion:(id)a3;
- (void)markAllAppletsForDeletionWithCompletion:(id)a3;
- (void)markPendingTransactionAsProcessedForPassWithUniqueID:(id)a3;
- (void)noteForegroundVerificationObserverActive:(BOOL)a3;
- (void)noteProvisioningPreflightCompleteWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5;
- (void)noteWatchOfferShownForPaymentPass:(id)a3;
- (void)passesSynchronous:(BOOL)a3 completion:(id)a4;
- (void)paymentPassUniqueIDs:(id)a3;
- (void)paymentPassUniqueIDsSynchronous:(BOOL)a3 excludingDeactivated:(BOOL)a4 reply:(id)a5;
- (void)paymentPassUniqueIDsSynchronous:(BOOL)a3 reply:(id)a4;
- (void)paymentPassWithDeviceAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentPassWithPairedTerminalIdentifier:(id)a3 completion:(id)a4;
- (void)paymentPassWithUniqueID:(id)a3 reply:(id)a4;
- (void)paymentPassWithUniqueID:(id)a3 synchronous:(BOOL)a4 reply:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithBalances:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)paymentPassesWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4;
- (void)presentStandaloneTransaction:(int64_t)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)presentStandaloneTransaction:(int64_t)a3 forPassUniqueIdentifier:(id)a4 terminalReaderIdentifier:(id)a5 completion:(id)a6;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 policyIdentifier:(id)a4 targetDeviceIdentifier:(id)a5 credentialIdentifier:(id)a6 attestations:(id)a7 completion:(id)a8;
- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8;
- (void)provisionPassForAccountIdentifier:(id)a3 makeDefault:(BOOL)a4 completion:(id)a5;
- (void)provisionPassForRemoteCredentialWithType:(int64_t)a3 andIdentifier:(id)a4 completion:(id)a5;
- (void)redownloadAllPaymentPassesWithCompletion:(id)a3;
- (void)registerDeviceWithCompletion:(id)a3;
- (void)reloadPaymentPassesWithCompletion:(id)a3;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)removePaymentPassWithUniqueID:(id)a3 forDevice:(id)a4 waitForConfirmation:(BOOL)a5 completion:(id)a6;
- (void)savePaymentPass:(id)a3 forDevice:(id)a4 completion:(id)a5;
- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setCachedPasses:(id)a3;
- (void)setCachedUniqueIDs:(id)a3;
- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setConnectionAvailableActions:(id)a3;
- (void)setConnectionUnavailableWebServiceContext:(id)a3;
- (void)setDefaultCardUniqueID:(id)a3 completion:(id)a4;
- (void)setDefaultPaymentApplication:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHasQueuedPaymentPasses:(BOOL)a3;
- (void)setPeerPaymentAccount:(id)a3 forDevice:(id)a4;
- (void)setQueueAppropriateFailedActions:(BOOL)a3;
- (void)setRemoteService:(id)a3;
- (void)setSharedPaymentWebServiceContext:(id)a3 forDevice:(id)a4;
- (void)setSharedPeerPaymentWebServiceContext:(id)a3 forDevice:(id)a4;
- (void)shouldShowApplePaySettingsWithCompletion:(id)a3;
- (void)shouldShowWatchOfferForPaymentPass:(id)a3 withCompletion:(id)a4;
- (void)shouldShowWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4;
- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5;
- (void)trustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5;
- (void)updateCredentials:(id)a3 forUniqueID:(id)a4 completion:(id)a5;
- (void)updateSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4;
@end

@implementation NPKCompanionAgentConnection

void __59__NPKCompanionAgentConnection__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error on NPKCompanionAgentConnection connection: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) queueAppropriateFailedActions])
  {
    id v5 = +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler];
    uint64_t v2 = [v5 deferredSharedPaymentWebServiceContextForDevice:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (BOOL)queueAppropriateFailedActions
{
  return self->_queueAppropriateFailedActions;
}

uint64_t __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = NSStringFromBOOL();
      v6 = (void *)v5;
      unint64_t v7 = *(void *)(a1 + 40);
      if (v7 > 2) {
        int v8 = @"unknown";
      }
      else {
        int v8 = off_2644D8C08[v7];
      }
      int v10 = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Should show Apple Pay settings: %@ (supported in region %@)", (uint8_t *)&v10, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _isApplePaySupportedInCurrentRegion];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke_2;
  block[3] = &unk_2644D48B0;
  BOOL v6 = v2 != 2;
  uint64_t v5 = v2;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (unint64_t)_isApplePaySupportedInCurrentRegion
{
  BOOL v3 = NPKDeviceRegion();
  if (v3)
  {
    id v4 = NPKPairedOrPairingDevice();
    uint64_t v5 = [(NPKCompanionAgentConnection *)self sharedPaymentWebServiceContextForDevice:v4];

    if (v5)
    {
      BOOL v6 = [v5 configuration];
      unint64_t v7 = NPKSupportedRegionsForWebServiceConfiguration(v6);

      unint64_t v8 = PKStockholmSetupSupportedInRegion();
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)sharedPaymentWebServiceContextForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__24;
  v19 = __Block_byref_object_dispose__24;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke;
  v12[3] = &unk_2644D5BD0;
  v12[4] = self;
  uint64_t v14 = &v15;
  id v5 = v4;
  id v13 = v5;
  BOOL v6 = (void *)MEMORY[0x223C37380](v12);
  unint64_t v7 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:1 withFailureHandler:v6];
  unint64_t v8 = [v5 valueForProperty:*MEMORY[0x263F57620]];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke_2;
  v11[3] = &unk_2644D8890;
  v11[4] = self;
  v11[5] = &v15;
  [v7 sharedPaymentWebServiceContextForPairingID:v8 withCompletion:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)_remoteObjectProxySynchronize:(BOOL)a3 withFailureHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t v7 = [(NPKCompanionAgentConnection *)self remoteService];
  unint64_t v8 = [(NPKCompanionAgentConnection *)self _errorHandlerWithCompletion:v6];
  if (v4) {
    [v7 synchronousRemoteObjectProxyWithErrorHandler:v8];
  }
  else {
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v8];
  }

  if (!v9)
  {
    int v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      __int16 v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136446978;
        uint64_t v15 = "-[NPKCompanionAgentConnection _remoteObjectProxySynchronize:withFailureHandler:]";
        __int16 v16 = 2082;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
        __int16 v18 = 2048;
        uint64_t v19 = 1377;
        __int16 v20 = 1024;
        BOOL v21 = v4;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: -[NPKCompanionAgentConnection _remoteObjectProxySynchronise:withFailureHandler:] (synchronous:%d) would have returned nil)", (uint8_t *)&v14, 0x26u);
      }
    }
    _NPKAssertAbort();
  }

  return v9;
}

- (PKXPCService)remoteService
{
  return self->_remoteService;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__NPKCompanionAgentConnection__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_2644D2B90;
  id v9 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x223C37380](v8);
  id v6 = (void *)MEMORY[0x223C37380]();

  return v6;
}

- (void)shouldShowApplePaySettingsWithCompletion:(id)a3
{
  id v4 = a3;
  if (NPKPairedOrPairingDeviceCanProvisionSecureElementPasses()) {
    [(NPKCompanionAgentConnection *)self _shouldShowApplePaySettingsWithCompletion:v4];
  }
  else {
    [(NPKCompanionAgentConnection *)self _shouldShowApplePaySettingsForTinkerWithCompletion:v4];
  }
}

- (void)_shouldShowApplePaySettingsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_get_global_queue(25, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__NPKCompanionAgentConnection__shouldShowApplePaySettingsWithCompletion___block_invoke;
    v6[3] = &unk_2644D2E58;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection deallocating: %@", buf, 0xCu);
    }
  }
  id v6 = [MEMORY[0x263F087C8] defaultCenter];
  objc_msgSend(v6, "weak_removeObserver:", self);

  if (notify_is_valid_token(self->_notifyToken)) {
    notify_cancel(self->_notifyToken);
  }
  v7.receiver = self;
  v7.super_class = (Class)NPKCompanionAgentConnection;
  [(NPKCompanionAgentConnection *)&v7 dealloc];
}

- (NPKCompanionAgentConnection)init
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)NPKCompanionAgentConnection;
  uint64_t v2 = [(NPKCompanionAgentConnection *)&v22 init];
  if (v2)
  {
    id v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v2;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: New NPKCompanionAgentConnection created: %@", buf, 0xCu);
      }
    }
    id v6 = objc_alloc(MEMORY[0x263F5C2F0]);
    objc_super v7 = NPKCompanionServerProtocolInterface();
    unint64_t v8 = NPKCompanionClientProtocolInterface();
    uint64_t v9 = [v6 initWithMachServiceName:@"com.apple.NPKCompanionAgent.Server" remoteObjectInterface:v7 exportedObjectInterface:v8 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v9;

    [(PKXPCService *)v2->_remoteService setDelegate:v2];
    dispatch_queue_t v11 = dispatch_queue_create(0, 0);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    connectionAvailableActions = v2->_connectionAvailableActions;
    v2->_connectionAvailableActions = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263F087C8] defaultCenter];
    objc_msgSend(v15, "weak_addObserver:selector:name:object:", v2, sel__handleServerPaymentPassesChanged_, @"com.apple.NPKCompanionServer.PaymentPassesChanged", 0);

    v2->_notifyToken = -1;
    objc_initWeak((id *)buf, v2);
    __int16 v16 = (const char *)[@"com.apple.NPKCompanionServer.DefaultCardChanged" UTF8String];
    id v17 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __35__NPKCompanionAgentConnection_init__block_invoke;
    handler[3] = &unk_2644D2870;
    objc_copyWeak(&v21, (id *)buf);
    notify_register_dispatch(v16, &v2->_notifyToken, MEMORY[0x263EF83A0], handler);

    __int16 v18 = [MEMORY[0x263F087C8] defaultCenter];
    objc_msgSend(v18, "weak_addObserver:selector:name:object:", v2, sel__handleDefaultCardChanged_, @"com.apple.NPKCompanionServer.DefaultCardChanged", 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_connectionUnavailableWebServiceContext, 0);
  objc_storeStrong((id *)&self->_connectionAvailableActions, 0);
  objc_storeStrong((id *)&self->_cachedPasses, 0);
  objc_storeStrong((id *)&self->_cachedUniqueIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

+ (id)watchProvisioningURL
{
  return (id)[NSURL URLWithString:@"bridge:root=com.apple.NanoPassbookBridgeSettings&action=ADD_CARD"];
}

+ (id)watchProvisioningURLForPaymentPasses:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(NSString);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      id v6 = v4;
      do
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        objc_super v7 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        unint64_t v8 = [v7 passTypeIdentifier];
        uint64_t v9 = [v7 serialNumber];
        uint64_t v10 = (void *)MEMORY[0x263F089D8];
        dispatch_queue_t v11 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
        __int16 v12 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v11];
        uint64_t v13 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
        int v14 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v13];
        uint64_t v15 = [v10 stringWithFormat:@"&passTypeIdentifier=%@&passSerialNumber=%@", v12, v14];

        id v4 = [v6 stringByAppendingString:v15];

        ++v5;
        id v6 = v4;
      }
      while (v27 != v5);
      uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }

  __int16 v16 = NSString;
  id v17 = [a1 watchProvisioningURL];
  __int16 v18 = [v17 absoluteString];
  uint64_t v19 = [v16 stringWithFormat:@"%@%@", v18, v4];

  __int16 v20 = pk_General_log();
  LODWORD(v17) = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    id v21 = pk_General_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v19;
      _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: watchProvisioningURLForPaymentPasses returning URL: %@", buf, 0xCu);
    }
  }
  objc_super v22 = [NSURL URLWithString:v19];

  return v22;
}

+ (BOOL)isSetupAssistantProvisioningSupported
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = NPKPairedOrPairingDevice();
  id v3 = v2;
  if (v2)
  {
    if (NPKIsTinkerDevice(v2))
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"79770938-0C49-40BD-B593-4E04E7557E01"];
      LODWORD(v5) = [v3 supportsCapability:v4];
    }
    else
    {
      LODWORD(v5) = 1;
    }
    unint64_t v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      objc_super v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = v5;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: isSetupAssistantProvisioningSupported:%d", (uint8_t *)v11, 8u);
      }
LABEL_12:
    }
  }
  else
  {
    uint64_t v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    LOBYTE(v5) = 0;
    if (v6)
    {
      objc_super v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: isSetupAssistantProvisioningSupported:0. no pairing or paired device", (uint8_t *)v11, 2u);
      }
      LOBYTE(v5) = 0;
      goto LABEL_12;
    }
  }

  return (char)v5;
}

- (BOOL)isIssuerAppProvisioningSupported
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:1 withFailureHandler:0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__NPKCompanionAgentConnection_isIssuerAppProvisioningSupported__block_invoke;
  v5[3] = &unk_2644D85E0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 isIssuerAppProvisioningSupported:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __63__NPKCompanionAgentConnection_isIssuerAppProvisioningSupported__block_invoke(uint64_t a1, char a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Returning isIssuerAppProvisioningSupported %d", (uint8_t *)&v8, 0x12u);
    }
  }
}

+ (id)watchPaymentWebService
{
  if (watchPaymentWebService_onceToken != -1) {
    dispatch_once(&watchPaymentWebService_onceToken, &__block_literal_global_32);
  }
  uint64_t v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  [v2 loadWebService];
  id v3 = [v2 webService];

  return v3;
}

void __53__NPKCompanionAgentConnection_watchPaymentWebService__block_invoke()
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  v0 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v1 = [v3 addObserverForName:@"NPKSharedWebServiceActiveDeviceDidChangeNotification" object:0 queue:v0 usingBlock:&__block_literal_global_86];
  uint64_t v2 = (void *)watchPaymentWebService_notificationObserver;
  watchPaymentWebService_notificationObserver = v1;
}

void __53__NPKCompanionAgentConnection_watchPaymentWebService__block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"com.apple.NanoPassKit.NPKCompanionAgentConnection.ActiveWatchWebServiceChanged" object:0];
}

+ (id)watchPeerPaymentWebService
{
  uint64_t v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  [v2 loadWebService];
  id v3 = [v2 peerPaymentWebService];

  return v3;
}

void __35__NPKCompanionAgentConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDefaultCardChanged:0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PKXPCService *)self->_remoteService setForceConnectionOnResume:obj != 0];
    uint64_t v5 = obj;
    if (obj)
    {
      uint64_t v6 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
      [v6 connect];

      uint64_t v5 = obj;
    }
  }
}

- (void)_handleServerPaymentPassesChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v11 = self;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Server payment passes changed", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke;
  block[3] = &unk_2644D29A8;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(cacheQueue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _clearCaches];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke_2;
    block[3] = &unk_2644D2910;
    void block[4] = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __65__NPKCompanionAgentConnection__handleServerPaymentPassesChanged___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"com.apple.NanoPassKit.NPKCompanionAgentConnection.PassesChanged" object:*(void *)(a1 + 32)];
}

- (void)_handleDefaultCardChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v10 = self;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): default card changed", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NPKCompanionAgentConnection__handleDefaultCardChanged___block_invoke;
  block[3] = &unk_2644D29A8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __57__NPKCompanionAgentConnection__handleDefaultCardChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [MEMORY[0x263F08A00] defaultCenter];
    [v1 postNotificationName:@"com.apple.NanoPassKit.NPKCompanionAgentConnection.DefaultCardChanged" object:WeakRetained];
  }
}

- (void)shouldShowWatchOfferForPaymentPass:(id)a3 withCompletion:(id)a4
{
  v70[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F57730] sharedInstance];
  id v9 = [v8 getActivePairedDevice];
  if (!NPKIsAddToWatchSupportedForCompanionPaymentPass(v6)) {
    goto LABEL_20;
  }
  __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6C4614A2-1ECC-4405-9FEE-B5F0A5666961"];
  char v11 = [v9 supportsCapability:v10];

  if ((v11 & 1) == 0 && PKFelicaSecureElementIsAvailable())
  {
    uint64_t v12 = [MEMORY[0x263F5C1F8] secureElementIdentifiers];
    if ((unint64_t)[v12 count] <= 1)
    {
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F5C1F8] primarySecureElementIdentifier];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v70[0]) = 0;
      int v14 = [v6 devicePaymentApplications];
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke;
      v66[3] = &unk_2644D2EA8;
      id v15 = v13;
      id v67 = v15;
      v68 = buf;
      [v14 enumerateObjectsUsingBlock:v66];

      if (!*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        v23 = pk_Payment_log();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

        if (v24)
        {
          uint64_t v25 = pk_Payment_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v62 = 0;
            _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Card on Felica secure element cannot be transferred to non-Felica watch", v62, 2u);
          }
        }
        _Block_object_dispose(buf, 8);

        goto LABEL_19;
      }

      _Block_object_dispose(buf, 8);
    }
  }
  __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BA0452A1-075E-4E13-B48F-E36DF2F88980"];
  char v17 = [v9 supportsCapability:v16];

  if ((v17 & 1) != 0
    || ([v6 devicePrimaryPaymentApplication],
        __int16 v18 = objc_claimAutoreleasedReturnValue(),
        BOOL v19 = [v18 paymentType] == 1003,
        v18,
        !v19))
  {
    int v22 = 1;
    goto LABEL_21;
  }
  __int16 v20 = pk_Payment_log();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Unified access pass cannot be transferred to an unsupported watch", buf, 2u);
    }
LABEL_19:
  }
LABEL_20:
  int v22 = 0;
LABEL_21:
  uint64_t v26 = pk_Payment_log();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

  if (v27)
  {
    long long v28 = pk_Payment_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      long long v29 = [v6 uniqueID];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v70[0]) = v9 != 0;
      WORD2(v70[0]) = 1024;
      *(_DWORD *)((char *)v70 + 6) = v22;
      _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Request to determine if we should show the watch offer for %@ (have paired watch %d can be transferred %d)", buf, 0x22u);
    }
  }
  char v30 = v22 ^ 1;
  if (!v9) {
    char v30 = 1;
  }
  if (v30)
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_110;
    v39[3] = &unk_2644D2B10;
    id v40 = v7;
    uint64_t v35 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v39);
  }
  else
  {
    long long v31 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    v70[0] = 0;
    *(void *)v62 = 0;
    v63 = v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    char v61 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    char v59 = 0;
    dispatch_group_enter(v31);
    v32 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_107;
    block[3] = &unk_2644D42D8;
    v57 = buf;
    void block[4] = self;
    v33 = v31;
    v56 = v33;
    dispatch_async(v32, block);

    dispatch_group_enter(v33);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_2;
    v50[3] = &unk_2644D8640;
    v53 = v60;
    id v34 = v6;
    id v51 = v34;
    v54 = v62;
    uint64_t v35 = v33;
    v52 = v35;
    [(NPKCompanionAgentConnection *)self paymentPassUniqueIDsSynchronous:0 excludingDeactivated:1 reply:v50];
    v36 = [v34 pairedTerminalIdentifier];

    if (v36)
    {
      dispatch_group_enter(v35);
      v37 = [v34 pairedTerminalIdentifier];
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_3;
      v47[3] = &unk_2644D8668;
      v49 = v58;
      v48 = v35;
      [(NPKCompanionAgentConnection *)self paymentPassWithPairedTerminalIdentifier:v37 completion:v47];
    }
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_4;
    v41[3] = &unk_2644D8690;
    v43 = buf;
    v44 = v62;
    v45 = v60;
    v46 = v58;
    v41[4] = self;
    id v42 = v7;
    id v38 = v7;
    dispatch_group_notify(v35, MEMORY[0x263EF83A0], v41);

    _Block_object_dispose(v58, 8);
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(v62, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = [a2 secureElementIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_107(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _isApplePaySupportedInCurrentRegion];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (PKEnableDynamicSEAllocation())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    unint64_t v3 = [v10 count];
    unint64_t v4 = NPKMaxPaymentCards();
    if (v3) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    char v7 = !v5 && v3 >= v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  }
  id v8 = [*(id *)(a1 + 32) uniqueID];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) uniqueID];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 containsObject:v9];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_4(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    unint64_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
      if (v5 > 2) {
        int v6 = @"unknown";
      }
      else {
        int v6 = off_2644D8C08[v5];
      }
      int v7 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
      int v8 = *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24);
      int v9 = *(unsigned __int8 *)(*(void *)(a1[9] + 8) + 24);
      int v12 = 138413058;
      uint64_t v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      __int16 v16 = 1024;
      int v17 = v8;
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Should show watch offer: supported in region %@ hasPassOnWatchMatchingUniqueID %d hasMaximumPassesOnWatch %d hasPassOnWatchMatchingPairedTerminalIdentifier %d", (uint8_t *)&v12, 0x1Eu);
    }
  }
  BOOL v10 = *(void *)(*(void *)(a1[6] + 8) + 24) != 2
     && !*(unsigned char *)(*(void *)(a1[7] + 8) + 24)
     && !*(unsigned char *)(*(void *)(a1[9] + 8) + 24)
     && *(unsigned char *)(*(void *)(a1[8] + 8) + 24) == 0;
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v10);
  }
  return result;
}

uint64_t __81__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPass_withCompletion___block_invoke_110(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)shouldShowWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v13 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__24;
  v25[4] = __Block_byref_object_dispose__24;
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v7 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke;
        v18[3] = &unk_2644D85E0;
        uint64_t v20 = v25;
        int v19 = v7;
        [(NPKCompanionAgentConnection *)self shouldShowWatchOfferForPaymentPass:v11 withCompletion:v18];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke_2;
  block[3] = &unk_2644D86B8;
  id v16 = v13;
  int v17 = v25;
  id v12 = v13;
  dispatch_group_notify(v7, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v25, 8);
}

void __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  unint64_t v4 = [NSNumber numberWithBool:a2];
  [v3 addObject:v4];

  unint64_t v5 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v5);
}

uint64_t __83__NPKCompanionAgentConnection_shouldShowWatchOfferForPaymentPasses_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)noteWatchOfferShownForPaymentPass:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 uniqueID];
      int v11 = 138412546;
      id v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Note watch offer shown for %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v9 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
  uint64_t v10 = [v4 uniqueID];
  [v9 noteWatchOfferDisplayedForPaymentPassWithUniqueID:v10];
}

- (void)beginProvisioningFromWatchOfferForPaymentPass:(id)a3 withCompletion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  BOOL v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

  -[NPKCompanionAgentConnection beginProvisioningFromWatchOfferForPaymentPasses:withCompletion:](self, "beginProvisioningFromWatchOfferForPaymentPasses:withCompletion:", v9, v7, v10, v11);
}

- (void)beginProvisioningFromWatchOfferForPaymentPasses:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting that provisioning begin from watch offer for passes %@", buf, 0x16u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v11 = v7;
  id v17 = v11;
  id v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke_2;
  v14[3] = &unk_2644D4128;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 beginProvisioningFromWatchOfferForPaymentPasses:v6 withCompletion:v14];
}

void __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __94__NPKCompanionAgentConnection_beginProvisioningFromWatchOfferForPaymentPasses_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handleDeviceUnlockedForPendingProvisioningRequestFromGizmo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    unint64_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): (account-pass-provisioning) handleDeviceUnlockedForPendingProvisioningRequestFromGizmo", (uint8_t *)&v7, 0xCu);
    }
  }
  id v6 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
  [v6 handleDeviceUnlockedForPendingProvisioningRequestFromGizmo];
}

- (void)provisionPassForAccountIdentifier:(id)a3 makeDefault:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"NO";
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      if (v6) {
        id v13 = @"YES";
      }
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (account-pass-provisioning) (%@): provisionPassForAccountIdentifier %@ makeDefault %@", buf, 0x20u);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke;
  v19[3] = &unk_2644D2B10;
  id v14 = v9;
  id v20 = v14;
  id v15 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke_2;
  v17[3] = &unk_2644D4128;
  v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  [v15 provisionPassForAccountIdentifier:v8 makeDefault:v6 completion:v17];
}

void __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __88__NPKCompanionAgentConnection_provisionPassForAccountIdentifier_makeDefault_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provisionPassForRemoteCredentialWithType:(int64_t)a3 andIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = self;
      __int16 v22 = 2048;
      int64_t v23 = a3;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (apple-balance-pass-provisioning) (%@): provisionPassForRemoteCredentialType %ld identifier: %@", buf, 0x20u);
    }
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke;
  v18[3] = &unk_2644D2B10;
  id v13 = v9;
  id v19 = v13;
  id v14 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke_2;
  v16[3] = &unk_2644D4128;
  void v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 provisionPassForRemoteCredentialWithType:a3 andIdentifier:v8 completion:v16];
}

void __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __97__NPKCompanionAgentConnection_provisionPassForRemoteCredentialWithType_andIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)registerDeviceWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting registration of paired device", buf, 0xCu);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke;
  v13[3] = &unk_2644D2B10;
  id v8 = v4;
  id v14 = v8;
  id v9 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke_2;
  v11[3] = &unk_2644D86E0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 registerDeviceWithCompletion:v11];
}

void __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PKDisplayableErrorForCommonType();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

uint64_t __60__NPKCompanionAgentConnection_registerDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)noteProvisioningPreflightCompleteWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = self;
      __int16 v19 = 1024;
      BOOL v20 = v6;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Note provisioning preflight complete with success %d error %@", buf, 0x1Cu);
    }
  }
  id v13 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__NPKCompanionAgentConnection_noteProvisioningPreflightCompleteWithSuccess_error_completion___block_invoke;
  v15[3] = &unk_2644D3FF0;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  [v13 noteProvisioningPreflightCompleteWithSuccess:v6 error:v8 completion:v15];
}

uint64_t __93__NPKCompanionAgentConnection_noteProvisioningPreflightCompleteWithSuccess_error_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentPassUniqueIDs:(id)a3
{
}

- (void)paymentPassWithUniqueID:(id)a3 reply:(id)a4
{
}

- (void)paymentPassUniqueIDsSynchronous:(BOOL)a3 reply:(id)a4
{
}

- (void)paymentPassUniqueIDsSynchronous:(BOOL)a3 excludingDeactivated:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Client requested payment pass unique IDs synchronous:%d", buf, 0x12u);
    }
  }
  if (v8)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke;
    v29[3] = &unk_2644D8708;
    BOOL v31 = v6;
    v29[4] = self;
    id v30 = v8;
    id v12 = (void (**)(void, void))MEMORY[0x223C37380](v29);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v35 = __Block_byref_object_copy__24;
    v36 = __Block_byref_object_dispose__24;
    id v37 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_123;
    block[3] = &unk_2644D2960;
    void block[4] = self;
    void block[5] = buf;
    dispatch_sync(cacheQueue, block);
    if (!*(void *)(*(void *)&buf[8] + 40) || v5)
    {
      uint64_t v17 = pk_Payment_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        __int16 v19 = pk_Payment_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 138412290;
          v33 = self;
          _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): No cached unique IDs available; requesting from daemon",
            v32,
            0xCu);
        }
      }
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_124;
      v25[3] = &unk_2644D3680;
      v25[4] = self;
      BOOL v20 = v12;
      id v26 = v20;
      BOOL v27 = v5;
      __int16 v21 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:v6 withFailureHandler:v25];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_2;
      v22[3] = &unk_2644D8708;
      BOOL v24 = v5;
      v22[4] = self;
      uint64_t v23 = v20;
      [v21 paymentPassUniqueIDsExcludingDeactivated:v5 reply:v22];
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
          *(_DWORD *)v32 = 138412290;
          v33 = self;
          _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): found cached unique IDs", v32, 0xCu);
        }
      }
      v12[2](v12, *(void *)(*(void *)&buf[8] + 40));
    }
    _Block_object_dispose(buf, 8);
  }
}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v7;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_122;
    block[3] = &unk_2644D3388;
    void block[4] = *(void *)(a1 + 32);
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
}

uint64_t __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_122(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_123(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedUniqueIDs];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_124(uint64_t a1)
{
  if ([*(id *)(a1 + 32) queueAppropriateFailedActions])
  {
    id v6 = +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler];
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = NPKPairedOrPairingDevice();
    id v4 = [v6 deferredPaymentPassUniqueIDsForDevice:v3 excludingDeactivated:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x263EFFA08] set];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

void __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = v3;
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_3;
    v10[3] = &unk_2644D2E08;
    v10[4] = v8;
    id v11 = v3;
    dispatch_async(v9, v10);
  }
  (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, v4, v5, v6);
}

uint64_t __90__NPKCompanionAgentConnection_paymentPassUniqueIDsSynchronous_excludingDeactivated_reply___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCachedUniqueIDs:*(void *)(a1 + 40)];
}

- (void)paymentPassWithUniqueID:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v44) = v6;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment pass with unique ID: %@ synchronous: %d", buf, 0x1Cu);
    }
  }
  if (v9)
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke;
    v36[3] = &unk_2644D8730;
    BOOL v38 = v6;
    v36[4] = self;
    id v37 = v9;
    uint64_t v13 = MEMORY[0x223C37380](v36);
    __int16 v14 = (void (**)(void, void))v13;
    if (v8)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v44 = __Block_byref_object_copy__24;
      v45 = __Block_byref_object_dispose__24;
      id v46 = 0;
      cacheQueue = self->_cacheQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_128;
      block[3] = &unk_2644D42D8;
      uint64_t v35 = buf;
      void block[4] = self;
      id v16 = v8;
      id v34 = v16;
      dispatch_sync(cacheQueue, block);
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        uint64_t v17 = pk_Payment_log();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (v18)
        {
          __int16 v19 = pk_Payment_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v39 = 138412546;
            id v40 = self;
            __int16 v41 = 2112;
            uint64_t v42 = v20;
            _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): found cached payment pass: %@", v39, 0x16u);
          }
        }
        v14[2](v14, *(void *)(*(void *)&buf[8] + 40));
      }
      else
      {
        __int16 v21 = pk_Payment_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

        if (v22)
        {
          uint64_t v23 = pk_Payment_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v39 = 138412290;
            id v40 = self;
            _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): No cached payment pass available; requesting from daemon",
              v39,
              0xCu);
          }
        }
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_129;
        v30[3] = &unk_2644D7D30;
        v30[4] = self;
        BOOL v24 = v14;
        id v32 = v24;
        id v25 = v16;
        id v31 = v25;
        id v26 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:v6 withFailureHandler:v30];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_2;
        v27[3] = &unk_2644D8758;
        v27[4] = self;
        id v28 = v25;
        long long v29 = v24;
        [v26 paymentPassWithUniqueID:v28 reply:v27];
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v7;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with payment pass: %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_127;
    block[3] = &unk_2644D3388;
    void block[4] = *(void *)(a1 + 32);
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
}

uint64_t __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_127(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    uint64_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with payment pass: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_128(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedPassForUniqueID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_129(uint64_t a1)
{
  if ([*(id *)(a1 + 32) queueAppropriateFailedActions])
  {
    id v8 = +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler];
    uint64_t v4 = a1 + 40;
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(v4 + 8);
    uint64_t v5 = NPKPairedOrPairingDevice();
    uint64_t v6 = [v8 deferredPaymentPassWithUniqueID:v2 forDevice:v5];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);
  }
  else
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) _applyPropertiesToPass:v3];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_3;
  block[3] = &unk_2644D31B0;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v7;
  dispatch_async(v4, block);
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    __int16 v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Newly-fetched payment pass: %@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __73__NPKCompanionAgentConnection_paymentPassWithUniqueID_synchronous_reply___block_invoke_3(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "_addPassToCache:");
  }
  else {
    return [v2 _removePassWithUniqueIDFromCache:a1[6]];
  }
}

- (void)paymentPassesWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    __int16 v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment passes with FPANID %@", buf, 0x16u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_2644D8780;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 paymentPassesWithPrimaryAccountIdentifier:v6 completion:v14];
}

uint64_t __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __84__NPKCompanionAgentConnection_paymentPassesWithPrimaryAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentPassWithDeviceAccountIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    __int16 v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment pass with DPANID %@", buf, 0x16u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_2644D79A0;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 paymentPassWithDeviceAccountIdentifier:v6 completion:v14];
}

uint64_t __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __81__NPKCompanionAgentConnection_paymentPassWithDeviceAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)paymentPassWithPairedTerminalIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    __int16 v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting payment pass with paired terminal identifier %@", buf, 0x16u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke_2;
  v14[3] = &unk_2644D79A0;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 paymentPassWithPairedTerminalIdentifier:v6 completion:v14];
}

uint64_t __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __82__NPKCompanionAgentConnection_paymentPassWithPairedTerminalIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)credentialedPassUniqueIDsSynchronous:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = @"NO";
      if (v4) {
        __int16 v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting credentialed pass unique identifiers. synchronous: %@", buf, 0x16u);
    }
  }
  if (v6)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke;
    v19[3] = &unk_2644D8708;
    BOOL v21 = v4;
    void v19[4] = self;
    id v20 = v6;
    id v11 = (void *)MEMORY[0x223C37380](v19);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_131;
    v17[3] = &unk_2644D2B10;
    id v12 = v11;
    id v18 = v12;
    id v13 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:v4 withFailureHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_2;
    v15[3] = &unk_2644D8780;
    v15[4] = self;
    id v16 = v12;
    id v14 = v12;
    [v13 credentialedPassUniqueIDsWithReply:v15];
  }
}

void __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v7;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_130;
    block[3] = &unk_2644D3388;
    void block[4] = *(void *)(a1 + 32);
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
}

uint64_t __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_130(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Reply with unique IDs: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_131(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __74__NPKCompanionAgentConnection_credentialedPassUniqueIDsSynchronous_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)savePaymentPass:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [v8 uniqueID];
      *(_DWORD *)buf = 138412546;
      uint64_t v47 = self;
      __int16 v48 = 2112;
      v49 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting save of payment pass with unique ID %@", buf, 0x16u);
    }
  }
  if (!v10) {
    id v10 = &__block_literal_global_133;
  }
  id v15 = [v8 dataAccessor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v17 = pk_General_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      id v19 = pk_General_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v8 dataAccessor];
        *(_DWORD *)buf = 136447234;
        uint64_t v47 = (NPKCompanionAgentConnection *)"-[NPKCompanionAgentConnection savePaymentPass:forDevice:completion:]";
        __int16 v48 = 2082;
        v49 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
        __int16 v50 = 2048;
        uint64_t v51 = 588;
        __int16 v52 = 2112;
        id v53 = v8;
        __int16 v54 = 2112;
        v55 = v20;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ has data accessor %@)", buf, 0x34u);
      }
    }
    _NPKAssertAbort();
  }
  BOOL v21 = [v8 dataAccessor];
  uint64_t v22 = [v21 fileURL];

  if (!v22)
  {
    uint64_t v23 = pk_General_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      id v25 = pk_General_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [v8 uniqueID];
        *(_DWORD *)buf = 136446978;
        uint64_t v47 = (NPKCompanionAgentConnection *)"-[NPKCompanionAgentConnection savePaymentPass:forDevice:completion:]";
        __int16 v48 = 2082;
        v49 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
        __int16 v50 = 2048;
        uint64_t v51 = 591;
        __int16 v52 = 2112;
        id v53 = v26;
        _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ had nil file URL)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  BOOL v27 = [v8 uniqueID];
  if (!v27)
  {
    id v28 = [v8 passTypeIdentifier];
    long long v29 = [v8 serialNumber];
    BOOL v27 = PKGeneratePassUniqueID();

    if (!v27)
    {
      id v30 = pk_General_log();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (v31)
      {
        id v32 = pk_General_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          uint64_t v47 = (NPKCompanionAgentConnection *)"-[NPKCompanionAgentConnection savePaymentPass:forDevice:completion:]";
          __int16 v48 = 2082;
          v49 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKCompanionAgentConnection.m";
          __int16 v50 = 2048;
          uint64_t v51 = 597;
          __int16 v52 = 2112;
          id v53 = 0;
          _os_log_impl(&dword_21E92F000, v32, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ had nil uniqueID)", buf, 0x2Au);
        }
      }
      _NPKAssertAbort();
    }
  }
  v33 = NPKTemporaryFileURL(*MEMORY[0x263F5C7F0], 1);
  if (NPKCopyFileAtURL(v22, v33))
  {
    id v34 = [v8 paymentPass];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_136;
    v38[3] = &unk_2644D87C8;
    id v39 = v9;
    id v40 = self;
    id v41 = v27;
    id v42 = v8;
    v43 = v22;
    id v44 = v33;
    id v45 = v10;
    [(NPKCompanionAgentConnection *)self _savePaymentPass:v34 atURL:v44 forDevice:v39 completion:v38];
  }
  else
  {
    uint64_t v35 = pk_Payment_log();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

    if (v36)
    {
      id v37 = pk_Payment_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v47 = v22;
        __int16 v48 = 2112;
        v49 = (const char *)v33;
        _os_log_impl(&dword_21E92F000, v37, OS_LOG_TYPE_ERROR, "Error: Unable to copy file from %@ to %@", buf, 0x16u);
      }
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_136(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F57620];
  uint64_t v5 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F57620]];
  uint64_t v6 = NPKPairedOrPairingDevice();
  uint64_t v7 = [v6 valueForProperty:v4];
  int v8 = [v5 isEqual:v7];

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_2;
  block[3] = &unk_2644D3E88;
  void block[4] = v9;
  id v21 = *(id *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  char v23 = v8;
  char v24 = a2;
  dispatch_sync(v10, block);
  if (a2)
  {
    uint64_t v11 = pk_Payment_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      uint64_t v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v14;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Success, deleting temporary pass file %@", buf, 0xCu);
      }
    }
    NPKDeleteFileAtURL(*(void **)(a1 + 72));
  }
  uint64_t v15 = *(void *)(a1 + 80);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, a2);
  }
  if (v8)
  {
    uint64_t v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      BOOL v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: For current device; posting notification",
          buf,
          2u);
      }
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_138;
    v19[3] = &unk_2644D2910;
    void v19[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v19);
  }
}

void __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _cachedPassForUniqueID:*(void *)(a1 + 40)];
  if (!v7 || ([v7 ingestedDate], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v2 = [MEMORY[0x263EFF910] date];
  }
  [*(id *)(a1 + 48) setIngestedDate:v2];
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 48) paymentPass];
    [v3 _addPassToCache:v4];

    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 48) paymentPass];
      [v5 _applyPropertiesToPass:v6];
    }
  }
}

void __68__NPKCompanionAgentConnection_savePaymentPass_forDevice_completion___block_invoke_138(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"com.apple.NanoPassKit.NPKCompanionAgentConnection.PassesChanged" object:*(void *)(a1 + 32)];
}

- (void)removePaymentPassWithUniqueID:(id)a3 forDevice:(id)a4 waitForConfirmation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    uint64_t v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Request to remove payment pass with unique ID %@", buf, 0xCu);
    }
  }
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  char v24 = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke;
  id v25 = &unk_2644D8818;
  uint64_t v26 = self;
  id v27 = v11;
  id v28 = v10;
  id v29 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  id v19 = (void *)MEMORY[0x223C37380](&v22);
  id v20 = -[NPKCompanionAgentConnection _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", 0, v22, v23, v24, v25, v26);
  id v21 = [v18 valueForProperty:*MEMORY[0x263F57620]];
  [v20 removePaymentPassWithUniqueID:v17 forPairingID:v21 waitForConfirmation:v7 completion:v19];
}

void __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_2;
    block[3] = &unk_2644D87F0;
    BOOL v7 = (id *)v16;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    v16[0] = v8;
    v16[1] = v9;
    id v17 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    char v20 = a2;
    id v18 = v5;
    dispatch_async(v6, block);

    id v10 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (*(void *)(a1 + 56))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_5;
    v11[3] = &unk_2644D3028;
    BOOL v7 = &v13;
    id v13 = *(id *)(a1 + 56);
    char v14 = 0;
    id v12 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v11);
    id v10 = v12;
    goto LABEL_5;
  }
LABEL_6:
}

void __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263F57620];
  BOOL v3 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F57620]];
  uint64_t v4 = NPKPairedOrPairingDevice();
  id v5 = [v4 valueForProperty:v2];
  int v6 = [v3 isEqual:v5];

  if (v6)
  {
    [*(id *)(a1 + 40) _removePassWithUniqueIDFromCache:*(void *)(a1 + 48)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_3;
    block[3] = &unk_2644D82F8;
    void block[4] = *(void *)(a1 + 40);
    id v14 = *(id *)(a1 + 64);
    char v15 = *(unsigned char *)(a1 + 72);
    id v13 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], block);

    BOOL v7 = v14;
  }
  else
  {
    if (!*(void *)(a1 + 64)) {
      return;
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_4;
    v8[3] = &unk_2644D3028;
    id v10 = *(id *)(a1 + 64);
    char v11 = *(unsigned char *)(a1 + 72);
    id v9 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], v8);

    BOOL v7 = v10;
  }
}

uint64_t __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"com.apple.NanoPassKit.NPKCompanionAgentConnection.PassesChanged" object:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __102__NPKCompanionAgentConnection_removePaymentPassWithUniqueID_forDevice_waitForConfirmation_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setDefaultCardUniqueID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Request to set default card with unique ID %@", buf, 0x16u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v11 = v7;
  id v17 = v11;
  id v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke_2;
  v14[3] = &unk_2644D2B68;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 setDefaultCard:v6 completion:v14];
}

uint64_t __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __65__NPKCompanionAgentConnection_setDefaultCardUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)defaultCardUniqueID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Fetching default card unique ID", buf, 0xCu);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke;
  v13[3] = &unk_2644D2B10;
  id v8 = v4;
  id v14 = v8;
  BOOL v9 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke_2;
  v11[3] = &unk_2644D8840;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 defaultCard:v11];
}

uint64_t __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __51__NPKCompanionAgentConnection_defaultCardUniqueID___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = pk_Payment_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = self;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Checking if pass will automatically become default %@", buf, 0x16u);
      }
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke;
    v15[3] = &unk_2644D2B10;
    id v11 = v7;
    id v16 = v11;
    id v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:1 withFailureHandler:v15];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke_2;
    v13[3] = &unk_2644D2B68;
    void v13[4] = self;
    id v14 = v11;
    [v12 willPassWithUniqueIdentifierAutomaticallyBecomeDefault:v6 completion:v13];
  }
}

uint64_t __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__NPKCompanionAgentConnection_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)defaultPaymentApplicationForPassWithUniqueID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Fetching default payment application for pass with unique ID %@", buf, 0x16u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v11 = v7;
  id v17 = v11;
  id v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke_2;
  v14[3] = &unk_2644D8868;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 defaultPaymentApplicationForPassWithUniqueID:v6 completion:v14];
}

uint64_t __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __87__NPKCompanionAgentConnection_defaultPaymentApplicationForPassWithUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
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
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Setting default payment application for unique ID %@: %@", buf, 0x20u);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke;
  v19[3] = &unk_2644D2B10;
  id v14 = v10;
  id v20 = v14;
  id v15 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke_2;
  v17[3] = &unk_2644D79A0;
  void v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  [v15 setDefaultPaymentApplication:v8 forPassWithUniqueID:v9 completion:v17];
}

uint64_t __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __91__NPKCompanionAgentConnection_setDefaultPaymentApplication_forPassWithUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)consistencyCheckWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting consistency check", buf, 0xCu);
    }
  }
  id v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__NPKCompanionAgentConnection_consistencyCheckWithCompletion___block_invoke;
  v10[3] = &unk_2644D3FF0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 initiateConsistencyCheckWithCompletion:v10];
}

uint64_t __62__NPKCompanionAgentConnection_consistencyCheckWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)redownloadAllPaymentPassesWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Requesting redownload all payment passes", buf, 0xCu);
    }
  }
  id v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__NPKCompanionAgentConnection_redownloadAllPaymentPassesWithCompletion___block_invoke;
  v10[3] = &unk_2644D3FF0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 redownloadAllPaymentPassesWithCompletion:v10];
}

uint64_t __72__NPKCompanionAgentConnection_redownloadAllPaymentPassesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handlePendingUnpairingWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Sending pending unpairing request", buf, 0xCu);
    }
  }
  id v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__NPKCompanionAgentConnection_handlePendingUnpairingWithCompletion___block_invoke;
  v10[3] = &unk_2644D3FF0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 handlePendingUnpairingWithCompletion:v10];
}

uint64_t __68__NPKCompanionAgentConnection_handlePendingUnpairingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handlePendingiCloudSignoutWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Sending pending iCloud signout request", buf, 0xCu);
    }
  }
  id v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__NPKCompanionAgentConnection_handlePendingiCloudSignoutWithCompletion___block_invoke;
  v10[3] = &unk_2644D3FF0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 handlePendingiCloudSignoutWithCompletion:v10];
}

uint64_t __72__NPKCompanionAgentConnection_handlePendingiCloudSignoutWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handlePeerPaymentTermsAndConditionsRequestFromGizmo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): handlePeerPaymentTermsAndConditionsRequestFromGizmo", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v6 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
  [v6 handlePeerPaymentTermsAndConditionsRequestFromGizmo];
}

void __71__NPKCompanionAgentConnection_sharedPaymentWebServiceContextForDevice___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)sharedPaymentWebServiceContext
{
  BOOL v3 = NPKPairedOrPairingDevice();
  BOOL v4 = [(NPKCompanionAgentConnection *)self sharedPaymentWebServiceContextForDevice:v3];

  return v4;
}

- (void)setSharedPaymentWebServiceContext:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke;
  v20[3] = &unk_2644D2910;
  dispatch_semaphore_t v21 = v8;
  uint64_t v9 = v8;
  id v10 = (void *)MEMORY[0x223C37380](v20);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_2;
  v16[3] = &unk_2644D3540;
  void v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v19 = v10;
  id v11 = v10;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  id v15 = [v12 valueForProperty:*MEMORY[0x263F57620]];
  [v14 setSharedPaymentWebServiceContext:v13 forPairingID:v15 completion:v11];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) queueAppropriateFailedActions])
  {
    id v5 = +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler];
    [v5 setDeferredSharedPaymentWebServiceContext:*(void *)(a1 + 40) forDevice:*(void *)(a1 + 48)];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_3;
    v7[3] = &unk_2644D88B8;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v5 performActionWhenCompanionAgentIsAvailable:v7 forDevice:*(void *)(a1 + 48)];
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v2, v3, v4);
}

uint64_t __75__NPKCompanionAgentConnection_setSharedPaymentWebServiceContext_forDevice___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setSharedPaymentWebServiceContext:*(void *)(a1 + 32) forDevice:*(void *)(a1 + 40)];
}

- (void)setSharedPeerPaymentWebServiceContext:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__NPKCompanionAgentConnection_setSharedPeerPaymentWebServiceContext_forDevice___block_invoke;
  v13[3] = &unk_2644D2910;
  dispatch_semaphore_t v14 = v8;
  id v9 = v8;
  id v10 = (void *)MEMORY[0x223C37380](v13);
  id v11 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v10];
  id v12 = [v6 valueForProperty:*MEMORY[0x263F57620]];

  [v11 setSharedPeerPaymentWebServiceContext:v7 forPairingID:v12 completion:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __79__NPKCompanionAgentConnection_setSharedPeerPaymentWebServiceContext_forDevice___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)sharedPeerPaymentWebServiceContextForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  dispatch_semaphore_t v21 = __Block_byref_object_copy__24;
  uint64_t v22 = __Block_byref_object_dispose__24;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke;
  v15[3] = &unk_2644D88E0;
  id v17 = &v18;
  id v6 = v5;
  id v16 = v6;
  id v7 = (void *)MEMORY[0x223C37380](v15);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke_2;
  v13[3] = &unk_2644D2B10;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v13];
  id v10 = [v4 valueForProperty:*MEMORY[0x263F57620]];
  [v9 sharedPeerPaymentWebServiceContextForPairingID:v10 withCompletion:v8];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __75__NPKCompanionAgentConnection_sharedPeerPaymentWebServiceContextForDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPeerPaymentAccount:(id)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__NPKCompanionAgentConnection_setPeerPaymentAccount_forDevice___block_invoke;
  v13[3] = &unk_2644D2910;
  dispatch_semaphore_t v14 = v8;
  id v9 = v8;
  id v10 = (void *)MEMORY[0x223C37380](v13);
  id v11 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v10];
  id v12 = [v6 valueForProperty:*MEMORY[0x263F57620]];

  [v11 setPeerPaymentAccount:v7 forPairingID:v12 completion:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __63__NPKCompanionAgentConnection_setPeerPaymentAccount_forDevice___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)peerPaymentAccountForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  dispatch_semaphore_t v21 = __Block_byref_object_copy__24;
  uint64_t v22 = __Block_byref_object_dispose__24;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke;
  v15[3] = &unk_2644D8908;
  id v17 = &v18;
  id v6 = v5;
  id v16 = v6;
  id v7 = (void *)MEMORY[0x223C37380](v15);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke_2;
  v13[3] = &unk_2644D2B10;
  id v8 = v7;
  id v14 = v8;
  id v9 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v13];
  id v10 = [v4 valueForProperty:*MEMORY[0x263F57620]];
  [v9 peerPaymentAccountForPairingID:v10 withCompletion:v8];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__NPKCompanionAgentConnection_peerPaymentAccountForDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)watchPaymentWebService
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 watchPaymentWebService];
}

- (void)updateSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
  [v7 updateSettings:a3 forPassWithUniqueID:v6];
}

- (void)countOfPassesSynchronous:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke;
  v12[3] = &unk_2644D2E58;
  v12[4] = self;
  id v7 = v6;
  id v13 = v7;
  id v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:v4 withFailureHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke_145;
  v10[3] = &unk_2644D8930;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 countOfPassesWithCompletion:v10];
}

uint64_t __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: NPKCompanionAgentConnection (%@): failed to fetch count of passes.", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __67__NPKCompanionAgentConnection_countOfPassesSynchronous_completion___block_invoke_145(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)passesSynchronous:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke;
  v12[3] = &unk_2644D2E58;
  v12[4] = self;
  id v7 = v6;
  id v13 = v7;
  uint64_t v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:v4 withFailureHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke_147;
  v10[3] = &unk_2644D30A0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 passesWithCompletion:v10];
}

uint64_t __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: NPKCompanionAgentConnection (%@): failed to fetch passes.", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __60__NPKCompanionAgentConnection_passesSynchronous_completion___block_invoke_147(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deviceIDSIdentifierSynchronous:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke;
  v12[3] = &unk_2644D2E58;
  v12[4] = self;
  id v7 = v6;
  id v13 = v7;
  uint64_t v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:v4 withFailureHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke_149;
  v10[3] = &unk_2644D8840;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 deviceIDSIdentifierWithCompletion:v10];
}

uint64_t __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: NPKCompanionAgentConnection (%@): failed to fetch device IDS identifier.", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __73__NPKCompanionAgentConnection_deviceIDSIdentifierSynchronous_completion___block_invoke_149(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)initiateLostModeExitAuthWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__NPKCompanionAgentConnection_initiateLostModeExitAuthWithCompletion___block_invoke;
  v7[3] = &unk_2644D5828;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 initiateLostModeExitAuthWithCompletion:v7];
}

uint64_t __70__NPKCompanionAgentConnection_initiateLostModeExitAuthWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)markAllAppletsForDeletionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPKCompanionAgentConnection *)self remoteService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke;
  v11[3] = &unk_2644D2B90;
  id v6 = v4;
  id v12 = v6;
  int v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke_2;
  v9[3] = &unk_2644D4128;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 markAllAppletsForDeletionWithCompletion:v9];
}

uint64_t __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __71__NPKCompanionAgentConnection_markAllAppletsForDeletionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a10;
  objc_initWeak(&location, self);
  id v19 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke;
  block[3] = &unk_2644D8958;
  objc_copyWeak(v31, &location);
  id v29 = self;
  id v30 = v18;
  v31[1] = (id)a4;
  v31[2] = (id)a5;
  id v26 = v15;
  id v27 = v16;
  v31[3] = (id)a8;
  v31[4] = (id)a9;
  id v28 = v17;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v18;
  dispatch_async(v19, block);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

void __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v2 = [WeakRetained remoteService];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2;
  v15[3] = &unk_2644D2B90;
  id v16 = *(id *)(a1 + 64);
  BOOL v3 = [v2 remoteObjectProxyWithErrorHandler:v15];

  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 96);
  uint64_t v10 = *(void *)(a1 + 104);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3;
  v13[3] = &unk_2644D8780;
  id v11 = *(id *)(a1 + 64);
  void v13[4] = *(void *)(a1 + 56);
  id v14 = v11;
  [v3 transactionsForTransactionSourceIdentifiers:v6 withTransactionSource:v4 withBackingData:v5 startDate:v7 endDate:v8 orderedByDate:v9 limit:v10 completion:v13];
}

uint64_t __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __162__NPKCompanionAgentConnection_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 valueForProperty:*MEMORY[0x263F57620]];
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v25 = self;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Request to delete from device with pairing ID: %@ Transaction with Identifier: %@", buf, 0x20u);
    }
  }
  id v14 = [(NPKCompanionAgentConnection *)self remoteService];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke;
  v21[3] = &unk_2644D5828;
  id v15 = v9;
  id v22 = v8;
  id v23 = v15;
  id v16 = v8;
  id v17 = [v14 remoteObjectProxyWithErrorHandler:v21];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke_151;
  v19[3] = &unk_2644D5828;
  void v19[4] = self;
  id v20 = v15;
  id v18 = v15;
  [v17 deletePaymentTransactionWithIdentifier:v16 fromDeviceWithPairingID:v10 completion:v19];
}

void __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      uint64_t v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 138412546;
        uint64_t v9 = v7;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Error while creating connection to delete transaction with Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __92__NPKCompanionAgentConnection_deletePaymentTransactionWithIdentifier_fromDevice_completion___block_invoke_151(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKCompanionAgentConnection *)self remoteService];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke;
  v17[3] = &unk_2644D2B90;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2;
  v15[3] = &unk_2644D8980;
  void v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 transitStateWithPassUniqueIdentifier:v10 paymentApplication:v9 completion:v15];
}

uint64_t __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __98__NPKCompanionAgentConnection_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKCompanionAgentConnection *)self remoteService];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  v14[3] = &unk_2644D2B90;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v12[3] = &unk_2644D8780;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 balancesForPaymentPassWithUniqueIdentifier:v7 completion:v12];
}

uint64_t __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __85__NPKCompanionAgentConnection_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)balanceReminderForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NPKCompanionAgentConnection *)self remoteService];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke;
  v18[3] = &unk_2644D5828;
  id v12 = v9;
  id v19 = v8;
  id v20 = v12;
  id v13 = v8;
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke_153;
  v16[3] = &unk_2644D89A8;
  void v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v14 balanceReminderForBalance:v10 pass:v13 withCompletion:v16];
}

void __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [*(id *)(a1 + 32) uniqueID];
        int v8 = 138412546;
        id v9 = v7;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to get balance reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __77__NPKCompanionAgentConnection_balanceReminderForBalance_pass_withCompletion___block_invoke_153(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPKCompanionAgentConnection *)self remoteService];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke;
  v21[3] = &unk_2644D5828;
  id v15 = v11;
  id v22 = v10;
  id v23 = v15;
  id v16 = v10;
  id v17 = [v14 remoteObjectProxyWithErrorHandler:v21];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke_155;
  v19[3] = &unk_2644D2B68;
  void v19[4] = self;
  id v20 = v15;
  id v18 = v15;
  [v17 setBalanceReminder:v13 forBalance:v12 pass:v16 completion:v19];
}

void __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [*(id *)(a1 + 32) uniqueID];
        int v8 = 138412546;
        id v9 = v7;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to set balance reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __77__NPKCompanionAgentConnection_setBalanceReminder_forBalance_pass_completion___block_invoke_155(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NPKCompanionAgentConnection *)self remoteService];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke;
  v18[3] = &unk_2644D5828;
  id v12 = v9;
  id v19 = v8;
  id v20 = v12;
  id v13 = v8;
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke_156;
  v16[3] = &unk_2644D89D0;
  void v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v14 commutePlanReminderForCommutePlan:v10 pass:v13 withCompletion:v16];
}

void __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [*(id *)(a1 + 32) uniqueID];
        int v8 = 138412546;
        id v9 = v7;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to get commute plan reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __85__NPKCompanionAgentConnection_commutePlanReminderForCommutePlan_pass_withCompletion___block_invoke_156(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPKCompanionAgentConnection *)self remoteService];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke;
  v21[3] = &unk_2644D5828;
  id v15 = v11;
  id v22 = v10;
  id v23 = v15;
  id v16 = v10;
  id v17 = [v14 remoteObjectProxyWithErrorHandler:v21];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_158;
  v19[3] = &unk_2644D2B68;
  void v19[4] = self;
  id v20 = v15;
  id v18 = v15;
  [v17 setCommutePlanReminder:v13 forCommutePlan:v12 pass:v16 completion:v19];
}

void __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [*(id *)(a1 + 32) uniqueID];
        int v8 = 138412546;
        id v9 = v7;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to set commute plan reminder for Pass Unique Identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __85__NPKCompanionAgentConnection_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_158(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NPKCompanionAgentConnection *)self remoteService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __93__NPKCompanionAgentConnection_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke;
  v11[3] = &unk_2644D29D0;
  id v12 = v6;
  id v9 = v6;
  __int16 v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 startBackgroundVerificationObserverForPass:v9 verificationMethod:v7];
}

void __93__NPKCompanionAgentConnection_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) uniqueID];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to start background verification for pass unique identifier: %@. Error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(NPKCompanionAgentConnection *)self remoteService];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__NPKCompanionAgentConnection_noteForegroundVerificationObserverActive___block_invoke;
  v6[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v7 = v3;
  BOOL v5 = [v4 remoteObjectProxyWithErrorHandler:v6];

  [v5 noteForegroundVerificationObserverActive:v3];
}

void __72__NPKCompanionAgentConnection_noteForegroundVerificationObserverActive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *(unsigned __int8 *)(a1 + 32);
      v8[0] = 67109378;
      v8[1] = v7;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while creating connection to note foreground verification observation active: %d. Error: %@", (uint8_t *)v8, 0x12u);
    }
  }
}

- (void)reloadPaymentPassesWithCompletion:(id)a3
{
  id v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke;
  v7[3] = &unk_2644D2E58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(cacheQueue, v7);
}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearCaches];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_2;
  v3[3] = &unk_2644D2E58;
  uint64_t v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_3;
  v2[3] = &unk_2644D37E8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 paymentPassUniqueIDsSynchronous:0 reply:v2];
}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = dispatch_group_create();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        id v10 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_4;
        v14[3] = &unk_2644D7718;
        id v15 = v4;
        [v10 paymentPassWithUniqueID:v9 synchronous:0 reply:v14];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_5;
  block[3] = &unk_2644D2B10;
  id v13 = *(id *)(a1 + 40);
  dispatch_group_notify(v4, MEMORY[0x263EF83A0], block);
}

void __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_4(uint64_t a1)
{
}

uint64_t __65__NPKCompanionAgentConnection_reloadPaymentPassesWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__NPKCompanionAgentConnection_hasActiveExternallySharedPasses___block_invoke;
  v6[3] = &unk_2644D28C0;
  id v7 = v4;
  id v5 = v4;
  [(NPKCompanionAgentConnection *)self hasActiveExternallySharedPassesWithCompletion:v6];
}

uint64_t __63__NPKCompanionAgentConnection_hasActiveExternallySharedPasses___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hasActiveExternallySharedPassesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgentConnection *)self remoteService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke;
  v11[3] = &unk_2644D2B90;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke_159;
  v9[3] = &unk_2644D4128;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 hasActiveExternallySharedPassesWithCompletion:v9];
}

void __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while getting active externally shared passes. Error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__NPKCompanionAgentConnection_hasActiveExternallySharedPassesWithCompletion___block_invoke_159(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)expressModeEnabledForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKCompanionAgentConnection *)self remoteService];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke;
  v14[3] = &unk_2644D2B90;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke_160;
  v12[3] = &unk_2644D4128;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 expressModeEnabledForPassIdentifier:v7 completion:v12];
}

void __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while checking express passes. Error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__NPKCompanionAgentConnection_expressModeEnabledForPassIdentifier_completion___block_invoke_160(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateCredentials:(id)a3 forUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NPKCompanionAgentConnection *)self remoteService];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke;
  v19[3] = &unk_2644D2B40;
  id v20 = v8;
  id v21 = v9;
  id v12 = v10;
  id v22 = v12;
  id v13 = v9;
  id v14 = v8;
  id v15 = [v11 remoteObjectProxyWithErrorHandler:v19];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke_161;
  v17[3] = &unk_2644D5828;
  void v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 updateCredentials:v14 forUniqueID:v13 completion:v17];
}

void __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      int v10 = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Error while updating credentials %@ for pass unique ID: %@. Error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

uint64_t __72__NPKCompanionAgentConnection_updateCredentials_forUniqueID_completion___block_invoke_161(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)trustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = pk_General_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Requested gizmo trusted device enrollment signature", buf, 2u);
      }
    }
    __int16 v14 = [(NPKCompanionAgentConnection *)self remoteService];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke;
    v20[3] = &unk_2644D2B90;
    id v15 = v10;
    id v21 = v15;
    uint64_t v16 = [v14 remoteObjectProxyWithErrorHandler:v20];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke_167;
    v18[3] = &unk_2644D8A18;
    void v18[4] = self;
    long long v19 = v15;
    [v16 trustedDeviceEnrollmentSignatureWithAccountDSID:v8 sessionData:v9 handler:v18];

    long long v17 = v21;
  }
  else
  {
    if (!v12) {
      goto LABEL_8;
    }
    long long v17 = pk_General_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Warning: TrustedDeviceEnrollmentInfo ignore request. handler not provided", buf, 2u);
    }
  }

LABEL_8:
}

void __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: TrustedDeviceEnrollmentInfo: Error connecting to gizmo target device.", v10, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F5C630];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = @"Error connecting to target device.";
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v6 errorWithDomain:v7 code:-1 userInfo:v8];
  (*(void (**)(uint64_t, void, void, void, void *))(v5 + 16))(v5, 0, 0, 0, v9);
}

uint64_t __99__NPKCompanionAgentConnection_trustedDeviceEnrollmentSignatureWithAccountDSID_sessionData_handler___block_invoke_167(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v18)
  {
    long long v19 = pk_General_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      id v21 = pk_General_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Warning: Completion not provided by the caller we will not be able to notify when we are done", buf, 2u);
      }
    }
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  v35[3] = &unk_2644D8A40;
  id v36 = v18;
  id v22 = v18;
  id v23 = (void *)MEMORY[0x223C37380](v35);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_171;
  v29[3] = &unk_2644D8A68;
  id v30 = v13;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v23;
  id v24 = v23;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  id v28 = v13;
  +[NPKIDVRemoteDeviceSession sessionForDeviceID:v14 completion:v29];
}

void __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      BOOL v12 = "-[NPKCompanionAgentConnection provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentif"
            "ier:attestations:supplementalData:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %s finished with secureElementPass:%@, error:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

uint64_t __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_171(void *a1, void *a2)
{
  return [a2 provisionCredentialWithType:1 metadata:a1[4] credentialIdentifier:a1[5] attestations:a1[6] supplementalData:a1[7] completion:a1[8]];
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 policyIdentifier:(id)a4 targetDeviceIdentifier:(id)a5 credentialIdentifier:(id)a6 attestations:(id)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = (objc_class *)MEMORY[0x263F5BED0];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = objc_alloc_init(v14);
  BOOL v20 = [v19 dataRepresentation];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_policyIdentifier_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke;
  v22[3] = &unk_2644D8A40;
  id v23 = v13;
  id v21 = v13;
  [(NPKCompanionAgentConnection *)self provisionIdentityPassWithPassMetadata:v18 targetDeviceIdentifier:v17 credentialIdentifier:v16 attestations:v15 supplementalData:v20 completion:v22];
}

uint64_t __154__NPKCompanionAgentConnection_provisionIdentityPassWithPassMetadata_policyIdentifier_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return [(NPKCompanionAgentConnection *)self _remoteObjectProxySynchronize:0 withFailureHandler:a3];
}

- (id)_cachedUniqueIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  BOOL v3 = [(NPKCompanionAgentConnection *)self cachedUniqueIDs];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = [(NPKCompanionAgentConnection *)self cachedUniqueIDs];
    id v6 = [v4 setWithSet:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_setCachedUniqueIDs:(id)a3
{
  cacheQueue = self->_cacheQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  id v6 = [MEMORY[0x263EFF9C0] setWithSet:v5];

  [(NPKCompanionAgentConnection *)self setCachedUniqueIDs:v6];
}

- (id)_cachedPassForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionAgentConnection *)self cachedPasses];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)_addPassToCache:(id)a3
{
  cacheQueue = self->_cacheQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  id v6 = [(NPKCompanionAgentConnection *)self cachedUniqueIDs];
  uint64_t v7 = [v5 uniqueID];
  [v6 addObject:v7];

  id v9 = [(NPKCompanionAgentConnection *)self cachedPasses];
  BOOL v8 = [v5 uniqueID];
  [v9 setObject:v5 forKeyedSubscript:v8];
}

- (void)_removePassWithUniqueIDFromCache:(id)a3
{
  cacheQueue = self->_cacheQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  id v6 = [(NPKCompanionAgentConnection *)self cachedUniqueIDs];
  [v6 removeObject:v5];

  id v7 = [(NPKCompanionAgentConnection *)self cachedPasses];
  [v7 removeObjectForKey:v5];
}

- (void)_invalidateCachedPassWithUniqueID:(id)a3
{
  cacheQueue = self->_cacheQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(cacheQueue);
  id v6 = [(NPKCompanionAgentConnection *)self cachedPasses];
  [v6 removeObjectForKey:v5];
}

- (void)_clearCaches
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  [(NPKCompanionAgentConnection *)self setCachedUniqueIDs:0];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(NPKCompanionAgentConnection *)self setCachedPasses:v3];
}

- (void)_applyPropertiesToPass:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uniqueID];
  id v6 = NSURL;
  id v7 = NPKStorePathForPaymentPassWithUniqueID(v5);
  BOOL v8 = [v6 fileURLWithPath:v7];

  NPKFlushCFBundleCacheAtURL(v8);
  id v9 = [(PKFileDataAccessor *)[NPKSettingsPreservingFileDataAccessor alloc] initWithFileURL:v8 error:0];
  [(NPKSettingsPreservingFileDataAccessor *)v9 setConnection:self];
  [(NPKSettingsPreservingFileDataAccessor *)v9 setObjectUniqueID:v5];
  [v4 setDataAccessor:v9];
  uint64_t v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      PKScreenScale();
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Setting screen scale for pass with unique ID %@ to %.2f", (uint8_t *)&v14, 0x16u);
    }
  }
  PKScreenScale();
  objc_msgSend(v4, "setPreferredImageScale:");
  [v4 setPreferredImageSuffix:0];
  [v4 setRemotePass:1];
}

- (void)_shouldShowApplePaySettingsForTinkerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  dispatch_group_enter(v5);
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke;
  block[3] = &unk_2644D42D8;
  id v36 = v37;
  void block[4] = self;
  id v7 = v5;
  uint64_t v35 = v7;
  dispatch_async(v6, block);

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  dispatch_group_enter(v7);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_2;
  v29[3] = &unk_2644D5BD0;
  void v29[4] = self;
  id v31 = v32;
  BOOL v8 = v7;
  id v30 = v8;
  dispatch_async(v6, v29);

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  dispatch_group_enter(v8);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_4;
  v24[3] = &unk_2644D2960;
  id v26 = v27;
  id v9 = v8;
  id v25 = v9;
  dispatch_async(v6, v24);

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 1;
  dispatch_group_enter(v9);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_5;
  v18[3] = &unk_2644D42D8;
  BOOL v20 = self;
  id v21 = v22;
  id v19 = v9;
  uint64_t v10 = v9;
  dispatch_async(v6, v18);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_179;
  v12[3] = &unk_2644D8690;
  int v14 = v37;
  id v15 = v32;
  __int16 v16 = v27;
  uint64_t v17 = v22;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x263EF83A0], v12);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v37, 8);
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = NPKPairedOrPairingDevice();
  id v4 = [v2 peerPaymentAccountForDevice:v3];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4 != 0;

  id v5 = a1[5];
  dispatch_group_leave(v5);
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_3;
  v4[3] = &unk_2644D7740;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 paymentPassUniqueIDsSynchronous:0 reply:v4];
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 count] != 0;
  long long v3 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v3);
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x263F5C128] sharedService];
  long long v3 = NPKDeviceRegion();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = NPKShouldAllowPeerPaymentRegistrationForWebService(v2, v3);

  id v4 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v4);
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_5(uint64_t a1)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_6;
  v10[3] = &unk_2644D8A90;
  uint64_t v12 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  id v2 = (void (**)(void, void))MEMORY[0x223C37380](v10);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  long long v3 = (void *)getBPSTinkerSupportClass_softClass;
  uint64_t v17 = getBPSTinkerSupportClass_softClass;
  if (!getBPSTinkerSupportClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getBPSTinkerSupportClass_block_invoke;
    v13[3] = &unk_2644D30F8;
    void v13[4] = &v14;
    __getBPSTinkerSupportClass_block_invoke((uint64_t)v13);
    long long v3 = (void *)v15[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v14, 8);
  long long v5 = [v4 sharedInstance];
  id v6 = [v5 cachedTinkerFamilyMemeber];

  if (v6)
  {
    id v7 = [v5 cachedTinkerFamilyMemeber];
    ((void (**)(void, void *))v2)[2](v2, v7);
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_7;
    v8[3] = &unk_2644D8AB8;
    void v8[4] = *(void *)(a1 + 40);
    id v9 = v2;
    [v5 getActiveTinkerFamilyMemberWithCompletion:v8];
  }
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 memberType] == 0;
  }
  long long v3 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v3);
}

void __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      id v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 138412546;
        uint64_t v12 = v10;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Failed to fetch active tinker family member due to: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __82__NPKCompanionAgentConnection__shouldShowApplePaySettingsForTinkerWithCompletion___block_invoke_179(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) || *(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    BOOL v2 = 1;
  }
  else if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    BOOL v2 = *(unsigned char *)(*(void *)(a1[9] + 8) + 24) == 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  long long v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "no";
      if (v2) {
        id v6 = "yes";
      }
      int v7 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
      int v8 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
      int v9 = *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24);
      int v10 = *(unsigned __int8 *)(*(void *)(a1[9] + 8) + 24);
      int v12 = 136316162;
      __int16 v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      __int16 v16 = 1024;
      int v17 = v8;
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 1024;
      int v21 = v10;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Should show Apple Pay settings for Tinker: %s (hasPeerPaymentAccount: %d, hasPaymentPasses %d, isPeerPaymentSupportedInRegion: %d, isTinkerMemberAdult: %d)", (uint8_t *)&v12, 0x24u);
    }
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2);
  }
  return result;
}

- (void)_savePaymentPass:(id)a3 atURL:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke;
  v29[3] = &unk_2644D4178;
  void v29[4] = self;
  id v14 = v10;
  id v30 = v14;
  id v15 = v11;
  id v31 = v15;
  id v16 = v12;
  id v32 = v16;
  id v17 = v13;
  id v33 = v17;
  __int16 v18 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v29];
  int v19 = [v14 archiveData];
  if (v19)
  {
    __int16 v20 = [v14 uniqueID];
    int v21 = [v16 valueForProperty:*MEMORY[0x263F57620]];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_4;
    v26[3] = &unk_2644D5578;
    v26[4] = self;
    id v27 = v14;
    id v28 = v17;
    [v18 savePaymentPassData:v19 withUniqueID:v20 forPairingID:v21 completion:v26];
  }
  else if (v17)
  {
    uint64_t v22 = pk_Payment_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (v23)
    {
      id v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = [v14 uniqueID];
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v25;
        _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_ERROR, "Error: Unable to get archive data for payment pass with unique ID %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void))v17 + 2))(v17, 0);
  }
}

uint64_t __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) queueAppropriateFailedActions])
  {
    BOOL v2 = +[NPKCompanionAgentConnectionDeferredActionHandler sharedDeferredActionHandler];
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = NPKPairedOrPairingDevice();
    [v2 addDeferredPaymentPass:v3 forDevice:v4];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    _DWORD v8[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_2;
    v8[3] = &unk_2644D8B08;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    id v11 = v5;
    uint64_t v12 = v6;
    [v2 performActionWhenCompanionAgentIsAvailable:v8 forDevice:*(void *)(a1 + 56)];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_3;
  v9[3] = &unk_2644D8AE0;
  uint64_t v7 = a1[6];
  v9[4] = a1[7];
  id v10 = v5;
  dispatch_semaphore_t v11 = v4;
  int v8 = v4;
  [v3 _savePaymentPass:v10 atURL:v6 forDevice:v7 completion:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyPropertiesToPass:*(void *)(a1 + 40)];
  BOOL v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

uint64_t __75__NPKCompanionAgentConnection__savePaymentPass_atURL_forDevice_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyPropertiesToPass:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"disable";
      *(_DWORD *)buf = 138412802;
      id v16 = self;
      __int16 v17 = 2112;
      if (v4) {
        id v10 = @"enable";
      }
      __int16 v18 = v10;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did %@ transaction service: %@", buf, 0x20u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  block[3] = &unk_2644D3E10;
  void block[4] = self;
  id v13 = v6;
  BOOL v14 = v4;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __91__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didEnableTransactionService:*(unsigned __int8 *)(a1 + 48)];
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Transaction source identifier did receive transaction: %@ transaction %@", buf, 0x20u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NPKCompanionAgentConnection_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __81__NPKCompanionAgentConnection_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transactionSourceIdentifier:*(void *)(a1 + 40) didReceiveTransaction:*(void *)(a1 + 48)];
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Transaction source identifier did remove transaction: %@, transaction %@", buf, 0x20u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__NPKCompanionAgentConnection_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __94__NPKCompanionAgentConnection_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transactionSourceIdentifier:*(void *)(a1 + 40) didRemoveTransactionWithIdentifier:*(void *)(a1 + 48)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update transit pass properties: %@, properties %@", buf, 0x20u);
    }
  }
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_2644D2E08;
  void block[4] = self;
  id v12 = v6;
  id v19 = v12;
  dispatch_async(cacheQueue, block);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke_2;
  v15[3] = &unk_2644D31B0;
  void v15[4] = self;
  id v16 = v12;
  id v17 = v7;
  id v13 = v7;
  id v14 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

uint64_t __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCachedPassWithUniqueID:*(void *)(a1 + 40)];
}

void __98__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didUpdateWithTransitPassProperties:*(void *)(a1 + 48)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithBalances:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update balances: %@, balances %@", buf, 0x20u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithBalances___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithBalances___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didUpdateWithBalances:*(void *)(a1 + 48)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
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
      *(_DWORD *)buf = 138413058;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update balance reminder: %@, reminder %@, balance %@", buf, 0x2Au);
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalance___block_invoke;
  v17[3] = &unk_2644D3BE0;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v17);
}

void __99__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalance___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didUpdateBalanceReminder:*(void *)(a1 + 48) forBalance:*(void *)(a1 + 56)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass did update credentials: %@, credentials %@", buf, 0x20u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithCredentials___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __88__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didUpdateWithCredentials___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didUpdateWithCredentials:*(void *)(a1 + 48)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 1024;
      BOOL v19 = v4;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Payment pass with uniqueID:%@ did enable message service:%d", buf, 0x1Cu);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  block[3] = &unk_2644D3E10;
  void block[4] = self;
  id v12 = v6;
  BOOL v13 = v4;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __87__NPKCompanionAgentConnection_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didEnableMessageService:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)pairedWatchHasApplicationWithBundleID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = NPKPairedOrPairingDevice();
    uint64_t v15 = 0;
    __int16 v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    id v6 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    _DWORD v11[2] = __69__NPKCompanionAgentConnection_pairedWatchHasApplicationWithBundleID___block_invoke;
    v11[3] = &unk_2644D8B30;
    id v12 = v3;
    id v14 = &v15;
    id v7 = v5;
    BOOL v13 = v7;
    [v6 applicationIsInstalledOnPairedDevice:v4 withCompanionBundleID:v12 completion:v11];

    dispatch_time_t v8 = dispatch_time(0, 900000000000);
    dispatch_group_wait(v7, v8);
    BOOL v9 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __69__NPKCompanionAgentConnection_pairedWatchHasApplicationWithBundleID___block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = @"NO";
      uint64_t v8 = *(void *)(a1 + 32);
      if (a2) {
        id v7 = @"YES";
      }
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection app %@ is on gizmo %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)shouldShowWatchExtensionInstallationForPaymentPass:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 supportsBarcodePayment])
  {
    BOOL v5 = [(NPKCompanionAgentConnection *)self _installedCompanionApplicationBundleIDForPaymentPass:v4];
    BOOL v6 = [(NPKCompanionAgentConnection *)self pairedWatchHasApplicationWithBundleID:v5];
    if (v5) {
      int v7 = !v6;
    }
    else {
      int v7 = 0;
    }
    uint64_t v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      uint64_t v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v7) {
          __int16 v11 = @"should";
        }
        else {
          __int16 v11 = @"should NOT";
        }
        id v12 = [v4 uniqueID];
        int v17 = 138413058;
        char v18 = v11;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        __int16 v21 = 1024;
        BOOL v22 = v5 != 0;
        __int16 v23 = 1024;
        BOOL v24 = v6;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection %@ show watch extension installation prompt for %@ - hasCompanionApplication: %d, hasWatchApplication: %d.", (uint8_t *)&v17, 0x22u);
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  LOBYTE(v7) = 0;
  if (v14)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v4 uniqueID];
      int v17 = 138412290;
      char v18 = v15;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection should NOT show watch extension installation prompt for %@ because it doens't support barcodePayment.", (uint8_t *)&v17, 0xCu);
    }
    LOBYTE(v7) = 0;
    goto LABEL_16;
  }
LABEL_17:

  return v7;
}

- (void)beginPairedWatchInstallationOfApplicationForPaymentPass:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [(NPKCompanionAgentConnection *)self _installedCompanionApplicationBundleIDForPaymentPass:a3];
  uint64_t v8 = NPKPairedOrPairingDevice();
  BOOL v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    __int16 v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v23 = v7;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection beginning fetching watch app bundleID for %@", buf, 0xCu);
    }
  }
  id v12 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke;
  v17[3] = &unk_2644D8B80;
  id v18 = v7;
  id v19 = v12;
  id v20 = v8;
  id v21 = v6;
  id v13 = v6;
  id v14 = v8;
  id v15 = v12;
  id v16 = v7;
  [v15 fetchWatchAppBundleIDForCompanionAppBundleID:v16 completion:v17];
}

void __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v8)
    {
      BOOL v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v10;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection beginning install of %@", buf, 0xCu);
      }
    }
    __int16 v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke_195;
    v16[3] = &unk_2644D8B58;
    id v17 = v5;
    id v18 = *(id *)(a1 + 56);
    [v11 installApplication:v17 onPairedDevice:v12 completion:v16];
  }
  else
  {
    if (v8)
    {
      id v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v14;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection failed to find watch app bundleID for %@", buf, 0xCu);
      }
    }
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v6);
    }
  }
}

void __98__NPKCompanionAgentConnection_beginPairedWatchInstallationOfApplicationForPaymentPass_completion___block_invoke_195(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = a2;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection ended install of %@ %li %@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v5 == 0, v5);
  }
}

- (id)_installedCompanionApplicationBundleIDForPaymentPass:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "storeIdentifiers", 0);
  id v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = objc_msgSend(objc_alloc(MEMORY[0x263F01878]), "initWithStoreItemIdentifier:error:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "unsignedLongLongValue"), 0);
        if (v7)
        {
          BOOL v8 = v7;
          id v4 = [v7 bundleIdentifier];

          goto LABEL_11;
        }
      }
      id v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)fetchPendingTransactionForPassWithUniqueID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    long long v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Fetching pending app redirect url for pass %@", buf, 0x16u);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke;
  v16[3] = &unk_2644D2B10;
  id v11 = v7;
  id v17 = v11;
  long long v12 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke_2;
  v14[3] = &unk_2644D8BA8;
  void v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 fetchPendingTransactionForPassWithUniqueID:v6 completion:v14];
}

uint64_t __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__NPKCompanionAgentConnection_fetchPendingTransactionForPassWithUniqueID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)markPendingTransactionAsProcessedForPassWithUniqueID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      long long v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Marking pending transaction as processed for pass %@", (uint8_t *)&v9, 0x16u);
    }
  }
  BOOL v8 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:0];
  [v8 markPendingTransactionAsProcessedForPassWithUniqueID:v4];
}

- (void)beginPairedWatchInstallationOfWalletWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Beginning to request the install of NanoPassbook", buf, 2u);
    }
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F25518]) initWithBundleID:@"com.apple.NanoPassbook"];
  BOOL v8 = (void *)MEMORY[0x263F25448];
  int v9 = NPKPairedOrPairingDevice();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke;
  v11[3] = &unk_2644D8BD0;
  id v12 = v3;
  id v10 = v3;
  [v8 installApp:v7 onPairedDevice:v9 withCompletionHandler:v11];
}

void __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke_2;
  v6[3] = &unk_2644D2E58;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __82__NPKCompanionAgentConnection_beginPairedWatchInstallationOfWalletWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished requesting the install of NanoPassbook. Error?: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  BOOL v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = [v6 domain];
    if ([v7 isEqualToString:*MEMORY[0x263F253A8]])
    {
      uint64_t v8 = [*(id *)(a1 + 32) code];

      if (v8 == 505) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Process not entitled to install apps on paired device"];
      }
    }
    else
    {
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(a1 + 32) != 0);
  }
  return result;
}

- (void)presentStandaloneTransaction:(int64_t)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
}

- (void)presentStandaloneTransaction:(int64_t)a3 forPassUniqueIdentifier:(id)a4 terminalReaderIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)MEMORY[0x223C37380](v12);
      *(_DWORD *)buf = 138413314;
      uint64_t v25 = self;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      __int16 v28 = 2112;
      id v29 = v10;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): Present standalone transaction of type %ld for pass %@ readerID %@ completion %@", buf, 0x34u);
    }
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __120__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_terminalReaderIdentifier_completion___block_invoke;
  void v22[3] = &unk_2644D2B10;
  id v17 = v12;
  id v23 = v17;
  id v18 = [(NPKCompanionAgentConnection *)self _remoteObjectProxyWithFailureHandler:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __120__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_terminalReaderIdentifier_completion___block_invoke_2;
  v20[3] = &unk_2644D2B68;
  void v20[4] = self;
  id v21 = v17;
  id v19 = v17;
  [v18 presentStandaloneTransaction:a3 forPassUniqueIdentifier:v10 terminalReaderIdentifier:v11 completion:v20];
}

uint64_t __120__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_terminalReaderIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __120__NPKCompanionAgentConnection_presentStandaloneTransaction_forPassUniqueIdentifier_terminalReaderIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionAgentConnection (%@): XPC connection to daemon was interrupted", buf, 0xCu);
    }
  }
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NPKCompanionAgentConnection_remoteService_didInterruptConnection___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(cacheQueue, block);
}

uint64_t __68__NPKCompanionAgentConnection_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearCaches];
}

- (void)setQueueAppropriateFailedActions:(BOOL)a3
{
  self->_queueAppropriateFailedActions = a3;
}

- (BOOL)hasQueuedPaymentPasses
{
  return self->_hasQueuedPaymentPasses;
}

- (void)setHasQueuedPaymentPasses:(BOOL)a3
{
  self->_hasQueuedPaymentPasses = a3;
}

- (NPKCompanionAgentConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKCompanionAgentConnectionDelegate *)WeakRetained;
}

- (NSMutableSet)cachedUniqueIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedUniqueIDs:(id)a3
{
}

- (NSMutableDictionary)cachedPasses
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedPasses:(id)a3
{
}

- (NSMutableDictionary)connectionAvailableActions
{
  return self->_connectionAvailableActions;
}

- (void)setConnectionAvailableActions:(id)a3
{
}

- (PKPaymentWebServiceContext)connectionUnavailableWebServiceContext
{
  return self->_connectionUnavailableWebServiceContext;
}

- (void)setConnectionUnavailableWebServiceContext:(id)a3
{
}

- (void)setRemoteService:(id)a3
{
}

@end