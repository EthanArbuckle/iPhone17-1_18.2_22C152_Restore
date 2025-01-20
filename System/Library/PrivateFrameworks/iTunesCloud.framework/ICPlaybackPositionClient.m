@interface ICPlaybackPositionClient
+ (id)sharedService;
- (ICPlaybackPositionClient)init;
- (NSXPCConnection)connection;
- (void)deletePlaybackPositionEntities;
- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 completionBlock:(id)a6;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)synchronizePlaybackPositions;
- (void)synchronizePlaybackPositionsForLibraryWithIdentifier:(id)a3 forDomain:(id)a4 isCheckpoint:(BOOL)a5;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
@end

@implementation ICPlaybackPositionClient

- (ICPlaybackPositionClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICPlaybackPositionClient;
  v2 = [(ICPlaybackPositionClient *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICPlaybackPositionClient.serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    listenerEndpointProvider = v2->_listenerEndpointProvider;
    v2->_listenerEndpointProvider = v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpointProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (NSXPCConnection)connection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22099;
  v10 = __Block_byref_object_dispose__22100;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__ICPlaybackPositionClient_connection__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSXPCConnection *)v3;
}

void __38__ICPlaybackPositionClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3) {
    goto LABEL_4;
  }
  v4 = *(void **)(v2 + 24);
  id v35 = 0;
  v5 = [v4 listenerEndpointForService:6 error:&v35];
  id v6 = v35;
  if (v5)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v5];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF65CF98];
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    [v10 setClasses:v13 forSelector:sel_pushPlaybackPositionEntity_completionBlock_ argumentIndex:0 ofReply:0];

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v10 setClasses:v14 forSelector:sel_pushPlaybackPositionEntity_completionBlock_ argumentIndex:1 ofReply:1];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    [v10 setClasses:v17 forSelector:sel_pushPlaybackPositionEntity_completionBlock_ argumentIndex:2 ofReply:1];

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    [v10 setClasses:v20 forSelector:sel_persistPlaybackPositionEntity_isCheckpoint_completionBlock_ argumentIndex:0 ofReply:0];

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    [v10 setClasses:v24 forSelector:sel_pushPlaybackPositionEntity_completionBlock_ argumentIndex:0 ofReply:1];

    [*(id *)(*(void *)(a1 + 32) + 16) setRemoteObjectInterface:v10];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setExportedObject:");
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v25 = *(void **)(*(void *)(a1 + 32) + 16);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __38__ICPlaybackPositionClient_connection__block_invoke_79;
    v33[3] = &unk_1E5ACD778;
    objc_copyWeak(&v34, (id *)location);
    [v25 setInterruptionHandler:v33];
    v26 = *(void **)(*(void *)(a1 + 32) + 16);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __38__ICPlaybackPositionClient_connection__block_invoke_80;
    v31[3] = &unk_1E5ACD778;
    objc_copyWeak(&v32, (id *)location);
    [v26 setInvalidationHandler:v31];
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)location);

    id v3 = *(void **)(*(void *)(a1 + 32) + 16);
LABEL_4:
    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
    id v28 = v3;
    id v6 = *(id *)(v27 + 40);
    *(void *)(v27 + 40) = v28;
    goto LABEL_5;
  }
  v29 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = *(void *)(a1 + 32);
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v30;
    __int16 v37 = 2114;
    id v38 = v6;
    _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve listener endpoint. error=%{public}@", location, 0x16u);
  }

LABEL_5:
}

void __38__ICPlaybackPositionClient_connection__block_invoke_79(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted", (uint8_t *)&v3, 0xCu);
  }
}

void __38__ICPlaybackPositionClient_connection__block_invoke_80(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  int v3 = (void *)WeakRetained[2];
  WeakRetained[2] = 0;
}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICPlaybackPositionClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke;
  v14[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke_10;
  v12[3] = &unk_1E5AC9AC8;
  id v13 = v9;
  id v11 = v9;
  [v10 pushPlaybackPositionEntity:v7 completionBlock:v12];
}

void __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pushPlaybackPositionEntity: Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id, void))(v5 + 16))(v5, 0, v3, 0);
  }
}

