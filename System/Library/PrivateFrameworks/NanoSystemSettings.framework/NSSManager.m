@interface NSSManager
+ (id)cannotUseNSSError;
+ (void)displayAirplaneModeMirroringUserEducationAlert:(BOOL)a3;
+ (void)displayAlertFailedRemoteAirplaneMode:(BOOL)a3;
+ (void)displayAlertWithTitle:(id)a3 body:(id)a4 icon:(id)a5;
- (BOOL)fileTransferInProgress:(id)a3;
- (NSSManager)init;
- (NSSManager)initWithQueue:(id)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)externalQueue;
- (OS_dispatch_queue)internalQueue;
- (id)connection;
- (id)protocol;
- (void)_updateBetaEnrollmentStatus:(id)a3 requiresUnenroll:(BOOL)a4 withCompletion:(id)a5;
- (void)cancelDiagnosticLogTranfer:(id)a3 withCompletion:(id)a4;
- (void)cancelFileTransfersInProgress;
- (void)dealloc;
- (void)deleteDiagnosticLogFile:(id)a3 withResult:(id)a4;
- (void)deviceInUseAfterSetupWithCompletionHandler:(id)a3;
- (void)enableAirplaneMode:(BOOL)a3 completionHandler:(id)a4;
- (void)fetchBetaEnrollmentStatus:(id)a3;
- (void)getAboutInfo:(id)a3;
- (void)getAccountsInfo:(id)a3;
- (void)getAccountsInfoForAccountType:(id)a3 completionHandler:(id)a4;
- (void)getDiagnosticLogFileFromGizmo:(id)a3 withResults:(id)a4;
- (void)getDiagnosticLogsInfo:(id)a3;
- (void)getDiagnosticLogsInfoByCateogry:(id)a3;
- (void)getFullProfileInfoWithIdentifier:(id)a3 includeManagedPayloads:(BOOL)a4 completionHandler:(id)a5;
- (void)getLegalDocuments:(id)a3;
- (void)getLocalesInfo:(id)a3;
- (void)getProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getProfilesInfo:(id)a3;
- (void)getUsage:(id)a3;
- (void)getUsageData:(id)a3;
- (void)getWatchFaces:(id)a3;
- (void)getiCloudInfo:(id)a3;
- (void)installProfile:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)obliterateGizmo:(id)a3;
- (void)obliterateGizmoPreservingeSIM:(BOOL)a3 completionHandler:(id)a4;
- (void)passcodeLockRemoteDeviceWithCompletionHandler:(id)a3;
- (void)purgeUsageBundle:(id)a3 completionHandler:(id)a4;
- (void)purgeUsageBundleWithId:(id)a3 completionHandler:(id)a4;
- (void)rebootDevice;
- (void)recordSoftwareUpdateSpaceFailure:(id)a3 osBeingUpdatedTo:(id)a4 completion:(id)a5;
- (void)removeProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)retrieveAirplaneModeSettingsWithCompletionHandler:(id)a3;
- (void)retrieveDiagnosticLogTransferProgress:(id)a3 withProgress:(id)a4;
- (void)setAirplaneModeSettings:(id)a3 withCompletionHandler:(id)a4;
- (void)setDeviceName:(id)a3;
- (void)setExternalQueue:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setSafetyXpcInterruptionHandlerBlock:(id)a3;
- (void)setWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setXpcConnection:(id)a3;
- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3;
- (void)unsafe_invalidate;
- (void)updateBetaEnrollmentStatus:(id)a3 withCompletion:(id)a4;
@end

@implementation NSSManager

- (void)getAccountsInfo:(id)a3
{
}

void __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained connection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2;
    v11[3] = &unk_2643FB5B8;
    objc_copyWeak(&v13, v2);
    id v12 = *(id *)(a1 + 40);
    v6 = [v5 remoteObjectProxyWithErrorHandler:v11];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2_260;
    v8[3] = &unk_2643FB608;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 40);
    [v6 getAccountsInfoForAccountType:v7 completionHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }
}

- (id)connection
{
  if (NSSShouldRun())
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.nanosystemsettings" options:4096];
      v5 = self->_xpcConnection;
      self->_xpcConnection = v4;

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __24__NSSManager_connection__block_invoke;
      block[3] = &unk_2643FB430;
      block[4] = self;
      if (connection_onceToken != -1) {
        dispatch_once(&connection_onceToken, block);
      }
      [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:connection_remoteObjectInterface];
      [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&__block_literal_global];
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __24__NSSManager_connection__block_invoke_142;
      v8[3] = &unk_2643FB478;
      objc_copyWeak(&v9, &location);
      [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v8];
      [(NSXPCConnection *)self->_xpcConnection resume];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
      xpcConnection = self->_xpcConnection;
    }
    v6 = xpcConnection;
  }
  else
  {
    [(NSSManager *)self unsafe_invalidate];
    v6 = 0;
  }
  return v6;
}

- (void)unsafe_invalidate
{
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)getAccountsInfoForAccountType:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2048;
    v21 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "accountType: (%@); replyBlock: (%p)", buf, 0x16u);
  }
  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  id v10 = (void *)[v6 copy];
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke;
  block[3] = &unk_2643FB7C0;
  objc_copyWeak(&v17, (id *)buf);
  id v15 = v10;
  id v16 = v7;
  id v12 = v10;
  id v13 = v7;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (NSSManager)initWithQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NSSManager;
  v5 = [(NSSManager *)&v15 init];
  if (v5)
  {
    id v6 = NSSLogForType(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v17 = v5;
      _os_log_impl(&dword_21C3BA000, v6, OS_LOG_TYPE_DEFAULT, "%p", buf, 0xCu);
    }

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.nanosystemsettings.NSSManager.%p", v5);
    id v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    if (v4)
    {
      id v10 = (OS_dispatch_queue *)v4;
      externalQueue = v5->_externalQueue;
      v5->_externalQueue = v10;
    }
    else
    {
      id v12 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v13 = MEMORY[0x263EF83A0];
      externalQueue = v5->_externalQueue;
      v5->_externalQueue = v12;
    }
  }
  return v5;
}

- (NSSManager)init
{
  return [(NSSManager *)self initWithQueue:0];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = NSSLogForType(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_21C3BA000, v3, OS_LOG_TYPE_DEFAULT, "%p", buf, 0xCu);
  }

  [(NSSManager *)self unsafe_invalidate];
  v4.receiver = self;
  v4.super_class = (Class)NSSManager;
  [(NSSManager *)&v4 dealloc];
}

- (id)protocol
{
  return &unk_26CC892C0;
}

