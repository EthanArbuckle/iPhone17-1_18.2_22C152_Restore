@interface SKStatusPublishingService
+ (id)logger;
- (BOOL)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4;
- (BOOL)isHandleInvitedFromPrimaryAccountHandle:(id)a3;
- (BOOL)registeredForDelegateCallbacks;
- (NSArray)invitedHandles;
- (NSMapTable)delegates;
- (NSString)statusTypeIdentifier;
- (OS_dispatch_queue)privateWorkQueue;
- (SKStatusPublishingDaemonConnection)daemonConnection;
- (SKStatusPublishingService)initWithStatusTypeIdentifier:(id)a3;
- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4;
- (void)_fetchHandleInvitability:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_inviteHandle:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 completion:(id)a6;
- (void)_inviteHandles:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 completion:(id)a6;
- (void)_isHandleInvitable:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_registerForDelegateCallbacksIfNecessary;
- (void)_simulateCrashIfNecessaryForError:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)fetchHandleInvitabilityFromPrimaryAccountHandle:(id)a3 completion:(id)a4;
- (void)inviteHandleFromPrimaryAccountHandle:(id)a3 withInvitationPayload:(id)a4 completion:(id)a5;
- (void)inviteHandlesFromPrimaryAccountHandle:(id)a3 withInvitationPayload:(id)a4 completion:(id)a5;
- (void)isHandleInvitableFromPrimaryAccountHandle:(id)a3 completion:(id)a4;
- (void)isHandleInvitedFromPrimaryAccountHandle:(id)a3 completion:(id)a4;
- (void)provisionPayloads:(id)a3 completion:(id)a4;
- (void)publishStatusRequest:(id)a3 completion:(id)a4;
- (void)publishingDaemonConnectionDidDisconnect:(id)a3;
- (void)removeAllInvitedHandlesWithCompletion:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeInvitedHandle:(id)a3 completion:(id)a4;
- (void)removeInvitedHandles:(id)a3 completion:(id)a4;
- (void)setDaemonConnection:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setRegisteredForDelegateCallbacks:(BOOL)a3;
@end

@implementation SKStatusPublishingService

- (SKStatusPublishingService)initWithStatusTypeIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKStatusPublishingService;
  v5 = [(SKStatusPublishingService *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    statusTypeIdentifier = v5->_statusTypeIdentifier;
    v5->_statusTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    delegates = v5->_delegates;
    v5->_delegates = (NSMapTable *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.StatusKit.PublishingService", v11);
    privateWorkQueue = v5->_privateWorkQueue;
    v5->_privateWorkQueue = (OS_dispatch_queue *)v12;
  }
  return v5;
}

- (void)publishStatusRequest:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v8 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  v9 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Publishing status request. StatusType: %{public}@ Request: %@", buf, 0x16u);
  }

  v10 = [(SKStatusPublishingService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke;
  v19[3] = &unk_2644B6410;
  id v11 = v8;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  objc_copyWeak(&v23, (id *)buf);
  id v13 = v7;
  id v22 = v13;
  v14 = [v10 asynchronousRemoteDaemonWithErrorHandler:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4;
  v16[3] = &unk_2644B6438;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v13;
  id v17 = v15;
  [v14 publishStatusRequest:v12 statusTypeIdentifier:v11 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);

  objc_destroyWeak((id *)buf);
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKStatusPublishingService logger];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];

    v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Publish status request completed with statusUniqueIdentifier: %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

- (void)provisionPayloads:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v8 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  v9 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v6;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Provisioning request. Payloads: %{public}@", buf, 0xCu);
  }

  v10 = [(SKStatusPublishingService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke;
  v20[3] = &unk_2644B6460;
  id v11 = v8;
  id v21 = v11;
  objc_copyWeak(&v23, (id *)buf);
  id v12 = v7;
  id v22 = v12;
  uint64_t v13 = [v10 asynchronousRemoteDaemonWithErrorHandler:v20];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6;
  v16[3] = &unk_2644B6488;
  objc_copyWeak(&v19, (id *)buf);
  id v14 = v12;
  id v18 = v14;
  id v15 = v11;
  id v17 = v15;
  [v13 provisionPayloads:v6 statusTypeIdentifier:v15 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v23);

  objc_destroyWeak((id *)buf);
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKStatusPublishingService logger];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];

    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Provisioning request completed with statusUniqueIdentifier: %@", (uint8_t *)&v12, 0xCu);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
}

