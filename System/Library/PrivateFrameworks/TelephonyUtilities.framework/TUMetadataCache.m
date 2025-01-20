@interface TUMetadataCache
+ (id)classIdentifier;
- (BOOL)isEmpty;
- (NSArray)providers;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (TUMetadataCache)init;
- (TUMetadataCache)initWithDataProviders:(id)a3;
- (TUMetadataCache)initWithQueue:(id)a3 dataProviders:(id)a4;
- (id)metadataForDestinationID:(id)a3;
- (void)_updateCacheWithDestinationIDs:(id)a3 onlyEmptyProviders:(BOOL)a4 completion:(id)a5;
- (void)dataProvider:(id)a3 requestedRefreshWithDestinationIDs:(id)a4;
- (void)updateCacheForEmptyDataProvidersWithDestinationIDs:(id)a3;
- (void)updateCacheForEmptyDataProvidersWithDestinationIDs:(id)a3 completion:(id)a4;
- (void)updateCacheWithDestinationIDs:(id)a3;
- (void)updateCacheWithDestinationIDs:(id)a3 completion:(id)a4;
@end

@implementation TUMetadataCache

- (id)metadataForDestinationID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(TUMetadataItem);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(TUMetadataCache *)self providers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) metadataForDestinationID:v4];
        if (v11) {
          [(TUMetadataItem *)v5 setMetadata:v11 forProvider:objc_opt_class()];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)providers
{
  return self->_providers;
}

- (void)updateCacheWithDestinationIDs:(id)a3
{
}

- (TUMetadataCache)initWithDataProviders:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [(id)objc_opt_class() classIdentifier];
  uint64_t v7 = NSStringFromSelector(sel_queue);
  uint64_t v8 = [v4 stringWithFormat:@"%@.%@", v6, v7];

  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);

  id v11 = v8;
  dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], v10);
  long long v13 = [(TUMetadataCache *)self initWithQueue:v12 dataProviders:v5];

  return v13;
}

+ (id)classIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:v2];
  id v5 = [v4 bundleIdentifier];
  v6 = NSStringFromClass(v2);
  uint64_t v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];

  return v7;
}

- (TUMetadataCache)initWithQueue:(id)a3 dataProviders:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TUMetadataCache;
  uint64_t v9 = [(TUMetadataCache *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 copy];
    providers = v10->_providers;
    v10->_providers = (NSArray *)v11;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v13 = v10->_providers;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17++), "setDelegate:", v10, (void)v19);
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }
  }
  return v10;
}

void __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = dispatch_group_create();
  [*(id *)(a1 + 32) updateCacheWithDestinationIDs:*(void *)(a1 + 40) withGroup:v2];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  if (dispatch_group_wait(v2, v3))
  {
    id v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2048;
      uint64_t v10 = 500;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "%@ did not complete before the %llu millisecond timeout.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)updateCacheWithDestinationIDs:(id)a3 completion:(id)a4
{
}

- (void)_updateCacheWithDestinationIDs:(id)a3 onlyEmptyProviders:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v9 = (void (**)(void))a5;
  if ([v8 count])
  {
    uint64_t v18 = v9;
    uint64_t v10 = dispatch_group_create();
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(TUMetadataCache *)self providers];
    uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (!v6 || [*(id *)(*((void *)&v24 + 1) + 8 * i) isEmpty])
          {
            uint64_t v17 = [(TUMetadataCache *)self queue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke;
            block[3] = &unk_1E58E5C08;
            block[4] = v16;
            id v23 = v11;
            dispatch_group_async(v10, v17, block);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke_10;
    v20[3] = &unk_1E58E6760;
    __int16 v9 = v18;
    v20[4] = self;
    long long v21 = v18;
    dispatch_group_notify(v10, MEMORY[0x1E4F14428], v20);
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUMetadataCache)init
{
  return 0;
}

- (void)updateCacheForEmptyDataProvidersWithDestinationIDs:(id)a3
{
}

- (void)updateCacheForEmptyDataProvidersWithDestinationIDs:(id)a3 completion:(id)a4
{
}

void __80__TUMetadataCache__updateCacheWithDestinationIDs_onlyEmptyProviders_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.telephonyutilities.TUMetadataCacheDidFinishUpdatingNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)isEmpty
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(TUMetadataCache *)self providers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isEmpty])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (NSString)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v17.receiver = self;
  v17.super_class = (Class)TUMetadataCache;
  uint64_t v4 = [(TUMetadataCache *)&v17 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@", v4];

  if ([(TUMetadataCache *)self isEmpty])
  {
    [v5 appendFormat:@": <empty>"];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v6 = [(TUMetadataCache *)self providers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v11 isEmpty] & 1) == 0) {
            [v5 appendFormat:@"\n\t%@", v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }

  return (NSString *)v5;
}

- (void)dataProvider:(id)a3 requestedRefreshWithDestinationIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUMetadataCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke;
  block[3] = &unk_1E58E6258;
  id v12 = v6;
  id v13 = v7;
  long long v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = dispatch_group_create();
  [*(id *)(a1 + 32) updateCacheWithDestinationIDs:*(void *)(a1 + 40) withGroup:v2];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v2, v3))
  {
    uint64_t v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = 5;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Update (refresh) of data provider %@ did not complete before the %ld second timeout.", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke_24;
  block[3] = &unk_1E58E5BE0;
  void block[4] = *(void *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__TUMetadataCache_dataProvider_requestedRefreshWithDestinationIDs___block_invoke_24(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.telephonyutilities.TUMetadataCacheDidFinishUpdatingNotification" object:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_providers, 0);
}

@end