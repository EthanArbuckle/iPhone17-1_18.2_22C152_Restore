@interface UASharedPasteboardManager
+ (BOOL)dontConnectToServer;
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)addData:(id)a3 toItemAtIndex:(unint64_t)a4 generation:(unint64_t)a5;
- (BOOL)currentGenerationHasUpdates;
- (BOOL)isRemotePasteboardAvailable;
- (BOOL)remotePasteboardAvailable;
- (BOOL)requestPasteboardFetchReturnEarly;
- (BOOL)typeIsDisallowedForReceiving:(id)a3;
- (BOOL)typeIsDisallowedForSending:(id)a3;
- (BOOL)updateScheduled;
- (NSDictionary)typeAliases;
- (NSDictionary)typeBOMs;
- (NSSet)bomCheckTypes;
- (NSSet)disallowedTypesForReceiving;
- (NSSet)disallowedTypesForSending;
- (NSXPCConnection)connection;
- (NSXPCConnection)controllConnection;
- (OS_dispatch_queue)pasteboardReadQ;
- (OS_dispatch_queue)serverQ;
- (UAPasteboardGeneration)currentGeneration;
- (UASharedPasteboardManager)init;
- (id)completionBlock;
- (id)controllSyncObject;
- (id)fetchRemoteName;
- (id)localPasteboardWasFetched;
- (id)serializeFileType:(id)a3 intoInfo:(id)a4 withFile:(id)a5 intoDir:(id)a6;
- (id)serializeItem:(id)a3 intoInfo:(id)a4 withFile:(id)a5 intoDir:(id)a6;
- (id)serializeType:(id)a3 intoInfo:(id)a4 withFile:(id)a5;
- (int)disableCount;
- (void)clearLocalPasteboardInformation;
- (void)dealloc;
- (void)doClearLocalPasteboardInfo;
- (void)fetchPasteboardDataForProcess:(int)a3 withCompletion:(id)a4;
- (void)fetchPasteboardStatus:(id)a3;
- (void)fetchPasteboardTypesForProcess:(int)a3 withCompletion:(id)a4;
- (void)pickupLocalChanges:(id)a3 iterNumber:(int64_t)a4 cloneDir:(id)a5 completionHandler:(id)a6;
- (void)requestRemotePasteboardDataForProcess:(int)a3 withCompletion:(id)a4;
- (void)requestRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4;
- (void)sendUpdateToServer:(id)a3;
- (void)setBomCheckTypes:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setConnection:(id)a3;
- (void)setControllConnection:(id)a3;
- (void)setControllSyncObject:(id)a3;
- (void)setCurrentGeneration:(id)a3;
- (void)setCurrentGenerationHasUpdates:(BOOL)a3;
- (void)setDisableCount:(int)a3;
- (void)setDisallowedTypesForReceiving:(id)a3;
- (void)setDisallowedTypesForSending:(id)a3;
- (void)setLocalPasteboardWasFetched:(id)a3;
- (void)setPasteboardReadQ:(id)a3;
- (void)setRemotePasteboardAvailable:(BOOL)a3;
- (void)setServerQ:(id)a3;
- (void)setTypeAliases:(id)a3;
- (void)setTypeBOMs:(id)a3;
- (void)setUpdateScheduled:(BOOL)a3;
- (void)startPreventingPasteboardSharing;
- (void)stopPreventingPasteboardSharing;
- (void)tellClientDebuggingEnabled:(BOOL)a3 logFileHandle:(id)a4;
- (void)writeLocalPasteboardToFile:(id)a3 itemDir:(id)a4 extension:(id)a5 withCompletion:(id)a6;
- (void)writeLocalPasteboardToFile:(id)a3 itemDir:(id)a4 withCompletion:(id)a5;
@end

@implementation UASharedPasteboardManager

+ (void)initialize
{
  id v2 = +[UASharedPasteboardIRManager sharedIRManager];
  [v2 initializeConverters];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)sharedManager_result;

  return v2;
}

void __42__UASharedPasteboardManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(UASharedPasteboardManager);
  v1 = (void *)sharedManager_result;
  sharedManager_result = (uint64_t)v0;
}

+ (BOOL)dontConnectToServer
{
  id v2 = getenv("__UAUSERACTIVITYDONTCONNECTTOUSERACTIVITYD");
  if (v2) {
    LOBYTE(v2) = atoi(v2) != 0;
  }
  return (char)v2;
}

- (UASharedPasteboardManager)init
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)UASharedPasteboardManager;
  id v2 = [(UASharedPasteboardManager *)&v28 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("UAPasteboardServerQ", 0);
    [(UASharedPasteboardManager *)v2 setServerQ:v3];

    dispatch_queue_t v4 = dispatch_queue_create("UAPasteboardReadingQ", 0);
    [(UASharedPasteboardManager *)v2 setPasteboardReadQ:v4];

    v5 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0CBE418];
    [(UASharedPasteboardManager *)v2 setDisallowedTypesForSending:v5];

    v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0CBE430];
    [(UASharedPasteboardManager *)v2 setDisallowedTypesForReceiving:v6];

    v7 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0CBE448];
    [(UASharedPasteboardManager *)v2 setBomCheckTypes:v7];

    v29[0] = @"public.utf16-plain-text";
    v29[1] = @"public.utf16-external-plain-text";
    v30[0] = &unk_1F0CBE460;
    v30[1] = &unk_1F0CBE478;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    [(UASharedPasteboardManager *)v2 setTypeBOMs:v8];

    [(UASharedPasteboardManager *)v2 setTypeAliases:&unk_1F0CBE538];
    if (([(id)objc_opt_class() dontConnectToServer] & 1) == 0)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F29268]);
      v10 = UASharedPasteboardManagerServiceName();
      v11 = (void *)[v9 initWithMachServiceName:v10 options:0];
      [(UASharedPasteboardManager *)v2 setConnection:v11];

      v12 = _UAGetSharedPasteboardManagerProtocolInterface();
      v13 = [(UASharedPasteboardManager *)v2 connection];
      [v13 setRemoteObjectInterface:v12];

      v14 = [(UASharedPasteboardManager *)v2 connection];
      [v14 setExportedObject:v2];

      v15 = _UAGetSharedPasteboardManagerResponseProtocolInterface();
      v16 = [(UASharedPasteboardManager *)v2 connection];
      [v16 setExportedInterface:v15];

      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__1;
      v26[4] = __Block_byref_object_dispose__1;
      v17 = v2;
      v27 = v17;
      v18 = [(UASharedPasteboardManager *)v17 connection];
      [v18 setInterruptionHandler:&__block_literal_global_84];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __33__UASharedPasteboardManager_init__block_invoke_88;
      v25[3] = &unk_1E60833A8;
      v25[4] = v26;
      v19 = [(UASharedPasteboardManager *)v17 connection];
      [v19 setInvalidationHandler:v25];

      v20 = [(UASharedPasteboardManager *)v17 connection];
      [v20 resume];

      _Block_object_dispose(v26, 8);
    }
    v21 = [MEMORY[0x1E4F29128] UUID];
    [(UASharedPasteboardManager *)v2 setControllSyncObject:v21];

    [(UASharedPasteboardManager *)v2 setUpdateScheduled:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__UASharedPasteboardManager_init__block_invoke_90;
    block[3] = &unk_1E60830C8;
    v24 = v2;
    if (init_sRegisterForReconnectionMessageOnce != -1) {
      dispatch_once(&init_sRegisterForReconnectionMessageOnce, block);
    }
  }
  return v2;
}

void __33__UASharedPasteboardManager_init__block_invoke()
{
  v0 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B3DF6000, v0, OS_LOG_TYPE_DEFAULT, "PBOARD CONNECTION INTURRUPTED", v1, 2u);
  }
}

void __33__UASharedPasteboardManager_init__block_invoke_88(uint64_t a1)
{
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_DEFAULT, "PBOARD CONNECTION INVALIDATED: to useractivityd; all future attempts to use it will fail.",
      v7,
      2u);
  }

  dispatch_queue_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionBlock];

  if (v3)
  {
    dispatch_queue_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionBlock];
    v4[2]();

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setCompletionBlock:0];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setConnection:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __33__UASharedPasteboardManager_init__block_invoke_90(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __33__UASharedPasteboardManager_init__block_invoke_2;
  handler[3] = &unk_1E60833F8;
  id v4 = *(id *)(a1 + 32);
  notify_register_dispatch("com.apple.coreservices.useractivity.reconnection", (int *)&init_sRegisterForReconnectionNotificationToken, v2, handler);
}

