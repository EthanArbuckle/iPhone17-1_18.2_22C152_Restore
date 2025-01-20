@interface RMSSessionProxy
- (BOOL)sessionMatchesNotification:(id)a3;
- (RMSSessionProxy)init;
- (RMSSessionProxy)initWithTimeout:(double)a3;
- (int)heartbeatTime;
- (int)sessionIdentifier;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_sendHeartbeat:(id)a3;
- (void)beginHeartbeat;
- (void)dealloc;
- (void)endHeartbeat;
- (void)setSessionIdentifier:(int)a3;
@end

@implementation RMSSessionProxy

- (RMSSessionProxy)init
{
  return [(RMSSessionProxy *)self initWithTimeout:60.0];
}

- (RMSSessionProxy)initWithTimeout:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMSSessionProxy;
  v4 = [(RMSSessionProxy *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_sessionTimeout = a3;
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v5 selector:sel__applicationWillResignActiveNotification_ name:*MEMORY[0x263F1D0D8] object:0];
    [v6 addObserver:v5 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(RMSSessionProxy *)self endHeartbeat];
  v4.receiver = self;
  v4.super_class = (Class)RMSSessionProxy;
  [(RMSSessionProxy *)&v4 dealloc];
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_heartbeatTimer)
  {
    objc_super v4 = RMSLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      int v7 = 138412290;
      objc_super v8 = v6;
      _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "[%@] Application suspended, pausing heartbeat", (uint8_t *)&v7, 0xCu);
    }
    [(RMSSessionProxy *)self endHeartbeat];
    self->_isPaused = 1;
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_isPaused)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v6 = v5 - self->_lastHeartbeatTime;
    int v7 = RMSLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v18 = 138412546;
      double v19 = *(double *)&v9;
      __int16 v20 = 2048;
      double v21 = v6;
      _os_log_impl(&dword_23C83A000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Application foregrounded, time since last heartbeat: %f", (uint8_t *)&v18, 0x16u);
    }
    v10 = RMSLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double sessionTimeout = self->_sessionTimeout;
      int v18 = 134217984;
      double v19 = sessionTimeout;
      _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "Session timeout: %f", (uint8_t *)&v18, 0xCu);
    }

    double v12 = self->_sessionTimeout;
    v13 = RMSLogger();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v6 >= v12)
    {
      if (v14)
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_23C83A000, v13, OS_LOG_TYPE_DEFAULT, "Backgrounded for too long, session is over", (uint8_t *)&v18, 2u);
      }

      [(RMSSessionProxy *)self heartbeatDidFail];
      [(RMSSessionProxy *)self endHeartbeat];
      self->_sessionIdentifier = 0;
    }
    else
    {
      if (v14)
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_23C83A000, v13, OS_LOG_TYPE_DEFAULT, "Resuming session", (uint8_t *)&v18, 2u);
      }

      [(RMSSessionProxy *)self beginHeartbeat];
      int v15 = [(RMSSessionProxy *)self heartbeatTime];
      if (v15 >= 0) {
        int v16 = v15;
      }
      else {
        int v16 = v15 + 1;
      }
      if (v6 > (double)(v16 >> 1))
      {
        v17 = RMSLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_23C83A000, v17, OS_LOG_TYPE_DEFAULT, "Sending immediate heartbeat", (uint8_t *)&v18, 2u);
        }

        [(NSTimer *)self->_heartbeatTimer fire];
      }
    }
  }
}

- (void)beginHeartbeat
{
  if (!self->_heartbeatTimer)
  {
    self->_isPaused = 0;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_lastHeartbeatTime = v3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__RMSSessionProxy_beginHeartbeat__block_invoke;
    block[3] = &unk_264E740A8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __33__RMSSessionProxy_beginHeartbeat__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = objc_msgSend(MEMORY[0x263EFFA20], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), sel__sendHeartbeat_, 0, 1, (double)(int)objc_msgSend(*(id *)(a1 + 32), "heartbeatTime"));
  return MEMORY[0x270F9A758]();
}

- (void)endHeartbeat
{
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    [(NSTimer *)heartbeatTimer invalidate];
    id v4 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;
  }
  self->_isPaused = 0;
}

- (int)heartbeatTime
{
  return 30;
}

- (BOOL)sessionMatchesNotification:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientSessionIdentifierNotificationKey"];
  int v6 = [v5 intValue];

  LOBYTE(self) = self->_sessionIdentifier == v6;
  return (char)self;
}

- (void)_sendHeartbeat:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RMSSessionProxy *)self sessionIdentifier];
  objc_initWeak(&location, self);
  int v6 = RMSLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    BOOL v14 = v8;
    _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "Sending heartbeat for session: %@", buf, 0xCu);
  }
  uint64_t v9 = +[RMSIDSClient sharedClient];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__RMSSessionProxy__sendHeartbeat___block_invoke;
  v10[3] = &unk_264E740F0;
  objc_copyWeak(&v11, &location);
  [v9 sendHeartbeatWithSessionIdentifier:v5 completionHandler:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __34__RMSSessionProxy__sendHeartbeat___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && WeakRetained[1] && !*((unsigned char *)WeakRetained + 32))
  {
    if (a2 == 1)
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      v4[3] = v5;
      int v6 = RMSLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = (objc_class *)objc_opt_class();
        objc_super v8 = NSStringFromClass(v7);
        int v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_23C83A000, v6, OS_LOG_TYPE_DEFAULT, "Hearbeat success response for session: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = RMSLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Heartbeat failure response for session: %@", (uint8_t *)&v12, 0xCu);
      }
      [v4 endHeartbeat];
      [v4 heartbeatDidFail];
    }
  }
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(int)a3
{
  self->_sessionIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end