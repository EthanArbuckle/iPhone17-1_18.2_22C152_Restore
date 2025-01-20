@interface IMImageDiskCache
- (BOOL)_addImage:(id)a3 forKey:(id)a4 resizeIfTooBig:(BOOL)a5 manageProcessingState:(BOOL)a6 completion:(id)a7;
- (BOOL)_isProcessingKey:(id)a3 completion:(id)a4;
- (BOOL)_needsResizing:(CGImageSource *)a3 maxDimensionInPixels:(double)a4;
- (BOOL)_startProcessingForAddingKey:(id)a3 originalKey:(id)a4;
- (BOOL)_usesLessMemoryToConvertThenResizeImageSource:(CGImageSource *)a3 destinationDimensionInPixels:(double)a4;
- (BOOL)addImage:(id)a3 forKey:(id)a4;
- (BOOL)copyImageFromSourceUrl:(id)a3 sourceFileType:(id)a4 to:(id)a5 discardTransparency:(BOOL)a6 enforceSquare:(BOOL)a7 maxDimensionInPixels:(double)a8;
- (CGImageSource)_copyImageSourceByConvertingImage:(CGImageSource *)a3 toFileType:(id)a4 destinationUrl:(id)a5;
- (IMImageDiskCache)initWithBasePath:(id)a3;
- (IMImageDiskCache)initWithBasePath:(id)a3 maxImageDimensionInPixels:(double)a4;
- (NSMutableDictionary)completionHandlers;
- (NSMutableDictionary)pendingPerformWhenAvailableOnDiskBlocks;
- (NSMutableSet)proccessingKeys;
- (NSRecursiveLock)syncLock;
- (NSString)onDiskFileType;
- (OS_dispatch_queue)workQueue;
- (double)maxImageDimensionInPixels;
- (double)saveCompressionQuality;
- (id)_defaultImageSavingOptions;
- (id)_defaultImageSavingSourceOptions;
- (id)_onDiskFileExtension;
- (id)_resizeImageForKey:(id)a3 maxDimensionInPixels:(double)a4;
- (id)imageForKey:(id)a3;
- (id)imageUrlForKey:(id)a3;
- (id)pathForKey:(id)a3;
- (void)_addImageWithSourceUrl:(id)a3 forKey:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8;
- (void)_finishProcessingKey:(id)a3 success:(BOOL)a4;
- (void)_performWithSyncLock:(id)a3;
- (void)_startProcessingKey:(id)a3 completion:(id)a4;
- (void)addImageWithSourceUrl:(id)a3 forKey:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8;
- (void)addImageWithSourceUrl:(id)a3 forKey:(id)a4 enforceSquare:(BOOL)a5 maxDimensionInPixels:(double)a6 completion:(id)a7;
- (void)addImagesWithSourceUrl:(id)a3 forKeys:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 completion:(id)a7;
- (void)copyImageFromSourceUrl:(id)a3 to:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8;
- (void)performWhenURLAvailableForImageForKey:(id)a3 block:(id)a4;
@end

@implementation IMImageDiskCache

- (IMImageDiskCache)initWithBasePath:(id)a3 maxImageDimensionInPixels:(double)a4
{
  v24.receiver = self;
  v24.super_class = (Class)IMImageDiskCache;
  v5 = [(IMBaseDiskCache *)&v24 initWithBasePath:a3];
  if (v5)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = [v6 stringWithFormat:@"%@-worker", v8];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x1E4F91F80] fileType];
    uint64_t v13 = [v12 identifier];
    onDiskFileType = v5->_onDiskFileType;
    v5->_onDiskFileType = (NSString *)v13;

    v5->_saveCompressionQuality = 0.9;
    v5->_maxImageDimensionInPixels = a4;
    v15 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    syncLock = v5->_syncLock;
    v5->_syncLock = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    proccessingKeys = v5->_proccessingKeys;
    v5->_proccessingKeys = (NSMutableSet *)v17;

    uint64_t v19 = objc_opt_new();
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    pendingPerformWhenAvailableOnDiskBlocks = v5->_pendingPerformWhenAvailableOnDiskBlocks;
    v5->_pendingPerformWhenAvailableOnDiskBlocks = (NSMutableDictionary *)v21;
  }
  return v5;
}

- (IMImageDiskCache)initWithBasePath:(id)a3
{
  return [(IMImageDiskCache *)self initWithBasePath:a3 maxImageDimensionInPixels:1.79769313e308];
}

- (void)_addImageWithSourceUrl:(id)a3 forKey:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v19 = a3;
  id v14 = a4;
  v15 = (void (**)(id, uint64_t))a8;
  uint64_t v16 = [v14 length];
  if (v19 && v16)
  {
    if ([(IMBaseDiskCache *)self hasItemForKey:v14])
    {
      if (v15) {
        v15[2](v15, 1);
      }
    }
    else
    {
      uint64_t v17 = [(IMImageDiskCache *)self pathForKey:v14];
      v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17 isDirectory:0];
      [(IMImageDiskCache *)self copyImageFromSourceUrl:v19 to:v18 discardTransparency:v11 enforceSquare:v10 maxDimensionInPixels:v15 completion:a7];
    }
  }
  else if (v15)
  {
    v15[2](v15, 0);
  }
}

