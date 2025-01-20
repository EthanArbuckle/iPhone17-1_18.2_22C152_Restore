@interface SESSessionManager
+ (id)getVehicleReports:(id *)a3;
+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(double)a4 withAppletIdentifier:(id)a5;
+ (id)requestAssertionForKeyID:(id)a3 withAppletID:(id)a4 withOptions:(id)a5 error:(id *)a6;
+ (id)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4;
+ (id)sharedInstance;
+ (void)setMachServiceName:(id)a3;
- (NSMutableSet)sessions;
- (NSString)serviceName;
- (NSXPCConnection)connection;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)startACWGSessionWithOptions:(id)a3 startCallback:(id)a4;
- (id)startAssertionForKeyIdentifier:(id)a3 withAppletIdentifier:(id)a4 withOptions:(id)a5 error:(id *)a6;
- (id)startDCKAssertionForKeyIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)startDigitalCarKeySessionWithOptions:(id)a3 startCallback:(id)a4;
- (id)startRKESessionWithOptions:(id)a3 startCallback:(id)a4;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)connect;
- (void)connectionDidInterrupt;
- (void)connectionDidInvalidate;
- (void)sessionEnded:(id)a3;
- (void)setConnection:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSessions:(id)a3;
@end

@implementation SESSessionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __35__SESSessionManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

  v2 = objc_opt_new();
  [(id)sharedInstance_instance setSessions:v2];

  v3 = (void *)sharedInstance_instance;
  return [v3 setServiceName:@"com.apple.seserviced.session"];
}

- (id)startDigitalCarKeySessionWithOptions:(id)a3 startCallback:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "startDigitalCarKeySessionWithOptions %@", buf, 0xCu);
  }

  id v9 = +[SESDCKSession newInstance];
  [v9 setDidStartCallback:v7];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke;
  v23[3] = &unk_264219B10;
  v23[4] = self;
  [v9 setDidEndCallback:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_2;
  v21[3] = &unk_264219B38;
  id v10 = v9;
  id v22 = v10;
  v11 = [(SESSessionManager *)self synchronousRemoteObjectProxyWithErrorHandler:v21];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_471;
  v18 = &unk_264219B60;
  id v12 = v10;
  id v19 = v12;
  v20 = self;
  [v11 startSESDCKSession:v12 completion:&v15];

  objc_msgSend(v12, "resume", v15, v16, v17, v18);
  id v13 = v12;

  return v13;
}

uint64_t __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionEnded:a2];
}

void __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) endSession];
  }
}

void __72__SESSessionManager_startDigitalCarKeySessionWithOptions_startCallback___block_invoke_471(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = SESDefaultLogObject();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) endSession];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "Adding new SESDCKSession %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = *(id *)(*(void *)(a1 + 40) + 8);
    objc_sync_enter(v10);
    [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
    objc_sync_exit(v10);

    [*(id *)(a1 + 32) setProxy:v5];
  }
}

- (id)startRKESessionWithOptions:(id)a3 startCallback:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "startRKESessionWithOptions %@", buf, 0xCu);
  }

  id v9 = +[SESRKESession newInstance];
  [v9 setDidStartCallback:v7];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke;
  v23[3] = &unk_264219B10;
  v23[4] = self;
  [v9 setDidEndCallback:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_2;
  v21[3] = &unk_264219B38;
  id v10 = v9;
  id v22 = v10;
  int v11 = [(SESSessionManager *)self synchronousRemoteObjectProxyWithErrorHandler:v21];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_474;
  v18 = &unk_264219B60;
  id v12 = v10;
  id v19 = v12;
  v20 = self;
  [v11 startSESRKESession:v12 options:v6 completion:&v15];

  objc_msgSend(v12, "resume", v15, v16, v17, v18);
  id v13 = v12;

  return v13;
}

uint64_t __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionEnded:a2];
}

void __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) endSession];
  }
}

