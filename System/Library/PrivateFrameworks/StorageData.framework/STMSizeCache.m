@interface STMSizeCache
- (NSArray)items;
- (NSDate)cacheEventDate;
- (NSLock)itemsLock;
- (STMSizeCache)initWithPrefsKey:(id)a3;
- (STMSizeCacheDelegate)delegate;
- (id)itemForPath:(id)a3;
- (id)itemsContainedByPath:(id)a3;
- (id)itemsContainingPath:(id)a3;
- (id)sizeOfItemForPath:(id)a3;
- (id)updatedSizeOfItemForPath:(id)a3;
- (unint64_t)cacheEventID;
- (unint64_t)processCacheEvents:(id)a3;
- (void)_flushCache;
- (void)_writeCache;
- (void)addItem:(id)a3;
- (void)addItem:(id)a3 andComputeSizeSynchronously:(BOOL)a4;
- (void)addItems:(id)a3;
- (void)dealloc;
- (void)flushCacheToPref;
- (void)loadCacheFromPref;
- (void)notifyItemsAdded:(id)a3;
- (void)notifySizesChanged:(id)a3;
- (void)pruneCache;
- (void)removeItem:(id)a3;
- (void)removeItemForPath:(id)a3;
- (void)setCacheEventDate:(id)a3;
- (void)setCacheEventID:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setItemsLock:(id)a3;
- (void)updateLastCacheEventID:(unint64_t)a3;
- (void)updateSizeOfItem:(id)a3 synchronous:(BOOL)a4;
@end

@implementation STMSizeCache

- (STMSizeCache)initWithPrefsKey:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)STMSizeCache;
  id v5 = [(STMSizeCache *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    v7 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v6;

    *((void *)v5 + 1) = v4;
    id v8 = objc_alloc_init(MEMORY[0x263F08958]);
    v9 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:200];
    v11 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v10;

    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    objc_initWeak(&location, v5);
    v14 = *((void *)v5 + 4);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __33__STMSizeCache_initWithPrefsKey___block_invoke;
    v19 = &unk_264305050;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v14, &v16);
    dispatch_resume(*((dispatch_object_t *)v5 + 4));
    objc_msgSend(v5, "loadCacheFromPref", v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return (STMSizeCache *)v5;
}

void __33__STMSizeCache_initWithPrefsKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _flushCache];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(STMSizeCache *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)STMSizeCache;
  [(STMSizeCache *)&v3 dealloc];
}

- (void)loadCacheFromPref
{
  id v2 = self;
  uint64_t v56 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)CFPreferencesCopyValue(self->_prefsKey, @"com.apple.settings.storage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  if (!v3) {
    goto LABEL_39;
  }
  v44 = [MEMORY[0x263F08850] defaultManager];
  v41 = [v3 objectForKey:@"ItemSizes"];
  id v4 = [v3 objectForKey:@"EventIDDate"];
  id v5 = +[STAppOverrides overrides];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"com.apple.mobilemail"];
  v7 = [v6 includeFsPaths];
  id v8 = [v7 firstObject];

  [(NSLock *)v2->_itemsLock lock];
  id v39 = v4;
  v40 = v3;
  v38 = v8;
  if (v4 && ([v4 timeIntervalSinceNow], v9 > -1800.0))
  {
    v37 = [v3 objectForKey:@"EventID"];
    uint64_t v10 = [v41 allKeys];
    int v36 = 0;
  }
  else if (v8)
  {
    v11 = (void *)MEMORY[0x263EFF8C0];
    dispatch_source_t v12 = _CompressPath(v8);
    uint64_t v10 = [v11 arrayWithObject:v12];

    v37 = 0;
    int v36 = 1;
  }
  else
  {
    int v36 = 0;
    uint64_t v10 = 0;
    v37 = 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v10;
  uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (!v45) {
    goto LABEL_33;
  }
  uint64_t v43 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v45; ++i)
    {
      if (*(void *)v47 != v43) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(*((void *)&v46 + 1) + 8 * i);
      if ([v14 hasPrefix:@"$"])
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v15 = [&unk_26C92C4B0 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)v51;
          while (2)
          {
            v19 = v2;
            uint64_t v20 = 0;
            uint64_t v21 = v16 + v17;
            do
            {
              if (*(void *)v51 != v18) {
                objc_enumerationMutation(&unk_26C92C4B0);
              }
              objc_super v22 = *(void **)(*((void *)&v50 + 1) + 8 * v20);
              if ([v14 hasPrefix:v22])
              {
                uint64_t v24 = [v22 length];
                v25 = [&unk_26C92C498 objectAtIndexedSubscript:v17 + v20];
                objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", 0, v24, v25);
                id v23 = (id)objc_claimAutoreleasedReturnValue();

                id v2 = v19;
                goto LABEL_24;
              }
              ++v20;
            }
            while (v16 != v20);
            uint64_t v16 = [&unk_26C92C4B0 countByEnumeratingWithState:&v50 objects:v55 count:16];
            uint64_t v17 = v21;
            id v2 = v19;
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
      id v23 = v14;
LABEL_24:

      if ([v44 fileExistsAtPath:v23])
      {
        v26 = [(NSMutableDictionary *)v2->_itemsByPath objectForKey:v23];
        if (v26)
        {
          v27 = v26;
          if (![(STMSizeCacheEntry *)v26 status])
          {
LABEL_29:
            v30 = [v41 objectForKey:v14];
            [(STMSizeCacheEntry *)v27 setItemSize:v30];

            [(STMSizeCacheEntry *)v27 setStatus:2];
            [(NSMutableDictionary *)v2->_itemsByPath setObject:v27 forKey:v23];
          }

          goto LABEL_31;
        }
        v28 = [STMSizeCacheEntry alloc];
        v29 = [NSURL fileURLWithPath:v23];
        v27 = [(STMSizeCacheEntry *)v28 initWithURL:v29];

        goto LABEL_29;
      }
LABEL_31:
    }
    uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  }
  while (v45);
