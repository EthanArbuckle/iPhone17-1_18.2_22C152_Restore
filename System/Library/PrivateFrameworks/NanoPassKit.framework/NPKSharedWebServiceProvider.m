@interface NPKSharedWebServiceProvider
+ (id)sharedWebServiceProvider;
- (NPKCompanionAgentConnection)companionAgentConnection;
- (NPKPaymentWebServiceCompanionTargetDevice)targetDevice;
- (NPKPeerPaymentWebServiceCompanionTargetDevice)peerPaymentTargetDevice;
- (NPKSharedWebServiceProvider)init;
- (PKPaymentWebService)webService;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKPeerPaymentWebService)peerPaymentWebService;
- (id)_peerPaymentAccount;
- (id)_peerPaymentWebServiceContext;
- (id)_webServiceContext;
- (os_unfair_lock_s)companionAgentConnectionLock;
- (void)_deviceFailedToPair:(id)a3;
- (void)archiveWebServiceBackgroundContext:(id)a3;
- (void)archiveWebServiceContext:(id)a3;
- (void)checkCompanionPeerPaymentRegistrationState;
- (void)dealloc;
- (void)handleAppletState:(id)a3 forUniqueID:(id)a4;
- (void)handleBalanceReminderUpdate:(id)a3 balance:(id)a4 forUniqueID:(id)a5;
- (void)handleBalanceUpdate:(id)a3 forUniqueID:(id)a4;
- (void)handleCredentialsUpdate:(id)a3 forUniqueID:(id)a4 completion:(id)a5;
- (void)handleDownloadAllPaymentPasses;
- (void)handlePaymentTransactions:(id)a3 appletStates:(id)a4 forUniqueIDs:(id)a5;
- (void)handlePaymentWebServiceContextFromWatch:(id)a3;
- (void)handlePreconditionNotMetWithUniqueIDs:(id)a3 preconditionDescription:(id)a4 shouldUnregister:(BOOL)a5;
- (void)handlePreferredAID:(id)a3 forPassWithUniqueID:(id)a4;
- (void)handlePushToken:(id)a3;
- (void)handleRemoveTransactionsWithIdentifiers:(id)a3;
- (void)handleUpdatePaymentPassWithTypeIdentifier:(id)a3;
- (void)handleUpdatedPeerPaymentWebServiceContext:(id)a3 account:(id)a4;
- (void)loadWebService;
- (void)noteForegroundVerificationObserverActive:(BOOL)a3;
- (void)sendPaymentOptionsDefaultsToWatch;
- (void)sendWebServiceContextToWatch;
- (void)setCompanionAgentConnection:(id)a3;
- (void)setNewAuthRandom:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setPeerPaymentTargetDevice:(id)a3;
- (void)setPeerPaymentWebService:(id)a3;
- (void)setTargetDevice:(id)a3;
- (void)setWebService:(id)a3;
- (void)showPaymentSetupForAppDisplayName:(id)a3;
- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4;
@end

@implementation NPKSharedWebServiceProvider

