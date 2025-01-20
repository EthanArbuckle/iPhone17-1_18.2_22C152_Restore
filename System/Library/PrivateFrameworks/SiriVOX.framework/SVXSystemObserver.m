@interface SVXSystemObserver
- (BOOL)_isSoundAutoConfigAvailable;
- (SVXSystemObserver)initWithModule:(id)a3;
- (void)_logSnapshot;
- (void)_startObservingDeviceContext;
- (void)_startObservingInfo;
- (void)_stopObservingDeviceContext;
- (void)addDeviceContextListener:(id)a3;
- (void)dealloc;
- (void)deviceContextConnection:(id)a3 didUpdateLocalDeviceContext:(id)a4;
- (void)deviceContextConnectionDidInvalidate:(id)a3;
- (void)getLocalDeviceContextWithCompletion:(id)a3;
- (void)removeDeviceContextListener:(id)a3;
- (void)sessionDidChangeFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4;
- (void)stopWithModuleInstanceProvider:(id)a3;
@end

@implementation SVXSystemObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceContextConnection, 0);
  objc_storeStrong((id *)&self->_deviceContextAnnouncer, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

- (void)deviceContextConnection:(id)a3 didUpdateLocalDeviceContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    v12 = v8;
    v13 = [v7 identifier];
    *(_DWORD *)buf = 136315650;
    v18 = "-[SVXSystemObserver deviceContextConnection:didUpdateLocalDeviceContext:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v13;
    _os_log_debug_impl(&dword_220062000, v12, OS_LOG_TYPE_DEBUG, "%s deviceContextConnection = %@, localDeviceContext = %@", buf, 0x20u);
  }
  v9 = [(SVXModule *)self->_module performer];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__SVXSystemObserver_deviceContextConnection_didUpdateLocalDeviceContext___block_invoke;
  v14[3] = &unk_2645547B0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performBlock:v14];
}

void __73__SVXSystemObserver_deviceContextConnection_didUpdateLocalDeviceContext___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  if (*(void *)(v2 + 24) == v1)
  {
    uint64_t v4 = a1[6];
    v5 = *(void **)(v2 + 16);
    [v5 localDeviceContextDidUpdate:v4];
  }
  else
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(v2 + 16);
      int v7 = 136315650;
      v8 = "-[SVXSystemObserver deviceContextConnection:didUpdateLocalDeviceContext:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v1;
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s Ignored because the device context connection is %@, not %@.", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)deviceContextConnectionDidInvalidate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SVXSystemObserver deviceContextConnectionDidInvalidate:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s deviceContextConnection = %@", buf, 0x16u);
  }
  uint64_t v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SVXSystemObserver_deviceContextConnectionDidInvalidate___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

void __58__SVXSystemObserver_deviceContextConnectionDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = *(void **)(v3 + 24);
  if (v4 == v2)
  {
    [v4 invalidate];
    id v7 = objc_alloc(MEMORY[0x263F284C8]);
    v8 = [*(id *)(*(void *)(a1 + 32) + 8) performer];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    uint64_t v10 = [v9 queue];
    __int16 v11 = [*(id *)(*(void *)(a1 + 32) + 8) instanceContext];
    uint64_t v12 = [v7 initWithQueue:v10 instanceContext:v11 delegate:*(void *)(a1 + 32)];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 24);
    *(void *)(v13 + 24) = v12;

    if ([*(id *)(*(void *)(a1 + 32) + 8) isActive])
    {
      id v15 = *(void **)(a1 + 32);
      [v15 _startObservingDeviceContext];
    }
  }
  else
  {
    v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(v3 + 16);
      int v16 = 136315650;
      v17 = "-[SVXSystemObserver deviceContextConnectionDidInvalidate:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      __int16 v21 = v2;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because the device context connection is %@, not %@.", (uint8_t *)&v16, 0x20u);
    }
  }
}

- (void)_stopObservingDeviceContext
{
}

- (void)_startObservingDeviceContext
{
}

- (BOOL)_isSoundAutoConfigAvailable
{
  return 0;
}

- (void)_logSnapshot
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v4 count])
  {
    uint64_t v3 = [(SVXModule *)self->_module analytics];
    [v3 logEventWithType:3101 context:v4 contextNoCopy:1];
  }
}

- (void)_startObservingInfo
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [(SVXSystemObserver *)self _stopObservingInfo];
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[SVXSystemObserver _startObservingInfo]";
    _os_log_error_impl(&dword_220062000, v2, OS_LOG_TYPE_ERROR, "%s SoundAutoConfig is not available on this platform.", (uint8_t *)&v3, 0xCu);
  }
}

- (void)sessionDidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (a4 == 2)
  {
    v8[7] = v4;
    v8[8] = v5;
    id v7 = [(SVXModule *)self->_module performer];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__SVXSystemObserver_sessionDidChangeFromState_toState___block_invoke;
    v8[3] = &unk_2645548A0;
    v8[4] = self;
    [v7 performBlock:v8];
  }
}

uint64_t __55__SVXSystemObserver_sessionDidChangeFromState_toState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logSnapshot];
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  id v4 = a3;
  [(SVXSystemObserver *)self _stopObservingInfo];
  [(SVXSystemObserver *)self _stopObservingDeviceContext];
  id v5 = [v4 sessionManager];

  [v5 removeActivityListener:self];
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v5 = a3;
  [(SVXSystemObserver *)self _startObservingInfo];
  [(SVXSystemObserver *)self _startObservingDeviceContext];
  id v6 = [v5 sessionManager];

  [v6 addActivityListener:self];
}

- (void)dealloc
{
  [(AFDeviceContextConnection *)self->_deviceContextConnection invalidate];
  deviceContextAnnouncer = self->_deviceContextAnnouncer;
  self->_deviceContextAnnouncer = 0;

  v4.receiver = self;
  v4.super_class = (Class)SVXSystemObserver;
  [(SVXSystemObserver *)&v4 dealloc];
}

- (SVXSystemObserver)initWithModule:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SVXSystemObserver;
  id v6 = [(SVXSystemObserver *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_module, a3);
    id v8 = objc_alloc(MEMORY[0x263F284C8]);
    id v9 = [v5 performer];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    __int16 v11 = [v10 queue];
    uint64_t v12 = [v5 instanceContext];
    uint64_t v13 = [v8 initWithQueue:v11 instanceContext:v12 delegate:v7];
    deviceContextConnection = v7->_deviceContextConnection;
    v7->_deviceContextConnection = (AFDeviceContextConnection *)v13;
  }
  return v7;
}

- (void)getLocalDeviceContextWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SVXModule *)self->_module performer];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__SVXSystemObserver_getLocalDeviceContextWithCompletion___block_invoke;
    v6[3] = &unk_2645547D8;
    v6[4] = self;
    id v7 = v4;
    [v5 performBlock:v6];
  }
}

uint64_t __57__SVXSystemObserver_getLocalDeviceContextWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) getLocalDeviceContextWithCompletion:*(void *)(a1 + 40)];
}

- (void)removeDeviceContextListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSystemObserver_removeDeviceContextListener___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __49__SVXSystemObserver_removeDeviceContextListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeListener:*(void *)(a1 + 40)];
}

- (void)addDeviceContextListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SVXModule *)self->_module performer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__SVXSystemObserver_addDeviceContextListener___block_invoke;
  v7[3] = &unk_2645548C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __46__SVXSystemObserver_addDeviceContextListener___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    int v3 = objc_alloc_init(SVXDeviceContextAnnouncer);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addListener:v6];
}

@end