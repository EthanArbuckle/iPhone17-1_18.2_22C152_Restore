@interface MRPlaybackQueueClient
- (MRPlaybackQueueClient)initWithQueue:(id)a3;
- (id)debugDescription;
- (id)existingSubscriptionControllerForPlayerPath:(id)a3;
- (id)subscriptionControllerForPlayerPath:(id)a3;
- (void)_handleApplicationRemovedNotification:(id)a3;
- (void)_handleOriginRemovedNotification:(id)a3;
- (void)_handlePlayerPathRemovedNotification:(id)a3;
- (void)dealloc;
@end

@implementation MRPlaybackQueueClient

void __61__MRPlaybackQueueClient_subscriptionControllerForPlayerPath___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v5 = [[MRPlaybackQueueSubscriptionController alloc] initWithPlayerPath:a1[5]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = a1[5];
    uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
    v10 = *(void **)(a1[4] + 8);
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
}

uint64_t __69__MRPlaybackQueueClient_existingSubscriptionControllerForPlayerPath___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (MRPlaybackQueueClient)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MRPlaybackQueueClient.m", 374, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)MRPlaybackQueueClient;
  v7 = [(MRPlaybackQueueClient *)&v15 init];
  if (v7)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    controllers = v7->_controllers;
    v7->_controllers = v8;

    objc_storeStrong((id *)&v7->_queue, a3);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__handlePlayerPathRemovedNotification_ name:@"kMRMediaRemoteNowPlayingPlayerDidUnregister" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__handleApplicationRemovedNotification_ name:@"kMRMediaRemoteNowPlayingApplicationDidUnregister" object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__handleOriginRemovedNotification_ name:@"kMRMediaRemoteOriginDidUnregisterNotification" object:0];
  }
  return v7;
}

- (id)existingSubscriptionControllerForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__36;
  objc_super v15 = __Block_byref_object_dispose__36;
  id v16 = 0;
  if ([v4 isResolved])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MRPlaybackQueueClient_existingSubscriptionControllerForPlayerPath___block_invoke;
    block[3] = &unk_1E57D1C88;
    v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(queue, block);
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)subscriptionControllerForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__36;
  objc_super v15 = __Block_byref_object_dispose__36;
  id v16 = 0;
  if ([v4 isResolved])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MRPlaybackQueueClient_subscriptionControllerForPlayerPath___block_invoke;
    block[3] = &unk_1E57D1C88;
    v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(queue, block);
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRPlaybackQueueClient;
  [(MRPlaybackQueueClient *)&v4 dealloc];
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(NSMutableDictionary *)self->_controllers allValues];
  id v6 = MRCreateIndentedDebugDescriptionFromArray(v5);
  v7 = (void *)[v3 initWithFormat:@"<%@:%p {\n %@ \n}", v4, self, v6];

  return v7;
}

- (void)_handlePlayerPathRemovedNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v6 = MRGetPlayerPathFromUserInfo(v4, v5);

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MRPlaybackQueueClient__handlePlayerPathRemovedNotification___block_invoke;
  v9[3] = &unk_1E57D0790;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, v9);
}

uint64_t __62__MRPlaybackQueueClient__handlePlayerPathRemovedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)_handleApplicationRemovedNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = MRGetOriginFromUserInfo(v5);

  v7 = [v4 userInfo];

  id v8 = MRGetClientFromUserInfo(v7);

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRPlaybackQueueClient__handleApplicationRemovedNotification___block_invoke;
  block[3] = &unk_1E57D1B18;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_sync(queue, block);
}

void __63__MRPlaybackQueueClient__handleApplicationRemovedNotification___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 8), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = (void *)a1[5];
        id v9 = [v7 origin];
        LODWORD(v8) = [v8 isEqual:v9];

        id v10 = (void *)a1[6];
        id v11 = [v7 client];
        int v12 = [v10 isEqual:v11];

        if (v8) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13) {
          [*(id *)(a1[4] + 8) setObject:0 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void)_handleOriginRemovedNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = MRGetOriginFromUserInfo(v4);

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MRPlaybackQueueClient__handleOriginRemovedNotification___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __58__MRPlaybackQueueClient__handleOriginRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        id v9 = [v7 origin];
        LODWORD(v8) = [v8 isEqual:v9];

        if (v8) {
          [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_controllers, 0);
}

@end