+ (id)sharedWebServiceProvider
{
  if (sharedWebServiceProvider_onceToken != -1) {
    dispatch_once(&sharedWebServiceProvider_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)sharedWebServiceProvider_sharedWebServiceProvider;
  return v2;
}

void __55__NPKSharedWebServiceProvider_sharedWebServiceProvider__block_invoke()
{
  v0 = objc_alloc_init(NPKSharedWebServiceProvider);
  v1 = (void *)sharedWebServiceProvider_sharedWebServiceProvider;
  sharedWebServiceProvider_sharedWebServiceProvider = (uint64_t)v0;
}

- (NPKSharedWebServiceProvider)init
{
  v33.receiver = self;
  v33.super_class = (Class)NPKSharedWebServiceProvider;
  v2 = [(NPKSharedWebServiceProvider *)&v33 init];
  if (v2)
  {
    v3 = [NPKPaymentWebServiceCompanionTargetDevice alloc];
    v4 = [(NPKPaymentWebServiceCompanionTargetDevice *)v3 initWithContext:0 responseQueue:MEMORY[0x263EF83A0]];
    [(NPKPaymentWebServiceCompanionTargetDevice *)v4 setDelegate:v2];
    objc_storeStrong((id *)&v2->_targetDevice, v4);
    v5 = objc_alloc_init(NPKPeerPaymentWebServiceCompanionTargetDevice);
    objc_storeStrong((id *)&v2->_peerPaymentTargetDevice, v5);
    v2->_companionAgentConnectionLock._os_unfair_lock_opaque = 0;
    int out_token = 0;
    objc_initWeak(&location, v2);
    v6 = (const char *)[@"com.apple.NanoPassKit.NPKSharedPaymentWebServiceChanged" UTF8String];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __35__NPKSharedWebServiceProvider_init__block_invoke;
    handler[3] = &unk_2644D6A00;
    objc_copyWeak(&v30, &location);
    v7 = v2;
    v29 = v7;
    notify_register_dispatch(v6, &out_token, MEMORY[0x263EF83A0], handler);

    v8 = (const char *)[@"com.apple.NanoPassKit.NPKSharedPeerPaymentWebServiceChanged" UTF8String];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_63;
    v25[3] = &unk_2644D6A00;
    objc_copyWeak(&v27, &location);
    v9 = v7;
    v26 = v9;
    notify_register_dispatch(v8, &out_token, MEMORY[0x263EF83A0], v25);

    v10 = (const char *)[@"com.apple.NanoPassKit.NPKPeerPaymentAccountChangedDarwinNotification" UTF8String];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_64;
    v22[3] = &unk_2644D6A00;
    objc_copyWeak(&v24, &location);
    v11 = v9;
    v23 = v11;
    notify_register_dispatch(v10, &out_token, MEMORY[0x263EF83A0], v22);

    v12 = (const char *)[(id)*MEMORY[0x263F576B0] UTF8String];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_65;
    v20[3] = &unk_2644D2870;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v12, &out_token, MEMORY[0x263EF83A0], v20);

    v13 = (const char *)[(id)*MEMORY[0x263F576F0] UTF8String];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __35__NPKSharedWebServiceProvider_init__block_invoke_68;
    v17[3] = &unk_2644D6A00;
    objc_copyWeak(&v19, &location);
    v14 = v11;
    v18 = v14;
    notify_register_dispatch(v13, &out_token, MEMORY[0x263EF83A0], v17);

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v14 selector:sel__deviceFailedToPair_ name:*MEMORY[0x263F57698] object:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__NPKSharedWebServiceProvider_init__block_invoke(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Loading web service context", v9, 2u);
    }
  }
  v5 = [*(id *)(a1 + 32) _webServiceContext];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = [WeakRetained webService];
  [v7 setContext:v5];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"NPKSharedWebServiceDidChangeNotification" object:0];
}

void __35__NPKSharedWebServiceProvider_init__block_invoke_63(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Loading peer payment web service context", v9, 2u);
    }
  }
  v5 = [*(id *)(a1 + 32) _peerPaymentWebServiceContext];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = [WeakRetained peerPaymentWebService];
  [v7 setContext:v5];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"NPKSharedPeerPaymentWebServiceDidChangeNotification" object:0];
}

void __35__NPKSharedWebServiceProvider_init__block_invoke_64(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Loading peer payment account", v8, 2u);
    }
  }
  v5 = [*(id *)(a1 + 32) _peerPaymentAccount];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPeerPaymentAccount:v5];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"NPKSharedPeerPaymentAccountDidChangeNotification" object:0];
}

void __35__NPKSharedWebServiceProvider_init__block_invoke_65(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Device unpaired", v14, 2u);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x263F5C138]);
  v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v6);
  v8 = [WeakRetained webService];
  [v8 setContext:v5];

  id v9 = objc_alloc_init(MEMORY[0x263F5C180]);
  id v10 = objc_loadWeakRetained(v6);
  v11 = [v10 peerPaymentWebService];
  [v11 setContext:v9];

  id v12 = objc_loadWeakRetained(v6);
  [v12 setPeerPaymentAccount:0];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 postNotificationName:@"NPKSharedWebServiceActiveDeviceDidChangeNotification" object:0];
  [v13 postNotificationName:@"NPKSharedWebServiceDidChangeNotification" object:0];
  [v13 postNotificationName:@"NPKSharedPeerPaymentWebServiceDidChangeNotification" object:0];
  [v13 postNotificationName:@"NPKSharedPeerPaymentAccountDidChangeNotification" object:0];
}

