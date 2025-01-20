@interface SKSetupBase
- (BOOL)_runSteps;
- (BOOL)conditionalPersistent;
- (BOOL)persistentPairing;
- (BOOL)reversePairing;
- (CUMessageSession)messageSessionTemplate;
- (NSData)authTagOverride;
- (NSData)pskData;
- (NSString)description;
- (NSString)label;
- (NSString)password;
- (OS_dispatch_queue)dispatchQueue;
- (SKDevice)peerDevice;
- (SKSetupBase)initWithLogCategory:(LogCategory *)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)eventHandler;
- (id)passwordTypeChangedHandler;
- (id)sendDataHandler;
- (int)passwordType;
- (int)setupType;
- (unsigned)bluetoothUseCase;
- (unsigned)controlFlags;
- (void)_addStep:(id)a3;
- (void)_completeWithError:(id)a3;
- (void)_completedStep:(id)a3 error:(id)a4;
- (void)_connectionStartWithSKConnection:(id)a3 clientMode:(BOOL)a4 completeOnFailure:(BOOL)a5 completion:(id)a6;
- (void)_invalidate;
- (void)_invalidateSteps;
- (void)_invalidated;
- (void)_pairSetupConfig:(id)a3;
- (void)_postEvent:(id)a3;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_reportEvent:(id)a3;
- (void)_reportEventType:(int)a3;
- (void)_setupMessageSession;
- (void)_tearDownMessageSession;
- (void)activate;
- (void)addStep:(id)a3;
- (void)dealloc;
- (void)deregisterEventID:(id)a3 completionHandler:(id)a4;
- (void)deregisterRequestID:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)postEvent:(id)a3;
- (void)postEventType:(int)a3;
- (void)receivedData:(id)a3;
- (void)registerEventID:(id)a3 options:(id)a4 eventHandler:(id)a5 completionHandler:(id)a6;
- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6;
- (void)reportEvent:(id)a3;
- (void)reportEventType:(int)a3;
- (void)sendEventID:(id)a3 eventMessage:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)sendRequestID:(id)a3 requestMessage:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAuthTagOverride:(id)a3;
- (void)setBluetoothUseCase:(unsigned int)a3;
- (void)setConditionalPersistent:(BOOL)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPasswordTypeChangedHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPersistentPairing:(BOOL)a3;
- (void)setPskData:(id)a3;
- (void)setReversePairing:(BOOL)a3;
- (void)setSendDataHandler:(id)a3;
- (void)setSetupType:(int)a3;
@end

@implementation SKSetupBase

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passwordTypeChangedHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_messageSessionServer, 0);
  objc_storeStrong((id *)&self->_stepCurrent, 0);
  objc_storeStrong((id *)&self->_stepArray, 0);
  objc_storeStrong((id *)&self->_skCnx, 0);
  objc_storeStrong(&self->_sendDataHandler, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_authTagOverride, 0);
}

- (void)setSetupType:(int)a3
{
  self->_setupType = a3;
}

- (int)setupType
{
  return self->_setupType;
}