- (NSArray)invitedHandles
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  id v3 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving invited handles. StatusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v5 = [(SKStatusPublishingService *)self daemonConnection];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__SKStatusPublishingService_invitedHandles__block_invoke;
  v14[3] = &unk_2644B64B0;
  id v6 = v3;
  id v15 = v6;
  objc_copyWeak(&v17, &location);
  p_long long buf = &buf;
  id v7 = [v5 synchronousRemoteDaemonWithErrorHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__SKStatusPublishingService_invitedHandles__block_invoke_8;
  v11[3] = &unk_2644B64D8;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &buf;
  [v7 invitedHandlesForStatusTypeIdentifier:v8 completion:v11];
  id v9 = *(id *)(*((void *)&buf + 1) + 40);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (NSArray *)v9;
}

void __43__SKStatusPublishingService_invitedHandles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__SKStatusPublishingService_invitedHandles__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __43__SKStatusPublishingService_invitedHandles__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKStatusPublishingService logger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_21E62A000, v8, OS_LOG_TYPE_ERROR, "Retreived invited handles. StatusType: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Retreived invited handles. StatusType: %{public}@ Handles: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

- (BOOL)isHandleInvitedFromPrimaryAccountHandle:(id)a3
{
  return [(SKStatusPublishingService *)self _isHandleInvited:a3 fromSenderHandle:0];
}

- (BOOL)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  id v8 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  uint64_t v9 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v24 = v8;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (sync) from handle: %@. StatusType: %{public}@", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v24) = 0;
  uint64_t v10 = [(SKStatusPublishingService *)self daemonConnection];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke;
  v20[3] = &unk_2644B6500;
  id v11 = v8;
  id v21 = v11;
  id v22 = buf;
  id v12 = [v10 synchronousRemoteDaemonWithErrorHandler:v20];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_9;
  v16[3] = &unk_2644B6528;
  id v13 = v11;
  id v17 = v13;
  id v14 = v6;
  id v18 = v14;
  uint64_t v19 = buf;
  [v12 isHandleInvited:v14 fromSenderHandle:v7 forStatusTypeIdentifier:v13 completion:v16];
  LOBYTE(v11) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return (char)v11;
}

void __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_9(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKStatusPublishingService logger];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v12 = 138544130;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_21E62A000, v7, OS_LOG_TYPE_ERROR, "Checked if handle is invited (sync). StatusType: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Determined if handle is invited (sync). StatusType: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
}

- (void)isHandleInvitedFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
}

- (void)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v11 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  int v12 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2114;
    v34 = v11;
    _os_log_impl(&dword_21E62A000, v12, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (async) from handle: %@. StatusType: %{public}@", buf, 0x20u);
  }

  uint64_t v13 = [(SKStatusPublishingService *)self daemonConnection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke;
  v25[3] = &unk_2644B6550;
  id v14 = v11;
  id v26 = v14;
  id v15 = v8;
  id v27 = v15;
  id v16 = v10;
  id v28 = v16;
  int v17 = [v13 asynchronousRemoteDaemonWithErrorHandler:v25];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_11;
  v21[3] = &unk_2644B6578;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [v17 isHandleInvited:v19 fromSenderHandle:v9 forStatusTypeIdentifier:v20 completion:v21];
}

void __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_11(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKStatusPublishingService logger];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v12 = 138544130;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_21E62A000, v7, OS_LOG_TYPE_ERROR, "Error while checking if handle has already been invited (async). StatusType: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Checked if handle is invited (async). StatusType: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)isHandleInvitableFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
}

- (void)fetchHandleInvitabilityFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
}

- (void)_fetchHandleInvitability:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v11 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  int v12 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v11;
    _os_log_impl(&dword_21E62A000, v12, OS_LOG_TYPE_DEFAULT, "Fetching handle %@ invitability. StatusType: %{public}@", buf, 0x16u);
  }

  uint64_t v13 = [(SKStatusPublishingService *)self daemonConnection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke;
  v25[3] = &unk_2644B6550;
  id v14 = v11;
  id v26 = v14;
  id v15 = v8;
  id v27 = v15;
  id v16 = v9;
  id v28 = v16;
  int v17 = [v13 asynchronousRemoteDaemonWithErrorHandler:v25];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_12;
  v21[3] = &unk_2644B65A0;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [v17 fetchHandleInvitability:v19 fromHandle:v10 forStatusTypeIdentifier:v20 completion:v21];
}

