@interface _UIDruidDestinationConnection
- (BOOL)isSystemPolicy;
- (_UIDruidDestinationConnection)initWithSessionIdentifier:(unsigned int)a3 systemPolicy:(BOOL)a4;
- (id)connectionBlock;
- (id)dragEndBlock;
- (id)dragPreviewProviderBlock;
- (id)dropPerformBlock;
- (id)handOffDroppedItemsBlock;
- (id)itemsAddedBlock;
- (id)serverDestinationProxyWithErrorHandler:(id)a3;
- (id)updatedPresentationBlock;
- (int64_t)state;
- (unsigned)sessionIdentifier;
- (void)addedItemCollection:(id)a3;
- (void)connect;
- (void)dirtyItems:(id)a3;
- (void)dragEnded;
- (void)enableKeyboardIfNeeded;
- (void)handOffDroppedItems:(id)a3 withFence:(id)a4;
- (void)performDropWithItemCollection:(id)a3 dataProviderEndpoint:(id)a4 visibleDroppedItems:(id)a5 completion:(id)a6;
- (void)requestDragPreviewsForIndexSet:(id)a3 reply:(id)a4;
- (void)requestDropWithOperation:(unint64_t)a3 layerContext:(id)a4;
- (void)requestVisibleItems:(id)a3;
- (void)sawDragEndEvent;
- (void)setConnectionBlock:(id)a3;
- (void)setDragEndBlock:(id)a3;
- (void)setDragPreviewProviderBlock:(id)a3;
- (void)setDropPerformBlock:(id)a3;
- (void)setHandOffDroppedItemsBlock:(id)a3;
- (void)setItemsAddedBlock:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSystemPolicy:(BOOL)a3;
- (void)setUpdatedPresentationBlock:(id)a3;
- (void)takePotentialDrop:(id)a3;
- (void)updatedPresentation:(id)a3;
@end

@implementation _UIDruidDestinationConnection

- (id)serverDestinationProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

- (_UIDruidDestinationConnection)initWithSessionIdentifier:(unsigned int)a3 systemPolicy:(BOOL)a4
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Drag destination's session identifier must be non-zero"];
  }
  v20.receiver = self;
  v20.super_class = (Class)_UIDruidDestinationConnection;
  v7 = [(_UIDruidDestinationConnection *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_sessionIdentifier = a3;
    v7->_state = 0;
    v7->_systemPolicy = a4;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.DragUI.druid.destination" options:0];
    v10 = _UIDraggingConnectionXPCQueue();
    [v9 _setQueue:v10];

    objc_storeStrong((id *)&v8->_connection, v9);
    objc_initWeak(&location, v8);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke;
    v17[3] = &unk_1E52D9F70;
    id v11 = v9;
    id v18 = v11;
    [(NSXPCConnection *)v8->_connection setInterruptionHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_2;
    v15[3] = &unk_1E52DC308;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v8->_connection setInvalidationHandler:v15];
    v12 = _DUINewServerDestinationInterface();
    [(NSXPCConnection *)v8->_connection setRemoteObjectInterface:v12];

    v13 = _DUINewClientDestinationInterface();
    [(NSXPCConnection *)v8->_connection setExportedInterface:v13];

    [(NSXPCConnection *)v8->_connection setExportedObject:v8];
    [(NSXPCConnection *)v8->_connection resume];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)connect
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___UIDruidDestinationConnection_connect__block_invoke;
  aBlock[3] = &unk_1E52EC408;
  objc_copyWeak(&v8, &location);
  v3 = _Block_copy(aBlock);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___UIDruidDestinationConnection_connect__block_invoke_2;
  v5[3] = &unk_1E52EC430;
  objc_copyWeak(&v6, &location);
  v4 = [(_UIDruidDestinationConnection *)self serverDestinationProxyWithErrorHandler:v5];
  objc_msgSend(v4, "sawFirstDragEventWithSessionID:systemPolicy:destination:completion:", -[_UIDruidDestinationConnection sessionIdentifier](self, "sessionIdentifier"), -[_UIDruidDestinationConnection isSystemPolicy](self, "isSystemPolicy"), self, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)dirtyItems:(id)a3
{
  id v4 = a3;
  v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &dirtyItems____s_category_696) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection dirtyItems:", v6, 2u);
  }
  [(_DUIServerSessionDestination *)self->_serverSession dirtyDestinationItems:v4];
}

- (void)sawDragEndEvent
{
  v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &sawDragEndEvent___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection sawDragEndEvent", v6, 2u);
  }
  int64_t v4 = [(_UIDruidDestinationConnection *)self state];
  if (v4)
  {
    if (v4 != 1) {
      return;
    }
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 5;
  }
  [(_UIDruidDestinationConnection *)self setState:v5];
}

- (void)takePotentialDrop:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &takePotentialDrop____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection takePotentialDrop:%@", (uint8_t *)&v6, 0xCu);
  }
  if ([(_UIDruidDestinationConnection *)self state] == 1) {
    [(_DUIServerSessionDestination *)self->_serverSession takePotentialDrop:v4];
  }
}

