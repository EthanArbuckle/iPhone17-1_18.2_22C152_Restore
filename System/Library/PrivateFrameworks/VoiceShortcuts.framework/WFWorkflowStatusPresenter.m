@interface WFWorkflowStatusPresenter
- (BOOL)alertIsActive;
- (BOOL)alertIsLaunching;
- (BOOL)isLaunching;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)activeConnection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (WFDialogAlertPresenterDelegate)delegate;
- (WFWorkflowStatusPresenter)init;
- (WFWorkflowStatusPresenterDelegate)statusPresenterDelegate;
- (void)activateAlertInMainSceneOfApplicationWithBundleIdentifier:(id)a3;
- (void)deactivateAlert;
- (void)setActiveConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLaunching:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setStatusPresenterDelegate:(id)a3;
@end

@implementation WFWorkflowStatusPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_statusPresenterDelegate);
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

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setLaunching:(BOOL)a3
{
  self->_launching = a3;
}

- (BOOL)isLaunching
{
  return self->_launching;
}

- (void)setStatusPresenterDelegate:(id)a3
{
}

- (WFWorkflowStatusPresenterDelegate)statusPresenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusPresenterDelegate);
  return (WFWorkflowStatusPresenterDelegate *)WeakRetained;
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
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFWorkflowStatusPresenter *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v9 = [(WFWorkflowStatusPresenter *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E6542140;
  id v13 = v7;
  v14 = &v15;
  block[4] = self;
  id v10 = v7;
  dispatch_sync(v9, block);

  LOBYTE(v7) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v7;
}

void __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setLaunching:0];
  v2 = [*(id *)(a1 + 32) activeConnection];
  BOOL v3 = v2 == 0;

  v4 = getWFDialogLogObject();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke";
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Accepting incoming connection as active: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setActiveConnection:*(void *)(a1 + 40)];
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_166;
    v18[3] = &unk_1E6542118;
    objc_copyWeak(&v19, (id *)buf);
    [*(id *)(a1 + 40) setInvalidationHandler:v18];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_2;
    v16 = &unk_1E6542118;
    objc_copyWeak(&v17, (id *)buf);
    [*(id *)(a1 + 40) setInterruptionHandler:&v13];
    v8 = objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1F229C6E8, v13, v14, v15, v16);
    [*(id *)(a1 + 40) setRemoteObjectInterface:v8];

    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F227A430];
    [*(id *)(a1 + 40) setExportedInterface:v9];

    id v10 = [*(id *)(a1 + 32) statusPresenterDelegate];
    [*(id *)(a1 + 40) setExportedObject:v10];

    [*(id *)(a1 + 40) resume];
    v11 = [*(id *)(a1 + 32) statusPresenterDelegate];
    v12 = [*(id *)(a1 + 40) remoteObjectProxy];
    [v11 statusPresenterDidConnectToService:v12];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) activeConnection];
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke";
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Not accepting new connections while one is already active: %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_166(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEBUG, "%s Connection to view service application was invalidated.", buf, 0xCu);
  }

  BOOL v3 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_167;
  block[3] = &unk_1E65420F0;
  block[4] = WeakRetained;
  dispatch_async(v3, block);
}

void __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke_2";
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_ERROR, "%s Connection to view service application was interrupted", buf, 0xCu);
  }

  BOOL v3 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_168;
  block[3] = &unk_1E65420F0;
  block[4] = WeakRetained;
  dispatch_async(v3, block);
}

uint64_t __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_168(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) statusPresenterDelegate];
  [v2 statusPresenterDidDisconnect];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setActiveConnection:0];
}

uint64_t __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_167(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) statusPresenterDelegate];
  [v2 statusPresenterDidDisconnect];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setActiveConnection:0];
}

- (void)deactivateAlert
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = getWFDialogLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[WFWorkflowStatusPresenter deactivateAlert]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s Deactivating alert", buf, 0xCu);
  }

  v4 = [(WFWorkflowStatusPresenter *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WFWorkflowStatusPresenter_deactivateAlert__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __44__WFWorkflowStatusPresenter_deactivateAlert__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeConnection];
  [v2 invalidate];

  [*(id *)(a1 + 32) setActiveConnection:0];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setLaunching:0];
}

- (void)activateAlertInMainSceneOfApplicationWithBundleIdentifier:(id)a3
{
  v4 = [(WFWorkflowStatusPresenter *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke(uint64_t a1)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setLaunching:1];
  v2 = objc_opt_new();
  BOOL v3 = [*(id *)(a1 + 32) listener];
  v4 = [v3 endpoint];
  v5 = [v4 _endpoint];
  [v2 setObject:v5 forSetting:0];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F627C8]) initWithInfo:v2 responder:0];
  uint64_t v7 = (void *)MEMORY[0x1E4F629C8];
  uint64_t v8 = *MEMORY[0x1E4F625F8];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  v19[0] = MEMORY[0x1E4F1CC38];
  uint64_t v10 = *MEMORY[0x1E4F625E0];
  v18[0] = v8;
  v18[1] = v10;
  id v17 = v6;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v18[2] = *MEMORY[0x1E4FA7120];
  v19[1] = v11;
  v19[2] = v9;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  uint64_t v13 = [v7 optionsWithDictionary:v12];

  uint64_t v14 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  uint64_t v15 = *MEMORY[0x1E4FB4B98];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_2;
  v16[3] = &unk_1E65420C8;
  v16[4] = *(void *)(a1 + 32);
  [v14 openApplication:v15 withOptions:v13 completion:v16];
}

void __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_3;
  block[3] = &unk_1E65420A0;
  id v11 = v5;
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_3(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(result + 32))
  {
    uint64_t v1 = result;
    v2 = getWFDialogLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      uint64_t v3 = *(void *)(v1 + 40);
      int v4 = 136315394;
      id v5 = "-[WFWorkflowStatusPresenter activateAlertInMainSceneOfApplicationWithBundleIdentifier:]_block_invoke_3";
      __int16 v6 = 2112;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_FAULT, "%s Unable to launch View Service application, error: %@", (uint8_t *)&v4, 0x16u);
    }

    return [*(id *)(v1 + 48) setLaunching:0];
  }
  return result;
}

- (BOOL)alertIsActive
{
  v2 = self;
  uint64_t v3 = [(WFWorkflowStatusPresenter *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v4 = [(WFWorkflowStatusPresenter *)v2 queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__WFWorkflowStatusPresenter_alertIsActive__block_invoke;
  v6[3] = &unk_1E6542078;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __42__WFWorkflowStatusPresenter_alertIsActive__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeConnection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (BOOL)alertIsLaunching
{
  v2 = self;
  uint64_t v3 = [(WFWorkflowStatusPresenter *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v4 = [(WFWorkflowStatusPresenter *)v2 queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__WFWorkflowStatusPresenter_alertIsLaunching__block_invoke;
  v6[3] = &unk_1E6542078;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __45__WFWorkflowStatusPresenter_alertIsLaunching__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isLaunching];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (WFWorkflowStatusPresenter)init
{
  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowStatusPresenter;
  v2 = [(WFWorkflowStatusPresenter *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    [(NSXPCListener *)v3 setDelegate:v2];
    [(NSXPCListener *)v3 resume];
    listener = v2->_listener;
    v2->_listener = v3;
    id v5 = v3;

    __int16 v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.shortcuts.WFStatusPresenter-queue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    char v10 = v2;
  }

  return v2;
}

@end