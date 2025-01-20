@interface NFXPCServiceClient
- (NFXPCServiceClient)initWithService:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6;
- (NFXPCServiceClient)initWithService:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6 xpcDispatchQueue:(id)a7;
- (NSXPCConnection)connection;
- (void)addDelegate:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation NFXPCServiceClient

- (NSXPCConnection)connection
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = self;
  objc_sync_enter(v3);
  xpcConnection = v3->_xpcConnection;
  if (!xpcConnection)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v3->_serviceName options:4096];
    v6 = v3->_xpcConnection;
    v3->_xpcConnection = (NSXPCConnection *)v5;

    v7 = [(NFXPCServiceClient *)v3 connection];

    v8 = (const void **)MEMORY[0x1E4FBA898];
    if (!v7)
    {
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v3);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v10(3, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", v14, ClassName, Name, 74);
      }
      dispatch_get_specific(*v8);
      v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(v3);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v17;
        __int16 v27 = 2082;
        v28 = object_getClassName(v3);
        __int16 v29 = 2082;
        v30 = sel_getName(a2);
        __int16 v31 = 1024;
        int v32 = 74;
        _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", (uint8_t *)&buf, 0x22u);
      }
    }
    [(NSXPCConnection *)v3->_xpcConnection setRemoteObjectInterface:v3->_remoteObjectInterface];
    [(NSXPCConnection *)v3->_xpcConnection setExportedInterface:v3->_exportedInterface];
    [(NSXPCConnection *)v3->_xpcConnection setExportedObject:v3->_exportedObject];
    objc_initWeak(&buf, v3);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __32__NFXPCServiceClient_connection__block_invoke;
    v24[3] = &unk_1E595D680;
    objc_copyWeak(&v25, &buf);
    [(NSXPCConnection *)v3->_xpcConnection setInvalidationHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __32__NFXPCServiceClient_connection__block_invoke_3;
    v22[3] = &unk_1E595D680;
    objc_copyWeak(&v23, &buf);
    [(NSXPCConnection *)v3->_xpcConnection setInterruptionHandler:v22];
    if (v3->_xpcQueue) {
      -[NSXPCConnection _setQueue:](v3->_xpcConnection, "_setQueue:");
    }
    v18 = [(NSXPCConnection *)v3->_xpcConnection _queue];
    dispatch_queue_set_specific(v18, *v8, 0, 0);

    [(NSXPCConnection *)v3->_xpcConnection resume];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&buf);
    xpcConnection = v3->_xpcConnection;
  }
  v19 = xpcConnection;
  objc_sync_exit(v3);

  return v19;
}

- (NFXPCServiceClient)initWithService:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6 xpcDispatchQueue:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)NFXPCServiceClient;
  int v17 = [(NFXPCServiceClient *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v17->_delegates;
    v17->_delegates = (NSHashTable *)v18;

    objc_storeStrong((id *)&v17->_serviceName, a3);
    objc_storeStrong((id *)&v17->_xpcQueue, a7);
    objc_storeStrong((id *)&v17->_remoteObjectInterface, a4);
    objc_storeStrong((id *)&v17->_exportedInterface, a5);
    objc_storeStrong(&v17->_exportedObject, a6);
    v20 = v17;
  }

  return v17;
}

- (void)addDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  [(NSHashTable *)obj->_delegates addObject:v4];

  obj->_clientCount = [(NSHashTable *)obj->_delegates count];
  objc_sync_exit(obj);
}

- (NFXPCServiceClient)initWithService:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6
{
  return [(NFXPCServiceClient *)self initWithService:a3 remoteObjectInterface:a4 exportedInterface:a5 exportedObject:a6 xpcDispatchQueue:0];
}

void __32__NFXPCServiceClient_connection__block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_19D636000, "XPC service client invalidated", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  v3 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NFXPCServiceClient_connection__block_invoke_2;
  block[3] = &unk_1E595D680;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __32__NFXPCServiceClient_connection__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    id v4 = (void *)[v3[2] copy];
    id v5 = v3[1];
    v3[1] = 0;

    objc_sync_exit(v3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "didInvalidate", (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

void __32__NFXPCServiceClient_connection__block_invoke_3(uint64_t a1)
{
  v2 = _os_activity_create(&dword_19D636000, "XPC service client interrupted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  v3 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NFXPCServiceClient_connection__block_invoke_4;
  block[3] = &unk_1E595D680;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __32__NFXPCServiceClient_connection__block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    id v4 = (void *)[v3[2] copy];
    id v5 = v3[1];
    objc_sync_exit(v3);

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "didInterrupt:", v5, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)removeDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  [(NSHashTable *)obj->_delegates removeObject:v4];

  uint64_t v5 = [(NSHashTable *)obj->_delegates count];
  obj->_clientCount = v5;
  if (!v5)
  {
    [(NSXPCConnection *)obj->_xpcConnection invalidate];
    xpcConnection = obj->_xpcConnection;
    obj->_xpcConnection = 0;
  }
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end