void __71__ICPlaybackPositionClient_pushPlaybackPositionEntity_completionBlock___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(v7, "msv_description");
      int v13 = 67109634;
      int v14 = a2;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pushPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@ error=%{public}@", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109378;
    int v14 = a2;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "ICPlaybackPositionClient - pushPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@", (uint8_t *)&v13, 0x12u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v12 + 16))(v12, a2, v7, v8);
  }
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICPlaybackPositionClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke;
  v14[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke_8;
  v12[3] = &unk_1E5AC9AC8;
  id v13 = v9;
  id v11 = v9;
  [v10 pullPlaybackPositionEntity:v7 completionBlock:v12];
}

void __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pullPlaybackPositionEntity: Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id, void))(v5 + 16))(v5, 0, v3, 0);
  }
}

void __71__ICPlaybackPositionClient_pullPlaybackPositionEntity_completionBlock___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(v7, "msv_description");
      int v13 = 67109634;
      int v14 = a2;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - pullPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@ error=%{public}@", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109378;
    int v14 = a2;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "ICPlaybackPositionClient - pullPlaybackPositionEntity: Completed. success=%{BOOL}u cloudEntity=%{public}@", (uint8_t *)&v13, 0x12u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v12 + 16))(v12, a2, v7, v8);
  }
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICPlaybackPositionClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__ICPlaybackPositionClient_updateForeignDatabaseWithValuesFromPlaybackPositionEntity___block_invoke;
  v8[3] = &unk_1E5ACC7B0;
  v8[4] = self;
  int v6 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v6 updateForeignDatabaseWithValuesFromPlaybackPositionEntity:v4];

  id v7 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ updateForeignDatabaseWithValuesFromPlaybackPositionEntity:] Completed for entity %{public}@", buf, 0x16u);
  }
}

void __86__ICPlaybackPositionClient_updateForeignDatabaseWithValuesFromPlaybackPositionEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "[%{publie}@ updateForeignDatabaseWithValuesFromPlaybackPositionEntity:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  int v14 = [(ICPlaybackPositionClient *)self connection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E5ACD8E0;
  v24[4] = self;
  id v15 = v12;
  id v25 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v24];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke_6;
  v20[3] = &unk_1E5AC9AA0;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v15;
  id v17 = v15;
  id v18 = v11;
  id v19 = v10;
  [v16 getLocalPlaybackPositionForEntityIdentifiers:v13 forDomain:v19 fromLibraryWithIdentifier:v18 completionBlock:v20];
}

void __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "[%{publie}@ getLocalPlaybackPositionForEntityIdentifiers:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id, void))(v6 + 16))(v6, 0, v3, 0);
  }
}

void __125__ICPlaybackPositionClient_getLocalPlaybackPositionForEntityIdentifiers_forDomain_fromLibraryWithIdentifier_completionBlock___block_invoke_6(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[4];
      uint64_t v12 = [v8 count];
      uint64_t v13 = a1[5];
      uint64_t v14 = a1[6];
      id v15 = objc_msgSend(v7, "msv_description");
      int v21 = 138544642;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      __int16 v27 = 2114;
      uint64_t v28 = v14;
      __int16 v29 = 1024;
      int v30 = a2;
      __int16 v31 = 2114;
      id v32 = v15;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "[%{public}@ getLocalPlaybackPositionForEntityIdentifiers:] Completed with %llu entities for domain %{public}@ with library (%{public}@). success=%{BOOL}u error=%{public}@", (uint8_t *)&v21, 0x3Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = a1[4];
    uint64_t v17 = [v8 count];
    uint64_t v18 = a1[5];
    uint64_t v19 = a1[6];
    int v21 = 138544386;
    uint64_t v22 = v16;
    __int16 v23 = 2048;
    uint64_t v24 = v17;
    __int16 v25 = 2114;
    uint64_t v26 = v18;
    __int16 v27 = 2114;
    uint64_t v28 = v19;
    __int16 v29 = 1024;
    int v30 = a2;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ getLocalPlaybackPositionForEntityIdentifiers:] Completed with %llu entities for domain %{public}@ with library (%{public}@). success=%{BOOL}u", (uint8_t *)&v21, 0x30u);
  }

  uint64_t v20 = a1[7];
  if (v20) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v20 + 16))(v20, a2, v7, v8);
  }
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ICPlaybackPositionClient *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke;
  v16[3] = &unk_1E5ACD8E0;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke_4;
  v14[3] = &unk_1E5ACB920;
  id v15 = v11;
  id v13 = v11;
  [v12 persistPlaybackPositionEntity:v9 isCheckpoint:v5 completionBlock:v14];
}

