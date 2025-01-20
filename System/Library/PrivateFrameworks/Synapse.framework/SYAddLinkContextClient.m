@interface SYAddLinkContextClient
- (NSXPCConnection)_connection;
- (OS_dispatch_queue)_clientQueue;
- (SYAddLinkContextClient)init;
- (void)_configureConnectionAndResume;
- (void)_createConnectionIfNeeded;
- (void)_invalidateConnection;
- (void)createConnectionWithEndpoint:(id)a3;
- (void)dealloc;
- (void)set_clientQueue:(id)a3;
- (void)set_connection:(id)a3;
- (void)userDidRemoveContentItems:(id)a3;
- (void)userEditDidAddContentItems:(id)a3;
- (void)userWillAddLinkWithActivity:(id)a3 completion:(id)a4;
@end

@implementation SYAddLinkContextClient

- (SYAddLinkContextClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYAddLinkContextClient;
  v2 = [(SYAddLinkContextClient *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.AddLinkContextClient", v3);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(SYAddLinkContextClient *)self _connection];
  [v3 invalidate];

  [(SYAddLinkContextClient *)self set_connection:0];
  v4.receiver = self;
  v4.super_class = (Class)SYAddLinkContextClient;
  [(SYAddLinkContextClient *)&v4 dealloc];
}

- (void)userWillAddLinkWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SYAddLinkContextClient *)self _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke;
  block[3] = &unk_1E6463740;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a1[4] _createConnectionIfNeeded];
  v2 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [a1[5] _uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userWillAddLinkWithActivity started for activity: %@", buf, 0xCu);
  }
  objc_super v4 = [a1[4] _connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5;
  v17[3] = &unk_1E64636F0;
  id v18 = a1[6];
  v5 = [v4 remoteObjectProxyWithErrorHandler:v17];

  if (v5)
  {
    id v6 = a1[5];
    id v16 = 0;
    id v7 = [v6 _createUserActivityDataWithSaving:0 options:0 error:&v16];
    id v8 = v16;
    id v9 = v8;
    if (v7)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7;
      v13[3] = &unk_1E6463718;
      id v14 = v8;
      id v15 = a1[6];
      [v5 userWillAddLinkWithActivityData:v7 completion:v13];
    }
    else
    {
      v11 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_cold_1((uint64_t *)a1 + 5, (uint64_t)v9, v11);
      }

      id v12 = (void (**)(id, void))a1[6];
      if (v12) {
        v12[2](v12, 0);
      }
    }
  }
  else
  {
    id v10 = (void (**)(id, void))a1[6];
    if (v10) {
      v10[2](v10, 0);
    }
  }
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v14 = 0;
    objc_super v4 = [[SYContentItem alloc] initWithData:v3 error:&v14];
    id v5 = v14;
    if (v5)
    {
      uint64_t v6 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, SYContentItem *))(v13 + 16))(v13, v4);
  }
}

- (void)userDidRemoveContentItems:(id)a3
{
  id v4 = a3;
  id v5 = [v4 indexesOfObjectsPassingTest:&__block_literal_global_0];
  if ([v5 count])
  {
    uint64_t v6 = [(SYAddLinkContextClient *)self _clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke_2;
    block[3] = &unk_1E64637A8;
    block[4] = self;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 activityType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F28AC0]];

  return v3;
}

void __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke_2(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [a1[4] _createConnectionIfNeeded];
  v2 = [a1[5] objectsAtIndexes:a1[6]];
  uint64_t v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [a1[6] count];
    id v5 = [v2 firstObject];
    uint64_t v6 = [v5 itemIdentifier];
    *(_DWORD *)buf = 134218242;
    uint64_t v26 = v4;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userDidRemoveContentItems started for %lu items including: %@", buf, 0x16u);
  }
  uint64_t v7 = [a1[4] _connection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_13];

  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[6], "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v2;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v14), "dataRepresentationWithError:", 0, (void)v20);
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    if (![v9 count])
    {
      id v16 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [a1[6] count];
        id v18 = [v10 firstObject];
        v19 = [v18 itemIdentifier];
        *(_DWORD *)buf = 134218242;
        uint64_t v26 = v17;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1C2C5F000, v16, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userDidRemoveContentItems encoding failed for %lu items including: %@", buf, 0x16u);
      }
    }
    objc_msgSend(v8, "userDidRemoveContentItemDatas:", v9, (void)v20);
  }
}

