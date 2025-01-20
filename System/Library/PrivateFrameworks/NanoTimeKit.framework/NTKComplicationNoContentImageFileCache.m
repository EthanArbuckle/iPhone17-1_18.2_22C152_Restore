@interface NTKComplicationNoContentImageFileCache
+ (id)sharedInstance;
- (BOOL)_flushCache;
- (NTKComplicationNoContentImageFileCache)init;
- (id)_makeMutableCacheCopy;
- (id)imageForClientIdentifier:(id)a3 family:(int64_t)a4;
- (id)noContentImagesForClientIdentifier:(id)a3;
- (void)_dirtyCache;
- (void)dealloc;
- (void)init;
- (void)removeAllEntriesExceptThoseWithClientIdentifiers:(id)a3;
- (void)setImage:(id)a3 forClientIdentifier:(id)a4 family:(int64_t)a5;
- (void)setNoContentImages:(id)a3 forClientIdentifier:(id)a4;
@end

@implementation NTKComplicationNoContentImageFileCache

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NTKComplicationNoContentImageFileCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_21 != -1) {
    dispatch_once(&sharedInstance_onceToken_21, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_7;
  return v2;
}

void __56__NTKComplicationNoContentImageFileCache_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance___sharedInstance_7;
  sharedInstance___sharedInstance_7 = (uint64_t)v0;
}

- (NTKComplicationNoContentImageFileCache)init
{
  v26.receiver = self;
  v26.super_class = (Class)NTKComplicationNoContentImageFileCache;
  v2 = [(NTKComplicationNoContentImageFileCache *)&v26 init];
  if (v2)
  {
    v3 = _PathToComplicationNoContentImageArchive();
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:1 error:0];
    if (v4)
    {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
      [v5 setDecodingFailurePolicy:0];
      v6 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
      v11 = [v5 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1E4F284E8]];
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      NTKValidateDictionary(v11, v12, v13);
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }

    queue_complicationNoContentImages = v2->_queue_complicationNoContentImages;
    v2->_queue_complicationNoContentImages = v11;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.NanoTimeKit.NTKComplicationNoContentImageFileCache.access", v15);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.NanoTimeKit.NTKComplicationNoContentImageFileCache.flush", v18);
    cacheFlushQueue = v2->_cacheFlushQueue;
    v2->_cacheFlushQueue = (OS_dispatch_queue *)v19;

    v21 = [[NTKTaskScheduler alloc] initWithQueue:v2->_cacheFlushQueue];
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = v21;

    [(NTKTaskScheduler *)v2->_taskScheduler setWaitingPeriod:30.0];
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"NTKComplicationNoContentImageFileCache-%p", v2);
    cacheIdentifier = v2->_cacheIdentifier;
    v2->_cacheIdentifier = (NSString *)v23;
  }
  return v2;
}

- (void)dealloc
{
  [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationNoContentImageFileCache;
  [(NTKComplicationNoContentImageFileCache *)&v3 dealloc];
}

- (id)imageForClientIdentifier:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v15 = 0;
    dispatch_queue_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__43;
    dispatch_queue_t v19 = __Block_byref_object_dispose__43;
    id v20 = 0;
    cacheQueue = self->_cacheQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__NTKComplicationNoContentImageFileCache_imageForClientIdentifier_family___block_invoke;
    v11[3] = &unk_1E62C86F0;
    v11[4] = self;
    uint64_t v13 = &v15;
    int64_t v14 = a4;
    id v12 = v6;
    dispatch_sync(cacheQueue, v11);
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __74__NTKComplicationNoContentImageFileCache_imageForClientIdentifier_family___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  switch(a1[7])
  {
    case 0:
      id v6 = v2;
      uint64_t v3 = [v2 modularSmallImage];
      goto LABEL_6;
    case 2:
      id v6 = v2;
      uint64_t v3 = [v2 utilitarianSmallImage];
      goto LABEL_6;
    case 4:
      id v6 = v2;
      uint64_t v3 = [v2 circularSmallImage];
      goto LABEL_6;
    case 7:
      id v6 = v2;
      uint64_t v3 = [v2 extraLargeImage];
LABEL_6:
      uint64_t v4 = *(void *)(a1[6] + 8);
      v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      v2 = v6;
      break;
    default:
      break;
  }
}

