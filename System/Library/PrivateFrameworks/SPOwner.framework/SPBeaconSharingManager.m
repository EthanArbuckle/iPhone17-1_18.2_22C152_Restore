@interface SPBeaconSharingManager
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPBeaconSharingManager)init;
- (SPBeaconSharingXPCProtocol)proxy;
- (SPRetryCount)retryCount;
- (id)shareUpdateBlock;
- (void)acceptShare:(id)a3 completion:(id)a4;
- (void)allSharesIncludingHiddenWithCompletion:(id)a3;
- (void)allSharesWithCompletion:(id)a3;
- (void)checkDataIntegrityWithShareIdentifier:(id)a3 completion:(id)a4;
- (void)cleanupAllRecordsOfType:(unint64_t)a3 completion:(id)a4;
- (void)declineShare:(id)a3 completion:(id)a4;
- (void)delegatedShare:(id)a3 completion:(id)a4;
- (void)downloadKeysWithCircleIdentifier:(id)a3 fromBookmark:(BOOL)a4 completion:(id)a5;
- (void)forceBreakAllSharesOfType:(unint64_t)a3 completion:(id)a4;
- (void)forceBreakAllSharesWithUser:(id)a3 completion:(id)a4;
- (void)forceDeclineShare:(id)a3 completion:(id)a4;
- (void)forceStopSharing:(id)a3 completion:(id)a4;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)isBeaconDelegated:(id)a3 completion:(id)a4;
- (void)lookForOrphanedRecordsWithCompletion:(id)a3;
- (void)receivedUpdatedShares:(id)a3;
- (void)removeExpiredSharesWithCompletion:(id)a3;
- (void)removeShare:(id)a3 completion:(id)a4;
- (void)requestShare:(id)a3 completion:(id)a4;
- (void)revokeShare:(id)a3 completion:(id)a4;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRetryCount:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setShareUpdateBlock:(id)a3;
- (void)share:(id)a3 recipients:(id)a4 completion:(id)a5;
- (void)share:(id)a3 recipients:(id)a4 shareType:(unint64_t)a5 completion:(id)a6;
- (void)sharingLimitsWithCompletion:(id)a3;
- (void)startRefreshingSharesWithBlock:(id)a3 completion:(id)a4;
- (void)stopRefreshingSharesWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 completion:(id)a4;
- (void)stopTemporaryItemLocationShare:(id)a3 completion:(id)a4;
- (void)updatedCircleIdentifiers:(id)a3 completion:(id)a4;
- (void)uploadKeysWithCircleIdentifier:(id)a3 isInitialUpload:(BOOL)a4 completion:(id)a5;
@end

@implementation SPBeaconSharingManager

- (SPBeaconSharingManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SPBeaconSharingManager;
  v2 = [(SPBeaconSharingManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBeaconSharingManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SPRetryCount);
    retryCount = v2->_retryCount;
    v2->_retryCount = v6;
  }
  return v2;
}

- (SPBeaconSharingXPCProtocol)proxy
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v3 = [(SPBeaconSharingManager *)self session];

  if (!v3)
  {
    dispatch_queue_t v4 = [(SPBeaconSharingManager *)self serviceDescription];

    if (!v4)
    {
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __31__SPBeaconSharingManager_proxy__block_invoke;
      aBlock[3] = &unk_1E601B7B8;
      objc_copyWeak(&v28, location);
      v5 = _Block_copy(aBlock);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __31__SPBeaconSharingManager_proxy__block_invoke_2;
      v25[3] = &unk_1E601B7B8;
      objc_copyWeak(&v26, location);
      v6 = _Block_copy(v25);
      id v7 = objc_alloc(MEMORY[0x1E4F61588]);
      v8 = +[SPBeaconSharingManager exportedInterface];
      objc_super v9 = +[SPBeaconSharingManager remoteInterface];
      v10 = (FMXPCServiceDescription *)[v7 initWithMachServiceName:@"com.apple.icloud.searchpartyd.beaconsharingservice" options:0 exportedObject:self exportedInterface:v8 remoteObjectInterface:v9 interruptionHandler:v5 invalidationHandler:v6];

      serviceDescription = self->_serviceDescription;
      self->_serviceDescription = v10;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(location);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F61590]);
    v13 = [(SPBeaconSharingManager *)self serviceDescription];
    v14 = (void *)[v12 initWithServiceDescription:v13];
    [(SPBeaconSharingManager *)self setSession:v14];

    v15 = LogCategory_BeaconSharing();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(SPBeaconSharingManager *)self serviceDescription];
      v17 = [v16 machService];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_impl(&dword_1B2FD8000, v15, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);
    }
    v18 = [(SPBeaconSharingManager *)self session];
    [v18 resume];

    v19 = LogCategory_BeaconSharing();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(SPBeaconSharingManager *)self serviceDescription];
      v21 = [v20 machService];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v21;
      _os_log_impl(&dword_1B2FD8000, v19, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Established XPC connection to %@", (uint8_t *)location, 0xCu);
    }
  }
  v22 = [(SPBeaconSharingManager *)self session];
  v23 = [v22 proxy];

  return (SPBeaconSharingXPCProtocol *)v23;
}

