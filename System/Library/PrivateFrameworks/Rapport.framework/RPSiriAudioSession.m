@interface RPSiriAudioSession
+ (BOOL)supportsSecureCoding;
- (NSString)label;
- (NSString)sessionID;
- (OS_dispatch_queue)dispatchQueue;
- (RPSiriAudioSession)init;
- (RPSiriAudioSession)initWithCoder:(id)a3;
- (RPSiriAudioSessionDelegate)delegate;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)receivedSiriAudioEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSessionID:(id)a3;
- (void)xpcSiriStopClientRecordingWithDeviceId:(id)a3;
@end

@implementation RPSiriAudioSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPSiriAudioSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPSiriAudioSession;
  v2 = [(RPSiriAudioSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPSiriAudioSession;
    v4 = v3;
  }

  return v3;
}

- (RPSiriAudioSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPSiriAudioSession;
  v5 = [(RPSiriAudioSession *)&v10 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPSiriAudioSession;
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
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
  v4.super_class = (Class)RPSiriAudioSession;
  [(RPSiriAudioSession *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  sessionID = self->_sessionID;
  if (sessionID) {
    [a3 encodeObject:sessionID forKey:@"sid"];
  }
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;
  return v2;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__RPSiriAudioSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __45__RPSiriAudioSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v2 = *(void **)(a1 + 32);
  if (!v2[8])
  {
    NSRandomData();
    id v3 = objc_claimAutoreleasedReturnValue();
    [v3 bytes];
    [v3 length];
    [v3 length];
    uint64_t v4 = NSPrintF();
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    id v2 = *(void **)(a1 + 32);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  return [v2 _activateWithCompletion:v7 reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  [(RPSiriAudioSession *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_1E605BCF0;
  BOOL v17 = v4;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  objc_super v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_1E605BCF0;
  BOOL v14 = v4;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 xpcSiriAudioSessionActivate:self completion:v12];
}

void __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
  id v8 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = v8, v5))
      {
LABEL_7:
        LogPrintF();
        id v3 = v8;
      }
    }
  }
  else if (v4 <= 90)
  {
    if (v4 != -1) {
      goto LABEL_7;
    }
    int v6 = _LogCategory_Initialize();
    id v3 = v8;
    if (v6) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
    id v3 = v8;
  }
}

void __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
  id v7 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize())) {
LABEL_15:
      }
        LogPrintF();
    }
    else if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
      goto LABEL_15;
    }
  }
  else if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = v7;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    int v6 = v7;
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.rapport.siri-audio" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C42EC8];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__RPSiriAudioSession__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E605B540;
    v9[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__RPSiriAudioSession__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v8];
    int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C482C0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t __39__RPSiriAudioSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __39__RPSiriAudioSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_activateCalled) {
    [(RPSiriAudioSession *)self _activateWithCompletion:0 reactivate:1];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    uint64_t v5 = (void (*)(void))*((void *)interruptionHandler + 2);
    v5();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__RPSiriAudioSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPSiriAudioSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    uint64_t v3 = *(void *)(result + 32);
    int v4 = **(_DWORD **)(v3 + 16);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(void *)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(v2 + 32);
      }
    }
    [*(id *)(v3 + 24) invalidate];
    int v6 = *(void **)(v2 + 32);
    return [v6 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    delegate = self->_delegate;
    self->_delegate = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)receivedSiriAudioEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__RPSiriAudioSession_receivedSiriAudioEvent___block_invoke;
  v7[3] = &unk_1E605B5D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__RPSiriAudioSession_receivedSiriAudioEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (v3)
  {
    id v5 = [v3 remoteObjectProxy];
    [v5 xpcSiriAudioReceived:*(void *)(a1 + 40)];
  }
  else
  {
    int v4 = **(_DWORD **)(v2 + 16);
    if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)xpcSiriStopClientRecordingWithDeviceId:(id)a3
{
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = self->_delegate;
    if (objc_opt_respondsToSelector()) {
      [(RPSiriAudioSessionDelegate *)v5 siriAudioSessionDidReceiveStopRecordingWithDeviceId:v6];
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (RPSiriAudioSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end