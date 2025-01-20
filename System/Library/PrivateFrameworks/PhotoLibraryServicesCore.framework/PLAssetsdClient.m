@interface PLAssetsdClient
+ (id)sharedSystemLibraryAssetsdClient;
- (PLAssetsdClient)init;
- (PLAssetsdClient)initWithPhotoLibraryURL:(id)a3;
- (PLAssetsdCloudClient)cloudClient;
- (PLAssetsdCloudInternalClient)cloudInternalClient;
- (PLAssetsdDebugClient)debugClient;
- (PLAssetsdDemoClient)demoClient;
- (PLAssetsdDiagnosticsClient)diagnosticsClient;
- (PLAssetsdLibraryClient)libraryClient;
- (PLAssetsdLibraryInternalClient)libraryInternalClient;
- (PLAssetsdLibraryManagementClient)libraryManagementClient;
- (PLAssetsdMigrationClient)migrationClient;
- (PLAssetsdNonBindingDebugClient)nonBindingDebugClient;
- (PLAssetsdNotificationClient)notificationClient;
- (PLAssetsdPhotoKitAddClient)photoKitAddClient;
- (PLAssetsdPhotoKitClient)photoKitClient;
- (PLAssetsdResourceAvailabilityClient)resourceAvailabilityClient;
- (PLAssetsdResourceClient)resourceClient;
- (PLAssetsdResourceInternalClient)resourceInternalClient;
- (PLAssetsdSyncClient)syncClient;
- (id)_setupClientClass:(Class)a3 proxyGetter:(SEL)a4 options:(int64_t)a5;
- (id)privacySupportClient;
- (id)resourceWriteOnlyClient;
- (id)systemLibraryURLReadOnlyClient;
- (void)_updateLibraryStateConnectionInterrupted:(id)a3;
- (void)addPhotoLibraryUnavailabilityHandler:(id)a3;
- (void)dealloc;
- (void)sendDaemonJob:(id)a3 shouldRunSerially:(BOOL)a4 replyHandler:(id)a5;
- (void)waitUntilConnectionSendsAllMessages;
@end

@implementation PLAssetsdClient

- (void)addPhotoLibraryUnavailabilityHandler:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  id v8 = v5;
  if (!connection)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLAssetsdClient.m", 151, @"Invalid parameter not satisfying: %@", @"_connection != nil" object file lineNumber description];

    id v5 = v8;
    connection = self->_connection;
  }
  [(PLAssetsdClientXPCConnection *)connection addPhotoLibraryUnavailabilityHandler:v5];
}

void __51__PLAssetsdClient_sharedSystemLibraryAssetsdClient__block_invoke_3()
{
  if (!sharedSystemLibraryAssetsdClient_sharedAssetsdClient)
  {
    v0 = [PLAssetsdClient alloc];
    id v3 = +[PLPhotoLibraryPathManagerCore systemLibraryURL];
    uint64_t v1 = [(PLAssetsdClient *)v0 initWithPhotoLibraryURL:v3];
    v2 = (void *)sharedSystemLibraryAssetsdClient_sharedAssetsdClient;
    sharedSystemLibraryAssetsdClient_sharedAssetsdClient = v1;
  }
}

- (PLAssetsdClient)initWithPhotoLibraryURL:(id)a3
{
  id v5 = a3;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (PLIsReallyAssetsd_isAssetsd) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = __PLIsAssetsdProxyService == 0;
  }
  if (!v6)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PLAssetsdClient.m" lineNumber:133 description:@"PLAssetsdClient must not be used by assetsd"];
  }
  v19.receiver = self;
  v19.super_class = (Class)PLAssetsdClient;
  v7 = [(PLAssetsdClient *)&v19 init];
  if (v7)
  {
    id v8 = objc_alloc_init(PLAssetsdClientSandboxExtensions);
    sandboxExtensions = v7->_sandboxExtensions;
    v7->_sandboxExtensions = v8;

    v10 = objc_alloc_init(PLAssetsdClientXPCConnection);
    connection = v7->_connection;
    v7->_connection = v10;

    v12 = [[PLAutoBindingProxyFactory alloc] initWithProxyFactory:v7->_connection photoLibraryURL:v5];
    autoBindingProxyFactory = v7->_autoBindingProxyFactory;
    v7->_autoBindingProxyFactory = v12;

    dispatch_queue_t v14 = dispatch_queue_create("PLAssetsdClient isolation queue", 0);
    isolationQueue = v7->_isolationQueue;
    v7->_isolationQueue = (OS_dispatch_queue *)v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel__updateLibraryStateConnectionInterrupted_ name:@"PLAssetsdClientXPCConnectionInterruptedInternalNotificationName" object:v7->_connection];
  }
  return v7;
}

void __45__PLAssetsdClient_resourceAvailabilityClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 80));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getResourceAvailabilityServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