void __24__NSSManager_connection__block_invoke(uint64_t a1)
{
  v34[5] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263F08D80];
  v2 = [*(id *)(a1 + 32) protocol];
  uint64_t v3 = [v1 interfaceWithProtocol:v2];
  objc_super v4 = (void *)connection_remoteObjectInterface;
  connection_remoteObjectInterface = v3;

  v5 = (void *)connection_remoteObjectInterface;
  id v6 = (void *)MEMORY[0x263EFFA08];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  v34[4] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:5];
  dispatch_queue_t v8 = [v6 setWithArray:v7];
  [v5 setClasses:v8 forSelector:sel_getUsageData_ argumentIndex:0 ofReply:1];

  id v9 = (void *)connection_remoteObjectInterface;
  id v10 = (void *)MEMORY[0x263EFFA08];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  v33[4] = objc_opt_class();
  v33[5] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:6];
  id v12 = [v10 setWithArray:v11];
  [v9 setClasses:v12 forSelector:sel_getUsage_ argumentIndex:0 ofReply:1];

  id v13 = (void *)connection_remoteObjectInterface;
  v14 = (void *)MEMORY[0x263EFFA08];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  v32[5] = objc_opt_class();
  v32[6] = objc_opt_class();
  objc_super v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:7];
  id v16 = [v14 setWithArray:v15];
  [v13 setClasses:v16 forSelector:sel_getProfilesInfo_ argumentIndex:0 ofReply:1];

  id v17 = (void *)connection_remoteObjectInterface;
  uint64_t v18 = (void *)MEMORY[0x263EFFA08];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v31[3] = objc_opt_class();
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  __int16 v20 = [v18 setWithArray:v19];
  [v17 setClasses:v20 forSelector:sel_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler_ argumentIndex:0 ofReply:1];

  v21 = (void *)connection_remoteObjectInterface;
  uint64_t v22 = (void *)MEMORY[0x263EFFA08];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v30[4] = objc_opt_class();
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:5];
  v24 = [v22 setWithArray:v23];
  [v21 setClasses:v24 forSelector:sel_getAccountsInfoForAccountType_completionHandler_ argumentIndex:0 ofReply:1];

  v25 = (void *)connection_remoteObjectInterface;
  v26 = (void *)MEMORY[0x263EFFA08];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  v28 = [v26 setWithArray:v27];
  [v25 setClasses:v28 forSelector:sel_getWatchFaces_ argumentIndex:0 ofReply:1];
}

void __24__NSSManager_connection__block_invoke_2()
{
  v0 = NSSLogForType(1);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21C3BA000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

void __24__NSSManager_connection__block_invoke_142(uint64_t a1)
{
  v2 = NSSLogForType(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C3BA000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24__NSSManager_connection__block_invoke_143;
    block[3] = &unk_2643FB430;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __24__NSSManager_connection__block_invoke_143(uint64_t a1)
{
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

- (void)setSafetyXpcInterruptionHandlerBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__NSSManager_setSafetyXpcInterruptionHandlerBlock___block_invoke;
  v7[3] = &unk_2643FB4A0;
  id v5 = v4;
  id v8 = v5;
  objc_copyWeak(&v9, &location);
  id v6 = (void *)MEMORY[0x21D4A6300](v7);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__NSSManager_setSafetyXpcInterruptionHandlerBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = NSSLogForType(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)MEMORY[0x21D4A6300](*(void *)(a1 + 32));
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_21C3BA000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted, calling safety block %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained xpcConnection];
  [v6 setInterruptionHandler:&__block_literal_global_146];
}

void __51__NSSManager_setSafetyXpcInterruptionHandlerBlock___block_invoke_144()
{
  v0 = NSSLogForType(1);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21C3BA000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSSLogForType(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int v7 = self;
    _os_log_impl(&dword_21C3BA000, v3, OS_LOG_TYPE_DEFAULT, "%p", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__NSSManager_invalidate__block_invoke;
  block[3] = &unk_2643FB430;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __24__NSSManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsafe_invalidate");
}

- (void)enableAirplaneMode:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)MEMORY[0x21D4A6300](v6);
    *(_DWORD *)buf = 67109376;
    BOOL v15 = v4;
    __int16 v16 = 2048;
    id v17 = v8;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "enable: (%d); replyBlock: (%p)", buf, 0x12u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke;
  block[3] = &unk_2643FB568;
  void block[4] = self;
  id v12 = v6;
  BOOL v13 = v4;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2;
    v25[3] = &unk_2643FB4F0;
    v25[4] = *(void *)(a1 + 32);
    id v26 = v3;
    BOOL v4 = (void *)MEMORY[0x21D4A6300](v25);
  }
  else
  {
    BOOL v4 = 0;
  }
  [*(id *)(a1 + 32) setSafetyXpcInterruptionHandlerBlock:v4];
  id v5 = [*(id *)(a1 + 32) externalQueue];
  if (v2)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_4;
    v22[3] = &unk_2643FB540;
    id v24 = *(id *)(a1 + 40);
    id v6 = v5;
    v23 = v6;
    int v7 = [v2 remoteObjectProxyWithErrorHandler:v22];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2_149;
    v19[3] = &unk_2643FB540;
    id v21 = *(id *)(a1 + 40);
    __int16 v20 = v6;
    [v7 enableAirplaneMode:v8 completionHandler:v19];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2_151;
    v18[3] = &unk_2643FB430;
    v18[4] = *(void *)(a1 + 32);
    [v2 addBarrierBlock:v18];

    id v9 = v24;
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v30[0] = @"NSS cannot be used when there is no active device";
    v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v12 = [v10 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v11];

    BOOL v13 = NSSLogForType(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v12;
      _os_log_impl(&dword_21C3BA000, v13, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_159;
    block[3] = &unk_2643FB518;
    id v14 = *(id *)(a1 + 40);
    id v16 = v12;
    id v17 = v14;
    id v9 = v12;
    dispatch_async(v5, block);
  }
}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_3;
  block[3] = &unk_2643FB4C8;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_147;
    v7[3] = &unk_2643FB518;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_2_149(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_150;
    block[3] = &unk_2643FB4C8;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_150(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__NSSManager_enableAirplaneMode_completionHandler___block_invoke_159(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)displayAlertWithTitle:(id)a3 body:(id)a4 icon:(id)a5
{
  v27[7] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v10 = NSSLogForType(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v23 = v9;
    _os_log_impl(&dword_21C3BA000, v10, OS_LOG_TYPE_DEFAULT, "title: (%@); body: (%@); iconURL: (%@)", buf, 0x20u);
  }

  if (v7 && v8)
  {
    uint64_t v11 = *MEMORY[0x263EFFFD8];
    v26[0] = *MEMORY[0x263EFFFC8];
    v26[1] = v11;
    v27[0] = v7;
    v27[1] = v8;
    uint64_t v12 = *MEMORY[0x263EFFFE0];
    v26[2] = *MEMORY[0x263F79610];
    v26[3] = v12;
    v27[2] = MEMORY[0x263EFFA80];
    v27[3] = MEMORY[0x263EFFA88];
    uint64_t v13 = *MEMORY[0x263F795B8];
    v26[4] = *MEMORY[0x263F79628];
    v26[5] = v13;
    v27[4] = MEMORY[0x263EFFA80];
    v27[5] = MEMORY[0x263EFFA80];
    v26[6] = *MEMORY[0x263F79660];
    v27[6] = MEMORY[0x263EFFA80];
    id v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:7];
    BOOL v15 = [v14 mutableCopy];

    if (v9) {
      [v15 setObject:v9 forKeyedSubscript:*MEMORY[0x263F00008]];
    }
    SInt32 error = 0;
    CFUserNotificationRef v16 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v15);
    if (v16 && !error) {
      goto LABEL_12;
    }
    id v17 = NSSLogForType(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = error;
      _os_log_impl(&dword_21C3BA000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create CFUserNotificationRef (%p) with error: %d", buf, 0x12u);
    }

    if (v16)
    {
LABEL_12:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v23 = __Block_byref_object_copy_;
      id v24 = __Block_byref_object_dispose_;
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "+[NSSManager displayAlertWithTitle:body:icon:]");
      NSSOSTransactionCreate(v18);
      id v25 = (id)objc_claimAutoreleasedReturnValue();

      id v19 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__NSSManager_displayAlertWithTitle_body_icon___block_invoke;
      block[3] = &unk_2643FB590;
      void block[4] = buf;
      void block[5] = v16;
      dispatch_async(v19, block);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    BOOL v15 = NSSLogForType(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_21C3BA000, v15, OS_LOG_TYPE_DEFAULT, "Error: alert has either nil title (%@) or body (%@)", buf, 0x16u);
    }
  }
}

void __46__NSSManager_displayAlertWithTitle_body_icon___block_invoke(uint64_t a1)
{
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 0.0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  NSSOSTransactionComplete(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

+ (void)displayAlertFailedRemoteAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21C3EFDEA, v12, 2u);
  }

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v3) {
    id v8 = @"ENABLE_AIRPLANE_ALERT_MSG_COMPANION";
  }
  else {
    id v8 = @"DISABLE_AIRPLANE_ALERT_MSG_COMPANION";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_26CC7AE70 table:@"Localization-shared"];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"AIRPLANE_ALERT_TITLE" value:&stru_26CC7AE70 table:@"Localization-shared"];
  [a1 displayAlertWithTitle:v11 body:v9 icon:0];
}

