@interface STKAlertSessionManager
- (NSString)deviceLanguage;
- (OS_os_log)log;
- (STKAlertSessionEventQueue)eventQueue;
- (STKAlertSessionManager)initWithEventQueue:(id)a3 logger:(id)a4;
- (id)remoteAlertDescriptorForSession:(id)a3;
- (void)enqueuePresentationForSession:(id)a3 completion:(id)a4;
- (void)setDeviceLanguage:(id)a3;
@end

@implementation STKAlertSessionManager

- (STKAlertSessionManager)initWithEventQueue:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STKAlertSessionManager;
  v9 = [(STKAlertSessionManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventQueue, a3);
    objc_storeStrong((id *)&v10->_log, a4);
  }

  return v10;
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  return 0;
}

- (void)enqueuePresentationForSession:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STKAlertSessionManager *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v16 = v6;
    _os_log_impl(&dword_221DC0000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Enqueing for presentation", buf, 0xCu);
  }

  eventQueue = self->_eventQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__STKAlertSessionManager_enqueuePresentationForSession_completion___block_invoke;
  v12[3] = &unk_2645F4410;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(STKAlertSessionEventQueue *)eventQueue enqueue:v12];
}

void __67__STKAlertSessionManager_enqueuePresentationForSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) remoteAlertDescriptorForSession:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v21 = 134218242;
    uint64_t v22 = v4;
    __int16 v23 = 2114;
    v24 = v2;
    _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Remote alert descriptor: %{public}@", (uint8_t *)&v21, 0x16u);
  }

  if ([v2 isValid])
  {
    id v5 = objc_alloc(MEMORY[0x263F79410]);
    id v6 = [v2 serviceIdentifier];
    id v7 = [v2 viewControllerName];
    id v8 = (void *)[v5 initWithServiceName:v6 viewControllerClassName:v7];

    id v9 = objc_alloc_init(MEMORY[0x263F79408]);
    id v10 = (void *)MEMORY[0x263EFFA08];
    id v11 = [v2 BSAction];
    objc_super v12 = [v10 setWithObject:v11];
    [v9 setActions:v12];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [*(id *)(a1 + 40) ussdListener];
      id v14 = [v13 endpoint];
      v15 = [v14 _endpoint];
      [v9 setXpcEndpoint:v15];
    }
    id v16 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v8 configurationContext:v9];
    [*(id *)(a1 + 32) _willPresentAlertHandle:v16];
    uint64_t v17 = *(void **)(a1 + 40);
    v18 = [v2 action];
    [v17 presentRemoteAlertHandle:v16 withAction:v18];

    if (!v16)
    {
      [*(id *)(a1 + 40) sendResponse:5];
      [*(id *)(a1 + 40) invalidate];
    }
    (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v16 != 0);
  }
  else
  {
    v19 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      int v21 = 134217984;
      uint64_t v22 = v20;
      _os_log_impl(&dword_221DC0000, v19, OS_LOG_TYPE_DEFAULT, "Session <%p> - Failed to create a remote alert.  Invalidating.", (uint8_t *)&v21, 0xCu);
    }

    [*(id *)(a1 + 40) invalidate];
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (STKAlertSessionEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (NSString)deviceLanguage
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end