void __33__UASharedPasteboardManager_init__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  dispatch_queue_t v3 = [*(id *)(a1 + 32) controllSyncObject];
  objc_sync_enter(v3);
  id v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_INFO, "Received reconnect notification", (uint8_t *)buf, 2u);
  }

  if ((int)[*(id *)(a1 + 32) disableCount] < 1)
  {
    v16 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_INFO, "No need to reconnect", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "Client has disable count > 0, reconnecting", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, *(id *)(a1 + 32));
    id v6 = objc_alloc(MEMORY[0x1E4F29268]);
    v7 = UASharedPasteboardControllServiceName();
    v8 = (void *)[v6 initWithMachServiceName:v7 options:0];
    [*(id *)(a1 + 32) setControllConnection:v8];

    id v9 = _UAGetSharedPasteboardControllProtocolInterface();
    v10 = [*(id *)(a1 + 32) controllConnection];
    [v10 setRemoteObjectInterface:v9];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __33__UASharedPasteboardManager_init__block_invoke_92;
    v18[3] = &unk_1E60833D0;
    objc_copyWeak(&v19, buf);
    v11 = [*(id *)(a1 + 32) controllConnection];
    [v11 setInvalidationHandler:v18];

    v12 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_INFO, "Resuming connection", v17, 2u);
    }

    v13 = [*(id *)(a1 + 32) controllConnection];
    [v13 resume];

    v14 = [*(id *)(a1 + 32) controllConnection];
    v15 = [v14 remoteObjectProxy];
    [v15 startConnection:getpid()];

    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }
  objc_sync_exit(v3);
}

void __33__UASharedPasteboardManager_init__block_invoke_92(uint64_t a1)
{
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "Controll connection invalidated, should reconnect when UA launches again", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setControllConnection:0];
}

- (void)dealloc
{
  dispatch_queue_t v3 = [(UASharedPasteboardManager *)self connection];
  [v3 invalidate];

  id v4 = [(UASharedPasteboardManager *)self controllConnection];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)UASharedPasteboardManager;
  [(UASharedPasteboardManager *)&v5 dealloc];
}

- (void)startPreventingPasteboardSharing
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [(UASharedPasteboardManager *)self controllSyncObject];
  objc_sync_enter(v3);
  [(UASharedPasteboardManager *)self setDisableCount:[(UASharedPasteboardManager *)self disableCount] + 1];
  id v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [(UASharedPasteboardManager *)self disableCount];
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "Calling in to disable UC, count: %d", (uint8_t *)&buf, 8u);
  }

  objc_super v5 = [(UASharedPasteboardManager *)self controllConnection];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    objc_initWeak(&buf, self);
    id v7 = objc_alloc(MEMORY[0x1E4F29268]);
    v8 = UASharedPasteboardControllServiceName();
    id v9 = (void *)[v7 initWithMachServiceName:v8 options:0];
    [(UASharedPasteboardManager *)self setControllConnection:v9];

    v10 = _UAGetSharedPasteboardControllProtocolInterface();
    v11 = [(UASharedPasteboardManager *)self controllConnection];
    [v11 setRemoteObjectInterface:v10];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__UASharedPasteboardManager_startPreventingPasteboardSharing__block_invoke;
    v18[3] = &unk_1E60833D0;
    objc_copyWeak(&v19, &buf);
    v12 = [(UASharedPasteboardManager *)self controllConnection];
    [v12 setInvalidationHandler:v18];

    v13 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B3DF6000, v13, OS_LOG_TYPE_INFO, "Resuming connection", v17, 2u);
    }

    v14 = [(UASharedPasteboardManager *)self controllConnection];
    [v14 resume];

    v15 = [(UASharedPasteboardManager *)self controllConnection];
    v16 = [v15 remoteObjectProxy];
    [v16 startConnection:getpid()];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&buf);
  }
  objc_sync_exit(v3);
}

void __61__UASharedPasteboardManager_startPreventingPasteboardSharing__block_invoke(uint64_t a1)
{
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "Controll connection invalidated, should reconnect when UA launches again", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setControllConnection:0];
}

- (void)stopPreventingPasteboardSharing
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [(UASharedPasteboardManager *)self controllSyncObject];
  objc_sync_enter(v3);
  id v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [(UASharedPasteboardManager *)self disableCount];
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "Calling in to cancel disable, count: %d", (uint8_t *)v7, 8u);
  }

  if ([(UASharedPasteboardManager *)self disableCount] >= 1)
  {
    [(UASharedPasteboardManager *)self setDisableCount:[(UASharedPasteboardManager *)self disableCount] - 1];
    if (![(UASharedPasteboardManager *)self disableCount])
    {
      objc_super v5 = _uaGetLogForCategory(@"pasteboard-client");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating connection, count is 0", (uint8_t *)v7, 2u);
      }

      BOOL v6 = [(UASharedPasteboardManager *)self controllConnection];
      [v6 invalidate];

      [(UASharedPasteboardManager *)self setControllConnection:0];
    }
  }
  objc_sync_exit(v3);
}

- (BOOL)typeIsDisallowedForSending:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(UASharedPasteboardManager *)self disallowedTypesForSending];
    char v6 = [v5 containsObject:v4];

    if (v6)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [(UASharedPasteboardManager *)self disallowedTypesForSending];
      uint64_t v7 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v9 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v8);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
            uint64_t v13 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v11];
            v14 = (void *)v13;
            if (v12) {
              BOOL v15 = v13 == 0;
            }
            else {
              BOOL v15 = 1;
            }
            if (!v15 && ([v12 conformsToType:v13] & 1) != 0)
            {

              LOBYTE(v7) = 1;
              goto LABEL_19;
            }
          }
          uint64_t v7 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)typeIsDisallowedForReceiving:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(UASharedPasteboardManager *)self disallowedTypesForReceiving];
    char v6 = [v5 containsObject:v4];

    if (v6)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [(UASharedPasteboardManager *)self disallowedTypesForReceiving];
      uint64_t v7 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v9 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v8);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
            uint64_t v13 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v11];
            v14 = (void *)v13;
            if (v12) {
              BOOL v15 = v13 == 0;
            }
            else {
              BOOL v15 = 1;
            }
            if (!v15 && ([v12 conformsToType:v13] & 1) != 0)
            {

              LOBYTE(v7) = 1;
              goto LABEL_19;
            }
          }
          uint64_t v7 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)addData:(id)a3 toItemAtIndex:(unint64_t)a4 generation:(unint64_t)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [v8 type];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
    v12 = [NSNumber numberWithUnsignedInteger:a5];
    *(_DWORD *)id buf = 138412802;
    v37 = v10;
    __int16 v38 = 2112;
    v39 = v11;
    __int16 v40 = 2112;
    v41 = v12;
    _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_DEBUG, "Adding type: %@ to item: %@ in generation: %@", buf, 0x20u);
  }
  uint64_t v13 = [(UASharedPasteboardManager *)self currentGeneration];
  objc_sync_enter(v13);
  v14 = [v8 type];
  BOOL v15 = [(UASharedPasteboardManager *)self typeIsDisallowedForSending:v14];

  if (v15)
  {
    v16 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v8 type];
      *(_DWORD *)id buf = 138543362;
      v37 = v17;
      _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring disallowed type: %{public}@", buf, 0xCu);
    }
LABEL_9:
    int v24 = 0;
    goto LABEL_13;
  }
  long long v18 = [(UASharedPasteboardManager *)self currentGeneration];
  BOOL v19 = [v18 generation] > a5;

  if (v19)
  {
    v16 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v20 = [NSNumber numberWithUnsignedInteger:a5];
      uint64_t v21 = NSNumber;
      uint64_t v22 = [(UASharedPasteboardManager *)self currentGeneration];
      v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "generation"));
      *(_DWORD *)id buf = 138543618;
      v37 = v20;
      __int16 v38 = 2114;
      v39 = v23;
      _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_ERROR, "Ignoring item, new generation (%{public}@) is older than current generation (%{public}@)", buf, 0x16u);
    }
    goto LABEL_9;
  }
  v25 = [(UASharedPasteboardManager *)self currentGeneration];
  BOOL v26 = [v25 generation] == a5;

  if (!v26)
  {
    v27 = [[UAPasteboardGeneration alloc] initWithGeneration:a5];
    [(UASharedPasteboardManager *)self setCurrentGeneration:v27];
  }
  v16 = [(UASharedPasteboardManager *)self currentGeneration];
  int v24 = [v16 addType:v8 toItemAtIndex:a4];
LABEL_13:

  [(UASharedPasteboardManager *)self setCurrentGenerationHasUpdates:[(UASharedPasteboardManager *)self currentGenerationHasUpdates] | v24];
  objc_sync_exit(v13);

  objc_super v28 = self;
  objc_sync_enter(v28);
  if ((([(UASharedPasteboardManager *)v28 updateScheduled] | v24 ^ 1) & 1) == 0)
  {
    v29 = [(UASharedPasteboardManager *)v28 currentGeneration];
    [(UASharedPasteboardManager *)v28 sendUpdateToServer:v29];
    [(UASharedPasteboardManager *)v28 setUpdateScheduled:1];
    dispatch_time_t v30 = dispatch_time(0, 50000000);
    v31 = dispatch_get_global_queue(25, 0);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__UASharedPasteboardManager_addData_toItemAtIndex_generation___block_invoke;
    v34[3] = &unk_1E6083420;
    v34[4] = v28;
    id v35 = v29;
    id v32 = v29;
    dispatch_after(v30, v31, v34);
  }
  objc_sync_exit(v28);

  return v24;
}

void __62__UASharedPasteboardManager_addData_toItemAtIndex_generation___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  [*(id *)(a1 + 32) sendUpdateToServer:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setUpdateScheduled:0];
}

