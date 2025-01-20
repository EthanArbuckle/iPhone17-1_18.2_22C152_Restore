@interface TIImageCacheClient
- (BOOL)imageExistsForKey:(id)a3 inGroup:(id)a4;
- (BOOL)lockOnRead;
- (CGImage)copyImageForKey:(id)a3 inGroup:(id)a4;
- (OS_dispatch_queue)storeImageQueue;
- (TIImageCacheClient)initWithLocalAccess:(BOOL)a3;
- (_img)_imgForItem:(SEL)a3;
- (id)_versionPath;
- (id)imagePath;
- (int)_cacheVersion;
- (unint64_t)cacheItemLimit;
- (unint64_t)imageCount;
- (void)_createConnectionIfNecessary;
- (void)_idleIfNecessary:(BOOL)a3;
- (void)_localStoreImageForKey:(id)a3 inGroup:(id)a4 withItem:(id)a5;
- (void)_remoteStoreImageForKey:(id)a3 inGroup:(id)a4 withItem:(id)a5;
- (void)_setCacheVersion:(int)a3;
- (void)dealloc;
- (void)idleAfter:(double)a3;
- (void)openAndMmap:(id)a3 withInfo:(_img *)a4;
- (void)purge;
- (void)purgeMemoryCache;
- (void)removeImagesInGroups:(id)a3 completion:(id)a4;
- (void)setCacheItemLimit:(unint64_t)a3;
- (void)setIdleWhenDone;
- (void)setLockOnRead:(BOOL)a3;
- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 item:(id)a5;
@end

@implementation TIImageCacheClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_storeImageQueue, 0);
  objc_storeStrong((id *)&self->_serialQueueRemoveImagesDefault, 0);
  objc_storeStrong((id *)&self->_serialQueueRemoveImagesBackground, 0);
  objc_storeStrong((id *)&self->_versionPath, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setLockOnRead:(BOOL)a3
{
  self->_lockOnRead = a3;
}

- (BOOL)lockOnRead
{
  return self->_lockOnRead;
}

- (void)_setCacheVersion:(int)a3
{
  id v6 = [NSNumber numberWithInt:*(void *)&a3];
  v4 = [v6 stringValue];
  v5 = [(TIImageCacheClient *)self _versionPath];
  [v4 writeToFile:v5 atomically:1 encoding:4 error:0];
}

- (int)_cacheVersion
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(TIImageCacheClient *)self _versionPath];
  int v5 = [v3 fileExistsAtPath:v4];

  if (!v5) {
    return -1;
  }
  id v6 = NSString;
  v7 = [(TIImageCacheClient *)self _versionPath];
  uint64_t v12 = 0;
  v8 = [v6 stringWithContentsOfFile:v7 encoding:4 error:&v12];
  uint64_t v9 = v12;

  if (v9) {
    int v10 = -1;
  }
  else {
    int v10 = [v8 intValue];
  }

  return v10;
}

- (id)_versionPath
{
  versionPath = self->_versionPath;
  if (!versionPath)
  {
    v4 = [(NSString *)self->_path stringByAppendingPathComponent:@"version"];
    int v5 = self->_versionPath;
    self->_versionPath = v4;

    versionPath = self->_versionPath;
  }

  return versionPath;
}

- (void)purgeMemoryCache
{
}

- (void)purge
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 removeItemAtPath:self->_path error:0];
}

- (unint64_t)imageCount
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(TIImageCacheClient *)self imagePath];
  int v5 = [v3 subpathsAtPath:v4];
  unint64_t v6 = [v5 count];

  return v6;
}

- (id)imagePath
{
  return self->_imagePath;
}

