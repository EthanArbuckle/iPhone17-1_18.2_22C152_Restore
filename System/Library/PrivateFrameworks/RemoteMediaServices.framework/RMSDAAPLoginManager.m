@interface RMSDAAPLoginManager
- (BOOL)_isFairplayRequiredForServerInfo:(id)a3;
- (RMSDAAPLoginManager)initWithRequestManager:(id)a3;
- (void)_continueFairPlayHandshakeWithData:(id)a3 completionHandler:(id)a4;
- (void)_requestControlInterfaceWithCompletionHandler:(id)a3;
- (void)_requestFairPlayHandshake:(id)a3;
- (void)_requestLoginWithCompletionHandler:(id)a3;
- (void)_requestServerInfoWithCompletionHandler:(id)a3;
- (void)loginWithCompletionHandler:(id)a3;
@end

@implementation RMSDAAPLoginManager

- (RMSDAAPLoginManager)initWithRequestManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMSDAAPLoginManager;
  v6 = [(RMSDAAPLoginManager *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    fairPlaySession = v6->_fairPlaySession;
    v6->_fairPlaySession = (RMSFairPlaySession *)v7;

    objc_storeStrong((id *)&v6->_requestManager, a3);
    [(RMSDAAPRequestManager *)v6->_requestManager setFairPlaySession:v6->_fairPlaySession];
  }

  return v6;
}

- (void)loginWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E74438;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(RMSDAAPLoginManager *)self _requestServerInfoWithCompletionHandler:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1;
    v12[3] = &unk_264E74460;
    id v13 = *(id *)(a1 + 32);
    objc_copyWeak(&v14, (id *)(a1 + 40));
    [WeakRetained _requestLoginWithCompletionHandler:v12];

    objc_destroyWeak(&v14);
  }
  else
  {
    id v4 = RMSLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      [*((id *)WeakRetained + 1) setSessionIdentifier:a3];
      if (v6[24])
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2;
        v18[3] = &unk_264E74438;
        id v19 = *(id *)(a1 + 32);
        objc_copyWeak(&v20, (id *)(a1 + 40));
        [v6 _requestFairPlayHandshake:v18];
        uint64_t v7 = &v19;
        objc_destroyWeak(&v20);
      }
      else
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2;
        v16[3] = &unk_264E74410;
        uint64_t v7 = (id *)v17;
        v17[0] = *(id *)(a1 + 32);
        v17[1] = 1;
        [v6 _requestControlInterfaceWithCompletionHandler:v16];
      }
    }
  }
  else
  {
    uint64_t v8 = RMSLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_264E74410;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = 1;
    [WeakRetained _requestControlInterfaceWithCompletionHandler:v12];
  }
  else
  {
    id v4 = RMSLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

uint64_t __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

- (void)_requestServerInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestManager = self->_requestManager;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__RMSDAAPLoginManager__requestServerInfoWithCompletionHandler___block_invoke;
  v8[3] = &unk_264E74488;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(RMSDAAPRequestManager *)requestManager requestWithPath:@"server-info" method:@"GET" postData:0 queryArgs:0 completionHandler:v8];
}

uint64_t __63__RMSDAAPLoginManager__requestServerInfoWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = +[RMSDAAPParser objectWithData:](RMSDAAPParser, "objectWithData:");
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 32) _isFairplayRequiredForServerInfo:v3];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)_requestControlInterfaceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestManager = self->_requestManager;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__RMSDAAPLoginManager__requestControlInterfaceWithCompletionHandler___block_invoke;
  v8[3] = &unk_264E744B0;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(RMSDAAPRequestManager *)requestManager requestWithPath:@"ctrl-int" method:@"POST" postData:0 queryArgs:0 completionHandler:v8];
}

void __69__RMSDAAPLoginManager__requestControlInterfaceWithCompletionHandler___block_invoke(uint64_t a1)
{
  +[RMSDAAPParser objectWithData:](RMSDAAPParser, "objectWithData:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v11 objectForKey:@"items"];
  v3 = [v2 firstObject];

  id v4 = [v3 objectForKeyedSubscript:@"dacp.supportsSpeakerSelection"];
  uint64_t v5 = [v4 BOOLValue];

  id v6 = [v3 objectForKeyedSubscript:@"dacp.supportsVolume"];
  uint64_t v7 = [v6 BOOLValue];

  uint64_t v8 = [v3 objectForKeyedSubscript:@"supportsDirectionalControl"];
  uint64_t v9 = [v8 BOOLValue];

  uint64_t v10 = objc_opt_new();
  [v10 setSupportsSpeakerSelection:v5];
  [v10 setSupportsVolumeControl:v7];
  [v10 setSupportsDirectionalControl:v9];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestLoginWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_isFairPlayRequired) {
    uint64_t v5 = &unk_26F08F950;
  }
  else {
    uint64_t v5 = 0;
  }
  requestManager = self->_requestManager;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__RMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke;
  v9[3] = &unk_264E744B0;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(RMSDAAPRequestManager *)requestManager requestWithPath:@"login" method:@"GET" postData:0 queryArgs:v5 completionHandler:v9];
}

void __58__RMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[RMSDAAPParser objectWithData:](RMSDAAPParser, "objectWithData:");
  if (a2 != 1)
  {
    uint64_t v5 = RMSLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__RMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, [v4 intValue]);
}

- (void)_requestFairPlayHandshake:(id)a3
{
  if (self->_isFairPlayRequired)
  {
    fairPlaySession = self->_fairPlaySession;
    id v5 = a3;
    id v7 = [(RMSFairPlaySession *)fairPlaySession handshakeData];
    -[RMSDAAPLoginManager _continueFairPlayHandshakeWithData:completionHandler:](self, "_continueFairPlayHandshakeWithData:completionHandler:");
  }
  else
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
}

- (void)_continueFairPlayHandshakeWithData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  requestManager = self->_requestManager;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__RMSDAAPLoginManager__continueFairPlayHandshakeWithData_completionHandler___block_invoke;
  v12[3] = &unk_264E744D8;
  id v13 = v6;
  id v14 = v7;
  void v12[4] = self;
  id v9 = v6;
  id v10 = v7;
  id v11 = [(RMSDAAPRequestManager *)requestManager requestWithPath:@"fp-setup" method:@"POST" postData:v9 queryArgs:0 completionHandler:v12];
}

void __76__RMSDAAPLoginManager__continueFairPlayHandshakeWithData_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "handshakeIterationWithData:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(*(void *)(a1 + 32) + 16) isHandshakeComplete])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      [*(id *)(a1 + 32) _continueFairPlayHandshakeWithData:v3 completionHandler:*(void *)(a1 + 48)];
      goto LABEL_7;
    }
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v2();
LABEL_7:
}

- (BOOL)_isFairplayRequiredForServerInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.itunes.supportedextensions"];
  char v5 = [v4 unsignedLongLongValue];

  if ((v5 & 2) != 0)
  {
    char v10 = 1;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"com.apple.itunes.req-fplay"];
    char v7 = [v6 BOOLValue];

    id v8 = [v3 objectForKeyedSubscript:@"com.apple.itunes.supports-fprap"];
    char v9 = [v8 BOOLValue];

    char v10 = v7 & v9;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlaySession, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

void __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__RMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__RMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C83A000, a2, OS_LOG_TYPE_ERROR, "Login error, additional info from response body: %@", (uint8_t *)&v2, 0xCu);
}

@end