- (void)addImagesWithSourceUrl:(id)a3 forKeys:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 completion:(id)a7
{
  BOOL v27 = a6;
  BOOL v8 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke;
  aBlock[3] = &unk_1E6E20058;
  id v28 = v12;
  id v39 = v28;
  id v13 = a4;
  id v14 = _Block_copy(aBlock);
  v15 = [v13 objectsPassingTest:&__block_literal_global_12];

  uint64_t v16 = [MEMORY[0x1E4F91F08] imageCache];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v41 = v11;
    __int16 v42 = 2112;
    v43 = v15;
    __int16 v44 = 1024;
    BOOL v45 = v8;
    __int16 v46 = 1024;
    BOOL v47 = v27;
    _os_log_impl(&dword_1E3BC5000, v16, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: got store-image request (fileUrl=%@, keys=%@, discardTransparency=%d, enforceSquare=%d)", buf, 0x22u);
  }

  uint64_t v17 = (void *)[v15 mutableCopy];
  v18 = v17;
  if (v11 && [v17 count])
  {
    id v19 = [v18 anyObject];
    [v18 removeObject:v19];
    v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    objc_initWeak(&location, self);
    uint64_t v21 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v11;
      __int16 v42 = 2112;
      v43 = v19;
      _os_log_impl(&dword_1E3BC5000, v21, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: adding first item via addImage: (fileUrl = %@, key=%@)", buf, 0x16u);
    }

    double maxImageDimensionInPixels = self->_maxImageDimensionInPixels;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_15;
    v35[3] = &unk_1E6E205E8;
    v23 = v20;
    v36 = v23;
    [(IMImageDiskCache *)self addImageWithSourceUrl:v11 forKey:v19 discardTransparency:v8 enforceSquare:v27 maxDimensionInPixels:v35 completion:maxImageDimensionInPixels];
    objc_super v24 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_2_16;
    block[3] = &unk_1E6E20610;
    objc_copyWeak(&v34, &location);
    id v30 = v19;
    id v31 = v18;
    id v33 = v14;
    id v32 = v11;
    id v25 = v19;
    dispatch_group_notify(v23, v24, block);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    v26 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v11;
      __int16 v42 = 2112;
      v43 = v18;
      _os_log_impl(&dword_1E3BC5000, v26, OS_LOG_TYPE_ERROR, "[DiskCache] addImagesWithSourceUrl: invalid requests (fileUrl = %@, validKeys=%@), bailing.", buf, 0x16u);
    }

    (*((void (**)(void *, void))v14 + 2))(v14, 0);
  }
}

uint64_t __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

void __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_15(uint64_t a1)
{
}

void __96__IMImageDiskCache_addImagesWithSourceUrl_forKeys_discardTransparency_enforceSquare_completion___block_invoke_2_16(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = [WeakRetained imageUrlForKey:*(void *)(v1 + 32)];
  if (v3)
  {
    if ([*(id *)(v1 + 40) count])
    {
      unint64_t v4 = 0x1E4F91000uLL;
      v5 = [MEMORY[0x1E4F91F08] imageCache];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(void **)(v1 + 40);
        uint64_t v6 = *(void *)(v1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v6;
        __int16 v38 = 2112;
        id v39 = v3;
        __int16 v40 = 2112;
        id v41 = v7;
        _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: adding remaining items via NSFileManager copy: (fileUrl = %@, urlToCopy = %@, keys=%@)", buf, 0x20u);
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v27 = v1;
      id v8 = *(id *)(v1 + 40);
      uint64_t v30 = [v8 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v30)
      {
        uint64_t v29 = *(void *)v33;
        id v28 = v8;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v33 != v29) {
              objc_enumerationMutation(v8);
            }
            uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            id v11 = (void *)MEMORY[0x1E4F1CB10];
            id v12 = [WeakRetained pathForKey:v10];
            id v13 = [v11 fileURLWithPath:v12];

            id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v31 = 0;
            char v15 = [v14 copyItemAtURL:v3 toURL:v13 error:&v31];
            id v16 = v31;

            if ((v15 & 1) == 0)
            {
              uint64_t v17 = [*(id *)(v4 + 3848) imageCache];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                v18 = [v13 path];
                [v3 path];
                unint64_t v19 = v4;
                v20 = v3;
                v22 = id v21 = WeakRetained;
                *(_DWORD *)buf = 138413058;
                uint64_t v37 = v10;
                __int16 v38 = 2112;
                id v39 = v18;
                __int16 v40 = 2112;
                id v41 = v22;
                __int16 v42 = 2112;
                id v43 = v16;
                _os_log_impl(&dword_1E3BC5000, v17, OS_LOG_TYPE_DEFAULT, "[DiskCache] addImagesWithSourceUrl: copying remaining items failed (key = %@, urlToCopy = %@, destination = %@, error = %@)", buf, 0x2Au);

                id WeakRetained = v21;
                v3 = v20;
                unint64_t v4 = v19;
                id v8 = v28;
              }
            }
          }
          uint64_t v30 = [v8 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v30);
      }

      uint64_t v1 = v27;
    }
    v23 = *(void (**)(void))(*(void *)(v1 + 56) + 16);
  }
  else
  {
    objc_super v24 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(v1 + 32);
      v26 = *(void **)(v1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v25;
      __int16 v38 = 2112;
      id v39 = v26;
      _os_log_impl(&dword_1E3BC5000, v24, OS_LOG_TYPE_ERROR, "[DiskCache] addImagesWithSourceUrl: unable to add remaining items via NSFileManager copy.  First key's imageUrl is unavailable (firstKey=%@, remaining=%@)", buf, 0x16u);
    }

    v23 = *(void (**)(void))(*(void *)(v1 + 56) + 16);
  }
  v23();
}

