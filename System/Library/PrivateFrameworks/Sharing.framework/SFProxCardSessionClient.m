@interface SFProxCardSessionClient
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDictionary)userInfo;
- (NSString)label;
- (NSString)viewControllerClassName;
- (NSString)viewServiceName;
- (OS_dispatch_queue)dispatchQueue;
- (SFProxCardSessionClient)init;
- (SFProxCardXPCClientInterface)delegate;
- (id)errorHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)_xpcCheckinTimerFired;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setViewControllerClassName:(id)a3;
- (void)setViewServiceName:(id)a3;
- (void)xpcCheckinWithCompletion:(id)a3;
- (void)xpcPerformAction:(int)a3 completion:(id)a4;
@end

@implementation SFProxCardSessionClient

- (SFProxCardSessionClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFProxCardSessionClient;
  v2 = [(SFProxCardSessionClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ucat = (LogCategory *)&gLogCategory_SFProxCardSessionClient;
    v5 = v2;
  }

  return v2;
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
  v4.super_class = (Class)SFProxCardSessionClient;
  [(SFProxCardSessionClient *)&v4 dealloc];
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
  v7[2] = __50__SFProxCardSessionClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__SFProxCardSessionClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    uint64_t v3 = NSErrorF();
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 40);
    id v6 = (id)v3;
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    [v2 _activateWithCompletion:v5];
  }
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  id v45 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__SFProxCardSessionClient__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5BBE308;
  v39 = &v40;
  aBlock[4] = self;
  id v5 = v4;
  id v38 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if (self->_activateCalled)
  {
    uint64_t v29 = SFErrorF();
    v11 = (void *)v41[5];
    v41[5] = v29;
  }
  else
  {
    self->_activateCalled = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v8 = [MEMORY[0x1E4F29290] anonymousListener];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v8;

    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener resume];
    v10 = [(NSXPCListener *)self->_xpcListener endpoint];
    v11 = [v10 _endpoint];

    if (v11)
    {
      v12 = self->_viewControllerClassName;
      if (v12)
      {
        viewServiceName = (__CFString *)self->_viewServiceName;
        if (!viewServiceName) {
          viewServiceName = @"com.apple.SharingViewService";
        }
        v14 = viewServiceName;
        v15 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:v14 viewControllerClassName:v12];
        if (v15)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
          v17 = v16;
          if (v16)
          {
            [v16 setXpcEndpoint:v11];
            v18 = (void *)[(NSDictionary *)self->_userInfo mutableCopy];
            v19 = v18;
            if (v18) {
              id v20 = v18;
            }
            else {
              id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            v21 = v20;

            [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_proxXPC"];
            [v17 setUserInfo:v21];
            v22 = (SBSRemoteAlertHandle *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v15 configurationContext:v17];
            remoteAlertHandle = self->_remoteAlertHandle;
            self->_remoteAlertHandle = v22;

            v24 = self->_remoteAlertHandle;
            if (v24)
            {
              [(SBSRemoteAlertHandle *)v24 addObserver:self];
              [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:0];
              dispatch_source_t v25 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
              objc_storeStrong((id *)&self->_xpcCheckinTimer, v25);
              handler[0] = MEMORY[0x1E4F143A8];
              handler[1] = 3221225472;
              handler[2] = __51__SFProxCardSessionClient__activateWithCompletion___block_invoke_2;
              handler[3] = &unk_1E5BBC870;
              handler[4] = self;
              dispatch_source_set_event_handler(v25, handler);
              SFDispatchTimerSet(v25, 30.0, -1.0, 1.0);
              dispatch_activate(v25);
              v26 = _Block_copy(v5);
              id activateCompletion = self->_activateCompletion;
              self->_id activateCompletion = v26;

              int v28 = self->_ucat->var0;
              if (v28 <= 30 && (v28 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
            }
            else
            {
              uint64_t v35 = SFErrorF();
              dispatch_source_t v25 = (dispatch_source_t)v41[5];
              v41[5] = v35;
            }
          }
          else
          {
            uint64_t v34 = SFErrorF();
            v21 = (void *)v41[5];
            v41[5] = v34;
          }
        }
        else
        {
          uint64_t v33 = SFErrorF();
          v17 = (void *)v41[5];
          v41[5] = v33;
        }
      }
      else
      {
        uint64_t v31 = SFErrorF();
        v32 = (void *)v41[5];
        v41[5] = v31;
      }
    }
    else
    {
      uint64_t v30 = SFErrorF();
      v12 = (NSString *)v41[5];
      v41[5] = v30;
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v40, 8);
}

uint64_t __51__SFProxCardSessionClient__activateWithCompletion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    int v2 = **(_DWORD **)(*(void *)(result + 32) + 40);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __51__SFProxCardSessionClient__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcCheckinTimerFired];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFProxCardSessionClient_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFProxCardSessionClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 25))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 25) = 1;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[5];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    return [v3 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  delegate = self->_delegate;
  self->_delegate = 0;

  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    [(SBSRemoteAlertHandle *)remoteAlertHandle removeObserver:self];
    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
    int v5 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;
  }
  xpcCheckinTimer = self->_xpcCheckinTimer;
  if (xpcCheckinTimer)
  {
    objc_super v7 = xpcCheckinTimer;
    dispatch_source_cancel(v7);
    id v8 = self->_xpcCheckinTimer;
    self->_xpcCheckinTimer = 0;
  }
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  [(NSXPCConnection *)self->_xpcCnx invalidate];

  [(SFProxCardSessionClient *)self _invalidated];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone && self->_invalidateCalled && !self->_remoteAlertHandle && !self->_xpcCnx)
  {
    uint64_t v3 = (void (**)(void *, void *))_Block_copy(self->_activateCompletion);
    if (v3)
    {
      int v4 = SFErrorF();
      v3[2](v3, v4);
    }
    int v5 = _Block_copy(self->_invalidationHandler);
    id v6 = v5;
    if (v5) {
      (*((void (**)(void *))v5 + 2))(v5);
    }

    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_reportError:(id)a3
{
  id v10 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v5 = _Block_copy(self->_activateCompletion);
  id v6 = v5;
  if (v5) {
    (*((void (**)(void *, id))v5 + 2))(v5, v10);
  }

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  id v8 = _Block_copy(self->_errorHandler);
  v9 = v8;
  if (v8) {
    (*((void (**)(void *, id))v8 + 2))(v8, v10);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  p_xpcCnx = &self->_xpcCnx;
  if (self->_xpcCnx)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = [v6 processIdentifier];
      LogPrintF();
    }
    [(NSXPCConnection *)*p_xpcCnx invalidate];
    v9 = *p_xpcCnx;
    *p_xpcCnx = 0;
  }
  int v10 = self->_ucat->var0;
  if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
  {
    [v6 processIdentifier];
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_xpcCnx, a4);
  [v6 _setQueue:self->_dispatchQueue];
  v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA16FF0];
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__SFProxCardSessionClient_listener_shouldAcceptNewConnection___block_invoke;
  v16[3] = &unk_1E5BBBD18;
  v16[4] = self;
  id v17 = v6;
  id v12 = v6;
  [v12 setInvalidationHandler:v16];
  v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39320];
  [v12 setRemoteObjectInterface:v13];

  [v12 resume];
  return 1;
}