- (void)sendUpdateToServer:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  dispatch_queue_t v3 = [v44 items];
  id v4 = (void *)[v3 copy];

  uint64_t v43 = [v44 generation];
  v50 = [v44 getTypePaths];
  objc_super v5 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v44 allTypes];
    *(_DWORD *)id buf = 138412290;
    v68 = v6;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEFAULT, "Sending pasteboard update to server: %@", buf, 0xCu);
  }
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v64 = 0u;
  long long v63 = 0u;
  obuint64_t j = v4;
  uint64_t v48 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v64;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v64 != v46)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }
        uint64_t v49 = v7;
        uint64_t v9 = *(void **)(*((void *)&v63 + 1) + 8 * v7);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v11 = v9;
        objc_sync_enter(v11);
        id v53 = v11;
        v12 = [v11 types];
        uint64_t v52 = [v12 count];

        objc_sync_exit(v53);
        if (v52)
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            uint64_t v13 = [v53 types];
            v55 = [v13 objectAtIndexedSubscript:i];

            v14 = objc_alloc_init(UASharedPasteboardTypeInfo);
            if ([v55 conformsToProtocol:&unk_1F0CC4200])
            {
              id v15 = v55;
              v16 = [v15 uuid];
              [(UASharedPasteboardTypeInfo *)v14 setUuid:v16];

              if ([v15 preferFileRep])
              {
                [(UASharedPasteboardTypeInfo *)v14 setType:@"public.file-url"];
              }
              else
              {
                uint64_t v21 = [v15 type];
                [(UASharedPasteboardTypeInfo *)v14 setType:v21];
              }
              uint64_t v22 = [v15 uuid];
              v23 = [v50 objectForKeyedSubscript:v22];
              [(UASharedPasteboardTypeInfo *)v14 setTypeHint:v23];

              long long v20 = [(UASharedPasteboardTypeInfo *)v14 typeHint];
              if (v20) {
                goto LABEL_17;
              }
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_18;
              }
              __int16 v38 = _uaGetLogForCategory(@"pasteboard-client");
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id buf = 0;
                _os_log_impl(&dword_1B3DF6000, v38, OS_LOG_TYPE_DEFAULT, "TypeHint nil, trying to get filename", buf, 2u);
              }

              uint64_t v19 = [v15 getFileName];
            }
            else
            {
              long long v17 = [v55 type];
              [(UASharedPasteboardTypeInfo *)v14 setType:v17];

              long long v18 = [v55 uuid];
              [(UASharedPasteboardTypeInfo *)v14 setUuid:v18];

              id v15 = [v55 uuid];
              uint64_t v19 = [v50 objectForKeyedSubscript:v15];
            }
            long long v20 = (void *)v19;
            [(UASharedPasteboardTypeInfo *)v14 setTypeHint:v19];
LABEL_17:

LABEL_18:
            uint64_t v24 = [v10 count];
            v25 = [NSNumber numberWithUnsignedInteger:v24];
            [(UASharedPasteboardTypeInfo *)v14 setIndex:v25];

            BOOL v26 = [(UASharedPasteboardTypeInfo *)v14 type];
            [v10 setObject:v14 forKey:v26];

            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            v27 = [(UASharedPasteboardManager *)self typeAliases];
            objc_super v28 = [v55 type];
            v29 = [v27 objectForKeyedSubscript:v28];

            uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v71 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v60;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v60 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  v33 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                  v34 = _uaGetLogForCategory(@"pasteboard-client");
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    id v35 = [v55 type];
                    *(_DWORD *)id buf = 138412546;
                    v68 = v33;
                    __int16 v69 = 2112;
                    v70 = v35;
                    _os_log_impl(&dword_1B3DF6000, v34, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Adding alias: %@ for type: %@", buf, 0x16u);
                  }
                  v36 = (void *)[(UASharedPasteboardTypeInfo *)v14 copy];
                  [v36 setType:v33];
                  v37 = [NSNumber numberWithUnsignedInteger:v24 + j + 1];
                  [v36 setIndex:v37];

                  [v10 setObject:v36 forKey:v33];
                }
                uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v71 count:16];
                v24 += j;
              }
              while (v30);
            }
          }
        }
        v39 = objc_alloc_init(UASharedPasteboardItemInfo);
        [(UASharedPasteboardItemInfo *)v39 setTypes:v10];
        [v47 addObject:v39];

        uint64_t v7 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v48);
  }

  __int16 v40 = objc_alloc_init(UASharedPasteboardInfo);
  [(UASharedPasteboardInfo *)v40 setItems:v47];
  v41 = [(UASharedPasteboardManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UASharedPasteboardManager_sendUpdateToServer___block_invoke;
  block[3] = &unk_1E6083448;
  void block[4] = self;
  v57 = v40;
  uint64_t v58 = v43;
  uint64_t v42 = v40;
  dispatch_async(v41, block);
}

void __48__UASharedPasteboardManager_sendUpdateToServer___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) connection];
  dispatch_queue_t v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_172];
  [v3 localPasteboardTypesDidChange:*(void *)(a1 + 40) forGeneration:*(void *)(a1 + 48)];

  id v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_super v5 = [*(id *)(a1 + 32) currentGeneration];
    int v6 = 134217984;
    uint64_t v7 = [v5 generation];
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_INFO, "Did send update to server for generation: %lu", (uint8_t *)&v6, 0xCu);
  }
}

void __48__UASharedPasteboardManager_sendUpdateToServer___block_invoke_2()
{
  v0 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B3DF6000, v0, OS_LOG_TYPE_ERROR, "Error getting server connection", v1, 2u);
  }
}

- (void)clearLocalPasteboardInformation
{
  dispatch_queue_t v3 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Clearing local pasteboard information", v4, 2u);
  }

  [(UASharedPasteboardManager *)self setCurrentGeneration:0];
  [(UASharedPasteboardManager *)self doClearLocalPasteboardInfo];
}

- (void)writeLocalPasteboardToFile:(id)a3 itemDir:(id)a4 extension:(id)a5 withCompletion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    id v13 = a5;
    v14 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138543362;
      id v22 = v11;
      _os_log_impl(&dword_1B3DF6000, v14, OS_LOG_TYPE_INFO, "Consuming extension to gain access to %{public}@", buf, 0xCu);
    }

    id v15 = v13;
    [v15 bytes];

    uint64_t v16 = sandbox_extension_consume();
  }
  else
  {
    uint64_t v16 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_extension_withCompletion___block_invoke;
  v18[3] = &unk_1E6083470;
  id v19 = v12;
  uint64_t v20 = v16;
  id v17 = v12;
  [(UASharedPasteboardManager *)self writeLocalPasteboardToFile:v10 itemDir:v11 withCompletion:v18];
}

void __89__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_extension_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
    if (*(void *)(a1 + 40)) {
      sandbox_extension_release();
    }
  }
}

- (void)writeLocalPasteboardToFile:(id)a3 itemDir:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(25, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke;
  v15[3] = &unk_1E6083498;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = +[UASharedPasteboardIRManager sharedIRManager];
    uint64_t v6 = [v5 registeredConverters];
    *(_DWORD *)id buf = 138543362;
    id v32 = v6;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_INFO, "PBIR Converters: %{public}@", buf, 0xCu);
  }
  id v7 = [a1[4] currentGeneration];
  objc_sync_enter(v7);
  id v8 = [a1[4] currentGeneration];
  id v9 = [v8 items];
  id v10 = (void *)[v9 copy];

  [a1[4] setCurrentGenerationHasUpdates:0];
  objc_sync_exit(v7);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = 0;
    uint64_t v14 = *(void *)v27;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v11);
      }
      if (v13) {
        break;
      }
      uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
      id v17 = objc_alloc_init(UASharedPasteboardItemInfo);
      id v13 = [a1[4] serializeItem:v16 intoInfo:v17 withFile:a1[5] intoDir:a1[6]];
      [v3 addObject:v17];

      if (v12 == ++v15)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v12) {
          goto LABEL_5;
        }

        if (!v13) {
          goto LABEL_16;
        }
LABEL_14:
        (*((void (**)(void))a1[7] + 2))();
        goto LABEL_22;
      }
    }

    goto LABEL_14;
  }

LABEL_16:
  id v18 = objc_alloc_init(UASharedPasteboardInfo);
  [(UASharedPasteboardInfo *)v18 setDataFile:a1[5]];
  if ((unint64_t)[a1[5] offsetInFile] >> 31) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = [a1[5] offsetInFile];
  }
  [(UASharedPasteboardInfo *)v18 setDataSize:v19];
  [(UASharedPasteboardInfo *)v18 setItems:v3];
  uint64_t v20 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v20, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Queueing block to check for pasteboard changes", buf, 2u);
  }

  uint64_t v21 = dispatch_get_global_queue(25, 0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke_174;
  v22[3] = &unk_1E6083498;
  v22[4] = a1[4];
  uint64_t v23 = v18;
  id v24 = a1[6];
  id v25 = a1[7];
  id v13 = v18;
  dispatch_async(v21, v22);

LABEL_22:
}

