@interface SFRemoteInteractionSession
+ (BOOL)supportsSecureCoding;
- (OS_dispatch_queue)dispatchQueue;
- (SDRemoteInteractionAgent)agent;
- (SFDevice)peerDevice;
- (SFRemoteInteractionSession)init;
- (SFRemoteInteractionSession)initWithCoder:(id)a3;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteTextEventHandler;
- (id)textSessionDidBegin;
- (id)textSessionDidChange;
- (id)textSessionDidEnd;
- (void)_activateWithCompletion:(id)a3;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_sessionHandleEvent:(id)a3;
- (void)_sessionSendPayload:(id)a3;
- (void)_sessionStart;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)remoteInteractionSessionRemoteTextEvent:(id)a3;
- (void)remoteInteractionSessionTextSessionDidBegin:(id)a3;
- (void)remoteInteractionSessionTextSessionDidChange:(id)a3;
- (void)remoteInteractionSessionTextSessionDidEnd:(id)a3;
- (void)sendPayload:(id)a3;
- (void)setAgent:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setRemoteTextEventHandler:(id)a3;
- (void)setTextSessionDidBegin:(id)a3;
- (void)setTextSessionDidChange:(id)a3;
- (void)setTextSessionDidEnd:(id)a3;
@end

@implementation SFRemoteInteractionSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteInteractionSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFRemoteInteractionSession;
  v2 = [(SFRemoteInteractionSession *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (SFRemoteInteractionSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFRemoteInteractionSession;
  v5 = [(SFRemoteInteractionSession *)&v13 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = SFMainQueue(v5);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    if ([v4 containsValueForKey:@"peerDevice"])
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerDevice"];
      peerDevice = v6->_peerDevice;
      v6->_peerDevice = (SFDevice *)v9;
    }
    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  peerDevice = self->_peerDevice;
  if (peerDevice) {
    [a3 encodeObject:peerDevice forKey:@"peerDevice"];
  }
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_invalidateCalled)
  {
    uint64_t v7 = v3;
    NSAppendPrintF();
    id v5 = v7;

    id v4 = v5;
  }

  return v4;
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SFRemoteInteractionSession_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __53__SFRemoteInteractionSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    uint64_t v12 = 4294960572;
  }
  else
  {
    if (self->_peerDevice)
    {
      if (self->_agent)
      {
        id v5 = objc_alloc_init(SFSession);
        remoteSession = self->_remoteSession;
        self->_remoteSession = v5;

        [(SFSession *)self->_remoteSession setDispatchQueue:self->_dispatchQueue];
        [(SFSession *)self->_remoteSession setPeerDevice:self->_peerDevice];
        [(SFSession *)self->_remoteSession setServiceIdentifier:@"com.apple.sharing.Control"];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke;
        v27[3] = &unk_1E5BC11E0;
        v27[4] = self;
        [(SFSession *)self->_remoteSession setEventMessageHandler:v27];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_2;
        v26[3] = &unk_1E5BBC870;
        v26[4] = self;
        [(SFSession *)self->_remoteSession setInvalidationHandler:v26];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_3;
        v25[3] = &unk_1E5BBE5B8;
        v25[4] = self;
        [(SFSession *)self->_remoteSession setReceivedObjectHandler:v25];
        id v7 = self->_remoteSession;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_4;
        v23[3] = &unk_1E5BBD618;
        v23[4] = self;
        id v24 = v4;
        [(SFSession *)v7 activateWithCompletion:v23];
      }
      else
      {
        v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteInteractionSession/remoteInteractionSessionActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        os_activity_scope_enter(v8, &state);
        [(SFRemoteInteractionSession *)self _ensureXPCStarted];
        xpcCnx = self->_xpcCnx;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_5;
        v20[3] = &unk_1E5BBCD68;
        id v10 = v4;
        id v21 = v10;
        v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v20];
        [v11 remoteInteractionSessionActivate:self completion:v10];

        os_activity_scope_leave(&state);
      }
      goto LABEL_10;
    }
    uint64_t v12 = 4294960551;
  }
  if (gLogCategory_SFRemoteInteractionSession <= 60
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v19 = v12;
    LogPrintF();
  }
  if (v4)
  {
    objc_super v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v15 = (void *)v14;
    v16 = @"?";
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v29[0] = v16;
    v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1, v19);
    v18 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v12 userInfo:v17];
    (*((void (**)(id, void *))v4 + 2))(v4, v18);
  }
LABEL_10:
}

uint64_t __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sessionHandleEvent:a2];
}

uint64_t __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

void __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  CFDictionaryGetTypeID();
  uint64_t v7 = CFDictionaryGetTypedValue();

  id v5 = (void *)v7;
  if (v7)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
      id v5 = (void *)v7;
    }
  }
}

void __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _sessionStart];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

