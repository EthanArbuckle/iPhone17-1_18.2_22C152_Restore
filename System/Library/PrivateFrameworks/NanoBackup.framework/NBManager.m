@interface NBManager
- (BOOL)getBackupsStatus;
- (NBManager)init;
- (NBManager)initWithQueue:(id)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)externalQueue;
- (OS_dispatch_queue)internalQueue;
- (id)connection;
- (id)deleteBackup:(id)a3;
- (id)restoreFromBackup:(id)a3 forDevice:(id)a4;
- (id)restoreFromDevice:(id)a3 forDevice:(id)a4;
- (void)createBackupForDevice:(id)a3 completionHandler:(id)a4;
- (void)createBackupForDevice:(id)a3 synchronousCompletionHandler:(id)a4;
- (void)createBackupForPairingID:(id)a3 completionHandler:(id)a4;
- (void)createBackupForPairingID:(id)a3 synchronousCompletionHandler:(id)a4;
- (void)createManualBackupWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteBackup:(id)a3 completionHandler:(id)a4;
- (void)listBackupsOfType:(unint64_t)a3 timeout:(int64_t)a4 completionHandler:(id)a5;
- (void)listBackupsOfType:(unint64_t)a3 withSynchronousCompletionHandler:(id)a4;
- (void)listBackupsWithCompletionHandler:(id)a3;
- (void)listBackupsWithSynchronousCompletionHandler:(id)a3;
- (void)listBackupsWithTimeout:(int64_t)a3 completionHandler:(id)a4;
- (void)restoreFromBackup:(id)a3 forDevice:(id)a4 completionHandler:(id)a5;
- (void)restoreFromDevice:(id)a3 forDevice:(id)a4 completionHandler:(id)a5;
- (void)setBackupsEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setExternalQueue:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)unsafe_invalidate;
@end

@implementation NBManager

uint64_t __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_91(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __23__NBManager_connection__block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D30B9C8];
  v1 = (void *)connection_remoteObjectInterface;
  connection_remoteObjectInterface = v0;

  v2 = (void *)connection_remoteObjectInterface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  v5 = objc_msgSend(v3, "setWithArray:", v4, v6, v7);
  [v2 setClasses:v5 forSelector:sel_listBackupsOfType_timeout_completionHandler_ argumentIndex:0 ofReply:1];
}

void __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_87(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained connection];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_2;
    v13[3] = &unk_2645969F0;
    objc_copyWeak(&v15, v2);
    id v14 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_2_90;
    v9[3] = &unk_264596A40;
    uint64_t v11 = *(void *)(a1 + 40);
    objc_copyWeak(&v12, v2);
    id v10 = *(id *)(a1 + 32);
    [v6 listBackupsOfType:v7 timeout:v8 completionHandler:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
  }
}

- (id)connection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.nanobackup" options:4096];
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    if (connection_onceToken != -1) {
      dispatch_once(&connection_onceToken, &__block_literal_global_0);
    }
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:connection_remoteObjectInterface];
    objc_initWeak(&location, self);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&__block_literal_global_80];
    uint64_t v6 = self->_xpcConnection;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __23__NBManager_connection__block_invoke_81;
    uint64_t v11 = &unk_264596978;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:&v8];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_2_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    uint64_t v8 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2211BB000, v8, OS_LOG_TYPE_DEFAULT, "Client returned after timeout dropping response", buf, 2u);
    }
  }
  else
  {
    *(unsigned char *)(v7 + 24) = 1;
    uint64_t v9 = (void *)nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      *(_DWORD *)buf = 134218498;
      id v19 = v5;
      __int16 v20 = 2048;
      uint64_t v21 = [v5 count];
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_2211BB000, v10, OS_LOG_TYPE_DEFAULT, "backups: (%p has %lu objects); error: (%@)", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v12 = WeakRetained;
    if (WeakRetained)
    {
      v13 = [WeakRetained externalQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_91;
      block[3] = &unk_264596A18;
      id v17 = *(id *)(a1 + 32);
      id v15 = v5;
      id v16 = v6;
      dispatch_async(v13, block);
    }
  }
}

- (NBManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NBManager;
  id v5 = [(NBManager *)&v14 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nanobackup.internal", v6);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      uint64_t v9 = (OS_dispatch_queue *)v4;
      externalQueue = v5->_externalQueue;
      v5->_externalQueue = v9;
    }
    else
    {
      uint64_t v11 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v12 = MEMORY[0x263EF83A0];
      externalQueue = v5->_externalQueue;
      v5->_externalQueue = v11;
    }
  }
  return v5;
}