void __79__UASharedPasteboardManager_writeLocalPasteboardToFile_itemDir_withCompletion___block_invoke_174(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  [*(id *)(a1 + 32) pickupLocalChanges:*(void *)(a1 + 40) iterNumber:1 cloneDir:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)pickupLocalChanges:(id)a3 iterNumber:(int64_t)a4 cloneDir:(id)a5 completionHandler:(id)a6
{
  int64_t v52 = a4;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v58 = a5;
  v54 = (void (**)(id, void))a6;
  id v8 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 134217984;
    int64_t v83 = v52;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "[Local Pasteboard] Checking for pasteboard updates count: %ld", buf, 0xCu);
  }

  id v9 = [(UASharedPasteboardManager *)self currentGeneration];
  objc_sync_enter(v9);
  if ([(UASharedPasteboardManager *)self currentGenerationHasUpdates])
  {
    [(UASharedPasteboardManager *)self setCurrentGenerationHasUpdates:0];
    id v10 = [(UASharedPasteboardManager *)self currentGeneration];
    id v11 = [v10 items];
    v55 = (void *)[v11 copy];

    objc_sync_exit(v9);
    uint64_t v12 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Pasteboard has changes, picking them up", buf, 2u);
    }

    [(UASharedPasteboardManager *)self setCurrentGenerationHasUpdates:0];
    if ([v55 count])
    {
      unint64_t v59 = 0;
      id v13 = 0;
      while (!v13)
      {
        v57 = [v55 objectAtIndexedSubscript:v59];
        uint64_t v14 = [v65 items];
        BOOL v15 = [v14 count] > v59;

        if (v15)
        {
          uint64_t v16 = [v65 items];
          v67 = [v16 objectAtIndexedSubscript:v59];

          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          obuint64_t j = [v57 types];
          uint64_t v63 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
          if (v63)
          {
            uint64_t v61 = *(void *)v79;
LABEL_12:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v79 != v61)
              {
                uint64_t v18 = v17;
                objc_enumerationMutation(obj);
                uint64_t v17 = v18;
              }
              uint64_t v66 = v17;
              v68 = *(void **)(*((void *)&v78 + 1) + 8 * v17);
              uint64_t v19 = [(UASharedPasteboardItemInfo *)v67 types];
              uint64_t v20 = [v19 allKeys];
              uint64_t v21 = [v68 type];
              char v22 = [v20 containsObject:v21];

              if ((v22 & 1) == 0)
              {
                uint64_t v23 = objc_alloc_init(UASharedPasteboardTypeInfo);
                if ([v68 conformsToProtocol:&unk_1F0CC4200]
                  && [v68 preferFileRep])
                {
                  id v24 = [v65 dataFile];
                  uint64_t v62 = [(UASharedPasteboardManager *)self serializeFileType:v68 intoInfo:v23 withFile:v24 intoDir:v58];
                }
                else
                {
                  id v24 = [v65 dataFile];
                  uint64_t v62 = [(UASharedPasteboardManager *)self serializeType:v68 intoInfo:v23 withFile:v24];
                }

                id v25 = [v65 dataFile];
                [v25 synchronizeFile];

                long long v26 = [(UASharedPasteboardItemInfo *)v67 types];
                long long v27 = (void *)[v26 mutableCopy];

                uint64_t v28 = [v27 count];
                long long v29 = [NSNumber numberWithUnsignedInteger:v28];
                [(UASharedPasteboardTypeInfo *)v23 setIndex:v29];

                uint64_t v30 = [v68 type];
                [v27 setObject:v23 forKey:v30];

                long long v76 = 0u;
                long long v77 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                uint64_t v31 = [(UASharedPasteboardManager *)self typeAliases];
                id v32 = [(UASharedPasteboardTypeInfo *)v23 type];
                uint64_t v33 = [v31 objectForKeyedSubscript:v32];

                uint64_t v34 = [v33 countByEnumeratingWithState:&v74 objects:v86 count:16];
                if (v34)
                {
                  uint64_t v35 = *(void *)v75;
                  do
                  {
                    for (uint64_t i = 0; i != v34; ++i)
                    {
                      if (*(void *)v75 != v35) {
                        objc_enumerationMutation(v33);
                      }
                      v37 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                      __int16 v38 = _uaGetLogForCategory(@"pasteboard-client");
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        v39 = [v68 type];
                        *(_DWORD *)id buf = 138412546;
                        int64_t v83 = (int64_t)v37;
                        __int16 v84 = 2112;
                        v85 = v39;
                        _os_log_impl(&dword_1B3DF6000, v38, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Adding alias: %@ for type: %@", buf, 0x16u);
                      }
                      __int16 v40 = (void *)[(UASharedPasteboardTypeInfo *)v23 copy];
                      [v40 setType:v37];
                      v41 = [NSNumber numberWithUnsignedInteger:v28 + i + 1];
                      [v40 setIndex:v41];

                      [v27 setObject:v40 forKey:v37];
                    }
                    uint64_t v34 = [v33 countByEnumeratingWithState:&v74 objects:v86 count:16];
                    v28 += i;
                  }
                  while (v34);
                }

                [(UASharedPasteboardItemInfo *)v67 setTypes:v27];
                if (v62) {
                  break;
                }
              }
              uint64_t v17 = v66 + 1;
              if (v66 + 1 == v63)
              {
                uint64_t v63 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
                if (v63) {
                  goto LABEL_12;
                }
                goto LABEL_32;
              }
            }
          }
          else
          {
LABEL_32:
            uint64_t v62 = 0;
          }
        }
        else
        {
          v67 = objc_alloc_init(UASharedPasteboardItemInfo);
          uint64_t v42 = [v65 dataFile];
          uint64_t v62 = [(UASharedPasteboardManager *)self serializeItem:v57 intoInfo:v67 withFile:v42 intoDir:v58];

          obuint64_t j = [v65 items];
          uint64_t v43 = [obj arrayByAddingObject:v67];
          [v65 setItems:v43];
        }
        unint64_t v44 = [v55 count];
        ++v59;
        id v13 = (void *)v62;
        if (v44 <= v59)
        {
          if (!v62) {
            goto LABEL_41;
          }
          break;
        }
      }
      v45 = v13;
      v54[2](v54, 0);
    }
    else
    {
LABEL_41:
      uint64_t v48 = objc_msgSend(v65, "dataFile", v52);
      if ((unint64_t)[v48 offsetInFile] >> 31)
      {
        [v65 setDataSize:0];
      }
      else
      {
        uint64_t v49 = [v65 dataFile];
        objc_msgSend(v65, "setDataSize:", objc_msgSend(v49, "offsetInFile"));
      }
      v50 = _uaGetLogForCategory(@"pasteboard-client");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1B3DF6000, v50, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Queueing block to check for pasteboard changes", buf, 2u);
      }

      v51 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__UASharedPasteboardManager_pickupLocalChanges_iterNumber_cloneDir_completionHandler___block_invoke;
      block[3] = &unk_1E60834C0;
      void block[4] = self;
      id v70 = v65;
      uint64_t v73 = v53;
      id v71 = v58;
      v72 = v54;
      dispatch_async(v51, block);
    }
  }
  else
  {
    objc_sync_exit(v9);

    uint64_t v46 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      int64_t v83 = (int64_t)v65;
      _os_log_impl(&dword_1B3DF6000, v46, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] No updates, sending pasteboard info to server: %@", buf, 0xCu);
    }

    ((void (*)(void (**)(id, void), id, void))v54[2])(v54, v65, 0);
    id v47 = [(UASharedPasteboardManager *)self localPasteboardWasFetched];

    if (v47)
    {
      v56 = [(UASharedPasteboardManager *)self localPasteboardWasFetched];
      v56[2]();
    }
  }
}

void __86__UASharedPasteboardManager_pickupLocalChanges_iterNumber_cloneDir_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  [*(id *)(a1 + 32) pickupLocalChanges:*(void *)(a1 + 40) iterNumber:*(void *)(a1 + 64) + 1 cloneDir:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (id)serializeItem:(id)a3 intoInfo:(id)a4 withFile:(id)a5 intoDir:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v35 = a4;
  id v37 = a5;
  id v36 = a6;
  id v9 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v40 types];
    *(_DWORD *)id buf = 138412546;
    id v49 = v40;
    __int16 v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_INFO, "[Local Pasteboard] Serializing item: %@ with types: %@", buf, 0x16u);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = [v40 types];
  BOOL v13 = [v12 count] == 0;

  if (v13)
  {
    id v32 = 0;
  }
  else
  {
    uint64_t v41 = 0;
    do
    {
      uint64_t v14 = [v40 types];
      uint64_t v42 = [v14 objectAtIndexedSubscript:v41];

      BOOL v15 = objc_alloc_init(UASharedPasteboardTypeInfo);
      if ([v42 conformsToProtocol:&unk_1F0CC4200]
        && [v42 preferFileRep])
      {
        uint64_t v38 = [(UASharedPasteboardManager *)self serializeFileType:v42 intoInfo:v15 withFile:v37 intoDir:v36];
      }
      else
      {
        uint64_t v38 = [(UASharedPasteboardManager *)self serializeType:v42 intoInfo:v15 withFile:v37];
      }
      uint64_t v16 = [v11 count];
      uint64_t v17 = [NSNumber numberWithUnsignedInteger:v16];
      [(UASharedPasteboardTypeInfo *)v15 setIndex:v17];

      uint64_t v18 = [(UASharedPasteboardTypeInfo *)v15 type];
      [v11 setObject:v15 forKey:v18];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v19 = [(UASharedPasteboardManager *)self typeAliases];
      uint64_t v20 = [(UASharedPasteboardTypeInfo *)v15 type];
      uint64_t v21 = [v19 objectForKeyedSubscript:v20];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v21);
            }
            id v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            long long v26 = _uaGetLogForCategory(@"pasteboard-client");
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              long long v27 = [v42 type];
              *(_DWORD *)id buf = 138412546;
              id v49 = v25;
              __int16 v50 = 2112;
              v51 = v27;
              _os_log_impl(&dword_1B3DF6000, v26, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Adding alias: %@ for type: %@", buf, 0x16u);
            }
            uint64_t v28 = (void *)[(UASharedPasteboardTypeInfo *)v15 copy];
            [v28 setType:v25];
            long long v29 = [NSNumber numberWithUnsignedInteger:v16 + i + 1];
            [v28 setIndex:v29];

            [v11 setObject:v28 forKey:v25];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
          v16 += i;
        }
        while (v22);
      }

      uint64_t v30 = [v40 types];
      BOOL v31 = [v30 count] > (unint64_t)++v41;

      id v32 = (void *)v38;
      if (v38) {
        BOOL v33 = 0;
      }
      else {
        BOOL v33 = v31;
      }
    }
    while (v33);
  }
  [v37 synchronizeFile];
  [v35 setTypes:v11];

  return v32;
}