LABEL_33:

  if (v36)
  {
    v31 = [(NSMutableDictionary *)v2->_itemsByPath objectForKeyedSubscript:v38];
    [v31 setStatus:3];
    [(STMSizeCache *)v2 updateSizeOfItem:v31 synchronous:0];
  }
  uint64_t v32 = [v37 longLongValue];
  if (v32)
  {
    FSEventStreamEventId CurrentEventId = v32;
    objc_storeStrong((id *)&v2->_cacheEventDate, v39);
  }
  else
  {
    uint64_t v34 = [MEMORY[0x263EFF910] date];
    cacheEventDate = v2->_cacheEventDate;
    v2->_cacheEventDate = (NSDate *)v34;

    FSEventStreamEventId CurrentEventId = FSEventsGetCurrentEventId();
  }
  objc_super v3 = v40;
  v2->_cacheEventID = CurrentEventId;
  [(NSLock *)v2->_itemsLock unlock];

LABEL_39:
}

- (void)_writeCache
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [(STMSizeCache *)self pruneCache];
  [(NSLock *)self->_itemsLock lock];
  objc_super v3 = [(NSMutableDictionary *)self->_itemsByPath allValues];
  uint64_t v20 = [NSNumber numberWithLongLong:self->_cacheEventID];
  id v4 = [(STMSizeCache *)self cacheEventDate];
  [(NSLock *)self->_itemsLock unlock];
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v11 status] == 2)
        {
          dispatch_source_t v12 = [v11 itemSize];
          if (v12)
          {
            v13 = [v11 itemPath];
            id v14 = _CompressPath(v13);
            [v5 setObject:v12 forKey:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    [v15 setObject:v5 forKey:@"ItemSizes"];
    uint64_t v16 = (void *)v20;
    [v15 setObject:v20 forKey:@"EventID"];
    if (v4) {
      [v15 setObject:v4 forKey:@"EventIDDate"];
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = (void *)v20;
  }
  CFTypeRef v17 = CFRetain(self->_prefsKey);
  CFTypeRef v18 = CFRetain(@"com.apple.settings.storage");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__STMSizeCache__writeCache__block_invoke;
  block[3] = &unk_2643054C8;
  id v22 = v15;
  CFTypeRef v23 = v17;
  CFTypeRef v24 = v18;
  id v19 = v15;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __27__STMSizeCache__writeCache__block_invoke(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSetValue(*(CFStringRef *)(a1 + 40), *(CFPropertyListRef *)(a1 + 32), *(CFStringRef *)(a1 + 48), (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  CFPreferencesSynchronize(*(CFStringRef *)(a1 + 48), v2, v3);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  id v4 = *(const void **)(a1 + 48);

  CFRelease(v4);
}

- (void)_flushCache
{
  CFStringRef v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__STMSizeCache__flushCache__block_invoke;
  block[3] = &unk_264305098;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __27__STMSizeCache__flushCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeCache];
}

- (void)flushCacheToPref
{
  cacheFlushTimer = self->_cacheFlushTimer;
  dispatch_time_t v3 = dispatch_time(0, 5000000000);

  dispatch_source_set_timer(cacheFlushTimer, v3, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
}

- (void)notifyItemsAdded:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v5 sizeCacheItemsUpdated:self];
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)notifySizesChanged:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained sizeCache:self itemSizesChanged:v5];
    }
    else if (objc_opt_respondsToSelector())
    {
      [WeakRetained sizeCacheItemsUpdated:self];
    }
  }
}