- (void)listBackupsOfType:(unint64_t)a3 timeout:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = (void *)MEMORY[0x223C7A680](v8);
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_2211BB000, v10, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  if (!v8) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  if (a4 >= 1)
  {
    dispatch_time_t v12 = dispatch_time(0, 1000000000 * a4);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke;
    block[3] = &unk_2645969A0;
    p_long long buf = &buf;
    unint64_t v23 = a3;
    id v21 = v8;
    dispatch_after(v12, MEMORY[0x263EF83A0], block);
  }
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_87;
  v15[3] = &unk_264596A68;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v18[2] = (id)a4;
  id v16 = v8;
  id v17 = &buf;
  id v14 = v8;
  dispatch_async(internalQueue, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (NBManager)init
{
  return [(NBManager *)self initWithQueue:0];
}

- (void)unsafe_invalidate
{
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  xpcConnection = self->_xpcConnection;

  [(NSXPCConnection *)xpcConnection invalidate];
}

- (void)dealloc
{
  [(NBManager *)self unsafe_invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NBManager;
  [(NBManager *)&v3 dealloc];
}

void __23__NBManager_connection__block_invoke_2()
{
  uint64_t v0 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2211BB000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

void __23__NBManager_connection__block_invoke_81(uint64_t a1)
{
  v2 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2211BB000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __23__NBManager_connection__block_invoke_82;
    block[3] = &unk_264596950;
    void block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __23__NBManager_connection__block_invoke_82(uint64_t a1)
{
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

- (void)listBackupsWithCompletionHandler:(id)a3
{
}

- (void)listBackupsWithTimeout:(int64_t)a3 completionHandler:(id)a4
{
}

void __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    v2 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[6];
      int v6 = 134217984;
      uint64_t v7 = v3;
      _os_log_impl(&dword_2211BB000, v2, OS_LOG_TYPE_DEFAULT, "timed out waiting for result from backup daemon for type: %lu", (uint8_t *)&v6, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v4 = a1[4];
    id v5 = NBError(4);
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

void __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_88;
    v8[3] = &unk_2645969C8;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __57__NBManager_listBackupsOfType_timeout_completionHandler___block_invoke_88(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)setBackupsEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = (void *)MEMORY[0x223C7A680](v6);
    *(_DWORD *)long long buf = 134217984;
    id v17 = v9;
    _os_log_impl(&dword_2211BB000, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NBManager_setBackupsEnabled_completionHandler___block_invoke;
  block[3] = &unk_264596AB8;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = v6;
  BOOL v15 = a3;
  id v11 = v6;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __49__NBManager_setBackupsEnabled_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained connection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_2;
    v12[3] = &unk_2645969F0;
    objc_copyWeak(&v14, v2);
    id v13 = *(id *)(a1 + 32);
    id v6 = [v5 remoteObjectProxyWithErrorHandler:v12];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_2_94;
    v8[3] = &unk_264596A90;
    char v11 = v7;
    objc_copyWeak(&v10, v2);
    id v9 = *(id *)(a1 + 32);
    [v6 setBackupsEnabled:v7 completionHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v14);
  }
}

void __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained externalQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_93;
    v8[3] = &unk_2645969C8;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_93(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_2_94(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)long long buf = 67109120;
    int v13 = v5;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "Backups enabled set to: %d", buf, 8u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained externalQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_95;
    v9[3] = &unk_2645969C8;
    id v11 = *(id *)(a1 + 32);
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __49__NBManager_setBackupsEnabled_completionHandler___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)getBackupsStatus
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"EnableiCloudBackup", @"com.apple.NanoBackup", &keyExistsAndHasValidFormat)|| keyExistsAndHasValidFormat == 0;
}

- (void)listBackupsOfType:(unint64_t)a3 withSynchronousCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void, uint64_t))a4;
  uint64_t v7 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = (void *)MEMORY[0x223C7A680](v6);
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_2211BB000, v8, OS_LOG_TYPE_DEFAULT, "listBackupsOfTypewithSynchronousCompletionHandler replyBlock: (%p) Type: %lu", buf, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  __int16 v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__NBManager_listBackupsOfType_withSynchronousCompletionHandler___block_invoke;
  v11[3] = &unk_264596B30;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = buf;
  v11[7] = a3;
  dispatch_sync(internalQueue, v11);
  v6[2](v6, *(void *)(*(void *)&buf[8] + 40), v13[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
}

void __64__NBManager_listBackupsOfType_withSynchronousCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__NBManager_listBackupsOfType_withSynchronousCompletionHandler___block_invoke_2;
  v7[3] = &unk_264596AE0;
  v7[4] = *(void *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];

  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__NBManager_listBackupsOfType_withSynchronousCompletionHandler___block_invoke_96;
  v5[3] = &unk_264596B08;
  int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v3 listBackupsOfType:v4 timeout:0 completionHandler:v5];
}

