@interface WBSSiteMetadataImageCache
- (BOOL)_internalDidLoadImageAndShouldNotify:(id)a3 forKeyString:(id)a4 fromDisk:(BOOL)a5;
- (BOOL)isImageRetainedForKeyString:(id)a3;
- (BOOL)isTerminating;
- (NSURL)imageDirectoryURL;
- (WBSSiteMetadataImageCache)init;
- (WBSSiteMetadataImageCache)initWithImageDirectoryURL:(id)a3 imageType:(int64_t)a4;
- (WBSSiteMetadataImageCache)initWithImageDirectoryURL:(id)a3 imageType:(int64_t)a4 fileProtectionOptions:(unint64_t)a5;
- (WBSSiteMetadataImageCacheDelegate)delegate;
- (id).cxx_construct;
- (id)_cacheSettingsFileURL;
- (id)_diskAccessQueueName;
- (id)_fileLocationForKeyString:(id)a3;
- (id)_fileNameForKeyString:(id)a3;
- (id)_internalQueueName;
- (id)imageForKeyString:(id)a3 getImageState:(int64_t *)a4;
- (id)settingForKey:(id)a3;
- (int64_t)_internalImageStateForKeyString:(id)a3;
- (int64_t)imageStateForKeyString:(id)a3;
- (int64_t)imageType;
- (void)_didLoadImage:(id)a3 forKeyString:(id)a4 fromDisk:(BOOL)a5;
- (void)_dispatchDiskReadBlock:(id)a3;
- (void)_dispatchDiskWriteBlock:(id)a3;
- (void)_emptyCacheDirectory;
- (void)_internalPurgeUnneededImages;
- (void)_internalReleaseImageForKeyString:(id)a3;
- (void)_internalRemoveAllImages;
- (void)_internalRemoveImagesFromCacheForKeyStrings:(id)a3;
- (void)_internalSaveImageToDisk:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5;
- (void)_internalSetImageState:(int64_t)a3 forKeyString:(id)a4;
- (void)_internalSetUpImageCache;
- (void)_notifyDidFinishLoadingSettings;
- (void)_removeImagesPassingTest:(id)a3;
- (void)_requestImageForKeyString:(id)a3 completionHandler:(id)a4;
- (void)emptyCache;
- (void)getImageForKeyString:(id)a3 completionHandler:(id)a4;
- (void)purgeUnneededImages;
- (void)releaseImageForKeyString:(id)a3;
- (void)releaseImageWithKeyStringProvider:(id)a3;
- (void)releaseImagesForKeyStrings:(id)a3;
- (void)removeAllImages;
- (void)removeImagesFromCacheForKeyStrings:(id)a3;
- (void)retainImageForKeyString:(id)a3;
- (void)retainImageWithKeyStringProvider:(id)a3;
- (void)retainImagesForKeyStrings:(id)a3;
- (void)saveImageToDisk:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5;
- (void)savePendingChangesBeforeTermination;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3 forKeyString:(id)a4;
- (void)setImageState:(int64_t)a3 forKeyString:(id)a4;
- (void)setSetting:(id)a3 forKey:(id)a4;
- (void)setUpImageCache;
@end

@implementation WBSSiteMetadataImageCache

