@interface TVRCSiriRemoteFindingManager
- (BOOL)shouldLoadCachedRemoteInfo;
- (NSTimer)heartbeatTimer;
- (TVRCRPCompanionLinkClientWrapper)wrapper;
- (TVRCSiriRemoteConnectionManager)connectionManager;
- (TVRCSiriRemoteFindingManager)initWithCompanionLinkClientWrapper:(id)a3;
- (TVRCSiriRemoteInfo)pairedRemoteInfo;
- (id)_cachedRemoteInfoForRPDevice:(id)a3;
- (void)_fetchPairedRemoteInfoAndStartMonitoring;
- (void)_saveRemoteInfoToUserDefaultsIfNeeded;
- (void)_startHeartbeatTimer;
- (void)_startMonitoringPairedRemoteInfo;
- (void)_stopHeartbeatTimer;
- (void)_updatePairedRemoteInfo:(id)a3;
- (void)dealloc;
- (void)enableFindingSession:(BOOL)a3;
- (void)setConnectionManager:(id)a3;
- (void)setHeartbeatTimer:(id)a3;
- (void)setPairedRemoteInfo:(id)a3;
- (void)setShouldLoadCachedRemoteInfo:(BOOL)a3;
- (void)setWrapper:(id)a3;
@end

@implementation TVRCSiriRemoteFindingManager

- (TVRCSiriRemoteFindingManager)initWithCompanionLinkClientWrapper:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVRCSiriRemoteFindingManager;
  v5 = [(TVRCSiriRemoteFindingManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_wrapper, v4);
    [(TVRCSiriRemoteFindingManager *)v6 _fetchPairedRemoteInfoAndStartMonitoring];
  }

  return v6;
}

- (void)enableFindingSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  v5 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];
    int v7 = [v6 connected];

    if (v7)
    {
      objc_super v8 = _TVRCRapportLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = @"stop";
        if (v3) {
          v9 = @"start";
        }
        *(_DWORD *)buf = 138412290;
        v34 = v9;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Remote is connected. Informing TV to %@ finding session", buf, 0xCu);
      }

      v10 = @"NO";
      if (v3) {
        v10 = @"YES";
      }
      v11 = v10;
      v12 = [(TVRCSiriRemoteFindingManager *)self wrapper];
      v31 = @"FindingModeEnabledKey";
      v32 = v11;
      v13 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke;
      v27[3] = &unk_2647AF4F8;
      BOOL v29 = v3;
      objc_copyWeak(&v28, &location);
      [v12 sendEvent:@"ToggleFindingMode" options:v13 response:v27];

      objc_destroyWeak(&v28);
    }
    else
    {
      v15 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];
      int v16 = [v15 connected];

      if ((v16 & 1) == 0)
      {
        v17 = _TVRCRapportLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2266D3000, v17, OS_LOG_TYPE_DEFAULT, "Remote is disconnected. Using BLE Connection Manager", buf, 2u);
        }

        v18 = +[TVRCSiriRemoteConnectionManager sharedInstance];
        connectionManager = self->_connectionManager;
        self->_connectionManager = v18;

        uint64_t v22 = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        v24 = __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_18;
        v25 = &unk_2647AEA48;
        objc_copyWeak(&v26, &location);
        [(TVRCSiriRemoteConnectionManager *)self->_connectionManager setFindingSessionStateChangedHandler:&v22];
        v20 = self->_connectionManager;
        v21 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];
        [(TVRCSiriRemoteConnectionManager *)v20 enableFastFindMy:v3 forRemoteWithInfo:v21];

        objc_destroyWeak(&v26);
      }
    }
    if (v3) {
      [(TVRCSiriRemoteFindingManager *)self _startHeartbeatTimer];
    }
    else {
      [(TVRCSiriRemoteFindingManager *)self _stopHeartbeatTimer];
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = _TVRCRapportLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[TVRCSiriRemoteFindingManager enableFindingSession:](v14);
    }
  }
}

void __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = _TVRCRapportLog();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_cold_1(a1, (uint64_t)v5, v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = [WeakRetained wrapper];
    v10 = v9;
    uint64_t v11 = 3;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        v12 = @"started";
      }
      else {
        v12 = @"stopped";
      }
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Successfully %{public}@ finding session", (uint8_t *)&v13, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = [WeakRetained wrapper];
    v10 = v9;
    uint64_t v11 = 1;
  }
  [v9 _updateSiriRemoteFindingState:v11];
}

