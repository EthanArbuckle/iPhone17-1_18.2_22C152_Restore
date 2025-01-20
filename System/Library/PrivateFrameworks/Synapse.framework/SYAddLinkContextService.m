@interface SYAddLinkContextService
- (BOOL)_forTesting;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)_listener;
- (OS_dispatch_queue)_serviceQueue;
- (SYAddLinkContextService)init;
- (SYAddLinkContextServiceDelegate)delegate;
- (id)_listenerEndpoint;
- (id)initForTesting:(BOOL)a3;
- (void)beginListeningToConnections;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)set_listener:(id)a3;
- (void)set_serviceQueue:(id)a3;
- (void)userDidRemoveContentItemDatas:(id)a3;
- (void)userEditDidAddContentItemDatas:(id)a3;
- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4;
@end

@implementation SYAddLinkContextService

- (SYAddLinkContextService)init
{
  return (SYAddLinkContextService *)[(SYAddLinkContextService *)self initForTesting:0];
}

- (id)initForTesting:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SYAddLinkContextService;
  v4 = [(SYAddLinkContextService *)&v9 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.synapse.AddLinkContextService", v5);
    serviceQueue = v4->__serviceQueue;
    v4->__serviceQueue = (OS_dispatch_queue *)v6;

    v4->__forTesting = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(SYAddLinkContextService *)self _listener];
  [v3 setDelegate:0];

  v4 = [(SYAddLinkContextService *)self _listener];
  [v4 invalidate];

  [(SYAddLinkContextService *)self set_listener:0];
  v5.receiver = self;
  v5.super_class = (Class)SYAddLinkContextService;
  [(SYAddLinkContextService *)&v5 dealloc];
}

- (void)beginListeningToConnections
{
  v3 = [(SYAddLinkContextService *)self _listener];

  if (!v3)
  {
    BOOL v4 = [(SYAddLinkContextService *)self _forTesting];
    objc_super v5 = os_log_create("com.apple.synapse", "AddLinkContext");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "AddLinkContextService: Starting Add Link Context Service with anonymous listener for testing", buf, 2u);
      }

      uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "AddLinkContextService: Starting Add Link Context Service", v13, 2u);
      }

      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.synapse.add-link-context-service"];
    }
    v8 = (void *)v7;
    [(SYAddLinkContextService *)self set_listener:v7];

    objc_super v9 = [(SYAddLinkContextService *)self _listener];
    v10 = [(SYAddLinkContextService *)self _serviceQueue];
    [v9 _setQueue:v10];

    v11 = [(SYAddLinkContextService *)self _listener];
    [v11 setDelegate:self];

    v12 = [(SYAddLinkContextService *)self _listener];
    [v12 resume];
  }
}

- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4
{
  id v13 = a3;
  BOOL v6 = (void (**)(id, void))a4;
  uint64_t v7 = [(SYAddLinkContextService *)self delegate];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v13];
    objc_super v9 = v8;
    if (v8
      && ([v8 activityType],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqualToString:*MEMORY[0x1E4F28AC0]],
          v10,
          v11))
    {
      v12 = [(SYAddLinkContextService *)self delegate];
      [v12 userWillAddLinkWithActivityData:v13 completion:v6];
    }
    else if (v6)
    {
      v6[2](v6, 0);
    }
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)userDidRemoveContentItemDatas:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SYAddLinkContextService *)self delegate];

  if (v4)
  {
    objc_super v5 = [(SYAddLinkContextService *)self delegate];
    [v5 userDidRemoveContentItemDatas:v6];
  }
}

- (void)userEditDidAddContentItemDatas:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SYAddLinkContextService *)self delegate];

  if (v4)
  {
    objc_super v5 = [(SYAddLinkContextService *)self delegate];
    [v5 userEditDidAddContentItemDatas:v6];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SYAddLinkContextService.m", 107, @"Invalid parameter not satisfying: %@", @"newConnection" object file lineNumber description];
  }
  id v9 = [(SYAddLinkContextService *)self _listener];

  if (v9 != v7) {
    goto LABEL_4;
  }
  if (![(SYAddLinkContextService *)self _forTesting])
  {
    int v11 = [v8 valueForEntitlement:@"com.apple.synapse.allowAddLinkContextRequests"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v11 BOOLValue])
    {
      v18 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SYAddLinkContextService listener:shouldAcceptNewConnection:]((uint64_t)v8, v18);
      }

LABEL_4:
      BOOL v10 = 0;
      goto LABEL_10;
    }
  }
  v12 = [(SYAddLinkContextService *)self _serviceQueue];
  [v8 _setQueue:v12];

  id v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2C760];
  [v8 setExportedInterface:v13];

  [v8 setExportedObject:self];
  [v8 resume];
  BOOL v10 = 1;
LABEL_10:
  v14 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = [v8 processIdentifier];
    v16 = @"No";
    if (v10) {
      v16 = @"Yes";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_INFO, "AddLinkContextService: Listener should accept connection from pid %ld: %@", buf, 0x16u);
  }

  return v10;
}

- (id)_listenerEndpoint
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__7;
  int v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  v3 = [(SYAddLinkContextService *)self _serviceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SYAddLinkContextService__listenerEndpoint__block_invoke;
  v6[3] = &unk_1E6463A88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__SYAddLinkContextService__listenerEndpoint__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _listener];
  uint64_t v2 = [v5 endpoint];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SYAddLinkContextServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYAddLinkContextServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (void)set_listener:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "AddLinkContextService: Refusing connection from non-entitled client with connection: %@", (uint8_t *)&v2, 0xCu);
}

@end