- (void)removeImagesInGroups:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (!self->_serialQueueRemoveImagesDefault)
    {
      v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      uint64_t v9 = (OS_dispatch_queue *)dispatch_queue_create("SerialQueueRemoveImagesDefault", v8);
      serialQueueRemoveImagesDefault = self->_serialQueueRemoveImagesDefault;
      self->_serialQueueRemoveImagesDefault = v9;
    }
    if (!self->_serialQueueRemoveImagesBackground)
    {
      v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      uint64_t v12 = (OS_dispatch_queue *)dispatch_queue_create("SerialQueueRemoveImagesBackground", v11);
      serialQueueRemoveImagesBackground = self->_serialQueueRemoveImagesBackground;
      self->_serialQueueRemoveImagesBackground = v12;
    }
    v14 = [(TIImageCacheClient *)self imagePath];
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    v16 = [v15 contentsOfDirectoryAtPath:v14 error:0];

    v17 = (void *)[v7 copy];
    v18 = self->_serialQueueRemoveImagesBackground;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke;
    v22[3] = &unk_1E555A4C8;
    id v23 = v6;
    id v24 = v16;
    id v25 = v14;
    v26 = self;
    id v27 = v17;
    id v19 = v17;
    id v20 = v14;
    id v21 = v16;
    TIDispatchAsync(v18, v22);
  }
}

void __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = *(void **)(a1 + 32);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_2;
  v41[3] = &unk_1E555A478;
  id v27 = v2;
  id v42 = v27;
  [v3 enumerateObjectsUsingBlock:v41];
  group = dispatch_group_create();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v4;
        int v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v6 = v27;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v34 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v12 = [v5 lastPathComponent];
              int v13 = [v12 hasPrefix:v11];

              if (v13)
              {
                if ([v5 isAbsolutePath])
                {
                  id v14 = v5;
                }
                else
                {
                  id v14 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v5];
                }
                id v15 = v14;
                unlink((const char *)[v15 fileSystemRepresentation]);
                v16 = [v5 lastPathComponent];
                v17 = objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v11, "length"));

                v18 = NSNumber;
                id v19 = v17;
                id v20 = objc_msgSend(v18, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v19, "UTF8String"), 0, 10));
                uint64_t v21 = *(void *)(a1 + 56);
                v22 = *(NSObject **)(v21 + 64);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_3;
                block[3] = &unk_1E555A4A0;
                block[4] = v21;
                id v32 = v20;
                id v23 = v20;
                dispatch_group_async(group, v22, block);
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v43 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v28);
  }

  id v24 = *(void **)(a1 + 64);
  if (v24) {
    dispatch_group_notify(group, *(dispatch_queue_t *)(*(void *)(a1 + 56) + 56), v24);
  }
}

void __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  int v5 = (char *)malloc_type_malloc(0x32uLL, 0x2E3B7F1EuLL);
  if (v5)
  {
    id v6 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, snprintf(v5, 0x32uLL, "%lu", objc_msgSend(v7, "hash")), 1, 1);
    [*(id *)(a1 + 32) addObject:v6];
    *a3 = 0;
  }
}

uint64_t __54__TIImageCacheClient_removeImagesInGroups_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_idleIfNecessary:(BOOL)a3
{
  if (self->_shouldIdleWhenDone)
  {
    if (self->_remoteQueryCount) {
      BOOL v4 = !a3;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4)
    {
      [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
      [(NSXPCConnection *)self->_connection invalidate];
      connection = self->_connection;
      self->_connection = 0;

      self->_shouldIdleWhenDone = 0;
      self->_remoteQueryCount = 0;
    }
  }
}

- (void)idleAfter:(double)a3
{
  requestQueue = self->_requestQueue;
  if (requestQueue)
  {
    self->_shouldIdleWhenDone = 1;
    if (a3 <= 0.0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __32__TIImageCacheClient_idleAfter___block_invoke_2;
      v7[3] = &unk_1E555A428;
      v7[4] = self;
      TIDispatchSync(requestQueue, v7);
    }
    else
    {
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      id v6 = self->_requestQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __32__TIImageCacheClient_idleAfter___block_invoke;
      block[3] = &unk_1E555A428;
      block[4] = self;
      dispatch_after(v5, v6, block);
    }
  }
}

uint64_t __32__TIImageCacheClient_idleAfter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _idleIfNecessary:1];
}

uint64_t __32__TIImageCacheClient_idleAfter___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _idleIfNecessary:1];
}