void __41__PLAssetsdClient_resourceInternalClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 112));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getResourceInternalServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (id)_setupClientClass:(Class)a3 proxyGetter:(SEL)a4 options:(int64_t)a5
{
  char v5 = a5;
  uint64_t v9 = 24;
  if ((a5 & 1) == 0) {
    uint64_t v9 = 16;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  id v11 = [a3 alloc];
  isolationQueue = self->_isolationQueue;
  if ((v5 & 2) != 0) {
    uint64_t v13 = [v11 initWithQueue:isolationQueue proxyCreating:v10 proxyGetter:a4 sandboxExtensions:self->_sandboxExtensions];
  }
  else {
    uint64_t v13 = [v11 initWithQueue:isolationQueue proxyCreating:v10 proxyGetter:a4];
  }
  dispatch_queue_t v14 = (void *)v13;

  return v14;
}

uint64_t __51__PLAssetsdClient_sharedSystemLibraryAssetsdClient__block_invoke()
{
  sharedSystemLibraryAssetsdClient_sharedAssetsdClientQueue = (uint64_t)dispatch_queue_create("sharedSystemLibraryAssetsdClient", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedSystemLibraryAssetsdClient
{
  if (sharedSystemLibraryAssetsdClient_onceToken != -1) {
    dispatch_once(&sharedSystemLibraryAssetsdClient_onceToken, &__block_literal_global_6425);
  }
  notify_register_dispatch("com.apple.photos.systemphotolibraryurl", (int *)&sharedSystemLibraryAssetsdClient_splURLChangeNotificationToken, (dispatch_queue_t)sharedSystemLibraryAssetsdClient_sharedAssetsdClientQueue, &__block_literal_global_4);
  dispatch_sync((dispatch_queue_t)sharedSystemLibraryAssetsdClient_sharedAssetsdClientQueue, &__block_literal_global_6_6426);
  v2 = (void *)sharedSystemLibraryAssetsdClient_sharedAssetsdClient;
  return v2;
}

- (PLAssetsdResourceInternalClient)resourceInternalClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  id v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PLAssetsdClient_resourceInternalClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdResourceInternalClient *)v3;
}

- (PLAssetsdResourceAvailabilityClient)resourceAvailabilityClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  id v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PLAssetsdClient_resourceAvailabilityClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdResourceAvailabilityClient *)v3;
}

void __36__PLAssetsdClient_diagnosticsClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 168));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getDiagnosticsServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 168);
    *(void *)(v3 + 168) = v2;

    char v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdDiagnosticsClient)diagnosticsClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  id v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PLAssetsdClient_diagnosticsClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDiagnosticsClient *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBindingDebugClient, 0);
  objc_storeStrong((id *)&self->_privacySupportClient, 0);
  objc_storeStrong((id *)&self->_debugClient, 0);
  objc_storeStrong((id *)&self->_diagnosticsClient, 0);
  objc_storeStrong((id *)&self->_demoClient, 0);
  objc_storeStrong((id *)&self->_notificationClient, 0);
  objc_storeStrong((id *)&self->_syncClient, 0);
  objc_storeStrong((id *)&self->_migrationClient, 0);
  objc_storeStrong((id *)&self->_cloudInternalClient, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_resourceInternalClient, 0);
  objc_storeStrong((id *)&self->_resourceWriteOnlyClient, 0);
  objc_storeStrong((id *)&self->_resourceClient, 0);
  objc_storeStrong((id *)&self->_photoKitAddClient, 0);
  objc_storeStrong((id *)&self->_resourceAvailabilityClient, 0);
  objc_storeStrong((id *)&self->_photoKitClient, 0);
  objc_storeStrong((id *)&self->_libraryManagementClient, 0);
  objc_storeStrong((id *)&self->_systemLibraryURLReadOnlyClient, 0);
  objc_storeStrong((id *)&self->_libraryInternalClient, 0);
  objc_storeStrong((id *)&self->_libraryClient, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_autoBindingProxyFactory, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (void)waitUntilConnectionSendsAllMessages
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = _os_activity_create(&dword_19BCFB000, "Submitting barrier block to NSXPC send queue", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v3, &v5);
    dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_98_6340);
    [(PLAssetsdClientXPCConnection *)self->_connection addBarrierBlock:v4];
    dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

    os_activity_scope_leave(&v5);
  }
  else
  {
    id v3 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5.opaque[0]) = 0;
      _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Proxy factory object does not respond to addBarrierBlock:", (uint8_t *)&v5, 2u);
    }
  }
}

