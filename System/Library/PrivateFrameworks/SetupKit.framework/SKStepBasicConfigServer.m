@interface SKStepBasicConfigServer
- (CUMessaging)skMessaging;
- (NSDictionary)outClientConfig;
- (NSDictionary)serverConfig;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepBasicConfigServer)init;
- (id)skCompletionHandler;
- (void)_activate;
- (void)_completeWithError:(id)a3;
- (void)_handleRequestBasicConfig:(id)a3 responseHandler:(id)a4;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setOutClientConfig:(id)a3;
- (void)setServerConfig:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepBasicConfigServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outClientConfig, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setOutClientConfig:(id)a3
{
}

- (NSDictionary)outClientConfig
{
  return self->_outClientConfig;
}

- (void)setServerConfig:(id)a3
{
}

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setSkSetupObject:(id)a3
{
}

- (SKSetupBase)skSetupObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_skSetupObject);

  return (SKSetupBase *)WeakRetained;
}

- (void)setSkMessaging:(id)a3
{
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkCompletionHandler:(id)a3
{
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_handleRequestBasicConfig:(id)a3 responseHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (gLogCategory_SKStepBasicConfigServer <= 30
    && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  {
    v12 = CUPrintNSObjectOneLine();
    LogPrintF_safe();
  }
  -[SKStepBasicConfigServer setOutClientConfig:](self, "setOutClientConfig:", v13, v12);
  v7 = [[SKEventBasicConfigUpdated alloc] initWithBasicConfig:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_skSetupObject);
  [WeakRetained _reportEvent:v7];

  uint64_t v9 = [(SKStepBasicConfigServer *)self serverConfig];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x263EFFA78];
  }
  (*((void (**)(id, uint64_t, void, void, void *))v6 + 2))(v6, v11, 0, 0, &__block_literal_global_16_2400);
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (gLogCategory_SKStepBasicConfigServer <= 90
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      v8 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_SKStepBasicConfigServer <= 30 {
         && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  v5 = (void (**)(void, void, void, void, void))MEMORY[0x223C632B0](self->_responseHandler);
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = 0;

  if (v5)
  {
    if (v4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = MEMORY[0x263EFFA78];
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__SKStepBasicConfigServer__completeWithError___block_invoke;
    v9[3] = &unk_2645496B0;
    v9[4] = self;
    id v10 = v4;
    ((void (**)(void, uint64_t, void, id, void *))v5)[2](v5, v7, 0, v10, v9);
  }
}

void __46__SKStepBasicConfigServer__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void (**)(void, void))MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 32) + 32));
  if (v3)
  {
    if (*(void *)(a1 + 40)) {
      id v4 = *(id *)(a1 + 40);
    }
    else {
      id v4 = v5;
    }
    ((void (**)(void, id))v3)[2](v3, v4);
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v5 = (void (**)(id, void *))MEMORY[0x223C632B0](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0;

    if (v5)
    {
      id v4 = NSErrorF_safe();
      v5[2](v5, v4);
    }
    self->_invalidateDone = 1;
    if (gLogCategory_SKStepBasicConfigServer <= 30
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SKStepBasicConfigServer_invalidate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __37__SKStepBasicConfigServer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    if (gLogCategory_SKStepBasicConfigServer <= 30
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v6 = (id)MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 32) + 16));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    if (v6)
    {
      id v5 = NSErrorF_safe();
      (*((void (**)(id, void, void, void *, void *))v6 + 2))(v6, 0, 0, v5, &__block_literal_global_2409);
    }
    [*(id *)(*(void *)(a1 + 32) + 40) deregisterRequestID:@"_bsCf" completionHandler:&__block_literal_global_10];
    [*(id *)(a1 + 32) _invalidated];
  }
}

- (void)_activate
{
  skMessaging = self->_skMessaging;
  if (skMessaging)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SKStepBasicConfigServer__activate__block_invoke;
    v7[3] = &unk_264549688;
    v7[4] = skMessaging;
    v7[5] = self;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SKStepBasicConfigServer__activate__block_invoke_2;
    v6[3] = &unk_2645496B0;
    v6[4] = skMessaging;
    v6[5] = self;
    id v4 = skMessaging;
    [(CUMessaging *)v4 registerRequestID:@"_bsCf" options:0 requestHandler:v7 completionHandler:v6];
  }
  else
  {
    NSErrorF_safe();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(SKStepBasicConfigServer *)self _completeWithError:v5];
  }
}

void *__36__SKStepBasicConfigServer__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v6 == result[5]) {
    return (void *)[result _handleRequestBasicConfig:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepBasicConfigServer__activate__block_invoke_2(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    result = (void *)result[5];
    if (v2 == result[5]) {
      return (void *)[result _completeWithError:a2];
    }
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SKStepBasicConfigServer_activate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SKStepBasicConfigServer_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SKStepBasicConfigServer <= 30
    && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _activate];
}

- (NSString)description
{
  id v4 = [(id)objc_opt_class() description];
  uint64_t v2 = NSPrintF();

  return (NSString *)v2;
}

- (SKStepBasicConfigServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKStepBasicConfigServer;
  uint64_t v2 = [(SKStepBasicConfigServer *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    id v4 = v3;
  }

  return v3;
}

@end