- (void)setIdleWhenDone
{
  requestQueue = self->_requestQueue;
  if (requestQueue)
  {
    self->_shouldIdleWhenDone = 1;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__TIImageCacheClient_setIdleWhenDone__block_invoke;
    v4[3] = &unk_1E555A428;
    v4[4] = self;
    TIDispatchAsync(requestQueue, v4);
  }
}

uint64_t __37__TIImageCacheClient_setIdleWhenDone__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _idleIfNecessary:0];
}

- (void)_createConnectionIfNecessary
{
  if (!self->_requestQueue)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    BOOL v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.TextInput.image-cache-request", v3);
    requestQueue = self->_requestQueue;
    self->_requestQueue = v4;
  }
  if (!self->_connection)
  {
    id v6 = self->_requestQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke;
    v7[3] = &unk_1E555A428;
    v7[4] = self;
    TIDispatchSync(v6, v7);
  }
}

void __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput.image-cache-server" options:4096];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  dispatch_time_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC54C20];
  [*(id *)(*(void *)(a1 + 32) + 88) setRemoteObjectInterface:v5];

  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_2;
  uint64_t v9 = &unk_1E555A450;
  objc_copyWeak(&v10, &location);
  [*(id *)(*(void *)(a1 + 32) + 88) setInvalidationHandler:&v6];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "_setQueue:", *(void *)(*(void *)(a1 + 32) + 80), v6, v7, v8, v9);
  [*(id *)(*(void *)(a1 + 32) + 88) resume];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[10];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_3;
    v4[3] = &unk_1E555A428;
    dispatch_time_t v5 = WeakRetained;
    TIDispatchAsync(v3, v4);
  }
}

uint64_t __50__TIImageCacheClient__createConnectionIfNecessary__block_invoke_3(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 28) = 0;
  return [*(id *)(a1 + 32) _idleIfNecessary:0];
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 item:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (self->_hasLocalAccess) {
      [(TIImageCacheClient *)self _localStoreImageForKey:v10 inGroup:v8 withItem:v9];
    }
    else {
      [(TIImageCacheClient *)self _remoteStoreImageForKey:v10 inGroup:v8 withItem:v9];
    }
  }
}

- (_img)_imgForItem:(SEL)a3
{
  id v20 = a4;
  *(void *)&retstr->var4 = 0;
  [v20 size];
  double v6 = v5;
  [v20 scale];
  retstr->var1 = vcvtpd_u64_f64(v6 * v7);
  [v20 size];
  double v9 = v8;
  [v20 scale];
  unint64_t v11 = vcvtpd_u64_f64(v9 * v10);
  retstr->var2 = v11;
  int v12 = [v20 format];
  retstr->var4 = v12;
  retstr->var3 = CGBitmapGetAlignedBytesPerRow();
  [v20 format];
  retstr->var0 = (*MEMORY[0x1E4F14B00] + CGBitmapGetAlignedBytesPerRow() * v11 + 47) & -*MEMORY[0x1E4F14B00];
  int v13 = (CGColor *)[v20 formatColor];
  if (v12 == 5)
  {
    id v14 = v13;
    if (v13)
    {
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v13);
      Components = CGColorGetComponents(v14);
      if (NumberOfComponents)
      {
        var5 = retstr->var5;
        do
        {
          double v18 = *Components++;
          *var5++ = (int)(v18 * 255.0);
          --NumberOfComponents;
        }
        while (NumberOfComponents);
      }
    }
  }

  return result;
}

- (void)_remoteStoreImageForKey:(id)a3 inGroup:(id)a4 withItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 scale];
  if (v11 == 0.0)
  {
    [v10 _callDataReleaseHandler];
  }
  else
  {
    [(TIImageCacheClient *)self _createConnectionIfNecessary];
    requestQueue = self->_requestQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__TIImageCacheClient__remoteStoreImageForKey_inGroup_withItem___block_invoke;
    v13[3] = &unk_1E555A400;
    v13[4] = self;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    TIDispatchSync(requestQueue, v13);
  }
}

uint64_t __63__TIImageCacheClient__remoteStoreImageForKey_inGroup_withItem___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) remoteObjectProxy];
  [v2 cacheItem:a1[5] key:a1[6] group:a1[7]];

  uint64_t v3 = (void *)a1[5];

  return [v3 _callDataReleaseHandler];
}