void __31__SPBeaconSharingManager_proxy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained interruptionHandler:v3];
}

void __31__SPBeaconSharingManager_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained invalidationHandler:v3];
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: interruptionHandler %@", buf, 0xCu);
  }

  v6 = [(SPBeaconSharingManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SPBeaconSharingManager_interruptionHandler___block_invoke;
  block[3] = &unk_1E601B790;
  block[4] = self;
  dispatch_async(v6, block);
}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) shareUpdateBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) retryCount];
    [v3 decayWaitInterval];
    double v5 = v4;

    v6 = LogCategory_BeaconSharing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v5;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Will attempt to re-subscribe to share updates after %f seconds", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    v8 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SPBeaconSharingManager_interruptionHandler___block_invoke_9;
    block[3] = &unk_1E601BA30;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_after(v7, v8, block);

    id v9 = [*(id *)(a1 + 32) retryCount];
    [v9 increment];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v10 = LogCategory_BeaconSharing();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: Will *NOT* attempt to re-subscribe to share updates", buf, 2u);
    }
  }
}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained shareUpdateBlock];
  id v3 = LogCategory_BeaconSharing();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager Successfully: re-subscribing to share updates", buf, 2u);
    }

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__SPBeaconSharingManager_interruptionHandler___block_invoke_10;
    v5[3] = &unk_1E601C460;
    v5[4] = WeakRetained;
    [WeakRetained startRefreshingSharesWithBlock:v2 completion:v5];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager shareUpdateBlock is nil, not resubscribing.", buf, 2u);
    }
  }
}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke_10(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = LogCategory_BeaconSharing();
  dispatch_time_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager Successfully: re-subscribed to share updates", v8, 2u);
    }

    dispatch_time_t v7 = [*(id *)(a1 + 32) retryCount];
    [v7 reset];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __46__SPBeaconSharingManager_interruptionHandler___block_invoke_10_cold_1((uint64_t)v5, v7);
  }
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SPBeaconSharingManager *)self serviceDescription];
    v6 = [v5 debugDescription];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconSharingManager: invalidationHandler %@", (uint8_t *)&v7, 0xCu);
  }
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_5 != -1) {
    dispatch_once(&exportedInterface_onceToken_5, &__block_literal_global_10);
  }
  v2 = (void *)exportedInterface_interface_5;

  return v2;
}

void __43__SPBeaconSharingManager_exportedInterface__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B3A7D0];
  v1 = (void *)exportedInterface_interface_5;
  exportedInterface_interface_5 = v0;

  v2 = (void *)exportedInterface_interface_5;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_receivedUpdatedShares_ argumentIndex:0 ofReply:0];
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_6 != -1) {
    dispatch_once(&remoteInterface_onceToken_6, &__block_literal_global_63_0);
  }
  v2 = (void *)remoteInterface_interface_5;

  return v2;
}

void __41__SPBeaconSharingManager_remoteInterface__block_invoke()
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44230];
  v1 = (void *)remoteInterface_interface_5;
  remoteInterface_interface_5 = v0;

  v2 = (void *)remoteInterface_interface_5;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_allSharesWithCompletion_ argumentIndex:0 ofReply:1];

  v6 = (void *)remoteInterface_interface_5;
  int v7 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_allSharesIncludingHiddenWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v10 = (void *)remoteInterface_interface_5;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v13 = [v11 setWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_share_recipients_shareType_completion_ argumentIndex:1 ofReply:0];

  double v14 = (void *)remoteInterface_interface_5;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:3];
  v17 = objc_msgSend(v15, "setWithArray:", v16, v18, v19);
  [v14 setClasses:v17 forSelector:sel_share_recipients_shareType_completion_ argumentIndex:1 ofReply:1];
}