- (NSArray)items
{
  [(NSLock *)self->_itemsLock lock];
  dispatch_time_t v3 = [(NSMutableDictionary *)self->_itemsByPath allValues];
  [(NSLock *)self->_itemsLock unlock];

  return (NSArray *)v3;
}

- (id)itemForPath:(id)a3
{
  itemsLock = self->_itemsLock;
  id v5 = a3;
  [(NSLock *)itemsLock lock];
  id v6 = [(NSMutableDictionary *)self->_itemsByPath objectForKey:v5];

  [(NSLock *)self->_itemsLock unlock];

  return v6;
}

- (void)updateSizeOfItem:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 status];
  uint64_t v8 = [v6 itemSize];
  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__STMSizeCache_updateSizeOfItem_synchronous___block_invoke;
    v16[3] = &unk_2643054F0;
    id v9 = v6;
    id v17 = v9;
    id v18 = v8;
    id v19 = self;
    uint64_t v10 = (void *)MEMORY[0x21D463DD0](v16);
    v11 = [v9 dispatchQueue];

    if (v11)
    {
      dispatch_source_t v12 = [v9 dispatchQueue];
      v13 = v12;
      if (v4) {
        dispatch_sync(v12, v10);
      }
      else {
        dispatch_async(v12, v10);
      }
    }
    else
    {
      v13 = [MEMORY[0x263F086D0] blockOperationWithBlock:v10];
      id v14 = [v9 queue];
      v20[0] = v13;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      [v14 addOperations:v15 waitUntilFinished:v4];
    }
  }
}

void __45__STMSizeCache_updateSizeOfItem_synchronous___block_invoke(id *a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  [a1[4] calculateSize];
  CFStringRef v2 = [a1[4] itemSize];
  if (v2 && ([a1[5] isEqual:v2] & 1) == 0)
  {
    id v3 = a1[6];
    v5[0] = a1[4];
    BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
    [v3 notifySizesChanged:v4];
  }
  [a1[6] flushCacheToPref];
}

- (id)updatedSizeOfItemForPath:(id)a3
{
  id v4 = a3;
  char v11 = 0;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v11];

  if (v6)
  {
    if (v11)
    {
      uint64_t v7 = STMakeDirPath(v4);

      id v4 = (id)v7;
    }
    uint64_t v8 = [(STMSizeCache *)self itemForPath:v4];
    if (v8)
    {
      [(STMSizeCache *)self updateSizeOfItem:v8 synchronous:1];
      id v9 = [v8 itemSize];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)sizeOfItemForPath:(id)a3
{
  id v4 = a3;
  char v12 = 0;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v12];

  if (v6)
  {
    if (v12)
    {
      uint64_t v7 = STMakeDirPath(v4);

      id v4 = (id)v7;
    }
    uint64_t v8 = [(STMSizeCache *)self itemForPath:v4];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 itemSize];
      [(STMSizeCache *)self updateSizeOfItem:v9 synchronous:0];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)itemsContainingPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSLock *)self->_itemsLock lock];
  id v5 = [(NSMutableDictionary *)self->_itemsByPath allValues];
  [(NSLock *)self->_itemsLock unlock];
  int v6 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x21D463BC0](v8);
        id v14 = objc_msgSend(v12, "itemPath", (void)v16);
        if ([v4 hasPrefix:v14]) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }

  return v6;
}