- (void)setSendDataHandler:(id)a3
{
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setReversePairing:(BOOL)a3
{
  self->_reversePairing = a3;
}

- (BOOL)reversePairing
{
  return self->_reversePairing;
}

- (void)setPskData:(id)a3
{
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPersistentPairing:(BOOL)a3
{
  self->_persistentPairing = a3;
}

- (BOOL)persistentPairing
{
  return self->_persistentPairing;
}

- (void)setPeerDevice:(id)a3
{
}

- (SKDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPasswordTypeChangedHandler:(id)a3
{
}

- (id)passwordTypeChangedHandler
{
  return self->_passwordTypeChangedHandler;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setEventHandler:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setConditionalPersistent:(BOOL)a3
{
  self->_conditionalPersistent = a3;
}

- (BOOL)conditionalPersistent
{
  return self->_conditionalPersistent;
}

- (void)setBluetoothUseCase:(unsigned int)a3
{
  self->_bluetoothUseCase = a3;
}

- (unsigned)bluetoothUseCase
{
  return self->_bluetoothUseCase;
}

- (void)setAuthTagOverride:(id)a3
{
}

- (NSData)authTagOverride
{
  return self->_authTagOverride;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)_runSteps
{
  p_stepCurrent = &self->_stepCurrent;
  if (self->_stepCurrent) {
    return 0;
  }
  v4 = [(NSMutableArray *)self->_stepArray popFirstObject];
  BOOL v3 = v4 == 0;
  if (v4)
  {
    objc_storeStrong((id *)p_stepCurrent, v4);
    [v4 activate];
  }

  return v3;
}

- (void)_invalidateSteps
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(SKStepable *)self->_stepCurrent setSkCompletionHandler:0];
  [(SKStepable *)self->_stepCurrent invalidate];
  stepCurrent = self->_stepCurrent;
  self->_stepCurrent = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_stepArray;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setSkCompletionHandler:", 0, (void)v11);
        [v9 invalidate];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_stepArray removeAllObjects];
  stepArray = self->_stepArray;
  self->_stepArray = 0;
}

- (void)_completedStep:(id)a3 error:(id)a4
{
  long long v13 = (SKStepable *)a3;
  id v6 = a4;
  if (self->_stepCurrent == v13)
  {
    id v8 = v6;
    int var0 = self->_ucat->var0;
    if (v8)
    {
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        long long v12 = CUPrintNSError();
        long long v11 = v13;
        LogPrintF();
      }
    }
    else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      long long v11 = v13;
      LogPrintF();
    }
    [(SKStepable *)v13 invalidate];
    stepCurrent = self->_stepCurrent;
    self->_stepCurrent = 0;

    if (v8) {
      [(SKSetupBase *)self _completeWithError:v8];
    }
    else {
      [(SKSetupBase *)self _run];
    }
    goto LABEL_20;
  }
  int v7 = self->_ucat->var0;
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_20:
  }
}

- (void)_addStep:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v12, v6))
    {
      id v11 = v4;
      LogPrintF();
      id v4 = v12;
    }
  }
  int v7 = objc_msgSend(v4, "skSetupObject", v11);

  if (!v7) {
    [v12 setSkSetupObject:self];
  }
  stepArray = self->_stepArray;
  if (!stepArray)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v10 = self->_stepArray;
    self->_stepArray = v9;

    stepArray = self->_stepArray;
  }
  [(NSMutableArray *)stepArray addObject:v12];
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23__SKSetupBase_addStep___block_invoke;
  v7[3] = &unk_2645494C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __23__SKSetupBase_addStep___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addStep:*(void *)(a1 + 40)];
}

- (void)_tearDownMessageSession
{
  [(CUMessageSession *)self->_messageSessionTemplate invalidate];
  messageSessionTemplate = self->_messageSessionTemplate;
  self->_messageSessionTemplate = 0;

  [(CUMessageSessionServer *)self->_messageSessionServer invalidate];
  messageSessionServer = self->_messageSessionServer;
  self->_messageSessionServer = 0;
}

