@interface SUMediaLibraryAdamIDCache
+ (id)sharedCache;
- (SUMediaLibraryAdamIDCache)init;
- (void)_libraryChangedNotification:(id)a3;
- (void)_populateCache;
- (void)dealloc;
- (void)getContainsAdamID:(id)a3 completionBlock:(id)a4;
- (void)getIntersectionWithSet:(id)a3 completionBlock:(id)a4;
- (void)getProperties:(id)a3 ofAdamIDs:(id)a4 withCompletionBlock:(id)a5;
- (void)populateCache;
@end

@implementation SUMediaLibraryAdamIDCache

- (SUMediaLibraryAdamIDCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUMediaLibraryAdamIDCache;
  v2 = [(SUMediaLibraryAdamIDCache *)&v6 init];
  if (v2)
  {
    v2->_adamIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iTunesStoreUI.SUMediaLibraryAdamIDCache.callback", 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iTunesStoreUI.SUMediaLibraryAdamIDCache", 0);
    [MEMORY[0x263F11E68] setFilteringDisabled:1];
    v3 = (void *)[MEMORY[0x263F11E40] defaultMediaLibrary];
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__libraryChangedNotification_ name:*MEMORY[0x263F11418] object:v3];
    [v3 beginGeneratingLibraryChangeNotifications];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F11418] object:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F11E40], "defaultMediaLibrary"), "endGeneratingLibraryChangeNotifications");
  callbackQueue = self->_callbackQueue;
  if (callbackQueue) {
    dispatch_release(callbackQueue);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)SUMediaLibraryAdamIDCache;
  [(SUMediaLibraryAdamIDCache *)&v6 dealloc];
}

+ (id)sharedCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUMediaLibraryAdamIDCache_sharedCache__block_invoke;
  block[3] = &unk_264812130;
  block[4] = a1;
  if (sharedCache_sOnce != -1) {
    dispatch_once(&sharedCache_sOnce, block);
  }
  return (id)sharedCache_sCache;
}

id __40__SUMediaLibraryAdamIDCache_sharedCache__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  sharedCache_sCache = (uint64_t)result;
  return result;
}

- (void)getContainsAdamID:(id)a3 completionBlock:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke;
  block[3] = &unk_264813800;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(unsigned char *)(v2 + 32))
  {
    [(id)v2 _populateCache];
    uint64_t v2 = a1[4];
  }
  char v3 = [*(id *)(v2 + 8) containsObject:a1[5]];
  v4 = *(NSObject **)(a1[4] + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke_2;
  v5[3] = &unk_2648141F8;
  v5[4] = a1[6];
  char v6 = v3;
  dispatch_async(v4, v5);
}

uint64_t __63__SUMediaLibraryAdamIDCache_getContainsAdamID_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getIntersectionWithSet:(id)a3 completionBlock:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke;
  block[3] = &unk_264813800;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[32]) {
    [v2 _populateCache];
  }
  char v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v3 intersectSet:*(void *)(*(void *)(a1 + 32) + 8)];
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke_2;
  v6[3] = &unk_264812A00;
  uint64_t v5 = *(void *)(a1 + 48);
  v6[4] = v3;
  v6[5] = v5;
  dispatch_async(v4, v6);
}

uint64_t __68__SUMediaLibraryAdamIDCache_getIntersectionWithSet_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getProperties:(id)a3 ofAdamIDs:(id)a4 withCompletionBlock:(id)a5
{
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke;
  v6[3] = &unk_264812AB0;
  v6[4] = a3;
  v6[5] = a4;
  void v6[6] = self;
  v6[7] = a5;
  dispatch_async(dispatchQueue, v6);
}

void __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A680860]();
  id v2 = objc_alloc_init(MEMORY[0x263F11E68]);
  objc_msgSend(v2, "setItemPropertiesToFetch:", objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", a1[4]));
  [v2 setSortItems:0];
  [v2 setUseSections:0];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = (void *)a1[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x263F113D8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [MEMORY[0x263F11E60] predicateWithValue:*(void *)(*((void *)&v16 + 1) + 8 * i) forProperty:v8];
        [v2 addFilterPredicate:v10];
        v11 = (void *)[v2 items];
        if ([v11 count]) {
          [v3 addObjectsFromArray:v11];
        }
        [v2 removeFilterPredicate:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  uint64_t v12 = a1[7];
  if (v12)
  {
    v13 = *(NSObject **)(a1[6] + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke_2;
    block[3] = &unk_264812A00;
    block[4] = v3;
    void block[5] = v12;
    dispatch_async(v13, block);
  }
}

uint64_t __73__SUMediaLibraryAdamIDCache_getProperties_ofAdamIDs_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)populateCache
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUMediaLibraryAdamIDCache_populateCache__block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

unsigned char *__42__SUMediaLibraryAdamIDCache_populateCache__block_invoke(uint64_t a1)
{
  id result = *(unsigned char **)(a1 + 32);
  if (!result[32]) {
    return (unsigned char *)[result _populateCache];
  }
  return result;
}

- (void)_libraryChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUMediaLibraryAdamIDCache__libraryChangedNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __57__SUMediaLibraryAdamIDCache__libraryChangedNotification___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    *(unsigned char *)(v1 + 32) = 0;
    return [*(id *)(result + 32) _populateCache];
  }
  return result;
}

- (void)_populateCache
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F11E68]);
  objc_msgSend(v3, "addFilterPredicate:", objc_msgSend(MEMORY[0x263F11E60], "predicateWithValue:forProperty:", MEMORY[0x263EFFA88], *MEMORY[0x263F11308]));
  objc_msgSend(v3, "setItemPropertiesToFetch:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F113D8], *MEMORY[0x263F113E0], 0));
  [v3 setSortItems:0];
  [v3 setUseSections:0];
  [(NSMutableSet *)self->_adamIDs removeAllObjects];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke;
  v14[3] = &unk_2648150A0;
  v14[4] = self;
  [v3 _enumerateItemsUsingBlock:v14];
  self->_isPopulated = 1;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke_2;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  uint64_t v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [(NSMutableSet *)self->_adamIDs count];
    int v15 = 138412546;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    LODWORD(v12) = 22;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }
  }
}

uint64_t __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [a2 valueForProperty:*MEMORY[0x263F113D8]];
    if (v4) {
      [*(id *)(*(void *)(v3 + 32) + 8) addObject:v4];
    }
    id result = [a2 valueForProperty:*MEMORY[0x263F113E0]];
    if (result)
    {
      uint64_t v5 = result;
      int v6 = *(void **)(*(void *)(v3 + 32) + 8);
      return [v6 addObject:v5];
    }
  }
  return result;
}

uint64_t __43__SUMediaLibraryAdamIDCache__populateCache__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 postNotificationName:@"SUMediaLibraryCacheDidChangeNotification" object:v3];
}

@end