- (void)_requestImageForKeyString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, uint64_t))a4;
  if (![v6 length] || (unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_terminating), (v8 & 1) != 0))
  {
    v7[2](v7, 0, 2);
  }
  else
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke;
    v18[3] = &unk_1E5E44660;
    objc_copyWeak(&v21, &location);
    v9 = v7;
    id v20 = v9;
    id v10 = v6;
    id v19 = v10;
    v11 = (uint64_t (**)(void))MEMORY[0x1AD115160](v18);
    if (v11[2]())
    {
      internalQueue = self->_internalQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_2;
      v13[3] = &unk_1E5E44688;
      objc_copyWeak(&v17, &location);
      v15 = v9;
      v16 = v11;
      id v14 = v10;
      dispatch_async(internalQueue, v13);

      objc_destroyWeak(&v17);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

uint64_t __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained[5] objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (v4 || [v3[6] containsObject:*(void *)(a1 + 32)])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)imageForKeyString:(id)a3 getImageState:(int64_t *)a4
{
  p_cacheAccessLock = &self->_cacheAccessLock;
  id v7 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__22;
  id v19 = __Block_byref_object_dispose__22;
  id v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__WBSSiteMetadataImageCache_imageForKeyString_getImageState___block_invoke;
  v10[3] = &unk_1E5E44638;
  v10[4] = &v15;
  v10[5] = &v11;
  [(WBSSiteMetadataImageCache *)self _requestImageForKeyString:v7 completionHandler:v10];

  os_unfair_lock_unlock(p_cacheAccessLock);
  if (a4) {
    *a4 = v12[3];
  }
  id v8 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (void)_didLoadImage:(id)a3 forKeyString:(id)a4 fromDisk:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  BOOL v10 = [(WBSSiteMetadataImageCache *)self _internalDidLoadImageAndShouldNotify:v8 forKeyString:v9 fromDisk:v5];
  uint64_t v11 = [(NSMutableDictionary *)self->_keyStringRequestsToCompletionHandlers objectForKeyedSubscript:v9];
  [(NSMutableDictionary *)self->_keyStringRequestsToCompletionHandlers setObject:0 forKeyedSubscript:v9];
  os_unfair_lock_unlock(&self->_cacheAccessLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0uLL;
  long long v18 = 0uLL;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * i));
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(WeakRetained, "siteMetadataImageCache:didFinishLoadingImage:forKeyString:", self, v8, v9, (void)v17);
  }
}

void __61__WBSSiteMetadataImageCache_imageForKeyString_getImageState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (BOOL)_internalDidLoadImageAndShouldNotify:(id)a3 forKeyString:(id)a4 fromDisk:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(WBSSiteMetadataImageCache *)self _internalImageStateForKeyString:v9];
  int64_t v11 = v10;
  if (v5 && v10 == 2)
  {
    BOOL v12 = 0;
  }
  else
  {
    if (v8)
    {
      [(NSMutableDictionary *)self->_imagesForKeyStrings setObject:v8 forKeyedSubscript:v9];
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 1;
    }
    [(WBSSiteMetadataImageCache *)self _internalSetImageState:v13 forKeyString:v9];
    if (v8) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 == 0;
    }
    BOOL v12 = v14;
  }

  return v12;
}

- (void)_internalSetImageState:(int64_t)a3 forKeyString:(id)a4
{
  id v8 = a4;
  id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_imagesForKeyStrings, "objectForKeyedSubscript:");

  int64_t v7 = 2;
  if (!v6) {
    int64_t v7 = a3;
  }
  if (v7 == 1)
  {
    [(NSMutableSet *)self->_missingImageKeyStrings addObject:v8];
  }
  else if (v7 == 2)
  {
    [(NSMutableSet *)self->_missingImageKeyStrings removeObject:v8];
  }
}

- (int64_t)_internalImageStateForKeyString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_imagesForKeyStrings objectForKeyedSubscript:v4];

  if (v5) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = [(NSMutableSet *)self->_missingImageKeyStrings containsObject:v4];
  }

  return v6;
}

uint64_t __52__WBSSiteMetadataImageCache__dispatchDiskReadBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__WBSSiteMetadataImageCache_setUpImageCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalSetUpImageCache];
}

- (id).cxx_construct
{
  *((unsigned char *)self + 28) = 0;
  return self;
}

uint64_t __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_4(uint64_t result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(result + 32) + 28));
  if ((v1 & 1) == 0) {
    return [*(id *)(result + 32) _didLoadImage:*(void *)(result + 40) forKeyString:*(void *)(result + 48) fromDisk:1];
  }
  return result;
}