uint64_t __62__SFProxCardSessionClient_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SFProxCardSessionClient_remoteAlertHandleDidActivate___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

int *__56__SFProxCardSessionClient_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v1 + 32);
  result = *(int **)(v1 + 40);
  int v5 = *result;
  if (v2 == v4)
  {
    if (v5 > 30) {
      return result;
    }
    if (v5 == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!result) {
        return result;
      }
    }
  }
  else
  {
    if (v5 > 30) {
      return result;
    }
    if (v5 == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!result) {
        return result;
      }
    }
  }

  return (int *)LogPrintF();
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SFProxCardSessionClient_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

int *__58__SFProxCardSessionClient_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32))
  {
    if (*(unsigned char *)(v1 + 25) || *(unsigned char *)(v1 + 24))
    {
      result = *(int **)(v1 + 40);
      if (*result > 30) {
        return result;
      }
      if (*result == -1)
      {
        result = (int *)_LogCategory_Initialize();
        if (!result) {
          return result;
        }
      }
    }
    else
    {
      result = *(int **)(v1 + 40);
      if (*result > 90) {
        return result;
      }
      if (*result == -1)
      {
        result = (int *)_LogCategory_Initialize();
        if (!result) {
          return result;
        }
      }
    }
  }
  else
  {
    result = *(int **)(v1 + 40);
    if (*result > 30) {
      return result;
    }
    if (*result == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!result) {
        return result;
      }
    }
  }

  return (int *)LogPrintF();
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SFProxCardSessionClient_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_1E5BBD418;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