- (void)requestDropWithOperation:(unint64_t)a3 layerContext:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &requestDropWithOperation_layerContext____s_category) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection requestDropWithOperation:%lu", (uint8_t *)&v8, 0xCu);
  }
  if ([(_UIDruidDestinationConnection *)self state] == 1) {
    [(_DUIServerSessionDestination *)self->_serverSession requestDropWithOperation:a3 layerContext:v6];
  }
}

- (void)enableKeyboardIfNeeded
{
}

- (void)requestVisibleItems:(id)a3
{
}

- (void)requestDragPreviewsForIndexSet:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &requestDragPreviewsForIndexSet_reply____s_category_697)
                    + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection requestDragPreviewsForIndexSet:reply: %@", buf, 0xCu);
  }
  unint64_t v9 = +[UIApplication _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke;
  v12[3] = &unk_1E52E3298;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performAsync:v12];
}

- (void)updatedPresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIApplication _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___UIDruidDestinationConnection_updatedPresentation___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsync:v7];
}

- (void)addedItemCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &addedItemCollection____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection addedItemCollection:", buf, 2u);
  }
  id v6 = +[UIApplication _systemAnimationFenceExemptQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___UIDruidDestinationConnection_addedItemCollection___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performAsync:v8];
}

- (void)performDropWithItemCollection:(id)a3 dataProviderEndpoint:(id)a4 visibleDroppedItems:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion____s_category)+ 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection:...", buf, 2u);
  }
  v15 = +[UIApplication _systemAnimationFenceExemptQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke;
  v20[3] = &unk_1E52E8FE8;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v15 performAsync:v20];
}

- (void)handOffDroppedItems:(id)a3 withFence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &handOffDroppedItems_withFence____s_category) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection handOffDroppedItems:withFence:", buf, 2u);
  }
  id v9 = +[UIApplication _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63___UIDruidDestinationConnection_handOffDroppedItems_withFence___block_invoke;
  v12[3] = &unk_1E52DCB30;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performAsync:v12];
}

- (void)dragEnded
{
  v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &dragEnded___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection: dragEnded", buf, 2u);
  }
  id v4 = +[UIApplication _systemAnimationFenceExemptQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___UIDruidDestinationConnection_dragEnded__block_invoke;
  v5[3] = &unk_1E52D9F70;
  void v5[4] = self;
  [v4 performAsync:v5];
}

- (void)setState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_unint64_t state = a3;
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &setState____s_category_702) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = stringFromDraggingSessionDestinationState(state);
      id v9 = stringFromDraggingSessionDestinationState(a3);
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "_UIInternalDraggingSessionDestination: State changing from %@ to %@", (uint8_t *)&v13, 0x16u);
    }
    if (state - 2 >= 2 && state != 0)
    {
      if (state == 1)
      {
        if (a3 == 2)
        {
          [(_DUIServerSessionDestination *)self->_serverSession sawDragEndEvent];
          return;
        }
      }
      else if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Should not transition from a terminal state to a non-terminal state"];
      }
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      id v11 = [(_UIDruidDestinationConnection *)self dragEndBlock];

      if (v11)
      {
        id v12 = [(_UIDruidDestinationConnection *)self dragEndBlock];
        ((void (**)(void, BOOL))v12)[2](v12, a3 == 4);
      }
      [(_UIDruidDestinationConnection *)self setConnectionBlock:0];
      [(_UIDruidDestinationConnection *)self setDragPreviewProviderBlock:0];
      [(_UIDruidDestinationConnection *)self setHandOffDroppedItemsBlock:0];
      [(_UIDruidDestinationConnection *)self setDropPerformBlock:0];
      [(_UIDruidDestinationConnection *)self setDragEndBlock:0];
      [(NSXPCConnection *)self->_connection invalidate];
    }
  }
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)connectionBlock
{
  return self->_connectionBlock;
}

- (void)setConnectionBlock:(id)a3
{
}

- (id)dragEndBlock
{
  return self->_dragEndBlock;
}

- (void)setDragEndBlock:(id)a3
{
}

- (id)dropPerformBlock
{
  return self->_dropPerformBlock;
}

- (void)setDropPerformBlock:(id)a3
{
}

- (id)handOffDroppedItemsBlock
{
  return self->_handOffDroppedItemsBlock;
}

- (void)setHandOffDroppedItemsBlock:(id)a3
{
}

- (id)dragPreviewProviderBlock
{
  return self->_dragPreviewProviderBlock;
}

- (void)setDragPreviewProviderBlock:(id)a3
{
}

- (id)itemsAddedBlock
{
  return self->_itemsAddedBlock;
}

- (void)setItemsAddedBlock:(id)a3
{
}

- (id)updatedPresentationBlock
{
  return self->_updatedPresentationBlock;
}

- (void)setUpdatedPresentationBlock:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isSystemPolicy
{
  return self->_systemPolicy;
}

- (void)setSystemPolicy:(BOOL)a3
{
  self->_systemPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPresentationBlock, 0);
  objc_storeStrong(&self->_itemsAddedBlock, 0);
  objc_storeStrong(&self->_dragPreviewProviderBlock, 0);
  objc_storeStrong(&self->_handOffDroppedItemsBlock, 0);
  objc_storeStrong(&self->_dropPerformBlock, 0);
  objc_storeStrong(&self->_dragEndBlock, 0);
  objc_storeStrong(&self->_connectionBlock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serverSession, 0);
}

@end