void __64__NBManager_listBackupsOfType_withSynchronousCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int8x16_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __64__NBManager_listBackupsOfType_withSynchronousCompletionHandler___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v14 = 134218498;
    id v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = [v5 count];
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_2211BB000, v8, OS_LOG_TYPE_DEFAULT, "backups: (%p has %lu objects); error: (%@)",
      (uint8_t *)&v14,
      0x20u);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

- (void)listBackupsWithSynchronousCompletionHandler:(id)a3
{
}

- (void)restoreFromBackup:(id)a3 forDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 uuid];
  uint64_t v12 = [v9 valueForProperty:*MEMORY[0x263F57620]];
  int v13 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = v13;
    id v15 = [v11 UUIDString];
    __int16 v16 = [v12 UUIDString];
    uint64_t v17 = (void *)MEMORY[0x223C7A680](v10);
    *(_DWORD *)long long buf = 134219010;
    id v28 = v8;
    __int16 v29 = 2112;
    v30 = v15;
    __int16 v31 = 2048;
    id v32 = v9;
    __int16 v33 = 2112;
    v34 = v16;
    __int16 v35 = 2048;
    v36 = v17;
    _os_log_impl(&dword_2211BB000, v14, OS_LOG_TYPE_DEFAULT, "backup: (%p); backupID: (%@); device: (%p); deviceID: (%@); replyBlock: (%p)",
      buf,
      0x34u);
  }
  __int16 v18 = [v8 uuid];

  if (!v9 || !v18)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Neither of the backup (%@) or device (%@) parameter can be nil", v8, v9 format];
    if (v12) {
      goto LABEL_6;
    }
LABEL_8:
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Device (%@) passed as parameter is invalid: missing pairingID", v9 format];
    goto LABEL_6;
  }
  if (!v12) {
    goto LABEL_8;
  }
LABEL_6:
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke;
  block[3] = &unk_264596B80;
  void block[4] = self;
  id v24 = v8;
  id v25 = v12;
  id v26 = v10;
  id v20 = v12;
  id v21 = v8;
  id v22 = v10;
  dispatch_async(internalQueue, block);
}

void __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_2;
  v11[3] = &unk_264596B58;
  id v12 = *(id *)(a1 + 56);
  objc_copyWeak(&v13, &location);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = [*(id *)(a1 + 40) backupType];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_2_104;
  v8[3] = &unk_264596B58;
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  objc_copyWeak(&v10, &location);
  [v3 restoreFromBackupID:v4 backupType:v5 forPairingID:v6 completionHandler:v8];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_2_106;
  v7[3] = &unk_264596950;
  v7[4] = *(void *)(a1 + 32);
  [v2 addBarrierBlock:v7];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "restoreFromBackup error: (%@)", buf, 0xCu);
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      int v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_103;
      v8[3] = &unk_2645969C8;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_2_104(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "restoreFromBackup error: (%@)", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      int v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_105;
      v8[3] = &unk_2645969C8;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __59__NBManager_restoreFromBackup_forDevice_completionHandler___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)restoreFromBackup:(id)a3 forDevice:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [v7 valueForProperty:*MEMORY[0x263F57620]];
  id v10 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [v8 UUIDString];
    uint64_t v13 = [v9 UUIDString];
    *(_DWORD *)long long buf = 134218754;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2048;
    v30 = (uint64_t (*)(uint64_t, uint64_t))v7;
    LOWORD(v31) = 2112;
    *(void *)((char *)&v31 + 2) = v13;
    _os_log_impl(&dword_2211BB000, v11, OS_LOG_TYPE_DEFAULT, "backup: (%p); backupID: (%@); device: (%p); deviceID: (%@)",
      buf,
      0x2Au);
  }
  int v14 = [v6 uuid];

  if (v7 && v14)
  {
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Neither of the backup (%@) or device (%@) parameter can be nil", v6, v7 format];
    if (v9) {
      goto LABEL_6;
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Device (%@) passed as parameter is invalid: missing pairingID", v7 format];
LABEL_6:
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  *(void *)&long long v31 = __Block_byref_object_dispose_;
  *((void *)&v31 + 1) = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NBManager_restoreFromBackup_forDevice___block_invoke;
  block[3] = &unk_264596BA8;
  void block[4] = self;
  id v26 = buf;
  id v16 = v6;
  id v24 = v16;
  id v17 = v9;
  id v25 = v17;
  dispatch_sync(internalQueue, block);
  __int16 v18 = *(void **)(*(void *)&buf[8] + 40);
  if (v18)
  {
    id v19 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v27 = 138412290;
      uint64_t v28 = v20;
      _os_log_impl(&dword_2211BB000, v19, OS_LOG_TYPE_DEFAULT, "error: (%@)", v27, 0xCu);
    }
    __int16 v18 = *(void **)(*(void *)&buf[8] + 40);
  }
  id v21 = v18;

  _Block_object_dispose(buf, 8);

  return v21;
}