int *__68__SFProxCardSessionClient_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v2 + 32))
  {
    if (*(unsigned char *)(v2 + 25) || *(unsigned char *)(v2 + 24))
    {
      int v3 = **(_DWORD **)(v2 + 40);
      if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize())) {
LABEL_6:
      }
        LogPrintF();
    }
    else
    {
      int v4 = **(_DWORD **)(v2 + 40);
      if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize())) {
        goto LABEL_6;
      }
    }
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = 0;

    id v7 = *(void **)(a1 + 40);
    return (int *)[v7 _invalidated];
  }
  result = *(int **)(v2 + 40);
  if (*result <= 30)
  {
    if (*result != -1) {
      return (int *)LogPrintF();
    }
    result = (int *)_LogCategory_Initialize();
    if (result) {
      return (int *)LogPrintF();
    }
  }
  return result;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v8 = (NSXPCConnection *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!*(_WORD *)&self->_dismissCalled)
  {
    int v4 = SFErrorF();
    [(SFProxCardSessionClient *)self _reportError:v4];
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 20)
  {
    id v6 = v8;
    if (var0 != -1)
    {
LABEL_5:
      uint64_t v7 = [(NSXPCConnection *)v6 processIdentifier];
      LogPrintF();
      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      id v6 = v8;
      goto LABEL_5;
    }
  }
LABEL_7:
  if (self->_xpcCnx == v8)
  {
    self->_xpcCnx = 0;
  }
  [(SFProxCardSessionClient *)self _invalidated];
}

- (void)_xpcCheckinTimerFired
{
  xpcCheckinTimer = self->_xpcCheckinTimer;
  if (xpcCheckinTimer)
  {
    int v4 = xpcCheckinTimer;
    dispatch_source_cancel(v4);
    uint64_t v5 = self->_xpcCheckinTimer;
    self->_xpcCheckinTimer = 0;
  }
  SFErrorF();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SFProxCardSessionClient *)self _reportError:v6];
}

- (void)xpcCheckinWithCompletion:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v12 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpcCheckinTimer = self->_xpcCheckinTimer;
  if (xpcCheckinTimer)
  {
    uint64_t v7 = xpcCheckinTimer;
    dispatch_source_cancel(v7);
    id v8 = self->_xpcCheckinTimer;
    self->_xpcCheckinTimer = 0;
  }
  id v9 = _Block_copy(self->_activateCompletion);
  id v10 = v9;
  if (v9) {
    (*((void (**)(void *, void))v9 + 2))(v9, 0);
  }

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  v12[2](v12, 0);
}

- (void)xpcPerformAction:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_dismissCalled = 1;
  uint64_t v7 = self->_delegate;
  if (objc_opt_respondsToSelector()) {
    [(SFProxCardXPCClientInterface *)v7 xpcPerformAction:v4 completion:v8];
  }
  else {
    v8[2](v8, 0);
  }
}

- (SFProxCardXPCClientInterface)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
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

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
}

- (NSString)viewServiceName
{
  return self->_viewServiceName;
}

- (void)setViewServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewServiceName, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_xpcCheckinTimer, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end