void __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_18(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained wrapper];
  [v3 _updateSiriRemoteFindingState:a2];
}

- (void)_startHeartbeatTimer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  heartbeatTimer = self->_heartbeatTimer;
  id v4 = _TVRCRapportLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (heartbeatTimer)
  {
    if (v5)
    {
      v6 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];
      int v7 = [v6 name];
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Skipping. Timer already exists for remote: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      objc_super v8 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];
      v9 = [v8 name];
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Starting heartbeat timer for remote: %{public}@", buf, 0xCu);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__TVRCSiriRemoteFindingManager__startHeartbeatTimer__block_invoke;
    v12[3] = &unk_2647AF520;
    v12[4] = self;
    v10 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:1 repeats:v12 block:540.0];
    uint64_t v11 = self->_heartbeatTimer;
    self->_heartbeatTimer = v10;
  }
}

uint64_t __52__TVRCSiriRemoteFindingManager__startHeartbeatTimer__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _TVRCRapportLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) pairedRemoteInfo];
    id v4 = [v3 name];
    int v6 = 138543362;
    int v7 = v4;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Heartbeat timer fired for remote: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 32) enableFindingSession:1];
}

- (void)_stopHeartbeatTimer
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];
    BOOL v5 = [v4 name];
    int v6 = [(TVRCSiriRemoteFindingManager *)self pairedRemoteInfo];
    int v7 = [v6 tvName];
    int v9 = 138543618;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopping heartbeat timer for remote: %{public}@ tv: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(NSTimer *)self->_heartbeatTimer invalidate];
  heartbeatTimer = self->_heartbeatTimer;
  self->_heartbeatTimer = 0;
}

- (void)dealloc
{
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopped monitoring PairedRemoteInfo", buf, 2u);
  }

  id v4 = [(TVRCSiriRemoteFindingManager *)self connectionManager];
  [v4 teardown];

  BOOL v5 = [(TVRCSiriRemoteFindingManager *)self wrapper];
  [v5 deregisterEvent:@"PushSiriRemoteInfo"];

  int v6 = [(TVRCSiriRemoteFindingManager *)self heartbeatTimer];
  [v6 invalidate];

  heartbeatTimer = self->_heartbeatTimer;
  self->_heartbeatTimer = 0;

  v8.receiver = self;
  v8.super_class = (Class)TVRCSiriRemoteFindingManager;
  [(TVRCSiriRemoteFindingManager *)&v8 dealloc];
}

- (void)setPairedRemoteInfo:(id)a3
{
  BOOL v5 = (TVRCSiriRemoteInfo *)a3;
  if (self->_pairedRemoteInfo != v5)
  {
    int v6 = v5;
    [(TVRCSiriRemoteFindingManager *)self willChangeValueForKey:@"pairedRemoteInfo"];
    objc_storeStrong((id *)&self->_pairedRemoteInfo, a3);
    [(TVRCSiriRemoteFindingManager *)self didChangeValueForKey:@"pairedRemoteInfo"];
    BOOL v5 = v6;
  }
}

- (void)_fetchPairedRemoteInfoAndStartMonitoring
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v8 = "-[TVRCSiriRemoteFindingManager _fetchPairedRemoteInfoAndStartMonitoring]";
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v4 = [(TVRCSiriRemoteFindingManager *)self wrapper];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__TVRCSiriRemoteFindingManager__fetchPairedRemoteInfoAndStartMonitoring__block_invoke;
  v5[3] = &unk_2647AF548;
  objc_copyWeak(&v6, (id *)buf);
  [v4 sendEvent:@"FetchSiriRemoteInfo" options:MEMORY[0x263EFFA78] response:v5];

  [(TVRCSiriRemoteFindingManager *)self _startMonitoringPairedRemoteInfo];
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __72__TVRCSiriRemoteFindingManager__fetchPairedRemoteInfoAndStartMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updatePairedRemoteInfo:v5];
  }
}