- (void)addImageWithSourceUrl:(id)a3 forKey:(id)a4 enforceSquare:(BOOL)a5 maxDimensionInPixels:(double)a6 completion:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__IMImageDiskCache_addImageWithSourceUrl_forKey_enforceSquare_maxDimensionInPixels_completion___block_invoke;
  v14[3] = &unk_1E6E20058;
  id v15 = v12;
  id v13 = v12;
  [(IMImageDiskCache *)self addImageWithSourceUrl:a3 forKey:a4 discardTransparency:0 enforceSquare:v8 maxDimensionInPixels:v14 completion:a6];
}

uint64_t __95__IMImageDiskCache_addImageWithSourceUrl_forKey_enforceSquare_maxDimensionInPixels_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addImageWithSourceUrl:(id)a3 forKey:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (![(IMImageDiskCache *)self _isProcessingKey:v15 completion:v16])
  {
    objc_initWeak(&location, self);
    [(IMImageDiskCache *)self _startProcessingKey:v15 completion:v16];
    workQueue = self->_workQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke;
    v18[3] = &unk_1E6E20660;
    objc_copyWeak(v21, &location);
    id v19 = v14;
    id v20 = v15;
    BOOL v22 = a5;
    BOOL v23 = a6;
    v21[1] = *(id *)&a7;
    dispatch_async(workQueue, v18);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

void __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 65);
  double v8 = *(double *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke_2;
  v9[3] = &unk_1E6E20638;
  objc_copyWeak(&v11, v2);
  id v10 = *(id *)(a1 + 40);
  [WeakRetained _addImageWithSourceUrl:v4 forKey:v5 discardTransparency:v6 enforceSquare:v7 maxDimensionInPixels:v9 completion:v8];

  objc_destroyWeak(&v11);
}

void __115__IMImageDiskCache_addImageWithSourceUrl_forKey_discardTransparency_enforceSquare_maxDimensionInPixels_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v5 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v5);

    [v6 _finishProcessingKey:*(void *)(a1 + 32) success:a2];
    id WeakRetained = v6;
  }
}

- (void)copyImageFromSourceUrl:(id)a3 to:(id)a4 discardTransparency:(BOOL)a5 enforceSquare:(BOOL)a6 maxDimensionInPixels:(double)a7 completion:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v20 = a8;
  workQueue = self->_workQueue;
  id v15 = a4;
  id v16 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v17 = [(IMImageDiskCache *)self onDiskFileType];
  BOOL v18 = [(IMImageDiskCache *)self copyImageFromSourceUrl:v16 sourceFileType:v17 to:v15 discardTransparency:v10 enforceSquare:v9 maxDimensionInPixels:a7];

  id v19 = v20;
  if (v20)
  {
    (*((void (**)(id, BOOL))v20 + 2))(v20, v18);
    id v19 = v20;
  }
}

