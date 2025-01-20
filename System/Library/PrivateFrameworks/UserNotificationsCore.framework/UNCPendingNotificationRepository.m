@interface UNCPendingNotificationRepository
- (UNCPendingNotificationRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4 librarian:(id)a5;
- (UNCPendingNotificationRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5;
- (id)_queue_pendingNotificationDictionariesForBundleIdentifier:(id)a3;
- (id)_queue_pendingNotificationRecordsForBundleIdentifier:(id)a3;
- (id)allBundleIdentifiers;
- (id)pendingNotificationRecordsForBundleIdentifier:(id)a3;
- (int64_t)_maxObjectsPerKey;
- (void)_queue_notificationSourcesDidUninstall:(id)a3;
- (void)_queue_notifyObserversOfChangesFrom:(id)a3 to:(id)a4 forBundleIdentifier:(id)a5;
- (void)_queue_setPendingNotificationDictionaries:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation UNCPendingNotificationRepository

- (int64_t)_maxObjectsPerKey
{
  return 100;
}

- (UNCPendingNotificationRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[UNCKeyedDataStoreRepository alloc] initWithDirectory:v10 fileName:@"PendingNotifications" pathExtension:@"plist" librarian:v9 repositoryProtectionStrategy:v8 objectIdentifierKey:0 maxObjectsPerKey:[(UNCPendingNotificationRepository *)self _maxObjectsPerKey]];

  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.usernotificationsserver.PendingNotificationRepository.observable", v12);

  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.usernotificationsserver.PendingNotificationRepository.call-out", v14);

  v16 = [[UNCKeyedObservable alloc] initWithQueue:v13 callOutQueue:v15];
  v17 = [(UNCPendingNotificationRepository *)self initWithDataStoreRepository:v11 observable:v16 librarian:v9];

  return v17;
}

- (UNCPendingNotificationRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4 librarian:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UNCPendingNotificationRepository;
  v12 = [(UNCPendingNotificationRepository *)&v17 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.usernotificationsserver.PendingNotificationRepository", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_repository, a3);
    objc_storeStrong((id *)&v12->_observable, a4);
    objc_storeStrong((id *)&v12->_librarian, a5);
  }

  return v12;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__UNCPendingNotificationRepository_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __68__UNCPendingNotificationRepository_addObserver_forBundleIdentifier___block_invoke(void *a1)
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
  block[2] = __71__UNCPendingNotificationRepository_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __71__UNCPendingNotificationRepository_removeObserver_forBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) removeObserver:a1[5] forKey:a1[6]];
}

- (id)allBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__UNCPendingNotificationRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __56__UNCPendingNotificationRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];

  return MEMORY[0x270F9A758]();
}

- (id)pendingNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__UNCPendingNotificationRepository_pendingNotificationRecordsForBundleIdentifier___block_invoke;
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

uint64_t __82__UNCPendingNotificationRepository_pendingNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_pendingNotificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__UNCPendingNotificationRepository_setPendingNotificationRecords_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __86__UNCPendingNotificationRepository_setPendingNotificationRecords_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setPendingNotificationRecords:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__UNCPendingNotificationRepository_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __68__UNCPendingNotificationRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(void *)(a1 + 40));
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__UNCPendingNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __80__UNCPendingNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) protectionStateChanged];
}

- (id)_queue_pendingNotificationDictionariesForBundleIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UNCKeyedDataStoreRepository *)self->_repository objectsForKey:v4];
  if (v5) {
    id v6 = (void *)v5;
  }
  else {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }
  id v7 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = [v6 count];
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Load %ld pending notification dictionaries", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (void)_queue_setPendingNotificationDictionaries:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = [v6 count];
    _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save %ld pending notification dictionaries", (uint8_t *)&v10, 0x16u);
  }
  [(UNCKeyedDataStoreRepository *)self->_repository setObjects:v6 forKey:v7];
}