uint64_t __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SFRemoteInteractionSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SFRemoteInteractionSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  if (!self->_invalidateDone
    && gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  remoteSession = self->_remoteSession;
  if (remoteSession)
  {
    [(SFSession *)remoteSession invalidate];
    id v4 = self->_remoteSession;
    self->_remoteSession = 0;
LABEL_11:

    return;
  }
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    [(NSXPCConnection *)xpcCnx invalidate];
    id v4 = self->_xpcCnx;
    self->_xpcCnx = 0;
    goto LABEL_11;
  }

  [(SFRemoteInteractionSession *)self _invalidated];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFRemoteInteractionSession <= 50
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id textSessionDidBegin = self->_textSessionDidBegin;
    self->_id textSessionDidBegin = 0;

    id textSessionDidEnd = self->_textSessionDidEnd;
    self->_id textSessionDidEnd = 0;

    id textSessionDidChange = self->_textSessionDidChange;
    self->_id textSessionDidChange = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFRemoteInteractionSession <= 10
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)sendPayload:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SFRemoteInteractionSession_sendPayload___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __42__SFRemoteInteractionSession_sendPayload___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _sessionSendPayload:v3];
  }
  else
  {
    id v4 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteInteractionSession/remoteInteractionSessionSendPayload", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v4, &v6);
    id v5 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxy];
    [v5 remoteInteractionSessionSendPayload:*(void *)(a1 + 40)];

    os_activity_scope_leave(&v6);
  }
}

- (void)_sessionStart
{
  id v4 = objc_alloc_init(SFEventMessage);
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  [(SFMessage *)v4 setIdentifier:v3];

  [(SFMessage *)v4 setHeaderFields:&unk_1EFA09F08];
  [(SFMessage *)v4 setPeerDevice:self->_peerDevice];
  [(SFSession *)self->_remoteSession sendEvent:v4];
}

