@interface SFContinuityRemoteSession
- (OS_dispatch_queue)dispatchQueue;
- (SFContinuityRemoteSession)init;
- (SFDevice)peerDevice;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_cleanup;
- (void)_run;
- (void)_sendCommand:(int)a3 options:(id)a4;
- (void)_sendQueuedMesssages;
- (void)_sfSessionStart;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)sendCommand:(int)a3;
- (void)sendCommand:(int)a3 options:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
@end

@implementation SFContinuityRemoteSession

- (SFContinuityRemoteSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFContinuityRemoteSession;
  v2 = [(SFContinuityRemoteSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
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
    v3 = (SFContinuityRemoteSession *)FatalErrorF();
    [(SFContinuityRemoteSession *)v3 _cleanup];
  }
  else
  {
    [(SFContinuityRemoteSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFContinuityRemoteSession;
    [(SFContinuityRemoteSession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  id activateHandler = self->_activateHandler;
  self->_id activateHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SFContinuityRemoteSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __52__SFContinuityRemoteSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFContinuityRemoteSession <= 30
    && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  objc_super v5 = *(void **)(a1 + 32);

  return [v5 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFContinuityRemoteSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFContinuityRemoteSession_invalidate__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24)
    && gLogCategory_SFContinuityRemoteSession <= 30
    && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[2];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28760];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    uint64_t v8 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v9 = (void *)v8;
    v10 = @"?";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v16[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v12 = [v6 errorWithDomain:v7 code:-6723 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v12);

    id v4 = *(void **)(a1 + 32);
  }
  uint64_t v13 = v4[10];
  if (v13)
  {
    (*(void (**)(void))(v13 + 16))(v4[10]);
    id v4 = *(void **)(a1 + 32);
  }
  return [v4 _cleanup];
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_started)
  {
    if (gLogCategory_SFContinuityRemoteSession <= 30
      && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_started = 1;
  }
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (!self->_sfSessionActivated)
    {
      if (gLogCategory_SFContinuityRemoteSession > 30
        || gLogCategory_SFContinuityRemoteSession == -1 && !_LogCategory_Initialize())
      {
        return;
      }
      goto LABEL_25;
    }
    if (self->_pairVerifyRunning)
    {
      if (!self->_pairVerifyDone)
      {
        if (gLogCategory_SFContinuityRemoteSession > 30
          || gLogCategory_SFContinuityRemoteSession == -1 && !_LogCategory_Initialize())
        {
          return;
        }
LABEL_25:
        LogPrintF();
        return;
      }
    }
    else if (!self->_pairVerifyDone)
    {
      self->_pairVerifyRunning = 1;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __33__SFContinuityRemoteSession__run__block_invoke;
      v4[3] = &unk_1E5BBC8E8;
      v4[4] = self;
      [(SFSession *)sfSession pairVerifyWithFlags:8 completion:v4];
      return;
    }
    [(SFContinuityRemoteSession *)self _sendQueuedMesssages];
  }
  else
  {
    [(SFContinuityRemoteSession *)self _sfSessionStart];
  }
}

void __33__SFContinuityRemoteSession__run__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 0;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  id v7 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    id v3 = v7;
  }
  if (!v3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
    [*(id *)(a1 + 32) _run];
    id v3 = v7;
  }
}

- (void)_sfSessionStart
{
  if (gLogCategory_SFContinuityRemoteSession <= 30
    && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFSession *)self->_sfSession invalidate];
  id v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
  [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
  [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.ContinuityRemote"];
  [(SFSession *)self->_sfSession setReceivedObjectHandler:&__block_literal_global_38];
  uint64_t v5 = self->_sfSession;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SFContinuityRemoteSession__sfSessionStart__block_invoke_2;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFSession *)v5 activateWithCompletion:v6];
}

void __44__SFContinuityRemoteSession__sfSessionStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (gLogCategory_SFContinuityRemoteSession <= 30)
  {
    id v6 = v3;
    if (gLogCategory_SFContinuityRemoteSession != -1 || (v5 = _LogCategory_Initialize(), uint64_t v4 = v6, v5))
    {
      [v4 count];
      LogPrintF();
      uint64_t v4 = v6;
    }
  }
}

void __44__SFContinuityRemoteSession__sfSessionStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v6 = 0;
    if (gLogCategory_SFContinuityRemoteSession <= 30
      && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
    [*(id *)(a1 + 32) _run];
    goto LABEL_12;
  }
  if (gLogCategory_SFContinuityRemoteSession <= 90)
  {
    id v6 = v3;
    if (gLogCategory_SFContinuityRemoteSession != -1 || (v5 = _LogCategory_Initialize(), uint64_t v4 = v6, v5))
    {
      LogPrintF();
LABEL_12:
      uint64_t v4 = v6;
    }
  }
}

- (void)sendCommand:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__SFContinuityRemoteSession_sendCommand___block_invoke;
  v4[3] = &unk_1E5BBEE88;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __41__SFContinuityRemoteSession_sendCommand___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCommand:*(unsigned int *)(a1 + 40) options:0];
}

- (void)sendCommand:(int)a3 options:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFContinuityRemoteSession_sendCommand_options___block_invoke;
  block[3] = &unk_1E5BBFDF8;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SFContinuityRemoteSession_sendCommand_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCommand:*(unsigned int *)(a1 + 48) options:*(void *)(a1 + 40)];
}

- (void)_sendCommand:(int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (id)[a4 mutableCopy];
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v11 = v6;
  id v7 = [NSNumber numberWithInt:v4];
  [v11 setObject:v7 forKeyedSubscript:@"c"];

  messageQueue = self->_messageQueue;
  if (!messageQueue)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = self->_messageQueue;
    self->_messageQueue = v9;

    messageQueue = self->_messageQueue;
  }
  [(NSMutableArray *)messageQueue addObject:v11];
  [(SFContinuityRemoteSession *)self _sendQueuedMesssages];
}

- (void)_sendQueuedMesssages
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_sfSessionActivated)
  {
    uint64_t v3 = [(NSMutableArray *)self->_messageQueue firstObject];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      do
      {
        [(NSMutableArray *)self->_messageQueue removeObjectAtIndex:0];
        [(SFSession *)self->_sfSession sendWithFlags:1 object:v4];

        uint64_t v4 = [(NSMutableArray *)self->_messageQueue firstObject];
      }
      while (v4);
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

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);

  objc_storeStrong(&self->_activateHandler, 0);
}

@end