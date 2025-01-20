@interface SVXDaemon
+ (void)initialize;
- (BOOL)handleClientServiceXPCConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SVXDaemon)init;
- (SVXDaemon)initWithClientServiceQueuePerformer:(id)a3 mainQueuePerformer:(id)a4 clientServiceListener:(id)a5 platformDependenciesTracker:(id)a6 virtualDeviceManager:(id)a7 runningObserver:(id)a8 siriActivationListenerDelegate:(id)a9 remoraVirtualDeviceManager:(id)a10 homeHubManagerObserver:(id)a11 rebootExecutor:(id)a12 connectionFactory:(id)a13;
- (void)_enumerateVirtualDevicesUsingBlock:(id)a3;
- (void)clientServiceServerConnectionDidInvalidate:(id)a3;
- (void)startWithPlatformDependencies:(id)a3;
- (void)stop;
@end

@implementation SVXDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_rebootExecutor, 0);
  objc_storeStrong((id *)&self->_homeHubManagerObserver, 0);
  objc_storeStrong((id *)&self->_remoraVirtualDeviceManager, 0);
  objc_storeStrong((id *)&self->_siriActivationListenerDelegate, 0);
  objc_storeStrong((id *)&self->_runningObserver, 0);
  objc_storeStrong((id *)&self->_virtualDeviceManager, 0);
  objc_storeStrong((id *)&self->_platformDependenciesTracker, 0);
  objc_storeStrong((id *)&self->_clientServiceListener, 0);
  objc_storeStrong((id *)&self->_mainQueuePerformer, 0);

  objc_storeStrong((id *)&self->_clientServiceQueuePerformer, 0);
}

- (void)_enumerateVirtualDevicesUsingBlock:(id)a3
{
  if (a3)
  {
    virtualDeviceManager = self->_virtualDeviceManager;
    id v5 = a3;
    id v6 = [(SVXVirtualDeviceManager *)virtualDeviceManager hostVirtualDevice];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)clientServiceServerConnectionDidInvalidate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXDaemon clientServiceServerConnectionDidInvalidate:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s connection = %@", buf, 0x16u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)mainQueuePerformer performBlock:v8];
}

void __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke_2;
  v2[3] = &unk_264554428;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateVirtualDevicesUsingBlock:v2];
}

void __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 clientServiceServer];
  [v3 removeConnection:*(void *)(a1 + 32)];
}

- (BOOL)handleClientServiceXPCConnection:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SVXDaemon handleClientServiceXPCConnection:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = @"com.apple.SiriVOXService.client";
    *(_WORD *)&buf[22] = 2112;
    v23 = v4;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Checking entitlement %@ on %@...", buf, 0x20u);
  }
  id v7 = [v4 valueForEntitlement:@"com.apple.SiriVOXService.client"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      BOOL v13 = 0;
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SVXDaemon handleClientServiceXPCConnection:]";
    v15 = "%s Entitlement value of SVXMachServiceEntitlements.clientService is expected to be an NSNumber.";
LABEL_16:
    _os_log_error_impl(&dword_220062000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
    goto LABEL_13;
  }
  if (([v7 BOOLValue] & 1) == 0)
  {
    uint64_t v14 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SVXDaemon handleClientServiceXPCConnection:]";
    v15 = "%s Entitlement value of SVXMachServiceEntitlements.clientService is expected to be true.";
    goto LABEL_16;
  }
  v8 = [(SVXQueuePerformer *)self->_clientServiceQueuePerformer queue];
  [v4 _setQueue:v8];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__13004;
  v24 = __Block_byref_object_dispose__13005;
  id v25 = [(SVXClientServiceServerConnectionFactory *)self->_connectionFactory createWithXPCConnection:v4 performer:self->_clientServiceQueuePerformer delegate:self];
  id v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v18 = 136315394;
    v19 = "-[SVXDaemon handleClientServiceXPCConnection:]";
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Connected to %@.", v18, 0x16u);
    id v9 = *v5;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v18 = 136315394;
    v19 = "-[SVXDaemon handleClientServiceXPCConnection:]";
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Checking instance info on %@...", v18, 0x16u);
  }
  clientServiceQueuePerformer = self->_clientServiceQueuePerformer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke;
  v17[3] = &unk_264554400;
  v17[4] = self;
  v17[5] = buf;
  [(SVXQueuePerformer *)clientServiceQueuePerformer performBlock:v17 withOptions:0];
  [v4 resume];
  _Block_object_dispose(buf, 8);

  BOOL v13 = 1;
LABEL_14:

  return v13;
}