void __41__NBManager_restoreFromBackup_forDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__NBManager_restoreFromBackup_forDevice___block_invoke_2;
  v8[3] = &unk_264596AE0;
  void v8[4] = *(void *)(a1 + 56);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = [*(id *)(a1 + 40) backupType];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__NBManager_restoreFromBackup_forDevice___block_invoke_3;
  v7[3] = &unk_264596AE0;
  uint64_t v6 = *(void *)(a1 + 48);
  v7[4] = *(void *)(a1 + 56);
  [v3 restoreFromBackupID:v4 backupType:v5 forPairingID:v6 completionHandler:v7];
}

void __41__NBManager_restoreFromBackup_forDevice___block_invoke_2(uint64_t a1, void *a2)
{
}

void __41__NBManager_restoreFromBackup_forDevice___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)restoreFromDevice:(id)a3 forDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F57620];
  id v12 = [v8 valueForProperty:*MEMORY[0x263F57620]];
  uint64_t v13 = [v9 valueForProperty:v11];
  int v14 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    id v16 = [v12 UUIDString];
    id v17 = [v13 UUIDString];
    __int16 v18 = (void *)MEMORY[0x223C7A680](v10);
    *(_DWORD *)long long buf = 134219010;
    id v30 = v8;
    __int16 v31 = 2112;
    uint64_t v32 = v16;
    __int16 v33 = 2048;
    id v34 = v9;
    __int16 v35 = 2112;
    v36 = v17;
    __int16 v37 = 2048;
    v38 = v18;
    _os_log_impl(&dword_2211BB000, v15, OS_LOG_TYPE_DEFAULT, "existingDevice: (%p); existingDeviceID: (%@); device: (%p); deviceID: (%@); replyBlock: (%p)",
      buf,
      0x34u);
  }
  id v19 = (void *)MEMORY[0x263EFF4A0];
  if (!v8 || !v9) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Neither of the existingDevice (%@) or device (%@) parameters can be nil", v8, v9 format];
  }
  if (v12) {
    BOOL v20 = v13 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20) {
    [MEMORY[0x263EFF940] raise:*v19, @"Device (%@ or %@) passed as parameter is invalid: missing pairingID", v8, v9 format];
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke;
  block[3] = &unk_264596B80;
  void block[4] = self;
  id v26 = v12;
  id v27 = v13;
  id v28 = v10;
  id v22 = v13;
  id v23 = v12;
  id v24 = v10;
  dispatch_async(internalQueue, block);
}

