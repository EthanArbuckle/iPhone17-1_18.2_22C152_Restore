@interface RPNearFieldController
- (NSString)currentApplicationLabel;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldContext)currentContext;
- (RPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4;
- (RPNearFieldControllerDelegate)delegate;
- (RPNearFieldTransaction)currentTransaction;
- (id)_exportedInterface;
- (id)_remoteObjectInterface;
- (id)_remoteObjectProxy;
- (id)_synchronousRemoteObjectProxy;
- (int64_t)currentPreferredPollingType;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_startPolling;
- (void)didBeginTransaction:(id)a3;
- (void)didDetectDeviceNearbyWithInitiatorRole:(BOOL)a3;
- (void)didInterruptTransaction:(id)a3 withError:(id)a4;
- (void)didUpdateTransaction:(id)a3;
- (void)invalidate;
- (void)invalidateTransaction:(id)a3;
- (void)invalidateTransaction:(id)a3 context:(id)a4;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentPreferredPollingType:(int64_t)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)startPolling:(int64_t)a3 context:(id)a4;
- (void)startPolling:(int64_t)a3 forApplicationLabel:(id)a4;
- (void)stop;
@end

@implementation RPNearFieldController

- (RPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RPNearFieldController;
  v9 = [(RPNearFieldController *)&v11 init];
  if (v9)
  {
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v9;
}

- (NSString)currentApplicationLabel
{
  v2 = [(RPNearFieldController *)self currentContext];
  v3 = [v2 applicationLabel];

  return (NSString *)v3;
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcConnection)
  {
    v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.rapport.nearfield.service" options:0];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v3;

    v5 = [(RPNearFieldController *)self _exportedInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    v6 = [(RPNearFieldController *)self _remoteObjectInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_dispatchQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__RPNearFieldController__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__RPNearFieldController__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E605B540;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v7];
    [(NSXPCConnection *)self->_xpcConnection resume];
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __42__RPNearFieldController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __42__RPNearFieldController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (id)_exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C3FF38];
  [v2 setClass:objc_opt_class() forSelector:sel_didBeginTransaction_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_didUpdateTransaction_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_didInterruptTransaction_withError_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_didInterruptTransaction_withError_ argumentIndex:1 ofReply:0];
  return v2;
}

- (id)_remoteObjectInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48140];
  [v2 setClass:objc_opt_class() forSelector:sel_startPolling_context_ argumentIndex:1 ofReply:0];
  return v2;
}

- (void)_interrupted
{
  v9[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearFieldController <= 30
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = [(RPNearFieldController *)self currentTransaction];
  if (v3)
  {
    [(RPNearFieldController *)self setCurrentTransaction:0];
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"XPC connection was interrupted.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v6 = [v4 errorWithDomain:@"RPNearFieldControllerErrorDomain" code:0 userInfo:v5];

    id v7 = [(RPNearFieldController *)self delegate];
    [v7 nearFieldController:self didInterruptTransaction:v3 error:v6];
  }
  if (self->_didStart) {
    [(RPNearFieldController *)self _startPolling];
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(RPNearFieldController *)self stop];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    [(RPNearFieldController *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)_remoteObjectProxy
{
  xpcConnection = self->_xpcConnection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__RPNearFieldController__remoteObjectProxy__block_invoke;
  v5[3] = &unk_1E605B5B0;
  v5[4] = self;
  v3 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __43__RPNearFieldController__remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
  [v3 nearFieldController:*(void *)(a1 + 32) didInvalidateWithError:v5];
}

- (id)_synchronousRemoteObjectProxy
{
  xpcConnection = self->_xpcConnection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__RPNearFieldController__synchronousRemoteObjectProxy__block_invoke;
  v5[3] = &unk_1E605B5B0;
  v5[4] = self;
  v3 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __54__RPNearFieldController__synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
  [v3 nearFieldController:*(void *)(a1 + 32) didInvalidateWithError:v5];
}

- (void)startPolling:(int64_t)a3 forApplicationLabel:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v8 = [[RPNearFieldContext alloc] initWitApplicationLabel:v7];

  [(RPNearFieldController *)self startPolling:a3 context:v8];
}

- (void)startPolling:(int64_t)a3 context:(id)a4
{
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(RPNearFieldController *)self currentPreferredPollingType] != a3) {
    goto LABEL_8;
  }
  id v6 = [(RPNearFieldController *)self currentContext];
  id v7 = v10;
  id v8 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if ((v7 != 0) == (v6 == 0))
  {

    goto LABEL_8;
  }
  char v9 = [v6 isEqual:v7];

  if ((v9 & 1) == 0)
  {
LABEL_8:
    self->_didStart = 1;
    *(_WORD *)&self->_invalidateCalled = 0;
    [(RPNearFieldController *)self setCurrentContext:v10];
    [(RPNearFieldController *)self setCurrentPreferredPollingType:a3];
    [(RPNearFieldController *)self _ensureXPCStarted];
    [(RPNearFieldController *)self _startPolling];
  }
LABEL_9:
}