- (id)itemsContainedByPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSLock *)self->_itemsLock lock];
  id v5 = [(NSMutableDictionary *)self->_itemsByPath allValues];
  [(NSLock *)self->_itemsLock unlock];
  int v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  char v28 = 0;
  if ([v6 fileExistsAtPath:v4 isDirectory:&v28])
  {
    uint64_t v21 = v6;
    CFTypeRef v23 = v7;
    if (v28)
    {
      uint64_t v8 = STMakeDirPath(v4);

      id v4 = (id)v8;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v22 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v15 = (void *)MEMORY[0x21D463BC0]();
          long long v16 = [v14 itemPath];
          long long v17 = [v4 commonPrefixWithString:v16 options:0];
          int v18 = [v17 isEqualToString:v4];

          if (v18) {
            [v23 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    id v7 = v23;
    id v19 = v23;
    int v6 = v21;
    id v5 = v22;
  }
  else
  {
    id v19 = (id)MEMORY[0x263EFFA68];
  }

  return v19;
}

- (void)pruneCache
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  [(NSLock *)self->_itemsLock lock];
  id v4 = [(NSMutableDictionary *)self->_itemsByPath allKeys];
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
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (([v3 fileExistsAtPath:v9] & 1) == 0) {
          [(NSMutableDictionary *)self->_itemsByPath removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(NSLock *)self->_itemsLock unlock];
}

- (void)addItem:(id)a3 andComputeSizeSynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 itemPath];
  [(NSLock *)self->_itemsLock lock];
  uint64_t v8 = [(NSMutableDictionary *)self->_itemsByPath objectForKey:v7];
  uint64_t v9 = (void *)v8;
  if (v8) {
    BOOL v10 = v8 == (void)v6;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && ![v6 status] && objc_msgSend(v9, "status") == 2)
  {
    long long v11 = [v9 itemSize];
    [v6 setItemSize:v11];

    objc_msgSend(v6, "setStatus:", objc_msgSend(v9, "status"));
  }
  [(NSMutableDictionary *)self->_itemsByPath setObject:v6 forKey:v7];
  [(NSLock *)self->_itemsLock unlock];
  if (!v9)
  {
    v13[0] = v6;
    long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [(STMSizeCache *)self notifyItemsAdded:v12];
  }
  [(STMSizeCache *)self updateSizeOfItem:v6 synchronous:v4];
}

- (void)addItem:(id)a3
{
}

- (void)addItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(STMSizeCache *)self addItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeItemForPath:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_itemsLock lock];
  id v4 = [(NSMutableDictionary *)self->_itemsByPath objectForKey:v5];
  if (v4) {
    [(NSMutableDictionary *)self->_itemsByPath removeObjectForKey:v5];
  }
  [(NSLock *)self->_itemsLock unlock];
}

- (void)removeItem:(id)a3
{
  id v4 = [a3 itemPath];
  [(STMSizeCache *)self removeItemForPath:v4];
}

- (unint64_t)processCacheEvents:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSLock *)self->_itemsLock lock];
  uint64_t v5 = [v4 count];
  STLog(1, @"%ld events to process", v6, v7, v8, v9, v10, v11, v5);
  long long v12 = [v4 keysSortedByValueUsingSelector:sel_eventIDCompare_];
  v40 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v45;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v19 = (void *)MEMORY[0x21D463BC0]();
        uint64_t v20 = [v4 objectForKeyedSubscript:v18];
        uint64_t v21 = [(NSMutableDictionary *)self->_itemsByPath objectForKeyedSubscript:v18];
        char v28 = v21;
        if (v21)
        {
          if ([v21 status] != 1)
          {
            uint64_t v42 = [v20 evtID];
            uint64_t v43 = [v20 path];
            v29 = _CompressPath(v43);
            [v20 flags];
            v38 = [v28 itemPath];
            STLog(1, @"Processing FSEvent #%llu : path = %@ (flags: %x), cache entry path : %@", v30, v31, v32, v33, v34, v35, v42);

            uint64_t v16 = v39;
            if ([v28 status] == 2) {
              uint64_t v36 = 3;
            }
            else {
              uint64_t v36 = 0;
            }
            [v28 setStatus:v36];
            [v40 addObject:v28];
          }
          unint64_t v15 = [v20 evtID];
        }
        else
        {
          STLog(1, @"No associated cache entry for eventKey: %@", v22, v23, v24, v25, v26, v27, v18);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  [(NSLock *)self->_itemsLock unlock];
  [(STMSizeCache *)self notifySizesChanged:v40];

  return v15;
}

- (void)updateLastCacheEventID:(unint64_t)a3
{
  self->_cacheEventID = a3;
  self->_cacheEventDate = [MEMORY[0x263EFF910] date];

  MEMORY[0x270F9A758]();
}

- (STMSizeCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STMSizeCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)cacheEventID
{
  return self->_cacheEventID;
}

- (void)setCacheEventID:(unint64_t)a3
{
  self->_cacheEventID = a3;
}

- (NSDate)cacheEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCacheEventDate:(id)a3
{
}

- (NSLock)itemsLock
{
  return (NSLock *)objc_getProperty(self, a2, 64, 1);
}

- (void)setItemsLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_cacheEventDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cacheFlushTimer, 0);
  objc_storeStrong((id *)&self->_eventsToProcess, 0);

  objc_storeStrong((id *)&self->_itemsByPath, 0);
}

@end