void __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) connection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_2;
  v10[3] = &unk_264596B58;
  id v11 = *(id *)(a1 + 56);
  objc_copyWeak(&v12, &location);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_2_114;
  v7[3] = &unk_264596B58;
  id v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v9, &location);
  [v3 restoreFromPairingID:v4 forPairingID:v5 completionHandler:v7];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_2_116;
  v6[3] = &unk_264596950;
  v6[4] = *(void *)(a1 + 32);
  [v2 addBarrierBlock:v6];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
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
      v8[2] = __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_113;
      v8[3] = &unk_2645969C8;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_2_114(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
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
      v8[2] = __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_115;
      v8[3] = &unk_2645969C8;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __59__NBManager_restoreFromDevice_forDevice_completionHandler___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)restoreFromDevice:(id)a3 forDevice:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F57620];
  id v9 = [v6 valueForProperty:*MEMORY[0x263F57620]];
  id v10 = [v7 valueForProperty:v8];
  id v11 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = [v9 UUIDString];
    int v14 = [v10 UUIDString];
    *(_DWORD *)long long buf = 134218754;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t))v7;
    LOWORD(v33) = 2112;
    *(void *)((char *)&v33 + 2) = v14;
    _os_log_impl(&dword_2211BB000, v12, OS_LOG_TYPE_DEFAULT, "existingDevice: (%p); existingDeviceID: (%@); device: (%p); deviceID: (%@)",
      buf,
      0x2Au);
  }
  id v15 = (void *)MEMORY[0x263EFF4A0];
  if (!v6 || !v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Neither of the existingDevice (%@) or device (%@) parameters can be nil", v6, v7 format];
  }
  if (v9) {
    BOOL v16 = v10 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16) {
    [MEMORY[0x263EFF940] raise:*v15, @"Device (%@ or %@) passed as parameter is invalid: missing pairingID", v6, v7 format];
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy_;
  *(void *)&long long v33 = __Block_byref_object_dispose_;
  *((void *)&v33 + 1) = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NBManager_restoreFromDevice_forDevice___block_invoke;
  block[3] = &unk_264596BA8;
  void block[4] = self;
  id v28 = buf;
  id v18 = v9;
  id v26 = v18;
  id v19 = v10;
  id v27 = v19;
  dispatch_sync(internalQueue, block);
  BOOL v20 = *(void **)(*(void *)&buf[8] + 40);
  if (v20)
  {
    id v21 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)__int16 v29 = 138412290;
      uint64_t v30 = v22;
      _os_log_impl(&dword_2211BB000, v21, OS_LOG_TYPE_DEFAULT, "error: (%@)", v29, 0xCu);
    }
    BOOL v20 = *(void **)(*(void *)&buf[8] + 40);
  }
  id v23 = v20;

  _Block_object_dispose(buf, 8);

  return v23;
}

void __41__NBManager_restoreFromDevice_forDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__NBManager_restoreFromDevice_forDevice___block_invoke_2;
  v7[3] = &unk_264596AE0;
  void v7[4] = *(void *)(a1 + 56);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__NBManager_restoreFromDevice_forDevice___block_invoke_3;
  v6[3] = &unk_264596AE0;
  v6[4] = *(void *)(a1 + 56);
  [v3 restoreFromPairingID:v4 forPairingID:v5 completionHandler:v6];
}

void __41__NBManager_restoreFromDevice_forDevice___block_invoke_2(uint64_t a1, void *a2)
{
}

void __41__NBManager_restoreFromDevice_forDevice___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)createBackupForDevice:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = (void *)MEMORY[0x223C7A680](v7);
    int v12 = 134218240;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = v10;
    _os_log_impl(&dword_2211BB000, v9, OS_LOG_TYPE_DEFAULT, "device: (%p); replyBlock: (%p)", (uint8_t *)&v12, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"device parameter should not be nil"];
  }
  id v11 = [v6 valueForProperty:*MEMORY[0x263F57620]];
  [(NBManager *)self createBackupForPairingID:v11 completionHandler:v7];
}

- (void)createBackupForDevice:(id)a3 synchronousCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = (void *)MEMORY[0x223C7A680](v7);
    int v12 = 134218240;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = v10;
    _os_log_impl(&dword_2211BB000, v9, OS_LOG_TYPE_DEFAULT, "device: (%p); replyBlock: (%p)", (uint8_t *)&v12, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"device parameter should not be nil"];
  }
  id v11 = [v6 valueForProperty:*MEMORY[0x263F57620]];
  [(NBManager *)self createBackupForPairingID:v11 synchronousCompletionHandler:v7];
}