- (void)setImage:(id)a3 forClientIdentifier:(id)a4 family:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    objc_initWeak(&location, self);
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__NTKComplicationNoContentImageFileCache_setImage_forClientIdentifier_family___block_invoke;
    block[3] = &unk_1E62C8718;
    objc_copyWeak(v14, &location);
    id v12 = v9;
    v14[1] = (id)a5;
    id v13 = v8;
    dispatch_async(cacheQueue, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

void __78__NTKComplicationNoContentImageFileCache_setImage_forClientIdentifier_family___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    uint64_t v3 = [WeakRetained[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (!v3)
    {
      uint64_t v3 = objc_alloc_init(NTKComplicationNoContentImages);
      [v4[1] setObject:v3 forKey:*(void *)(a1 + 32)];
      [v4 _dirtyCache];
    }
    switch(*(void *)(a1 + 56))
    {
      case 0:
        [(NTKComplicationNoContentImages *)v3 setModularSmallImage:*(void *)(a1 + 40)];
        goto LABEL_9;
      case 2:
        [(NTKComplicationNoContentImages *)v3 setUtilitarianSmallImage:*(void *)(a1 + 40)];
        goto LABEL_9;
      case 4:
        [(NTKComplicationNoContentImages *)v3 setCircularSmallImage:*(void *)(a1 + 40)];
        goto LABEL_9;
      case 7:
        [(NTKComplicationNoContentImages *)v3 setExtraLargeImage:*(void *)(a1 + 40)];
LABEL_9:
        [v4 _dirtyCache];
        break;
      default:
        break;
    }

    WeakRetained = v4;
  }
}

- (id)noContentImagesForClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__43;
    dispatch_queue_t v16 = __Block_byref_object_dispose__43;
    id v17 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NTKComplicationNoContentImageFileCache_noContentImagesForClientIdentifier___block_invoke;
    block[3] = &unk_1E62C2810;
    v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(cacheQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __77__NTKComplicationNoContentImageFileCache_noContentImagesForClientIdentifier___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setNoContentImages:(id)a3 forClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  cacheQueue = self->_cacheQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__NTKComplicationNoContentImageFileCache_setNoContentImages_forClientIdentifier___block_invoke;
  v11[3] = &unk_1E62C1A70;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(cacheQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __81__NTKComplicationNoContentImageFileCache_setNoContentImages_forClientIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v4 = *(void **)(a1 + 40);
    if (v4)
    {
      if (([v4 isEqual:v3] & 1) == 0)
      {
        [v5[1] setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
LABEL_7:
        [v5 _dirtyCache];
      }
    }
    else if (v3)
    {
      [v5[1] removeObjectForKey:*(void *)(a1 + 32)];
      goto LABEL_7;
    }

    WeakRetained = v5;
  }
}

- (void)removeAllEntriesExceptThoseWithClientIdentifiers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__NTKComplicationNoContentImageFileCache_removeAllEntriesExceptThoseWithClientIdentifiers___block_invoke;
  block[3] = &unk_1E62C1A18;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(cacheQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __91__NTKComplicationNoContentImageFileCache_removeAllEntriesExceptThoseWithClientIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [WeakRetained[1] allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(WeakRetained[1], "removeObjectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
          [WeakRetained _dirtyCache];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (void)_dirtyCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];
  self->_cacheDirty = 1;
  objc_initWeak(&location, self);
  taskScheduler = self->_taskScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__NTKComplicationNoContentImageFileCache__dirtyCache__block_invoke;
  v5[3] = &unk_1E62C0820;
  objc_copyWeak(&v6, &location);
  id v4 = [(NTKTaskScheduler *)taskScheduler scheduleTask:v5 identifier:@"com.apple.ntk.NTKComplicationNoContentImageFileCache"];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __53__NTKComplicationNoContentImageFileCache__dirtyCache__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _flushCache];

  return v2;
}

- (id)_makeMutableCacheCopy
{
  uint64_t v3 = objc_opt_new();
  queue_complicationNoContentImages = self->_queue_complicationNoContentImages;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__NTKComplicationNoContentImageFileCache__makeMutableCacheCopy__block_invoke;
  v7[3] = &unk_1E62C8740;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)queue_complicationNoContentImages enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __63__NTKComplicationNoContentImageFileCache__makeMutableCacheCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)_flushCache
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__43;
  id v14 = __Block_byref_object_dispose__43;
  id v15 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NTKComplicationNoContentImageFileCache__flushCache__block_invoke;
  block[3] = &unk_1E62C81F0;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(cacheQueue, block);
  uint64_t v3 = v11[5];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11[5] requiringSecureCoding:1 error:0];
    id v5 = _PathToComplicationNoContentImageArchive();
    [v4 writeToFile:v5 atomically:1];

    id v6 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "NTKComplicationNoContentImageFileCache:_flushCache flushed out to disk", v8, 2u);
    }
  }
  _Block_object_dispose(&v10, 8);

  return v3 != 0;
}

void __53__NTKComplicationNoContentImageFileCache__flushCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    uint64_t v3 = [v2 _makeMutableCacheCopy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheFlushQueue, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_queue_complicationNoContentImages, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Error decoding complication no content images: %@", (uint8_t *)&v2, 0xCu);
}

@end