- (BOOL)copyImageFromSourceUrl:(id)a3 sourceFileType:(id)a4 to:(id)a5 discardTransparency:(BOOL)a6 enforceSquare:(BOOL)a7 maxDimensionInPixels:(double)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  CFURLRef v14 = (const __CFURL *)a3;
  id v15 = a4;
  CFURLRef v16 = (const __CFURL *)a5;
  uint64_t v17 = (void *)os_transaction_create();
  BOOL v18 = [MEMORY[0x1E4F91F08] imageCache];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    CFURLRef v91 = v14;
    __int16 v92 = 2112;
    *(void *)v93 = v16;
    *(_WORD *)&v93[8] = 1024;
    *(_DWORD *)&v93[10] = v10;
    __int16 v94 = 1024;
    BOOL v95 = v9;
    __int16 v96 = 2048;
    double v97 = a8;
    _os_log_impl(&dword_1E3BC5000, v18, OS_LOG_TYPE_DEFAULT, "saving image to disk in copyImageFromSourceUrl: (sourceUrl = %@, destinationUrl = %@, discardTransparency=%d, enforceSquare=%d, maxPixels=%.2f)", buf, 0x2Cu);
  }

  id v19 = (void *)MEMORY[0x1E4E78AF0]();
  uint64_t v20 = *MEMORY[0x1E4F2FF78];
  v88[0] = *MEMORY[0x1E4F2FF08];
  v88[1] = v20;
  v89[0] = MEMORY[0x1E4F1CC28];
  v89[1] = v15;
  CFDictionaryRef v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];
  id v21 = CGImageSourceCreateWithURL(v14, v85);
  BOOL v22 = v21;
  if (!v21 || !CGImageSourceGetCount(v21))
  {
    id v23 = v15;
    v26 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [(__CFURL *)v14 path];
      *(_DWORD *)buf = 134218498;
      CFURLRef v91 = v22;
      __int16 v92 = 1024;
      *(_DWORD *)v93 = 0;
      *(_WORD *)&v93[4] = 2112;
      *(void *)&v93[6] = v27;
      _os_log_impl(&dword_1E3BC5000, v26, OS_LOG_TYPE_DEFAULT, "Could not create image source (source = %p, imageCount = %d) using sourceUrl: %@", buf, 0x1Cu);
    }
    if (!v22) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v23 = v15;
  [(IMImageDiskCache *)self onDiskFileType];
  v84 = v17;
  objc_super v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationRef v25 = CGImageDestinationCreateWithURL(v16, v24, 1uLL, 0);

  uint64_t v17 = v84;
  idst = v25;
  if (!v25)
  {
LABEL_11:
    CFRelease(v22);
LABEL_12:
    BOOL v28 = 0;
    uint64_t v29 = v23;
    CFURLRef v30 = v16;
    goto LABEL_51;
  }
  BOOL v81 = v9 && !CGImageSourceIsSquare(v22);
  uint64_t v29 = v23;
  id v31 = [(IMImageDiskCache *)self _defaultImageSavingOptions];
  v83 = (void *)[v31 mutableCopy];

  CFURLRef v30 = v16;
  if (v10)
  {
    id v32 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v33 = [v32 CGColor];
    [v83 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F2F408]];
  }
  if ([(IMImageDiskCache *)self _needsResizing:v22 maxDimensionInPixels:a8])
  {
    v78 = v19;
    if ([(IMImageDiskCache *)self _usesLessMemoryToConvertThenResizeImageSource:v22 destinationDimensionInPixels:a8])
    {
      BOOL options = v10;
      v77 = (void *)MEMORY[0x1E4F1CB10];
      long long v34 = NSTemporaryDirectory();
      long long v35 = [MEMORY[0x1E4F29128] UUID];
      v36 = [v35 UUIDString];
      uint64_t v37 = [v34 stringByAppendingPathComponent:v36];
      uint64_t v38 = [v77 fileURLWithPath:v37];

      id v39 = (void *)v38;
      __int16 v40 = [(IMImageDiskCache *)self onDiskFileType];
      id v41 = [(IMImageDiskCache *)self _copyImageSourceByConvertingImage:v22 toFileType:v40 destinationUrl:v38];

      if (v41)
      {
        __int16 v42 = [MEMORY[0x1E4F91F08] imageCache];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          CFURLRef v43 = [(__CFURL *)v14 path];
          __int16 v44 = [v39 path];
          *(_DWORD *)buf = 138412546;
          CFURLRef v91 = v43;
          __int16 v92 = 2112;
          *(void *)v93 = v44;
          _os_log_impl(&dword_1E3BC5000, v42, OS_LOG_TYPE_DEFAULT, "[ImageResize] performing 2-step save.  Performing format-only conversion (originalSourceUrl = %@, intermediateUrl = %@", buf, 0x16u);
        }
        CFRelease(v22);
        id v45 = v39;
        BOOL v22 = v41;
      }
      else
      {
        id v45 = 0;
      }
      BOOL v10 = options;
    }
    else
    {
      id v45 = 0;
    }
    uint64_t v59 = MEMORY[0x1E4F1CC38];
    uint64_t v60 = *MEMORY[0x1E4F2FE48];
    v86[0] = *MEMORY[0x1E4F2FF00];
    v86[1] = v60;
    v87[0] = MEMORY[0x1E4F1CC38];
    v87[1] = MEMORY[0x1E4F1CC38];
    uint64_t v61 = *MEMORY[0x1E4F2FE28];
    v87[2] = MEMORY[0x1E4F1CC38];
    uint64_t v62 = *MEMORY[0x1E4F2FF68];
    v86[2] = v61;
    v86[3] = v62;
    v63 = objc_msgSend(NSNumber, "numberWithDouble:", a8, v77);
    v86[4] = *MEMORY[0x1E4F2FF88];
    v87[3] = v63;
    v87[4] = v59;
    CFDictionaryRef optionsa = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:5];

    v64 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      CFURLRef v65 = [(__CFURL *)v14 path];
      v66 = [(__CFURL *)v30 path];
      *(_DWORD *)buf = 138413314;
      CFURLRef v91 = v65;
      __int16 v92 = 2112;
      *(void *)v93 = v66;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v10;
      __int16 v94 = 1024;
      BOOL v95 = v81;
      __int16 v96 = 2048;
      double v97 = a8;
      _os_log_impl(&dword_1E3BC5000, v64, OS_LOG_TYPE_DEFAULT, "[ImageResize] saving... (sourceUrl = %@, destinationUrl = %@, discardTransparency=%d, enforceSquare=%d, maxPixels=%.2f)", buf, 0x2Cu);
    }
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v22, 0, optionsa);
    if (v81)
    {
      v68 = (void *)MEMORY[0x1E4FB1818];
      v69 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v69 scale];
      v70 = objc_msgSend(v68, "imageWithCGImage:scale:orientation:", ThumbnailAtIndex, 0);

      if (v70)
      {
        id v71 = [v70 squareImage];
        v72 = (CGImage *)[v71 CGImage];

        CGImageDestinationAddImage(idst, v72, (CFDictionaryRef)v83);
      }

      v58 = idst;
    }
    else
    {
      v58 = idst;
      CGImageDestinationAddImage(idst, ThumbnailAtIndex, (CFDictionaryRef)v83);
    }
    id v19 = v78;
    if (ThumbnailAtIndex) {
      CFRelease(ThumbnailAtIndex);
    }
  }
  else
  {
    __int16 v46 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      CFURLRef v47 = [(__CFURL *)v14 path];
      [(__CFURL *)v16 path];
      v49 = uint64_t v48 = v19;
      *(_DWORD *)buf = 138413314;
      CFURLRef v91 = v47;
      __int16 v92 = 2112;
      *(void *)v93 = v49;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v10;
      __int16 v94 = 1024;
      BOOL v95 = v81;
      __int16 v96 = 2048;
      double v97 = a8;
      _os_log_impl(&dword_1E3BC5000, v46, OS_LOG_TYPE_DEFAULT, "[ImageResize] saving... (sourceUrl = %@, destinationUrl = %@, discardTransparency=%d, enforceSquare=%d, maxPixels=%.2f)", buf, 0x2Cu);

      id v19 = v48;
    }

    if (v81)
    {
      v50 = v19;
      v51 = (void *)MEMORY[0x1E4FB1818];
      v52 = [(__CFURL *)v14 path];
      v53 = [v51 imageWithContentsOfFile:v52];

      if (v53)
      {
        v54 = [MEMORY[0x1E4F91F08] imageCache];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          CFURLRef v55 = [(__CFURL *)v14 path];
          *(_DWORD *)buf = 138412290;
          CFURLRef v91 = v55;
          _os_log_impl(&dword_1E3BC5000, v54, OS_LOG_TYPE_DEFAULT, "Failed to load image from: %@", buf, 0xCu);
        }
        id v56 = [v53 squareImage];
        v57 = (CGImage *)[v56 CGImage];

        CGImageDestinationAddImage(idst, v57, (CFDictionaryRef)v83);
      }

      id v45 = 0;
      id v19 = v50;
      v58 = idst;
    }
    else
    {
      v58 = idst;
      CGImageDestinationAddImageFromSource(idst, v22, 0, (CFDictionaryRef)v83);
      id v45 = 0;
    }
  }
  BOOL v28 = CGImageDestinationFinalize(v58);
  if (!v28)
  {
    v73 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      CFURLRef v74 = [(__CFURL *)v30 path];
      *(_DWORD *)buf = 138412290;
      CFURLRef v91 = v74;
      _os_log_impl(&dword_1E3BC5000, v73, OS_LOG_TYPE_DEFAULT, "Failed to write image data to: %@", buf, 0xCu);

      v58 = idst;
    }
  }
  CFRelease(v58);
  CFRelease(v22);
  if (v45)
  {
    v75 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v75 removeItemAtURL:v45 error:0];
  }
  uint64_t v17 = v84;