void __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 6);
    char v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    os_unfair_lock_unlock(v3 + 6);
    if (v4)
    {
      BOOL v5 = [*(id *)&v3[14]._os_unfair_lock_opaque objectForKeyedSubscript:*(void *)(a1 + 32)];
      if (v5)
      {
        if (*(void *)(a1 + 40))
        {
          int64_t v6 = (void *)MEMORY[0x1AD115160]();
          [v5 addObject:v6];
        }
      }
      else
      {
        BOOL v5 = [MEMORY[0x1E4F1CA48] array];
        [*(id *)&v3[14]._os_unfair_lock_opaque setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
        if (*(void *)(a1 + 40))
        {
          int64_t v7 = (void *)MEMORY[0x1AD115160]();
          [v5 addObject:v7];
        }
        if (*(void *)&v3[24]._os_unfair_lock_opaque)
        {
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_3;
          v8[3] = &unk_1E5E407D0;
          v8[4] = v3;
          id v9 = *(id *)(a1 + 32);
          [(os_unfair_lock_s *)v3 _dispatchDiskReadBlock:v8];
        }
        else
        {
          [(os_unfair_lock_s *)v3 _didLoadImage:0 forKeyString:*(void *)(a1 + 32) fromDisk:1];
        }
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_internalSetUpImageCache
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  keyStringRequestsToCompletionHandlers = self->_keyStringRequestsToCompletionHandlers;
  self->_keyStringRequestsToCompletionHandlers = v3;

  if (self->_imageDirectoryURL)
  {
    BOOL v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v6 = [(WBSSiteMetadataImageCache *)self _diskAccessQueueName];
    int64_t v7 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v6 UTF8String], v5);
    diskAccessQueue = self->_diskAccessQueue;
    self->_diskAccessQueue = v7;

    id v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    diskReadBlocks = self->_diskReadBlocks;
    self->_diskReadBlocks = v9;

    objc_initWeak(&location, self);
    id v11 = objc_alloc(MEMORY[0x1E4F982D0]);
    BOOL v12 = [(WBSSiteMetadataImageCache *)self _cacheSettingsFileURL];
    internalQueue = self->_internalQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke;
    v19[3] = &unk_1E5E439B8;
    objc_copyWeak(&v20, &location);
    BOOL v14 = (WBSCoalescedAsynchronousWriter *)[v11 initWithName:@"SiteMetadataImageCacheSetting" fileURL:v12 dataSourceQueue:internalQueue dataSourceBlock:v19];
    cacheSettingsWriter = self->_cacheSettingsWriter;
    self->_cacheSettingsWriter = v14;

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_22;
    v18[3] = &unk_1E5E408C0;
    void v18[4] = self;
    [(WBSSiteMetadataImageCache *)self _dispatchDiskReadBlock:v18];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    cacheSettings = self->_cacheSettings;
    self->_cacheSettings = v16;

    os_unfair_lock_unlock(&self->_cacheAccessLock);
    [(WBSSiteMetadataImageCache *)self _notifyDidFinishLoadingSettings];
  }
}

- (void)_dispatchDiskReadBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_imageDirectoryURL)
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_terminating);
    if ((v6 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__WBSSiteMetadataImageCache__dispatchDiskReadBlock___block_invoke;
      block[3] = &unk_1E5E41950;
      id v11 = v4;
      dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
      diskReadBlocks = self->_diskReadBlocks;
      id v9 = (void *)MEMORY[0x1AD115160]();
      [(NSHashTable *)diskReadBlocks addObject:v9];

      dispatch_async((dispatch_queue_t)self->_diskAccessQueue, v7);
    }
  }
}

- (id)_cacheSettingsFileURL
{
  return [(NSURL *)self->_imageDirectoryURL URLByAppendingPathComponent:@"CacheSettings.plist" isDirectory:0];
}

void __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_22(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  v3 = [*(id *)(a1 + 32) _cacheSettingsFileURL];
  id v4 = [v2 dataWithContentsOfURL:v3];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
    unsigned __int8 v6 = (void *)[v5 mutableCopy];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];

    unsigned __int8 v6 = (void *)v7;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_2;
  v11[3] = &unk_1E5E407D0;
  v11[4] = v8;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, v11);
}

- (id)_diskAccessQueueName
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  unsigned __int8 v6 = [v3 stringWithFormat:@"com.apple.Safari.%@.%p.diskAccessQueue", v5, self];

  return v6;
}