void __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_12(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKStatusPublishingService logger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[5];
      int v13 = 138544130;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_21E62A000, v8, OS_LOG_TYPE_ERROR, "Error fetching handle invitability. StatusType: %{public}@ Handle: %@ invitability:%@ Error: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    int v13 = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Checked if handle is invitable. StatusType: %{public}@ Handle: %@ invitability: %@", (uint8_t *)&v13, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_isHandleInvitable:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v11 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  uint64_t v12 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v11;
    _os_log_impl(&dword_21E62A000, v12, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ is inviteable. StatusType: %{public}@", buf, 0x16u);
  }

  int v13 = [(SKStatusPublishingService *)self daemonConnection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke;
  v25[3] = &unk_2644B6550;
  id v14 = v11;
  id v26 = v14;
  id v15 = v8;
  id v27 = v15;
  id v16 = v9;
  id v28 = v16;
  __int16 v17 = [v13 asynchronousRemoteDaemonWithErrorHandler:v25];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_14;
  v21[3] = &unk_2644B6578;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [v17 isHandleInviteable:v19 fromHandle:v10 forStatusTypeIdentifier:v20 completion:v21];
}

void __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_14(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKStatusPublishingService logger];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v12 = 138544130;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_21E62A000, v7, OS_LOG_TYPE_ERROR, "Error while checking if handle is inviteable. StatusType: %{public}@ Handle: %@ isInviteable:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Checked if handle is inviteable. StatusType: %{public}@ Handle: %@ isInviteable: %d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)inviteHandleFromPrimaryAccountHandle:(id)a3 withInvitationPayload:(id)a4 completion:(id)a5
{
}

- (void)_inviteHandle:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 completion:(id)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v16 = a3;
  uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 arrayWithObjects:&v16 count:1];

  -[SKStatusPublishingService inviteHandles:fromSenderHandle:withInvitationPayload:completion:](self, "inviteHandles:fromSenderHandle:withInvitationPayload:completion:", v15, v13, v12, v11, v16, v17);
}

- (void)inviteHandlesFromPrimaryAccountHandle:(id)a3 withInvitationPayload:(id)a4 completion:(id)a5
{
}