LABEL_51:

  return v28;
}

- (CGImageSource)_copyImageSourceByConvertingImage:(CGImageSource *)a3 toFileType:(id)a4 destinationUrl:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v8 = (__CFString *)a4;
  CFURLRef v9 = (const __CFURL *)a5;
  if (!a3)
  {
    Type = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(Type, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1E3BC5000, Type, OS_LOG_TYPE_ERROR, "no source", (uint8_t *)&v18, 2u);
    }
    goto LABEL_10;
  }
  Type = CGImageSourceGetType(a3);
  id v11 = [(IMImageDiskCache *)self onDiskFileType];
  char v12 = [Type isEqualToString:v11];

  if (v12)
  {
LABEL_10:
    id v15 = 0;
    goto LABEL_11;
  }
  id v13 = CGImageDestinationCreateWithURL(v9, v8, 1uLL, 0);
  if (!v13)
  {
    CFURLRef v16 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      CFURLRef v19 = v9;
      _os_log_impl(&dword_1E3BC5000, v16, OS_LOG_TYPE_ERROR, "unable to save image to %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_10;
  }
  CFURLRef v14 = v13;
  CGImageDestinationAddImageFromSource(v13, a3, 0, 0);
  CGImageDestinationFinalize(v14);
  id v15 = CGImageSourceCreateWithURL(v9, (CFDictionaryRef)[(IMImageDiskCache *)self _defaultImageSavingSourceOptions]);
  CFRelease(v14);
LABEL_11:

  return v15;
}

- (id)_defaultImageSavingSourceOptions
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2FF08];
  v8[0] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F2FF78];
  v7[0] = v2;
  v7[1] = v3;
  uint64_t v4 = [(IMImageDiskCache *)self onDiskFileType];
  v7[2] = *MEMORY[0x1E4F2FF88];
  v8[1] = v4;
  v8[2] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)_defaultImageSavingOptions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F2F430];
  uint64_t v2 = NSNumber;
  [(IMImageDiskCache *)self saveCompressionQuality];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = *MEMORY[0x1E4F2F470];
  v9[0] = v3;
  v9[1] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = *MEMORY[0x1E4F2FF88];
  v8[1] = v4;
  v8[2] = v5;
  v9[2] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BOOL)_usesLessMemoryToConvertThenResizeImageSource:(CGImageSource *)a3 destinationDimensionInPixels:(double)a4
{
  uint64_t v4 = a3;
  if (a3)
  {
    Type = (__CFString *)CGImageSourceGetType(a3);
    double v8 = [(IMImageDiskCache *)self onDiskFileType];
    char v9 = [(__CFString *)Type isEqualToString:v8];

    if (v9)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      BOOL v10 = (double)(2 * CGImageSourcePixelSize(v4)) >= a4;
      LOBYTE(v4) = (double)(2 * v11) >= a4 && v10;
    }
  }
  return (char)v4;
}

- (BOOL)_needsResizing:(CGImageSource *)a3 maxDimensionInPixels:(double)a4
{
  BOOL v5 = (double)CGImageSourcePixelSize(a3) > a4;
  return (double)v6 > a4 || v5;
}