- (WBSSiteMetadataImageCache)initWithImageDirectoryURL:(id)a3 imageType:(int64_t)a4 fileProtectionOptions:(unint64_t)a5
{
  id v9 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WBSSiteMetadataImageCache;
  id v10 = [(WBSSiteMetadataImageCache *)&v28 init];
  if (v10)
  {
    objc_initWeak(&location, v10);
    id v11 = [(WBSSiteMetadataImageCache *)v10 _internalQueueName];
    id v12 = (const char *)[v11 UTF8String];
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v14;

    v10->_cacheAccessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_imageDirectoryURL, a3);
    v10->_imageType = a4;
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    imagesForKeyStrings = v10->_imagesForKeyStrings;
    v10->_imagesForKeyStrings = v16;

    long long v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    missingImageKeyStrings = v10->_missingImageKeyStrings;
    v10->_missingImageKeyStrings = v18;

    v10->_fileProtectionOptions = a5;
    id v20 = [WBSCacheRetainReleasePolicy alloc];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __87__WBSSiteMetadataImageCache_initWithImageDirectoryURL_imageType_fileProtectionOptions___block_invoke;
    v25[3] = &unk_1E5E445C8;
    objc_copyWeak(&v26, &location);
    uint64_t v21 = [(WBSCacheRetainReleasePolicy *)v20 initWithPurgeBlock:v25];
    cachePolicy = v10->_cachePolicy;
    v10->_cachePolicy = (WBSCacheRetainReleasePolicy *)v21;

    v23 = v10;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)_internalQueueName
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  unsigned __int8 v6 = [v3 stringWithFormat:@"com.apple.Safari.%@.%p.internalQueue", v5, self];

  return v6;
}

- (void)_notifyDidFinishLoadingSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained siteMetadataImageCacheDidFinishLoadingSettings:self];
  }
}

uint64_t __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  v2 = *(void **)(a1 + 32);
  return [v2 _notifyDidFinishLoadingSettings];
}

uint64_t __44__WBSSiteMetadataImageCache_removeAllImages__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalRemoveAllImages];
}

uint64_t __53__WBSSiteMetadataImageCache__dispatchDiskWriteBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = *(id **)(a1 + 40);
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v1)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v1);
    JUMPOUT(0x1AD114BD0);
  }
  return result;
}

void __54__WBSSiteMetadataImageCache__removeImagesPassingTest___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 enumeratorAtURL:*(void *)(a1[4] + 96) includingPropertiesForKeys:0 options:7 errorHandler:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "pathExtension", (void)v9);
        if (([v8 isEqualToString:a1[5]] & 1) != 0
          || ([v8 isEqualToString:a1[6]] & 1) != 0)
        {
          if ((*(unsigned int (**)(void))(a1[7] + 16))()) {
            objc_msgSend(v2, "safari_removeFileAtURL:error:", v7, 0);
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)removeAllImages
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WBSSiteMetadataImageCache_removeAllImages__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _fileLocationForKeyString:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42A80]);
    uint64_t v4 = [v2 path];
    uint64_t v5 = (void *)[v3 initWithContentsOfFile:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSSiteMetadataImageCache__requestImageForKeyString_completionHandler___block_invoke_4;
  block[3] = &unk_1E5E40820;
  void block[4] = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, block);
}

- (id)_fileLocationForKeyString:(id)a3
{
  id v4 = a3;
  if (self->_imageDirectoryURL)
  {
    uint64_t v5 = [(WBSSiteMetadataImageCache *)self _fileNameForKeyString:v4];
    if (v5)
    {
      uint64_t v6 = [(NSURL *)self->_imageDirectoryURL URLByAppendingPathComponent:v5 isDirectory:0];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_fileNameForKeyString:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    long long v9 = objc_msgSend(v4, "safari_md5Hash");
    uint64_t v6 = 0;
    int v8 = 1;
    goto LABEL_9;
  }
  uint64_t v6 = [WeakRetained siteMetadataImageCache:self customFileNameForKeyString:v4];
  if (!v6)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 141558275;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2117;
      id v17 = v4;
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_DEFAULT, "File for icon not saved in TouchIconCacheSettings.db; keyString=%{sensitive, mask.hash}@",
        (uint8_t *)&v14,
        0x16u);
    }
    goto LABEL_8;
  }
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 141558787;
    uint64_t v15 = 1752392040;
    __int16 v16 = 2117;
    id v17 = v4;
    __int16 v18 = 2160;
    uint64_t v19 = 1752392040;
    __int16 v20 = 2117;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_DEFAULT, "File for icon saved in TouchIconCacheSettings.db; keyString=%{sensitive, mask.hash}@; fileName=%{sensitive, mask.hash}@",
      (uint8_t *)&v14,
      0x2Au);
  }
  int v8 = 0;
  long long v9 = v6;