- (void)_setupMessageSession
{
  if (!self->_messageSessionServer)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = (CUMessageSessionServer *)objc_alloc_init(MEMORY[0x263F38570]);
    messageSessionServer = self->_messageSessionServer;
    self->_messageSessionServer = v4;

    [(CUMessageSessionServer *)self->_messageSessionServer setDispatchQueue:self->_dispatchQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__SKSetupBase__setupMessageSession__block_invoke;
    v11[3] = &unk_264548F58;
    v11[4] = self;
    [(CUMessageSessionServer *)self->_messageSessionServer setRegisterRequestHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__SKSetupBase__setupMessageSession__block_invoke_6;
    v10[3] = &unk_264548F80;
    v10[4] = self;
    [(CUMessageSessionServer *)self->_messageSessionServer setDeregisterRequestHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__SKSetupBase__setupMessageSession__block_invoke_8;
    v9[3] = &unk_264548FD0;
    v9[4] = self;
    [(CUMessageSessionServer *)self->_messageSessionServer setSendRequestHandler:v9];
    [(CUMessageSessionServer *)self->_messageSessionServer activate];
    id v6 = [(CUMessageSessionServer *)self->_messageSessionServer templateSession];
    messageSessionTemplate = self->_messageSessionTemplate;
    self->_messageSessionTemplate = v6;

    if (!self->_messageSessionTemplate)
    {
      int v8 = self->_ucat->var0;
      if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

void __35__SKSetupBase__setupMessageSession__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v9 = v8;
  v10 = *(void **)(a1 + 32);
  if (v10[20])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__SKSetupBase__setupMessageSession__block_invoke_2;
    v13[3] = &unk_264548F30;
    id v14 = v8;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__SKSetupBase__setupMessageSession__block_invoke_5;
    v11[3] = &unk_2645496B0;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v7;
    [v10 registerRequestID:v12 options:a3 requestHandler:v13 completionHandler:v11];
  }
}

void *__35__SKSetupBase__setupMessageSession__block_invoke_6(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[20]) {
    return (void *)[result deregisterRequestID:a2 completionHandler:&__block_literal_global_66];
  }
  return result;
}

void __35__SKSetupBase__setupMessageSession__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  v10 = v9;
  id v11 = *(void **)(a1 + 32);
  if (v11[20])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_9;
    v12[3] = &unk_264548FA8;
    id v13 = v9;
    [v11 sendRequestID:a2 requestMessage:a4 options:a3 responseHandler:v12];
  }
}

void __35__SKSetupBase__setupMessageSession__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v7 = a2;
  uint64_t v6 = NSErrorToOSStatus();
  (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, v6, v5, v7);
}

void __35__SKSetupBase__setupMessageSession__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  uint64_t v9 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_3;
  v12[3] = &unk_264548F08;
  id v13 = v8;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v9 + 16);
  id v11 = v8;
  v10(v9, a4, a3, v12);
}

uint64_t __35__SKSetupBase__setupMessageSession__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    int v5 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
    if (v5 <= 90)
    {
      id v8 = v3;
      if (v5 != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v8, v3))
      {
        id v7 = CUPrintNSError();
        LogPrintF();

        id v4 = v8;
      }
    }
  }

  return MEMORY[0x270F9A758](v3, v4);
}

void __35__SKSetupBase__setupMessageSession__block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08410];
    uint64_t v8 = a2;
    id v9 = a4;
    id v10 = a3;
    id v12 = [v6 errorWithDomain:v7 code:v8 userInfo:0];
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v9, v10);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, id))(v5 + 16);
    id v10 = a4;
    id v12 = a3;
    v11(v5, v10);
  }
}

- (CUMessageSession)messageSessionTemplate
{
  messageSessionTemplate = self->_messageSessionTemplate;
  if (!messageSessionTemplate)
  {
    [(SKSetupBase *)self _setupMessageSession];
    messageSessionTemplate = self->_messageSessionTemplate;
  }

  return messageSessionTemplate;
}

- (void)sendRequestID:(id)a3 requestMessage:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SKSetupBase_sendRequestID_requestMessage_options_responseHandler___block_invoke;
  block[3] = &unk_264548EE0;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

void __68__SKSetupBase_sendRequestID_requestMessage_options_responseHandler___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 120);
  id v6 = v2;
  if (v2)
  {
    [v2 sendRequestID:a1[5] request:a1[6] options:a1[7] responseHandler:a1[8]];
  }
  else
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = a1[8];
    uint64_t v5 = NSErrorF_safe();
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
}

- (void)deregisterRequestID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SKSetupBase_deregisterRequestID_completionHandler___block_invoke;
  block[3] = &unk_264548EB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __53__SKSetupBase_deregisterRequestID_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  int v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[4], v4))
    {
      uint64_t v7 = a1[5];
      LogPrintF();
      uint64_t v2 = a1[4];
    }
  }
  objc_msgSend(*(id *)(v2 + 88), "setObject:forKeyedSubscript:", 0, a1[5], v7);
  uint64_t v5 = *(uint64_t (**)(void))(a1[6] + 16);

  return v5();
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SKSetupBase_registerRequestID_options_requestHandler_completionHandler___block_invoke;
  block[3] = &unk_264548E90;
  block[4] = self;
  id v20 = v10;
  id v22 = v13;
  id v23 = v12;
  id v21 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