- (BOOL)addImage:(id)a3 forKey:(id)a4
{
  return [(IMImageDiskCache *)self _addImage:a3 forKey:a4 resizeIfTooBig:1 manageProcessingState:1 completion:0];
}

- (BOOL)_addImage:(id)a3 forKey:(id)a4 resizeIfTooBig:(BOOL)a5 manageProcessingState:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = (void *)os_transaction_create();
  id v16 = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke;
  aBlock[3] = &unk_1E6E20058;
  id v17 = v14;
  id v53 = v17;
  int v18 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v19 = [v16 length];
  if (v12 && v19)
  {
    id v41 = v15;
    uint64_t v20 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v12 size];
      id v21 = NSStringFromCGSize(v63);
      *(_DWORD *)buf = 138412546;
      id v55 = v21;
      __int16 v56 = 2112;
      id v57 = v16;
      _os_log_impl(&dword_1E3BC5000, v20, OS_LOG_TYPE_DEFAULT, "adding image (size = %@) to cache for with key %@", buf, 0x16u);
    }
    if (!v9
      || (([v12 scale],
           double v23 = v22,
           [v12 size],
           double maxImageDimensionInPixels = self->_maxImageDimensionInPixels,
           double v27 = v23 * v26,
           v23 * v24 <= maxImageDimensionInPixels)
        ? (BOOL v28 = v27 <= maxImageDimensionInPixels)
        : (BOOL v28 = 0),
          v28))
    {
      BOOL v31 = 0;
      uint64_t v29 = v16;
      if (!v8) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v29 = [v16 stringByAppendingString:@"-raw"];

      CFURLRef v30 = [MEMORY[0x1E4F91F08] imageCache];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v16;
        _os_log_impl(&dword_1E3BC5000, v30, OS_LOG_TYPE_DEFAULT, "image is too big, will resize (key=%@)", buf, 0xCu);
      }

      BOOL v31 = 1;
      if (!v8)
      {
LABEL_13:
        id v32 = &__block_literal_global_32;
        if (!v31) {
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    if (![(IMImageDiskCache *)self _startProcessingForAddingKey:v29 originalKey:v16])
    {
      v18[2](v18, 0);
      LOBYTE(v31) = 0;
      id v39 = &__block_literal_global_32;
      goto LABEL_24;
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_2;
    v51[3] = &unk_1E6E206A8;
    v51[4] = self;
    id v32 = _Block_copy(v51);
    if (!v31)
    {
LABEL_22:
      objc_initWeak((id *)buf, self);
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_33;
      block[3] = &unk_1E6E206F8;
      objc_copyWeak(&v49, (id *)buf);
      id v43 = v29;
      id v39 = v32;
      id v47 = v39;
      uint64_t v48 = v18;
      id v44 = v12;
      BOOL v50 = v31;
      id v45 = v16;
      id v46 = v41;
      dispatch_async(workQueue, block);

      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)buf);
LABEL_24:

      id v15 = v41;
      goto LABEL_25;
    }
LABEL_19:
    uint64_t v33 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      [v12 size];
      long long v35 = v34;
      [v12 size];
      double v36 = self->_maxImageDimensionInPixels;
      *(_DWORD *)buf = 138413058;
      id v55 = v29;
      __int16 v56 = 2048;
      id v57 = v35;
      __int16 v58 = 2048;
      uint64_t v59 = v37;
      __int16 v60 = 2048;
      double v61 = v36;
      _os_log_impl(&dword_1E3BC5000, v33, OS_LOG_TYPE_DEFAULT, "Image for key %@ is larger than max size so downscaling asynchronously ({%f,%f} > max size (px) of %f)", buf, 0x2Au);
    }

    goto LABEL_22;
  }
  v18[2](v18, 0);
  LOBYTE(v31) = 0;
  uint64_t v29 = v16;
LABEL_25:

  return v31;
}

uint64_t __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishProcessingKey:a2 success:a3];
}

void __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_33(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v4 = [WeakRetained pathForKey:*(void *)(a1 + 32)];
  CFURLRef v5 = [v3 fileURLWithPath:v4];

  uint64_t v6 = [WeakRetained onDiskFileType];
  uint64_t v7 = CGImageDestinationCreateWithURL(v5, v6, 1uLL, 0);

  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v21 = v5;
      _os_log_impl(&dword_1E3BC5000, v14, OS_LOG_TYPE_DEFAULT, "Unable to create CGImageDestinationWithURL for url %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v15 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_10;
  }
  CGImageDestinationAddImage(v7, (CGImageRef)[*(id *)(a1 + 40) CGImage], (CFDictionaryRef)objc_msgSend(WeakRetained, "_defaultImageSavingOptions"));
  BOOL v8 = [MEMORY[0x1E4F91F08] imageCache];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFURLRef v9 = [(__CFURL *)v5 path];
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    CFURLRef v21 = v9;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    _os_log_impl(&dword_1E3BC5000, v8, OS_LOG_TYPE_DEFAULT, "saving image to %@ for key %@", buf, 0x16u);
  }
  CGImageDestinationFinalize(v7);
  CFRelease(v7);
  if (!*(unsigned char *)(a1 + 88))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v15 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_10:
    v15();
    goto LABEL_11;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  [WeakRetained maxImageDimensionInPixels];
  id v12 = objc_msgSend(WeakRetained, "_resizeImageForKey:maxDimensionInPixels:", v11);
  uint64_t v13 = *(void *)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_34;
  v16[3] = &unk_1E6E206D0;
  id v18 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 72);
  [WeakRetained _addImage:v12 forKey:v13 resizeIfTooBig:0 manageProcessingState:0 completion:v16];
  [WeakRetained removeItemForKey:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

LABEL_11:
}