void __62__SESSessionManager_startRKESessionWithOptions_startCallback___block_invoke_474(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = SESDefaultLogObject();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) endSessionWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "Adding new SESRKESession %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = *(id *)(*(void *)(a1 + 40) + 8);
    objc_sync_enter(v10);
    [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
    objc_sync_exit(v10);

    [*(id *)(a1 + 32) setProxy:v5];
  }
}

- (id)startACWGSessionWithOptions:(id)a3 startCallback:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "startACWGSessionWithOptions %@", buf, 0xCu);
  }

  id v9 = +[SESACWGSession newInstance];
  [v9 setDidStartCallback:v7];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke;
  v23[3] = &unk_264219B10;
  v23[4] = self;
  [v9 setDidEndCallback:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_2;
  v21[3] = &unk_264219B38;
  id v10 = v9;
  id v22 = v10;
  int v11 = [(SESSessionManager *)self synchronousRemoteObjectProxyWithErrorHandler:v21];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_476;
  v18 = &unk_264219B60;
  id v12 = v10;
  id v19 = v12;
  v20 = self;
  [v11 startSESACWGSession:v12 completion:&v15];

  objc_msgSend(v12, "resume", v15, v16, v17, v18);
  id v13 = v12;

  return v13;
}

uint64_t __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sessionEnded:a2];
}

void __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) endSession];
  }
}

void __63__SESSessionManager_startACWGSessionWithOptions_startCallback___block_invoke_476(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = SESDefaultLogObject();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) endSession];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "Adding new SESACWGSession %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = *(id *)(*(void *)(a1 + 40) + 8);
    objc_sync_enter(v10);
    [*(id *)(*(void *)(a1 + 40) + 8) addObject:*(void *)(a1 + 32)];
    objc_sync_exit(v10);

    [*(id *)(a1 + 32) setProxy:v5];
  }
}

- (void)sessionEnded:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_sessions;
  objc_sync_enter(v5);
  id v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_INFO, "Session %@ ended", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableSet *)self->_sessions removeObject:v4];
  objc_sync_exit(v5);
}

- (void)connect
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connection)
  {
    id v3 = SESDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_INFO, "Already XPC connected", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    id v5 = [(SESSessionManager *)v2 serviceName];
    uint64_t v6 = [v4 initWithMachServiceName:v5 options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v6;

    id v8 = +[SESSessionManagerInterface interface];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v8];

    uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C572428];
    [(NSXPCConnection *)v2->_connection setExportedInterface:v9];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    objc_initWeak(buf, v2);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __28__SESSessionManager_connect__block_invoke;
    v14[3] = &unk_264219820;
    objc_copyWeak(&v15, buf);
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __28__SESSessionManager_connect__block_invoke_520;
    v12[3] = &unk_264219820;
    objc_copyWeak(&v13, buf);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v12];
    [(NSXPCConnection *)v2->_connection resume];
    id v10 = SESDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_2146ED000, v10, OS_LOG_TYPE_INFO, "XPC connected", v11, 2u);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
  objc_sync_exit(v2);
}

void __28__SESSessionManager_connect__block_invoke(uint64_t a1)
{
  v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2146ED000, v2, OS_LOG_TYPE_INFO, "Connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionDidInterrupt];
}

void __28__SESSessionManager_connect__block_invoke_520(uint64_t a1)
{
  v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2146ED000, v2, OS_LOG_TYPE_INFO, "Connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionDidInvalidate];
}

- (void)connectionDidInterrupt
{
  obj = self;
  objc_sync_enter(obj);
  [(NSXPCConnection *)obj->_connection invalidate];
  objc_sync_exit(obj);
}