- (void)_inviteHandles:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 completion:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  id v14 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  uint64_t v15 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v31 = v10;
    __int16 v32 = 2114;
    uint64_t v33 = v14;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl(&dword_21E62A000, v15, OS_LOG_TYPE_DEFAULT, "Received request to invite handles: %@ to personal channel with statusTypeIdentifier: %{public}@ from sender handle: %@", buf, 0x20u);
  }

  id v16 = [(SKStatusPublishingService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke;
  v25[3] = &unk_2644B6410;
  id v17 = v14;
  id v26 = v17;
  id v18 = v10;
  id v27 = v18;
  objc_copyWeak(&v29, (id *)buf);
  id v19 = v13;
  id v28 = v19;
  uint64_t v20 = [v16 asynchronousRemoteDaemonWithErrorHandler:v25];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16;
  v22[3] = &unk_2644B65C8;
  objc_copyWeak(&v24, (id *)buf);
  id v21 = v19;
  id v23 = v21;
  [v20 inviteHandles:v18 fromSenderHandle:v11 withInvitationPayload:v12 statusTypeIdentifier:v17 completion:v22];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v29);

  objc_destroyWeak((id *)buf);
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Inviting handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeInvitedHandle:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

  -[SKStatusPublishingService removeInvitedHandles:completion:](self, "removeInvitedHandles:completion:", v9, v7, v10, v11);
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  id v8 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  uint64_t v9 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Removing invited handles. StatusType: %{public}@ Handles: %@", buf, 0x16u);
  }

  id v10 = [(SKStatusPublishingService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke;
  v19[3] = &unk_2644B6410;
  id v11 = v8;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  objc_copyWeak(&v23, (id *)buf);
  id v13 = v7;
  id v22 = v13;
  id v14 = [v10 asynchronousRemoteDaemonWithErrorHandler:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17;
  v16[3] = &unk_2644B65C8;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v13;
  id v17 = v15;
  [v14 removeInvitedHandles:v12 statusTypeIdentifier:v11 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);

  objc_destroyWeak((id *)buf);
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Remove invited handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
  id v5 = [(SKStatusPublishingService *)self statusTypeIdentifier];
  id v6 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v20 = v5;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Removing all invited handles. StatusType: %{public}@", buf, 0xCu);
  }

  id v7 = [(SKStatusPublishingService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke;
  v15[3] = &unk_2644B6460;
  id v8 = v5;
  id v16 = v8;
  objc_copyWeak(&v18, (id *)buf);
  id v9 = v4;
  id v17 = v9;
  id v10 = [v7 asynchronousRemoteDaemonWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18;
  v12[3] = &unk_2644B65C8;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = v9;
  id v13 = v11;
  [v10 removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier:v8 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);

  objc_destroyWeak((id *)buf);
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Remove all invited handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self->_delegates;
  objc_sync_enter(v7);
  id v8 = [[SKDelegateResponseQueue alloc] initWithQueue:v6];
  [(NSMapTable *)self->_delegates setObject:v8 forKey:v9];

  objc_sync_exit(v7);
  [(SKStatusPublishingService *)self _registerForDelegateCallbacksIfNecessary];
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSMapTable *)self->_delegates removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (void)_registerForDelegateCallbacksIfNecessary
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  obj = self->_delegates;
  objc_sync_enter(obj);
  if (self->_registeredForDelegateCallbacks || ![(NSMapTable *)self->_delegates count])
  {
    objc_sync_exit(obj);
  }
  else
  {
    self->_registeredForDelegateCallbacks = 1;
    objc_sync_exit(obj);

    id v3 = [(SKStatusPublishingService *)self statusTypeIdentifier];
    id v4 = +[SKStatusPublishingService logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v15 = v3;
      _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks for statusTypeIdentifier: %{public}@", buf, 0xCu);
    }

    id v5 = [(SKStatusPublishingService *)self daemonConnection];
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke;
    v12[3] = &unk_2644B65F0;
    objc_copyWeak(&v13, (id *)buf);
    id v6 = [v5 asynchronousRemoteDaemonWithErrorHandler:v12];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20;
    v9[3] = &unk_2644B6618;
    objc_copyWeak(&v11, (id *)buf);
    id v7 = v3;
    id v10 = v7;
    [v6 registerForDelegateCallbacksWithStatusTypeIdentifier:v7 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];
}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKStatusPublishingService logger];
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Completed registration for delegate callbacks for statusTypeIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_simulateCrashIfNecessaryForError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"SKStatusPublishingErrorDomain"];

  if (v6 && [v4 code] == -2000)
  {
    int v7 = +[SKStatusPublishingService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SKStatusPublishingService _simulateCrashIfNecessaryForError:](self, v7);
    }
  }
}

- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_delegates;
  objc_sync_enter(v8);
  uint64_t v9 = (void *)[(NSMapTable *)self->_delegates copy];
  objc_sync_exit(v8);

  if (![v9 count])
  {
    id v10 = +[SKStatusPublishingService logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v10, OS_LOG_TYPE_DEFAULT, "No delegates available to perform publishing service delegate callback", buf, 2u);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v9 keyEnumerator];
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v9 objectForKey:v14];
        uint64_t v16 = [v15 dispatchQueue];
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __76__SKStatusPublishingService__delegatesPerformOnResponseQueueForGroup_block___block_invoke;
        block[3] = &unk_2644B6640;
        id v20 = v7;
        block[4] = v14;
        id v19 = v6;
        dispatch_async(v16, block);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }
}

void __76__SKStatusPublishingService__delegatesPerformOnResponseQueueForGroup_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

- (void)publishingDaemonConnectionDidDisconnect:(id)a3
{
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  self->_registeredForDelegateCallbacks = 0;
  objc_sync_exit(v4);

  dispatch_group_t v5 = dispatch_group_create();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__SKStatusPublishingService_publishingDaemonConnectionDidDisconnect___block_invoke;
  v6[3] = &unk_2644B6668;
  v6[4] = self;
  [(SKStatusPublishingService *)self _delegatesPerformOnResponseQueueForGroup:v5 block:v6];
}

