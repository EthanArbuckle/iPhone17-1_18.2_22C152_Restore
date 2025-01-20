@interface SFTRSession
- (BOOL)isConnected;
- (OS_dispatch_queue)dispatchQueue;
- (SFSession)session;
- (SFTRSession)init;
- (id)_decodeTRMessageData:(id)a3 kindOfClass:(Class)a4;
- (id)disconnectHandler;
- (id)sendEventImpHandler;
- (id)sendRequestImpHandler;
- (void)_cleanup;
- (void)activate;
- (void)dealloc;
- (void)handleEvent:(id)a3 flags:(unsigned int)a4;
- (void)handleRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5;
- (void)invalidate;
- (void)sendEvent:(id)a3;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setConnected:(BOOL)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3 forEventClass:(Class)a4;
- (void)setRequestHandler:(id)a3 forRequestClass:(Class)a4;
- (void)setSendEventImpHandler:(id)a3;
- (void)setSendRequestImpHandler:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation SFTRSession

- (SFTRSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFTRSession;
  v2 = [(SFTRSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_connected = 1;
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFTRSession *)FatalErrorF();
    [(SFTRSession *)v3 _cleanup];
  }
  else
  {
    [(SFTRSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFTRSession;
    [(SFTRSession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  anisetteDataHandler = self->_anisetteDataHandler;
  self->_anisetteDataHandler = 0;

  id disconnectHandler = self->_disconnectHandler;
  self->_id disconnectHandler = 0;

  [(NSMutableDictionary *)self->_handlerMap removeAllObjects];
  handlerMap = self->_handlerMap;
  self->_handlerMap = 0;

  id sendEventImpHandler = self->_sendEventImpHandler;
  self->_id sendEventImpHandler = 0;

  id sendRequestImpHandler = self->_sendRequestImpHandler;
  self->_id sendRequestImpHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SFTRSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__SFTRSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v2 = objc_alloc_init((Class)getTRAnisetteDataHandlerClass[0]());
  uint64_t v3 = *(void *)(a1 + 32);
  SEL v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  objc_super v5 = *(void **)(a1 + 32);
  v6 = (void *)v5[2];
  objc_super v7 = [v5 trSession];
  [v6 registerForAnisetteDataRequestsFromSession:v7];

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__SFTRSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__SFTRSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24)
    && gLogCategory_SFTRSession <= 30
    && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  id v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (void)handleEvent:(id)a3 flags:(unsigned int)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFTRSession_handleEvent_flags___block_invoke;
  block[3] = &unk_1E5BBFDF8;
  unsigned int v12 = a4;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __33__SFTRSession_handleEvent_flags___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 48) & 1) == 0)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
LABEL_18:
    LogPrintF();
LABEL_28:
    id v11 = 0;
LABEL_29:
    objc_super v7 = 0;
    objc_super v5 = 0;
    goto LABEL_10;
  }
  CFDataGetTypeID();
  uint64_t v2 = CFDictionaryGetTypedValue();
  if (!v2)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize()) {
      goto LABEL_28;
    }
    goto LABEL_18;
  }
  id v11 = (id)v2;
  getTREventMessageClass[0]();
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = [*(id *)(a1 + 40) _decodeTRMessageData:v11 kindOfClass:v3];
  if (!v4)
  {
    if (gLogCategory_SFTRSession <= 90 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      id v10 = NSStringFromClass(v3);
      LogPrintF();
    }
    goto LABEL_29;
  }
  objc_super v5 = (void *)v4;
  id v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v7];
  if (v8)
  {
    v9 = (void (**)(void, void))v8;
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      [v11 length];
      LogPrintF();
    }
    ((void (**)(void, void *))v9)[2](v9, v5);
  }
  else if (gLogCategory_SFTRSession <= 90 {
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
LABEL_10:
}

- (void)handleRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke;
  v13[3] = &unk_1E5BBFC20;
  unsigned int v17 = a4;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

void __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 56) & 1) == 0)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
LABEL_16:
    LogPrintF();
LABEL_26:
    uint64_t v3 = 0;
