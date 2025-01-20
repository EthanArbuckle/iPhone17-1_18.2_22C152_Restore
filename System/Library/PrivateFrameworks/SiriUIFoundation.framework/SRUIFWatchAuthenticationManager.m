@interface SRUIFWatchAuthenticationManager
- (AFWatchdogTimer)authenticationWatchdogTimer;
- (NSUUID)currentSessionID;
- (SFAuthenticationManager)authenticationManager;
- (SRUIFWatchAuthenticationManager)init;
- (SRUIFWatchAuthenticationManager)initWithQueue:(id)a3 manager:(id)a4;
- (id)authenticationCompletion;
- (void)_requestWatchAuthentication:(id)a3;
- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4;
- (void)requestWatchAuthentication:(id)a3;
- (void)setAuthenticationCompletion:(id)a3;
- (void)setAuthenticationManager:(id)a3;
- (void)setAuthenticationWatchdogTimer:(id)a3;
- (void)setCurrentSessionID:(id)a3;
@end

@implementation SRUIFWatchAuthenticationManager

- (SRUIFWatchAuthenticationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SRUIFWatchAuthenticationManager;
  v2 = [(SRUIFWatchAuthenticationManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.siri.SRUIFWatchAuthenticationManager", v3);
    watchAuthenticationQueue = v2->_watchAuthenticationQueue;
    v2->_watchAuthenticationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F6C1D0]) initWithQueue:v2->_watchAuthenticationQueue];
    authenticationManager = v2->_authenticationManager;
    v2->_authenticationManager = (SFAuthenticationManager *)v6;

    v8 = [(SRUIFWatchAuthenticationManager *)v2 authenticationManager];
    [v8 setDelegate:v2];
  }
  return v2;
}

- (SRUIFWatchAuthenticationManager)initWithQueue:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SRUIFWatchAuthenticationManager;
  v9 = [(SRUIFWatchAuthenticationManager *)&v13 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_watchAuthenticationQueue, a3);
    objc_storeStrong((id *)&v10->_authenticationManager, a4);
    v11 = [(SRUIFWatchAuthenticationManager *)v10 authenticationManager];
    [v11 setDelegate:v10];
  }
  return v10;
}

- (void)requestWatchAuthentication:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    watchAuthenticationQueue = self->_watchAuthenticationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SRUIFWatchAuthenticationManager_requestWatchAuthentication___block_invoke;
    block[3] = &unk_264785B40;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(watchAuthenticationQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFWatchAuthenticationManager requestWatchAuthentication:](v6);
    }
  }
}

void __62__SRUIFWatchAuthenticationManager_requestWatchAuthentication___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _requestWatchAuthentication:*(void *)(a1 + 32)];
}

- (void)_requestWatchAuthentication:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SRUIFWatchAuthenticationManager *)self currentSessionID];
  if (v5)
  {
    uint64_t v6 = [(SRUIFWatchAuthenticationManager *)self authenticationWatchdogTimer];
    int v7 = [v6 cancelIfNotAlreadyCanceled];

    if (v7)
    {
      id v8 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v8;
        objc_super v10 = [(SRUIFWatchAuthenticationManager *)self currentSessionID];
        *(_DWORD *)buf = 136315394;
        v38 = "-[SRUIFWatchAuthenticationManager _requestWatchAuthentication:]";
        __int16 v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s Watch authentication request already in progress. Cancelling session: %@", buf, 0x16u);
      }
      v11 = [(SRUIFWatchAuthenticationManager *)self authenticationManager];
      v12 = [(SRUIFWatchAuthenticationManager *)self currentSessionID];
      [v11 cancelAuthenticationSessionWithID:v12];
    }
  }
  [(SRUIFWatchAuthenticationManager *)self setAuthenticationCompletion:v4];
  objc_super v13 = [(SRUIFWatchAuthenticationManager *)self authenticationManager];
  uint64_t v14 = [v13 isSupportedForType:1];

  v15 = [(SRUIFWatchAuthenticationManager *)self authenticationManager];
  uint64_t v16 = [v15 isEnabledForType:1];

  if ((v14 & v16) == 1)
  {
    v17 = [(SRUIFWatchAuthenticationManager *)self authenticationManager];
    v18 = [v17 authenticateForType:1];

    objc_initWeak(&location, self);
    id v19 = objc_alloc(MEMORY[0x263F286E8]);
    watchAuthenticationQueue = self->_watchAuthenticationQueue;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke;
    v33[3] = &unk_264785A48;
    objc_copyWeak(&v35, &location);
    id v21 = v18;
    id v34 = v21;
    v22 = (AFWatchdogTimer *)[v19 initWithTimeoutInterval:watchAuthenticationQueue onQueue:v33 timeoutHandler:5.0];
    authenticationWatchdogTimer = self->_authenticationWatchdogTimer;
    self->_authenticationWatchdogTimer = v22;

    [(SRUIFWatchAuthenticationManager *)self setCurrentSessionID:v21];
    v24 = [(SRUIFWatchAuthenticationManager *)self authenticationWatchdogTimer];
    [v24 start];

    v25 = (id)*MEMORY[0x263F28348];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(SRUIFWatchAuthenticationManager *)self currentSessionID];
      *(_DWORD *)buf = 136315394;
      v38 = "-[SRUIFWatchAuthenticationManager _requestWatchAuthentication:]";
      __int16 v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_225FBA000, v25, OS_LOG_TYPE_DEFAULT, "%s Attempting watch authentication with sessionID: %@", buf, 0x16u);
    }
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  else
  {
    v27 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v28 = NSNumber;
      v29 = v27;
      v30 = [v28 numberWithBool:v14];
      v31 = [NSNumber numberWithBool:v16];
      *(_DWORD *)buf = 136315650;
      v38 = "-[SRUIFWatchAuthenticationManager _requestWatchAuthentication:]";
      __int16 v39 = 2112;
      v40 = v30;
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_225FBA000, v29, OS_LOG_TYPE_DEFAULT, "%s Not attempting watch authentication, supported: %@, enabled: %@", buf, 0x20u);
    }
    v32 = [(SRUIFWatchAuthenticationManager *)self authenticationCompletion];
    v32[2](v32, 0);

    [(SRUIFWatchAuthenticationManager *)self setAuthenticationCompletion:0];
  }
}