- (id)serializeFileType:(id)a3 intoInfo:(id)a4 withFile:(id)a5 intoDir:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = dispatch_group_create();
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__1;
  uint64_t v41 = __Block_byref_object_dispose__1;
  id v42 = 0;
  [v10 setType:@"public.file-url"];
  uint64_t v14 = [v9 uuid];
  [v10 setUuid:v14];

  [v10 setPreferFileRep:1];
  if (objc_opt_respondsToSelector())
  {
    BOOL v15 = [v9 getFileName];
    [v10 setTypeHint:v15];
  }
  uint64_t v16 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v9 uuid];
    uint64_t v18 = [v9 type];
    *(_DWORD *)id buf = 138412546;
    id v44 = v17;
    __int16 v45 = 2112;
    long long v46 = v18;
    _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_INFO, "[Local Pasteboard] Serializing type as file: %@-%@", buf, 0x16u);
  }
  uint64_t v19 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v44 = v12;
    _os_log_impl(&dword_1B3DF6000, v19, OS_LOG_TYPE_INFO, "[Local Pasteboard] Clone Dir: %@", buf, 0xCu);
  }

  uint64_t v20 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v20, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Enter Type Group", buf, 2u);
  }

  dispatch_group_enter(v13);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __73__UASharedPasteboardManager_serializeFileType_intoInfo_withFile_intoDir___block_invoke;
  void v30[3] = &unk_1E60834E8;
  id v21 = v9;
  id v31 = v21;
  id v36 = &v37;
  id v22 = v12;
  id v32 = v22;
  id v23 = v10;
  id v33 = v23;
  id v24 = v11;
  id v34 = v24;
  id v25 = v13;
  id v35 = v25;
  [v21 getDataFileWithCompletionBlock:v30];
  long long v26 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v26, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Waiting on Type Group", buf, 2u);
  }

  dispatch_time_t v27 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v25, v27);
  id v28 = (id)v38[5];

  _Block_object_dispose(&v37, 8);

  return v28;
}

void __73__UASharedPasteboardManager_serializeFileType_intoInfo_withFile_intoDir___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _uaGetLogForCategory(@"pasteboard-client");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:0];
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
      goto LABEL_31;
    }
    id v8 = [*(id *)(a1 + 32) type];
    *(_DWORD *)id buf = 138412546;
    id v53 = v8;
    __int16 v54 = 2112;
    id v55 = v6;
    id v9 = "[Local Pasteboard] ERROR: error getting type data for type[%@]: %@";
    id v10 = v7;
    uint32_t v11 = 22;
LABEL_4:
    _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);

    goto LABEL_5;
  }
  if (!v5)
  {
    id v7 = _uaGetLogForCategory(@"pasteboard-client");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    id v8 = [*(id *)(a1 + 32) type];
    *(_DWORD *)id buf = 138412290;
    id v53 = v8;
    id v9 = "[Local Pasteboard] ERROR: url is nil for type[%@]";
    id v10 = v7;
    uint32_t v11 = 12;
    goto LABEL_4;
  }
  uint64_t v14 = [v5 lastPathComponent];
  BOOL v15 = [*(id *)(a1 + 40) URLByAppendingPathComponent:v14];
  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v17 = [v5 path];
  int v18 = [v16 isReadableFileAtPath:v17];

  if (v18)
  {
    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v20 = [v15 path];
    int v21 = [v19 fileExistsAtPath:v20];

    if (v21)
    {
      id v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v51 = 0;
      char v23 = [v22 removeItemAtURL:v15 error:&v51];
      id v24 = v51;

      if ((v23 & 1) == 0)
      {
        id v25 = _uaGetLogForCategory(@"pasteboard-client");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id buf = 138412290;
          id v53 = v24;
          _os_log_impl(&dword_1B3DF6000, v25, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: error removing existing item from clone dir: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v24 = 0;
    }
    long long v26 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v50 = v24;
    char v27 = [v26 copyItemAtURL:v5 toURL:v15 error:&v50];
    id v28 = v50;

    if (v28)
    {
      long long v29 = _uaGetLogForCategory(@"pasteboard-client");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [*(id *)(a1 + 32) type];
        *(_DWORD *)id buf = 138412546;
        id v53 = v30;
        __int16 v54 = 2112;
        id v55 = v28;
        id v31 = "[Local pasteboard] ERROR: error copying file for type[%@]: %@";
        id v32 = v29;
        uint32_t v33 = 22;
LABEL_27:
        _os_log_impl(&dword_1B3DF6000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      }
    }
    else
    {
      if (v27)
      {
        id v34 = [v15 absoluteString];
        id v35 = [v34 dataUsingEncoding:4];

        id v36 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 56), "offsetInFile"));
        [*(id *)(a1 + 48) setOffset:v36];

        objc_msgSend(*(id *)(a1 + 48), "setSize:", objc_msgSend(v35, "length"));
        uint64_t v37 = *(void **)(a1 + 56);
        id v49 = 0;
        char v38 = [v37 writeData:v35 error:&v49];
        id v39 = v49;
        if ((v38 & 1) == 0)
        {
          id v40 = _uaGetLogForCategory(@"pasteboard-client");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = [*(id *)(a1 + 32) type];
            *(_DWORD *)id buf = 138543618;
            id v53 = v41;
            __int16 v54 = 2114;
            id v55 = v39;
            _os_log_impl(&dword_1B3DF6000, v40, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);
          }
          uint64_t v42 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-128 userInfo:0];
          uint64_t v43 = *(void *)(*(void *)(a1 + 72) + 8);
          id v44 = *(void **)(v43 + 40);
          *(void *)(v43 + 40) = v42;
        }
        goto LABEL_29;
      }
      long long v29 = _uaGetLogForCategory(@"pasteboard-client");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [*(id *)(a1 + 32) type];
        *(_DWORD *)id buf = 138412290;
        id v53 = v30;
        id v31 = "[Local Pasteboard] ERROR: Failed to copy file for type[%@] but no error object";
        id v32 = v29;
        uint32_t v33 = 12;
        goto LABEL_27;
      }
    }

    uint64_t v45 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:0];
    uint64_t v46 = *(void *)(*(void *)(a1 + 72) + 8);
    id v35 = *(void **)(v46 + 40);
    *(void *)(v46 + 40) = v45;
LABEL_29:
  }
LABEL_31:

  uint64_t v47 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v47, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Leave Type Group", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  uint64_t v48 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v48, OS_LOG_TYPE_INFO, "[Local Pasteboard] Done writing pasteboard type", buf, 2u);
  }
}

- (id)serializeType:(id)a3 intoInfo:(id)a4 withFile:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint32_t v11 = dispatch_group_create();
  uint64_t v32 = 0;
  uint32_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__1;
  id v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  uint64_t v12 = [v8 type];
  [v9 setType:v12];

  uint64_t v13 = [v8 uuid];
  [v9 setUuid:v13];

  uint64_t v14 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = [v8 uuid];
    uint64_t v16 = [v8 type];
    *(_DWORD *)id buf = 138412546;
    id v39 = v15;
    __int16 v40 = 2112;
    uint64_t v41 = v16;
    _os_log_impl(&dword_1B3DF6000, v14, OS_LOG_TYPE_INFO, "[Local Pasteboard] Serializing type: %@-%@", buf, 0x16u);
  }
  uint64_t v17 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v17, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Enter Type Group", buf, 2u);
  }

  dispatch_group_enter(v11);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke;
  v26[3] = &unk_1E6083538;
  v26[4] = self;
  id v18 = v8;
  id v27 = v18;
  id v31 = &v32;
  id v19 = v9;
  id v28 = v19;
  id v20 = v10;
  id v29 = v20;
  int v21 = v11;
  uint64_t v30 = v21;
  [v18 getDataWithCompletionBlock:v26];
  id v22 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v22, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Waiting on Type Group", buf, 2u);
  }

  dispatch_time_t v23 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v21, v23);
  id v24 = (id)v33[5];

  _Block_object_dispose(&v32, 8);

  return v24;
}

void __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) pasteboardReadQ];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke_2;
  v14[3] = &unk_1E6083510;
  id v15 = v5;
  id v16 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 72);
  id v17 = v8;
  uint64_t v22 = v9;
  id v18 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v19 = v10;
  uint64_t v20 = v11;
  id v21 = *(id *)(a1 + 64);
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v7, v14);
}