LABEL_9:
  if (self->_imageType) {
    id v11 = @"jpeg";
  }
  else {
    id v11 = @"png";
  }
  long long v12 = [v9 stringByAppendingPathExtension:v11];
  if (v8) {

  }
  return v12;
}

- (void)setUpImageCache
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WBSSiteMetadataImageCache_setUpImageCache__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)setDelegate:(id)a3
{
}

- (WBSSiteMetadataImageCache)initWithImageDirectoryURL:(id)a3 imageType:(int64_t)a4
{
  return [(WBSSiteMetadataImageCache *)self initWithImageDirectoryURL:a3 imageType:a4 fileProtectionOptions:0];
}

- (void)_internalRemoveAllImages
{
  p_cacheAccessLock = &self->_cacheAccessLock;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  missingImageKeyStrings = self->_missingImageKeyStrings;
  uint64_t v5 = [(NSMutableDictionary *)self->_imagesForKeyStrings allKeys];
  [(NSMutableSet *)missingImageKeyStrings addObjectsFromArray:v5];

  [(NSMutableDictionary *)self->_imagesForKeyStrings removeAllObjects];
  os_unfair_lock_unlock(p_cacheAccessLock);
  [(WBSSiteMetadataImageCache *)self _removeImagesPassingTest:&__block_literal_global_41];
}

- (void)_removeImagesPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_imageDirectoryURL)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__WBSSiteMetadataImageCache__removeImagesPassingTest___block_invoke;
    v6[3] = &unk_1E5E40FA0;
    v6[4] = self;
    uint64_t v7 = @"png";
    int v8 = @"jpeg";
    id v9 = v4;
    [(WBSSiteMetadataImageCache *)self _dispatchDiskWriteBlock:v6];
  }
}

- (void)_dispatchDiskWriteBlock:(id)a3
{
  id v4 = a3;
  if (self->_imageDirectoryURL)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_terminating);
    if ((v5 & 1) == 0) {
      operator new();
    }
  }
}

- (WBSSiteMetadataImageCache)init
{
  return [(WBSSiteMetadataImageCache *)self initWithImageDirectoryURL:0 imageType:0];
}

void __87__WBSSiteMetadataImageCache_initWithImageDirectoryURL_imageType_fileProtectionOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _internalReleaseImageForKeyString:v3];
}

- (BOOL)isTerminating
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_terminating);
  return v2 & 1;
}

id __53__WBSSiteMetadataImageCache__internalSetUpImageCache__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
  unsigned __int8 v2 = (void *)[*((id *)WeakRetained + 9) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
  id v8 = 0;
  id v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:&v8];
  id v4 = v8;
  if (!v3)
  {
    unsigned __int8 v5 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(v4, "safari_privacyPreservingDescription");
      __27__WBSOnDiskDataCache_setUp__block_invoke_2_cold_1((uint64_t)v2, v6, buf, v5);
    }
  }
  return v3;
}

- (void)purgeUnneededImages
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSSiteMetadataImageCache_purgeUnneededImages__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __48__WBSSiteMetadataImageCache_purgeUnneededImages__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalPurgeUnneededImages];
}

- (void)_internalPurgeUnneededImages
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_cacheAccessLock = &self->_cacheAccessLock;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  unsigned __int8 v5 = [(NSMutableDictionary *)self->_imagesForKeyStrings allKeys];
  uint64_t v6 = [v4 setWithArray:v5];

  uint64_t v7 = [(WBSCacheRetainReleasePolicy *)self->_cachePolicy retainedKeyStrings];
  [v6 minusSet:v7];

  imagesForKeyStrings = self->_imagesForKeyStrings;
  id v9 = [v6 allObjects];
  [(NSMutableDictionary *)imagesForKeyStrings removeObjectsForKeys:v9];

  missingImageKeyStrings = self->_missingImageKeyStrings;
  id v11 = [v6 allObjects];
  [(NSMutableSet *)missingImageKeyStrings addObjectsFromArray:v11];

  long long v12 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [(WBSCacheRetainReleasePolicy *)self->_cachePolicy retainedKeyStrings];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        __int16 v18 = [(WBSSiteMetadataImageCache *)self _fileNameForKeyString:v17];
        [v12 addObject:v18];

        [(NSMutableSet *)self->_missingImageKeyStrings removeObject:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_cacheAccessLock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__WBSSiteMetadataImageCache__internalPurgeUnneededImages__block_invoke;
  v20[3] = &unk_1E5E445F0;
  id v19 = v12;
  id v21 = v19;
  [(WBSSiteMetadataImageCache *)self _removeImagesPassingTest:v20];
}