void __54__PLAssetsdClient_waitUntilConnectionSendsAllMessages__block_invoke()
{
  v0 = _os_activity_create(&dword_19BCFB000, "NSXPC barrier block", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(v0, &v1);
  os_activity_scope_leave(&v1);
}

- (void)sendDaemonJob:(id)a3 shouldRunSerially:(BOOL)a4 replyHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (char *)a3;
  id v10 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendDaemonJob:shouldRunSerially:replyHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v13 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  dispatch_queue_t v14 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v9;
    _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_DEFAULT, "Sending sendDaemonJob:shouldRunSerially:replyHandler: with job %@", buf, 0xCu);
  }

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3254779904;
  block[2] = __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke;
  block[3] = &unk_1EEBF5378;
  id v16 = v10;
  id v24 = v16;
  block[4] = self;
  char v25 = v31;
  id v26 = *((id *)&v31 + 1);
  long long v27 = v32;
  long long v28 = v33;
  SEL v29 = a2;
  v17 = v9;
  v23 = v17;
  BOOL v30 = a4;
  dispatch_async(isolationQueue, block);

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    v18 = PLRequestGetLog();
    objc_super v19 = v18;
    os_signpost_id_t v20 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke_2;
    v20[3] = &unk_1E58A1BC8;
    id v21 = v2;
    dispatch_block_t v4 = [v3 remoteObjectProxyWithErrorHandler:v20];
    if (*(unsigned char *)(a1 + 56))
    {
      os_activity_scope_state_s v5 = PLRequestGetLog();
      os_signpost_id_t v6 = os_signpost_id_generate(v5);
      id v26 = @"SignpostId";
      v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v6];
      v27[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      objc_msgSend(v4, "set_userInfo:", v8);

      uint64_t v9 = v5;
      id v10 = v9;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        BOOL v11 = NSStringFromSelector(*(SEL *)(a1 + 104));
        *(_DWORD *)buf = 138543362;
        char v25 = v11;
        _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Async", "%{public}@", buf, 0xCu);
      }
    }
    [v4 runDaemonJob:*(void *)(a1 + 40) isSerial:*(unsigned __int8 *)(a1 + 112) withReply:*(void *)(a1 + 48)];

    v12 = v21;
  }
  else
  {
    v12 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxyWithErrorHandler:&__block_literal_global_94];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v13 = PLRequestGetLog();
      os_signpost_id_t v14 = os_signpost_id_generate(v13);
      v22 = @"SignpostId";
      v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v14];
      v23 = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      objc_msgSend(v12, "set_userInfo:", v16);

      v17 = v13;
      v18 = v17;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        objc_super v19 = NSStringFromSelector(*(SEL *)(a1 + 104));
        *(_DWORD *)buf = 138543362;
        char v25 = v19;
        _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Async", "%{public}@", buf, 0xCu);
      }
    }
    [v12 runDaemonJob:*(void *)(a1 + 40) isSerial:*(unsigned __int8 *)(a1 + 112)];
  }
}

uint64_t __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__PLAssetsdClient_sendDaemonJob_shouldRunSerially_replyHandler___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting assetsd remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_updateLibraryStateConnectionInterrupted:(id)a3
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PLAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke;
  block[3] = &unk_1E58A1EC0;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

void __60__PLAssetsdClient__updateLibraryStateConnectionInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v11 = *(void **)(v10 + 72);
  *(void *)(v10 + 72) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 80);
  *(void *)(v12 + 80) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 88);
  *(void *)(v14 + 88) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 96);
  *(void *)(v16 + 96) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  objc_super v19 = *(void **)(v18 + 104);
  *(void *)(v18 + 104) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = *(void **)(v20 + 112);
  *(void *)(v20 + 112) = 0;

  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 120);
  *(void *)(v22 + 120) = 0;

  uint64_t v24 = *(void *)(a1 + 32);
  char v25 = *(void **)(v24 + 128);
  *(void *)(v24 + 128) = 0;

  uint64_t v26 = *(void *)(a1 + 32);
  long long v27 = *(void **)(v26 + 136);
  *(void *)(v26 + 136) = 0;

  uint64_t v28 = *(void *)(a1 + 32);
  SEL v29 = *(void **)(v28 + 144);
  *(void *)(v28 + 144) = 0;

  uint64_t v30 = *(void *)(a1 + 32);
  long long v31 = *(void **)(v30 + 152);
  *(void *)(v30 + 152) = 0;

  uint64_t v32 = *(void *)(a1 + 32);
  long long v33 = *(void **)(v32 + 160);
  *(void *)(v32 + 160) = 0;

  uint64_t v34 = *(void *)(a1 + 32);
  v35 = *(void **)(v34 + 168);
  *(void *)(v34 + 168) = 0;

  uint64_t v36 = *(void *)(a1 + 32);
  v37 = *(void **)(v36 + 176);
  *(void *)(v36 + 176) = 0;

  uint64_t v38 = *(void *)(a1 + 32);
  v39 = *(void **)(v38 + 184);
  *(void *)(v38 + 184) = 0;

  uint64_t v40 = *(void *)(a1 + 32);
  v41 = *(void **)(v40 + 192);
  *(void *)(v40 + 192) = 0;
}

