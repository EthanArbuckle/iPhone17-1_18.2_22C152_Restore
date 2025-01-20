@interface ICMediaUserStateCenter
+ (ICMediaUserStateCenter)shared;
- (ICMediaUserState)activeUserState;
- (NSArray)allUserStates;
- (id)_establishClientConnection;
- (id)_getUserStatesForcingRefresh:(BOOL)a3;
- (id)_initLazily:(BOOL)a3;
- (id)initLazily;
- (void)_applyServerStateUpdatedWithUserStates:(id)a3;
- (void)_clearConnection;
- (void)_handleServerStateUpdatedNotification:(id)a3;
- (void)_onAsyncServer:(id)a3;
- (void)_onSyncServer:(id)a3;
- (void)dealloc;
- (void)refreshUserStatesWithCompletion:(id)a3;
- (void)refreshUserStatesWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)setAllUserStates:(id)a3;
@end

@implementation ICMediaUserStateCenter

void __39__ICMediaUserStateCenter_allUserStates__block_invoke(uint64_t a1)
{
}

- (ICMediaUserState)activeUserState
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(ICMediaUserStateCenter *)self allUserStates];
  v4 = objc_msgSend(v3, "msv_firstWhere:", &__block_literal_global_21);

  v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    v8 = self;
    __int16 v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Accessing active user state: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  return (ICMediaUserState *)v4;
}

- (NSArray)allUserStates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6825;
  v13 = __Block_byref_object_dispose__6826;
  id v14 = 0;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__ICMediaUserStateCenter_allUserStates__block_invoke;
  v8[3] = &unk_1E5ACD880;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(accessQueue, v8);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(id)v10[5] count];
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Accessing all user states, user states found: %lu", buf, 0x16u);
  }

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __38__ICMediaUserStateCenter__initLazily___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__ICMediaUserStateCenter__initLazily___block_invoke_2;
    v9[3] = &unk_1E5AC7CA0;
    v10 = v3;
    [v10 _onAsyncServer:v9];
    v4 = v10;
  }
  else
  {
    uint64_t v5 = [v3 _getUserStatesForcingRefresh:0];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;

    v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched userStates from init", buf, 0xCu);
    }
  }
}

- (id)_getUserStatesForcingRefresh:(BOOL)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6825;
  uint64_t v11 = __Block_byref_object_dispose__6826;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke;
  v5[3] = &unk_1E5AC7D70;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  [(ICMediaUserStateCenter *)self _onSyncServer:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)_onSyncServer:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  uint64_t v5 = [(ICMediaUserStateCenter *)self _establishClientConnection];
  BOOL v6 = v5;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6825;
  v15 = __Block_byref_object_dispose__6826;
  id v16 = 0;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__ICMediaUserStateCenter__onSyncServer___block_invoke;
    v10[3] = &unk_1E5AC7D98;
    v10[4] = self;
    v10[5] = &v11;
    uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
    v4[2](v4, v7, v12[5]);
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICMediaUserStateError", 9001, @"Failed to create connection for sync server");
    uint64_t v9 = (void *)v12[5];
    v12[5] = v8;

    v4[2](v4, 0, v12[5]);
  }
  _Block_object_dispose(&v11, 8);
}

void __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = objc_msgSend(v6, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: _onSyncServer: completed error=%{public}@", buf, 0x16u);
    }
    uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create sync server to get user states, err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v13;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _onSyncServer: completed", buf, 0xCu);
    }

    uint64_t v14 = *(unsigned __int8 *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke_96;
    v15[3] = &unk_1E5AC7D48;
    v15[4] = *(void *)(a1 + 40);
    [v5 getUserStatesForcingRefresh:v14 withReply:v15];
  }
}