- (void)createBackupForPairingID:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v6 UUIDString];
    id v11 = (void *)MEMORY[0x223C7A680](v7);
    *(_DWORD *)long long buf = 138412546;
    id v19 = v10;
    __int16 v20 = 2048;
    id v21 = v11;
    _os_log_impl(&dword_2211BB000, v9, OS_LOG_TYPE_DEFAULT, "pairingID: (%@); replyBlock: (%p)", buf, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Device pairingID shouldn't be nil"];
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NBManager_createBackupForPairingID_completionHandler___block_invoke;
  block[3] = &unk_264596BF8;
  id v16 = v6;
  id v17 = v7;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(internalQueue, block);
}

void __56__NBManager_createBackupForPairingID_completionHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_2;
  v9[3] = &unk_264596B58;
  id v10 = *(id *)(a1 + 48);
  objc_copyWeak(&v11, &location);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_2_124;
  v6[3] = &unk_264596BD0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  objc_copyWeak(&v8, &location);
  [v3 createLocalBackupForPairingID:v4 completionHandler:v6];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_2_127;
  v5[3] = &unk_264596950;
  void v5[4] = *(void *)(a1 + 32);
  [v2 addBarrierBlock:v5];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_123;
      v8[3] = &unk_2645969C8;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_2_124(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v5 uuid];
    id v10 = [v9 UUIDString];
    *(_DWORD *)long long buf = 138412546;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_2211BB000, v8, OS_LOG_TYPE_DEFAULT, "backupID: (%@); error: (%@)", buf, 0x16u);
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v12 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v13 = [WeakRetained externalQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_125;
      block[3] = &unk_264596A18;
      id v17 = *(id *)(a1 + 32);
      id v15 = v5;
      id v16 = v6;
      dispatch_async(v13, block);
    }
  }
}

uint64_t __56__NBManager_createBackupForPairingID_completionHandler___block_invoke_125(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)createBackupForPairingID:(id)a3 synchronousCompletionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v6 UUIDString];
    id v11 = (void *)MEMORY[0x223C7A680](v7);
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_2211BB000, v9, OS_LOG_TYPE_DEFAULT, "pairingID: (%@); replyBlock: (%p)", buf, 0x16u);
  }
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Device pairingID shouldn't be nil"];
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  internalQueue = self->_internalQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__NBManager_createBackupForPairingID_synchronousCompletionHandler___block_invoke;
  v14[3] = &unk_264596C48;
  v14[4] = self;
  id v16 = buf;
  id v13 = v6;
  id v15 = v13;
  id v17 = &v18;
  dispatch_sync(internalQueue, v14);
  if (v7) {
    v7[2](v7, v19[5], *(void *)(*(void *)&buf[8] + 40));
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(buf, 8);
}

void __67__NBManager_createBackupForPairingID_synchronousCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__NBManager_createBackupForPairingID_synchronousCompletionHandler___block_invoke_2;
  v7[3] = &unk_264596AE0;
  void v7[4] = *(void *)(a1 + 48);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__NBManager_createBackupForPairingID_synchronousCompletionHandler___block_invoke_128;
  v5[3] = &unk_264596C20;
  int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  [v3 createLocalBackupForPairingID:v4 completionHandler:v5];
}

void __67__NBManager_createBackupForPairingID_synchronousCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int8x16_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __67__NBManager_createBackupForPairingID_synchronousCompletionHandler___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [v5 uuid];
    id v10 = [v9 UUIDString];
    int v16 = 138412546;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_2211BB000, v8, OS_LOG_TYPE_DEFAULT, "backupID: (%@); error: (%@)", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v6;
}

- (void)createManualBackupWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__NBManager_createManualBackupWithCompletion___block_invoke;
  v6[3] = &unk_264596C70;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(internalQueue, v6);
  if (v4) {
    v4[2](v4, v8[5]);
  }
  _Block_object_dispose(&v7, 8);
}

void __46__NBManager_createManualBackupWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__NBManager_createManualBackupWithCompletion___block_invoke_2;
  v5[3] = &unk_264596AE0;
  void v5[4] = *(void *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__NBManager_createManualBackupWithCompletion___block_invoke_129;
  v4[3] = &unk_264596AE0;
  v4[4] = *(void *)(a1 + 40);
  [v3 createManualBackupWithCompletion:v4];
}

void __46__NBManager_createManualBackupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __46__NBManager_createManualBackupWithCompletion___block_invoke_129(uint64_t a1, void *a2)
{
}