- (void)connectionDidInvalidate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  obj = self->_sessions;
  objc_sync_enter(obj);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (void *)[(NSMutableSet *)self->_sessions copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = SESDefaultLogObject();
        uint64_t v9 = SESCreateAndLogError();
        [v7 didEndUnexpectedly:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  objc_sync_exit(obj);
  id v10 = self;
  objc_sync_enter(v10);
  connection = v10->_connection;
  v10->_connection = 0;

  objc_sync_exit(v10);
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(double)a4 withAppletIdentifier:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a5;
  uint64_t v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2112;
    v24 = v8;
    _os_log_impl(&dword_2146ED000, v9, OS_LOG_TYPE_INFO, "pauseRangingForReaderIdentifier %@ durationInSec %f appletIdentifier %@", buf, 0x20u);
  }

  if (a4 >= 1.0)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v24 = __Block_byref_object_copy__8;
    id v25 = __Block_byref_object_dispose__8;
    id v26 = 0;
    id v12 = +[SESSessionManager sharedInstance];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke;
    v20[3] = &unk_2642194D8;
    v20[4] = buf;
    long long v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v20];
    long long v14 = [NSNumber numberWithDouble:a4];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke_2;
    v19[3] = &unk_2642194D8;
    v19[4] = buf;
    [v13 pauseRangingForReaderIdentifier:v7 durationInSec:v14 withAppletIdentifier:v8 reply:v19];

    long long v15 = *(void **)(*(void *)&buf[8] + 40);
    if (v15)
    {
      long long v16 = SESDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v21 = 138412290;
        uint64_t v22 = v17;
        _os_log_impl(&dword_2146ED000, v16, OS_LOG_TYPE_ERROR, "%@", v21, 0xCu);
      }

      long long v15 = *(void **)(*(void *)&buf[8] + 40);
    }
    id v11 = v15;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

void __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

void __88__SESSessionManager_pauseRangingForReaderIdentifier_durationInSec_withAppletIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = SESDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_2146ED000, v7, OS_LOG_TYPE_INFO, "resumeRangingForReaderIdentifier %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  uint64_t v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  id v8 = +[SESSessionManager sharedInstance];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke;
  v16[3] = &unk_2642194D8;
  v16[4] = &buf;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke_2;
  v15[3] = &unk_2642194D8;
  v15[4] = &buf;
  [v9 resumeRangingForReaderIdentifier:v5 withAppletIdentifier:v6 reply:v15];

  id v10 = *(void **)(*((void *)&buf + 1) + 40);
  if (v10)
  {
    id v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v17 = 138412290;
      uint64_t v18 = v12;
      _os_log_impl(&dword_2146ED000, v11, OS_LOG_TYPE_ERROR, "%@", v17, 0xCu);
    }

    id v10 = *(void **)(*((void *)&buf + 1) + 40);
  }
  id v13 = v10;
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

void __75__SESSessionManager_resumeRangingForReaderIdentifier_withAppletIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)getVehicleReports:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_INFO, "getVehicleReports", buf, 2u);
  }

  *(void *)long long buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__8;
  id v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__8;
  uint64_t v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  id v5 = +[SESSessionManager sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__SESSessionManager_getVehicleReports___block_invoke;
  v12[3] = &unk_2642194D8;
  void v12[4] = buf;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__SESSessionManager_getVehicleReports___block_invoke_2;
  v11[3] = &unk_264219B88;
  v11[4] = &v13;
  v11[5] = buf;
  [v6 getVehicleReports:v11];

  if (*((void *)v20 + 5))
  {
    id v7 = SESDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *((void *)v20 + 5);
      *(_DWORD *)id v25 = 138412290;
      uint64_t v26 = v8;
      _os_log_impl(&dword_2146ED000, v7, OS_LOG_TYPE_ERROR, "%@", v25, 0xCu);
    }
  }
  if (a3) {
    *a3 = *((id *)v20 + 5);
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(buf, 8);
  return v9;
}

void __39__SESSessionManager_getVehicleReports___block_invoke(uint64_t a1, void *a2)
{
}