- (void)_startPolling
{
  if (gLogCategory_RPNearFieldController <= 30
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    id v5 = [(RPNearFieldController *)self currentApplicationLabel];
    int64_t v6 = [(RPNearFieldController *)self currentPreferredPollingType];
    LogPrintF();
  }
  id v7 = [(RPNearFieldController *)self _synchronousRemoteObjectProxy];
  int64_t v3 = [(RPNearFieldController *)self currentPreferredPollingType];
  id v4 = [(RPNearFieldController *)self currentContext];
  [v7 startPolling:v3 context:v4];
}

- (void)stop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(RPNearFieldController *)self _ensureXPCStarted];
  if (self->_didStart)
  {
    self->_didStart = 0;
    int64_t v3 = [(RPNearFieldController *)self _remoteObjectProxy];
    [v3 stop];

    [(RPNearFieldController *)self setCurrentTransaction:0];
    [(RPNearFieldController *)self setCurrentContext:0];
    [(RPNearFieldController *)self setCurrentPreferredPollingType:0];
  }
}

- (void)invalidateTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(RPNearFieldController *)self currentContext];
  [(RPNearFieldController *)self invalidateTransaction:v4 context:v5];
}

- (void)invalidateTransaction:(id)a3 context:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v10 = [(RPNearFieldController *)self _remoteObjectProxy];
  char v9 = [v8 identifier];

  [v10 invalidateTransactionWithIdentifier:v9 context:v7];
}

- (void)didDetectDeviceNearbyWithInitiatorRole:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = [(RPNearFieldController *)self delegate];
  [v5 nearFieldController:self didDetectDeviceNearbyWithInitiatorRole:v3];
}

- (void)didBeginTransaction:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [(RPNearFieldController *)self setCurrentTransaction:v5];
  id v6 = [(RPNearFieldController *)self delegate];
  [v6 nearFieldController:self didBeginTransaction:v5];
}

- (void)didUpdateTransaction:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = [v13 identifier];
  id v6 = [(RPNearFieldController *)self currentTransaction];
  id v7 = [v6 identifier];
  char v8 = [v5 isEqual:v7];

  if (v8)
  {
    char v9 = [(RPNearFieldController *)self delegate];
    if ([v13 state] == 1)
    {
      [(RPNearFieldController *)self setCurrentTransaction:0];
      id v10 = [v13 error];
      [v9 nearFieldController:self didInterruptTransaction:v13 error:v10];
LABEL_11:

      goto LABEL_12;
    }
    if ([v13 state] == 2)
    {
      objc_super v11 = [v13 tapEvent];

      if (!v11)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"RPNearFieldController.m", 266, @"tapEvent is nil for transaction:%@", v13 object file lineNumber description];
      }
      id v10 = [v13 tapEvent];
      [v9 nearFieldController:self transaction:v13 didReceiveTapEvent:v10];
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    char v9 = [(RPNearFieldController *)self currentTransaction];
    LogPrintF();
    goto LABEL_12;
  }
LABEL_13:
}

- (void)didInterruptTransaction:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = [v12 identifier];
  char v8 = [(RPNearFieldController *)self currentTransaction];
  char v9 = [v8 identifier];
  char v10 = [v7 isEqual:v9];

  if (v10)
  {
    [(RPNearFieldController *)self setCurrentTransaction:0];
    objc_super v11 = [(RPNearFieldController *)self delegate];
    [v11 nearFieldController:self didInterruptTransaction:v12 error:v6];
LABEL_6:

    goto LABEL_7;
  }
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    objc_super v11 = [(RPNearFieldController *)self currentTransaction];
    LogPrintF();
    goto LABEL_6;
  }
LABEL_7:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RPNearFieldControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RPNearFieldControllerDelegate *)WeakRetained;
}

- (int64_t)currentPreferredPollingType
{
  return self->_currentPreferredPollingType;
}

- (void)setCurrentPreferredPollingType:(int64_t)a3
{
  self->_currentPreferredPollingType = a3;
}

- (RPNearFieldContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (RPNearFieldTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end