LABEL_27:
    id v8 = 0;
    id v6 = 0;
    goto LABEL_10;
  }
  CFDataGetTypeID();
  uint64_t v2 = CFDictionaryGetTypedValue();
  if (!v2)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
    goto LABEL_16;
  }
  uint64_t v3 = (void *)v2;
  getTRRequestMessageClass[0]();
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 40) _decodeTRMessageData:v3 kindOfClass:v4];
  if (!v5)
  {
    if (gLogCategory_SFTRSession <= 90 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      id v11 = NSStringFromClass(v4);
      LogPrintF();
    }
    goto LABEL_27;
  }
  id v6 = (void *)v5;
  objc_super v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v8];
  if (v9)
  {
    id v10 = (void (**)(void, void, void))v9;
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      [v3 length];
      LogPrintF();
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke_2;
    v12[3] = &unk_1E5BC1E20;
    id v8 = v8;
    id v13 = v8;
    id v14 = *(id *)(a1 + 48);
    ((void (**)(void, void *, void *))v10)[2](v10, v6, v12);
  }
  else if (gLogCategory_SFTRSession <= 90 {
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
LABEL_10:
}

void __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = v6;
  if (!v5 && v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      v26 = @"trMsg";
      uint64_t v27 = v8;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
      {
        id v11 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v11);
        [v9 length];
        LogPrintF();
      }
      id v5 = 0;
      goto LABEL_19;
    }
    unsigned int v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28760];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v19 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v20 = (void *)v19;
    v21 = @"?";
    if (v19) {
      v21 = (__CFString *)v19;
    }
    v29 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v5 = [v17 errorWithDomain:v18 code:-6712 userInfo:v22];

    if (gLogCategory_SFTRSession <= 90 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
LABEL_16:
    id v10 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (gLogCategory_SFTRSession <= 60 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    id v25 = v5;
    LogPrintF();
  }
  if (!v5)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28760];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v9 = (void *)v14;
    v15 = @"?";
    if (v14) {
      v15 = (__CFString *)v14;
    }
    v31[0] = v15;
    id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1, v23, v25);
    id v5 = [v12 errorWithDomain:v13 code:-6700 userInfo:v16];

    goto LABEL_16;
  }
  id v10 = 0;
