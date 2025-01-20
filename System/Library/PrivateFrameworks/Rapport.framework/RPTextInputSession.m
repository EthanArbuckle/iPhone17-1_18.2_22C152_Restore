@interface RPTextInputSession
- (RPMessageable)messenger;
- (RPTextInputSession)init;
- (RTIInputSystemSourceSession)rtiSession;
- (id)rtiUpdatedHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleTextInputChange:(id)a3 started:(BOOL)a4;
- (void)_handleTextInputStarted:(id)a3;
- (void)_handleTextInputStopped:(id)a3;
- (void)_invalidate;
- (void)activateWithCompletion:(id)a3;
- (void)handleTextActionPayload:(id)a3;
- (void)invalidate;
- (void)performDocumentRequest:(id)a3 completion:(id)a4;
- (void)setMessenger:(id)a3;
- (void)setRtiUpdatedHandler:(id)a3;
@end

@implementation RPTextInputSession

- (RPTextInputSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPTextInputSession;
  v2 = [(RPTextInputSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__RPTextInputSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E605B650;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __45__RPTextInputSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_messenger;
  if (v5)
  {
    if (gLogCategory_RPTextInputSession <= 30
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v16 = @"statusFlags";
    v17[0] = &unk_1F0C37750;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    messenger = self->_messenger;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke;
    v15[3] = &unk_1E605D1D8;
    v15[4] = self;
    [(RPMessageable *)messenger registerEventID:@"_tiStarted" options:v7 handler:v15];
    v9 = self->_messenger;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_2;
    v14[3] = &unk_1E605D1D8;
    v14[4] = self;
    [(RPMessageable *)v9 registerEventID:@"_tiStopped" options:v7 handler:v14];
    id v10 = self->_messenger;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_3;
    v13[3] = &unk_1E605D1D8;
    v13[4] = self;
    [(RPMessageable *)v10 registerEventID:@"_tiC" options:v7 handler:v13];
    self->_started = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_4;
    v11[3] = &unk_1E605CEF0;
    v11[4] = self;
    id v12 = v4;
    [(RPMessageable *)v5 sendRequestID:@"_tiStart" request:MEMORY[0x1E4F1CC08] destinationID:@"rapport:rdid:DirectPeer" options:0 responseHandler:v11];
  }
  else
  {
    objc_super v6 = RPErrorF();
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v6);
    }
  }
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputStarted:a2];
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputStopped:a2];
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputChange:a2 started:0];
}

void __46__RPTextInputSession__activateWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
LABEL_13:
    }
      (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    if (gLogCategory_RPTextInputSession <= 30
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1 + 32) _handleTextInputChange:v10 started:1];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      goto LABEL_13;
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__RPTextInputSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPTextInputSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(RPMessageable *)self->_messenger deregisterEventID:@"_tiStarted"];
  [(RPMessageable *)self->_messenger deregisterEventID:@"_tiStopped"];
  [(RPMessageable *)self->_messenger deregisterEventID:@"_tiC"];
  if (self->_started)
  {
    self->_started = 0;
    [(RPMessageable *)self->_messenger sendRequestID:@"_tiStop" request:MEMORY[0x1E4F1CC08] destinationID:@"rapport:rdid:DirectPeer" options:0 responseHandler:&__block_literal_global_17];
  }
  messenger = self->_messenger;
  self->_messenger = 0;

  [(RTIInputSystemSourceSession *)self->_rtiSession setPayloadDelegate:0];
  rtiSession = self->_rtiSession;
  self->_rtiSession = 0;

  id rtiUpdatedHandler = self->_rtiUpdatedHandler;
  self->_id rtiUpdatedHandler = 0;
}

void __33__RPTextInputSession__invalidate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPTextInputSession <= 30 {
         && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

- (void)_handleTextInputStarted:(id)a3
{
  id v6 = a3;
  CFDataGetTypeID();
  id v4 = CFDictionaryGetTypedValue();
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [v4 length];
    LogPrintF();
  }
  -[RPTextInputSession _handleTextInputChange:started:](self, "_handleTextInputChange:started:", v6, 1, v5);
}

- (void)_handleTextInputStopped:(id)a3
{
  id v8 = a3;
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_rtiSession)
  {
    id v4 = [(Class)getRTIDataPayloadClass[0]() payloadWithData:0];
    [(RTIInputSystemSourceSession *)self->_rtiSession handleTextActionPayload:v4];
    [(RTIInputSystemSourceSession *)self->_rtiSession setPayloadDelegate:0];
    rtiSession = self->_rtiSession;
    self->_rtiSession = 0;

    uint64_t v6 = MEMORY[0x1B3EBCC80](self->_rtiUpdatedHandler);
    id v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
  }
}

- (void)_handleTextInputChange:(id)a3 started:(BOOL)a4
{
  id v15 = a3;
  CFDataGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue();
  if (v6)
  {
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
    id v8 = [(Class)getRTIDataPayloadClass[0]() payloadWithData:v6 version:Int64Ranged];
    if (v8)
    {
      if (!a4
        && gLogCategory_RPTextInputSession <= 20
        && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v14 = [v6 length];
        LogPrintF();
      }
      rtiSession = self->_rtiSession;
      if (!rtiSession)
      {
        id v10 = (RTIInputSystemSourceSession *)objc_alloc_init((Class)getRTIInputSystemSourceSessionClass[0]());
        v11 = self->_rtiSession;
        self->_rtiSession = v10;

        [(RTIInputSystemSourceSession *)self->_rtiSession setPayloadDelegate:self];
        uint64_t v12 = MEMORY[0x1B3EBCC80](self->_rtiUpdatedHandler);
        v13 = (void *)v12;
        if (v12) {
          (*(void (**)(uint64_t))(v12 + 16))(v12);
        }

        rtiSession = self->_rtiSession;
      }
      -[RTIInputSystemSourceSession handleTextActionPayload:](rtiSession, "handleTextActionPayload:", v8, v14);
    }
    else if (gLogCategory_RPTextInputSession <= 60 {
           && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
}

- (void)handleTextActionPayload:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__RPTextInputSession_handleTextActionPayload___block_invoke;
  v7[3] = &unk_1E605B5D8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__RPTextInputSession_handleTextActionPayload___block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v2 = [*(id *)(a1 + 32) data];
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "version"));
    [v6 setObject:v4 forKeyedSubscript:@"_tiV"];
  }
  if (v2) {
    [v6 setObject:v2 forKeyedSubscript:@"_tiD"];
  }
  if (gLogCategory_RPTextInputSession <= 10
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [v2 length];
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "sendEventID:event:destinationID:options:completion:", @"_tiC", v6, @"rapport:rdid:DirectPeer", 0, &__block_literal_global_52, v5);
}

void __46__RPTextInputSession_handleTextActionPayload___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_RPTextInputSession <= 90)
    {
      id v5 = v2;
      if (gLogCategory_RPTextInputSession != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
      {
        LogPrintF();
        v3 = v5;
      }
    }
  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_RPTextInputSession <= 90
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (RTIInputSystemSourceSession)rtiSession
{
  return self->_rtiSession;
}

- (id)rtiUpdatedHandler
{
  return self->_rtiUpdatedHandler;
}

- (void)setRtiUpdatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rtiUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_rtiSession, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end