- (void)share:(id)a3 recipients:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__SPBeaconSharingManager_share_recipients_completion___block_invoke;
  v14[3] = &unk_1E601BBB0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling share:recipient:completion", OS_ACTIVITY_FLAG_DEFAULT, v14);
}

void __54__SPBeaconSharingManager_share_recipients_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_2;
  block[3] = &unk_1E601BBB0;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  id v9 = a1[7];
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Offering a share of %@ to %@", buf, 0x16u);
  }

  id v5 = *(id *)(a1 + 48);
  id v6 = [v5 proxy];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_117;
  v9[3] = &unk_1E601C488;
  id v10 = v7;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 56);
  [v6 share:v10 recipients:v8 shareType:2 completion:v9];
}

void __54__SPBeaconSharingManager_share_recipients_completion___block_invoke_117(void *a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 138413058;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "Completed offering a share of %@ to %@ (%d, %@)", (uint8_t *)&v9, 0x26u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)share:(id)a3 recipients:(id)a4 shareType:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke;
  activity_block[3] = &unk_1E601C0E8;
  activity_void block[4] = self;
  id v17 = v10;
  id v19 = v12;
  unint64_t v20 = a5;
  id v18 = v11;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling share:recipient:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_2;
  void v6[3] = &unk_1E601C0E8;
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  id v10 = v5;
  dispatch_async(v2, v6);

  objc_destroyWeak(&location);
}

void __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Offering a share of %@ to %@", buf, 0x16u);
  }

  id v5 = *(id *)(a1 + 48);
  id v6 = [v5 proxy];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_119;
  v10[3] = &unk_1E601C488;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 56);
  [v6 share:v11 recipients:v8 shareType:v9 completion:v10];
}

void __64__SPBeaconSharingManager_share_recipients_shareType_completion___block_invoke_119(void *a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 138413058;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "Completed offering a share of %@ to %@ (%d, %@)", (uint8_t *)&v9, 0x26u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)requestShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__SPBeaconSharingManager_requestShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling requestShare:unknownBeacon:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __50__SPBeaconSharingManager_requestShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SPBeaconSharingManager_requestShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __50__SPBeaconSharingManager_requestShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Requesting a share of %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SPBeaconSharingManager_requestShare_completion___block_invoke_120;
  v7[3] = &unk_1E601C4B0;
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  [v5 requestShare:v8 completion:v7];
}

void __50__SPBeaconSharingManager_requestShare_completion___block_invoke_120(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "Completed requesting a share of %@ (%d, %@)", (uint8_t *)&v8, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__SPBeaconSharingManager_removeShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling removeShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __49__SPBeaconSharingManager_removeShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_removeShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_removeShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Removing share %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_removeShare_completion___block_invoke_121;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 removeShare:v6 completion:v7];
}

uint64_t __49__SPBeaconSharingManager_removeShare_completion___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)revokeShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__SPBeaconSharingManager_revokeShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling revokeShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __49__SPBeaconSharingManager_revokeShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Marking revoke for share %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_122;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 revokeShare:v6 completion:v7];
}

uint64_t __49__SPBeaconSharingManager_revokeShare_completion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acceptShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__SPBeaconSharingManager_acceptShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling acceptShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __49__SPBeaconSharingManager_acceptShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Accepting share %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_123;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 acceptShare:v6 completion:v7];
}

uint64_t __49__SPBeaconSharingManager_acceptShare_completion___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)declineShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__SPBeaconSharingManager_declineShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling declineShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __50__SPBeaconSharingManager_declineShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SPBeaconSharingManager_declineShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __50__SPBeaconSharingManager_declineShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Declining share %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SPBeaconSharingManager_declineShare_completion___block_invoke_124;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 declineShare:v6 completion:v7];
}

uint64_t __50__SPBeaconSharingManager_declineShare_completion___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopSharing:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__SPBeaconSharingManager_stopSharing_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling stopSharing:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __49__SPBeaconSharingManager_stopSharing_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Stopping sharing for beacon %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_125;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 stopSharing:v6 completion:v7];
}