void __61__UASharedPasteboardManager_serializeType_intoInfo_withFile___block_invoke_2(uint64_t a1)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = [v3 hasBytesAvailable];
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)id buf = 138412802;
    v108 = v3;
    __int16 v109 = 1024;
    *(_DWORD *)v110 = v4;
    *(_WORD *)&v110[4] = 2112;
    *(void *)&v110[6] = v5;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "[Local Pasteboard] Got data stream: %@(%d) with error: %@", buf, 0x1Cu);
  }

  if (*(void *)(a1 + 40))
  {
    id v6 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 48) type];
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138412546;
      v108 = v7;
      __int16 v109 = 2112;
      *(void *)v110 = v8;
      _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: error getting type data for type[%@]: %@", buf, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    [*(id *)(a1 + 32) open];
    uint64_t v91 = (uint64_t)&v91;
    v93 = (unsigned __int8 *)&v90;
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 64), "offsetInFile"));
    [*(id *)(a1 + 56) setOffset:v12];

    id v13 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [*(id *)(a1 + 48) type];
      id v15 = [*(id *)(a1 + 56) offset];
      *(_DWORD *)id buf = 138412546;
      v108 = v14;
      __int16 v109 = 2112;
      *(void *)v110 = v15;
      _os_log_impl(&dword_1B3DF6000, v13, OS_LOG_TYPE_INFO, "[Local Pasteboard] Adding type (%@) data to file at offset: %@", buf, 0x16u);
    }
    id v16 = +[UASharedPasteboardIRManager sharedIRManager];
    id v17 = [*(id *)(a1 + 48) type];
    id v18 = [v16 converterForType:v17];

    id v19 = _uaGetLogForCategory(@"pasteboard-client");
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v20)
      {
        id v21 = [*(id *)(a1 + 48) type];
        uint64_t v22 = objc_opt_class();
        *(_DWORD *)id buf = 138543618;
        v108 = v21;
        __int16 v109 = 2112;
        *(void *)v110 = v22;
        id v23 = v22;
        _os_log_impl(&dword_1B3DF6000, v19, OS_LOG_TYPE_INFO, "[Local Pasteboard] Found converter for type: %{public}@ -> %@", buf, 0x16u);
      }
      id v97 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    }
    else
    {
      if (v20)
      {
        id v24 = [*(id *)(a1 + 48) type];
        *(_DWORD *)id buf = 138543362;
        v108 = v24;
        _os_log_impl(&dword_1B3DF6000, v19, OS_LOG_TYPE_INFO, "[Local Pasteboard] No converter for type: %{public}@", buf, 0xCu);
      }
      id v97 = 0;
    }
    id v25 = [*(id *)(a1 + 72) bomCheckTypes];
    long long v26 = [*(id *)(a1 + 48) type];
    char v27 = [v25 containsObject:v26];

    v96 = @"UAContinuityErrorDomain";
    *(void *)&long long v28 = 138543618;
    long long v95 = v28;
    id v29 = v93;
    while (1)
    {
      uint64_t v30 = [*(id *)(a1 + 32) read:v29 maxLength:1024];
      uint64_t v31 = v30;
      if (v30 < 1) {
        break;
      }
      if (v27)
      {
        uint64_t v92 = v30;
        uint64_t v32 = [*(id *)(a1 + 72) typeBOMs];
        uint32_t v33 = [*(id *)(a1 + 48) type];
        uint64_t v34 = [v32 objectForKeyedSubscript:v33];

        uint64_t v35 = [v34 count];
        id v36 = v34;
        if (v35)
        {
          unint64_t v37 = 0;
          while (1)
          {
            int v38 = v29[v37];
            id v39 = v36;
            __int16 v40 = [v36 objectAtIndexedSubscript:v37];
            int v41 = [v40 shortValue];

            if (v38 != v41) {
              break;
            }
            ++v37;
            unint64_t v42 = [v39 count];
            id v36 = v39;
            if (v42 <= v37) {
              goto LABEL_44;
            }
          }
          id v94 = v39;
          uint64_t v43 = [v39 count];
          if ((int)v43 >= 1)
          {
            uint64_t v44 = v43;
            uint64_t v45 = (v43 << 32) - 0x100000000;
            uint64_t v46 = v29;
            id v36 = v94;
            while (1)
            {
              int v47 = *v46++;
              uint64_t v48 = [v36 objectAtIndexedSubscript:v45 >> 32];
              int v49 = [v48 shortValue];

              id v29 = v93;
              if (v47 != v49) {
                break;
              }
              v45 -= 0x100000000;
              --v44;
              id v36 = v94;
              if (!v44) {
                goto LABEL_44;
              }
            }
          }
          char v105 = 0;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          id v50 = v94;
          uint64_t v51 = [v50 countByEnumeratingWithState:&v101 objects:v106 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v102;
            do
            {
              for (uint64_t i = 0; i != v52; ++i)
              {
                if (*(void *)v102 != v53) {
                  objc_enumerationMutation(v50);
                }
                char v105 = [*(id *)(*((void *)&v101 + 1) + 8 * i) shortValue];
                if (v18)
                {
                  [v97 appendBytes:&v105 length:1];
                }
                else
                {
                  id v55 = *(void **)(a1 + 64);
                  uint64_t v56 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&v105 length:1 freeWhenDone:0];
                  id v100 = 0;
                  char v57 = [v55 writeData:v56 error:&v100];
                  id v58 = v100;

                  if ((v57 & 1) == 0)
                  {
                    unint64_t v59 = _uaGetLogForCategory(@"pasteboard-client");
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                    {
                      long long v60 = [*(id *)(a1 + 48) type];
                      *(_DWORD *)id buf = v95;
                      v108 = v60;
                      __int16 v109 = 2114;
                      *(void *)v110 = v58;
                      _os_log_impl(&dword_1B3DF6000, v59, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);
                    }
                    uint64_t v61 = [MEMORY[0x1E4F28C58] errorWithDomain:v96 code:-128 userInfo:0];
                    uint64_t v62 = *(void *)(*(void *)(a1 + 88) + 8);
                    uint64_t v63 = *(void **)(v62 + 40);
                    *(void *)(v62 + 40) = v61;
                  }
                }
                objc_msgSend(*(id *)(a1 + 56), "setSize:", objc_msgSend(*(id *)(a1 + 56), "size") + 1);
              }
              uint64_t v52 = [v50 countByEnumeratingWithState:&v101 objects:v106 count:16];
            }
            while (v52);
          }

          id v29 = v93;
          id v36 = v94;
        }
LABEL_44:

        uint64_t v31 = v92;
      }
      objc_msgSend(*(id *)(a1 + 56), "setSize:", objc_msgSend(*(id *)(a1 + 56), "size") + v31);
      if (v18)
      {
        [v97 appendBytes:v29 length:v31];
      }
      else
      {
        long long v64 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v29 length:v31 freeWhenDone:0];
        id v65 = *(void **)(a1 + 64);
        id v99 = 0;
        char v66 = [v65 writeData:v64 error:&v99];
        id v67 = v99;
        if ((v66 & 1) == 0)
        {
          v68 = _uaGetLogForCategory(@"pasteboard-client");
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            __int16 v69 = [*(id *)(a1 + 48) type];
            *(_DWORD *)id buf = v95;
            v108 = v69;
            __int16 v109 = 2114;
            *(void *)v110 = v67;
            _os_log_impl(&dword_1B3DF6000, v68, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);
          }
          uint64_t v70 = [MEMORY[0x1E4F28C58] errorWithDomain:v96 code:-128 userInfo:0];
          uint64_t v71 = *(void *)(*(void *)(a1 + 88) + 8);
          v72 = *(void **)(v71 + 40);
          *(void *)(v71 + 40) = v70;
        }
      }
      char v27 = 0;
      if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)) {
        goto LABEL_58;
      }
    }
    if (v30 < 0)
    {
      uint64_t v73 = _uaGetLogForCategory(@"pasteboard-client");
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        long long v74 = [*(id *)(a1 + 32) streamError];
        *(_DWORD *)id buf = 138543362;
        v108 = v74;
        _os_log_impl(&dword_1B3DF6000, v73, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Stream Error: %{public}@", buf, 0xCu);
      }
    }
LABEL_58:
    if (v18)
    {
      long long v75 = _uaGetLogForCategory(@"pasteboard-client");
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1B3DF6000, v75, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Converting data from platform to IR for type", buf, 2u);
      }

      long long v76 = [v18 convertPlatformDataToIR:v97];
      objc_msgSend(*(id *)(a1 + 56), "setSize:", objc_msgSend(v76, "length"));
      long long v77 = *(void **)(a1 + 64);
      id v98 = 0;
      char v78 = [v77 writeData:v76 error:&v98];
      id v79 = v98;
      if ((v78 & 1) == 0)
      {
        long long v80 = _uaGetLogForCategory(@"pasteboard-client");
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          long long v81 = [*(id *)(a1 + 48) type];
          *(_DWORD *)id buf = v95;
          v108 = v81;
          __int16 v109 = 2114;
          *(void *)v110 = v79;
          _os_log_impl(&dword_1B3DF6000, v80, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Failed to write type (%{public}@) into file: %{public}@", buf, 0x16u);
        }
        uint64_t v82 = [MEMORY[0x1E4F28C58] errorWithDomain:v96 code:-128 userInfo:0];
        uint64_t v83 = *(void *)(*(void *)(a1 + 88) + 8);
        __int16 v84 = *(void **)(v83 + 40);
        *(void *)(v83 + 40) = v82;
      }
    }
    v85 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      v86 = [*(id *)(a1 + 56) type];
      uint64_t v87 = [*(id *)(a1 + 56) size];
      *(_DWORD *)id buf = 138412546;
      v108 = v86;
      __int16 v109 = 2048;
      *(void *)v110 = v87;
      _os_log_impl(&dword_1B3DF6000, v85, OS_LOG_TYPE_INFO, "[Local Pasteboard] Data length written for type %@: %ld", buf, 0x16u);
    }
  }
  uint64_t v88 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v88, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Leave Type Group", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
  v89 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v89, OS_LOG_TYPE_INFO, "[Local Pasteboard] Done writing pasteboard type", buf, 2u);
  }
}