- (PLAssetsdNonBindingDebugClient)nonBindingDebugClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PLAssetsdClient_nonBindingDebugClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdNonBindingDebugClient *)v3;
}

void __40__PLAssetsdClient_nonBindingDebugClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 192));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getNonBindingDebugServiceWithReply_ options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 192);
    *(void *)(v3 + 192) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (id)privacySupportClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PLAssetsdClient_privacySupportClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__PLAssetsdClient_privacySupportClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 184));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getPrivacySupportServiceWithReply_ options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 184);
    *(void *)(v3 + 184) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdDebugClient)debugClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__PLAssetsdClient_debugClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDebugClient *)v3;
}

void __30__PLAssetsdClient_debugClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 176));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getDebugServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 176);
    *(void *)(v3 + 176) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdDemoClient)demoClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PLAssetsdClient_demoClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdDemoClient *)v3;
}

void __29__PLAssetsdClient_demoClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 160));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getDemoServiceWithReply_ options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 160);
    *(void *)(v3 + 160) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdNotificationClient)notificationClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PLAssetsdClient_notificationClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdNotificationClient *)v3;
}

void __37__PLAssetsdClient_notificationClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 152));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getNotificationServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 152);
    *(void *)(v3 + 152) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdSyncClient)syncClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PLAssetsdClient_syncClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdSyncClient *)v3;
}

void __29__PLAssetsdClient_syncClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 144));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getSyncServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 144);
    *(void *)(v3 + 144) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdMigrationClient)migrationClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PLAssetsdClient_migrationClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdMigrationClient *)v3;
}

void __34__PLAssetsdClient_migrationClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 136));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getMigrationServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdCloudInternalClient)cloudInternalClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PLAssetsdClient_cloudInternalClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdCloudInternalClient *)v3;
}

void __38__PLAssetsdClient_cloudInternalClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 128));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getCloudInternalServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 128);
    *(void *)(v3 + 128) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdCloudClient)cloudClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__PLAssetsdClient_cloudClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdCloudClient *)v3;
}

void __30__PLAssetsdClient_cloudClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 120));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getCloudServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 120);
    *(void *)(v3 + 120) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (id)resourceWriteOnlyClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PLAssetsdClient_resourceWriteOnlyClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__PLAssetsdClient_resourceWriteOnlyClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getResourceWriteOnlyServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 104);
    *(void *)(v3 + 104) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdResourceClient)resourceClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PLAssetsdClient_resourceClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdResourceClient *)v3;
}

void __33__PLAssetsdClient_resourceClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 96));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getResourceServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdPhotoKitAddClient)photoKitAddClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PLAssetsdClient_photoKitAddClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdPhotoKitAddClient *)v3;
}

void __36__PLAssetsdClient_photoKitAddClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 88));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getPhotoKitAddServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdPhotoKitClient)photoKitClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PLAssetsdClient_photoKitClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdPhotoKitClient *)v3;
}

void __33__PLAssetsdClient_photoKitClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 72));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getPhotoKitServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdLibraryManagementClient)libraryManagementClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PLAssetsdClient_libraryManagementClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryManagementClient *)v3;
}

void __42__PLAssetsdClient_libraryManagementClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 64));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getLibraryManagementServiceWithReply_ options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (id)systemLibraryURLReadOnlyClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PLAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__PLAssetsdClient_systemLibraryURLReadOnlyClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 56));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getSystemLibraryURLReadOnlyServiceWithReply_ options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdLibraryInternalClient)libraryInternalClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PLAssetsdClient_libraryInternalClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryInternalClient *)v3;
}

void __40__PLAssetsdClient_libraryInternalClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 48));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getLibraryInternalServiceWithReply_ options:1];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (PLAssetsdLibraryClient)libraryClient
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6361;
  uint64_t v10 = __Block_byref_object_dispose__6362;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__PLAssetsdClient_libraryClient__block_invoke;
  v5[3] = &unk_1E58A1F28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PLAssetsdLibraryClient *)v3;
}

void __32__PLAssetsdClient_libraryClient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _setupClientClass:objc_opt_class() proxyGetter:sel_getLibraryServiceWithReply_ options:3];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v5, v2);
  }
}

- (void)dealloc
{
  [(PLAssetsdClientXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLAssetsdClient;
  [(PLAssetsdClient *)&v3 dealloc];
}

- (PLAssetsdClient)init
{
  return 0;
}

void __51__PLAssetsdClient_sharedSystemLibraryAssetsdClient__block_invoke_2()
{
  v0 = (void *)sharedSystemLibraryAssetsdClient_sharedAssetsdClient;
  sharedSystemLibraryAssetsdClient_sharedAssetsdClient = 0;
}

@end