uint64_t __85__IMImageDiskCache__addImage_forKey_resizeIfTooBig_manageProcessingState_completion___block_invoke_34(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (BOOL)_startProcessingForAddingKey:(id)a3 originalKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 isEqualToString:v6];
  if ((v8 & 1) == 0)
  {
    if ([(IMImageDiskCache *)self _isProcessingKey:v7 completion:0])
    {
      CFURLRef v9 = [MEMORY[0x1E4F91F08] imageCache];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v7;
        uint64_t v10 = "Skipping adding image. originalKey '%@' is already being processed";
LABEL_11:
        _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ([(IMBaseDiskCache *)self hasItemForKey:v7])
    {
      CFURLRef v9 = [MEMORY[0x1E4F91F08] imageCache];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v7;
        uint64_t v10 = "Skipping adding image. An image for originalKey '%@' already exists on disk.";
        goto LABEL_11;
      }
LABEL_12:

LABEL_13:
      BOOL v11 = 0;
      goto LABEL_25;
    }
  }
  if ([(IMImageDiskCache *)self _isProcessingKey:v6 completion:0])
  {
    CFURLRef v9 = [MEMORY[0x1E4F91F08] imageCache];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      uint64_t v10 = "Skipping adding image. key '%@' is already being processed";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if ([(IMBaseDiskCache *)self hasItemForKey:v6])
  {
    id v12 = [MEMORY[0x1E4F91F08] imageCache];
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v13)
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_1E3BC5000, v12, OS_LOG_TYPE_DEFAULT, "Skipping adding image. An image for key '%@' already exists on disk.", (uint8_t *)&v17, 0xCu);
      }

      goto LABEL_13;
    }
    if (v13)
    {
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1E3BC5000, v12, OS_LOG_TYPE_DEFAULT, "Detected orphaned intermediate image with key '%@' for original '%@'.  Deleting and will continue processing…", (uint8_t *)&v17, 0x16u);
    }

    id v14 = [(IMImageDiskCache *)self pathForKey:v6];
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 removeItemAtPath:v14 error:0];
  }
  if (([v7 isEqualToString:v6] & 1) == 0) {
    [(IMImageDiskCache *)self _startProcessingKey:v7 completion:0];
  }
  [(IMImageDiskCache *)self _startProcessingKey:v6 completion:0];
  BOOL v11 = 1;
LABEL_25:

  return v11;
}

- (id)imageUrlForKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    CFURLRef v5 = [(IMImageDiskCache *)self pathForKey:v4];
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v8 = [(IMImageDiskCache *)self _isProcessingKey:v4 completion:0];

    id v9 = 0;
    if (!v8)
    {
      if ([v7 fileExistsAtPath:v5]) {
        id v9 = v6;
      }
      else {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)imageForKey:(id)a3
{
  CFURLRef v4 = [(IMImageDiskCache *)self imageUrlForKey:a3];
  if (v4)
  {
    CFDictionaryRef v5 = [(IMImageDiskCache *)self _defaultImageSavingSourceOptions];
    id v6 = CGImageSourceCreateWithURL(v4, v5);
    if (v6)
    {
      id v7 = v6;
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, v5);
      if (ImageAtIndex)
      {
        CGImageRef v9 = ImageAtIndex;
        uint64_t v10 = [MEMORY[0x1E4FB1818] imageWithCGImage:ImageAtIndex];
        CFRelease(v9);
      }
      else
      {
        uint64_t v10 = 0;
      }
      CFRelease(v7);
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

- (id)pathForKey:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = [(IMImageDiskCache *)self _onDiskFileExtension];
  id v6 = [v4 stringByAppendingPathExtension:v5];

  v9.receiver = self;
  v9.super_class = (Class)IMImageDiskCache;
  id v7 = [(IMBaseDiskCache *)&v9 pathForKey:v6];

  return v7;
}

- (id)_onDiskFileExtension
{
  return (id)[MEMORY[0x1E4F91F80] fileExtension];
}

- (void)_performWithSyncLock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(NSRecursiveLock *)self->_syncLock lock];
  v4[2]();
  [(NSRecursiveLock *)self->_syncLock unlock];
}

- (void)_startProcessingKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__IMImageDiskCache__startProcessingKey_completion___block_invoke;
  v10[3] = &unk_1E6E20720;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IMImageDiskCache *)self _performWithSyncLock:v10];
}

void __51__IMImageDiskCache__startProcessingKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) proccessingKeys];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) completionHandlers];
  id v10 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v10)
  {
    id v10 = (id)objc_opt_new();
    id v4 = [*(id *)(a1 + 32) completionHandlers];
    [v4 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  CFDictionaryRef v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    id v6 = _Block_copy(v5);
    [v10 addObject:v6];
  }
  id v7 = [*(id *)(a1 + 32) pendingPerformWhenAvailableOnDiskBlocks];
  id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v9 = [*(id *)(a1 + 32) pendingPerformWhenAvailableOnDiskBlocks];
  [v9 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

  if (v8) {
    [v10 addObjectsFromArray:v8];
  }
}

- (void)_finishProcessingKey:(id)a3 success:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__IMImageDiskCache__finishProcessingKey_success___block_invoke;
  void v8[3] = &unk_1E6E20748;
  void v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(IMImageDiskCache *)self _performWithSyncLock:v8];
}