uint64_t __57__WBSSiteMetadataImageCache__internalPurgeUnneededImages__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  id v3 = [a2 lastPathComponent];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)savePendingChangesBeforeTermination
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSSiteMetadataImageCache_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
  if (self->_imageDirectoryURL)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = self->_diskReadBlocks;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (v8) {
            dispatch_block_cancel(v8);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v5);
    }

    dispatch_sync((dispatch_queue_t)self->_diskAccessQueue, &__block_literal_global_35);
  }
}

uint64_t __64__WBSSiteMetadataImageCache_savePendingChangesBeforeTermination__block_invoke(uint64_t result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(result + 32) + 28));
  if ((v1 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)(*(void *)(result + 32) + 28));
    return [*(id *)(*(void *)(result + 32) + 80) completePendingWriteSynchronously];
  }
  return result;
}

- (void)emptyCache
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WBSSiteMetadataImageCache_emptyCache__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __39__WBSSiteMetadataImageCache_emptyCache__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(*(void *)(a1 + 32) + 56) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_27_0];
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(a1 + 32) _emptyCacheDirectory];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained siteMetadataImageCacheDidEmptyCache:*(void *)(a1 + 32)];
  }
}

void __39__WBSSiteMetadataImageCache_emptyCache__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_emptyCacheDirectory
{
  if (self->_imageDirectoryURL)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke;
    v2[3] = &unk_1E5E408C0;
    v2[4] = self;
    [(WBSSiteMetadataImageCache *)self _dispatchDiskWriteBlock:v2];
  }
}

void __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke(uint64_t a1)
{
  v12[4] = *(id *)MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
  v12[0] = 0;
  char v4 = [v2 removeItemAtURL:v3 error:v12];
  id v5 = v12[0];
  uint64_t v6 = v5;
  if ((v4 & 1) == 0)
  {
    long long v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_2();
    }
    goto LABEL_9;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
  id v11 = v5;
  char v8 = [v2 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    long long v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_1();
    }
    uint64_t v6 = v9;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v6 = v9;
LABEL_10:
}

- (void)getImageForKeyString:(id)a3 completionHandler:(id)a4
{
  p_cacheAccessLock = &self->_cacheAccessLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  [(WBSSiteMetadataImageCache *)self _requestImageForKeyString:v8 completionHandler:v7];

  os_unfair_lock_unlock(p_cacheAccessLock);
}

- (void)saveImageToDisk:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    internalQueue = self->_internalQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__WBSSiteMetadataImageCache_saveImageToDisk_forKeyString_completionHandler___block_invoke;
    v12[3] = &unk_1E5E40FA0;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(internalQueue, v12);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __76__WBSSiteMetadataImageCache_saveImageToDisk_forKeyString_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalSaveImageToDisk:*(void *)(a1 + 40) forKeyString:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_internalSaveImageToDisk:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_terminating);
  if ((v11 & 1) == 0)
  {
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke;
      v12[3] = &unk_1E5E43A30;
      v12[4] = self;
      id v13 = v9;
      id v15 = v10;
      id v14 = v8;
      [(WBSSiteMetadataImageCache *)self _dispatchDiskWriteBlock:v12];

      goto LABEL_7;
    }
    [(WBSSiteMetadataImageCache *)self _didLoadImage:0 forKeyString:v9 fromDisk:0];
  }
  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_7:
}

void __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = [*(id *)(a1 + 32) _fileLocationForKeyString:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v4 = [v2 URLByDeletingLastPathComponent];
    id v27 = 0;
    char v5 = [v3 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v27];
    id v6 = v27;

    if ((v5 & 1) == 0)
    {
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_1();
      }

      uint64_t v11 = *(void *)(a1 + 56);
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
      }
      goto LABEL_22;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 104);
    if (v7 == 1)
    {
      uint64_t v8 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 48), 1.0);
    }
    else
    {
      if (v7)
      {
        uint64_t v12 = 0;
        goto LABEL_15;
      }
      uint64_t v8 = UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
    }
    uint64_t v12 = (void *)v8;