void __35__NPKSharedWebServiceProvider_init__block_invoke_68(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Active watch changed", v15, 2u);
    }
  }
  id v5 = [*(id *)(a1 + 32) _webServiceContext];
  v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [WeakRetained webService];
  [v8 setContext:v5];

  id v9 = [*(id *)(a1 + 32) _peerPaymentWebServiceContext];
  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = [v10 peerPaymentWebService];
  [v11 setContext:v9];

  id v12 = [*(id *)(a1 + 32) _peerPaymentAccount];
  id v13 = objc_loadWeakRetained(v6);
  [v13 setPeerPaymentAccount:v12];

  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"NPKSharedWebServiceActiveDeviceDidChangeNotification" object:0];
  [v14 postNotificationName:@"NPKSharedWebServiceDidChangeNotification" object:0];
  [v14 postNotificationName:@"NPKSharedPeerPaymentWebServiceDidChangeNotification" object:0];
  [v14 postNotificationName:@"NPKSharedPeerPaymentAccountDidChangeNotification" object:0];
}

- (void)dealloc
{
  BOOL v3 = [(NPKSharedWebServiceProvider *)self targetDevice];
  [v3 setDelegate:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NPKSharedWebServiceProvider;
  [(NPKSharedWebServiceProvider *)&v5 dealloc];
}

- (void)loadWebService
{
  BOOL v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    objc_super v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider loading web service", buf, 2u);
    }
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __45__NPKSharedWebServiceProvider_loadWebService__block_invoke;
  v27[3] = &unk_2644D2910;
  v27[4] = self;
  os_unfair_lock_lock(&self->_companionAgentConnectionLock);
  __45__NPKSharedWebServiceProvider_loadWebService__block_invoke((uint64_t)v27);
  os_unfair_lock_unlock(&self->_companionAgentConnectionLock);
  v6 = [(NPKSharedWebServiceProvider *)self _webServiceContext];
  v7 = [v6 secureElementID];

  if (!v7) {
    [v6 setDeviceID:0];
  }
  v8 = [(NPKSharedWebServiceProvider *)self webService];

  if (v8)
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider updated web service context", buf, 2u);
      }
    }
    id v12 = [(NPKSharedWebServiceProvider *)self webService];
    [v12 setContext:v6];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263F5C128]);
    v14 = [(NPKSharedWebServiceProvider *)self targetDevice];
    v15 = [(NPKSharedWebServiceProvider *)self targetDevice];
    id v12 = (void *)[v13 initWithContext:v6 targetDevice:v14 archiver:v15];

    [(NPKSharedWebServiceProvider *)self setWebService:v12];
    v16 = pk_Payment_log();
    LODWORD(v15) = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider instantiated web service", buf, 2u);
      }
    }
  }

  v18 = [(NPKSharedWebServiceProvider *)self _peerPaymentWebServiceContext];
  id v19 = [(NPKSharedWebServiceProvider *)self peerPaymentWebService];

  if (v19)
  {
    v20 = [(NPKSharedWebServiceProvider *)self peerPaymentWebService];
    [(NPKSharedPeerPaymentWebServiceArchiver *)v20 setContext:v18];
  }
  else
  {
    id v21 = [NPKSharedPeerPaymentWebServiceArchiver alloc];
    v22 = [(NPKSharedWebServiceProvider *)self companionAgentConnection];
    v20 = [(NPKSharedPeerPaymentWebServiceArchiver *)v21 initWithCompanionAgentConnection:v22];

    v23 = [(NPKSharedWebServiceProvider *)self peerPaymentTargetDevice];
    id v24 = (void *)[objc_alloc(MEMORY[0x263F5C178]) initWithContext:v18 targetDevice:v23 archiver:v20];
    v25 = [MEMORY[0x263F5C168] sharedInstance];
    [v24 setPeerPaymentService:v25];

    [v23 setPeerPaymentWebService:v24];
    [(NPKSharedWebServiceProvider *)self setPeerPaymentWebService:v24];
  }
  v26 = [(NPKSharedWebServiceProvider *)self _peerPaymentAccount];
  [(NPKSharedWebServiceProvider *)self setPeerPaymentAccount:v26];
}

uint64_t __45__NPKSharedWebServiceProvider_loadWebService__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(NPKCompanionAgentConnection);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  objc_super v5 = *(void **)(*(void *)(a1 + 32) + 48);
  return [v5 setQueueAppropriateFailedActions:1];
}