+ (void)displayAirplaneModeMirroringUserEducationAlert:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21C3EFDEA, v12, 2u);
  }

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v3) {
    id v8 = @"ENABLE_AIRPLANE_EDUCATION_ALERT_MSG_COMPANION";
  }
  else {
    id v8 = @"DISABLE_AIRPLANE_EDUCATION_ALERT_MSG_COMPANION";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_26CC7AE70 table:@"Localization-shared"];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"AIRPLANE_EDUCATION_ALERT_TITLE" value:&stru_26CC7AE70 table:@"Localization-shared"];
  [a1 displayAlertWithTitle:v11 body:v9 icon:0];
}

- (void)retrieveAirplaneModeSettingsWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyblock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyblock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke;
  block[3] = &unk_2643FB630;
  objc_copyWeak(&v11, (id *)buf);
  void block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = [a1[4] connection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_2643FB5B8;
    objc_copyWeak(&v11, v2);
    id v10 = a1[5];
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v9];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2_194;
    v6[3] = &unk_2643FB608;
    objc_copyWeak(&v8, v2);
    id v7 = a1[5];
    [v5 retrieveAirplaneModeSettingsWithCompletionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v11);
  }
}

void __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_193;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_2_194(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_3;
    block[3] = &unk_2643FB5E0;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __64__NSSManager_retrieveAirplaneModeSettingsWithCompletionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setAirplaneModeSettings:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 134217984;
    __int16 v20 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  id v10 = [v6 allKeys];
  uint64_t v11 = [v10 count];

  if (v11 != 3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"setting dict must have all three keys"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke;
  v15[3] = &unk_2643FB658;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v6;
  id v17 = v7;
  v15[4] = self;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(internalQueue, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) connection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_2643FB5B8;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 48);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2_203;
    v7[3] = &unk_2643FB608;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 48);
    [v5 setAirplaneModeSettings:v6 withCompletionHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
}

void __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_202;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_2_203(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_3;
    block[3] = &unk_2643FB5E0;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __60__NSSManager_setAirplaneModeSettings_withCompletionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getUsageData:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    id v13 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__NSSManager_getUsageData___block_invoke;
  v9[3] = &unk_2643FB6A8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __27__NSSManager_getUsageData___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained connection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__NSSManager_getUsageData___block_invoke_2;
    v10[3] = &unk_2643FB5B8;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 32);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__NSSManager_getUsageData___block_invoke_2_205;
    v7[3] = &unk_2643FB680;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    [v6 getUsageData:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
}

void __27__NSSManager_getUsageData___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__NSSManager_getUsageData___block_invoke_204;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __27__NSSManager_getUsageData___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __27__NSSManager_getUsageData___block_invoke_2_205(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "usageRespMsg: (%@); error: (%@)", buf, 0x16u);
  }

  id v8 = +[NSSUsageData newUsageDataFromUsageRespMsg:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__NSSManager_getUsageData___block_invoke_207;
    block[3] = &unk_2643FB5E0;
    id v15 = *(id *)(a1 + 32);
    id v13 = v8;
    id v14 = v6;
    dispatch_async(v11, block);
  }
}

uint64_t __27__NSSManager_getUsageData___block_invoke_207(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deviceInUseAfterSetupWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    id v13 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke;
  v9[3] = &unk_2643FB6A8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained connection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_2643FB5B8;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 32);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2_210;
    v7[3] = &unk_2643FB6F8;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    [v6 notifyRemoteDeviceOfUsageAfterSetup:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
}

