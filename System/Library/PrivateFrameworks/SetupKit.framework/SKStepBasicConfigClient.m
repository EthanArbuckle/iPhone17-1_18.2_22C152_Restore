@interface SKStepBasicConfigClient
- (BOOL)_runBasicConfigStart;
- (CUMessaging)skMessaging;
- (NSDictionary)clientConfig;
- (NSDictionary)outServerConfig;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepBasicConfigClient)init;
- (id)skCompletionHandler;
- (void)_completeWithError:(id)a3;
- (void)_invalidated;
- (void)_run;
- (void)activate;
- (void)invalidate;
- (void)setClientConfig:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setOutServerConfig:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepBasicConfigClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outServerConfig, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setOutServerConfig:(id)a3
{
}

- (NSDictionary)outServerConfig
{
  return self->_outServerConfig;
}

- (void)setClientConfig:(id)a3
{
}

- (NSDictionary)clientConfig
{
  return self->_clientConfig;
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

- (BOOL)_runBasicConfigStart
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [(SKStepBasicConfigClient *)self clientConfig];
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = [MEMORY[0x263EFF960] preferredLanguages];
    v5 = [v4 firstObject];

    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"_lang"];
    }
    else if (gLogCategory_SKStepBasicConfigClient <= 90 {
           && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
    v6 = [MEMORY[0x263EFF960] currentLocale];
    v7 = [v6 localeIdentifier];

    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"_locale"];
    }
    else if (gLogCategory_SKStepBasicConfigClient <= 90 {
           && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
  v8 = self->_skMessaging;
  if (v8)
  {
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      v11 = CUPrintNSObjectOneLine();
      LogPrintF_safe();
    }
    v13 = @"timeoutSeconds";
    v14[0] = &unk_26D1D0460;
    v9 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v11);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__SKStepBasicConfigClient__runBasicConfigStart__block_invoke;
    v12[3] = &unk_264549518;
    v12[4] = self;
    [(CUMessaging *)v8 sendRequestID:@"_bsCf" requestMessage:v3 options:v9 responseHandler:v12];
  }
  else
  {
    v9 = NSErrorF_safe();
    [(SKStepBasicConfigClient *)self _completeWithError:v9];
  }

  return v8 != 0;
}

void __47__SKStepBasicConfigClient__runBasicConfigStart__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = *(unsigned char **)(a1 + 32);
  if (!v10[8])
  {
    id v11 = v15;
    if (!v15 || v8)
    {
      if (v8)
      {
        [*(id *)(a1 + 32) _completeWithError:v8];
      }
      else
      {
        v12 = NSErrorF_safe();
        [v10 _completeWithError:v12];
      }
    }
    else
    {
      if (gLogCategory_SKStepBasicConfigClient <= 30)
      {
        if (gLogCategory_SKStepBasicConfigClient != -1 || (v13 = _LogCategory_Initialize(), id v11 = v15, v13))
        {
          v14 = CUPrintNSObjectOneLine();
          LogPrintF_safe();

          id v11 = v15;
        }
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
      objc_msgSend(*(id *)(a1 + 32), "setOutServerConfig:", v11, v14);
      [*(id *)(a1 + 32) _run];
    }
  }
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      int runState = self->_runState;
      if (runState > 11)
      {
        if (runState == 12)
        {
          if (self->_responseReceived)
          {
            int v5 = 13;
            goto LABEL_14;
          }
          int v5 = 12;
        }
        else
        {
          if (runState != 13) {
            return;
          }
          [(SKStepBasicConfigClient *)self _completeWithError:0];
          int v5 = self->_runState;
        }
      }
      else
      {
        if (!runState)
        {
          int v5 = 11;
          goto LABEL_14;
        }
        if (runState != 11) {
          return;
        }
        BOOL v4 = [(SKStepBasicConfigClient *)self _runBasicConfigStart];
        int v5 = self->_runState;
        if (v4)
        {
          ++v5;
LABEL_14:
          self->_int runState = v5;
        }
      }
      if (v5 == runState) {
        return;
      }
      if (gLogCategory_SKStepBasicConfigClient <= 30
        && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  if (v4) {
    int v5 = 3;
  }
  else {
    int v5 = 4;
  }
  self->_int runState = v5;
  id v9 = v4;
  if (v4)
  {
    if (gLogCategory_SKStepBasicConfigClient <= 60
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_SKStepBasicConfigClient <= 30 {
         && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  v6 = (void (**)(void, void))MEMORY[0x223C632B0](self->_skCompletionHandler);
  id skCompletionHandler = self->_skCompletionHandler;
  self->_id skCompletionHandler = 0;

  if (v6) {
    ((void (**)(void, id))v6)[2](v6, v9);
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    int v5 = (void (**)(id, void *))MEMORY[0x223C632B0](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0;

    if (v5)
    {
      id v4 = NSErrorF_safe();
      v5[2](v5, v4);
    }
    self->_invalidateDone = 1;
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
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
  block[2] = __37__SKStepBasicConfigClient_invalidate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SKStepBasicConfigClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SKStepBasicConfigClient_activate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SKStepBasicConfigClient_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SKStepBasicConfigClient <= 30
    && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _run];
}

- (NSString)description
{
  id v4 = [(id)objc_opt_class() description];
  uint64_t v2 = NSPrintF();

  return (NSString *)v2;
}

- (SKStepBasicConfigClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKStepBasicConfigClient;
  uint64_t v2 = [(SKStepBasicConfigClient *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    id v4 = v3;
  }

  return v3;
}

@end