@interface TUMetadataCacheDataProvider
+ (id)classIdentifier;
- (BOOL)isEmpty;
- (NSMutableDictionary)providerCache;
- (OS_dispatch_queue)queue;
- (TUMetadataCacheDataProvider)init;
- (TUMetadataCacheDataProvider)initWithQueue:(id)a3;
- (TUMetadataCacheDataProviderDelegate)delegate;
- (id)description;
- (id)metadataForDestinationID:(id)a3;
- (void)_invalidateCache;
- (void)invalidateCache;
- (void)refresh;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forDestinationID:(id)a4;
@end

@implementation TUMetadataCacheDataProvider

- (id)metadataForDestinationID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v5 = [(TUMetadataCacheDataProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__TUMetadataCacheDataProvider_metadataForDestinationID___block_invoke;
  block[3] = &unk_1E58E65E0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __58__TUMetadataCacheDataProvider_setObject_forDestinationID___block_invoke(uint64_t a1)
{
  v3 = [[TUOptionalObject alloc] initWithValue:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) providerCache];
  [v2 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __56__TUMetadataCacheDataProvider_metadataForDestinationID___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) providerCache];
  v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 value];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSMutableDictionary)providerCache
{
  return self->_providerCache;
}

id __43__TUMetadataCacheDataProvider_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (TUMetadataCacheDataProvider)init
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() classIdentifier];
  v5 = NSStringFromSelector(sel_queue);
  id v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  id v8 = v6;
  dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], v7);
  id v10 = [(TUMetadataCacheDataProvider *)self initWithQueue:v9];

  return v10;
}

- (TUMetadataCacheDataProvider)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUMetadataCacheDataProvider;
  id v6 = [(TUMetadataCacheDataProvider *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    providerCache = v7->_providerCache;
    v7->_providerCache = (NSMutableDictionary *)v8;
  }
  return v7;
}

+ (id)classIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSString;
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:v2];
  id v5 = [v4 bundleIdentifier];
  id v6 = NSStringFromClass(v2);
  id v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];

  return v7;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUMetadataCacheDataProvider *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__TUMetadataCacheDataProvider_setDelegate___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setObject:(id)a3 forDestinationID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUMetadataCacheDataProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__TUMetadataCacheDataProvider_setObject_forDestinationID___block_invoke;
  block[3] = &unk_1E58E6258;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (TUMetadataCacheDataProviderDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  objc_super v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(TUMetadataCacheDataProvider *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__TUMetadataCacheDataProvider_delegate__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUMetadataCacheDataProviderDelegate *)v4;
}

uint64_t __39__TUMetadataCacheDataProvider_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  return MEMORY[0x1F41817F8]();
}

- (void)refresh
{
  uint64_t v3 = [(TUMetadataCacheDataProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__TUMetadataCacheDataProvider_refresh__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __38__TUMetadataCacheDataProvider_refresh__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [*(id *)(a1 + 32) providerCache];
  id v4 = [v3 allKeys];
  id v6 = [v2 setWithArray:v4];

  [*(id *)(a1 + 32) _invalidateCache];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dataProvider:*(void *)(a1 + 32) requestedRefreshWithDestinationIDs:v6];
  }
}

- (void)invalidateCache
{
  uint64_t v3 = [(TUMetadataCacheDataProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__TUMetadataCacheDataProvider_invalidateCache__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__TUMetadataCacheDataProvider_invalidateCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCache];
}

- (void)_invalidateCache
{
  uint64_t v3 = [(TUMetadataCacheDataProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TUMetadataCacheDataProvider *)self providerCache];
  [v4 removeAllObjects];
}

- (BOOL)isEmpty
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  uint64_t v3 = [(TUMetadataCacheDataProvider *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__TUMetadataCacheDataProvider_isEmpty__block_invoke;
  v5[3] = &unk_1E58E6568;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__TUMetadataCacheDataProvider_isEmpty__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) providerCache];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] == 0;
}

- (id)description
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  objc_super v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(TUMetadataCacheDataProvider *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TUMetadataCacheDataProvider_description__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__TUMetadataCacheDataProvider_description__block_invoke(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = objc_opt_class();
  id v7 = [*(id *)(a1 + 32) providerCache];
  uint64_t v4 = [v2 stringWithFormat:@"%@: %@", v3, v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end