uint64_t __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(v1 + 8) + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2;
  v4[3] = &unk_2645543D8;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v1;
  return [v2 getInstanceInfoWithCompletion:v4];
}

void __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315650;
      v17 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke_2";
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Instance info on %@ is %@.", buf, 0x20u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 16);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_14;
    v13[3] = &unk_2645543B0;
    v13[4] = v6;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 40);
    id v14 = v8;
    uint64_t v15 = v9;
    [v7 performBlock:v13];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v17 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s Instance info on %@ is unavailable. Disconnect now.", buf, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

uint64_t __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_14(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2_15;
  v4[3] = &unk_264554388;
  v4[4] = a1[6];
  return [v2 getVirtualDeviceForInstanceInfo:v1 completion:v4];
}

void __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2_15(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v10 = 136315650;
      uint64_t v11 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke_2";
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Virtual device for %@ is %@.", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v6 = [v3 clientServiceServer];
    [v6 addConnection:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v10 = 136315394;
      uint64_t v11 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s Virtual device for %@ is unavailable. Disconnect now.", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_clientServiceListener == v6)
  {
    BOOL v9 = [(SVXDaemon *)self handleClientServiceXPCConnection:v7];
  }
  else
  {
    id v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      __int16 v12 = "-[SVXDaemon listener:shouldAcceptNewConnection:]";
      _os_log_error_impl(&dword_220062000, v8, OS_LOG_TYPE_ERROR, "%s Ignored because the XPC listener is unexpected.", (uint8_t *)&v11, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)stop
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v4 = (void *)MEMORY[0x263F08AB0];
    uint64_t v5 = v3;
    uint64_t v6 = [v4 processInfo];
    id v7 = [v6 processName];
    id v8 = [MEMORY[0x263F08AB0] processInfo];
    int v9 = [v8 processIdentifier];
    int v10 = AFBuildVersion();
    *(_DWORD *)buf = 136315906;
    __int16 v14 = "-[SVXDaemon stop]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v10;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Stopping SiriVOX service in %@ (pid=%d) on %@...", buf, 0x26u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __17__SVXDaemon_stop__block_invoke;
  v12[3] = &unk_2645548A0;
  v12[4] = self;
  [(SVXQueuePerformer *)mainQueuePerformer performBlock:v12 withOptions:2];
}

void __17__SVXDaemon_stop__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 48) isRunning])
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setIsRunning:0];
    [*(id *)(*(void *)(a1 + 32) + 56) stop];
    [*(id *)(*(void *)(a1 + 32) + 24) suspend];
    v2 = [*(id *)(*(void *)(a1 + 32) + 40) hostVirtualDevice];
    [v2 stop];

    [*(id *)(*(void *)(a1 + 32) + 32) setPlatformDependencies:0];
  }
  id v3 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v4 = (void *)MEMORY[0x263F08AB0];
    uint64_t v5 = v3;
    uint64_t v6 = [v4 processInfo];
    id v7 = [v6 processName];
    id v8 = [MEMORY[0x263F08AB0] processInfo];
    int v9 = [v8 processIdentifier];
    int v10 = AFBuildVersion();
    int v11 = 136315906;
    __int16 v12 = "-[SVXDaemon stop]_block_invoke";
    __int16 v13 = 2112;
    __int16 v14 = v7;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2112;
    int v18 = v10;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s Stopped SiriVOX service in %@ (pid=%d) on %@.", (uint8_t *)&v11, 0x26u);
  }
}

- (void)startWithPlatformDependencies:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (void *)MEMORY[0x263F08AB0];
    id v7 = v5;
    id v8 = [v6 processInfo];
    int v9 = [v8 processName];
    int v10 = [MEMORY[0x263F08AB0] processInfo];
    int v11 = [v10 processIdentifier];
    __int16 v12 = AFBuildVersion();
    *(_DWORD *)buf = 136315906;
    int v18 = "-[SVXDaemon startWithPlatformDependencies:]";
    __int16 v19 = 2112;
    __int16 v20 = v9;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Starting SiriVOX service in %@ (pid=%d) on %@...", buf, 0x26u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __43__SVXDaemon_startWithPlatformDependencies___block_invoke;
  v15[3] = &unk_2645548C8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [(SVXQueuePerformer *)mainQueuePerformer performBlock:v15 withOptions:2];
}