void __69__SKStatusPublishingService_publishingDaemonConnectionDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  dispatch_group_t v5 = +[SKStatusPublishingService logger];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Notifying publishing service delegate that the XPC connection has disconnected", buf, 2u);
    }

    [v3 publishingServiceDaemonDisconnected:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Subscription publishing delegate does not implement the delegate method to be notified the XPC connection has disconnected", v7, 2u);
    }
  }
}

+ (id)logger
{
  if (logger_onceToken_2 != -1) {
    dispatch_once(&logger_onceToken_2, &__block_literal_global_2);
  }
  v2 = (void *)logger__logger_2;
  return v2;
}

uint64_t __35__SKStatusPublishingService_logger__block_invoke()
{
  logger__logger_2 = (uint64_t)os_log_create("com.apple.StatusKit", "PublishingService");
  return MEMORY[0x270F9A758]();
}

- (SKStatusPublishingDaemonConnection)daemonConnection
{
  v2 = self;
  objc_sync_enter(v2);
  daemonConnection = v2->_daemonConnection;
  if (!daemonConnection)
  {
    char v4 = [[SKStatusPublishingDaemonConnection alloc] initWithPublishingDaemonDelegate:v2 connectionDelegate:v2];
    dispatch_group_t v5 = v2->_daemonConnection;
    v2->_daemonConnection = v4;

    daemonConnection = v2->_daemonConnection;
  }
  BOOL v6 = daemonConnection;
  objc_sync_exit(v2);

  return v6;
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (BOOL)registeredForDelegateCallbacks
{
  return self->_registeredForDelegateCallbacks;
}

- (void)setRegisteredForDelegateCallbacks:(BOOL)a3
{
  self->_registeredForDelegateCallbacks = a3;
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error publishing status request. StatusType: %{public}@ statusRequest:%@ Error: %{public}@");
}

void __61__SKStatusPublishingService_publishStatusRequest_completion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Publish status request failed with error: %@", v2, v3, v4, v5, v6);
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "XPC Error Provisioning request. StatusType: %{public}@ Error: %{public}@");
}

void __58__SKStatusPublishingService_provisionPayloads_completion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Provisioning request failed with error: %@", v2, v3, v4, v5, v6);
}

void __43__SKStatusPublishingService_invitedHandles__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "XPC Error retrieving invited handles. StatusType: %{public}@ Error: %{public}@");
}

void __63__SKStatusPublishingService__isHandleInvited_fromSenderHandle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "XPC Error checking if handle is invited (sync). StatusType: %{public}@ Error: %{public}@");
}

void __74__SKStatusPublishingService__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error checking if handle is invited (async). StatusType: %{public}@ handle:%@ Error: %{public}@");
}

void __82__SKStatusPublishingService__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error checking invitability. StatusType: %{public}@ handle:%@ Error: %{public}@");
}

void __76__SKStatusPublishingService__isHandleInvitable_fromSenderHandle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error checking inviteability. StatusType: %{public}@ handle:%@ Error: %{public}@");
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error inviting handles. StatusType: %{public}@ handles:%@ Error: %{public}@");
}

void __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Inviting handles completed with error: %@", v2, v3, v4, v5, v6);
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error removing invited handles. StatusType: %{public}@ handles:%@ Error: %{public}@");
}

void __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Remove invited handles completed with error: %@", v2, v3, v4, v5, v6);
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "XPC Error removing all invited handles. StatusType: %{public}@ Error: %{public}@");
}

void __67__SKStatusPublishingService_removeAllInvitedHandlesWithCompletion___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Remove all invited handles completed with error: %@", v2, v3, v4, v5, v6);
}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error registering for delegate callbacks. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error registering for delegate callbacks. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_simulateCrashIfNecessaryForError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 statusTypeIdentifier];
  OUTLINED_FUNCTION_5();
  __int16 v5 = 2112;
  uint8_t v6 = @"com.apple.StatusKit.publish.types";
  _os_log_fault_impl(&dword_21E62A000, a2, OS_LOG_TYPE_FAULT, "Client is attempting to publish status of type %{public}@ but is not entitled. Client needs %@ entitlement with this status type identifier.", v4, 0x16u);
}

@end