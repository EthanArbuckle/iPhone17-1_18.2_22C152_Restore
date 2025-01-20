@interface ICPlayActivityCenter
+ (ICPlayActivityCenter)shared;
- (ICPlayActivityCenter)init;
- (id)_daemonPlayActivityControllerConnection;
- (void)dealloc;
- (void)flushPendingPlayActivityEventsWithCompletionHandler:(id)a3;
- (void)recordPlayActivityEvents:(id)a3 shouldFlush:(BOOL)a4 withCompletionHandler:(id)a5;
@end

@implementation ICPlayActivityCenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_daemonPlayActivityControllerConnection, 0);
}

- (id)_daemonPlayActivityControllerConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  daemonPlayActivityControllerConnection = self->_daemonPlayActivityControllerConnection;
  if (!daemonPlayActivityControllerConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloudd.playactivity" options:0];
    v5 = self->_daemonPlayActivityControllerConnection;
    self->_daemonPlayActivityControllerConnection = v4;

    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B840];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_insertPlayActivityEvents_shouldFlush_withCompletionHandler_ argumentIndex:0 ofReply:0];

    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection setRemoteObjectInterface:v6];
    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection setInterruptionHandler:&__block_literal_global_66];
    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection setInvalidationHandler:&__block_literal_global_69];
    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection resume];

    daemonPlayActivityControllerConnection = self->_daemonPlayActivityControllerConnection;
  }

  return daemonPlayActivityControllerConnection;
}

void __63__ICPlayActivityCenter__daemonPlayActivityControllerConnection__block_invoke_67()
{
  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A2D01000, v0, OS_LOG_TYPE_DEFAULT, "Connection to daemon play activity controller invalidated.", v1, 2u);
  }
}

void __63__ICPlayActivityCenter__daemonPlayActivityControllerConnection__block_invoke()
{
  v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A2D01000, v0, OS_LOG_TYPE_DEFAULT, "Connection to daemon play activity controller interrupted.", v1, 2u);
  }
}

- (void)recordPlayActivityEvents:(id)a3 shouldFlush:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = self->_serialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E5ACCFB8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(serialQueue, v13);
}

void __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _daemonPlayActivityControllerConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5ACB578;
  v3 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v12 = *(id *)(a1 + 48);
  v4 = [v2 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2_10;
  v7[3] = &unk_1E5ACB578;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  [v4 insertPlayActivityEvents:v8 shouldFlush:v5 withCompletionHandler:v7];
}

void __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138543874;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Error %{public}@ recording %lu play activity events", buf, 0x20u);
  }

  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_9;
    v9[3] = &unk_1E5ACD2F0;
    id v11 = v7;
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

void __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_2_10(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138543874;
    __int16 v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished recording %lu play activity events with error %{public}@", buf, 0x20u);
  }
  id v8 = *(void **)(a1 + 48);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_11;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v3;
    dispatch_async(v9, v10);
  }
}

uint64_t __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __83__ICPlayActivityCenter_recordPlayActivityEvents_shouldFlush_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)flushPendingPlayActivityEventsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _daemonPlayActivityControllerConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5ACD8E0;
  id v3 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2_7;
  v6[3] = &unk_1E5ACD8E0;
  uint64_t v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 flushPendingPlayActivityEventsWithCompletionHandler:v6];
}

void __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@  Error %{public}@ flushing play activity events", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_5;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_2_7(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@  Finished flushing play activity events with error %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_8;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__ICPlayActivityCenter_flushPendingPlayActivityEventsWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICPlayActivityCenter;
  [(ICPlayActivityCenter *)&v3 dealloc];
}

- (ICPlayActivityCenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICPlayActivityCenter;
  v2 = [(ICPlayActivityCenter *)&v7 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesCloud.ICPlayActivityCenter.serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (ICPlayActivityCenter)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_22606);
  }
  v2 = (void *)_sharedInstance;

  return (ICPlayActivityCenter *)v2;
}

uint64_t __30__ICPlayActivityCenter_shared__block_invoke()
{
  v0 = objc_alloc_init(ICPlayActivityCenter);
  uint64_t v1 = _sharedInstance;
  _sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end