void __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "Notify Usage of Remote Device Error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_209;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_209(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_2_210(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = NSSLogForType(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_21C3BA000, v6, OS_LOG_TYPE_DEFAULT, "Notify Usage of Remote Device Success: %{BOOL}d Error: (%@)", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_211;
    block[3] = &unk_2643FB6D0;
    id v12 = *(id *)(a1 + 32);
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __57__NSSManager_deviceInUseAfterSetupWithCompletionHandler___block_invoke_211(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)passcodeLockRemoteDeviceWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    char v13 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke;
  v9[3] = &unk_2643FB6A8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained connection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_2643FB5B8;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 32);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2_214;
    v7[3] = &unk_2643FB6F8;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    [v6 askRemoteDeviceToPasscodeLockWithCompletionHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
}

void __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "Passcode Lock Remote Device Error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_213;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_2_214(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = NSSLogForType(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_21C3BA000, v6, OS_LOG_TYPE_DEFAULT, "Passcode Lock Remote Device. Error: (%@)", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_215;
    block[3] = &unk_2643FB6D0;
    id v12 = *(id *)(a1 + 32);
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __60__NSSManager_passcodeLockRemoteDeviceWithCompletionHandler___block_invoke_215(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)getUsage:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __23__NSSManager_getUsage___block_invoke;
  v8[3] = &unk_2643FB720;
  id v9 = v4;
  id v7 = v4;
  [(NSSManager *)self getUsageData:v8];
}

void __23__NSSManager_getUsage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[NSSUsageData createLegacyUsageDictionary:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)purgeUsageBundle:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = v9;
  if (!v9)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"nil bundle: (%@)", 0 format];
    id v7 = 0;
  }
  id v8 = [v7 bundleIdentifier];
  [(NSSManager *)self purgeUsageBundleWithId:v8 completionHandler:v6];
}

- (void)purgeUsageBundleWithId:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "bundleIdentifier: (%@); replyBlock: (%@)", buf, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil bundle identifier"];
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke;
  block[3] = &unk_2643FB770;
  id v14 = v6;
  id v15 = v7;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(internalQueue, block);
}

void __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  id v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2;
    v20[3] = &unk_2643FB748;
    id v21 = *(id *)(a1 + 48);
    objc_copyWeak(&v22, &location);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v20];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2_224;
    v17[3] = &unk_2643FB748;
    uint64_t v6 = *(void *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    objc_copyWeak(&v19, &location);
    [v5 purgeUsageBundle:v6 replyHandler:v17];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2_226;
    v16[3] = &unk_2643FB430;
    v16[4] = *(void *)(a1 + 32);
    [v3 addBarrierBlock:v16];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v22);
    id v7 = v21;
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"NSS cannot be used when there is no active device";
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v10 = [v8 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v9];

    id v11 = NSSLogForType(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v10;
      _os_log_impl(&dword_21C3BA000, v11, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_227;
    v13[3] = &unk_2643FB518;
    id v12 = *(id *)(a1 + 48);
    id v14 = v10;
    id v15 = v12;
    id v7 = v10;
    dispatch_async(v4, v13);
  }
  objc_destroyWeak(&location);
}

void __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_223;
      v8[3] = &unk_2643FB518;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_2_224(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_225;
      v8[3] = &unk_2643FB518;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_225(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__NSSManager_purgeUsageBundleWithId_completionHandler___block_invoke_227(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getDiagnosticLogFileFromGizmo:(id)a3 withResults:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 134217984;
    id v18 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke;
  block[3] = &unk_2643FB7C0;
  objc_copyWeak(&v16, (id *)buf);
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained connection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2;
    v11[3] = &unk_2643FB5B8;
    objc_copyWeak(&v13, v2);
    id v12 = *(id *)(a1 + 40);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v11];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2_229;
    v8[3] = &unk_2643FB798;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 40);
    [v6 getDiagnosticLogFileFromGizmo:v7 withResults:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }
}

void __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_228;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_2_229(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "downloaded file path: %@; error: (%@)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_230;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __56__NSSManager_getDiagnosticLogFileFromGizmo_withResults___block_invoke_230(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)retrieveDiagnosticLogTransferProgress:(id)a3 withProgress:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "retrieving file transfer progress for %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke;
  v12[3] = &unk_2643FB658;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(internalQueue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) connection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2;
    v10[3] = &unk_2643FB5B8;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 48);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2_233;
    v7[3] = &unk_2643FB810;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 48);
    [v5 retrieveDiagnosticLogTransferProgress:v6 withProgress:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
}

void __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_232;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_232(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_2_233(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = NSSLogForType(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = a2;
    _os_log_impl(&dword_21C3BA000, v6, OS_LOG_TYPE_DEFAULT, "retrieved progress %lu", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_234;
    block[3] = &unk_2643FB7E8;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = a2;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __65__NSSManager_retrieveDiagnosticLogTransferProgress_withProgress___block_invoke_234(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)cancelDiagnosticLogTranfer:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke;
  v13[3] = &unk_2643FB658;
  objc_copyWeak(&v16, (id *)buf);
  id v14 = v6;
  id v15 = v7;
  void v13[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(internalQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) connection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2;
    v11[3] = &unk_2643FB5B8;
    objc_copyWeak(&v13, v2);
    id v12 = *(id *)(a1 + 48);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v11];
    id v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2_237;
    v7[3] = &unk_2643FB838;
    id v8 = v6;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 48);
    [v5 cancelDiagnosticLogTranfer:v8 withCompletion:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }
}

void __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_236;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_2_237(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = NSSLogForType(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "cancelled log file %@ with error: %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained externalQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_238;
    v9[3] = &unk_2643FB518;
    id v11 = *(id *)(a1 + 40);
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __56__NSSManager_cancelDiagnosticLogTranfer_withCompletion___block_invoke_238(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)cancelFileTransfersInProgress
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NSSManager_cancelFileTransfersInProgress__block_invoke;
  block[3] = &unk_2643FB430;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __43__NSSManager_cancelFileTransfersInProgress__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 remoteObjectProxy];
    [v4 cancelActiveLogFileTranfers];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__NSSManager_cancelFileTransfersInProgress__block_invoke_2;
    v9[3] = &unk_2643FB430;
    void v9[4] = *(void *)(a1 + 32);
    [v3 addBarrierBlock:v9];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"NSS cannot be used when there is no active device";
    id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = [v5 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v6];

    id v8 = NSSLogForType(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
}

- (BOOL)fileTransferInProgress:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  uint64_t v5 = [v3 defaultManager];
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF contains '%@'", v4];

  id v14 = 0;
  id v7 = [v5 subpathsOfDirectoryAtPath:@"/var/mobile/Library/IdentityServices/files/" error:&v14];
  id v8 = v14;
  id v9 = [v7 filteredArrayUsingPredicate:v6];
  id v10 = [v9 firstObject];

  if (v8)
  {
    id v11 = NSSLogForType(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_21C3BA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to find files in transit with error: %@", buf, 0xCu);
    }
  }
  if (v10)
  {
    uint64_t v12 = NSSLogForType(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_21C3BA000, v12, OS_LOG_TYPE_DEFAULT, "Found file transfer in progress at path: %@", buf, 0xCu);
    }
  }
  return v10 != 0;
}

- (void)getDiagnosticLogsInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__NSSManager_getDiagnosticLogsInfo___block_invoke;
  v8[3] = &unk_2643FB860;
  id v9 = v4;
  id v7 = v4;
  [(NSSManager *)self getDiagnosticLogsInfoByCateogry:v8];
}