uint64_t __49__SPBeaconSharingManager_stopSharing_completion___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cleanupAllRecordsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke;
  activity_block[3] = &unk_1E601BC28;
  id v9 = v6;
  unint64_t v10 = a3;
  activity_void block[4] = self;
  id v7 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling cleanupAllRecordsOfType:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_2;
  v5[3] = &unk_1E601BC28;
  id v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  uint64_t v7 = v3;
  id v6 = v4;
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_2(uint64_t a1)
{
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "cleanup All Item Sharing Info", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_126;
  void v6[3] = &unk_1E601C4D8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  [v4 cleanupAllRecordsOfType:v5 completion:v6];
}

uint64_t __61__SPBeaconSharingManager_cleanupAllRecordsOfType_completion___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceBreakAllSharesOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke;
  activity_block[3] = &unk_1E601BC28;
  id v9 = v6;
  unint64_t v10 = a3;
  activity_void block[4] = self;
  id v7 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling forceBreakAllSharesOfType:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_2;
  v5[3] = &unk_1E601BC28;
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  void v5[4] = v4;
  id v6 = v3;
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Force breaking all shares of type %lu", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 proxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_127;
  v7[3] = &unk_1E601C4D8;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  [v5 forceBreakAllSharesOfType:v6 completion:v7];
}

uint64_t __63__SPBeaconSharingManager_forceBreakAllSharesOfType_completion___block_invoke_127(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceBreakAllSharesWithUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling forceBreakAllSharesWithUser:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Force breaking all shares with user %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_128;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 forceBreakAllSharesWithUser:v6 completion:v7];
}

uint64_t __65__SPBeaconSharingManager_forceBreakAllSharesWithUser_completion___block_invoke_128(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceDeclineShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling forceDeclineShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Calling forceDeclineShare of shareIdentifier = %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_129;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 forceDeclineShare:v6 completion:v7];
}

uint64_t __55__SPBeaconSharingManager_forceDeclineShare_completion___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceStopSharing:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling forceStopSharing:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Force stopping sharing for beacon %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_130;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 forceStopSharing:v6 completion:v7];
}

uint64_t __54__SPBeaconSharingManager_forceStopSharing_completion___block_invoke_130(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allSharesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke;
  void v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling allSharesWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E601B828;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Listing all shares", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_131;
  v5[3] = &unk_1E601C070;
  id v6 = *(id *)(a1 + 40);
  [v4 allSharesWithCompletion:v5];
}

void __50__SPBeaconSharingManager_allSharesWithCompletion___block_invoke_131(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "Completed listing all shares: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allSharesIncludingHiddenWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke;
  void v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling allSharesIncludingHidden:completion:", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_2;
  block[3] = &unk_1E601B828;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Listing all shares, including hidden", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_133;
  v5[3] = &unk_1E601C070;
  id v6 = *(id *)(a1 + 40);
  [v4 allSharesIncludingHiddenWithCompletion:v5];
}

void __65__SPBeaconSharingManager_allSharesIncludingHiddenWithCompletion___block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "Completed listing all shares, including hidden: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startRefreshingSharesWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke;
  activity_block[3] = &unk_1E601BC50;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling startRefreshingSharesWithBlock:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2;
  v4[3] = &unk_1E601BC50;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, v4);

  objc_destroyWeak(&location);
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2(uint64_t a1)
{
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Starting share update monitoring", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_134;
  void v6[3] = &unk_1E601C528;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  void v6[5] = v3;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v4 startRefreshingSharesWithCompletion:v6];
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_134(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2_135;
  v11[3] = &unk_1E601C500;
  char v13 = a2;
  v11[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  v11[5] = *(void *)(a1 + 40);
  id v12 = v8;
  dispatch_sync(v7, v11);

  (*(void (**)(void, uint64_t, id, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a2, v6, v9, v10);
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_2_135(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) setShareUpdateBlock:*(void *)(a1 + 48)];
    v2 = [*(id *)(a1 + 40) proxy];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_3;
    v3[3] = &unk_1E601C070;
    id v4 = *(id *)(a1 + 48);
    [v2 allSharesWithCompletion:v3];
  }
}

void __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_4;
  v7[3] = &unk_1E601C0C0;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __68__SPBeaconSharingManager_startRefreshingSharesWithBlock_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)stopRefreshingSharesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke;
  void v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling stopRefreshingSharesWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E601B828;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Stopping share update monitoring", buf, 2u);
  }

  [*(id *)(a1 + 32) setShareUpdateBlock:0];
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_136;
  v5[3] = &unk_1E601C4D8;
  id v6 = *(id *)(a1 + 40);
  [v4 stopRefreshingSharesWithCompletion:v5];
}