- (id)_webServiceContext
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  id v23 = 0;
  p_companionAgentConnectionLock = &self->_companionAgentConnectionLock;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v14 = __49__NPKSharedWebServiceProvider__webServiceContext__block_invoke;
  v15 = &unk_2644D2960;
  v16 = self;
  v17 = &v18;
  uint64_t v3 = v13;
  os_unfair_lock_lock(p_companionAgentConnectionLock);
  v14((uint64_t)v3);

  os_unfair_lock_unlock(p_companionAgentConnectionLock);
  BOOL v4 = (void *)v19[5];
  if (!v4)
  {
    objc_super v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: No web service context from daemon; starting fresh!",
          v12,
          2u);
      }
    }
    id v8 = objc_alloc_init(MEMORY[0x263F5C138]);
    id v9 = (void *)v19[5];
    v19[5] = (uint64_t)v8;

    BOOL v4 = (void *)v19[5];
  }
  [v4 setTransactionServiceDisabled:1];
  [(id)v19[5] setMessageServiceDisabled:1];
  [(id)v19[5] setIgnoreProvisioningEnablementPercentage:1];
  id v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __49__NPKSharedWebServiceProvider__webServiceContext__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  NPKPairedOrPairingDevice();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 sharedPaymentWebServiceContextForDevice:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_peerPaymentWebServiceContext
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  id v23 = 0;
  p_companionAgentConnectionLock = &self->_companionAgentConnectionLock;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v14 = __60__NPKSharedWebServiceProvider__peerPaymentWebServiceContext__block_invoke;
  v15 = &unk_2644D2960;
  v16 = self;
  v17 = &v18;
  uint64_t v3 = v13;
  os_unfair_lock_lock(p_companionAgentConnectionLock);
  v14((uint64_t)v3);

  os_unfair_lock_unlock(p_companionAgentConnectionLock);
  uint64_t v4 = (void *)v19[5];
  if (!v4)
  {
    objc_super v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: No peer payment web service context from daemon; starting fresh!",
          v12,
          2u);
      }
    }
    id v8 = objc_alloc_init(MEMORY[0x263F5C180]);
    id v9 = (void *)v19[5];
    v19[5] = (uint64_t)v8;

    uint64_t v4 = (void *)v19[5];
  }
  id v10 = v4;
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __60__NPKSharedWebServiceProvider__peerPaymentWebServiceContext__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  NPKPairedOrPairingDevice();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 sharedPeerPaymentWebServiceContextForDevice:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_peerPaymentAccount
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__18;
  id v19 = __Block_byref_object_dispose__18;
  id v20 = 0;
  p_companionAgentConnectionLock = &self->_companionAgentConnectionLock;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v11 = __50__NPKSharedWebServiceProvider__peerPaymentAccount__block_invoke;
  id v12 = &unk_2644D2960;
  id v13 = self;
  v14 = &v15;
  uint64_t v3 = v10;
  os_unfair_lock_lock(p_companionAgentConnectionLock);
  v11((uint64_t)v3);

  os_unfair_lock_unlock(p_companionAgentConnectionLock);
  if (!v16[5])
  {
    uint64_t v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: No peer payment web service account from daemon", v9, 2u);
      }
    }
  }
  id v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __50__NPKSharedWebServiceProvider__peerPaymentAccount__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  NPKPairedOrPairingDevice();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 peerPaymentAccountForDevice:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_deviceFailedToPair:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Device failed to pair: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x263F5C138]);
  id v9 = [(NPKSharedWebServiceProvider *)self webService];
  [v9 setContext:v8];

  id v10 = objc_alloc_init(MEMORY[0x263F5C180]);
  v11 = [(NPKSharedWebServiceProvider *)self peerPaymentWebService];
  [v11 setContext:v10];
}

- (void)handlePushToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKSharedWebServiceProvider *)self webService];
  id v12 = [v5 context];

  [v12 setPushToken:v4];
  BOOL v6 = [(NPKSharedWebServiceProvider *)self webService];
  id v7 = [(NPKSharedWebServiceProvider *)self targetDevice];
  id v8 = [v6 context];
  [v7 archiveContext:v8];

  id v9 = [(NPKSharedWebServiceProvider *)self peerPaymentWebService];
  id v10 = [v9 context];
  [v10 setPushToken:v4];

  v11 = [v9 archiver];
  [v11 archiveContext:v10];
}

