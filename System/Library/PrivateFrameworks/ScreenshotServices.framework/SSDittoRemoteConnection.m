@interface SSDittoRemoteConnection
- (SSDittoRemoteConnection)init;
- (void)_sendAction:(id)a3;
- (void)_sendAction:(id)a3 completion:(id)a4;
- (void)preheatDittoProcess;
- (void)sendDittoProcessDocumentUpdate:(id)a3;
- (void)sendDittoProcessEnvironmentDescription:(id)a3 completion:(id)a4;
- (void)sendDittoProcessImageIdentifierUpdate:(id)a3;
- (void)sendDittoProcessMetadataUpdate:(id)a3 completion:(id)a4;
- (void)sendDittoProcessPreheatRequestWithPresentationMode:(unint64_t)a3 completion:(id)a4;
@end

@implementation SSDittoRemoteConnection

- (SSDittoRemoteConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSDittoRemoteConnection;
  v2 = [(SSDittoRemoteConnection *)&v6 init];
  uint64_t v3 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  openApplicationService = v2->_openApplicationService;
  v2->_openApplicationService = (FBSOpenApplicationService *)v3;

  return v2;
}

- (void)_sendAction:(id)a3
{
}

- (void)_sendAction:(id)a3 completion:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F3F778];
  uint64_t v8 = *MEMORY[0x263F3F580];
  id v18 = a3;
  v19[0] = v8;
  v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a3;
  v11 = [v9 arrayWithObjects:&v18 count:1];
  v19[1] = *MEMORY[0x263F3F598];
  v20[0] = v11;
  v20[1] = MEMORY[0x263EFFA88];
  v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v13 = [v7 optionsWithDictionary:v12];

  openApplicationService = self->_openApplicationService;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SSDittoRemoteConnection__sendAction_completion___block_invoke;
  v16[3] = &unk_2644EDD00;
  id v17 = v6;
  id v15 = v6;
  [(FBSOpenApplicationService *)openApplicationService openApplication:@"com.apple.ScreenshotServicesService" withOptions:v13 completion:v16];
}

uint64_t __50__SSDittoRemoteConnection__sendAction_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  }
  return result;
}

- (void)preheatDittoProcess
{
  uint64_t v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ECED000, v3, OS_LOG_TYPE_INFO, "Preheating Ditto process", v5, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F29BB0]);
  [(SSDittoRemoteConnection *)self _sendAction:v4];
}

- (void)sendDittoProcessEnvironmentDescription:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bsSettings];
  v9 = [SSScreenshotAction alloc];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke;
  v14[3] = &unk_2644ED648;
  id v15 = v7;
  id v10 = v7;
  v11 = [(SSScreenshotAction *)v9 initWithInfo:v8 timeout:0 forResponseOnQueue:v14 withHandler:5.0];
  v12 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [v6 loggableDescription];
    *(_DWORD *)buf = 138412290;
    id v17 = v13;
    _os_log_impl(&dword_21ECED000, v12, OS_LOG_TYPE_INFO, "Sending environment description %@", buf, 0xCu);
  }
  [(SSDittoRemoteConnection *)self _sendAction:v11];
}

void __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  os_log_t v5 = os_log_create("com.apple.screenshotservices", "XPC");
  id v6 = v5;
  if (v4)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke_cold_1(v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21ECED000, v6, OS_LOG_TYPE_INFO, "Heard back from service regarding environment description", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendDittoProcessImageIdentifierUpdate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_t v5 = [v4 bsSettings];
  id v6 = [[SSImageIdentifierAction alloc] initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];
  id v7 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v4 loggableDescription];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_21ECED000, v7, OS_LOG_TYPE_INFO, "Sending image identifier update %@", (uint8_t *)&v9, 0xCu);
  }
  [(SSDittoRemoteConnection *)self _sendAction:v6];
}

- (void)sendDittoProcessMetadataUpdate:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bsSettings];
  int v9 = [[SSMetadataUpdateAction alloc] initWithInfo:v8 timeout:0 forResponseOnQueue:v7 withHandler:0.0];
  id v10 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v6 loggableDescription];
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl(&dword_21ECED000, v10, OS_LOG_TYPE_INFO, "Sending environment metadata update %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__SSDittoRemoteConnection_sendDittoProcessMetadataUpdate_completion___block_invoke;
  v13[3] = &unk_2644EDC30;
  id v14 = v7;
  id v12 = v7;
  [(SSDittoRemoteConnection *)self _sendAction:v9 completion:v13];
}

uint64_t __69__SSDittoRemoteConnection_sendDittoProcessMetadataUpdate_completion___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
    }
  }
  return result;
}

- (void)sendDittoProcessDocumentUpdate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_t v5 = [v4 bsSettings];
  id v6 = [[SSDocumentUpdateAction alloc] initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];
  id v7 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v4 loggableDescription];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_21ECED000, v7, OS_LOG_TYPE_INFO, "Sending environment metadata update %@", (uint8_t *)&v9, 0xCu);
  }
  [(SSDittoRemoteConnection *)self _sendAction:v6];
}

- (void)sendDittoProcessPreheatRequestWithPresentationMode:(unint64_t)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F29C78]);
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v8 forSetting:9];

  int v9 = [SSPreheatAction alloc];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke;
  v13[3] = &unk_2644ED648;
  id v14 = v6;
  id v10 = v6;
  uint64_t v11 = [(SSPreheatAction *)v9 initWithInfo:v7 timeout:0 forResponseOnQueue:v13 withHandler:5.0];
  id v12 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = a3;
    _os_log_impl(&dword_21ECED000, v12, OS_LOG_TYPE_INFO, "Sending preheating request with presentation mode %td", buf, 0xCu);
  }

  [(SSDittoRemoteConnection *)self _sendAction:v11];
}

void __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  os_log_t v5 = os_log_create("com.apple.screenshotservices", "XPC");
  id v6 = v5;
  if (v4)
  {
    id v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke_cold_1(v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_21ECED000, v6, OS_LOG_TYPE_INFO, "Heard back from service regarding preheating environment description", v9, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (void).cxx_destruct
{
}

void __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Didn't hear back from service regarding environment description with error %@", v4, v5, v6, v7, 2u);
}

void __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Didn't hear back from service regarding preheating presentation mode with error %@", v4, v5, v6, v7, 2u);
}

@end