- (void)_startMonitoringPairedRemoteInfo
{
  v10[1] = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Start monitoring PairedRemoteInfo", (uint8_t *)&buf, 2u);
  }

  uint64_t v9 = *MEMORY[0x263F62C38];
  v10[0] = MEMORY[0x263EFFA88];
  id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  objc_initWeak(&buf, self);
  id v5 = [(TVRCSiriRemoteFindingManager *)self wrapper];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__TVRCSiriRemoteFindingManager__startMonitoringPairedRemoteInfo__block_invoke;
  v6[3] = &unk_2647AF570;
  objc_copyWeak(&v7, &buf);
  [v5 registerEvent:@"PushSiriRemoteInfo" options:v4 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);
}

void __64__TVRCSiriRemoteFindingManager__startMonitoringPairedRemoteInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _TVRCRapportLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Received event response: %{public}@, options %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updatePairedRemoteInfo:v5];
  }
}

- (id)_cachedRemoteInfoForRPDevice:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = [v3 identifier];
  id v6 = [v4 dataForKey:v5];

  if (v6
    || ([v3 idsDeviceIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v4 dataForKey:v7],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    objc_super v8 = _TVRCRapportLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Found cached remote info", v10, 2u);
    }
  }
  else
  {
    objc_super v8 = _TVRCRapportLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TVRCSiriRemoteFindingManager _cachedRemoteInfoForRPDevice:](v8);
    }
    id v6 = 0;
  }

  return v6;
}

- (void)_updatePairedRemoteInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v18 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Remote info dict: %{public}@", buf, 0xCu);
  }

  id v6 = [v4 objectForKeyedSubscript:@"SiriRemoteInfoKey"];
  if (!v6)
  {
    id v11 = _TVRCRapportLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "No paired remote found", buf, 2u);
    }

    if ([(TVRCSiriRemoteFindingManager *)self shouldLoadCachedRemoteInfo])
    {
      __int16 v12 = [(TVRCSiriRemoteFindingManager *)self wrapper];
      id v13 = [v12 device];
      id v6 = [(TVRCSiriRemoteFindingManager *)self _cachedRemoteInfoForRPDevice:v13];

      if (v6) {
        goto LABEL_4;
      }
      uint64_t v14 = _TVRCRapportLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[TVRCSiriRemoteFindingManager _updatePairedRemoteInfo:](self, v14);
      }
    }
    id v6 = 0;
    id v7 = 0;
    goto LABEL_16;
  }
LABEL_4:
  id v16 = 0;
  id v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v16];
  id v8 = v16;
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TVRCSiriRemoteFindingManager _updatePairedRemoteInfo:]((uint64_t)v9, v10);
    }

    goto LABEL_19;
  }
LABEL_16:
  uint64_t v15 = _TVRCRapportLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v18 = v7;
    _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Updated connected remote info: %{public}@", buf, 0xCu);
  }

  [(TVRCSiriRemoteFindingManager *)self setPairedRemoteInfo:v7];
  [(TVRCSiriRemoteFindingManager *)self _saveRemoteInfoToUserDefaultsIfNeeded];
LABEL_19:
}

- (void)_saveRemoteInfoToUserDefaultsIfNeeded
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Failed to archive remoteInfo %{public}@", (uint8_t *)&v2, 0xCu);
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return self->_pairedRemoteInfo;
}

- (TVRCRPCompanionLinkClientWrapper)wrapper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrapper);

  return (TVRCRPCompanionLinkClientWrapper *)WeakRetained;
}

- (void)setWrapper:(id)a3
{
}

- (TVRCSiriRemoteConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
}

- (BOOL)shouldLoadCachedRemoteInfo
{
  return self->_shouldLoadCachedRemoteInfo;
}

- (void)setShouldLoadCachedRemoteInfo:(BOOL)a3
{
  self->_shouldLoadCachedRemoteInfo = a3;
}

- (NSTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_destroyWeak((id *)&self->_wrapper);

  objc_storeStrong((id *)&self->_pairedRemoteInfo, 0);
}

- (void)enableFindingSession:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2266D3000, log, OS_LOG_TYPE_FAULT, "Failed to find paired remote info", v1, 2u);
}

void __53__TVRCSiriRemoteFindingManager_enableFindingSession___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"started";
  if (!*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = @"stopped";
  }
  int v4 = 138543618;
  id v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "Failed to %{public}@ finding mode: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_cachedRemoteInfoForRPDevice:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "Cannot find cached remote info", v1, 2u);
}

- (void)_updatePairedRemoteInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 wrapper];
  int v4 = [v3 device];
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Could not find paired remote for device: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_updatePairedRemoteInfo:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end