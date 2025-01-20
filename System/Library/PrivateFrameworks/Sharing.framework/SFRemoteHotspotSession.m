@interface SFRemoteHotspotSession
- (BOOL)browsing;
- (SFRemoteHotspotProtocol)connectionProxy;
- (SFRemoteHotspotSession)init;
- (SFRemoteHotspotSessionDelegate)delegate;
- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4;
- (void)enableRemoteHotspotForDevice:(id)a3 withCompletionHandler:(id)a4;
- (void)setBrowsing:(BOOL)a3;
- (void)setConnectionProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startBrowsing;
- (void)stopBrowsing;
- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)updatedFoundDeviceList:(id)a3;
- (void)xpcManagerConnectionInterrupted;
@end

@implementation SFRemoteHotspotSession

- (SFRemoteHotspotSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFRemoteHotspotSession;
  v2 = [(SFRemoteHotspotSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_browsing = 0;
    connectionProxy = v2->_connectionProxy;
    v2->_connectionProxy = 0;

    v5 = +[SFCompanionXPCManager sharedManager];
    [v5 registerObserver:v3];
  }
  return v3;
}

- (void)startBrowsing
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Starting browsing", buf, 2u);
  }

  if (![(SFRemoteHotspotSession *)v2 browsing])
  {
    [(SFRemoteHotspotSession *)v2 setBrowsing:1];
    v4 = +[SFCompanionXPCManager sharedManager];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__SFRemoteHotspotSession_startBrowsing__block_invoke;
    v5[3] = &unk_1E5BBDB70;
    v5[4] = v2;
    [v4 remoteHotspotSessionForClient:v2 withCompletionHandler:v5];
  }
  objc_sync_exit(v2);
}

void __39__SFRemoteHotspotSession_startBrowsing__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) browsing])
  {
    if (v5)
    {
      objc_super v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteHotspotSession/startBrowsing", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v7, &state);
      [*(id *)(a1 + 32) setConnectionProxy:v5];
      v8 = [*(id *)(a1 + 32) connectionProxy];
      [v8 startBrowsing];

      v9 = tethering_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "Started browsing", v13, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      v11 = tethering_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_2(v6, v11);
      }

      v12 = tethering_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_1((uint64_t)v6, v12);
      }

      [*(id *)(a1 + 32) setBrowsing:0];
    }
  }
  else
  {
    v10 = tethering_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Browsing stopped while getting proxy", (uint8_t *)&state, 2u);
    }
  }
}

- (void)stopBrowsing
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = tethering_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.opaque[0]) = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Stopping browsing", (uint8_t *)&buf, 2u);
  }

  if ([(SFRemoteHotspotSession *)v2 browsing])
  {
    v4 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteHotspotSession/stopBrowsing", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    buf.opaque[0] = 0;
    buf.opaque[1] = 0;
    os_activity_scope_enter(v4, &buf);
    [(SFRemoteHotspotSession *)v2 setBrowsing:0];
    id v5 = [(SFRemoteHotspotSession *)v2 connectionProxy];
    [v5 stopBrowsing];

    id v6 = tethering_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "Stopped browsing", v7, 2u);
    }

    os_activity_scope_leave(&buf);
  }
  objc_sync_exit(v2);
}

- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SFRemoteHotspotSession *)self connectionProxy];

  if (v8)
  {
    v9 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteHotspotSession/enableHotspotForDevice", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v9, &state);
    v10 = [(SFRemoteHotspotSession *)self connectionProxy];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__SFRemoteHotspotSession_enableHotspotForDevice_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E5BBDB98;
    id v12 = v7;
    [v10 enableHotspotForDevice:v6 withCompletionHandler:v11];

    os_activity_scope_leave(&state);
  }
}

void __71__SFRemoteHotspotSession_enableHotspotForDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 name];
  id v7 = [v6 password];

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

- (void)enableRemoteHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  v9 = tethering_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.opaque[0]) = 138412290;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "Enabling %@", (uint8_t *)&buf, 0xCu);
  }

  v10 = [(SFRemoteHotspotSession *)v8 connectionProxy];

  if (v10)
  {
    v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteHotspotSession/enableHotspotForDevice", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    buf.opaque[0] = 0;
    buf.opaque[1] = 0;
    os_activity_scope_enter(v11, &buf);
    id v12 = [(SFRemoteHotspotSession *)v8 connectionProxy];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__SFRemoteHotspotSession_enableRemoteHotspotForDevice_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E5BBDBC0;
    id v16 = v6;
    id v17 = v7;
    [v12 enableHotspotForDevice:v16 withCompletionHandler:v15];

    os_activity_scope_leave(&buf);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19 = @"XPC connection unavailable";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v14 = [v13 errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
  objc_sync_exit(v8);
}

void __77__SFRemoteHotspotSession_enableRemoteHotspotForDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = tethering_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Enabled %@, %@, error (%@)", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[SFCompanionXPCManager sharedManager];
  [v9 updateLowLatencyFilter:v8 isAddFilter:v5 completion:v7];
}

- (void)updatedFoundDeviceList:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = tethering_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Updated device list %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained session:self updatedFoundDevices:v4];
}

- (void)xpcManagerConnectionInterrupted
{
  v2 = tethering_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "XPC Connection was interrupted", v3, 2u);
  }
}

- (SFRemoteHotspotSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFRemoteHotspotSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)browsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (SFRemoteHotspotProtocol)connectionProxy
{
  return (SFRemoteHotspotProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxy, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "remoteHotspotSessionForClient: %@", (uint8_t *)&v2, 0xCu);
}

void __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_fault_impl(&dword_1A5389000, a2, OS_LOG_TYPE_FAULT, "Couldn't retrieve proxy %@", (uint8_t *)&v4, 0xCu);
}

@end