@interface TVRMSDAAPLoginManager
- (BOOL)_isFairplayRequiredForServerInfo:(id)a3;
- (TVRMSDAAPLoginManager)initWithRequestManager:(id)a3;
- (void)_continueFairPlayHandshakeWithData:(id)a3 completionHandler:(id)a4;
- (void)_requestControlInterfaceWithCompletionHandler:(id)a3;
- (void)_requestFairPlayHandshake:(id)a3;
- (void)_requestLoginWithCompletionHandler:(id)a3;
- (void)_requestServerInfoWithCompletionHandler:(id)a3;
- (void)loginWithCompletionHandler:(id)a3;
@end

@implementation TVRMSDAAPLoginManager

- (TVRMSDAAPLoginManager)initWithRequestManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRMSDAAPLoginManager;
  v6 = [(TVRMSDAAPLoginManager *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    fairPlaySession = v6->_fairPlaySession;
    v6->_fairPlaySession = (TVRMSFairPlaySession *)v7;

    objc_storeStrong((id *)&v6->_requestManager, a3);
    [(TVRMSDAAPRequestManager *)v6->_requestManager setFairPlaySession:v6->_fairPlaySession];
  }

  return v6;
}

- (void)loginWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke;
  v6[3] = &unk_2647AEAE8;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(TVRMSDAAPLoginManager *)self _requestServerInfoWithCompletionHandler:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1;
    v5[3] = &unk_2647AEB10;
    id v6 = *(id *)(a1 + 32);
    objc_copyWeak(&v7, (id *)(a1 + 40));
    [WeakRetained _requestLoginWithCompletionHandler:v5];

    objc_destroyWeak(&v7);
  }
  else
  {
    id v4 = _TVRCRMSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Error getting server info", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_1(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      [*((id *)WeakRetained + 1) setSessionIdentifier:a3];
      if (v6[24])
      {
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2;
        v11[3] = &unk_2647AEAE8;
        id v12 = *(id *)(a1 + 32);
        objc_copyWeak(&v13, (id *)(a1 + 40));
        [v6 _requestFairPlayHandshake:v11];
        id v7 = &v12;
        objc_destroyWeak(&v13);
      }
      else
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2;
        v9[3] = &unk_2647AEAC0;
        id v7 = (id *)v10;
        v10[0] = *(id *)(a1 + 32);
        v10[1] = 1;
        [v6 _requestControlInterfaceWithCompletionHandler:v9];
      }
    }
  }
  else
  {
    id v8 = _TVRCRMSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Error logging in", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_3;
    v5[3] = &unk_2647AEAC0;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = 1;
    [WeakRetained _requestControlInterfaceWithCompletionHandler:v5];
  }
  else
  {
    id v4 = _TVRCRMSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Error performing FairPlay handshake", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

uint64_t __52__TVRMSDAAPLoginManager_loginWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

- (void)_requestServerInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  requestManager = self->_requestManager;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__TVRMSDAAPLoginManager__requestServerInfoWithCompletionHandler___block_invoke;
  v8[3] = &unk_2647AEB38;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:@"server-info" method:@"GET" postData:0 queryArgs:0 completionHandler:v8];
}

uint64_t __65__TVRMSDAAPLoginManager__requestServerInfoWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:");
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
  v8[2] = __71__TVRMSDAAPLoginManager__requestControlInterfaceWithCompletionHandler___block_invoke;
  v8[3] = &unk_2647AE990;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:@"ctrl-int" method:@"POST" postData:0 queryArgs:0 completionHandler:v8];
}

void __71__TVRMSDAAPLoginManager__requestControlInterfaceWithCompletionHandler___block_invoke(uint64_t a1)
{
  +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v11 objectForKey:@"items"];
  v3 = [v2 firstObject];

  id v4 = [v3 objectForKeyedSubscript:@"dacp.supportsSpeakerSelection"];
  uint64_t v5 = [v4 BOOLValue];

  id v6 = [v3 objectForKeyedSubscript:@"dacp.supportsVolume"];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [v3 objectForKeyedSubscript:@"supportsDirectionalControl"];
  uint64_t v9 = [v8 BOOLValue];

  objc_super v10 = objc_opt_new();
  [v10 setSupportsSpeakerSelection:v5];
  [v10 setSupportsVolumeControl:v7];
  [v10 setSupportsDirectionalControl:v9];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestLoginWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_isFairPlayRequired) {
    uint64_t v5 = &unk_26DA62F88;
  }
  else {
    uint64_t v5 = 0;
  }
  requestManager = self->_requestManager;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__TVRMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke;
  v9[3] = &unk_2647AE990;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:@"login" method:@"GET" postData:0 queryArgs:v5 completionHandler:v9];
}

void __60__TVRMSDAAPLoginManager__requestLoginWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = +[TVRMSDAAPParser objectWithData:](TVRMSDAAPParser, "objectWithData:");
  if (a2 != 1)
  {
    uint64_t v5 = _TVRCRMSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Login error, additional info from response body: %@", (uint8_t *)&v6, 0xCu);
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
    id v7 = [(TVRMSFairPlaySession *)fairPlaySession handshakeData];
    -[TVRMSDAAPLoginManager _continueFairPlayHandshakeWithData:completionHandler:](self, "_continueFairPlayHandshakeWithData:completionHandler:");
  }
  else
  {
    int v6 = (void (*)(void))*((void *)a3 + 2);
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
  v12[2] = __78__TVRMSDAAPLoginManager__continueFairPlayHandshakeWithData_completionHandler___block_invoke;
  v12[3] = &unk_2647AEB60;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v9 = v6;
  id v10 = v7;
  id v11 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:@"fp-setup" method:@"POST" postData:v9 queryArgs:0 completionHandler:v12];
}

void __78__TVRMSDAAPLoginManager__continueFairPlayHandshakeWithData_completionHandler___block_invoke(uint64_t a1)
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

    uint64_t v8 = [v3 objectForKeyedSubscript:@"com.apple.itunes.supports-fprap"];
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

@end