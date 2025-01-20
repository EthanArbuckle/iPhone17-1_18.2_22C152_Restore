@interface SearchUIAppClipButtonItemGenerator
+ (id)sharedCache;
- (TLKAsyncCache)cacheToPrewarm;
- (id)itemsToBatchPreFetchForRowModel:(id)a3;
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUIAppClipButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 command];
  v8 = [(id)objc_opt_class() sharedCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__SearchUIAppClipButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  v11[3] = &unk_1E6E744E0;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 getObjectForKey:v7 completionHandler:v11];
}

void __93__SearchUIAppClipButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a2 BOOLValue])
  {
    v3 = [[SearchUIButtonItem alloc] initWithSFButtonItem:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, 1);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

+ (id)sharedCache
{
  if (sharedCache_onceToken_1 != -1) {
    dispatch_once(&sharedCache_onceToken_1, &__block_literal_global_41);
  }
  v2 = (void *)sharedCache_cache;
  return v2;
}

uint64_t __49__SearchUIAppClipButtonItemGenerator_sharedCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedCache_cache;
  sharedCache_cache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)itemsToBatchPreFetchForRowModel:(id)a3
{
  return (id)[a3 requestAppClipObjects];
}

- (TLKAsyncCache)cacheToPrewarm
{
  v2 = objc_opt_class();
  return (TLKAsyncCache *)[v2 sharedCache];
}

@end