LABEL_15:
    id v13 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = [v12 length];
      *(_DWORD *)buf = 138412802;
      uint64_t v29 = v20;
      __int16 v30 = 2048;
      uint64_t v31 = v21;
      __int16 v32 = 2112;
      v33 = v2;
      _os_log_debug_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_DEBUG, "Saving image %@ <image data length = %zu> to location %@", buf, 0x20u);
    }

    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 88) | 1;
    id v26 = 0;
    char v15 = [v12 writeToURL:v2 options:v14 error:&v26];
    id v16 = v26;
    if ((v15 & 1) == 0)
    {
      uint64_t v17 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_cold_1();
      }
    }
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(NSObject **)(v18 + 16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_39;
    v22[3] = &unk_1E5E40FA0;
    v22[4] = v18;
    id v23 = *(id *)(a1 + 48);
    id v24 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 56);
    dispatch_async(v19, v22);

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
LABEL_23:
}

uint64_t __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_39(uint64_t a1)
{
  [*(id *)(a1 + 32) _didLoadImage:*(void *)(a1 + 40) forKeyString:*(void *)(a1 + 48) fromDisk:0];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setImage:(id)a3 forKeyString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__WBSSiteMetadataImageCache_setImage_forKeyString___block_invoke;
    block[3] = &unk_1E5E40820;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __51__WBSSiteMetadataImageCache_setImage_forKeyString___block_invoke(uint64_t result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(result + 32) + 28));
  if ((v1 & 1) == 0) {
    return [*(id *)(result + 32) _didLoadImage:*(void *)(result + 40) forKeyString:*(void *)(result + 48) fromDisk:0];
  }
  return result;
}

uint64_t __53__WBSSiteMetadataImageCache__internalRemoveAllImages__block_invoke()
{
  return 1;
}

- (int64_t)imageStateForKeyString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_cacheAccessLock = &self->_cacheAccessLock;
    os_unfair_lock_lock(&self->_cacheAccessLock);
    int64_t v6 = [(WBSSiteMetadataImageCache *)self _internalImageStateForKeyString:v4];
    os_unfair_lock_unlock(p_cacheAccessLock);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)setImageState:(int64_t)a3 forKeyString:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__WBSSiteMetadataImageCache_setImageState_forKeyString___block_invoke;
    block[3] = &unk_1E5E446D0;
    void block[4] = self;
    int64_t v10 = a3;
    id v9 = v6;
    dispatch_async(internalQueue, block);
  }
}

void __56__WBSSiteMetadataImageCache_setImageState_forKeyString___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(a1 + 32) _internalSetImageState:*(void *)(a1 + 48) forKeyString:*(void *)(a1 + 40)];
  unsigned __int8 v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock(v2);
}

- (void)retainImageWithKeyStringProvider:(id)a3
{
  p_cacheAccessLock = &self->_cacheAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  [(WBSCacheRetainReleasePolicy *)self->_cachePolicy retainEntryWithKeyStringProvider:v5];

  os_unfair_lock_unlock(p_cacheAccessLock);
}

- (void)retainImageForKeyString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    [(WBSCacheRetainReleasePolicy *)self->_cachePolicy retainEntryForKeyString:v4];
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }
}

- (void)retainImagesForKeyStrings:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    [(WBSCacheRetainReleasePolicy *)self->_cachePolicy retainEntriesForKeyStrings:v4];
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }
}

- (void)_internalReleaseImageForKeyString:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke;
  v6[3] = &unk_1E5E407D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned __int8 v2 = *(NSObject **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke_2;
  v3[3] = &unk_1E5E407D0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __63__WBSSiteMetadataImageCache__internalReleaseImageForKeyString___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 64) isEntryRetainedForKeyString:*(void *)(a1 + 40)];
  uint64_t v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (v2)
  {
    os_unfair_lock_unlock(v3 + 6);
  }
  else
  {
    v6[0] = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [(os_unfair_lock_s *)v3 _internalRemoveImagesFromCacheForKeyStrings:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    if (objc_opt_respondsToSelector()) {
      [WeakRetained siteMetadataImageCache:*(void *)(a1 + 32) didRemoveImageFromCacheForKeyString:*(void *)(a1 + 40)];
    }
  }
}