void __74__SKSetupBase_registerRequestID_options_requestHandler_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];

  int v3 = **(_DWORD **)(a1[4] + 144);
  if (v2)
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = a1[7];
    NSErrorF_safe();
    id v10 = (SKRequestRegistration *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, SKRequestRegistration *))(v4 + 16))(v4, v10);
  }
  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = a1[5];
      LogPrintF();
    }
    id v10 = objc_alloc_init(SKRequestRegistration);
    [(SKRequestRegistration *)v10 setHandler:a1[8]];
    [(SKRequestRegistration *)v10 setOptions:a1[6]];
    [(SKRequestRegistration *)v10 setRequestID:a1[5]];
    uint64_t v5 = *(void **)(a1[4] + 88);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v7 = a1[4];
      uint64_t v8 = *(void **)(v7 + 88);
      *(void *)(v7 + 88) = v6;

      uint64_t v5 = *(void **)(a1[4] + 88);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, a1[5], v9);
    (*(void (**)(void, void))(a1[7] + 16))(a1[7], 0);
  }
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(NSMutableDictionary *)self->_registeredRequests objectForKeyedSubscript:v17];
  uint64_t v14 = [v13 handler];
  id v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, id, id, id, id))(v14 + 16))(v14, v17, v10, v11, v12);
  }
  else
  {
    id v16 = NSErrorF_safe();
    (*((void (**)(id, void, void, void *, void *))v12 + 2))(v12, 0, 0, v16, &__block_literal_global_865);
  }
}

- (void)sendEventID:(id)a3 eventMessage:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SKSetupBase_sendEventID_eventMessage_options_completionHandler___block_invoke;
  block[3] = &unk_264548EE0;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

void __66__SKSetupBase_sendEventID_eventMessage_options_completionHandler___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 120);
  id v6 = v2;
  if (v2)
  {
    [v2 sendEventID:a1[5] event:a1[6] options:a1[7] completion:a1[8]];
  }
  else
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = a1[8];
    uint64_t v5 = NSErrorF_safe();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)deregisterEventID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SKSetupBase_deregisterEventID_completionHandler___block_invoke;
  block[3] = &unk_264548EB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__SKSetupBase_deregisterEventID_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  int v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = a1[4], v4))
    {
      uint64_t v7 = a1[5];
      LogPrintF();
      uint64_t v2 = a1[4];
    }
  }
  objc_msgSend(*(id *)(v2 + 80), "setObject:forKeyedSubscript:", 0, a1[5], v7);
  uint64_t v5 = *(uint64_t (**)(void))(a1[6] + 16);

  return v5();
}

- (void)registerEventID:(id)a3 options:(id)a4 eventHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__SKSetupBase_registerEventID_options_eventHandler_completionHandler___block_invoke;
  block[3] = &unk_264548E90;
  block[4] = self;
  id v20 = v10;
  id v22 = v13;
  id v23 = v12;
  id v21 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(dispatchQueue, block);
}

void __70__SKSetupBase_registerEventID_options_eventHandler_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKeyedSubscript:a1[5]];

  int v3 = **(_DWORD **)(a1[4] + 144);
  if (v2)
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = a1[7];
    NSErrorF_safe();
    id v10 = (SKEventRegistration *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, SKEventRegistration *))(v4 + 16))(v4, v10);
  }
  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = a1[5];
      LogPrintF();
    }
    id v10 = objc_alloc_init(SKEventRegistration);
    [(SKEventRegistration *)v10 setEventID:a1[5]];
    [(SKEventRegistration *)v10 setHandler:a1[8]];
    [(SKEventRegistration *)v10 setOptions:a1[6]];
    uint64_t v5 = *(void **)(a1[4] + 80);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v7 = a1[4];
      uint64_t v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;

      uint64_t v5 = *(void **)(a1[4] + 80);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, a1[5], v9);
    (*(void (**)(void, void))(a1[7] + 16))(a1[7], 0);
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_registeredEvents objectForKeyedSubscript:v12];
  id v11 = [v10 handler];

  if (v11) {
    ((void (**)(void, id, id, id))v11)[2](v11, v12, v8, v9);
  }
}