- (id)_establishClientConnection
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = self;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: No connection found, creating new connection", buf, 0xCu);
    }

    v27 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    id v32 = 0;
    id v6 = [(ICCloudServerListenerEndpointProvider *)v27 listenerEndpointForService:5 error:&v32];
    id v7 = v32;
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    uint64_t v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_msgSend(v7, "msv_description");
        *(_DWORD *)buf = 138543618;
        v34 = self;
        __int16 v35 = 2114;
        id v36 = v10;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@: created xpc connection from listener endpoint error=%{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = self;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: created xpc connection from listener endpoint", buf, 0xCu);
    }

    if (v6)
    {
      uint64_t v11 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
      uint64_t v12 = self->_xpcConnection;
      self->_xpcConnection = v11;

      uint64_t v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B7E0];
      uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v15 = objc_opt_class();
      id v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      [v13 setClasses:v16 forSelector:sel_getUserStatesForcingRefresh_withReply_ argumentIndex:0 ofReply:1];

      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v13 setClasses:v17 forSelector:sel_getUserStatesForcingRefresh_withReply_ argumentIndex:1 ofReply:1];

      __int16 v18 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      [v13 setClasses:v20 forSelector:sel_getCachedUserStatesWithReply_ argumentIndex:0 ofReply:1];

      v21 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      [v13 setClasses:v23 forSelector:sel_refreshSocialProfilesWithReply_ argumentIndex:0 ofReply:1];

      v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v13 setClasses:v24 forSelector:sel_refreshSocialProfilesWithReply_ argumentIndex:1 ofReply:1];

      [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v13];
      objc_initWeak((id *)buf, self);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __52__ICMediaUserStateCenter__establishClientConnection__block_invoke;
      v30[3] = &unk_1E5ACD778;
      objc_copyWeak(&v31, (id *)buf);
      [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v30];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __52__ICMediaUserStateCenter__establishClientConnection__block_invoke_92;
      v28[3] = &unk_1E5ACD778;
      objc_copyWeak(&v29, (id *)buf);
      [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v28];
      [(NSXPCConnection *)self->_xpcConnection resume];
      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v34 = self;
        __int16 v35 = 2114;
        id v36 = v7;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed listenerEndpointForService:ICCloudServerSupportedServiceMediaUserStateCenterServer, err=%{public}@", buf, 0x16u);
      }
    }

    xpcConnection = self->_xpcConnection;
  }
  v25 = xpcConnection;
  os_unfair_lock_unlock(p_lock);

  return v25;
}

+ (ICMediaUserStateCenter)shared
{
  if (shared_sOnceToken != -1) {
    dispatch_once(&shared_sOnceToken, &__block_literal_global_6899);
  }
  int v2 = (void *)shared_sShared;

  return (ICMediaUserStateCenter *)v2;
}

uint64_t __32__ICMediaUserStateCenter_shared__block_invoke()
{
  shared_sShared = [[ICMediaUserStateCenter alloc] _initLazily:0];

  return MEMORY[0x1F41817F8]();
}

- (id)_initLazily:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)ICMediaUserStateCenter;
  v4 = [(ICMediaUserStateCenter *)&v24 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserStateCenter.accessQueue", 0);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICUserStateCenter.completionHandlersQueue", 0);
    completionHandlersQueue = v4->_completionHandlersQueue;
    v4->_completionHandlersQueue = (OS_dispatch_queue *)v7;

    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    refreshUserStateCompletionHandlers = v4->_refreshUserStateCompletionHandlers;
    v4->_refreshUserStateCompletionHandlers = (NSMutableArray *)v9;

    uint64_t v11 = objc_alloc_init(ICCloudClient);
    cloudClient = v4->_cloudClient;
    v4->_cloudClient = v11;

    uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v4;
      __int16 v27 = 1024;
      BOOL v28 = v3;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: _initLazily %{BOOL}u", buf, 0x12u);
    }

    uint64_t v14 = v4->_accessQueue;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __38__ICMediaUserStateCenter__initLazily___block_invoke;
    v21 = &unk_1E5ACAD30;
    BOOL v23 = v3;
    uint64_t v15 = v4;
    uint64_t v22 = v15;
    dispatch_async(v14, &v18);
    id v16 = objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter", v18, v19, v20, v21);
    [v16 addObserver:v15 selector:sel__handleServerStateUpdatedNotification_ name:@"ICMediaUserStateCenterServerStateUpdatedNotification" object:0];
  }
  return v4;
}