- (void)releaseImageWithKeyStringProvider:(id)a3
{
  p_cacheAccessLock = &self->_cacheAccessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheAccessLock);
  [(WBSCacheRetainReleasePolicy *)self->_cachePolicy releaseEntryWithKeyStringProvider:v5];

  os_unfair_lock_unlock(p_cacheAccessLock);
}

- (void)releaseImageForKeyString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    [(WBSCacheRetainReleasePolicy *)self->_cachePolicy releaseEntryForKeyString:v4];
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }
}

- (void)releaseImagesForKeyStrings:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_cacheAccessLock);
    [(WBSCacheRetainReleasePolicy *)self->_cachePolicy releaseEntriesForKeyStrings:v4];
    os_unfair_lock_unlock(&self->_cacheAccessLock);
  }
}

- (BOOL)isImageRetainedForKeyString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_cacheAccessLock = &self->_cacheAccessLock;
    os_unfair_lock_lock(&self->_cacheAccessLock);
    BOOL v6 = [(WBSCacheRetainReleasePolicy *)self->_cachePolicy isEntryRetainedForKeyString:v4];
    os_unfair_lock_unlock(p_cacheAccessLock);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)removeImagesFromCacheForKeyStrings:(id)a3
{
  id v4 = (void *)[a3 copy];
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__WBSSiteMetadataImageCache_removeImagesFromCacheForKeyStrings___block_invoke;
  v7[3] = &unk_1E5E407D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __64__WBSSiteMetadataImageCache_removeImagesFromCacheForKeyStrings___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(a1 + 32) _internalRemoveImagesFromCacheForKeyStrings:*(void *)(a1 + 40)];
  int v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock(v2);
}

- (void)_internalRemoveImagesFromCacheForKeyStrings:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_imagesForKeyStrings removeObjectsForKeys:v4];
  [(NSMutableSet *)self->_missingImageKeyStrings addObjectsFromArray:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __73__WBSSiteMetadataImageCache__internalRemoveImagesFromCacheForKeyStrings___block_invoke;
  v6[3] = &unk_1E5E407D0;
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  [(WBSSiteMetadataImageCache *)self _dispatchDiskWriteBlock:v6];
}

void __73__WBSSiteMetadataImageCache__internalRemoveImagesFromCacheForKeyStrings___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
        id v7 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", (void)v9);
        id v8 = [*(id *)(a1 + 40) _fileLocationForKeyString:v6];
        objc_msgSend(v7, "safari_removeFileAtURL:error:", v8, 0);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (id)settingForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_cacheAccessLock = &self->_cacheAccessLock;
    os_unfair_lock_lock(&self->_cacheAccessLock);
    uint64_t v6 = [(NSMutableDictionary *)self->_cacheSettings objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(p_cacheAccessLock);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__WBSSiteMetadataImageCache_setSetting_forKey___block_invoke;
    block[3] = &unk_1E5E40820;
    void block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_async(internalQueue, block);
  }
}

void __47__WBSSiteMetadataImageCache_setSetting_forKey___block_invoke(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 24));
  [*(id *)(a1[4] + 72) setObject:a1[6] forKeyedSubscript:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 24));
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 96))
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v2 + 28));
    if ((v3 & 1) == 0)
    {
      id v4 = *(void **)(a1[4] + 80);
      [v4 scheduleWrite];
    }
  }
}

- (NSURL)imageDirectoryURL
{
  return self->_imageDirectoryURL;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (WBSSiteMetadataImageCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSSiteMetadataImageCacheDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_cacheSettingsWriter, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_keyStringRequestsToCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_missingImageKeyStrings, 0);
  objc_storeStrong((id *)&self->_imagesForKeyStrings, 0);
  objc_storeStrong((id *)&self->_diskReadBlocks, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
}

void __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error \"%{public}@\" trying to create image cache folder.", v5);
}

void __49__WBSSiteMetadataImageCache__emptyCacheDirectory__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error \"%{public}@\" trying to delete image cache folder.", v5);
}

void __85__WBSSiteMetadataImageCache__internalSaveImageToDisk_forKeyString_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Saving image failed with error: %{public}@", v5);
}

@end