- (BOOL)isRemotePasteboardAvailable
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  int v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote status from server", buf, 2u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__UASharedPasteboardManager_isRemotePasteboardAvailable__block_invoke;
  v9[3] = &unk_1E6083560;
  uint64_t v11 = &v13;
  uint64_t v5 = v3;
  uint64_t v10 = v5;
  [(UASharedPasteboardManager *)self fetchPasteboardStatus:v9];
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  dispatch_semaphore_wait(v5, v6);
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

intptr_t __56__UASharedPasteboardManager_isRemotePasteboardAvailable__block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (a2) {
      uint64_t v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Got remote status: %@", (uint8_t *)&v7, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)requestRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  id v6 = a4;
  int v7 = [(UASharedPasteboardManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke;
  block[3] = &unk_1E60835D8;
  void block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_2;
  v8[3] = &unk_1E6083588;
  id v9 = *(id *)(a1 + 40);
  [*(id *)(a1 + 32) setCompletionBlock:v8];
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)id buf = 67109120;
    int v11 = v3;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote pasteboard types for process: %d", buf, 8u);
  }

  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_188;
  v6[3] = &unk_1E60835B0;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  [v4 fetchPasteboardTypesForProcess:v5 withCompletion:v6];
}

void __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Connection to useractivityd inturrupted with outstanding type request", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-126 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v26 = a2;
  char v27 = a3;
  if (v27)
  {
    int v4 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      uint64_t v45 = v27;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Type Fetch Error: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setCompletionBlock:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138412290;
      uint64_t v45 = v26;
      _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "[Local Pasteboard] Received remote pasteboard info: %@", buf, 0xCu);
    }

    uint64_t v30 = (UAPasteboardFileChunkItemProvider *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = [(UAPasteboardFileChunkItemProvider *)v26 items];
    uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v31)
    {
      uint64_t v29 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v7 = objc_alloc_init(UAPasteboardItem);
          id v8 = [v6 types];
          id v9 = [v8 allValues];
          id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_193];

          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v35 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                char v16 = [v15 type];
                if (([*(id *)(a1 + 32) typeIsDisallowedForReceiving:v16] & 1) == 0)
                {
                  if ([v16 isEqualToString:@"public.file-url"])
                  {
                    id v17 = [v15 typeHint];

                    id v18 = (void *)MEMORY[0x1E4F1CB10];
                    if (v17)
                    {
                      id v19 = [v15 typeHint];
                      BOOL v20 = [v18 fileURLWithPath:v19];
                    }
                    else
                    {
                      id v19 = [v15 uuid];
                      id v21 = [v19 UUIDString];
                      BOOL v20 = [v18 fileURLWithPath:v21];
                    }
                    uint64_t v22 = _uaGetLogForCategory(@"pasteboard-client");
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)id buf = 138477827;
                      uint64_t v45 = v20;
                      _os_log_impl(&dword_1B3DF6000, v22, OS_LOG_TYPE_INFO, "[Local Pasteboard] Using hintURL for file-url type: %{private}@", buf, 0xCu);
                    }

                    id v23 = [[UAPasteboardFileItemProvider alloc] initWithURL:v20 sandboxExtension:0];
                    [(UAPasteboardItem *)v7 addType:v23];
                  }
                  else
                  {
                    BOOL v20 = -[UAPasteboardFileChunkItemProvider initWithType:fileHandle:offsetInFile:size:]([UAPasteboardFileChunkItemProvider alloc], "initWithType:fileHandle:offsetInFile:size:", v16, 0, 0, [v15 size]);
                    [(UAPasteboardItem *)v7 addType:v20];
                  }
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v12);
          }

          id v24 = [[UAPasteboardFileChunkItemProvider alloc] initWithType:@"com.apple.is-remote-clipboard" fileHandle:0 offsetInFile:0 size:0];
          [(UAPasteboardItem *)v7 addType:v24];
          [(UAPasteboardFileChunkItemProvider *)v30 addObject:v7];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v31);
    }

    id v25 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      uint64_t v45 = v30;
      _os_log_impl(&dword_1B3DF6000, v25, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Received remote types: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setCompletionBlock:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __83__UASharedPasteboardManager_requestRemotePasteboardTypesForProcess_withCompletion___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 offset];
  id v7 = [v5 offset];
  uint64_t v8 = [v4 index];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v5 index];

    if (v10)
    {
      uint64_t v11 = [v4 index];

      uint64_t v12 = [v5 index];

      id v6 = (void *)v11;
      id v7 = (void *)v12;
    }
  }
  uint64_t v13 = [v6 compare:v7];

  return v13;
}

- (void)requestRemotePasteboardDataForProcess:(int)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(UASharedPasteboardManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke;
  block[3] = &unk_1E60835D8;
  void block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_2;
  v8[3] = &unk_1E6083588;
  id v9 = *(id *)(a1 + 40);
  [*(id *)(a1 + 32) setCompletionBlock:v8];
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)id buf = 67109120;
    int v11 = v3;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote pasteboard data for process: %d", buf, 8u);
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_200;
  v6[3] = &unk_1E60835B0;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  [v4 fetchPasteboardDataForProcess:v5 withCompletion:v6];
}

void __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Connection to useractivityd inturrupted with outstanding data request", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-126 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v69 = a2;
  id v61 = a3;
  if (v61)
  {
    id v4 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      id v80 = v61;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error fetching remote pasteboard data: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setCompletionBlock:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_49;
  }
  uint64_t v5 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v80 = v69;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Received remote pasteboard info: %@", buf, 0xCu);
  }

  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v69 sandboxExtensions];
    *(_DWORD *)id buf = 138412290;
    id v80 = v7;
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "[Local Pasteboard] Received extensions: %@", buf, 0xCu);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = [v69 items];
  uint64_t v65 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v76 != v63) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        v68 = objc_alloc_init(UAPasteboardItem);
        id v9 = [v8 types];
        id v10 = [v9 allValues];
        int v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_203];

        uint64_t v12 = [v8 types];
        uint64_t v13 = [v12 allKeys];
        LODWORD(v10) = [v13 containsObject:@"public.file-url"];

        if (v10)
        {
          uint64_t v14 = [v8 types];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"public.file-url"];

          char v16 = [v15 dataFile];
          id v17 = [v15 offset];
          objc_msgSend(v16, "seekToFileOffset:", objc_msgSend(v17, "unsignedLongLongValue"));

          id v18 = [v15 dataFile];
          id v19 = objc_msgSend(v18, "readDataOfLength:", objc_msgSend(v15, "size"));

          BOOL v20 = [v15 dataFile];
          [v20 seekToFileOffset:0];

          id v21 = [MEMORY[0x1E4F1CB10] URLWithDataRepresentation:v19 relativeToURL:0];
          uint64_t v22 = _uaGetLogForCategory(@"pasteboard-client");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 138477827;
            id v80 = v21;
            _os_log_impl(&dword_1B3DF6000, v22, OS_LOG_TYPE_INFO, "[Local Pasteboard] URL decoded from file: %{private}@", buf, 0xCu);
          }

          id v23 = [v21 lastPathComponent];
          id v24 = NSString;
          id v25 = [v15 uuid];
          long long v26 = [v25 UUIDString];
          char v66 = [v24 stringWithFormat:@"items/%@/", v26];

          char v27 = [v69 sharedDataPath];
          long long v28 = [v27 stringByAppendingPathComponent:v66];

          uint64_t v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v28];
          uint64_t v70 = [v29 URLByAppendingPathComponent:v23];

          uint64_t v30 = _uaGetLogForCategory(@"pasteboard-client");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 138412290;
            id v80 = v70;
            _os_log_impl(&dword_1B3DF6000, v30, OS_LOG_TYPE_INFO, "[Local Pasteboard] new URL for item: %@", buf, 0xCu);
          }

          uint64_t v31 = [v8 types];
          uint64_t v32 = [v31 allKeys];
          char v33 = [v32 containsObject:@"com.apple.security.sandbox-extension-dict"];

          if ((v33 & 1) == 0)
          {
            long long v34 = _uaGetLogForCategory(@"pasteboard-client");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)id buf = 0;
              _os_log_impl(&dword_1B3DF6000, v34, OS_LOG_TYPE_INFO, "[Local Pasteboard] Adding sandbox extension type because we need it on macOS", buf, 2u);
            }

            long long v35 = objc_alloc_init(UASharedPasteboardTypeInfo);
            [(UASharedPasteboardTypeInfo *)v35 setType:@"com.apple.security.sandbox-extension-dict"];
            long long v36 = [MEMORY[0x1E4F29128] UUID];
            [(UASharedPasteboardTypeInfo *)v35 setUuid:v36];

            long long v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
            [(UASharedPasteboardTypeInfo *)v35 setIndex:v37];

            uint64_t v38 = [v11 arrayByAddingObject:v35];

            int v11 = (void *)v38;
          }
        }
        else
        {
          uint64_t v70 = 0;
        }
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v39 = v11;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v71 objects:v83 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v40; ++j)
            {
              if (*(void *)v72 != v41) {
                objc_enumerationMutation(v39);
              }
              uint64_t v43 = *(void **)(*((void *)&v71 + 1) + 8 * j);
              uint64_t v44 = [v43 type];
              if ([v44 isEqualToString:@"public.file-url"])
              {
                uint64_t v45 = _uaGetLogForCategory(@"pasteboard-client");
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  uint64_t v46 = [v43 type];
                  *(_DWORD *)id buf = 138412546;
                  id v80 = v46;
                  __int16 v81 = 2112;
                  uint64_t v82 = v70;
                  _os_log_impl(&dword_1B3DF6000, v45, OS_LOG_TYPE_INFO, "[Local Pasteboard] Creating data provider for %@ with %@", buf, 0x16u);
                }
                int v47 = [v69 sandboxExtensions];
                uint64_t v48 = [v43 uuid];
                int v49 = [v47 objectForKeyedSubscript:v48];

                id v50 = [[UAPasteboardFileItemProvider alloc] initWithURL:v70 sandboxExtension:v49];
              }
              else
              {
                if ([v44 isEqualToString:@"com.apple.security.sandbox-extension-dict"])
                {
                  id v50 = 0;
                  goto LABEL_42;
                }
                uint64_t v51 = [v43 dataFile];
                if (v51) {
                  uint64_t v52 = v43;
                }
                else {
                  uint64_t v52 = v69;
                }
                int v49 = [v52 dataFile];

                uint64_t v53 = [UAPasteboardFileChunkItemProvider alloc];
                __int16 v54 = [v43 type];
                id v55 = [v43 offset];
                id v50 = -[UAPasteboardFileChunkItemProvider initWithType:fileHandle:offsetInFile:size:](v53, "initWithType:fileHandle:offsetInFile:size:", v54, v49, v55, [v43 size]);
              }
              if (v50) {
                [(UAPasteboardItem *)v68 addType:v50];
              }
