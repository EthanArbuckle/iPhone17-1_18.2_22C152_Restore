@interface ICInAppMessageStore
- (ICInAppMessageStore)init;
- (ICInAppMessageStore)initWithFilePath:(id)a3;
- (id)_defaultStoreFilePath;
- (void)_commit;
- (void)_load;
- (void)addMessageEntry:(id)a3 completion:(id)a4;
- (void)addPendingMessageEvent:(id)a3 completion:(id)a4;
- (void)allApplicationStorePropertiesWithCompletion:(id)a3;
- (void)allStorePropertiesWithCompletion:(id)a3;
- (void)getAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getAllMessageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)getAllMessageEntriesWithCompletion:(id)a3;
- (void)getAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getAllMetadataForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)getMessageEntryWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)getMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)getStorePropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)getStorePropertyForKey:(id)a3 completion:(id)a4;
- (void)pendingMessageEventsWithCompletion:(id)a3;
- (void)removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)removeMessageEntry:(id)a3 completion:(id)a4;
- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)removeMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)removePendingMessageEventWithIdentifier:(id)a3 completion:(id)a4;
- (void)resetStoreWithCompletion:(id)a3;
- (void)updateMessageEntry:(id)a3 completion:(id)a4;
- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)updateStoreProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)updateStoreProperty:(id)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation ICInAppMessageStore

void __75__ICInAppMessageStore_getAllMessageEntriesForBundleIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        v9 = [v8 allValues];

        if ([v9 count]) {
          [v2 addObjectsFromArray:v9];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (ICInAppMessageStore)init
{
  id v3 = [(ICInAppMessageStore *)self _defaultStoreFilePath];
  uint64_t v4 = [(ICInAppMessageStore *)self initWithFilePath:v3];

  return v4;
}

- (ICInAppMessageStore)initWithFilePath:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICInAppMessageStore;
  uint64_t v6 = [(ICInAppMessageStore *)&v25 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filePath, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    messageEntryCache = v7->_messageEntryCache;
    v7->_messageEntryCache = v8;

    long long v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    globalPropertyCache = v7->_globalPropertyCache;
    v7->_globalPropertyCache = v10;

    long long v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applicationPropertyCache = v7->_applicationPropertyCache;
    v7->_applicationPropertyCache = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    messageMetadataCache = v7->_messageMetadataCache;
    v7->_messageMetadataCache = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageStore.accessQueue", v17);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageStore.callbackQueue", v21);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v22;

    [(ICInAppMessageStore *)v7 _load];
  }

  return v7;
}

