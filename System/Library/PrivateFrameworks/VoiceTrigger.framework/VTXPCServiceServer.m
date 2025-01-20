@interface VTXPCServiceServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (VTXPCServiceServer)init;
- (void)startService;
@end

@implementation VTXPCServiceServer

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[VTXPCServiceServer listener:shouldAcceptNewConnection:]";
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: %{public}s connection: %{public}@", buf, 0x16u);
  }
  v8 = [v6 valueForEntitlement:@"com.apple.voicetrigger.voicetriggerservice"];

  if (v8)
  {
    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9AF010];
    [v6 setRemoteObjectInterface:v9];

    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9B1EB8];
    [v6 setExportedInterface:v10];

    v11 = objc_alloc_init(VTXPCConnection);
    [v6 setExportedObject:v11];
    objc_initWeak((id *)buf, v11);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke;
    v21[3] = &unk_264325CD0;
    objc_copyWeak(&v22, (id *)buf);
    [v6 setInterruptionHandler:v21];
    objc_initWeak(&location, v6);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v17 = &unk_264325338;
    objc_copyWeak(&v18, (id *)buf);
    objc_copyWeak(&v19, &location);
    [v6 setInvalidationHandler:&v14];
    objc_msgSend(v6, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "-[VTXPCServiceServer listener:shouldAcceptNewConnection:]";
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "::: %{public}s Deny connection %{public}@: lack of entitlement.", buf, 0x16u);
    }
  }

  return v8 != 0;
}

void __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleDisconnect];
}

void __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleDisconnect];

  id v4 = +[VTTriggerEventMonitorManager sharedManager];
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 removeConnection:v3];
}

- (void)startService
{
  id v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.voicetrigger.voicetriggerservice"];
  listener = self->_listener;
  self->_listener = v3;

  [(NSXPCListener *)self->_listener setDelegate:self];
  id v5 = self->_listener;

  [(NSXPCListener *)v5 resume];
}

- (VTXPCServiceServer)init
{
  v3.receiver = self;
  v3.super_class = (Class)VTXPCServiceServer;
  return [(VTXPCServiceServer *)&v3 init];
}

@end