void __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ persistPlaybackPositionEntity:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
  }
}

void __87__ICPlaybackPositionClient_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(v5, "msv_description");
      int v10 = 67109378;
      int v11 = a2;
      __int16 v12 = 2114;
      id v13 = v8;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "ICPlaybackPositionClient - persistPlaybackPositionEntity: Completed. success=%{BOOL}u error=%{public}@", (uint8_t *)&v10, 0x12u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109120;
    int v11 = a2;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "ICPlaybackPositionClient - persistPlaybackPositionEntity: Completed. success=%{BOOL}u", (uint8_t *)&v10, 8u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICPlaybackPositionClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ICPlaybackPositionClient_deletePlaybackPositionEntity___block_invoke;
  v8[3] = &unk_1E5ACC7B0;
  v8[4] = self;
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v6 deletePlaybackPositionEntity:v4];

  int v7 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ deletePlaybackPositionEntity:] Completed for entity %{public}@", buf, 0x16u);
  }
}

void __57__ICPlaybackPositionClient_deletePlaybackPositionEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ deletePlaybackPositionEntity:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICPlaybackPositionClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__ICPlaybackPositionClient_deletePlaybackPositionEntitiesFromLibraryWithIdentifier___block_invoke;
  v8[3] = &unk_1E5ACC7B0;
  v8[4] = self;
  int v6 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v6 deletePlaybackPositionEntitiesFromLibraryWithIdentifier:v4];

  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier:] Completed for library with identifier %{public}@", buf, 0x16u);
  }
}

void __84__ICPlaybackPositionClient_deletePlaybackPositionEntitiesFromLibraryWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)synchronizePlaybackPositionsForLibraryWithIdentifier:(id)a3 forDomain:(id)a4 isCheckpoint:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(ICPlaybackPositionClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__ICPlaybackPositionClient_synchronizePlaybackPositionsForLibraryWithIdentifier_forDomain_isCheckpoint___block_invoke;
  v13[3] = &unk_1E5ACC7B0;
  v13[4] = self;
  __int16 v11 = [v10 remoteObjectProxyWithErrorHandler:v13];
  [v11 synchronizePlaybackPositionsForLibraryWithIdentifier:v8 forDomain:v9 isCheckpoint:v5];

  id v12 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = self;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 1024;
    BOOL v19 = v5;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ synchronizePlaybackPositionsForLibraryWithIdentifier:] Completed sync for library with identifier %{public}@. checkpoint=%{BOOL}u", buf, 0x1Cu);
  }
}

void __104__ICPlaybackPositionClient_synchronizePlaybackPositionsForLibraryWithIdentifier_forDomain_isCheckpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "PlaybackPosition");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "[%{public}@ synchronizePlaybackPositionsForLibraryWithIdentifier:] Failed to get remote object proxy. error=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [getML3MusicLibraryClass_22133() autoupdatingSharedLibrary];
  __int16 v8 = [v9 libraryUID];
  [(ICPlaybackPositionClient *)self getLocalPlaybackPositionForEntityIdentifiers:v7 forDomain:@"com.apple.upp" fromLibraryWithIdentifier:v8 completionBlock:v6];
}

- (void)deletePlaybackPositionEntities
{
  id v4 = [getML3MusicLibraryClass_22133() autoupdatingSharedLibrary];
  id v3 = [v4 libraryUID];
  [(ICPlaybackPositionClient *)self deletePlaybackPositionEntitiesFromLibraryWithIdentifier:v3];
}

- (void)synchronizePlaybackPositions
{
  id v4 = [getML3MusicLibraryClass_22133() autoupdatingSharedLibrary];
  id v3 = [v4 libraryUID];
  [(ICPlaybackPositionClient *)self synchronizePlaybackPositionsForLibraryWithIdentifier:v3 forDomain:@"com.apple.upp" isCheckpoint:0];
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_22159);
  }
  uint64_t v2 = (void *)sharedService___sharedService;

  return v2;
}

uint64_t __41__ICPlaybackPositionClient_sharedService__block_invoke()
{
  v0 = objc_alloc_init(ICPlaybackPositionClient);
  uint64_t v1 = sharedService___sharedService;
  sharedService___sharedService = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end