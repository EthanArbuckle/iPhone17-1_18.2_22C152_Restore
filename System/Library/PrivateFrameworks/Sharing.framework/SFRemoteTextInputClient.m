@interface SFRemoteTextInputClient
- (NSDictionary)currentPayload;
- (OS_dispatch_queue)dispatchQueue;
- (RTIInputSystemSourceSession)sourceSession;
- (SFRemoteTextInputClient)init;
- (id)eventHandler;
- (id)textInputDidBegin;
- (id)textInputDidEnd;
- (void)_cleanup;
- (void)_fireEventHandlerWithPayload:(id)a3;
- (void)_handleSessionEvent:(int64_t)a3 forSession:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)fireEventHandlerWithPayload:(id)a3;
- (void)flushOperations;
- (void)handleTextActionPayload:(id)a3;
- (void)handleTextInputData:(id)a3;
- (void)handleUsername:(id)a3 password:(id)a4;
- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4;
- (void)invalidate;
- (void)performTextOperations:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setTextInputDidBegin:(id)a3;
- (void)setTextInputDidEnd:(id)a3;
@end

@implementation SFRemoteTextInputClient

- (SFRemoteTextInputClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFRemoteTextInputClient;
  v2 = [(SFRemoteTextInputClient *)&v7 init];
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
    v3 = (SFRemoteTextInputClient *)FatalErrorF();
    [(SFRemoteTextInputClient *)v3 activate];
  }
  else
  {
    [(SFRemoteTextInputClient *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFRemoteTextInputClient;
    [(SFRemoteTextInputClient *)&v5 dealloc];
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFRemoteTextInputClient_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFRemoteTextInputClient_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFRemoteTextInputClient <= 30
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  id v2 = objc_alloc((Class)getRTIInputSystemServiceClass[0]());
  v3 = getRTIServiceSharingName[0]();
  uint64_t v4 = [v2 initWithMachName:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 16) setEnabled:1];
  id v7 = objc_alloc_init((Class)getRTIInputSystemSourceSessionClass[0]());
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v7;

  v10 = *(void **)(*(void *)(a1 + 32) + 24);

  return objc_msgSend(v10, "setPayloadDelegate:");
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFRemoteTextInputClient_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFRemoteTextInputClient_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFRemoteTextInputClient <= 30
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  [*(id *)(*(void *)(a1 + 32) + 16) setDelegate:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setEnabled:0];
  [*(id *)(*(void *)(a1 + 32) + 24) setPayloadDelegate:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (void)_cleanup
{
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = 0;

  self->_paused = 0;
  rtiService = self->_rtiService;
  self->_rtiService = 0;

  rtiSourceSession = self->_rtiSourceSession;
  self->_rtiSourceSession = 0;

  id textInputDidBegin = self->_textInputDidBegin;
  self->_id textInputDidBegin = 0;

  id textInputDidEnd = self->_textInputDidEnd;
  self->_id textInputDidEnd = 0;
}

- (NSDictionary)currentPayload
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [(RTIInputSystemService *)self->_rtiService currentSession];
  uint64_t v4 = [v3 currentDataPayload];

  if (!self->_activateCalled || self->_invalidateCalled)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28760];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v12 = (void *)v11;
    v13 = @"?";
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v17[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v7 = [v9 errorWithDomain:v10 code:-6709 userInfo:v14];
  }
  else if (self->_rtiService && v4)
  {
    uint64_t v5 = SFTextInputDataForRTIDataPayload(v4);
    if (v5)
    {
      v6 = (void *)v5;
      id v7 = 0;
      goto LABEL_13;
    }
    id v7 = NSErrorWithOSStatusF();
    if (v7
      && gLogCategory_SFRemoteTextInputClient <= 60
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      v15 = [v7 localizedDescription];
      LogPrintF();
    }
  }
  else
  {
    id v7 = NSErrorWithOSStatusF();
  }
  v6 = 0;
LABEL_13:

  return (NSDictionary *)v6;
}

- (RTIInputSystemSourceSession)sourceSession
{
  if (self->_activateCalled && !self->_invalidateCalled) {
    return self->_rtiSourceSession;
  }
  else {
    return (RTIInputSystemSourceSession *)0;
  }
}

- (void)handleTextInputData:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (gLogCategory_SFRemoteTextInputClient <= 30)
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || (v5 = _LogCategory_Initialize(), id v4 = v15, v5))
    {
      v12 = SFTextInputDataLogString(v4);
      LogPrintF();

      id v4 = v15;
    }
  }
  v6 = SFRTIDataPayloadForData(v4);
  if (v6)
  {
    id v7 = [(RTIInputSystemService *)self->_rtiService currentSession];
    if (v7)
    {
    }
    else if (self->_rtiSourceSession)
    {
      if (gLogCategory_SFRemoteTextInputClient <= 30
        && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[RTIInputSystemSourceSession handleTextActionPayload:](self->_rtiSourceSession, "handleTextActionPayload:", v6, v12);
      goto LABEL_28;
    }
    uint64_t v8 = [(RTIInputSystemService *)self->_rtiService currentSession];

    if (v8)
    {
      if (gLogCategory_SFRemoteTextInputClient <= 30
        && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
      {
        rtiService = self->_rtiService;
        [(RTIInputSystemService *)rtiService currentSession];
        v14 = v12 = rtiService;
        LogPrintF();
      }
      uint64_t v10 = [(RTIInputSystemService *)self->_rtiService currentSession];
      [v10 handleTextActionPayload:v6];

LABEL_28:
      uint64_t v11 = 0;
      goto LABEL_29;
    }
    if (gLogCategory_SFRemoteTextInputClient <= 60
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  uint64_t v11 = NSErrorWithOSStatusF();
  if (v11
    && gLogCategory_SFRemoteTextInputClient <= 60
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    v13 = objc_msgSend(v11, "localizedDescription", v12);
    LogPrintF();
  }
LABEL_29:
}

- (void)handleUsername:(id)a3 password:(id)a4
{
  unint64_t v15 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [(RTIInputSystemService *)self->_rtiService currentSession];
  unint64_t v9 = v15;
  if (!v8)
  {
    if (gLogCategory_SFRemoteTextInputClient > 30
      || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
LABEL_20:
    LogPrintF();
    goto LABEL_12;
  }
  if (!(v15 | v6))
  {
    if (gLogCategory_SFRemoteTextInputClient > 30
      || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
  if (gLogCategory_SFRemoteTextInputClient <= 30)
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || (int v10 = _LogCategory_Initialize(), v9 = v15, v10))
    {
      LogPrintF();
      unint64_t v9 = v15;
    }
  }
  if (v9)
  {
    uint64_t v11 = getTIKeyboardOutputInfoTypeUsernameStr[0]();
    [v7 setObject:v15 forKeyedSubscript:v11];
  }
  if (v6)
  {
    v12 = getTIKeyboardOutputInfoTypePasswordStr[0]();
    [v7 setObject:v6 forKeyedSubscript:v12];
  }
  v13 = [v8 textOperations];
  v14 = [v13 keyboardOutput];
  [v14 setCustomInfo:v7];

  [v8 setSessionDelegate:self->_rtiService];
  [v8 flushOperations];
LABEL_12:
}

- (void)flushOperations
{
}

- (void)fireEventHandlerWithPayload:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFRemoteTextInputClient_fireEventHandlerWithPayload___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __55__SFRemoteTextInputClient_fireEventHandlerWithPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireEventHandlerWithPayload:*(void *)(a1 + 40)];
}

- (void)_fireEventHandlerWithPayload:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v6 = SFTextInputDataForRTIDataPayload(v5);

  if (v6)
  {
    if (gLogCategory_SFRemoteTextInputClient <= 30
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      unint64_t v15 = SFTextInputDataLogString(v6);
      LogPrintF();
    }
    id eventHandler = (void (**)(id, void *))self->_eventHandler;
    if (eventHandler) {
      eventHandler[2](eventHandler, v6);
    }
    id v8 = 0;
  }
  else
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28760];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v12 = (void *)v11;
    v13 = @"?";
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v18[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v8 = [v9 errorWithDomain:v10 code:-6720 userInfo:v14];

    if (v8
      && gLogCategory_SFRemoteTextInputClient <= 60
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = [v8 localizedDescription];
      LogPrintF();
    }
  }
}

