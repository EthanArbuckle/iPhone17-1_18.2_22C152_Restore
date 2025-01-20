@interface _UIDruidSourceConnection
- (BOOL)isCancelled;
- (_UIDruidSourceConnection)init;
- (id)addItems:(id)a3 withOldItemCollection:(id)a4;
- (id)canHandOffCancelledItemsBlock;
- (id)dataTransferFinishedBlock;
- (id)dragCompletionBlock;
- (id)dragPreviewProviderBlock;
- (id)handOffCancelledItemsBlock;
- (id)updatedPresentationBlock;
- (void)_internalDragFailed;
- (void)beginDragWithConfiguration:(id)a3 completion:(id)a4;
- (void)canHandOffCancelledItems:(id)a3 withReply:(id)a4;
- (void)cancelDrag;
- (void)dataTransferSessionFinished;
- (void)dirtyItems:(id)a3;
- (void)dragDidExitApp;
- (void)dragEndedWithOperation:(unint64_t)a3;
- (void)dragFailed;
- (void)handOffCancelledItems:(id)a3 withFence:(id)a4;
- (void)requestDragPreviewsForIndexSet:(id)a3 reply:(id)a4;
- (void)setCanHandOffCancelledItemsBlock:(id)a3;
- (void)setDataTransferFinishedBlock:(id)a3;
- (void)setDragCompletionBlock:(id)a3;
- (void)setDragPreviewProviderBlock:(id)a3;
- (void)setHandOffCancelledItemsBlock:(id)a3;
- (void)setUpdatedPresentationBlock:(id)a3;
- (void)takeInsideAppSourceOperationMask:(unint64_t)a3 outsideAppSourceOperationMask:(unint64_t)a4 prefersFullSizePreview:(BOOL)a5;
- (void)updatedPresentation:(id)a3;
@end

@implementation _UIDruidSourceConnection

- (_UIDruidSourceConnection)init
{
  v15.receiver = self;
  v15.super_class = (Class)_UIDruidSourceConnection;
  v2 = [(_UIDruidSourceConnection *)&v15 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.DragUI.druid.source" options:0];
    v4 = _UIDraggingConnectionXPCQueue();
    [v3 _setQueue:v4];

    objc_storeStrong((id *)&v2->_connection, v3);
    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32___UIDruidSourceConnection_init__block_invoke;
    v12[3] = &unk_1E52D9F70;
    id v5 = v3;
    id v13 = v5;
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32___UIDruidSourceConnection_init__block_invoke_2;
    v10[3] = &unk_1E52DC308;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v10];
    v6 = _DUINewServerSourceInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v6];

    v7 = _DUINewClientSourceInterface();
    [(NSXPCConnection *)v2->_connection setExportedInterface:v7];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    connectionWatchdogTimer = v2->_connectionWatchdogTimer;
    v2->_connectionWatchdogTimer = 0;

    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)beginDragWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 touchIDs];
  int v9 = [v8 count];

  v10 = [v6 items];
  id v11 = [v6 axEndpoint];
  if (v11 || ([v6 initiatedWithPointer] & 1) != 0)
  {
  }
  else if ((v9 - 3) <= 0xFFFFFFFD)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"touches must have 1 or 2 objects"];
  }
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"items must be non-nil"];
  }
  if ([v10 count])
  {
    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"items must not be empty"];
    if (v7) {
      goto LABEL_8;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"completion must be non-nil"];
LABEL_8:
  v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &beginDragWithConfiguration_completion____s_category) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection beginDragWithTouches:items:completion:", (uint8_t *)&buf, 2u);
  }
  if ([(_UIDruidSourceConnection *)self isCancelled])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    [(NSXPCConnection *)self->_connection invalidate];
  }
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0)
  {
    id v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    connectionWatchdogTimer = self->_connectionWatchdogTimer;
    self->_connectionWatchdogTimer = v13;

    objc_super v15 = self->_connectionWatchdogTimer;
    dispatch_time_t v16 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    objc_initWeak(&buf, self);
    v17 = self->_connectionWatchdogTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke;
    handler[3] = &unk_1E52DC308;
    objc_copyWeak(&v46, &buf);
    dispatch_source_set_event_handler(v17, handler);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&buf);
  }
  v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count", v7));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [*(id *)(*((void *)&v41 + 1) + 8 * i) itemProvider];
        v25 = (void *)[objc_alloc(MEMORY[0x1E4F881C0]) initWithNSItemProvider:v24];
        [v18 addObject:v25];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v21);
  }

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F881C8]) initWithItems:v18];
  objc_msgSend(v26, "setOriginatorDataOwner:", objc_msgSend(v6, "dataOwner"));
  [v6 setItemCollection:v26];
  v27 = [v26 dataConsumersEndpoint];
  [v6 setDataProviderEndpoint:v27];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_589;
  aBlock[3] = &unk_1E52EC368;
  aBlock[4] = self;
  id v28 = v35;
  id v40 = v28;
  id v29 = v6;
  id v39 = v29;
  v30 = _Block_copy(aBlock);
  connection = self->_connection;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2_592;
  v36[3] = &unk_1E52EC390;
  id v32 = v28;
  v36[4] = self;
  id v37 = v32;
  v33 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v36];
  [v33 beginDragWithClientSession:self configuration:v29 reply:v30];
  v34 = self->_connectionWatchdogTimer;
  if (v34) {
    dispatch_activate(v34);
  }
}

