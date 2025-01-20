@interface WFSpringBoardRemoteAlertPresenter
- (BOOL)alertIsActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)activeConnection;
- (NSXPCListener)listener;
- (OS_dispatch_source)deactivateTimer;
- (SBSRemoteAlertHandle)activeHandle;
- (WFDialogAlertPresenterDelegate)delegate;
- (WFSpringBoardRemoteAlertPresenter)init;
- (void)activateAlertInMainSceneOfApplicationWithBundleIdentifier:(id)a3;
- (void)activateAlertWithPresentationTarget:(id)a3;
- (void)deactivateAlert;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setActiveConnection:(id)a3;
- (void)setActiveHandle:(id)a3;
- (void)setDeactivateTimer:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WFSpringBoardRemoteAlertPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_deactivateTimer, 0);
  objc_storeStrong((id *)&self->_activeHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setActiveConnection:(id)a3
{
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setDeactivateTimer:(id)a3
{
}

- (OS_dispatch_source)deactivateTimer
{
  return self->_deactivateTimer;
}

- (void)setActiveHandle:(id)a3
{
}

- (SBSRemoteAlertHandle)activeHandle
{
  return self->_activeHandle;
}

- (void)setDelegate:(id)a3
{
}

- (WFDialogAlertPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFDialogAlertPresenterDelegate *)WeakRetained;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFSpringBoardRemoteAlertPresenter *)self activeConnection];

  v9 = getWFDialogLogObject();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Not accepting new connection since there is already an active one.", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Setting activeConnection", buf, 0xCu);
    }

    [(WFSpringBoardRemoteAlertPresenter *)self setActiveConnection:v7];
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke;
    v22[3] = &unk_1E6542118;
    objc_copyWeak(&v23, (id *)buf);
    [v7 setInvalidationHandler:v22];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke_183;
    v20 = &unk_1E6542118;
    objc_copyWeak(&v21, (id *)buf);
    [v7 setInterruptionHandler:&v17];
    v11 = WFDialogXPCInterface();
    objc_msgSend(v7, "setRemoteObjectInterface:", v11, v17, v18, v19, v20);

    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F227A180];
    [v7 setExportedInterface:v12];

    v13 = [(WFSpringBoardRemoteAlertPresenter *)self delegate];
    [v7 setExportedObject:v13];

    [v7 resume];
    v14 = [(WFSpringBoardRemoteAlertPresenter *)self delegate];
    v15 = [v7 remoteObjectProxy];
    [v14 dialogAlertPresenter:self didConnectToAlert:v15];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  return v8 == 0;
}

void __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEBUG, "%s Connection to dialog was invalidated.", (uint8_t *)&v4, 0xCu);
  }

  v3 = [WeakRetained delegate];
  [v3 dialogAlertPresenterDidDisconnectFromAlert:WeakRetained];

  [WeakRetained setActiveConnection:0];
  [WeakRetained setActiveHandle:0];
}

void __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke_183(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_ERROR, "%s Connection to dialog was interrupted", (uint8_t *)&v4, 0xCu);
  }

  v3 = [WeakRetained delegate];
  [v3 dialogAlertPresenterDidDisconnectFromAlert:WeakRetained];

  [WeakRetained setActiveConnection:0];
  [WeakRetained setActiveHandle:0];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = getWFDialogLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "-[WFSpringBoardRemoteAlertPresenter remoteAlertHandle:didInvalidateWithError:]";
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Remote alert did invalidate with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  id v7 = [(WFSpringBoardRemoteAlertPresenter *)self deactivateTimer];

  if (v7)
  {
    v8 = [(WFSpringBoardRemoteAlertPresenter *)self deactivateTimer];
    dispatch_source_cancel(v8);

    deactivateTimer = self->_deactivateTimer;
    self->_deactivateTimer = 0;
  }
  [(WFSpringBoardRemoteAlertPresenter *)self setActiveHandle:0];
  v10 = [(WFSpringBoardRemoteAlertPresenter *)self delegate];
  [v10 dialogAlertPresenterDidInvalidateAlert:self];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = getWFDialogLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[WFSpringBoardRemoteAlertPresenter remoteAlertHandleDidDeactivate:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEBUG, "%s Remote alert did deactivate", buf, 0xCu);
  }

  id v5 = dispatch_get_global_queue(0, 0);
  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);

  deactivateTimer = self->_deactivateTimer;
  self->_deactivateTimer = v6;
  v8 = v6;

  dispatch_source_set_timer(v8, 0, 0xBEBC200uLL, 0xBEBC200uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __68__WFSpringBoardRemoteAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke;
  handler[3] = &unk_1E65420F0;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);
}

void __68__WFSpringBoardRemoteAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 dialogAlertPresenterDidDeactivateAlert:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getWFDialogLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[WFSpringBoardRemoteAlertPresenter remoteAlertHandleDidActivate:]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEBUG, "%s Remote alert did activate", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deactivateAlert
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getWFDialogLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[WFSpringBoardRemoteAlertPresenter deactivateAlert]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s Dismissing remote alert", (uint8_t *)&v6, 0xCu);
  }

  int v4 = [(WFSpringBoardRemoteAlertPresenter *)self activeConnection];
  [v4 invalidate];

  id v5 = [(WFSpringBoardRemoteAlertPresenter *)self activeHandle];
  [v5 invalidate];
}

- (void)activateAlertWithPresentationTarget:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = (objc_class *)MEMORY[0x1E4FA6B98];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setPresentationTarget:v5];

  uint64_t v7 = [(WFSpringBoardRemoteAlertPresenter *)self activeHandle];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [(WFSpringBoardRemoteAlertPresenter *)self activeHandle],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isActive],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    uint64_t v17 = getWFDialogLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      v20 = "-[WFSpringBoardRemoteAlertPresenter activateAlertWithPresentationTarget:]";
      _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_INFO, "%s Reactivating existing remote alert", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v18 = [(WFSpringBoardRemoteAlertPresenter *)self activeHandle];
    [v18 activateWithContext:v6];
  }
  else
  {
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.shortcuts.runtime" viewControllerClassName:@"WFRemoteAlertViewController"];
    id v12 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    __int16 v13 = [(WFSpringBoardRemoteAlertPresenter *)self listener];
    id v14 = [v13 endpoint];
    uint64_t v15 = [v14 _endpoint];
    [v12 setXpcEndpoint:v15];

    v16 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v11 configurationContext:v12];
    [v16 addObserver:self];
    [v16 activateWithContext:v6];
    [(WFSpringBoardRemoteAlertPresenter *)self setActiveHandle:v16];
  }
}

- (void)activateAlertInMainSceneOfApplicationWithBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFDialogLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[WFSpringBoardRemoteAlertPresenter activateAlertInMainSceneOfApplicationWithBundleIdentifier:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEBUG, "%s Requesting remote alert activation", (uint8_t *)&v17, 0xCu);
  }

  id v6 = [MEMORY[0x1E4FB46B8] currentDevice];
  uint64_t v7 = [v6 idiom];

  if (![v4 length] || v7 == 1)
  {
    [(WFSpringBoardRemoteAlertPresenter *)self activateAlertWithPresentationTarget:0];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F96438];
    v9 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v4];
    char v10 = [MEMORY[0x1E4F96448] descriptor];
    int v11 = [v8 statesForPredicate:v9 withDescriptor:v10 error:0];
    id v12 = [v11 firstObject];

    if (v12 && ([v12 isRunning] & 1) != 0)
    {
      __int16 v13 = [v12 process];
      uint64_t v14 = [v13 pid];

      uint64_t v15 = [MEMORY[0x1E4F62878] processHandleForPID:v14];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4FA6BE0]) initWithTargetProcess:v15];
      [(WFSpringBoardRemoteAlertPresenter *)self activateAlertWithPresentationTarget:v16];
    }
    else
    {
      [(WFSpringBoardRemoteAlertPresenter *)self activateAlertWithPresentationTarget:0];
    }
  }
}

- (BOOL)alertIsActive
{
  uint64_t v3 = [(WFSpringBoardRemoteAlertPresenter *)self activeHandle];
  if (v3)
  {
    id v4 = [(WFSpringBoardRemoteAlertPresenter *)self activeHandle];
    char v5 = [v4 isActive];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (WFSpringBoardRemoteAlertPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSpringBoardRemoteAlertPresenter;
  v2 = [(WFSpringBoardRemoteAlertPresenter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    char v5 = v2;
  }

  return v2;
}

@end