uint64_t __36__NSSManager_getDiagnosticLogsInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDiagnosticLogsInfoByCateogry:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke;
  block[3] = &unk_2643FB630;
  objc_copyWeak(&v11, (id *)buf);
  void block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = [a1[4] connection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2;
    v9[3] = &unk_2643FB5B8;
    objc_copyWeak(&v11, v2);
    id v10 = a1[5];
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v9];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2_246;
    v6[3] = &unk_2643FB8B0;
    objc_copyWeak(&v8, v2);
    id v7 = a1[5];
    [v5 getDiagnosticLogsInfo:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v11);
  }
}

void __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_245;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_245(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_2_246(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = NSSLogForType(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = [v7 count];
    __int16 v21 = 2048;
    uint64_t v22 = [v8 count];
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_21C3BA000, v10, OS_LOG_TYPE_DEFAULT, "replyArr: (%lu paths); directoryPaths: (%lu categories) error: (%@)",
      buf,
      0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = [WeakRetained externalQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_247;
    v14[3] = &unk_2643FB888;
    id v18 = *(id *)(a1 + 32);
    id v15 = v7;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v13, v14);
  }
}

uint64_t __46__NSSManager_getDiagnosticLogsInfoByCateogry___block_invoke_247(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)deleteDiagnosticLogFile:(id)a3 withResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 134217984;
    id v18 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke;
  block[3] = &unk_2643FB7C0;
  objc_copyWeak(&v16, (id *)buf);
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained connection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2;
    v11[3] = &unk_2643FB5B8;
    objc_copyWeak(&v13, v2);
    id v12 = *(id *)(a1 + 40);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v11];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2_249;
    v8[3] = &unk_2643FB5B8;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 40);
    [v6 deleteDiagnosticLogFile:v7 withResult:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }
}

void __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_248;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_248(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_2_249(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = NSSLogForType(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "Error returned from gizmo when attempting to delete log file: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_250;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __49__NSSManager_deleteDiagnosticLogFile_withResult___block_invoke_250(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getAboutInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__NSSManager_getAboutInfo___block_invoke;
  v9[3] = &unk_2643FB6A8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __27__NSSManager_getAboutInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained connection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __27__NSSManager_getAboutInfo___block_invoke_2;
    v10[3] = &unk_2643FB5B8;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 32);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__NSSManager_getAboutInfo___block_invoke_2_252;
    v7[3] = &unk_2643FB608;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    [v6 getAboutInfo:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
}

void __27__NSSManager_getAboutInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__NSSManager_getAboutInfo___block_invoke_251;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __27__NSSManager_getAboutInfo___block_invoke_251(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __27__NSSManager_getAboutInfo___block_invoke_2_252(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = [v5 count];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__NSSManager_getAboutInfo___block_invoke_253;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __27__NSSManager_getAboutInfo___block_invoke_253(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setDeviceName:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "name: (%@)", buf, 0xCu);
  }

  id v6 = (void *)[v4 copy];
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__NSSManager_setDeviceName___block_invoke;
  v9[3] = &unk_2643FB8D8;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(internalQueue, v9);
}

void __28__NSSManager_setDeviceName___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 remoteObjectProxy];
    [v4 setDeviceName:*(void *)(a1 + 40)];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __28__NSSManager_setDeviceName___block_invoke_2;
    v9[3] = &unk_2643FB430;
    void v9[4] = *(void *)(a1 + 32);
    [v3 addBarrierBlock:v9];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"NSS cannot be used when there is no active device";
    id v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v7 = [v5 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v6];

    id v8 = NSSLogForType(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
}

- (void)obliterateGizmo:(id)a3
{
}

- (void)obliterateGizmoPreservingeSIM:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)MEMORY[0x21D4A6300](v6);
    *(_DWORD *)buf = 134218240;
    id v15 = v8;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p); preserveeSIM: (%d)", buf, 0x12u);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke;
  block[3] = &unk_2643FB568;
  void block[4] = self;
  id v12 = v6;
  BOOL v13 = v4;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  BOOL v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2;
    v20[3] = &unk_2643FB748;
    id v21 = *(id *)(a1 + 40);
    objc_copyWeak(&v22, &location);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v20];
    BOOL v6 = *(unsigned char *)(a1 + 48) != 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2_255;
    v17[3] = &unk_2643FB748;
    id v18 = *(id *)(a1 + 40);
    objc_copyWeak(&v19, &location);
    [v5 obliterateGizmoPreservingeSIM:v6 completionHandler:v17];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2_257;
    v16[3] = &unk_2643FB430;
    v16[4] = *(void *)(a1 + 32);
    [v3 addBarrierBlock:v16];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v22);
    id v7 = v21;
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"NSS cannot be used when there is no active device";
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v10 = [v8 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v9];

    id v11 = NSSLogForType(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v10;
      _os_log_impl(&dword_21C3BA000, v11, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_258;
    v13[3] = &unk_2643FB518;
    id v12 = *(id *)(a1 + 40);
    id v14 = v10;
    id v15 = v12;
    id v7 = v10;
    dispatch_async(v4, v13);
  }
  objc_destroyWeak(&location);
}