uint64_t __61__SPBeaconSharingManager_stopRefreshingSharesWithCompletion___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)uploadKeysWithCircleIdentifier:(id)a3 isInitialUpload:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke;
  v12[3] = &unk_1E601C550;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "os_activity_initiate: Calling uploadKeysWithCircleIdentifier:isInitialUpload:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

void __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_2;
  block[3] = &unk_1E601C550;
  id v3 = *(id *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = @"high";
    if (!*(unsigned char *)(a1 + 56)) {
      uint64_t v4 = @"low";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Uploading keys for owner circle identifier: %@, priority: %@", buf, 0x16u);
  }

  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 proxy];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_143;
  v9[3] = &unk_1E601C4D8;
  id v10 = *(id *)(a1 + 48);
  [v6 uploadKeysWithCircleIdentifier:v7 isInitialUpload:v8 completion:v9];
}

void __84__SPBeaconSharingManager_uploadKeysWithCircleIdentifier_isInitialUpload_completion___block_invoke_143(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "Completed keys upload", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadKeysWithCircleIdentifier:(id)a3 fromBookmark:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke;
  v12[3] = &unk_1E601C550;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "os_activity_initiate: Calling downloadKeysWithCircleIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

void __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_2;
  block[3] = &unk_1E601C550;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  char v9 = *(unsigned char *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Downloading keys for member circle identifier: %@", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_144;
  v8[3] = &unk_1E601C4D8;
  id v9 = *(id *)(a1 + 48);
  [v5 downloadKeysWithCircleIdentifier:v6 fromBookmark:v7 completion:v8];
}

void __83__SPBeaconSharingManager_downloadKeysWithCircleIdentifier_fromBookmark_completion___block_invoke_144(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "Completed keys download", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatedCircleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling updatedCircleIdentifiers:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Updating circle identifiers: %@ ", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 proxy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_145;
  v7[3] = &unk_1E601C4D8;
  id v8 = *(id *)(a1 + 48);
  [v5 updatedCircleIdentifiers:v6 completion:v7];
}

uint64_t __62__SPBeaconSharingManager_updatedCircleIdentifiers_completion___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkDataIntegrityWithShareIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling checkDataIntegrityWithShareIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@": %@", v2];
  }
  else
  {
    id v3 = &stru_1F0B18CC8;
  }
  id v4 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "Checking data integrity%@ ", buf, 0xCu);
  }

  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 proxy];
  uint64_t v7 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_153;
  v8[3] = &unk_1E601C578;
  id v9 = *(id *)(a1 + 48);
  [v6 checkDataIntegrityWithShareIdentifier:v7 completion:v8];
}

uint64_t __75__SPBeaconSharingManager_checkDataIntegrityWithShareIdentifier_completion___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)lookForOrphanedRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke;
  void v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling lookForOrphanedRecordsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_2;
  block[3] = &unk_1E601B828;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Looking for orphaned item sharing records.", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_155;
  v5[3] = &unk_1E601C5A0;
  id v6 = *(id *)(a1 + 40);
  [v4 lookForOrphanedRecordsWithCompletion:v5];
}

uint64_t __63__SPBeaconSharingManager_lookForOrphanedRecordsWithCompletion___block_invoke_155(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeExpiredSharesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke;
  void v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling removeExpiredSharesWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_2;
  block[3] = &unk_1E601B828;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Removing expired share suggestions and share requests.", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_157;
  v5[3] = &unk_1E601C4D8;
  id v6 = *(id *)(a1 + 40);
  [v4 removeExpiredSharesWithCompletion:v5];
}

uint64_t __60__SPBeaconSharingManager_removeExpiredSharesWithCompletion___block_invoke_157(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sharingLimitsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke;
  void v6[3] = &unk_1E601B828;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling sharingLimitsWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_2;
  block[3] = &unk_1E601B828;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&location);
}

void __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Looking for current share limits.", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_158;
  v5[3] = &unk_1E601C5C8;
  id v6 = *(id *)(a1 + 40);
  [v4 sharingLimitsWithCompletion:v5];
}