- (id)_queue_pendingNotificationRecordsForBundleIdentifier:(id)a3
{
  id v3 = [(UNCPendingNotificationRepository *)self _queue_pendingNotificationDictionariesForBundleIdentifier:a3];
  uint64_t v4 = objc_msgSend(v3, "bs_map:", UNSDictionaryToNotificationRecord);
  if (v4) {
    uint64_t v5 = (void *)v4;
  }
  else {
    uint64_t v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (void)_queue_setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(UNCPendingNotificationRepository *)self _queue_pendingNotificationDictionariesForBundleIdentifier:v6];
  id v8 = objc_msgSend(v7, "bs_map:", UNSDictionaryToNotificationRecord);
  if ((UNEqualObjects() & 1) == 0 && ([v8 count] || objc_msgSend(v10, "count")))
  {
    id v9 = objc_msgSend(v10, "bs_map:", UNSNotificationRecordToDictionary);
    [(UNCPendingNotificationRepository *)self _queue_setPendingNotificationDictionaries:v9 forBundleIdentifier:v6];
    [(UNCPendingNotificationRepository *)self _queue_notifyObserversOfChangesFrom:v8 to:v10 forBundleIdentifier:v6];
  }
}

- (void)_queue_notifyObserversOfChangesFrom:(id)a3 to:(id)a4 forBundleIdentifier:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v39 = a4;
  id v41 = a5;
  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v55;
    uint64_t v13 = (os_log_t *)MEMORY[0x263F1E040];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v15 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "identifier", v39);
        uint64_t v17 = [v16 length];

        if (v17)
        {
          v18 = [v15 identifier];
          [v9 setObject:v15 forKey:v18];
        }
        else
        {
          v18 = +[UNSNotificationRecordRemoveUpdate updateWithNotificationRecord:v15 shouldSync:0];
          [v8 addObject:v18];
          v19 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v61 = v41;
            __int16 v62 = 2112;
            v63 = v15;
            _os_log_error_impl(&dword_2608DB000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] An invalid notification record was present in the pending notifications store (no identifier present), record=%@", buf, 0x16u);
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v11);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  id v20 = v39;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v51 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        v26 = objc_msgSend(v25, "identifier", v39);
        v27 = objc_msgSend(v9, "bs_takeObjectForKey:", v26);

        if (v27)
        {
          if ([v25 isEqual:v27]) {
            goto LABEL_22;
          }
          uint64_t v28 = +[UNSNotificationRecordReplaceUpdate updateWithNotificationRecord:v25 replacedNotificationRecord:v27 shouldRepost:1];
        }
        else
        {
          uint64_t v28 = +[UNSNotificationRecordAddUpdate updateWithNotificationRecord:v25 shouldSync:1];
        }
        v29 = (void *)v28;
        [v8 addObject:v28];

LABEL_22:
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v22);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v30 = [v9 allValues];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = +[UNSNotificationRecordRemoveUpdate updateWithNotificationRecord:shouldSync:](UNSNotificationRecordRemoveUpdate, "updateWithNotificationRecord:shouldSync:", *(void *)(*((void *)&v46 + 1) + 8 * k), 0, v39);
        [v8 addObject:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v32);
  }

  observable = self->_observable;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __95__UNCPendingNotificationRepository__queue_notifyObserversOfChangesFrom_to_forBundleIdentifier___block_invoke;
  v43[3] = &unk_265567808;
  v43[4] = self;
  id v44 = v8;
  id v45 = v41;
  id v37 = v41;
  id v38 = v8;
  [(UNCKeyedObservable *)observable notifyObserversKey:v37 usingBlock:v43];
}

uint64_t __95__UNCPendingNotificationRepository__queue_notifyObserversOfChangesFrom_to_forBundleIdentifier___block_invoke(void *a1, void *a2)
{
  return [a2 pendingNotificationRepository:a1[4] didPerformUpdates:a1[5] forBundleIdentifier:a1[6]];
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v15;
    id v9 = (os_log_t *)MEMORY[0x263F1E040];
    *(void *)&long long v6 = 138543362;
    long long v13 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "bundleIdentifier", v13);
        uint64_t v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v11;
          _os_log_impl(&dword_2608DB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all pending notification dictionaries", buf, 0xCu);
        }
        [(UNCKeyedDataStoreRepository *)self->_repository removeStoreForKey:v11];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_repository, 0);
}

@end