void __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_254;
      v8[3] = &unk_2643FB518;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_254(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_2_255(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_256;
      v8[3] = &unk_2643FB518;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __62__NSSManager_obliterateGizmoPreservingeSIM_completionHandler___block_invoke_258(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getiCloudInfo:(id)a3
{
}

void __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_259;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_2_260(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = [v5 count];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_261;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __62__NSSManager_getAccountsInfoForAccountType_completionHandler___block_invoke_261(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getProfilesInfo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    id v13 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"replyBlock: (%@)", 0 format];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__NSSManager_getProfilesInfo___block_invoke;
  block[3] = &unk_2643FB6A8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __30__NSSManager_getProfilesInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained connection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __30__NSSManager_getProfilesInfo___block_invoke_2;
    v10[3] = &unk_2643FB5B8;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 32);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__NSSManager_getProfilesInfo___block_invoke_2_266;
    v7[3] = &unk_2643FB608;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    [v6 getProfilesInfo:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
}

void __30__NSSManager_getProfilesInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__NSSManager_getProfilesInfo___block_invoke_265;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __30__NSSManager_getProfilesInfo___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __30__NSSManager_getProfilesInfo___block_invoke_2_266(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = [v5 count];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__NSSManager_getProfilesInfo___block_invoke_267;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __30__NSSManager_getProfilesInfo___block_invoke_267(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 134217984;
    __int16 v17 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v6 || !v7)
  {
    id v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = *MEMORY[0x263EFF4A0];
    id v12 = (void *)MEMORY[0x21D4A6300](v7);
    [v10 raise:v11, @"nil identifier: (%@) or replyBlock: (%@)", v6, v12 format];
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__NSSManager_getProfileWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_2643FB900;
  id v15 = v7;
  id v13 = v7;
  [(NSSManager *)self getFullProfileInfoWithIdentifier:v6 includeManagedPayloads:0 completionHandler:v14];
}

void __57__NSSManager_getProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"ProfileData"];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)getFullProfileInfoWithIdentifier:(id)a3 includeManagedPayloads:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = NSSLogForType(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)MEMORY[0x21D4A6300](v9);
    *(_DWORD *)buf = 134217984;
    id v24 = v11;
    _os_log_impl(&dword_21C3BA000, v10, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v8 || !v9)
  {
    id v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF4A0];
    id v14 = (void *)MEMORY[0x21D4A6300](v9);
    [v12 raise:v13, @"nil identifier: (%@) or replyBlock: (%@)", v8, v14 format];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke;
  block[3] = &unk_2643FB928;
  objc_copyWeak(&v21, (id *)buf);
  id v19 = v8;
  id v20 = v9;
  BOOL v22 = a4;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained connection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2;
    v12[3] = &unk_2643FB5B8;
    objc_copyWeak(&v14, v2);
    id v13 = *(id *)(a1 + 40);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v12];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2_272;
    v9[3] = &unk_2643FB608;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 40);
    [v6 getFullProfileInfoWithIdentifier:v7 includeManagedPayloads:v8 completionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
  }
}

void __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_271;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_271(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_2_272(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = [v5 count];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_273;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __88__NSSManager_getFullProfileInfoWithIdentifier_includeManagedPayloads_completionHandler___block_invoke_273(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)installProfile:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 length];
    id v10 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 134218240;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    id v21 = v10;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "profileData: (%lu bytes); replyBlock: (%p)", buf, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"profileData: (%@)", 0 format];
  }
  id v11 = (void *)[v6 copy];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__NSSManager_installProfile_completionHandler___block_invoke;
  block[3] = &unk_2643FB770;
  id v16 = v11;
  id v17 = v7;
  void block[4] = self;
  id v13 = v11;
  id v14 = v7;
  dispatch_async(internalQueue, block);
}

void __47__NSSManager_installProfile_completionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  uint64_t v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_2;
    v20[3] = &unk_2643FB5B8;
    objc_copyWeak(&v22, &location);
    id v21 = *(id *)(a1 + 48);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v20];
    uint64_t v6 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_2_278;
    v17[3] = &unk_2643FB5B8;
    objc_copyWeak(&v19, &location);
    id v18 = *(id *)(a1 + 48);
    [v5 installProfile:v6 replyHandler:v17];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_2_280;
    v16[3] = &unk_2643FB430;
    v16[4] = *(void *)(a1 + 32);
    [v3 addBarrierBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"NSS cannot be used when there is no active device";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v8];

    id v10 = NSSLogForType(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v9;
      _os_log_impl(&dword_21C3BA000, v10, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_281;
    v13[3] = &unk_2643FB518;
    id v11 = *(id *)(a1 + 48);
    id v14 = v9;
    id v15 = v11;
    id v12 = v9;
    dispatch_async(v4, v13);
  }
  objc_destroyWeak(&location);
}

void __47__NSSManager_installProfile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_277;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __47__NSSManager_installProfile_completionHandler___block_invoke_277(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __47__NSSManager_installProfile_completionHandler___block_invoke_2_278(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__NSSManager_installProfile_completionHandler___block_invoke_279;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __47__NSSManager_installProfile_completionHandler___block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __47__NSSManager_installProfile_completionHandler___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)MEMORY[0x21D4A6300](v7);
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2048;
    __int16 v20 = v9;
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "identifier: (%@); replyBlock: (%p)", buf, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"identifier: (%@)", 0 format];
  }
  id v10 = (void *)[v6 copy];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_2643FB770;
  id v15 = v10;
  id v16 = v7;
  void block[4] = self;
  id v12 = v10;
  id v13 = v7;
  dispatch_async(internalQueue, block);
}