- (void)_pairSetupConfig:(id)a3
{
  CFDictionaryGetInt64Ranged();
  id passwordTypeChangedHandler = self->_passwordTypeChangedHandler;
  if (passwordTypeChangedHandler)
  {
    uint64_t v5 = (void (*)(void))*((void *)passwordTypeChangedHandler + 2);
    v5();
  }
}

- (void)_connectionStartWithSKConnection:(id)a3 clientMode:(BOOL)a4 completeOnFailure:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__872;
  v41 = __Block_byref_object_dispose__873;
  id v42 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke;
  v33[3] = &unk_264548E40;
  v35 = &v37;
  v33[4] = self;
  id v12 = v11;
  id v34 = v12;
  BOOL v36 = a5;
  id v13 = (void (**)(void))MEMORY[0x223C632B0](v33);
  [(SKConnection *)self->_skCnx invalidate];
  if (v10) {
    uint64_t v14 = (SKConnection *)v10;
  }
  else {
    uint64_t v14 = objc_alloc_init(SKConnection);
  }
  id v15 = v14;
  objc_storeStrong((id *)&self->_skCnx, v14);
  [(SKConnection *)v15 setBluetoothUseCase:self->_bluetoothUseCase];
  [(SKConnection *)v15 setClientMode:v8];
  [(SKConnection *)v15 setConditionalPersistent:self->_conditionalPersistent];
  [(SKConnection *)v15 setDispatchQueue:self->_dispatchQueue];
  [(SKConnection *)v15 setPassword:self->_password];
  [(SKConnection *)v15 setPasswordType:self->_passwordType];
  [(SKConnection *)v15 setPersistentPairing:self->_persistentPairing];
  [(SKConnection *)v15 setPskData:self->_pskData];
  [(SKConnection *)v15 setReversePairing:self->_reversePairing];
  [(SKConnection *)v15 setSendDataHandler:self->_sendDataHandler];
  if (v8 && !self->_sendDataHandler)
  {
    id v16 = self->_peerDevice;
    if (!v16)
    {
      uint64_t v19 = NSErrorF_safe();
      id v20 = (void *)v38[5];
      v38[5] = v19;

      goto LABEL_13;
    }
    id v17 = v16;
    [(SKConnection *)v15 setBlePeerDevice:v16];
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_2;
  v32[3] = &unk_2645491E8;
  v32[4] = self;
  [(SKConnection *)v15 setAuthCompletionHandler:v32];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_3;
  v31[3] = &unk_264549238;
  v31[4] = self;
  [(SKConnection *)v15 setAuthPromptHandler:v31];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_4;
  v30[3] = &unk_264549260;
  v30[4] = self;
  [(SKConnection *)v15 setAuthShowPasswordHandler:v30];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_5;
  v29[3] = &unk_2645496B0;
  v29[4] = v15;
  v29[5] = self;
  [(SKConnection *)v15 setErrorHandler:v29];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_6;
  v28[3] = &unk_2645494C0;
  v28[4] = self;
  v28[5] = v15;
  [(SKConnection *)v15 setInvalidationHandler:v28];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_7;
  v27[3] = &unk_264549288;
  v27[4] = self;
  [(SKConnection *)v15 setPairSetupConfigHandler:v27];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_8;
  v26[3] = &unk_2645492B0;
  v26[4] = v15;
  v26[5] = self;
  [(SKConnection *)v15 setReceivedEventHandler:v26];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_9;
  v25[3] = &unk_264549688;
  v25[4] = v15;
  v25[5] = self;
  [(SKConnection *)v15 setReceivedRequestHandler:v25];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_10;
  v24[3] = &unk_2645494C0;
  v24[4] = v15;
  v24[5] = self;
  [(SKConnection *)v15 setStateChangedHandler:v24];
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_11;
  v21[3] = &unk_264548E68;
  v21[4] = v15;
  v21[5] = self;
  id v22 = v12;
  BOOL v23 = a5;
  [(SKConnection *)v15 activateWithCompletion:v21];

LABEL_13:
  v13[2](v13);

  _Block_object_dispose(&v37, 8);
}