uint64_t __55__ICMediaUserStateCenter__getUserStatesForcingRefresh___block_invoke_96(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUserStates, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_completionHandlersQueue, 0);
  objc_storeStrong((id *)&self->_refreshUserStateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setAllUserStates:(id)a3
{
}

- (void)_applyServerStateUpdatedWithUserStates:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*(void *)(a1 + 40) + 56) containsObject:*(void *)(*((void *)&v10 + 1) + 8 * v6)])
        {

          dispatch_queue_t v7 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            uint64_t v15 = v8;
            __int16 v16 = 2114;
            uint64_t v17 = @"ICMediaUserStateCenterUserStatesDidChangeNotification";
            _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ User states updated. Posting %{public}@", buf, 0x16u);
          }

          objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 32));
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke_104;
          block[3] = &unk_1E5ACD750;
          block[4] = *(void *)(a1 + 40);
          dispatch_async(MEMORY[0x1E4F14428], block);
          return;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
}

void __65__ICMediaUserStateCenter__applyServerStateUpdatedWithUserStates___block_invoke_104(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICMediaUserStateCenterUserStatesDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_handleServerStateUpdatedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICMediaUserStateCenter *)self _getUserStatesForcingRefresh:0];
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v7 = [v4 name];
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    long long v11 = v7;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Received notification: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(ICMediaUserStateCenter *)self _applyServerStateUpdatedWithUserStates:v5];
}

void __40__ICMediaUserStateCenter__onSyncServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = objc_msgSend(v3, "msv_description");
      int v10 = 138543618;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      long long v13 = v6;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: _onServer: completed error=%{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICMediaUserStateError", 9001, v3, @"Failed to create connection for sync server");
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)_onAsyncServer:(id)a3
{
  id v4 = a3;
  cloudClient = self->_cloudClient;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ICMediaUserStateCenter__onAsyncServer___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)cloudClient performBlockAfterServerSetup:v7];
}

void __41__ICMediaUserStateCenter__onAsyncServer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _establishClientConnection];
  id v3 = v2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__6825;
  __int16 v12 = __Block_byref_object_dispose__6826;
  id v13 = 0;
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__ICMediaUserStateCenter__onAsyncServer___block_invoke_2;
    v7[3] = &unk_1E5AC7D98;
    void v7[4] = *(void *)(a1 + 32);
    void v7[5] = &v8;
    id v4 = [v2 remoteObjectProxyWithErrorHandler:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICMediaUserStateError", 9002, @"Failed to create connection for async server");
    id v6 = (void *)v9[5];
    v9[5] = v5;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  _Block_object_dispose(&v8, 8);
}

void __41__ICMediaUserStateCenter__onAsyncServer___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create async server to get user states, err=%{public}@", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICMediaUserStateError", 9002, v3, @"Failed to create connection for async server");
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)_clearConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  os_unfair_lock_unlock(p_lock);
  completionHandlersQueue = self->_completionHandlersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ICMediaUserStateCenter__clearConnection__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_sync(completionHandlersQueue, block);
}

uint64_t __42__ICMediaUserStateCenter__clearConnection__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICMediaUserStateError", 9004, 0, @"XPC connection was invalidated.");
        (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v5, v8);

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  return [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
}

void __52__ICMediaUserStateCenter__establishClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_ERROR, "%{public}@: XPC connection interrupted.", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained _clearConnection];
}

void __52__ICMediaUserStateCenter__establishClientConnection__block_invoke_92(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138543362;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_ERROR, "%{public}@: XPC connection invalidated.", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained _clearConnection];
}