- (void)_handleSessionEvent:(int64_t)a3 forSession:(id)a4
{
  id v24 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [v24 documentTraits];
  uint64_t v7 = [v6 autofillMode];

  if (gLogCategory_SFRemoteTextInputClient >= 31)
  {
    BOOL v8 = v7 == 1;
  }
  else
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize())
    {
      uint64_t v21 = v7;
      LogPrintF();
    }
    BOOL v8 = v7 == 1;
    if (gLogCategory_SFRemoteTextInputClient <= 30
      && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
    {
      if ((unint64_t)(a3 - 1) > 5) {
        unint64_t v9 = @"?";
      }
      else {
        unint64_t v9 = (__CFString *)*((void *)&off_1E5BBEFD0 + a3 - 1);
      }
      uint64_t v21 = (uint64_t)v9;
      BOOL v23 = v7 == 1;
      LogPrintF();
    }
  }
  uint64_t v10 = objc_msgSend(v24, "documentTraits", v21, v23);
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12 = [v10 associatedDomains];
    [v11 setObject:v12 forKeyedSubscript:@"remoteAssociatedDomains"];

    v13 = [v10 bundleId];
    [v11 setObject:v13 forKeyedSubscript:@"remoteBundleID"];

    v14 = [v10 localizedAppName];
    [v11 setObject:v14 forKeyedSubscript:@"remoteLocalizedAppName"];

    unint64_t v15 = [v10 appName];
    [v11 setObject:v15 forKeyedSubscript:@"remoteUnlocalizedAppName"];
  }
  else
  {
    id v11 = 0;
  }

  char v16 = 0;
  switch(a3)
  {
    case 1:
      self->_paused = 0;
      id textInputDidBegin = (void (**)(id, BOOL, id))self->_textInputDidBegin;
      if (textInputDidBegin) {
        textInputDidBegin[2](textInputDidBegin, v8, v11);
      }
      goto LABEL_35;
    case 2:
      if (!self->_paused) {
        goto LABEL_27;
      }
      if (gLogCategory_SFRemoteTextInputClient > 30
        || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_35;
      }
      goto LABEL_26;
    case 3:
LABEL_27:
      id textInputDidEnd = (void (**)(id, BOOL, id))self->_textInputDidEnd;
      if (textInputDidEnd) {
        textInputDidEnd[2](textInputDidEnd, v8, v11);
      }
      char v16 = 1;
      goto LABEL_36;
    case 4:
      goto LABEL_36;
    case 5:
      char v16 = 0;
      self->_paused = 1;
      goto LABEL_36;
    case 6:
      char v16 = 0;
      self->_paused = 0;
      goto LABEL_36;
    default:
      if (gLogCategory_SFRemoteTextInputClient > 60
        || gLogCategory_SFRemoteTextInputClient == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_35;
      }
      int64_t v22 = a3;
LABEL_26:
      LogPrintF();
LABEL_35:
      char v16 = 0;
LABEL_36:
      uint64_t v19 = objc_msgSend(v24, "currentDataPayload", v22);
      v20 = (void *)v19;
      if ((v16 & 1) != 0 || !v19)
      {
        if (gLogCategory_SFRemoteTextInputClient <= 60
          && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        [(SFRemoteTextInputClient *)self fireEventHandlerWithPayload:v19];
      }

      return;
  }
}