- (void)deleteBackup:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    id v10 = [v6 uuid];
    uint64_t v11 = [v10 UUIDString];
    id v12 = (void *)MEMORY[0x223C7A680](v7);
    *(_DWORD *)long long buf = 134218498;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = v12;
    _os_log_impl(&dword_2211BB000, v9, OS_LOG_TYPE_DEFAULT, "backup (%p); backupID: (%@); replyBlock: (%p)", buf, 0x20u);
  }
  id v13 = [v6 uuid];

  if (!v13)
  {
    uint64_t v14 = (void *)MEMORY[0x263EFF940];
    uint64_t v15 = *MEMORY[0x263EFF4A0];
    int v16 = [v6 uuid];
    [v14 raise:v15, @"Backup (%@) parameter and its UUID (%@) should not be nil", v6, v16 format];
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NBManager_deleteBackup_completionHandler___block_invoke;
  block[3] = &unk_264596BF8;
  id v21 = v6;
  id v22 = v7;
  void block[4] = self;
  id v18 = v6;
  id v19 = v7;
  dispatch_async(internalQueue, block);
}

void __44__NBManager_deleteBackup_completionHandler___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] connection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__NBManager_deleteBackup_completionHandler___block_invoke_2;
  v10[3] = &unk_264596B58;
  id v11 = a1[6];
  objc_copyWeak(&v12, &location);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v4 = [a1[5] uuid];
  uint64_t v5 = [a1[5] backupType];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__NBManager_deleteBackup_completionHandler___block_invoke_2_134;
  v7[3] = &unk_264596B58;
  id v8 = a1[6];
  objc_copyWeak(&v9, &location);
  [v3 deleteBackupID:v4 backupType:v5 completionHandler:v7];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__NBManager_deleteBackup_completionHandler___block_invoke_2_136;
  v6[3] = &unk_264596950;
  void v6[4] = a1[4];
  [v2 addBarrierBlock:v6];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __44__NBManager_deleteBackup_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __44__NBManager_deleteBackup_completionHandler___block_invoke_133;
      v8[3] = &unk_2645969C8;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __44__NBManager_deleteBackup_completionHandler___block_invoke_133(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __44__NBManager_deleteBackup_completionHandler___block_invoke_2_134(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = [WeakRetained externalQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __44__NBManager_deleteBackup_completionHandler___block_invoke_135;
      v8[3] = &unk_2645969C8;
      id v10 = *(id *)(a1 + 32);
      id v9 = v3;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __44__NBManager_deleteBackup_completionHandler___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)deleteBackup:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 uuid];
    id v8 = [v7 UUIDString];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_2211BB000, v6, OS_LOG_TYPE_DEFAULT, "backup: (%p); backupID: (%@)", buf, 0x16u);
  }
  id v9 = [v4 uuid];

  if (!v9)
  {
    id v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = *MEMORY[0x263EFF4A0];
    id v12 = [v4 uuid];
    [v10 raise:v11, @"Backup (%@) parameter and its UUID (%@) should not be nil", v4, v12 format];
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  __int16 v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__NBManager_deleteBackup___block_invoke;
  block[3] = &unk_264596C98;
  void block[4] = self;
  id v22 = buf;
  id v14 = v4;
  id v21 = v14;
  dispatch_sync(internalQueue, block);
  uint64_t v15 = *(void **)(*(void *)&buf[8] + 40);
  if (v15)
  {
    int v16 = nb_framework_log;
    if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v23 = 138412290;
      uint64_t v24 = v17;
      _os_log_impl(&dword_2211BB000, v16, OS_LOG_TYPE_DEFAULT, "error: (%@)", v23, 0xCu);
    }
    uint64_t v15 = *(void **)(*(void *)&buf[8] + 40);
  }
  id v18 = v15;

  _Block_object_dispose(buf, 8);

  return v18;
}

void __26__NBManager_deleteBackup___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__NBManager_deleteBackup___block_invoke_2;
  v7[3] = &unk_264596AE0;
  void v7[4] = *(void *)(a1 + 48);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
  id v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = [*(id *)(a1 + 40) backupType];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__NBManager_deleteBackup___block_invoke_137;
  v6[3] = &unk_264596AE0;
  void v6[4] = *(void *)(a1 + 48);
  [v3 deleteBackupID:v4 backupType:v5 completionHandler:v6];
}

void __26__NBManager_deleteBackup___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = nb_framework_log;
  if (os_log_type_enabled((os_log_t)nb_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2211BB000, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __26__NBManager_deleteBackup___block_invoke_137(uint64_t a1, void *a2)
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
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