void __49__IMImageDiskCache__finishProcessingKey_success___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) proccessingKeys];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) completionHandlers];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  BOOL v10 = objc_msgSend(*(id *)(a1 + 32), "completionHandlers", (void)v11);
  [v10 removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)_isProcessingKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__IMImageDiskCache__isProcessingKey_completion___block_invoke;
  v11[3] = &unk_1E6E20770;
  long long v14 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  [(IMImageDiskCache *)self _performWithSyncLock:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __48__IMImageDiskCache__isProcessingKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) proccessingKeys];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48) && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v3 = [*(id *)(a1 + 32) completionHandlers];
    id v5 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v5)
    {
      id v4 = _Block_copy(*(const void **)(a1 + 48));
      [v5 addObject:v4];
    }
  }
}

- (id)_resizeImageForKey:(id)a3 maxDimensionInPixels:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 length];
  if (a4 < 1.0 || v7 == 0)
  {
    id v9 = 0;
  }
  else
  {
    BOOL v10 = [(IMImageDiskCache *)self pathForKey:v6];
    CFURLRef v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v13 = [v12 fileExistsAtPath:v10];

    if (v13)
    {
      long long v14 = [MEMORY[0x1E4F91F08] imageCache];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v6;
        __int16 v29 = 2048;
        double v30 = a4;
        _os_log_impl(&dword_1E3BC5000, v14, OS_LOG_TYPE_DEFAULT, "[ImageResize] disk-based image resizing: (key = %@, maxDimensionInPixels = %.2f)", buf, 0x16u);
      }

      CFDictionaryRef v15 = [(IMImageDiskCache *)self _defaultImageSavingSourceOptions];
      id v9 = CGImageSourceCreateWithURL(v11, v15);
      if (v9)
      {
        uint64_t v16 = MEMORY[0x1E4F1CC38];
        uint64_t v17 = *MEMORY[0x1E4F2FE48];
        v25[0] = *MEMORY[0x1E4F2FF00];
        v25[1] = v17;
        v26[0] = MEMORY[0x1E4F1CC38];
        v26[1] = MEMORY[0x1E4F1CC38];
        uint64_t v18 = *MEMORY[0x1E4F2FE28];
        v26[2] = MEMORY[0x1E4F1CC38];
        __int16 v19 = objc_msgSend(NSNumber, "numberWithDouble:", a4, v25[0], v17, v18, *MEMORY[0x1E4F2FF68]);
        v25[4] = *MEMORY[0x1E4F2FF88];
        v26[3] = v19;
        v26[4] = v16;
        CFDictionaryRef v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];

        CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v9, 0, v20);
        CFRelease(v9);

        if (ThumbnailAtIndex)
        {
          __int16 v22 = (void *)MEMORY[0x1E4FB1818];
          uint64_t v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v23 scale];
          objc_msgSend(v22, "imageWithCGImage:scale:orientation:", ThumbnailAtIndex, 0);
          id v9 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

          CFRelease(ThumbnailAtIndex);
        }
        else
        {
          id v9 = 0;
        }
      }
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (void)performWhenURLAvailableForImageForKey:(id)a3 block:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    id v8 = [(IMImageDiskCache *)self imageUrlForKey:v6];

    if (v8)
    {
      v7[2](v7, 1);
    }
    else
    {
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      char v14 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke;
      v9[3] = &unk_1E6E20770;
      id v12 = v13;
      void v9[4] = self;
      id v10 = v6;
      CFURLRef v11 = v7;
      [(IMImageDiskCache *)self _performWithSyncLock:v9];

      _Block_object_dispose(v13, 8);
    }
  }
}

void __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke_2;
  v11[3] = &unk_1E6E20058;
  id v12 = *(id *)(a1 + 48);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 _isProcessingKey:v3 completion:v11];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v4 = [*(id *)(a1 + 32) pendingPerformWhenAvailableOnDiskBlocks];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA48] array];
    }
    id v8 = v7;

    id v9 = _Block_copy(*(const void **)(a1 + 48));
    [v8 addObject:v9];

    id v10 = [*(id *)(a1 + 32) pendingPerformWhenAvailableOnDiskBlocks];
    [v10 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

uint64_t __64__IMImageDiskCache_performWhenURLAvailableForImageForKey_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)onDiskFileType
{
  return self->_onDiskFileType;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (double)maxImageDimensionInPixels
{
  return self->_maxImageDimensionInPixels;
}

- (double)saveCompressionQuality
{
  return self->_saveCompressionQuality;
}

- (NSRecursiveLock)syncLock
{
  return self->_syncLock;
}

- (NSMutableSet)proccessingKeys
{
  return self->_proccessingKeys;
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (NSMutableDictionary)pendingPerformWhenAvailableOnDiskBlocks
{
  return self->_pendingPerformWhenAvailableOnDiskBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPerformWhenAvailableOnDiskBlocks, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_proccessingKeys, 0);
  objc_storeStrong((id *)&self->_syncLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_onDiskFileType, 0);
}

@end