void __52__SYAddLinkContextClient_userDidRemoveContentItems___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)userEditDidAddContentItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 indexesOfObjectsPassingTest:&__block_literal_global_16];
  if ([v5 count])
  {
    uint64_t v6 = [(SYAddLinkContextClient *)self _clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke_2;
    block[3] = &unk_1E64637A8;
    block[4] = self;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 activityType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F28AC0]];

  return v3;
}

void __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke_2(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [a1[4] _createConnectionIfNeeded];
  id v2 = [a1[5] objectsAtIndexes:a1[6]];
  uint64_t v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [a1[6] count];
    uint64_t v5 = [v2 firstObject];
    uint64_t v6 = [v5 itemIdentifier];
    *(_DWORD *)buf = 134218242;
    uint64_t v26 = v4;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userEditDidAddContentItems started for %lu items including: %@", buf, 0x16u);
  }
  uint64_t v7 = [a1[4] _connection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_19];

  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[6], "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v2;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v14), "dataRepresentationWithError:", 0, (void)v20);
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    if (![v9 count])
    {
      id v16 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [a1[6] count];
        id v18 = [v10 firstObject];
        v19 = [v18 itemIdentifier];
        *(_DWORD *)buf = 134218242;
        uint64_t v26 = v17;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1C2C5F000, v16, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: userEditDidAddContentItems encoding failed for %lu items including: %@", buf, 0x16u);
      }
    }
    objc_msgSend(v8, "userEditDidAddContentItemDatas:", v9, (void)v20);
  }
}

void __53__SYAddLinkContextClient_userEditDidAddContentItems___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_createConnectionIfNeeded
{
  uint64_t v3 = [(SYAddLinkContextClient *)self _connection];

  if (!v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.synapse.add-link-context-service" options:0];
    [(SYAddLinkContextClient *)self set_connection:v4];

    uint64_t v5 = [(SYAddLinkContextClient *)self _connection];
    uint64_t v6 = [(SYAddLinkContextClient *)self _clientQueue];
    [v5 _setQueue:v6];

    [(SYAddLinkContextClient *)self _configureConnectionAndResume];
  }
}

- (void)_configureConnectionAndResume
{
  uint64_t v4 = [(SYAddLinkContextClient *)self _connection];

  if (!v4)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SYAddLinkContextClient.m" lineNumber:180 description:@"the XPC connection is unexpectedly nil"];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke;
  v13[3] = &unk_1E64637D0;
  objc_copyWeak(&v14, &location);
  uint64_t v5 = [(SYAddLinkContextClient *)self _connection];
  [v5 setInvalidationHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke_29;
  v11[3] = &unk_1E64637D0;
  objc_copyWeak(&v12, &location);
  uint64_t v6 = [(SYAddLinkContextClient *)self _connection];
  [v6 setInterruptionHandler:v11];

  uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2C760];
  uint64_t v8 = [(SYAddLinkContextClient *)self _connection];
  [v8 setRemoteObjectInterface:v7];

  uint64_t v9 = [(SYAddLinkContextClient *)self _connection];
  [v9 resume];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: Connection was invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

void __55__SYAddLinkContextClient__configureConnectionAndResume__block_invoke_29(uint64_t a1)
{
  id v2 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: Connection was interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

- (void)_invalidateConnection
{
  uint64_t v3 = [(SYAddLinkContextClient *)self _clientQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SYAddLinkContextClient *)self _connection];

  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.synapse", "AddLinkContext");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "AddLinkContextClient: Invalidating connection.", v7, 2u);
    }

    uint64_t v6 = [(SYAddLinkContextClient *)self _connection];
    [(SYAddLinkContextClient *)self set_connection:0];
    [v6 invalidate];
  }
}

- (void)createConnectionWithEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYAddLinkContextClient *)self _clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SYAddLinkContextClient_createConnectionWithEndpoint___block_invoke;
  v7[3] = &unk_1E64637F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __55__SYAddLinkContextClient_createConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  [v2 invalidate];

  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "set_connection:", v3);

  id v4 = [*(id *)(a1 + 32) _connection];
  uint64_t v5 = [*(id *)(a1 + 32) _clientQueue];
  [v4 _setQueue:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 _configureConnectionAndResume];
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)set_connection:(id)a3
{
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)set_clientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Failed to serialize data for user activity %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__SYAddLinkContextClient_userWillAddLinkWithActivity_completion___block_invoke_7_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end