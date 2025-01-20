@interface ML3LibraryNotificationManager
- (BOOL)observerShouldForwardDistributedNotification:(id)a3;
- (ML3LibraryNotificationManager)initWithLibrary:(id)a3 distributedAndLocalNames:(id)a4;
- (ML3MusicLibrary)library;
- (id)_observerForDistributedName:(id)a3;
- (id)_observerForLocalName:(id)a3;
- (void)_postEnqueuedDistributedNotifications;
- (void)_postEnqueuedLocalNotifications;
- (void)addObserverForDistributedName:(id)a3 localName:(id)a4;
- (void)enqueueDistributedNotificationNamed:(id)a3;
- (void)enqueueLocalNotification:(id)a3;
- (void)enqueueLocalNotificationNamed:(id)a3;
- (void)removeObserverWithDistributedName:(id)a3;
- (void)removeObserverWithLocalName:(id)a3;
@end

@implementation ML3LibraryNotificationManager

void __74__ML3LibraryNotificationManager_initWithLibrary_distributedAndLocalNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x1E4F77988];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithDistributedName:v7 localName:v6 queue:0];

  [v8 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v8];
}

- (ML3LibraryNotificationManager)initWithLibrary:(id)a3 distributedAndLocalNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ML3LibraryNotificationManager;
  v9 = [(ML3LibraryNotificationManager *)&v27 init];
  if (v9)
  {
    if (!v7)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v9, @"ML3LibraryNotificationManager.m", 33, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
    }
    objc_storeWeak((id *)&v9->_library, v7);
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"com.apple.MusicLibrary.%@", v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    notificationObservers = v9->_notificationObservers;
    v9->_notificationObservers = v17;

    v19 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    queuedLocalNotifications = v9->_queuedLocalNotifications;
    v9->_queuedLocalNotifications = v19;

    v21 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    queuedDistributedNotificationNames = v9->_queuedDistributedNotificationNames;
    v9->_queuedDistributedNotificationNames = v21;

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__ML3LibraryNotificationManager_initWithLibrary_distributedAndLocalNames___block_invoke;
    v25[3] = &unk_1E5FB7A00;
    v26 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v25];
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
  objc_storeStrong((id *)&self->_queuedDistributedNotificationNames, 0);
  objc_storeStrong((id *)&self->_queuedLocalNotifications, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (ML3MusicLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);

  return (ML3MusicLibrary *)WeakRetained;
}

- (void)_postEnqueuedDistributedNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__17401;
  v24 = __Block_byref_object_dispose__17402;
  id v25 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke_2;
  block[3] = &unk_1E5FB8360;
  block[4] = v2;
  void block[5] = &v20;
  dispatch_sync(v3, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)v21[5];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 32) _observerForDistributedName:v7];
        v9 = v8;
        if (v8)
        {
          int v10 = [v8 notifyToken];
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
          v12 = [WeakRetained databasePath];
          uint64_t v13 = [v12 hash];

          notify_set_state(v10, v13);
        }
        notify_post((const char *)[v7 UTF8String]);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __70__ML3LibraryNotificationManager__postEnqueuedDistributedNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) array];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v6 removeAllObjects];
}

- (void)_postEnqueuedLocalNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__17401;
  long long v17 = __Block_byref_object_dispose__17402;
  id v18 = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke_22;
  block[3] = &unk_1E5FB8360;
  block[4] = v1;
  void block[5] = &v13;
  dispatch_sync(v2, block);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "postNotification:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __64__ML3LibraryNotificationManager__postEnqueuedLocalNotifications__block_invoke_22(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) array];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v6 removeAllObjects];
}

- (id)_observerForDistributedName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_notificationObservers;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "distributedName", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_observerForLocalName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_notificationObservers;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "localName", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)observerShouldForwardDistributedNotification:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 localName];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
    uint64_t v7 = [WeakRetained databasePath];
    uint64_t v8 = [v7 hash];

    uint64_t v13 = 0;
    notify_get_state([v4 notifyToken], &v13);
    if (v13 == v8)
    {
      long long v14 = @"isSourceExternal";
      v15[0] = MEMORY[0x1E4F1CC38];
      long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v10 = objc_loadWeakRetained((id *)&self->_library);
      int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:v5 object:v10 userInfo:v9];
      [(ML3LibraryNotificationManager *)self enqueueLocalNotification:v11];
    }
  }

  return 0;
}

- (void)enqueueDistributedNotificationNamed:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ML3LibraryNotificationManager_enqueueDistributedNotificationNamed___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __69__ML3LibraryNotificationManager_enqueueDistributedNotificationNamed___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _postEnqueuedDistributedNotifications];
  }
  return result;
}

- (void)enqueueLocalNotificationNamed:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28EA0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  id v8 = (id)[v6 initWithName:v5 object:WeakRetained userInfo:0];

  [(ML3LibraryNotificationManager *)self enqueueLocalNotification:v8];
}

- (void)enqueueLocalNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke_2;
  v3[3] = &unk_1E5FB6168;
  id v4 = *(id *)(a1 + 40);
  if ([v2 indexOfObjectPassingTest:v3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _postEnqueuedLocalNotifications];
  }
}

uint64_t __58__ML3LibraryNotificationManager_enqueueLocalNotification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)removeObserverWithLocalName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_notificationObservers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      int v11 = objc_msgSend(v10, "localName", (void)v14);
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_notificationObservers removeObject:v13];
    uint64_t v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)removeObserverWithDistributedName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_notificationObservers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      int v11 = objc_msgSend(v10, "distributedName", (void)v14);
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_notificationObservers removeObject:v13];
    uint64_t v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (void)addObserverForDistributedName:(id)a3 localName:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F77988];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithDistributedName:v8 localName:v7 queue:0];

  [(NSMutableArray *)self->_notificationObservers addObject:v9];
}

@end