- (void)refreshUserStatesWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Force refreshing user states, calling refreshUserStatesWithCompletion:", (uint8_t *)&buf, 0xCu);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke;
  v14[3] = &unk_1E5ACD318;
  v14[4] = self;
  uint64_t v6 = (void *)MEMORY[0x1A6240BF0](v14);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  completionHandlersQueue = self->_completionHandlersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_3;
  block[3] = &unk_1E5ACB0E8;
  p_long long buf = &buf;
  block[4] = self;
  id v8 = v4;
  id v12 = v8;
  dispatch_sync(completionHandlersQueue, block);
  if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_4;
    v9[3] = &unk_1E5AC7D20;
    void v9[4] = self;
    id v10 = v6;
    [(ICMediaUserStateCenter *)self _onAsyncServer:v9];
  }
  _Block_object_dispose(&buf, 8);
}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_2;
  block[3] = &unk_1E5ACD5C8;
  block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_3(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 32) count] != 0;
  uint64_t v2 = a1[5];
  int v3 = *(void **)(a1[4] + 32);
  id v4 = (id)MEMORY[0x1A6240BF0](v2);
  [v3 addObject:v4];
}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(v6, "msv_description");
      *(_DWORD *)long long buf = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: _onAsyncServer: completed error=%{public}@", buf, 0x16u);
    }
    long long v11 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICMediaUserStateError", 9002, v6, @"Error creating async server during force refresh user states");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: _onAsyncServer: completed", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_30;
    v13[3] = &unk_1E5AC8F38;
    id v14 = *(id *)(a1 + 40);
    [v5 getUserStatesForcingRefresh:1 withReply:v13];
    long long v11 = v14;
  }
}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    a3 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICMediaUserStateError", 9003, a3, @"Failed to force refresh user states");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__ICMediaUserStateCenter_refreshUserStatesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)refreshUserStatesWithOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void (**)(void, void, void))v6;
  if (a3)
  {
    if (a3)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_3;
      v10[3] = &unk_1E5AC7CF8;
      id v11 = v6;
      [(ICMediaUserStateCenter *)self _onAsyncServer:v10];
      long long v9 = v11;
    }
    else
    {
      long long v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v15 = self;
        __int16 v16 = 2048;
        unint64_t v17 = a3;
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ refreshUserStatesWithOptions:completion: called with invalid options: %lu", buf, 0x16u);
      }

      long long v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
      ((void (**)(void, void, void *))v7)[2](v7, 0, v9);
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke;
    v12[3] = &unk_1E5AC7CF8;
    id v13 = v6;
    [(ICMediaUserStateCenter *)self _onAsyncServer:v12];
    long long v9 = v13;
  }
}

void __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICMediaUserStateError", 9002, a3, @"Error creating async server");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_2;
    v6[3] = &unk_1E5AC8F38;
    id v7 = *(id *)(a1 + 32);
    [a2 getUserStatesForcingRefresh:1 withReply:v6];
  }
}

void __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICMediaUserStateError", 9002, a3, @"Error creating async server");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_4;
    v6[3] = &unk_1E5AC8F38;
    id v7 = *(id *)(a1 + 32);
    [a2 refreshSocialProfilesWithReply:v6];
  }
}

uint64_t __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__ICMediaUserStateCenter_refreshUserStatesWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__ICMediaUserStateCenter_activeUserState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)ICMediaUserStateCenter;
  [(ICMediaUserStateCenter *)&v4 dealloc];
}

void __38__ICMediaUserStateCenter__initLazily___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__ICMediaUserStateCenter__initLazily___block_invoke_3;
  v3[3] = &unk_1E5AC7C78;
  id v4 = *(id *)(a1 + 32);
  [a2 getCachedUserStatesWithReply:v3];
}

uint64_t __38__ICMediaUserStateCenter__initLazily___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyServerStateUpdatedWithUserStates:a2];
}

- (id)initLazily
{
  id v3 = [[ICMediaUserStateCenter alloc] _initLazily:1];

  return v3;
}

@end