- (void)_load
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  messageEntryCache = self->_messageEntryCache;
  self->_messageEntryCache = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = self->_messageEntryCache;
  self->_messageEntryCache = v5;

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  globalPropertyCache = self->_globalPropertyCache;
  self->_globalPropertyCache = v7;

  v9 = [MEMORY[0x1E4F1CA48] array];
  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = v9;

  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:self->_filePath];
  if ([v11 length])
  {
    id v47 = 0;
    long long v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v47];
    id v13 = v47;
    if (v13)
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v50 = self;
        __int16 v51 = 2114;
        id v52 = v13;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to read message store data. err=%{public}@", buf, 0x16u);
      }
    }
    if (_NSIsNSDictionary())
    {
      uint64_t v15 = objc_msgSend(v12, "ic_dictionaryValueForKey:", @"properties");
      if (_NSIsNSDictionary())
      {
        v16 = (NSMutableDictionary *)[v15 mutableCopy];
        v17 = self->_globalPropertyCache;
        self->_globalPropertyCache = v16;
      }
      v36 = v15;
      dispatch_queue_t v18 = objc_msgSend(v12, "ic_dictionaryValueForKey:", @"applicationProperties");
      if (_NSIsNSDictionary())
      {
        v19 = (NSMutableDictionary *)[v18 mutableCopy];
        applicationPropertyCache = self->_applicationPropertyCache;
        self->_applicationPropertyCache = v19;
      }
      v35 = v18;
      id v37 = v13;
      v39 = v11;
      v21 = objc_msgSend(v12, "ic_dictionaryValueForKey:", @"messages");
      if (_NSIsNSDictionary())
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __28__ICInAppMessageStore__load__block_invoke;
        v46[3] = &unk_1E5ACA620;
        v46[4] = self;
        [v21 enumerateKeysAndObjectsUsingBlock:v46];
      }
      dispatch_queue_t v22 = objc_msgSend(v12, "ic_dictionaryValueForKey:", @"metadata");
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __28__ICInAppMessageStore__load__block_invoke_45;
      v45[3] = &unk_1E5ACA620;
      v45[4] = self;
      v34 = v22;
      [v22 enumerateKeysAndObjectsUsingBlock:v45];
      v38 = v12;
      v23 = objc_msgSend(v12, "ic_arrayValueForKey:", @"events");
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v29 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v30 = objc_opt_class();
            id v40 = 0;
            v31 = [v29 unarchivedObjectOfClass:v30 fromData:v28 error:&v40];
            id v32 = v40;
            if (v31)
            {
              [(NSMutableArray *)self->_pendingEvents addObject:v31];
            }
            else
            {
              v33 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v50 = self;
                __int16 v51 = 2114;
                id v52 = v32;
                _os_log_impl(&dword_1A2D01000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize event entry. err=%{public}@", buf, 0x16u);
              }
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v48 count:16];
        }
        while (v25);
      }

      long long v12 = v38;
      long long v11 = v39;
      id v13 = v37;
    }
  }
}

- (id)_defaultStoreFilePath
{
  v2 = ICDefaultCacheDirectory();
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v2, @"InAppMessages", @"MessageStore.plist", 0);
  uint64_t v4 = [NSString pathWithComponents:v3];

  return v4;
}

- (void)getStorePropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

void __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD250;
  id v8 = *(id *)(a1 + 56);
  id v6 = v2;
  id v7 = *(id *)(a1 + 48);
  id v4 = v2;
  dispatch_async(v3, block);
}

uint64_t __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)getAllMessageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ICInAppMessageStore_getAllMessageEntriesForBundleIdentifiers_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (void)allStorePropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5ACD2F0;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_messageMetadataCache, 0);
  objc_storeStrong((id *)&self->_applicationPropertyCache, 0);
  objc_storeStrong((id *)&self->_globalPropertyCache, 0);
  objc_storeStrong((id *)&self->_messageEntryCache, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_commit
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  id v4 = v3;
  globalPropertyCache = self->_globalPropertyCache;
  if (globalPropertyCache) {
    [v3 setObject:globalPropertyCache forKey:@"properties"];
  }
  applicationPropertyCache = self->_applicationPropertyCache;
  if (applicationPropertyCache) {
    [v4 setObject:applicationPropertyCache forKey:@"applicationProperties"];
  }
  if (self->_messageEntryCache)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_messageEntryCache, "count"));
    messageEntryCache = self->_messageEntryCache;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __30__ICInAppMessageStore__commit__block_invoke;
    v36[3] = &unk_1E5ACA648;
    v36[4] = self;
    id v37 = v7;
    id v9 = v7;
    [(NSMutableDictionary *)messageEntryCache enumerateKeysAndObjectsUsingBlock:v36];
    [v4 setObject:v9 forKey:@"messages"];
  }
  if (self->_messageMetadataCache)
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_messageMetadataCache, "count"));
    messageMetadataCache = self->_messageMetadataCache;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __30__ICInAppMessageStore__commit__block_invoke_54;
    v34[3] = &unk_1E5ACA648;
    v34[4] = self;
    id v35 = v10;
    id v12 = v10;
    [(NSMutableDictionary *)messageMetadataCache enumerateKeysAndObjectsUsingBlock:v34];
    [v4 setObject:v12 forKey:@"metadata"];
  }
  if (self->_pendingEvents)
  {
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pendingEvents, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v27 = self;
    id v14 = self->_pendingEvents;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v29 = 0;
          v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v29];
          id v21 = v29;
          if (v20)
          {
            [v13 addObject:v20];
          }
          else
          {
            dispatch_queue_t v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = [v19 eventIdentifier];
              *(_DWORD *)buf = 138543874;
              v39 = v27;
              __int16 v40 = 2114;
              id v41 = v23;
              __int16 v42 = 2114;
              id v43 = v21;
              _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize event entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"events"];
    self = v27;
  }
  id v28 = 0;
  uint64_t v24 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v28];
  id v25 = v28;
  if (v25)
  {
    uint64_t v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      __int16 v40 = 2114;
      id v41 = v25;
      _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to commit message store data. err=%{public}@", buf, 0x16u);
    }
  }
  [v24 writeToFile:self->_filePath atomically:1];
}