uint64_t __54__SPBeaconSharingManager_sharingLimitsWithCompletion___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)delegatedShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __52__SPBeaconSharingManager_delegatedShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling delegatedShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __52__SPBeaconSharingManager_delegatedShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  uint64_t v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SPBeaconSharingManager_delegatedShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __52__SPBeaconSharingManager_delegatedShare_completion___block_invoke_2(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] beaconIdentifier];
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Creating delegated share of %@", buf, 0xCu);
  }
  id v4 = a1[5];
  id v5 = [v4 proxy];
  id v6 = a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SPBeaconSharingManager_delegatedShare_completion___block_invoke_160;
  v7[3] = &unk_1E601C5F0;
  id v8 = v6;
  id v9 = a1[6];
  [v5 delegatedShare:v8 completion:v7];
}

void __52__SPBeaconSharingManager_delegatedShare_completion___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) beaconIdentifier];
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "Created delegated share of %@ (%@)", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopTemporaryItemLocationShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __68__SPBeaconSharingManager_stopTemporaryItemLocationShare_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling stopTemporaryItemLocationShare:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __68__SPBeaconSharingManager_stopTemporaryItemLocationShare_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  uint64_t v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SPBeaconSharingManager_stopTemporaryItemLocationShare_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __68__SPBeaconSharingManager_stopTemporaryItemLocationShare_completion___block_invoke_2(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] beaconIdentifier];
    id v4 = [a1[4] bundleIdentifier];
    id v5 = [v4 appName];
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    BOOL v15 = v5;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Stopping temporary item location share of %@ to recipient %@", buf, 0x16u);
  }
  id v6 = a1[5];
  id v7 = [v6 proxy];
  id v8 = a1[4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SPBeaconSharingManager_stopTemporaryItemLocationShare_completion___block_invoke_162;
  v9[3] = &unk_1E601C4B0;
  id v10 = v8;
  id v11 = a1[6];
  [v7 stopTemporaryItemLocationShare:v10 completion:v9];
}

void __68__SPBeaconSharingManager_stopTemporaryItemLocationShare_completion___block_invoke_162(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) beaconIdentifier];
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "Stopped location share of %@ (%@)", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isBeaconDelegated:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __55__SPBeaconSharingManager_isBeaconDelegated_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Calling isBeaconDelegated:completion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __55__SPBeaconSharingManager_isBeaconDelegated_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  uint64_t v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SPBeaconSharingManager_isBeaconDelegated_completion___block_invoke_2;
  v5[3] = &unk_1E601B878;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, v5);

  objc_destroyWeak(&location);
}

void __55__SPBeaconSharingManager_isBeaconDelegated_completion___block_invoke_2(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] beaconIdentifier];
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Checking if beacon %@ is delegated", buf, 0xCu);
  }
  id v4 = a1[5];
  id v5 = [v4 proxy];
  id v6 = a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SPBeaconSharingManager_isBeaconDelegated_completion___block_invoke_163;
  v7[3] = &unk_1E601C5F0;
  id v8 = v6;
  id v9 = a1[6];
  [v5 getDelegation:v8 completion:v7];
}

void __55__SPBeaconSharingManager_isBeaconDelegated_completion___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) beaconIdentifier];
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "Checked delegated share status of %@ , error: (%@)", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)receivedUpdatedShares:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke;
  void v6[3] = &unk_1E601B920;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPOwnerSession: Called receivedUpdatedShares", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_2;
  v4[3] = &unk_1E601B920;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_sync(v2, v4);
}

void __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "Received updated shares", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) shareUpdateBlock];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) shareUpdateBlock];
    id v5 = dispatch_get_global_queue(17, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_164;
    v7[3] = &unk_1E601C0C0;
    id v9 = v4;
    id v8 = *(id *)(a1 + 40);
    id v6 = v4;
    dispatch_async(v5, v7);
  }
}

void __48__SPBeaconSharingManager_receivedUpdatedShares___block_invoke_164(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  v1 = LogCategory_BeaconSharing();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1B2FD8000, v1, OS_LOG_TYPE_DEFAULT, "Share update block called.", v2, 2u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (id)shareUpdateBlock
{
  return self->_shareUpdateBlock;
}

- (void)setShareUpdateBlock:(id)a3
{
}

- (SPRetryCount)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong(&self->_shareUpdateBlock, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__SPBeaconSharingManager_interruptionHandler___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPBeaconSharingManager: Error re-subscribing share updates %@", (uint8_t *)&v2, 0xCu);
}

@end