void __39__SESSessionManager_getVehicleReports___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)startDCKAssertionForKeyIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = SESDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_2146ED000, v10, OS_LOG_TYPE_INFO, "startDCKAssertionForKeyIdentifier %@ options %@", buf, 0x16u);
  }

  id v11 = [[SESDCKAssertion alloc] initWithKeyIdentifier:v8];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v24 = __Block_byref_object_copy__8;
  id v25 = __Block_byref_object_dispose__8;
  id v26 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke;
  v22[3] = &unk_2642194D8;
  v22[4] = buf;
  uint64_t v12 = [(SESSessionManager *)self synchronousRemoteObjectProxyWithErrorHandler:v22];
  uint64_t v13 = [(SESDCKAssertion *)v11 keyIdentifier];
  long long v14 = [(SESDCKAssertion *)v11 appletIdentifier];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke_530;
  v19[3] = &unk_264219BB0;
  uint64_t v21 = buf;
  uint64_t v15 = v11;
  uint64_t v20 = v15;
  [v12 startSESAssertion:v15 withKeyIdentifier:v13 withAppletIdentifier:v14 withOptions:v9 completion:v19];

  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  if (*(void *)(*(void *)&buf[8] + 40)) {
    long long v16 = 0;
  }
  else {
    long long v16 = v15;
  }
  uint64_t v17 = v16;

  _Block_object_dispose(buf, 8);
  return v17;
}

void __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    id v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __73__SESSessionManager_startDCKAssertionForKeyIdentifier_withOptions_error___block_invoke_530(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = SESDefaultLogObject();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "Started new SESDCKAssertion %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) setProxy:v5];
  }
}

+ (id)requestAssertionForKeyID:(id)a3 withAppletID:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[SESSessionManager sharedInstance];
  id v16 = 0;
  uint64_t v13 = [v12 startAssertionForKeyIdentifier:v11 withAppletIdentifier:v10 withOptions:v9 error:&v16];

  id v14 = v16;
  if (a6) {
    *a6 = v14;
  }

  return v13;
}

- (id)startAssertionForKeyIdentifier:(id)a3 withAppletIdentifier:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  uint64_t v13 = SESDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v27 = v12;
    _os_log_impl(&dword_2146ED000, v13, OS_LOG_TYPE_INFO, "startAssertionForKeyIdentifier %@ appletIdentifier %@ options %@", buf, 0x20u);
  }

  id v14 = [[SESAssertion alloc] initWithKeyIdentifier:v10 appletIdentifier:v11];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke;
  v25[3] = &unk_2642194D8;
  uint8_t v25[4] = buf;
  uint64_t v15 = [(SESSessionManager *)self synchronousRemoteObjectProxyWithErrorHandler:v25];
  id v16 = [(SESAssertion *)v14 keyIdentifier];
  uint64_t v17 = [(SESAssertion *)v14 appletIdentifier];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke_533;
  v22[3] = &unk_264219BB0;
  id v24 = buf;
  id v18 = v14;
  id v23 = v18;
  [v15 startSESAssertion:v18 withKeyIdentifier:v16 withAppletIdentifier:v17 withOptions:v12 completion:v22];

  if (a6) {
    *a6 = *(id *)(*(void *)&buf[8] + 40);
  }
  if (*(void *)(*(void *)&buf[8] + 40)) {
    id v19 = 0;
  }
  else {
    id v19 = v18;
  }
  uint64_t v20 = v19;

  _Block_object_dispose(buf, 8);
  return v20;
}

void __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    id v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_ERROR, "Failed to get proxy %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __91__SESSessionManager_startAssertionForKeyIdentifier_withAppletIdentifier_withOptions_error___block_invoke_533(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = SESDefaultLogObject();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Proxy error %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "Started new SESAssertion %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) setProxy:v5];
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(SESSessionManager *)v5 connect];
  connection = v5->_connection;
  if (connection)
  {
    id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    uint64_t v8 = SESDefaultLogObject();
    id v9 = SESCreateAndLogError();
    v4[2](v4, v9);

    id v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(SESSessionManager *)v5 connect];
  connection = v5->_connection;
  if (connection)
  {
    id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    uint64_t v8 = SESDefaultLogObject();
    id v9 = SESCreateAndLogError();
    v4[2](v4, v9);

    id v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

+ (void)setMachServiceName:(id)a3
{
  id v3 = a3;
  id v5 = +[SESSessionManager sharedInstance];
  id v4 = (void *)v5[3];
  v5[3] = v3;
}

- (NSMutableSet)sessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSessions:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end