- (void)handlePreconditionNotMetWithUniqueIDs:(id)a3 preconditionDescription:(id)a4 shouldUnregister:(BOOL)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: Should not be receiving precondition not met messages from Bridge (%@)", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)handlePaymentTransactions:(id)a3 appletStates:(id)a4 forUniqueIDs:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: Should not be receiving payment transactions from Bridge (%@ %@ %@)", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)handleAppletState:(id)a3 forUniqueID:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Should not be receiving applet state from Bridge (%@ %@)", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleRemoveTransactionsWithIdentifiers:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Should not be receiving remove transactions from Bridge (%@)", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)handleBalanceUpdate:(id)a3 forUniqueID:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    uint64_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: Should not be receiving balance update from Bridge (%@ %@)", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleBalanceReminderUpdate:(id)a3 balance:(id)a4 forUniqueID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

  if (v11)
  {
    __int16 v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: Should not be receiving balance reminder update from Bridge (%@ %@ %@)", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)handleCredentialsUpdate:(id)a3 forUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKSharedWebServiceProvider *)self companionAgentConnection];
  [v11 updateCredentials:v10 forUniqueID:v9 completion:v8];
}

- (void)handleUpdatePaymentPassWithTypeIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Should not be receiving update payment pass requests from Bridge (%@)", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)handlePreferredAID:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a4;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: Should not be receiving preferred AID updates from Bridge (%@)", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)archiveWebServiceContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Archive web service context: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  int v8 = [(NPKSharedWebServiceProvider *)self companionAgentConnection];
  id v9 = NPKPairedOrPairingDevice();
  [v8 setSharedPaymentWebServiceContext:v4 forDevice:v9];
}

- (void)archiveWebServiceBackgroundContext:(id)a3
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Should not be archiving web service background context from Bridge", v6, 2u);
    }
  }
}

- (void)handlePaymentWebServiceContextFromWatch:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Received updated webServiceContext:%@", (uint8_t *)&v11, 0xCu);
    }
  }
  int v8 = [(NPKSharedWebServiceProvider *)self webService];
  [v8 setContext:v4];

  id v9 = [(NPKSharedWebServiceProvider *)self companionAgentConnection];
  int v10 = NPKPairedOrPairingDevice();
  [v9 setSharedPaymentWebServiceContext:v4 forDevice:v10];
}

- (void)sendWebServiceContextToWatch
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Shared web service provider: Sending web service context to watch", v9, 2u);
    }
  }
  BOOL v6 = [(NPKSharedWebServiceProvider *)self targetDevice];
  int v7 = [(NPKSharedWebServiceProvider *)self webService];
  int v8 = [v7 context];
  [v6 sendWebServiceContextToWatch:v8];
}

- (void)showPaymentSetupForAppDisplayName:(id)a3
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Should not be receiving show payment setup requests from Bridge", v6, 2u);
    }
  }
}

- (void)sendPaymentOptionsDefaultsToWatch
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Should not be receiving send payment options defaults requests from Bridge", v5, 2u);
    }
  }
}

- (void)setNewAuthRandom:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKSharedWebServiceProvider *)self companionAgentConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__NPKSharedWebServiceProvider_setNewAuthRandom___block_invoke;
  v7[3] = &unk_2644D6A28;
  id v8 = v4;
  id v6 = v4;
  [v5 paymentPassUniqueIDsSynchronous:0 reply:v7];
}

uint64_t __48__NPKSharedWebServiceProvider_setNewAuthRandom___block_invoke(uint64_t a1, void *a2)
{
  [a2 count];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)handleUpdatedPeerPaymentWebServiceContext:(id)a3 account:(id)a4
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Should not be receiving updated peer payment web service context from Bridge", v7, 2u);
    }
  }
}

- (void)handleDownloadAllPaymentPasses
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Should not be receiving download all payment passes from Bridge", v5, 2u);
    }
  }
}

- (void)checkCompanionPeerPaymentRegistrationState
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Should not be receiving check companion peer payment registration state from Bridge", v5, 2u);
    }
  }
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKSharedWebServiceProvider *)self companionAgentConnection];
  [v8 startBackgroundVerificationObserverForPass:v7 verificationMethod:v6];
}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NPKSharedWebServiceProvider *)self companionAgentConnection];
  [v4 noteForegroundVerificationObserverActive:v3];
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (NPKPaymentWebServiceCompanionTargetDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)setPeerPaymentWebService:(id)a3
{
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (NPKCompanionAgentConnection)companionAgentConnection
{
  return self->_companionAgentConnection;
}

- (void)setCompanionAgentConnection:(id)a3
{
}

- (NPKPeerPaymentWebServiceCompanionTargetDevice)peerPaymentTargetDevice
{
  return self->_peerPaymentTargetDevice;
}

- (void)setPeerPaymentTargetDevice:(id)a3
{
}

- (os_unfair_lock_s)companionAgentConnectionLock
{
  return self->_companionAgentConnectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentTargetDevice, 0);
  objc_storeStrong((id *)&self->_companionAgentConnection, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end