- (void)dirtyItems:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &dirtyItems____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection dirtyItems:", v6, 2u);
  }
  [(_DUIServerSessionSource *)self->_serverSession dirtySourceItems:v4];
}

- (void)takeInsideAppSourceOperationMask:(unint64_t)a3 outsideAppSourceOperationMask:(unint64_t)a4 prefersFullSizePreview:(BOOL)a5
{
}

- (void)dragDidExitApp
{
}

- (id)addItems:(id)a3 withOldItemCollection:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a4 items];
  v8 = (void *)[v7 mutableCopy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v15 = objc_alloc(MEMORY[0x1E4F881C0]);
        dispatch_time_t v16 = objc_msgSend(v14, "itemProvider", (void)v22);
        v17 = (void *)[v15 initWithNSItemProvider:v16];

        [v8 addObject:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F881C8]) initWithItems:v8];
  serverSession = self->_serverSession;
  uint64_t v20 = [v18 dataConsumersEndpoint];
  [(_DUIServerSessionSource *)serverSession addItemCollection:v18 dataProviderEndpoint:v20];

  return v18;
}

- (void)cancelDrag
{
  self->_cancelled = 1;
  if (self->_serverSession) {
    [(_DUIServerSessionSource *)self->_serverSession cancelDrag];
  }
  else {
    [(NSXPCConnection *)self->_connection invalidate];
  }
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)requestDragPreviewsForIndexSet:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &requestDragPreviewsForIndexSet_reply____s_category) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection requestDragPreviewsForIndexSet:reply: %@", buf, 0xCu);
  }
  id v9 = +[UIApplication _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke;
  v12[3] = &unk_1E52E3298;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performAsync:v12];
}

- (void)updatedPresentation:(id)a3
{
  id v4 = a3;
  id v5 = +[UIApplication _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___UIDruidSourceConnection_updatedPresentation___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)canHandOffCancelledItems:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &canHandOffCancelledItems_withReply____s_category) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection canHandOffCancelledItems:withReply:", buf, 2u);
  }
  id v9 = +[UIApplication _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63___UIDruidSourceConnection_canHandOffCancelledItems_withReply___block_invoke;
  v12[3] = &unk_1E52E3298;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performAsync:v12];
}

- (void)handOffCancelledItems:(id)a3 withFence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &handOffCancelledItems_withFence____s_category) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection handOffCancelledItems:withFence", buf, 2u);
  }
  id v9 = +[UIApplication _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60___UIDruidSourceConnection_handOffCancelledItems_withFence___block_invoke;
  v12[3] = &unk_1E52DCB30;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performAsync:v12];
}

- (void)dragEndedWithOperation:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &dragEndedWithOperation____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection dragEndedWithOperation:%ld", buf, 0xCu);
  }
  id v6 = +[UIApplication _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___UIDruidSourceConnection_dragEndedWithOperation___block_invoke;
  v7[3] = &unk_1E52D9CD0;
  v7[4] = self;
  void v7[5] = a3;
  [v6 performAsync:v7];
}

- (void)dragFailed
{
  v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &dragFailed___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection dragFailed", v4, 2u);
  }
  [(_UIDruidSourceConnection *)self _internalDragFailed];
}

- (void)dataTransferSessionFinished
{
  v3 = +[UIApplication _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55___UIDruidSourceConnection_dataTransferSessionFinished__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 performAsync:v4];
}

- (void)_internalDragFailed
{
  v3 = +[UIApplication _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47___UIDruidSourceConnection__internalDragFailed__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 performAsync:v4];
}

- (id)dragPreviewProviderBlock
{
  return self->_dragPreviewProviderBlock;
}

- (void)setDragPreviewProviderBlock:(id)a3
{
}

- (id)canHandOffCancelledItemsBlock
{
  return self->_canHandOffCancelledItemsBlock;
}

- (void)setCanHandOffCancelledItemsBlock:(id)a3
{
}

- (id)handOffCancelledItemsBlock
{
  return self->_handOffCancelledItemsBlock;
}

- (void)setHandOffCancelledItemsBlock:(id)a3
{
}

- (id)dragCompletionBlock
{
  return self->_dragCompletionBlock;
}

- (void)setDragCompletionBlock:(id)a3
{
}

- (id)dataTransferFinishedBlock
{
  return self->_dataTransferFinishedBlock;
}

- (void)setDataTransferFinishedBlock:(id)a3
{
}

- (id)updatedPresentationBlock
{
  return self->_updatedPresentationBlock;
}

- (void)setUpdatedPresentationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPresentationBlock, 0);
  objc_storeStrong(&self->_dataTransferFinishedBlock, 0);
  objc_storeStrong(&self->_dragCompletionBlock, 0);
  objc_storeStrong(&self->_handOffCancelledItemsBlock, 0);
  objc_storeStrong(&self->_canHandOffCancelledItemsBlock, 0);
  objc_storeStrong(&self->_dragPreviewProviderBlock, 0);
  objc_storeStrong((id *)&self->_serverSession, 0);
  objc_storeStrong((id *)&self->_connectionWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end