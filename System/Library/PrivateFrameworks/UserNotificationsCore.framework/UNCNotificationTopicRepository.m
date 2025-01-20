@interface UNCNotificationTopicRepository
- (UNCNotificationTopicRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4;
- (UNCNotificationTopicRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5;
- (id)_queue_topicsForBundleIdentifier:(id)a3;
- (id)allBundleIdentifiers;
- (id)topicsForBundleIdentifier:(id)a3;
- (int64_t)_maxObjectsPerKey;
- (void)_queue_notificationSourcesDidUninstall:(id)a3;
- (void)_queue_setTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)setTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UNCNotificationTopicRepository

- (void)setTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__UNCNotificationTopicRepository_setTopics_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_265567F50;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_queue_setTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  v11 = [(UNCNotificationTopicRepository *)self _queue_topicsForBundleIdentifier:v9];
  if ((UNEqualObjects() & 1) == 0)
  {
    id v12 = objc_msgSend(v8, "bs_map:", UNCNotificationTopicRecordToDictionary);
    [(UNCKeyedDataStoreRepository *)self->_repository setObjects:v12 forKey:v9];
    observable = self->_observable;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __93__UNCNotificationTopicRepository__queue_setTopics_forBundleIdentifier_withCompletionHandler___block_invoke;
    v14[3] = &unk_265568290;
    v14[4] = self;
    id v15 = v9;
    [(UNCKeyedObservable *)observable notifyObserversKey:v15 usingBlock:v14];
  }
  if (v10) {
    v10[2](v10, 0);
  }
}

- (id)_queue_topicsForBundleIdentifier:(id)a3
{
  v3 = [(UNCKeyedDataStoreRepository *)self->_repository objectsForKey:a3];
  v4 = objc_msgSend(v3, "bs_map:", UNCDictionaryToNotificationTopicRecord);

  return v4;
}

uint64_t __86__UNCNotificationTopicRepository_setTopics_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setTopics:forBundleIdentifier:withCompletionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (int64_t)_maxObjectsPerKey
{
  return 100;
}

- (UNCNotificationTopicRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[UNCKeyedDataStoreRepository alloc] initWithDirectory:v10 fileName:@"Topics" pathExtension:@"plist" librarian:v9 repositoryProtectionStrategy:v8 objectIdentifierKey:0 maxObjectsPerKey:[(UNCNotificationTopicRepository *)self _maxObjectsPerKey]];

  id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.NotificationTopicRepository.observable", v12);

  id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.NotificationTopicRepository.call-out", v14);

  id v16 = [[UNCKeyedObservable alloc] initWithQueue:v13 callOutQueue:v15];
  id v17 = [(UNCNotificationTopicRepository *)self initWithDataStoreRepository:v11 observable:v16];

  return v17;
}

- (UNCNotificationTopicRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNCNotificationTopicRepository;
  id v9 = [(UNCNotificationTopicRepository *)&v14 init];
  if (v9)
  {
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.usernotificationsserver.NotificationTopicRepository", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_repository, a3);
    objc_storeStrong((id *)&v9->_observable, a4);
  }

  return v9;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__UNCNotificationTopicRepository_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __66__UNCNotificationTopicRepository_addObserver_forBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) addObserver:a1[5] forKey:a1[6]];
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UNCNotificationTopicRepository_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __69__UNCNotificationTopicRepository_removeObserver_forBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) addObserver:a1[5] forKey:a1[6]];
}

- (id)allBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7;
  id v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__UNCNotificationTopicRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __54__UNCNotificationTopicRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];

  return MEMORY[0x270F9A758]();
}

- (id)topicsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = __Block_byref_object_copy__7;
  id v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__UNCNotificationTopicRepository_topicsForBundleIdentifier___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __60__UNCNotificationTopicRepository_topicsForBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_topicsForBundleIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__UNCNotificationTopicRepository_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __66__UNCNotificationTopicRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(void *)(a1 + 40));
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__UNCNotificationTopicRepository_contentProtectionStateChangedForFirstUnlock___block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __78__UNCNotificationTopicRepository_contentProtectionStateChangedForFirstUnlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) protectionStateChanged];
}

uint64_t __93__UNCNotificationTopicRepository__queue_setTopics_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 topicRepository:*(void *)(a1 + 32) didChangeTopicsForBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) bundleIdentifier];
        [(UNCKeyedDataStoreRepository *)self->_repository removeStoreForKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_repository, 0);
}

@end