LABEL_20:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__SFTRSession_sendEvent___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __25__SFTRSession_sendEvent___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(a1 + 32) requiringSecureCoding:1 error:0];
  if (v4)
  {
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = v3;
      uint64_t v10 = [v4 length];
      LogPrintF();
    }
    v11[0] = @"op";
    v11[1] = @"trMsg";
    v12[0] = &unk_1EFA099B0;
    v12[1] = v4;
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, v11, 2, v9, v10);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(v6 + 72);
    if (v7)
    {
      (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v5, 1);
    }
    else
    {
      id v8 = *(void **)(v6 + 56);
      if (v8)
      {
        [v8 sendWithFlags:1 object:v5];
      }
      else if (gLogCategory_SFTRSession <= 90 {
             && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
    }
  }
  else if (gLogCategory_SFTRSession <= 90 {
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFTRSession_sendRequest_withResponseHandler___block_invoke;
  block[3] = &unk_1E5BBBC30;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __47__SFTRSession_sendRequest_withResponseHandler___block_invoke(void *a1)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1[4] requiringSecureCoding:1 error:0];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v25[0] = @"op";
    v25[1] = @"trMsg";
    v26[0] = &unk_1EFA099C8;
    v26[1] = v2;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__SFTRSession_sendRequest_withResponseHandler___block_invoke_158;
    aBlock[3] = &unk_1E5BC1E48;
    id v5 = (void *)a1[6];
    aBlock[4] = a1[5];
    id v22 = v5;
    id v6 = _Block_copy(aBlock);
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v7);
      uint64_t v20 = [v3 length];
      LogPrintF();
    }
    uint64_t v8 = a1[5];
    uint64_t v9 = *(void *)(v8 + 80);
    if (v9)
    {
      (*(void (**)(uint64_t, void *, uint64_t, void *))(v9 + 16))(v9, v4, 1, v6);
    }
    else
    {
      id v10 = *(void **)(v8 + 56);
      if (v10)
      {
        [v10 sendRequestWithFlags:1 object:v4 responseHandler:v6];
      }
      else
      {
        if (gLogCategory_SFTRSession <= 90
          && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        uint64_t v11 = a1[6];
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F28760];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
        v15 = (void *)v14;
        id v16 = @"?";
        if (v14) {
          id v16 = (__CFString *)v14;
        }
        v24 = v16;
        unsigned int v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1, v19, v20);
        uint64_t v18 = [v12 errorWithDomain:v13 code:-6753 userInfo:v17];
        (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v18, 0);
      }
    }
  }
  else if (gLogCategory_SFTRSession <= 90 {
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __47__SFTRSession_sendRequest_withResponseHandler___block_invoke_158(uint64_t a1, char a2, void *a3, void *a4)
{
  id v22 = a3;
  id v7 = a4;
  id v8 = v22;
  id v9 = v7;
  if (v22)
  {
    if (gLogCategory_SFTRSession <= 60)
    {
      if (gLogCategory_SFTRSession != -1 || (v19 = _LogCategory_Initialize(), id v8 = v22, v19))
      {
        LogPrintF();
        id v8 = v22;
      }
    }
    goto LABEL_26;
  }
  if ((a2 & 1) == 0)
  {
    uint64_t v16 = NSErrorWithOSStatusF();
    id v8 = (id)v16;
    if (gLogCategory_SFTRSession <= 90)
    {
      id v24 = (id)v16;
      if (gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize()) {
        goto LABEL_31;
      }
LABEL_21:
      LogPrintF();
LABEL_31:
      uint64_t v11 = 0;
LABEL_32:
      uint64_t v14 = 0;
      id v8 = v24;
      goto LABEL_10;
    }
LABEL_26:
    uint64_t v11 = 0;
    goto LABEL_27;
  }
  CFDataGetTypeID();
  uint64_t v10 = CFDictionaryGetTypedValue();
  if (!v10)
  {
    uint64_t v17 = NSErrorWithOSStatusF();
    id v8 = (id)v17;
    if (gLogCategory_SFTRSession <= 90)
    {
      id v24 = (id)v17;
      if (gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize()) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
    goto LABEL_26;
  }
  uint64_t v11 = (void *)v10;
  getTRResponseMessageClass[0]();
  id v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = [*(id *)(a1 + 32) _decodeTRMessageData:v11 kindOfClass:v12];
  if (!v13)
  {
    uint64_t v18 = NSErrorWithOSStatusF();
    id v8 = (id)v18;
    if (gLogCategory_SFTRSession <= 90)
    {
      id v24 = (id)v18;
      if (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize())
      {
        v21 = NSStringFromClass(v12);
        LogPrintF();
      }
      goto LABEL_32;
    }
LABEL_27:
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  uint64_t v14 = (void *)v13;
  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    v15 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v15);
    [v11 length];
    LogPrintF();
  }
  id v8 = 0;
LABEL_10:
  id v23 = v8;
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8);
}

- (void)setEventHandler:(id)a3 forEventClass:(Class)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SFTRSession_setEventHandler_forEventClass___block_invoke;
  block[3] = &unk_1E5BC1E70;
  id v10 = v6;
  Class v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __45__SFTRSession_setEventHandler_forEventClass___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    id v7 = NSStringFromClass(*(Class *)(a1 + 48));
    LogPrintF();
  }
  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;
  }
  id v8 = (id)objc_msgSend(*(id *)(a1 + 40), "copy", v7);
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = NSStringFromClass(*(Class *)(a1 + 48));
  [v5 setObject:v8 forKeyedSubscript:v6];
}

- (void)setRequestHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFTRSession_setRequestHandler_forRequestClass___block_invoke;
  block[3] = &unk_1E5BC1E70;
  id v10 = v6;
  Class v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __49__SFTRSession_setRequestHandler_forRequestClass___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    id v7 = NSStringFromClass(*(Class *)(a1 + 48));
    LogPrintF();
  }
  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;
  }
  id v8 = (id)objc_msgSend(*(id *)(a1 + 40), "copy", v7);
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = NSStringFromClass(*(Class *)(a1 + 48));
  [v5 setObject:v8 forKeyedSubscript:v6];
}

- (id)_decodeTRMessageData:(id)a3 kindOfClass:(Class)a4
{
  v15[6] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  id v7 = [v5 alloc];
  v15[0] = a4;
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  v15[5] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:6];
  id v9 = (void *)[v7 initWithArray:v8];

  id v14 = 0;
  id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v6 error:&v14];

  id v11 = v14;
  if (v10)
  {
    id v12 = v10;
  }
  else if (gLogCategory_SFTRSession <= 90 {
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }

  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (id)sendEventImpHandler
{
  return self->_sendEventImpHandler;
}

- (void)setSendEventImpHandler:(id)a3
{
}

- (id)sendRequestImpHandler
{
  return self->_sendRequestImpHandler;
}

- (void)setSendRequestImpHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendRequestImpHandler, 0);
  objc_storeStrong(&self->_sendEventImpHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);

  objc_storeStrong((id *)&self->_anisetteDataHandler, 0);
}

@end