LABEL_42:
            }
            uint64_t v40 = [v39 countByEnumeratingWithState:&v71 objects:v83 count:16];
          }
          while (v40);
        }

        uint64_t v56 = [UAPasteboardDataProvider alloc];
        char v57 = [MEMORY[0x1E4F1C9B8] data];
        id v58 = [(UAPasteboardDataProvider *)v56 initWithData:v57 type:@"com.apple.is-remote-clipboard"];

        [(UAPasteboardItem *)v68 addType:v58];
        [v64 addObject:v68];
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
    }
    while (v65);
  }

  unint64_t v59 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v80 = v64;
    _os_log_impl(&dword_1B3DF6000, v59, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Returning items: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) setCompletionBlock:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_49:
}

uint64_t __82__UASharedPasteboardManager_requestRemotePasteboardDataForProcess_withCompletion___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 offset];
  id v7 = [v5 offset];
  uint64_t v8 = [v4 index];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v5 index];

    if (v10)
    {
      uint64_t v11 = [v4 index];

      uint64_t v12 = [v5 index];

      id v6 = (void *)v11;
      id v7 = (void *)v12;
    }
  }
  uint64_t v13 = [v6 compare:v7];

  return v13;
}

- (BOOL)requestPasteboardFetchReturnEarly
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v2 = _uaGetLogForCategory(@"pasteboard-clien");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "Setting remote generation to return early", buf, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x1E4F29268]);
  id v4 = UASharedPasteboardAUXServiceName();
  id v5 = (void *)[v3 initWithMachServiceName:v4 options:0];

  id v6 = _UAGetSharedPasteboardAUXProtocolInterface();
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_213];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__UASharedPasteboardManager_requestPasteboardFetchReturnEarly__block_invoke_214;
  v9[3] = &unk_1E6083600;
  void v9[4] = &v11;
  [v7 setReturnPasteboardDataEarlyWithCompletion:v9];

  [v5 invalidate];
  LOBYTE(v7) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v7;
}

void __62__UASharedPasteboardManager_requestPasteboardFetchReturnEarly__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_ERROR, "ERROR getting remote proxy: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __62__UASharedPasteboardManager_requestPasteboardFetchReturnEarly__block_invoke_214(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_INFO, "Pasteboard already fetched: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)fetchPasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(UASharedPasteboardManager *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__UASharedPasteboardManager_fetchPasteboardTypesForProcess_withCompletion___block_invoke;
  v10[3] = &unk_1E6083220;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 fetchRemotePasteboardTypesForProcess:v4 withCompletion:v8];
}

uint64_t __75__UASharedPasteboardManager_fetchPasteboardTypesForProcess_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)doClearLocalPasteboardInfo
{
  id v3 = [(UASharedPasteboardManager *)self connection];
  id v2 = [v3 remoteObjectProxy];
  [v2 clearLocalPasteboardInformation];
}

- (void)fetchPasteboardDataForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(UASharedPasteboardManager *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__UASharedPasteboardManager_fetchPasteboardDataForProcess_withCompletion___block_invoke;
  v10[3] = &unk_1E6083220;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 fetchRemotePasteboardForProcess:v4 withCompletion:v8];
}

uint64_t __74__UASharedPasteboardManager_fetchPasteboardDataForProcess_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPasteboardStatus:(id)a3
{
  id v4 = a3;
  id v6 = [(UASharedPasteboardManager *)self connection];
  id v5 = [v6 remoteObjectProxy];
  [v5 fetchRemotePasteboardStatus:v4];
}

- (id)fetchRemoteName
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  char v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  id v3 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Requesting remote device name from server", buf, 2u);
  }

  id v4 = [(UASharedPasteboardManager *)self connection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_216];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__UASharedPasteboardManager_fetchRemoteName__block_invoke_217;
  v8[3] = &unk_1E60831B0;
  void v8[4] = &v10;
  [v5 fetchRemoteDeviceName:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__UASharedPasteboardManager_fetchRemoteName__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error getting proxy: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __44__UASharedPasteboardManager_fetchRemoteName__block_invoke_217(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "[Local Pasteboard] Got remote device name: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)tellClientDebuggingEnabled:(BOOL)a3 logFileHandle:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  uint64_t v5 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "Received debug update from server: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)localPasteboardWasFetched
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalPasteboardWasFetched:(id)a3
{
}

- (UAPasteboardGeneration)currentGeneration
{
  return (UAPasteboardGeneration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentGeneration:(id)a3
{
}

- (OS_dispatch_queue)serverQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerQ:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)controllConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setControllConnection:(id)a3
{
}

- (int)disableCount
{
  return self->_disableCount;
}

- (void)setDisableCount:(int)a3
{
  self->_disableCount = a3;
}

- (id)controllSyncObject
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setControllSyncObject:(id)a3
{
}

- (BOOL)remotePasteboardAvailable
{
  return self->_remotePasteboardAvailable;
}

- (void)setRemotePasteboardAvailable:(BOOL)a3
{
  self->_remotePasteboardAvailable = a3;
}

- (BOOL)currentGenerationHasUpdates
{
  return self->_currentGenerationHasUpdates;
}

- (void)setCurrentGenerationHasUpdates:(BOOL)a3
{
  self->_currentGenerationHasUpdates = a3;
}

- (BOOL)updateScheduled
{
  return self->_updateScheduled;
}

- (void)setUpdateScheduled:(BOOL)a3
{
  self->_updateScheduled = a3;
}

- (OS_dispatch_queue)pasteboardReadQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPasteboardReadQ:(id)a3
{
}

- (NSSet)disallowedTypesForSending
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisallowedTypesForSending:(id)a3
{
}

- (NSSet)disallowedTypesForReceiving
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDisallowedTypesForReceiving:(id)a3
{
}

- (NSSet)bomCheckTypes
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBomCheckTypes:(id)a3
{
}

- (NSDictionary)typeBOMs
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTypeBOMs:(id)a3
{
}

- (NSDictionary)typeAliases
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTypeAliases:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  self->_completionBlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeAliases, 0);
  objc_storeStrong((id *)&self->_typeBOMs, 0);
  objc_storeStrong((id *)&self->_bomCheckTypes, 0);
  objc_storeStrong((id *)&self->_disallowedTypesForReceiving, 0);
  objc_storeStrong((id *)&self->_disallowedTypesForSending, 0);
  objc_storeStrong((id *)&self->_pasteboardReadQ, 0);
  objc_storeStrong(&self->_controllSyncObject, 0);
  objc_storeStrong((id *)&self->_controllConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serverQ, 0);
  objc_storeStrong((id *)&self->_currentGeneration, 0);

  objc_storeStrong(&self->_localPasteboardWasFetched, 0);
}

@end