- (void)_localStoreImageForKey:(id)a3 inGroup:(id)a4 withItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 scale];
  if (v11 == 0.0) {
    goto LABEL_4;
  }
  int v12 = [(TIImageCacheClient *)self imagePath];

  if (!v12) {
    goto LABEL_4;
  }
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  [(TIImageCacheClient *)self _imgForItem:v10];
  int v13 = [v10 data];
  uint64_t v14 = [v13 length] + 48;

  if (v14)
  {
LABEL_4:
    [v10 _callDataReleaseHandler];
  }
  else
  {
    id v15 = [(TIImageCacheClient *)self storeImageQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__TIImageCacheClient__localStoreImageForKey_inGroup_withItem___block_invoke;
    v16[3] = &unk_1E555A3D8;
    v16[4] = self;
    id v17 = v10;
    long long v20 = v23;
    long long v21 = v24;
    uint64_t v22 = v25;
    id v18 = v8;
    id v19 = v9;
    TIDispatchAsync(v15, v16);
  }
}

void __62__TIImageCacheClient__localStoreImageForKey_inGroup_withItem___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) imagePath];
  id v3 = [v2 stringByAppendingPathComponent:@"tmp.XXXXXXXX"];
  BOOL v4 = (const char *)[v3 fileSystemRepresentation];

  if (!v4) {
    goto LABEL_21;
  }
  double v5 = strdup(v4);
  if (!v5) {
    goto LABEL_21;
  }
  double v6 = (std::__fs::filesystem::path *)v5;
  size_t v7 = *(void *)(a1 + 64);
  int v8 = mkstemp(v5);
  if (v8 < 0)
  {
    id v15 = TIImageCacheOSLogFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      long long v35 = NSString;
      long long v36 = __error();
      long long v37 = strerror(*v36);
      long long v38 = objc_msgSend(v35, "stringWithFormat:", @"%s Making temp file at '%s' failed: '%s' (%d)", "mkstemp_and_mmap", v6, v37, *__error());
      *(_DWORD *)buf = 138412290;
      v55 = v38;
      _os_log_debug_impl(&dword_18D240000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    goto LABEL_20;
  }
  int v9 = v8;
  if (fchmod(v8, 0x180u) < 0)
  {
    id v16 = TIImageCacheOSLogFacility();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
LABEL_18:

LABEL_19:
      close(v9);
      unlink((const char *)v6);
      goto LABEL_20;
    }
    id v17 = NSString;
    id v18 = __error();
    id v19 = strerror(*v18);
    long long v20 = objc_msgSend(v17, "stringWithFormat:", @"%s Setting '%s' mode failed: '%s' (%d)", "mkstemp_and_mmap", v6, v19, *__error());
    *(_DWORD *)buf = 138412290;
    v55 = v20;
LABEL_33:
    _os_log_debug_impl(&dword_18D240000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    goto LABEL_18;
  }
  if (ftruncate(v9, v7) < 0)
  {
    long long v21 = TIImageCacheOSLogFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      long long v39 = NSString;
      long long v40 = __error();
      v41 = strerror(*v40);
      id v42 = objc_msgSend(v39, "stringWithFormat:", @"%s Truncating '%s' to %lu failed: '%s' (%d)", "mkstemp_and_mmap", v6, v7, v41, *__error());
      *(_DWORD *)buf = 138412290;
      v55 = v42;
      _os_log_debug_impl(&dword_18D240000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    goto LABEL_19;
  }
  id v10 = mmap(0, v7, 3, 1, v9, 0);
  if (v10 == (_DWORD *)-1)
  {
    id v16 = TIImageCacheOSLogFacility();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    v43 = NSString;
    v44 = __error();
    uint64_t v45 = strerror(*v44);
    long long v20 = objc_msgSend(v43, "stringWithFormat:", @"%s Mapping '%s' failed: '%s' (%d)", "mkstemp_and_mmap", v6, v45, *__error());
    *(_DWORD *)buf = 138412290;
    v55 = v20;
    goto LABEL_33;
  }
  double v11 = v10;
  close(v9);
  if (!v11)
  {
LABEL_20:
    free(v6);
LABEL_21:
    [*(id *)(a1 + 40) _callDataReleaseHandler];
    goto LABEL_22;
  }
  *(void *)double v11 = 0x154494943;
  *(int32x4_t *)(v11 + 2) = vuzp1q_s32(*(int32x4_t *)(a1 + 64), *(int32x4_t *)(a1 + 80));
  *((unsigned char *)v11 + 28) = *(unsigned char *)(a1 + 96);
  *((unsigned char *)v11 + 29) = *(unsigned char *)(a1 + 97);
  *((unsigned char *)v11 + 30) = *(unsigned char *)(a1 + 98);
  *((unsigned char *)v11 + 31) = *(unsigned char *)(a1 + 99);
  *((unsigned char *)v11 + 32) = *(unsigned char *)(a1 + 100);
  int v12 = [*(id *)(a1 + 40) data];
  int v13 = [*(id *)(a1 + 40) data];
  objc_msgSend(v12, "getBytes:length:", v11 + 12, objc_msgSend(v13, "length"));

  uint64_t v14 = *(void *)(a1 + 80);
  unint64_t v22 = CGBitmapGetAlignedBytesPerRow() * v14;
  long long v23 = [*(id *)(a1 + 40) data];
  unint64_t v24 = [v23 length];

  if (v24 < v22)
  {
    uint64_t v25 = TIImageCacheOSLogFacility();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v46 = NSString;
      uint64_t v47 = *(void *)(a1 + 48);
      v48 = [*(id *)(a1 + 40) data];
      v49 = [v46 stringWithFormat:@"%s Item data length is shorter than declared: %@ (%lu, %lu)", "-[TIImageCacheClient _localStoreImageForKey:inGroup:withItem:]_block_invoke", v47, objc_msgSend(v48, "length"), v22];
      *(_DWORD *)buf = 138412290;
      v55 = v49;
      _os_log_debug_impl(&dword_18D240000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    free(v6);
    munmap(v11, *(void *)(a1 + 64));
    goto LABEL_21;
  }
  uLong v26 = crc32(0, 0, 0);
  id v27 = [*(id *)(a1 + 40) data];
  int v28 = crc32(v26, (const Bytef *)[v27 bytes], v22);

  v11[6] = v28;
  munmap(v11, *(void *)(a1 + 64));
  uint64_t v29 = TIImageNameForItem(*(void **)(a1 + 48), *(void **)(a1 + 56));
  id v30 = [v2 stringByAppendingPathComponent:v29];
  v31 = (const std::__fs::filesystem::path *)[v30 fileSystemRepresentation];
  rename(v6, v31, v32);
  if (v33 < 0)
  {
    long long v34 = TIImageCacheOSLogFacility();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v50 = NSString;
      v51 = __error();
      v52 = strerror(*v51);
      v53 = [v50 stringWithFormat:@"%s Rename '%s' to '%@' failed: '%s' (%d)", "-[TIImageCacheClient _localStoreImageForKey:inGroup:withItem:]_block_invoke", v6, v30, v52, *__error()];
      *(_DWORD *)buf = 138412290;
      v55 = v53;
      _os_log_debug_impl(&dword_18D240000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  free(v6);
  [*(id *)(a1 + 40) _callDataReleaseHandler];

LABEL_22:
}

- (OS_dispatch_queue)storeImageQueue
{
  storeImageQueue = self->_storeImageQueue;
  if (!storeImageQueue)
  {
    BOOL v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    double v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.TextInput.local-image-cache-request", v4);
    double v6 = self->_storeImageQueue;
    self->_storeImageQueue = v5;

    storeImageQueue = self->_storeImageQueue;
  }

  return storeImageQueue;
}

- (CGImage)copyImageForKey:(id)a3 inGroup:(id)a4
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TIImageCacheClient *)self imagePath];

  if (v8)
  {
    int v9 = TIImageNameForItem(v6, v7);
    id v10 = [(NSCache *)self->_cache objectForKey:v9];
    if (v10)
    {
      double v11 = CGImageRetain(v10);
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v34 = 0;
    *(_OWORD *)size = 0u;
    *(_OWORD *)bytesPerRow = 0u;
    int v12 = [(TIImageCacheClient *)self imagePath];
    int v13 = [v12 stringByAppendingPathComponent:v9];

    uint64_t v14 = [(TIImageCacheClient *)self openAndMmap:v13 withInfo:size];
    if (!v14)
    {
      double v11 = 0;
      goto LABEL_34;
    }
    id v15 = v14;
    if ([(TIImageCacheClient *)self lockOnRead]) {
      mlock(v15 - 48, size[0]);
    }
    size[0] -= 48;
    id v16 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    _DWORD *v16 = 48;
    id v17 = CGDataProviderCreateWithData(v16, v15, size[0], (CGDataProviderReleaseDataCallback)release_munmap);
    unsigned int v18 = v34;
    if (v34 < 3u)
    {
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
    }
    else
    {
      if (v34 - 3 >= 2)
      {
        if (v34 == 5)
        {
          double v11 = CGImageMaskCreate(size[1], bytesPerRow[0], 8uLL, 8uLL, bytesPerRow[1], v17, create_image_with_memory_decode, 0);
          if (!v11)
          {
            CGDataProviderRelease(v17);
            goto LABEL_34;
          }
          if (v34 == 5)
          {
            LOBYTE(v23) = BYTE1(v34);
            double v25 = (double)v23 / 255.0;
            LOBYTE(v24) = BYTE2(v34);
            double v26 = (double)v24 / 255.0;
            components[0] = v25;
            components[1] = v26;
            LOBYTE(v26) = BYTE4(v34);
            LOBYTE(v25) = BYTE3(v34);
            components[2] = (double)*(unint64_t *)&v25 / 255.0;
            components[3] = (double)*(unint64_t *)&v26 / 255.0;
            id v27 = CGColorSpaceCreateDeviceRGB();
            int v28 = CGColorCreate(v27, components);
            CGImageSetProperty();
            CGColorSpaceRelease(v27);
            CGColorRelease(v28);
          }
          CGDataProviderRelease(v17);
          goto LABEL_33;
        }
        long long v20 = 0;
LABEL_14:
        if (v18 > 5)
        {
          size_t v21 = 0;
        }
        else
        {
          if (v18 == 2)
          {
            size_t v21 = 5;
            goto LABEL_30;
          }
          size_t v21 = 8;
        }
        if (v18 > 5)
        {
          size_t v22 = 0;
          CGBitmapInfo v30 = 0;
          size_t v29 = bytesPerRow[1];
LABEL_32:
          double v11 = CGImageCreate(size[1], bytesPerRow[0], v21, v22, v29, v20, v30, v17, 0, 0, kCGRenderingIntentDefault);
          CGColorSpaceRelease(v20);
          CGDataProviderRelease(v17);
          if (v11) {
LABEL_33:
          }
            [(NSCache *)self->_cache setObject:v11 forKey:v9];
LABEL_34:

          goto LABEL_35;
        }
        if (((1 << v18) & 3) != 0)
        {
          size_t v22 = 32;
          goto LABEL_31;
        }
        if (((1 << v18) & 0xC) == 0)
        {
          size_t v22 = 8;
LABEL_31:
          size_t v29 = bytesPerRow[1];
          CGBitmapInfo v30 = dword_18D2C4028[v18];
          goto LABEL_32;
        }
LABEL_30:
        size_t v22 = 16;
        goto LABEL_31;
      }
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
    }
    long long v20 = DeviceRGB;
    unsigned int v18 = v34;
    goto LABEL_14;
  }
  double v11 = 0;
LABEL_36:

  return v11;
}

- (BOOL)imageExistsForKey:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TIImageCacheClient *)self imagePath];

  if (v8)
  {
    int v9 = TIImageNameForItem(v6, v7);
    id v10 = [(TIImageCacheClient *)self imagePath];
    double v11 = [v10 stringByAppendingPathComponent:v9];

    id v12 = v11;
    BOOL v13 = access((const char *)[v12 fileSystemRepresentation], 4) == 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)openAndMmap:(id)a3 withInfo:(_img *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (const char *)[a3 fileSystemRepresentation];
  BOOL hasLocalAccess = self->_hasLocalAccess;
  int v8 = open(v6, 256);
  if (v8 < 0) {
    return 0;
  }
  int v9 = v8;
  memset(&v36, 0, sizeof(v36));
  if (fstat(v8, &v36) < 0) {
    goto LABEL_14;
  }
  if (v36.st_nlink >= 2u)
  {
    id v10 = TIImageCacheOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      double v11 = [NSString stringWithFormat:@"%s Cannot open '%s', its been hard-linked", "open_and_mmap", v6];
      *(_DWORD *)buf = 138412290;
      long long v35 = v11;
LABEL_32:
      _os_log_debug_impl(&dword_18D240000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v12 = (unsigned int *)mmap(0, v36.st_size, 1, 1, v9, 0);
  if (v12 == (unsigned int *)-1)
  {
    id v10 = TIImageCacheOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      size_t v29 = NSString;
      CGBitmapInfo v30 = __error();
      v31 = strerror(*v30);
      double v11 = objc_msgSend(v29, "stringWithFormat:", @"%s Mapping '%s' failed: '%s' (%d)", "open_and_mmap", v6, v31, *__error());
      *(_DWORD *)buf = 138412290;
      long long v35 = v11;
      goto LABEL_32;
    }
LABEL_13:

LABEL_14:
    close(v9);
    return 0;
  }
  BOOL v13 = v12;
  close(v9);
  if (v13)
  {
    size_t st_size = v36.st_size;
    if (v36.st_size <= 0x2FuLL)
    {
      id v19 = TIImageCacheOSLogFacility();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_36;
      }
      long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s Mapping '%s' failed: file too short", "open_and_mmap_img", v6);
      v36.st_dev = 138412290;
      *(void *)&v36.st_mode = v20;
    }
    else if (*v13 == 1414089027)
    {
      if (v13[1] == 1)
      {
        a4->var0 = v13[2];
        uint64_t v15 = *(void *)(v13 + 3);
        *(void *)&long long v16 = v15;
        *((void *)&v16 + 1) = HIDWORD(v15);
        *(_OWORD *)&a4->var1 = v16;
        a4->var3 = v13[5];
        a4->var4 = *((unsigned char *)v13 + 28);
        a4->var5[0] = *((unsigned char *)v13 + 29);
        a4->var5[1] = *((unsigned char *)v13 + 30);
        a4->var5[2] = *((unsigned char *)v13 + 31);
        a4->var5[3] = *((unsigned char *)v13 + 32);
        uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
        uint64_t v22 = AlignedBytesPerRow;
        if (a4->var3 == AlignedBytesPerRow)
        {
          unint64_t v23 = (*MEMORY[0x1E4F14B00] + a4->var2 * AlignedBytesPerRow + 47) & -*MEMORY[0x1E4F14B00];
          if (a4->var0 == v23)
          {
            if (v23 != st_size) {
              goto LABEL_37;
            }
            unsigned int v24 = crc32(0, 0, 0);
            unint64_t var2 = a4->var2;
            uint64_t v26 = CGBitmapGetAlignedBytesPerRow();
            uInt v27 = v26 * var2;
            unint64_t v28 = v26 * var2 + 48;
            if (v28 <= st_size)
            {
              uLong v32 = v24;
              id v17 = v13 + 12;
              uLong v33 = crc32(v32, (const Bytef *)v13 + 48, v27);
              if (v13[6] == v33) {
                return v17;
              }
              id v19 = TIImageCacheOSLogFacility();
              if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_36;
              }
              long long v20 = [NSString stringWithFormat:@"%s CRC did not match for cached image at path: %s (%u, %u)", "open_and_mmap_img", v6, v33, v13[6]];
              v36.st_dev = 138412290;
              *(void *)&v36.st_mode = v20;
              goto LABEL_35;
            }
            id v19 = TIImageCacheOSLogFacility();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              long long v20 = [NSString stringWithFormat:@"%s Actual file size is shorter than declared for cached image at path: %s (%lu, %lu)", "open_and_mmap_img", v6, st_size, v28];
              v36.st_dev = 138412290;
              *(void *)&v36.st_mode = v20;
              goto LABEL_35;
            }
          }
          else
          {
            id v19 = TIImageCacheOSLogFacility();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s Mapping '%s' failed: wrong size %zu (expected %zu)", "read_img_header", v6, a4->var0, v23);
              v36.st_dev = 138412290;
              *(void *)&v36.st_mode = v20;
              goto LABEL_35;
            }
          }
        }
        else
        {
          id v19 = TIImageCacheOSLogFacility();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s Mapping '%s' failed: wrong bpr %zu (expected %zu)", "read_img_header", v6, a4->var3, v22);
            v36.st_dev = 138412290;
            *(void *)&v36.st_mode = v20;
            goto LABEL_35;
          }
        }
