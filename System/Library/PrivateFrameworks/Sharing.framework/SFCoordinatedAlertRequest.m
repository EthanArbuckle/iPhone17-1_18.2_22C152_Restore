@interface SFCoordinatedAlertRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)bestIsMe;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)dispatchQueue;
- (SFCoordinatedAlertRequest)init;
- (SFCoordinatedAlertRequest)initWithCoder:(id)a3;
- (double)timeout;
- (id)completionHandler;
- (id)invalidationHandler;
- (id)updateHandler;
- (int64_t)type;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_start;
- (void)_timeoutFired;
- (void)coordinatedAlertUpdatedWithError:(id)a3 bestIsMe:(BOOL)a4 info:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setBestIsMe:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)start;
@end

@implementation SFCoordinatedAlertRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCoordinatedAlertRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFCoordinatedAlertRequest;
  v2 = [(SFCoordinatedAlertRequest *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (SFCoordinatedAlertRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFCoordinatedAlertRequest;
  v5 = [(SFCoordinatedAlertRequest *)&v15 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = SFMainQueue(v5);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    if ([v4 containsValueForKey:@"type"])
    {
      unint64_t v9 = [v4 decodeIntegerForKey:@"type"];
      v6->_type = v9;
      if (v9 >= 7)
      {
        v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3C8];
        v12 = _NSMethodExceptionProem();
        [v10 raise:v11, @"%@: type (%ld) out-of-range", v12, v6->_type format];
      }
    }
    v13 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  if (type) {
    [a3 encodeInteger:type forKey:@"type"];
  }
}

- (void)dealloc
{
  if (self->_timeoutTimer)
  {
    FatalErrorF();
    goto LABEL_7;
  }
  if (self->_xpcCnx)
  {
LABEL_7:
    v6 = (SFCoordinatedAlertRequest *)FatalErrorF();
    [(SFCoordinatedAlertRequest *)v6 invalidate];
    return;
  }
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0;
  }
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  v8.receiver = self;
  v8.super_class = (Class)SFCoordinatedAlertRequest;
  [(SFCoordinatedAlertRequest *)&v8 dealloc];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFCoordinatedAlertRequest_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFCoordinatedAlertRequest_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFCoordinatedAlertRequest <= 30
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      id v4 = timeoutTimer;
      dispatch_source_cancel(v4);
      v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      [(NSXPCConnection *)xpcCnx invalidate];
      SEL v7 = self->_xpcCnx;
      self->_xpcCnx = 0;
    }
    else
    {
      [(SFCoordinatedAlertRequest *)self _invalidated];
    }
  }
}

- (void)start
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFCoordinatedAlertRequest_start__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFCoordinatedAlertRequest_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFCoordinatedAlertRequest <= 30
    && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_completionHandler)
  {
    FatalErrorF();
    goto LABEL_15;
  }
  if (self->_started)
  {
LABEL_15:
    FatalErrorF();
    goto LABEL_16;
  }
  self->_started = 1;
  double timeout = self->_timeout;
  if (timeout <= 0.0)
  {
    CFPrefs_GetDouble();
    self->_double timeout = timeout;
  }
  double v4 = 2.0;
  if (timeout <= 0.0 || (double v4 = 900.0, timeout > 900.0)) {
    self->_double timeout = v4;
  }
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v5;

  SEL v7 = self->_timeoutTimer;
  if (!v7)
  {
LABEL_16:
    v14 = (_Unwind_Exception *)FatalErrorF();
    os_activity_scope_leave(&state);
    _Unwind_Resume(v14);
  }
  unint64_t v8 = (unint64_t)(self->_timeout * 1000000000.0);
  dispatch_time_t v9 = dispatch_time(0, v8);
  dispatch_source_set_timer(v7, v9, v8, v8 >> 2);
  v10 = self->_timeoutTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __35__SFCoordinatedAlertRequest__start__block_invoke;
  handler[3] = &unk_1E5BBC870;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  uint64_t v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFCoordinatedAlertRequest/coordinatedAlertsRequestStart", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  [(SFCoordinatedAlertRequest *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__SFCoordinatedAlertRequest__start__block_invoke_2;
  v16[3] = &unk_1E5BBC8E8;
  v16[4] = self;
  v13 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__SFCoordinatedAlertRequest__start__block_invoke_3;
  v15[3] = &unk_1E5BBFE20;
  v15[4] = self;
  [v13 coordinatedAlertsRequestStart:self completion:v15];

  os_activity_scope_leave(&state);
}

uint64_t __35__SFCoordinatedAlertRequest__start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutFired];
}

void __35__SFCoordinatedAlertRequest__start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (gLogCategory_SFCoordinatedAlertRequest <= 50)
  {
    if (gLogCategory_SFCoordinatedAlertRequest != -1 || (int v4 = _LogCategory_Initialize(), v3 = v8, v4))
    {
      LogPrintF();
      id v3 = v8;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id, uint64_t, void))(v6 + 16))(v6, v3, 1, 0);
    uint64_t v5 = *(void *)(a1 + 32);
    SEL v7 = *(void **)(v5 + 40);
  }
  else
  {
    SEL v7 = 0;
  }
  *(void *)(v5 + 40) = 0;
}

void __35__SFCoordinatedAlertRequest__start__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (***)(void))(v2 + 40);
  if (v3)
  {
    v3[2]();
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void (***)(void))(v2 + 40);
  }
  *(void *)(v2 + 40) = 0;
}

- (void)coordinatedAlertUpdatedWithError:(id)a3 bestIsMe:(BOOL)a4 info:(id)a5
{
  updateHandler = (void (**)(id, id, BOOL, id))self->_updateHandler;
  if (updateHandler) {
    updateHandler[2](updateHandler, a3, a4, a5);
  }
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E5BBC870;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA394A0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFCoordinatedAlertRequest <= 10
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFCoordinatedAlertRequest <= 50
    && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = SFErrorF();
  updateHandler = (void (**)(void))self->_updateHandler;
  if (updateHandler)
  {
    uint64_t v5 = v3;
    updateHandler[2]();
    id v3 = v5;
  }
}

- (void)_invalidated
{
  v20[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFCoordinatedAlertRequest <= 50
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id completionHandler = (void (**)(id, void *, uint64_t, void))self->_completionHandler;
    if (completionHandler && self->_started)
    {
      int v4 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v5 = *MEMORY[0x1E4F28760];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v6 = [NSString stringWithUTF8String:DebugGetErrorString()];
      SEL v7 = (void *)v6;
      id v8 = @"?";
      if (v6) {
        id v8 = (__CFString *)v6;
      }
      v20[0] = v8;
      dispatch_time_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      v10 = [v4 errorWithDomain:v5 code:-6723 userInfo:v9];
      completionHandler[2](completionHandler, v10, 1, 0);
    }
    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    v12 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v12 coordinatedAlertsRequestCancel];

    id v13 = self->_completionHandler;
    self->_id completionHandler = 0;

    id v14 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v16 = timeoutTimer;
      dispatch_source_cancel(v16);
      v17 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFCoordinatedAlertRequest <= 10
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_timeoutFired
{
  id v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFCoordinatedAlertRequest/coordinatedAlertsRequestFinish", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v3, &v8);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    uint64_t v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  SEL v7 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v7 coordinatedAlertsRequestFinish];

  os_activity_scope_leave(&v8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (BOOL)bestIsMe
{
  return self->_bestIsMe;
}

- (void)setBestIsMe:(BOOL)a3
{
  self->_bestIsMe = a3;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end