void __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (os_log_t *)MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_2();
    }
    id v4 = [WeakRetained authenticationManager];
    [v4 cancelAuthenticationSessionWithID:*(void *)(a1 + 32)];

    v5 = [WeakRetained currentSessionID];
    int v6 = [v5 isEqual:*(void *)(a1 + 32)];

    if (v6)
    {
      int v7 = [WeakRetained authenticationCompletion];
      v7[2](v7, 0);

      [WeakRetained setAuthenticationCompletion:0];
      [WeakRetained setCurrentSessionID:0];
    }
    else if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_1();
    }
  }
}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SRUIFWatchAuthenticationManager manager:didStartAuthenticationForSessionWithID:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s Starting new watch authentication request with sessionID: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(SRUIFWatchAuthenticationManager *)self currentSessionID];
  int v7 = [v6 isEqual:v5];

  __int16 v8 = *MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      objc_super v13 = "-[SRUIFWatchAuthenticationManager manager:didCompleteAuthenticationForSessionWithID:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s Completed watch authentication request with sessionID: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v10 = [(SRUIFWatchAuthenticationManager *)self authenticationCompletion];
    v10[2](v10, 1);

    v11 = [(SRUIFWatchAuthenticationManager *)self authenticationWatchdogTimer];
    [v11 cancel];

    [(SRUIFWatchAuthenticationManager *)self setAuthenticationCompletion:0];
    [(SRUIFWatchAuthenticationManager *)self setCurrentSessionID:0];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SRUIFWatchAuthenticationManager manager:didCompleteAuthenticationForSessionWithID:]();
  }
}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SRUIFWatchAuthenticationManager *)self currentSessionID];
  int v10 = [v9 isEqual:v7];

  v11 = *MEMORY[0x263F28348];
  int v12 = *MEMORY[0x263F28348];
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = "-[SRUIFWatchAuthenticationManager manager:didFailAuthenticationForSessionWithID:error:]";
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_225FBA000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed authentication request with sessionID: %@, error: %@", (uint8_t *)&v15, 0x20u);
    }
    objc_super v13 = [(SRUIFWatchAuthenticationManager *)self authenticationCompletion];
    v13[2](v13, 0);

    __int16 v14 = [(SRUIFWatchAuthenticationManager *)self authenticationWatchdogTimer];
    [v14 cancel];

    [(SRUIFWatchAuthenticationManager *)self setAuthenticationCompletion:0];
    [(SRUIFWatchAuthenticationManager *)self setCurrentSessionID:0];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[SRUIFWatchAuthenticationManager manager:didFailAuthenticationForSessionWithID:error:]();
  }
}

- (id)authenticationCompletion
{
  return self->_authenticationCompletion;
}

- (void)setAuthenticationCompletion:(id)a3
{
}

- (NSUUID)currentSessionID
{
  return self->_currentSessionID;
}

- (void)setCurrentSessionID:(id)a3
{
}

- (AFWatchdogTimer)authenticationWatchdogTimer
{
  return self->_authenticationWatchdogTimer;
}

- (void)setAuthenticationWatchdogTimer:(id)a3
{
}

- (SFAuthenticationManager)authenticationManager
{
  return self->_authenticationManager;
}

- (void)setAuthenticationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationManager, 0);
  objc_storeStrong((id *)&self->_authenticationWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_currentSessionID, 0);
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong((id *)&self->_watchAuthenticationQueue, 0);
}

- (void)requestWatchAuthentication:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SRUIFWatchAuthenticationManager requestWatchAuthentication:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s No completion handler provided.", (uint8_t *)&v1, 0xCu);
}

void __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_225FBA000, v0, v1, "%s Ignoring unexpected watch authentication timeout for unknown sessionID: %@", v2, v3, v4, v5, 2u);
}

void __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_225FBA000, v0, v1, "%s Watch authentication request timed out for sessionID: %@", v2, v3, v4, v5, 2u);
}

- (void)manager:didCompleteAuthenticationForSessionWithID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225FBA000, v0, v1, "%s Ignoring unexpected watch authentication session completion for unknown sessionID: %@", v2, v3, v4, v5, 2u);
}

- (void)manager:didFailAuthenticationForSessionWithID:error:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_225FBA000, v2, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected watch authentication session failure for unknown sessionID: %@ error: %@", (uint8_t *)v3, 0x20u);
}

@end