void __30__ICInAppMessageStore__commit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __30__ICInAppMessageStore__commit__block_invoke_2;
  id v14 = &unk_1E5ACC010;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:&v11];

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7, v11, v12, v13, v14);
}

void __30__ICInAppMessageStore__commit__block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __30__ICInAppMessageStore__commit__block_invoke_2_55;
  id v14 = &unk_1E5ACC010;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:&v11];

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7, v11, v12, v13, v14);
}

void __30__ICInAppMessageStore__commit__block_invoke_2_55(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v10 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v10];
  id v7 = v10;
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
  else
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize message metadata entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
}

void __30__ICInAppMessageStore__commit__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v10 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v10];
  id v7 = v10;
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
  else
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize message entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
}

void __28__ICInAppMessageStore__load__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSDictionary())
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __28__ICInAppMessageStore__load__block_invoke_2;
    __int16 v13 = &unk_1E5ACA5F8;
    uint64_t v8 = *(void *)(a1 + 32);
    id v14 = v7;
    uint64_t v15 = v8;
    id v9 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:&v10];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setObject:forKey:", v9, v5, v10, v11, v12, v13);
  }
}

void __28__ICInAppMessageStore__load__block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSDictionary())
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __28__ICInAppMessageStore__load__block_invoke_2_46;
    __int16 v13 = &unk_1E5ACA5F8;
    uint64_t v8 = *(void *)(a1 + 32);
    id v14 = v7;
    uint64_t v15 = v8;
    id v9 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:&v10];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKey:", v9, v5, v10, v11, v12, v13);
  }
}

void __28__ICInAppMessageStore__load__block_invoke_2_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSData())
  {
    id v11 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
    id v8 = v11;
    if (v7)
    {
      [*(id *)(a1 + 32) setObject:v7 forKey:v5];
    }
    else
    {
      id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v13 = v10;
        __int16 v14 = 2114;
        id v15 = v5;
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize message metadata entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
      }
    }
  }
}

void __28__ICInAppMessageStore__load__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSData())
  {
    id v11 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
    id v8 = v11;
    if (v7)
    {
      [*(id *)(a1 + 32) setObject:v7 forKey:v5];
    }
    else
    {
      id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v13 = v10;
        __int16 v14 = 2114;
        id v15 = v5;
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize message entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)removeAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _commit];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

void __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2) {
    [v2 removeObjectForKey:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) _commit];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v6 = *(id *)(a1 + 56);
  dispatch_async(v4, block);
}

uint64_t __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E5ACA5D0;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(accessQueue, block);
}

void __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  id v3 = (void *)[*(id *)(a1 + 48) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 56)];

  [*(id *)(a1 + 32) _commit];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v6 = *(id *)(a1 + 64);
  dispatch_async(v4, block);
}

uint64_t __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllMetadataForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v7)];
        id v9 = (void *)[v8 copy];

        if ([v9 count]) {
          [v2 addEntriesFromDictionary:v9];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  id v10 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke_2;
  v13[3] = &unk_1E5ACD2F0;
  id v11 = *(id *)(a1 + 48);
  id v14 = v2;
  id v15 = v11;
  id v12 = v2;
  dispatch_async(v10, v13);
}

uint64_t __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)getAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(ICInAppMessageStore *)self getAllMetadataForBundleIdentifiers:v8 completion:v7];
}