void __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  uint64_t v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2;
    v20[3] = &unk_2643FB5B8;
    objc_copyWeak(&v22, &location);
    id v21 = *(id *)(a1 + 48);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v20];
    uint64_t v6 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2_286;
    v17[3] = &unk_2643FB5B8;
    objc_copyWeak(&v19, &location);
    id v18 = *(id *)(a1 + 48);
    [v5 removeProfileWithIdentifier:v6 replyHandler:v17];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2_288;
    v16[3] = &unk_2643FB430;
    v16[4] = *(void *)(a1 + 32);
    [v3 addBarrierBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"NSS cannot be used when there is no active device";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v9 = [v7 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v8];

    id v10 = NSSLogForType(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v9;
      _os_log_impl(&dword_21C3BA000, v10, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_289;
    v13[3] = &unk_2643FB518;
    id v11 = *(id *)(a1 + 48);
    id v14 = v9;
    id v15 = v11;
    id v12 = v9;
    dispatch_async(v4, v13);
  }
  objc_destroyWeak(&location);
}

void __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_285;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_285(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_2_286(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_287;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __60__NSSManager_removeProfileWithIdentifier_completionHandler___block_invoke_289(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)rebootDevice
{
  id v3 = NSSLogForType(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C3BA000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21C3EFDEA, buf, 2u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__NSSManager_rebootDevice__block_invoke;
  block[3] = &unk_2643FB430;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __26__NSSManager_rebootDevice__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 remoteObjectProxy];
    [v4 rebootDevice];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __26__NSSManager_rebootDevice__block_invoke_2;
    v9[3] = &unk_2643FB430;
    void v9[4] = *(void *)(a1 + 32);
    [v3 addBarrierBlock:v9];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"NSS cannot be used when there is no active device";
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = [v5 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v6];

    uint64_t v8 = NSSLogForType(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
}

- (void)getLegalDocuments:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__NSSManager_getLegalDocuments___block_invoke;
  v9[3] = &unk_2643FB4F0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);
}

void __32__NSSManager_getLegalDocuments___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  id v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __32__NSSManager_getLegalDocuments___block_invoke_2;
    v18[3] = &unk_2643FB5B8;
    objc_copyWeak(&v20, &location);
    id v19 = *(id *)(a1 + 40);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v18];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __32__NSSManager_getLegalDocuments___block_invoke_2_291;
    v15[3] = &unk_2643FB608;
    objc_copyWeak(&v17, &location);
    id v16 = *(id *)(a1 + 40);
    [v5 getLegalDocuments:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"NSS cannot be used when there is no active device";
    id v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v8 = [v6 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v7];

    id v9 = NSSLogForType(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v23 = v8;
      _os_log_impl(&dword_21C3BA000, v9, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__NSSManager_getLegalDocuments___block_invoke_293;
    block[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 40);
    id v13 = v8;
    id v14 = v10;
    id v11 = v8;
    dispatch_async(v4, block);
  }
  objc_destroyWeak(&location);
}

void __32__NSSManager_getLegalDocuments___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__NSSManager_getLegalDocuments___block_invoke_290;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __32__NSSManager_getLegalDocuments___block_invoke_290(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __32__NSSManager_getLegalDocuments___block_invoke_2_291(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = [v5 count];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__NSSManager_getLegalDocuments___block_invoke_292;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __32__NSSManager_getLegalDocuments___block_invoke_292(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __32__NSSManager_getLegalDocuments___block_invoke_293(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)getLocalesInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 134217984;
    id v12 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__NSSManager_getLocalesInfo___block_invoke;
  v9[3] = &unk_2643FB4F0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);
}

void __29__NSSManager_getLocalesInfo___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  id v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __29__NSSManager_getLocalesInfo___block_invoke_2;
    v18[3] = &unk_2643FB5B8;
    objc_copyWeak(&v20, &location);
    id v19 = *(id *)(a1 + 40);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v18];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __29__NSSManager_getLocalesInfo___block_invoke_2_295;
    v15[3] = &unk_2643FB608;
    objc_copyWeak(&v17, &location);
    id v16 = *(id *)(a1 + 40);
    [v5 getLocalesInfo:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"NSS cannot be used when there is no active device";
    id v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v8 = [v6 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v7];

    id v9 = NSSLogForType(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v23 = v8;
      _os_log_impl(&dword_21C3BA000, v9, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__NSSManager_getLocalesInfo___block_invoke_297;
    block[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 40);
    id v13 = v8;
    id v14 = v10;
    id v11 = v8;
    dispatch_async(v4, block);
  }
  objc_destroyWeak(&location);
}

void __29__NSSManager_getLocalesInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__NSSManager_getLocalesInfo___block_invoke_294;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __29__NSSManager_getLocalesInfo___block_invoke_294(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __29__NSSManager_getLocalesInfo___block_invoke_2_295(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = [v5 count];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "replyDict: (%lu keys); error: (%@)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__NSSManager_getLocalesInfo___block_invoke_296;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __29__NSSManager_getLocalesInfo___block_invoke_296(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __29__NSSManager_getLocalesInfo___block_invoke_297(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)recordSoftwareUpdateSpaceFailure:(id)a3 osBeingUpdatedTo:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSSLogForType(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)MEMORY[0x21D4A6300](v10);
    *(_DWORD *)buf = 134217984;
    id v22 = v12;
    _os_log_impl(&dword_21C3BA000, v11, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke;
  v17[3] = &unk_2643FB950;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v10;
  dispatch_async(internalQueue, v17);
}

void __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  id v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2;
    v20[3] = &unk_2643FB5B8;
    objc_copyWeak(&v22, &location);
    id v21 = *(id *)(a1 + 56);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v20];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2_299;
    v17[3] = &unk_2643FB5B8;
    objc_copyWeak(&v19, &location);
    id v18 = *(id *)(a1 + 56);
    [v5 recordSoftwareUpdateSpaceFailure:v6 osBeingUpdatedTo:v7 completion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"NSS cannot be used when there is no active device";
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v10 = [v8 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v9];

    id v11 = NSSLogForType(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v10;
      _os_log_impl(&dword_21C3BA000, v11, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_301;
    block[3] = &unk_2643FB518;
    id v12 = *(id *)(a1 + 56);
    id v15 = v10;
    id v16 = v12;
    id v13 = v10;
    dispatch_async(v4, block);
  }
  objc_destroyWeak(&location);
}

void __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_298;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_298(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_2_299(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = NSSLogForType(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_300;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_300(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__NSSManager_recordSoftwareUpdateSpaceFailure_osBeingUpdatedTo_completion___block_invoke_301(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getWatchFaces:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 136315394;
    id v12 = "-[NSSManager getWatchFaces:]";
    __int16 v13 = 2048;
    id v14 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "%s replyBlock: (%p)", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__NSSManager_getWatchFaces___block_invoke;
  v9[3] = &unk_2643FB4F0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);
}

void __28__NSSManager_getWatchFaces___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  id v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __28__NSSManager_getWatchFaces___block_invoke_2;
    v18[3] = &unk_2643FB5B8;
    objc_copyWeak(&v20, &location);
    id v19 = *(id *)(a1 + 40);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v18];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __28__NSSManager_getWatchFaces___block_invoke_2_303;
    v15[3] = &unk_2643FB978;
    objc_copyWeak(&v17, &location);
    id v16 = *(id *)(a1 + 40);
    [v5 getWatchFaces:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"NSS cannot be used when there is no active device";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v8 = [v6 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v7];

    id v9 = NSSLogForType(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v8;
      _os_log_impl(&dword_21C3BA000, v9, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__NSSManager_getWatchFaces___block_invoke_306;
    block[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 40);
    id v13 = v8;
    id v14 = v10;
    id v11 = v8;
    dispatch_async(v4, block);
  }
  objc_destroyWeak(&location);
}

void __28__NSSManager_getWatchFaces___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__NSSManager_getWatchFaces___block_invoke_302;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __28__NSSManager_getWatchFaces___block_invoke_302(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __28__NSSManager_getWatchFaces___block_invoke_2_303(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = [v5 count];
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "getWatchFaces replyArray: (%lu items); error: (%@)",
      buf,
      0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__NSSManager_getWatchFaces___block_invoke_304;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __28__NSSManager_getWatchFaces___block_invoke_304(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __28__NSSManager_getWatchFaces___block_invoke_306(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)setWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSSLogForType(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 UUIDString];
    id v13 = (void *)MEMORY[0x21D4A6300](v10);
    *(_DWORD *)buf = 136315906;
    uint64_t v23 = "-[NSSManager setWatchFaceIdentifier:forFocusModeIdentifier:completionHandler:]";
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = v13;
    _os_log_impl(&dword_21C3BA000, v11, OS_LOG_TYPE_DEFAULT, "%s watchFaceIdentifier: (%@) focusModeIdentifier: (%@) replyBlock: (%p)", buf, 0x2Au);
  }
  internalQueue = self->_internalQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_2643FB950;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  dispatch_async(internalQueue, v18);
}

void __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*v2 connection];
  id v4 = [*(id *)(a1 + 32) externalQueue];
  if (v3)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2;
    v20[3] = &unk_2643FB5B8;
    objc_copyWeak(&v22, &location);
    id v21 = *(id *)(a1 + 56);
    id v5 = [v3 remoteObjectProxyWithErrorHandler:v20];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2_308;
    v17[3] = &unk_2643FB5B8;
    objc_copyWeak(&v19, &location);
    id v18 = *(id *)(a1 + 56);
    [v5 setWatchFaceIdentifier:v6 forFocusModeIdentifier:v7 completionHandler:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"NSS cannot be used when there is no active device";
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v10 = [v8 errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v9];

    id v11 = NSSLogForType(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v10;
      _os_log_impl(&dword_21C3BA000, v11, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_310;
    block[3] = &unk_2643FB518;
    id v12 = *(id *)(a1 + 56);
    id v15 = v10;
    id v16 = v12;
    id v13 = v10;
    dispatch_async(v4, block);
  }
  objc_destroyWeak(&location);
}

void __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_307;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_307(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_2_308(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = NSSLogForType(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "setWatchFace error: (%@)", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_309;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __78__NSSManager_setWatchFaceIdentifier_forFocusModeIdentifier_completionHandler___block_invoke_310(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchBetaEnrollmentStatus:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSSLogForType(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)MEMORY[0x21D4A6300](v4);
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[NSSManager fetchBetaEnrollmentStatus:]";
    __int16 v14 = 2048;
    id v15 = v6;
    _os_log_impl(&dword_21C3BA000, v5, OS_LOG_TYPE_DEFAULT, "%s: replyBlock: (%p)", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke;
  v9[3] = &unk_2643FB6A8;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(internalQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained connection];
  if (v4)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2;
    v13[3] = &unk_2643FB5B8;
    objc_copyWeak(&v15, v2);
    id v14 = *(id *)(a1 + 32);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v13];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2_312;
    v10[3] = &unk_2643FB9A0;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 32);
    [v5 fetchBetaEnrollmentStatus:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
  }
  else
  {
    uint64_t v6 = NSSLogForType(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[NSSManager fetchBetaEnrollmentStatus:]_block_invoke_2";
      _os_log_impl(&dword_21C3BA000, v6, OS_LOG_TYPE_DEFAULT, "%s: error connecting", buf, 0xCu);
    }

    uint64_t v7 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_315;
    block[3] = &unk_2643FB4C8;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[NSSManager fetchBetaEnrollmentStatus:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "%s: error: (%@)", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_311;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_311(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_2_312(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NSSLogForType(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[NSSManager fetchBetaEnrollmentStatus:]_block_invoke_2";
    __int16 v17 = 1024;
    BOOL v18 = v5 != 0;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_21C3BA000, v7, OS_LOG_TYPE_DEFAULT, "%s: replyData: %{BOOL}d error: (%@)", buf, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_313;
    block[3] = &unk_2643FB5E0;
    id v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

uint64_t __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_313(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __40__NSSManager_fetchBetaEnrollmentStatus___block_invoke_315(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSSManager cannotUseNSSError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)updateBetaEnrollmentStatus:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = NSSLogForType(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[NSSManager updateBetaEnrollmentStatus:withCompletion:]";
    _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v6)
  {
    [(NSSManager *)self _updateBetaEnrollmentStatus:v6 requiresUnenroll:0 withCompletion:v7];
  }
  else
  {
    id v9 = NSSLogForType(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[NSSManager updateBetaEnrollmentStatus:withCompletion:]";
      _os_log_impl(&dword_21C3BA000, v9, OS_LOG_TYPE_DEFAULT, "%s. Beta enrollment program info empty. Skipping", buf, 0xCu);
    }

    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    id v14 = @"Invalid Arguments";
    id v11 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v12 = [v10 errorWithDomain:@"NSSErrorDomain" code:10 userInfo:v11];

    v7[2](v7, 0, v12);
  }
}

- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3
{
}

- (void)_updateBetaEnrollmentStatus:(id)a3 requiresUnenroll:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke;
  block[3] = &unk_2643FB928;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  BOOL v17 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained connection];
  if (v4)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2;
    v15[3] = &unk_2643FB5B8;
    objc_copyWeak(&v17, v2);
    id v16 = *(id *)(a1 + 40);
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v15];
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v7 = *(unsigned char *)(a1 + 56) != 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2_323;
    v12[3] = &unk_2643FB6F8;
    objc_copyWeak(&v14, v2);
    id v13 = *(id *)(a1 + 40);
    [v5 updateBetaEnrollmentStatus:v6 requiresUnenroll:v7 withCompletion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v17);
  }
  else
  {
    id v8 = NSSLogForType(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v19 = "-[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]_block_invoke_2";
      _os_log_impl(&dword_21C3BA000, v8, OS_LOG_TYPE_DEFAULT, "%s: error connecting", buf, 0xCu);
    }

    id v9 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_325;
    block[3] = &unk_2643FB4C8;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = NSSLogForType(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_21C3BA000, v4, OS_LOG_TYPE_DEFAULT, "%s: error: (%@)", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_322;
    v8[3] = &unk_2643FB518;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_322(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_2_323(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = NSSLogForType(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[NSSManager _updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]_block_invoke_2";
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_21C3BA000, v6, OS_LOG_TYPE_DEFAULT, "%s: success: %{BOOL}d error: (%@)", buf, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained externalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_324;
    block[3] = &unk_2643FB6D0;
    id v12 = *(id *)(a1 + 32);
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_324(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __74__NSSManager__updateBetaEnrollmentStatus_requiresUnenroll_withCompletion___block_invoke_325(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSSManager cannotUseNSSError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

+ (id)cannotUseNSSError
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"NSS cannot be used when there is no active device";
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"NSSErrorDomain" code:11 userInfo:v3];

  return v4;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (void)setExternalQueue:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end