uint64_t __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      return [v4 _completeWithError:v5];
    }
  }
  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[SKEvent alloc] initWithEventType:140 error:v3];

  [*(id *)(a1 + 32) _reportEvent:v4];
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [[SKAuthenticationRequestEvent alloc] initWithPasswordType:a2 pairingFlags:a3 throttleSeconds:a4];
  [*(id *)(a1 + 32) _reportEvent:v5];
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [[SKAuthenticationPresentEvent alloc] initWithPasswordType:a2 password:v5];

  [*(id *)(a1 + 32) _reportEvent:v6];
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    id v9 = v3;
    int v5 = **(_DWORD **)(v4 + 144);
    if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
    {
      BOOL v8 = CUPrintNSError();
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = 0;

    [*(id *)(a1 + 40) _run];
    id v3 = v9;
  }
}

int *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(int **)(v2 + 144);
  if (*result <= 30)
  {
    if (*result != -1 || (result = (int *)_LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), result))
    {
      uint64_t result = (int *)LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4 == *(void **)(v2 + 120))
  {
    *(void *)(v2 + 120) = 0;

    [*(id *)(a1 + 32) _connectionEnded:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _reportEventType:41];
    int v5 = *(void **)(a1 + 32);
    return (int *)[v5 _run];
  }
  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[18];
  id v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      uint64_t v7 = CUPrintNSObjectOneLine();
      LogPrintF();

      id v3 = v8;
      uint64_t v4 = *(_DWORD ***)(a1 + 32);
    }
    else
    {
      id v3 = v8;
    }
  }
  objc_msgSend(v4, "_pairSetupConfig:", v3, v7);
}

void *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v5 == result[15]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[15]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

void *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[15]) {
    return (void *)[result _run];
  }
  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v13 = v3;
  if (v4 == *(void **)(v5 + 120))
  {
    int v8 = **(_DWORD **)(v5 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        id v11 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v11);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 120);
      *(void *)(v9 + 120) = 0;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      if (*(unsigned char *)(a1 + 56)) {
        [*(id *)(a1 + 40) _completeWithError:v13];
      }
      goto LABEL_19;
    }
    if (v8 <= 30)
    {
      if (v8 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_18;
        }
        uint64_t v4 = *(void **)(a1 + 32);
      }
      id v11 = v4;
      LogPrintF();
    }
LABEL_18:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
    [*(id *)(a1 + 40) _reportEventType:40];
LABEL_19:
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    goto LABEL_20;
  }
  uint64_t v6 = NSErrorF_safe();
  int v7 = **(_DWORD **)(*(void *)(a1 + 40) + 144);
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    id v12 = CUPrintNSError();
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  [*(id *)(a1 + 40) _run];

LABEL_20:
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__SKSetupBase_receivedData___block_invoke;
  v7[3] = &unk_2645494C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __28__SKSetupBase_receivedData___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) receivedData:*(void *)(a1 + 40)];
}

- (void)_reportEventType:(int)a3
{
  id v4 = [[SKEvent alloc] initWithEventType:*(void *)&a3];
  [(SKSetupBase *)self _reportEvent:v4];
}

- (void)reportEventType:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SKSetupBase_reportEventType___block_invoke;
  v4[3] = &unk_264548E18;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __31__SKSetupBase_reportEventType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportEventType:*(unsigned int *)(a1 + 40)];
}

- (void)_reportEvent:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v5 = MEMORY[0x223C632B0](self->_eventHandler);
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

- (void)reportEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__SKSetupBase_reportEvent___block_invoke;
  v7[3] = &unk_2645494C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __27__SKSetupBase_reportEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportEvent:*(void *)(a1 + 40)];
}

- (void)_postEvent:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v12, v6))
    {
      id v11 = v4;
      LogPrintF();
      id v4 = v12;
    }
  }
  if (objc_msgSend(v4, "eventType", v11) == 130)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v12;
      id v8 = [v7 password];
      if (v8)
      {
        [(SKConnection *)self->_skCnx tryPassword:v8];
      }
      else
      {
        int v10 = self->_ucat->var0;
        if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
      }
    }
    else
    {
      int v9 = self->_ucat->var0;
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        objc_opt_class();
        LogPrintF();
      }
    }
  }
}