- (void)getMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

void __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  id v3 = [v2 objectForKey:*(void *)(a1 + 48)];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
  v8[3] = &unk_1E5ACD2F0;
  id v6 = *(id *)(a1 + 56);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

uint64_t __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)removePendingMessageEventWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke(uint64_t a1)
{
  for (unint64_t i = 0; i < [*(id *)(*(void *)(a1 + 32) + 56) count]; ++i)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndex:i];
    uint64_t v4 = [v3 eventIdentifier];
    char v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

    if (v5) {
      break;
    }
  }
  if (i < [*(id *)(*(void *)(a1 + 32) + 56) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObjectAtIndex:i];
    [*(id *)(a1 + 32) _commit];
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v6, block);
}

uint64_t __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pendingMessageEventsWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5ACD2F0;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)addPendingMessageEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _commit];
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v6, block);
}

uint64_t __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetStoreWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v11;

  [*(id *)(a1 + 32) _commit];
  id v14 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v16 = *(id *)(a1 + 40);
  dispatch_async(v14, block);
}

uint64_t __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(ICInAppMessageStore *)self getAllMessageEntriesForBundleIdentifiers:v8 completion:v7];
}

- (void)getAllMessageEntriesWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ICInAppMessageStore_getAllMessageEntriesWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __58__ICInAppMessageStore_getAllMessageEntriesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) allValues];
        [v2 addObjectsFromArray:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getMessageEntryWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__ICInAppMessageStore_getMessageEntryWithIdentifier_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

void __81__ICInAppMessageStore_getMessageEntryWithIdentifier_bundleIdentifier_completion___block_invoke(void *a1)
{
  id v4 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v2 = [v4 objectForKey:a1[6]];
  if (v2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7008 userInfo:0];
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _commit];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

void __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 removeObjectForKey:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v3 forKey:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) _commit];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v6 = *(id *)(a1 + 56);
  dispatch_async(v4, block);
}

uint64_t __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeMessageEntry:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v7 bundleIdentifier];
  id v8 = [v7 applicationMessage];

  id v9 = [v8 identifier];
  [(ICInAppMessageStore *)self removeMessageEntryWithIdentifier:v9 forBundleIdentifier:v10 completion:v6];
}

- (void)updateMessageEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] bundleIdentifier];
  id v3 = [*((id *)a1[5] + 3) objectForKey:v2];
  if (!v3) {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v4 = a1[4];
  uint64_t v5 = [v4 applicationMessage];
  id v6 = [v5 identifier];
  [v3 setObject:v4 forKey:v6];

  [*((id *)a1[5] + 3) setObject:v3 forKey:v2];
  [a1[5] _commit];
  id v7 = *((void *)a1[5] + 2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v9 = a1[6];
  dispatch_async(v7, block);
}

uint64_t __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addMessageEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] bundleIdentifier];
  id v3 = [*((id *)a1[5] + 3) objectForKey:v2];
  if (!v3) {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v4 = a1[4];
  uint64_t v5 = [v4 applicationMessage];
  id v6 = [v5 identifier];
  [v3 setObject:v4 forKey:v6];

  [*((id *)a1[5] + 3) setObject:v3 forKey:v2];
  [a1[5] _commit];
  id v7 = *((void *)a1[5] + 2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v9 = a1[6];
  dispatch_async(v7, block);
}

uint64_t __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allApplicationStorePropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5ACD2F0;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)updateStoreProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E5ACA5D0;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(accessQueue, block);
}

void __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = (void *)[v2 mutableCopy];

  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
  }
  [v3 setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _commit];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v6 = *(id *)(a1 + 64);
  dispatch_async(v4, block);
}

uint64_t __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStorePropertyForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  id v3 = (void *)[v2 copy];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke_2;
  v7[3] = &unk_1E5ACD2F0;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)updateStoreProperty:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(accessQueue, v15);
}

void __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _commit];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke_2;
  block[3] = &unk_1E5ACD170;
  id v4 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

uint64_t __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end