LABEL_36:

LABEL_37:
        munmap(v13, st_size);
        if (hasLocalAccess) {
          unlink(v6);
        }
        return 0;
      }
      id v19 = TIImageCacheOSLogFacility();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_36;
      }
      long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s Mapping '%s' failed: wrong version %d (expected %d)", "read_img_header", v6, v13[1], 1);
      v36.st_dev = 138412290;
      *(void *)&v36.st_mode = v20;
    }
    else
    {
      id v19 = TIImageCacheOSLogFacility();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_36;
      }
      long long v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s Mapping '%s' failed: wrong magic number %#08x (expected %#08x)", "read_img_header", v6, *v13, 1414089027);
      v36.st_dev = 138412290;
      *(void *)&v36.st_mode = v20;
    }
LABEL_35:
    _os_log_debug_impl(&dword_18D240000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v36, 0xCu);

    goto LABEL_36;
  }
  return 0;
}

- (void)setCacheItemLimit:(unint64_t)a3
{
}

- (unint64_t)cacheItemLimit
{
  return [(NSCache *)self->_cache countLimit];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TIImageCacheClient;
  [(TIImageCacheClient *)&v3 dealloc];
}

- (TIImageCacheClient)initWithLocalAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TIImageCacheClient;
  BOOL v4 = [(TIImageCacheClient *)&v16 init];
  if (v4)
  {
    uint64_t v5 = TIImageCachePath();
    path = v4->_path;
    v4->_path = (NSString *)v5;

    uint64_t v7 = TIImageCacheImagesPath();
    imagePath = v4->_imagePath;
    v4->_imagePath = (NSString *)v7;

    v4->_BOOL hasLocalAccess = v3;
    v4->_remoteQueryCount = 0;
    v4->_shouldIdleWhenDone = 0;
    int v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v4->_cache;
    v4->_cache = v9;

    [(NSCache *)v4->_cache setName:@"com.apple.TIImageCache"];
    [(NSCache *)v4->_cache setCountLimit:40];
    if (v4->_hasLocalAccess)
    {
      double v11 = [(NSString *)v4->_path stringByDeletingLastPathComponent];
      BOOL v12 = CheckSandboxAccess(v11);

      if (v12)
      {
        if (TIImageCacheVersion_onceToken != -1) {
          dispatch_once(&TIImageCacheVersion_onceToken, &__block_literal_global_22_12415);
        }
        uint64_t v13 = TIImageCacheVersion_buildVersion;
        if ([(TIImageCacheClient *)v4 _cacheVersion] != v13) {
          [(TIImageCacheClient *)v4 purge];
        }
        if (access([(NSString *)v4->_path fileSystemRepresentation], 4))
        {
          id v14 = [(TIImageCacheClient *)v4 imagePath];
          mkpath_np((const char *)[v14 fileSystemRepresentation], 0x1EDu);

          [(TIImageCacheClient *)v4 _setCacheVersion:v13];
        }
      }
    }
    if (v3) {
      v4->_BOOL hasLocalAccess = CheckSandboxAccess(v4->_imagePath);
    }
  }
  return v4;
}

@end