void __43__SVXDaemon_startWithPlatformDependencies___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (([*(id *)(*(void *)(a1 + 32) + 48) isRunning] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) setIsRunning:1];
    v2 = (void *)[*(id *)(a1 + 40) copy];
    [*(id *)(*(void *)(a1 + 32) + 32) setPlatformDependencies:v2];

    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) hostVirtualDevice];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 32) platformDependencies];
    [v3 startWithPlatformDependencies:v4];

    [*(id *)(*(void *)(a1 + 32) + 24) resume];
    [*(id *)(*(void *)(a1 + 32) + 56) start];
  }
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (void *)MEMORY[0x263F08AB0];
    id v7 = v5;
    id v8 = [v6 processInfo];
    int v9 = [v8 processName];
    int v10 = [MEMORY[0x263F08AB0] processInfo];
    int v11 = [v10 processIdentifier];
    __int16 v12 = AFBuildVersion();
    int v13 = 136315906;
    id v14 = "-[SVXDaemon startWithPlatformDependencies:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 1024;
    int v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Started SiriVOX service in %@ (pid=%d) on %@.", (uint8_t *)&v13, 0x26u);
  }
}

- (SVXDaemon)initWithClientServiceQueuePerformer:(id)a3 mainQueuePerformer:(id)a4 clientServiceListener:(id)a5 platformDependenciesTracker:(id)a6 virtualDeviceManager:(id)a7 runningObserver:(id)a8 siriActivationListenerDelegate:(id)a9 remoraVirtualDeviceManager:(id)a10 homeHubManagerObserver:(id)a11 rebootExecutor:(id)a12 connectionFactory:(id)a13
{
  id v39 = a3;
  id v38 = a4;
  id v29 = a5;
  id v37 = a5;
  id v30 = a6;
  id v36 = a6;
  id v31 = a7;
  id v35 = a7;
  id v32 = a8;
  id v34 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  v40.receiver = self;
  v40.super_class = (Class)SVXDaemon;
  __int16 v23 = [(SVXDaemon *)&v40 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_clientServiceQueuePerformer, a3);
    objc_storeStrong((id *)&v24->_mainQueuePerformer, a4);
    objc_storeStrong((id *)&v24->_clientServiceListener, v29);
    [(NSXPCListener *)v24->_clientServiceListener setDelegate:v24];
    clientServiceListener = v24->_clientServiceListener;
    uint64_t v26 = [(SVXQueuePerformer *)v24->_clientServiceQueuePerformer queue];
    [(NSXPCListener *)clientServiceListener _setQueue:v26];

    objc_storeStrong((id *)&v24->_platformDependenciesTracker, v30);
    objc_storeStrong((id *)&v24->_virtualDeviceManager, v31);
    objc_storeStrong((id *)&v24->_runningObserver, v32);
    objc_storeStrong((id *)&v24->_siriActivationListenerDelegate, a9);
    objc_storeStrong((id *)&v24->_remoraVirtualDeviceManager, a10);
    objc_storeStrong((id *)&v24->_homeHubManagerObserver, a11);
    objc_storeStrong((id *)&v24->_rebootExecutor, a12);
    objc_storeStrong((id *)&v24->_connectionFactory, a13);
  }

  return v24;
}

- (SVXDaemon)init
{
  int v13 = [[SVXQueuePerformer alloc] initWithIdentifier:@"com.apple.SiriVOXService.client-service" qosClass:33 relativePriority:0 options:2];
  __int16 v15 = +[SVXQueuePerformer sharedMainQueuePerformer];
  id v14 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.SiriVOXService.client"];
  id v3 = objc_alloc_init(SVXPlatformDependenciesTracker);
  id v4 = objc_alloc_init(SVXDaemonRunningObserver);
  uint64_t v5 = [[SVXRemoraVirtualDeviceManager alloc] initWithRunningObserver:v4];
  uint64_t v6 = [[SVXVirtualDeviceManager alloc] initWithRemoraVirtualDeviceManager:v5];
  id v7 = [[SVXSiriActivationListenerDelegate alloc] initWithVirtualDeviceManager:v6];
  id v8 = [[SVXHomeHubManagerObserver alloc] initWithRemoraVirtualDeviceManager:v5 platformDependenciesTracker:v3];
  int v9 = objc_alloc_init(SVXRebootExecutor);
  int v10 = objc_alloc_init(SVXClientServiceServerConnectionFactory);
  __int16 v12 = [(SVXDaemon *)self initWithClientServiceQueuePerformer:v13 mainQueuePerformer:v15 clientServiceListener:v14 platformDependenciesTracker:v3 virtualDeviceManager:v6 runningObserver:v4 siriActivationListenerDelegate:v7 remoraVirtualDeviceManager:v5 homeHubManagerObserver:v8 rebootExecutor:v9 connectionFactory:v10];

  return v12;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x270F0EE10]();
  }
}

@end