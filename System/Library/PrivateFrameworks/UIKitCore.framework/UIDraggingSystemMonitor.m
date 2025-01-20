@interface UIDraggingSystemMonitor
+ (id)new;
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcQueue_shouldAcceptNewConnection:(id)a3;
- (NSSet)sessions;
- (UIDraggingSystemMonitor)init;
- (UIDraggingSystemMonitorDelegate)delegate;
- (id)_init;
- (id)sessionForDropSession:(id)a3;
- (void)dragDidBeginWithSystemSession:(id)a3 info:(id)a4 reply:(id)a5;
- (void)dragDidEndWithSystemSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)xpcQueue_acceptNewConnection:(id)a3;
@end

@implementation UIDraggingSystemMonitor

- (id)_init
{
  if (qword_1EB264968 != -1) {
    dispatch_once(&qword_1EB264968, &__block_literal_global_589);
  }
  if (_MergedGlobals_1278)
  {
    v13.receiver = self;
    v13.super_class = (Class)UIDraggingSystemMonitor;
    v3 = [(UIDraggingSystemMonitor *)&v13 init];
    if (v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      sessionsBySessionInfo = v3->_sessionsBySessionInfo;
      v3->_sessionsBySessionInfo = (NSMapTable *)v4;

      v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.UIKit.druid.system.xpcQueue", v6);
      xpcQueue = v3->_xpcQueue;
      v3->_xpcQueue = (OS_dispatch_queue *)v7;

      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.DragUI.druid.system"];
      systemListener = v3->_systemListener;
      v3->_systemListener = (NSXPCListener *)v9;

      [(NSXPCListener *)v3->_systemListener _setQueue:v3->_xpcQueue];
      [(NSXPCListener *)v3->_systemListener setDelegate:v3];
      [(NSXPCListener *)v3->_systemListener resume];
    }
    self = v3;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UIDraggingSystemMonitor)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__UIDraggingSystemMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB264958 != -1) {
    dispatch_once(&qword_1EB264958, block);
  }
  v2 = (void *)qword_1EB264960;
  return v2;
}

void __41__UIDraggingSystemMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)qword_1EB264960;
  qword_1EB264960 = v1;
}

- (NSSet)sessions
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMapTable *)self->_sessionsBySessionInfo objectEnumerator];
  uint64_t v4 = [v3 allObjects];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)sessionForDropSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 sessionDestination];
    int v6 = [v5 sessionIdentifier];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    dispatch_queue_t v7 = [(NSMapTable *)self->_sessionsBySessionInfo keyEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 sessionIdentifier] == v6)
          {
            objc_super v13 = [(NSMapTable *)self->_sessionsBySessionInfo objectForKey:v12];
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    objc_super v13 = 0;
LABEL_13:
  }
  else
  {
    objc_super v13 = 0;
  }

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return [(UIDraggingSystemMonitor *)self xpcQueue_shouldAcceptNewConnection:a4];
}

- (BOOL)xpcQueue_shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueForEntitlement:@"com.apple.druid"];
  int v6 = [v5 isEqual:MEMORY[0x1E4F1CC38]];

  if (v6)
  {
    [(UIDraggingSystemMonitor *)self xpcQueue_acceptNewConnection:v4];
    [v4 resume];
  }

  return v6;
}

- (void)xpcQueue_acceptNewConnection:(id)a3
{
  id v4 = a3;
  [v4 _setQueue:self->_xpcQueue];
  v5 = _DUINewClientSystemAppInterface();
  [v4 setExportedInterface:v5];

  [v4 setExportedObject:self];
  [v4 setRemoteObjectInterface:0];
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke;
  v8[3] = &unk_1E52DC308;
  objc_copyWeak(&v9, &location);
  [v4 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke_2;
  v6[3] = &unk_1E52DC308;
  objc_copyWeak(&v7, &from);
  [v4 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[3] removeAllObjects];
    id WeakRetained = v2;
  }
}

- (void)dragDidBeginWithSystemSession:(id)a3 info:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = objc_opt_new();
  [v11 setServerSession:v10];

  [v11 setInfo:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke;
  v15[3] = &unk_1E52DC7E8;
  v15[4] = self;
  id v16 = v11;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke(id *a1)
{
  v2 = [a1[4] delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 touchRoutingPolicyForBeginningDragSessionWithInfo:a1[6]];
    [a1[5] setRoutingPolicy:v3];

    id v4 = [a1[5] routingPolicy];
    int v5 = [v4 isHitTestingDisabled];

    if (v5) {
      [a1[5] commandeerImmediately];
    }
  }
  id v6 = a1[4];
  id v7 = *((void *)v6 + 2);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke_2;
  v11 = &unk_1E52DC7E8;
  id v12 = v6;
  id v13 = a1[5];
  id v14 = a1[6];
  id v15 = a1[7];
  dispatch_async(v7, &v8);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v2, "dragSessionDidBegin:", a1[5], v8, v9, v10, v11, v12, v13, v14);
  }
}

void __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 40) routingPolicy];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)dragDidEndWithSystemSession:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMapTable *)self->_sessionsBySessionInfo objectForKey:v4];
  if (v5)
  {
    [(NSMapTable *)self->_sessionsBySessionInfo removeObjectForKey:v4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__UIDraggingSystemMonitor_dragDidEndWithSystemSession___block_invoke;
    v6[3] = &unk_1E52D9F98;
    void v6[4] = self;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __55__UIDraggingSystemMonitor_dragDidEndWithSystemSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 dragSessionDidEnd:*(void *)(a1 + 40)];
  }
}

- (UIDraggingSystemMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDraggingSystemMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionsBySessionInfo, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_systemListener, 0);
}

@end