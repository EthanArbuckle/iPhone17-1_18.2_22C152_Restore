@interface ICCloudBadgingService
- (ICCloudBadgingService)initWithListenerEndpointProvider:(id)a3;
- (ICCloudServerListenerEndpointProviding)listenerEndpointProvider;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)serialQueue;
- (id)_xpcConnectionWithListenerEndpoint:(id)a3;
- (void)reportAppIconBadgeActionMetrics;
@end

@implementation ICCloudBadgingService

- (ICCloudBadgingService)initWithListenerEndpointProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICCloudBadgingService;
  v5 = [(ICCloudBadgingService *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listenerEndpointProvider, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunescloudd.ICCloudBadgingService.serial.queue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (void)reportAppIconBadgeActionMetrics
{
  id v3 = [(ICCloudBadgingService *)self xpcConnection];
  v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_40378];
  [v2 reportAppIconBadgeActionMetrics];
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__40373;
  v11 = __Block_byref_object_dispose__40374;
  id v12 = 0;
  id v3 = [(ICCloudBadgingService *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__ICCloudBadgingService_xpcConnection__block_invoke;
  v6[3] = &unk_1E5ACD880;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

void __38__ICCloudBadgingService_xpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "ICCloudBadgingService %p - Creating XPC Client Connection [started]", buf, 0xCu);
    }

    v5 = [*(id *)(a1 + 32) listenerEndpointProvider];
    id v19 = 0;
    v6 = [v5 listenerEndpointForService:7 error:&v19];
    id v7 = v19;

    if (!v6 || v7)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218498;
        uint64_t v21 = v18;
        __int16 v22 = 2114;
        v23 = v6;
        __int16 v24 = 2114;
        id v25 = v7;
        v14 = "ICCloudBadgingService %p - Creating XPC Client Connection [failed] - endpoint=%{public}@ - error=%{public}@";
        v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 32;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 32) _xpcConnectionWithListenerEndpoint:v6];
      uint64_t v9 = *(void *)(a1 + 32);
      objc_super v10 = *(void **)(v9 + 8);
      *(void *)(v9 + 8) = v8;

      v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        *(_DWORD *)buf = 134218242;
        uint64_t v21 = v12;
        __int16 v22 = 2114;
        v23 = v13;
        v14 = "ICCloudBadgingService %p - Creating XPC Client Connection [done] - connection=%{public}@";
        v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 22;
LABEL_10:
        _os_log_impl(&dword_1A2D01000, v15, v16, v14, buf, v17);
      }
    }

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (ICCloudServerListenerEndpointProviding)listenerEndpointProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listenerEndpointProvider);

  return (ICCloudServerListenerEndpointProviding *)WeakRetained;
}

- (id)_xpcConnectionWithListenerEndpoint:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67BC00];
    [v5 setRemoteObjectInterface:v6];
    [v5 setExportedObject:self];
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke;
    v13[3] = &unk_1E5ACD778;
    objc_copyWeak(&v14, location);
    [v5 setInterruptionHandler:v13];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    objc_super v10 = __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke_48;
    v11 = &unk_1E5ACD778;
    objc_copyWeak(&v12, location);
    [v5 setInvalidationHandler:&v8];
    objc_msgSend(v5, "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = self;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "ICCloudBadgingService %p - Unable to create XPC Connection [no listener endpoint]", (uint8_t *)location, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listenerEndpointProvider);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudBadgingService %p - Connection to badging service interrupted", buf, 0xCu);
  }

  id v3 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke_47;
  block[3] = &unk_1E5ACD750;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_sync(v3, block);
}

void __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke_48(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudBadgingService %p - Connection to badging service invalidated", buf, 0xCu);
  }

  id v3 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke_49;
  block[3] = &unk_1E5ACD750;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_sync(v3, block);
}

void __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke_49(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudBadgingService %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

void __60__ICCloudBadgingService__xpcConnectionWithListenerEndpoint___block_invoke_47(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudBadgingService %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

@end