- (void)performTextOperations:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_SFRemoteTextInputClient <= 30)
  {
    id v6 = v3;
    if (gLogCategory_SFRemoteTextInputClient != -1 || (v5 = _LogCategory_Initialize(), id v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteTextInputClient/didCreateInputSession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (gLogCategory_SFRemoteTextInputClient <= 30
    && (gLogCategory_SFRemoteTextInputClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_activity_scope_leave(&state);
}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4
{
  id v5 = a4;
  id v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteTextInputClient/inputSessionDidBegin", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SFRemoteTextInputClient_inputSystemService_inputSessionDidBegin___block_invoke;
  v9[3] = &unk_1E5BBBD18;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(dispatchQueue, v9);

  os_activity_scope_leave(&state);
}

uint64_t __67__SFRemoteTextInputClient_inputSystemService_inputSessionDidBegin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionEvent:1 forSession:*(void *)(a1 + 40)];
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteTextInputClient/inputSessionDidEnd", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidEnd___block_invoke;
  v9[3] = &unk_1E5BBBD18;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(dispatchQueue, v9);

  os_activity_scope_leave(&state);
}

uint64_t __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionEvent:2 forSession:*(void *)(a1 + 40)];
}

- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4
{
  id v5 = a4;
  id v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteTextInputClient/inputSessionDidDie", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidDie___block_invoke;
  v9[3] = &unk_1E5BBBD18;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(dispatchQueue, v9);

  os_activity_scope_leave(&state);
}

uint64_t __65__SFRemoteTextInputClient_inputSystemService_inputSessionDidDie___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionEvent:3 forSession:*(void *)(a1 + 40)];
}

- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteTextInputClient/inputSessionDidPause", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__SFRemoteTextInputClient_inputSystemService_inputSessionDidPause_withReason___block_invoke;
  v10[3] = &unk_1E5BBBD18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(dispatchQueue, v10);

  os_activity_scope_leave(&state);
}

uint64_t __78__SFRemoteTextInputClient_inputSystemService_inputSessionDidPause_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionEvent:5 forSession:*(void *)(a1 + 40)];
}

- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteTextInputClient/inputSessionDidUnpause", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SFRemoteTextInputClient_inputSystemService_inputSessionDidUnpause_withReason___block_invoke;
  v10[3] = &unk_1E5BBBD18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(dispatchQueue, v10);

  os_activity_scope_leave(&state);
}

uint64_t __80__SFRemoteTextInputClient_inputSystemService_inputSessionDidUnpause_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionEvent:6 forSession:*(void *)(a1 + 40)];
}

- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SFRemoteTextInputClient_inputSystemService_inputSessionDocumentDidChange___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __76__SFRemoteTextInputClient_inputSystemService_inputSessionDocumentDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionEvent:4 forSession:*(void *)(a1 + 40)];
}

- (void)handleTextActionPayload:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (gLogCategory_SFRemoteTextInputClient <= 30)
  {
    if (gLogCategory_SFRemoteTextInputClient != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[SFRemoteTextInputClient fireEventHandlerWithPayload:](self, "fireEventHandlerWithPayload:", v4, v6);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (id)textInputDidBegin
{
  return self->_textInputDidBegin;
}

- (void)setTextInputDidBegin:(id)a3
{
}

- (id)textInputDidEnd
{
  return self->_textInputDidEnd;
}

- (void)setTextInputDidEnd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textInputDidEnd, 0);
  objc_storeStrong(&self->_textInputDidBegin, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rtiSourceSession, 0);

  objc_storeStrong((id *)&self->_rtiService, 0);
}

@end