- (void)postEventType:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__SKSetupBase_postEventType___block_invoke;
  v4[3] = &unk_264548E18;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __29__SKSetupBase_postEventType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [[SKEvent alloc] initWithEventType:*(unsigned int *)(a1 + 40)];
  [v1 _postEvent:v2];
}

- (void)postEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__SKSetupBase_postEvent___block_invoke;
  v7[3] = &unk_2645494C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __25__SKSetupBase_postEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postEvent:*(void *)(a1 + 40)];
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v9 = v4;
  if (v4)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSError();
      LogPrintF();
    }
    int v6 = 3;
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v6 = 4;
  }
  self->_runState = v6;
  id v7 = [[SKEvent alloc] initWithEventType:20 error:v9];
  [(SKSetupBase *)self _reportEvent:v7];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    [(SKSetupBase *)self _reportEventType:30];
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = 0;

    id passwordTypeChangedHandler = self->_passwordTypeChangedHandler;
    self->_id passwordTypeChangedHandler = 0;

    id sendDataHandler = self->_sendDataHandler;
    self->_id sendDataHandler = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_invalidate
{
  [(SKSetupBase *)self _invalidateSteps];
  registeredEvents = self->_registeredEvents;
  self->_registeredEvents = 0;

  registeredRequests = self->_registeredRequests;
  self->_registeredRequests = 0;

  [(SKConnection *)self->_skCnx invalidate];
  skCnx = self->_skCnx;
  self->_skCnx = 0;

  [(SKSetupBase *)self _tearDownMessageSession];

  [(SKSetupBase *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__SKSetupBase_invalidate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__SKSetupBase_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 40) = 1;
    id v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        id v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    return [v3 _invalidate];
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__SKSetupBase_activate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

int *__23__SKSetupBase_activate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(int **)(v2 + 144);
  int v4 = *result;
  if (*(unsigned char *)(v2 + 40))
  {
    if (v4 <= 90)
    {
      if (v4 != -1 || (uint64_t result = (int *)_LogCategory_Initialize(), result))
      {
        return (int *)LogPrintF();
      }
    }
  }
  else
  {
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    return (int *)[(id)v2 _activate];
  }
  return result;
}

- (void)setPasswordType:(int)a3
{
  int passwordType = self->_passwordType;
  self->_int passwordType = a3;
  if (passwordType != a3 && self->_activateCalled)
  {
    dispatchQueue = self->_dispatchQueue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __31__SKSetupBase_setPasswordType___block_invoke;
    v5[3] = &unk_264548E18;
    v5[4] = self;
    int v6 = a3;
    dispatch_async(dispatchQueue, v5);
  }
}

uint64_t __31__SKSetupBase_setPasswordType___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) updatePasswordType:*(unsigned int *)(a1 + 40)];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    id v13 = [(id)objc_opt_class() description];
    CUAppendF();
    id v4 = 0;
  }
  uint64_t v14 = CUPrintFlags32();
  CUAppendF();
  id v5 = v4;

  pskData = self->_pskData;
  if (pskData)
  {
    id v7 = pskData;
    [(NSData *)v7 length];
    CUAppendF();
    id v8 = v5;

    id v5 = v8;
  }
  CUAppendF();
  id v9 = (__CFString *)v5;

  int v10 = &stru_26D1CA560;
  if (v9) {
    int v10 = v9;
  }
  id v11 = v10;

  return v11;
}

- (NSString)description
{
  return (NSString *)[(SKSetupBase *)self descriptionWithLevel:50];
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKSetupBase;
  [(SKSetupBase *)&v4 dealloc];
}

- (SKSetupBase)initWithLogCategory:(LogCategory *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKSetupBase;
  objc_super v4 = [(SKSetupBase *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dispatchQueue, MEMORY[0x263EF83A0]);
    v5->_ucat = a3;
    v5->_ucatBase = a3;
    int v6 = v5;
  }

  return v5;
}

@end