- (void)_sessionSendPayload:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned __int8 v16 = 0;
  if (!v4)
  {
    if (gLogCategory_SFRemoteInteractionSession > 60
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
LABEL_22:
    LogPrintF();
    goto LABEL_14;
  }
  uint64_t v6 = SFRTIDataPayloadForData(v4);
  if (!v6)
  {
    if (gLogCategory_SFRemoteInteractionSession > 60
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
  uint64_t v7 = (void *)v6;
  [v5 setObject:v4 forKeyedSubscript:@"rp"];
  id v15 = 0;
  SFRemoteTextInputPayloadToLegacyAPI(v7, (char *)&v16, &v15);
  id v8 = v15;
  uint64_t v9 = v16;
  if (v16)
  {
    if (gLogCategory_SFRemoteInteractionSession <= 30)
    {
      if (gLogCategory_SFRemoteInteractionSession != -1 || (v10 = _LogCategory_Initialize(), uint64_t v9 = v16, v10))
      {
        uint64_t v14 = v9;
        LogPrintF();
        uint64_t v9 = v16;
      }
    }
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v9, v14);
    [v5 setObject:v11 forKeyedSubscript:@"o"];

    if (v8) {
      [v5 setObject:v8 forKeyedSubscript:@"t"];
    }
  }
  else if (gLogCategory_SFRemoteInteractionSession <= 60 {
         && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v12 = objc_alloc_init(SFEventMessage);
  [(SFMessage *)v12 setHeaderFields:v5];
  objc_super v13 = [MEMORY[0x1E4F29128] UUID];
  [(SFMessage *)v12 setIdentifier:v13];

  [(SFMessage *)v12 setPeerDevice:self->_peerDevice];
  [(SFSession *)self->_remoteSession sendEvent:v12];

LABEL_14:
}

- (void)_sessionHandleEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 headerFields];
  CFDictionaryGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue();

  if (v6)
  {
    if (gLogCategory_SFRemoteInteractionSession <= 30
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    remoteTextEventHandler = (void (**)(id, void *))self->_remoteTextEventHandler;
    if (remoteTextEventHandler) {
      remoteTextEventHandler[2](remoteTextEventHandler, v6);
    }
    goto LABEL_25;
  }
  uint64_t v7 = [v4 headerFields];
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();

  if (Int64Ranged > 9u) {
    goto LABEL_66;
  }
  if (((1 << Int64Ranged) & 0x23C) != 0)
  {
    if (gLogCategory_SFRemoteInteractionSession > 60
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
    goto LABEL_9;
  }
  if (((1 << Int64Ranged) & 0xC0) != 0)
  {
    uint64_t v9 = [v4 headerFields];
    CFDictionaryGetTypeID();
    int v10 = CFDictionaryGetTypedValue();

    v11 = [[SFRemoteTextSessionInfo alloc] initWithDictionary:v10];
    if (!v11)
    {
      if (gLogCategory_SFRemoteInteractionSession <= 60
        && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_26;
    }
    uint64_t v12 = v11;
    if (Int64Ranged == 7)
    {
      if (self->_textSessionDidEnd)
      {
        if (gLogCategory_SFRemoteInteractionSession <= 30
          && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id textSessionDidEnd = (void (**)(id, SFRemoteTextSessionInfo *))self->_textSessionDidEnd;
        goto LABEL_54;
      }
      if (gLogCategory_SFRemoteInteractionSession > 50
        || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_27;
      }
    }
    else
    {
      if (Int64Ranged != 6)
      {
LABEL_27:
        id v15 = 0;
        goto LABEL_28;
      }
      if (self->_agent)
      {
        objc_super v13 = [v4 peerDevice];
        if (v13) {
          [(SDRemoteInteractionAgent *)self->_agent clientTextSessionDidBegin:v12 device:v13];
        }
      }
      if (self->_textSessionDidBegin)
      {
        if (gLogCategory_SFRemoteInteractionSession <= 30
          && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id textSessionDidEnd = (void (**)(id, SFRemoteTextSessionInfo *))self->_textSessionDidBegin;
LABEL_54:
        textSessionDidEnd[2](textSessionDidEnd, v12);
        goto LABEL_27;
      }
      if (gLogCategory_SFRemoteInteractionSession > 50
        || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_27;
      }
    }
    LogPrintF();
    goto LABEL_27;
  }
  if (Int64Ranged != 8)
  {
LABEL_66:
    if (gLogCategory_SFRemoteInteractionSession > 40
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
LABEL_9:
    LogPrintF();
LABEL_25:
    int v10 = 0;
LABEL_26:
    uint64_t v12 = 0;
    goto LABEL_27;
  }
  unsigned __int8 v16 = [v4 headerFields];
  CFStringGetTypeID();
  id v15 = CFDictionaryGetTypedValue();

  uint64_t v12 = objc_alloc_init(SFRemoteTextSessionInfo);
  [(SFRemoteTextSessionInfo *)v12 setText:v15];
  id textSessionDidChange = (void (**)(id, SFRemoteTextSessionInfo *))self->_textSessionDidChange;
  if (textSessionDidChange) {
    textSessionDidChange[2](textSessionDidChange, v12);
  }
  int v10 = 0;
LABEL_28:
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E5BBC870;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA397A0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFRemoteInteractionSession <= 10
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 50
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
  if (self->_activateCalled)
  {
    id v4 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteInteractionSession/remoteInteractionSessionActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v4, &v6);
    if (gLogCategory_SFRemoteInteractionSession <= 50
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFRemoteInteractionSession *)self _ensureXPCStarted];
    id v5 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v5 remoteInteractionSessionActivate:self completion:&__block_literal_global_63];

    os_activity_scope_leave(&v6);
  }
}

void __42__SFRemoteInteractionSession__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (gLogCategory_SFRemoteInteractionSession <= 30)
  {
    id v5 = v2;
    if (gLogCategory_SFRemoteInteractionSession != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
  }
}

- (void)remoteInteractionSessionRemoteTextEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  remoteTextEventHandler = (void (**)(id, id))self->_remoteTextEventHandler;
  id v5 = v6;
  if (remoteTextEventHandler)
  {
    remoteTextEventHandler[2](remoteTextEventHandler, v6);
    id v5 = v6;
  }
}

- (void)remoteInteractionSessionTextSessionDidBegin:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id textSessionDidBegin = (void (**)(id, id))self->_textSessionDidBegin;
  id v5 = v6;
  if (textSessionDidBegin)
  {
    textSessionDidBegin[2](textSessionDidBegin, v6);
    id v5 = v6;
  }
}

- (void)remoteInteractionSessionTextSessionDidEnd:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id textSessionDidEnd = (void (**)(id, id))self->_textSessionDidEnd;
  id v5 = v6;
  if (textSessionDidEnd)
  {
    textSessionDidEnd[2](textSessionDidEnd, v6);
    id v5 = v6;
  }
}

- (void)remoteInteractionSessionTextSessionDidChange:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 10
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id textSessionDidChange = (void (**)(id, id))self->_textSessionDidChange;
  id v5 = v6;
  if (textSessionDidChange)
  {
    textSessionDidChange[2](textSessionDidChange, v6);
    id v5 = v6;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
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

- (id)remoteTextEventHandler
{
  return self->_remoteTextEventHandler;
}

- (void)setRemoteTextEventHandler:(id)a3
{
}

- (id)textSessionDidBegin
{
  return self->_textSessionDidBegin;
}

- (void)setTextSessionDidBegin:(id)a3
{
}

- (id)textSessionDidEnd
{
  return self->_textSessionDidEnd;
}

- (void)setTextSessionDidEnd:(id)a3
{
}

- (id)textSessionDidChange
{
  return self->_textSessionDidChange;
}

- (void)setTextSessionDidChange:(id)a3
{
}

- (SDRemoteInteractionAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong(&self->_textSessionDidChange, 0);
  objc_storeStrong(&self->_textSessionDidEnd, 0);
  objc_storeStrong(&self->_textSessionDidBegin, 0);
  objc_storeStrong(&self->_remoteTextEventHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong((id *)&self->_remoteSession, 0);
}

@end