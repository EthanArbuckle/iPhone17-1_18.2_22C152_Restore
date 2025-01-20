@interface QLUbiquitousItemFetcher
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeCanceled;
- (BOOL)isLongFetchOperation;
- (NSURL)fileURL;
- (QLUbiquitousItemFetcher)initWithCoder:(id)a3;
- (QLUbiquitousItemFetcher)initWithSandboxingURLWrapper:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4;
- (QLUbiquitousItemFetcher)initWithURL:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4;
- (QLUbiquitousItemFetcher)initWithZippingPackageIfNeeded:(BOOL)a3;
- (id)_createURLForPackageIfNeeded;
- (id)fetchedContent;
- (id)itemSize;
- (id)newItemProvider;
- (void)_deleteTempraryZipPackageFileIfNeeded;
- (void)_removeUpdateBlockIfNeeded:(id)a3;
- (void)cancelFetch;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)subscribeToPreviewItemProgress;
@end

@implementation QLUbiquitousItemFetcher

- (QLUbiquitousItemFetcher)initWithSandboxingURLWrapper:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = [(QLUbiquitousItemFetcher *)self initWithZippingPackageIfNeeded:v4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sandboxingWrapper, a3);
    v10 = v9;
  }

  return v9;
}

- (QLUbiquitousItemFetcher)initWithZippingPackageIfNeeded:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)QLUbiquitousItemFetcher;
  BOOL v4 = [(QLItemFetcher *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_shouldZipPackageIfNeeded = a3;
    uint64_t v6 = objc_opt_new();
    updateBlocks = v5->_updateBlocks;
    v5->_updateBlocks = (NSMutableArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (QLUbiquitousItemFetcher)initWithURL:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(QLUbiquitousItemFetcher *)self initWithZippingPackageIfNeeded:v4];
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F3A748];
    id v16 = 0;
    uint64_t v9 = [MEMORY[0x1E4F25D78] wrapperWithURL:v6 extensionClass:v8 error:&v16];
    id v10 = v16;
    sandboxingWrapper = v7->_sandboxingWrapper;
    v7->_sandboxingWrapper = (FPSandboxingURLWrapper *)v9;

    if (!v7->_sandboxingWrapper)
    {
      v12 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        v15 = (NSObject **)MEMORY[0x1E4F945F0];
        QLSInitLogging();
        v12 = *v15;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_ERROR, "QLUbiquitousItemFetcher: %@ could not create sandbox wrapper. Error: %@ #PreviewItem", buf, 0x16u);
      }
    }
    v13 = v7;
  }
  return v7;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    v14 = self->_updateBlocks;
    objc_sync_enter(v14);
    updateBlocks = self->_updateBlocks;
    id v16 = (void *)MEMORY[0x1E4E5A320](v12);
    [(NSMutableArray *)updateBlocks addObject:v16];

    objc_sync_exit(v14);
  }
  v17 = [(FPSandboxingURLWrapper *)self->_sandboxingWrapper url];
  self->_isAccessingURL = [v17 startAccessingSecurityScopedResource];

  v18 = (NSFileCoordinator *)objc_opt_new();
  fileCoordinator = self->_fileCoordinator;
  self->_fileCoordinator = v18;

  id v20 = [(QLUbiquitousItemFetcher *)self fileURL];
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x1E4F28C98] readingIntentWithURL:v20 options:0];
    v22 = self->_fileCoordinator;
    v38[0] = v21;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __100__QLUbiquitousItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
    v30 = &unk_1E6DD4040;
    v31 = self;
    id v35 = v12;
    id v32 = v20;
    id v36 = v13;
    id v33 = v21;
    id v34 = v10;
    id v24 = v21;
    [(NSFileCoordinator *)v22 coordinateAccessWithIntents:v23 queue:v11 byAccessor:&v27];

    if (v12) {
      [(QLUbiquitousItemFetcher *)self subscribeToPreviewItemProgress];
    }
  }
  else
  {
    v25 = (NSObject **)MEMORY[0x1E4F945F0];
    v26 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v26, OS_LOG_TYPE_FAULT, "URL cannot be nil when trying to fetch the contents of QLUbiquitousItemFetcher #PreviewItem", buf, 2u);
    }
    [(QLUbiquitousItemFetcher *)self _removeUpdateBlockIfNeeded:v12];
    id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.quicklook.QLUbiquitousItemFetcher" code:0 userInfo:0];
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v24);
  }
}

void __100__QLUbiquitousItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _removeUpdateBlockIfNeeded:*(void *)(a1 + 64)];
  if ([v3 code] == 3072)
  {
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = *(void *)(a1 + 40);
    id v16 = 0;
    char v6 = [v4 evictUbiquitousItemAtURL:v5 error:&v16];
    id v7 = v16;

    if ((v6 & 1) == 0)
    {
      uint64_t v8 = (NSObject **)MEMORY[0x1E4F945F0];
      uint64_t v9 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        uint64_t v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v3;
        _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_ERROR, "Failed to evict file for canceled download: %@ #Downloading", buf, 0xCu);
      }
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_17;
  }
  if (!v3)
  {
    id v7 = [*(id *)(a1 + 48) URL];
    if ([*(id *)(a1 + 56) containsObject:objc_opt_class()])
    {
      id v11 = *(unsigned char **)(a1 + 32);
      if (v11[72])
      {
        uint64_t v12 = [v11 _createURLForPackageIfNeeded];

        id v11 = *(unsigned char **)(a1 + 32);
        id v7 = (id)v12;
      }
      [v11 setFetchingState:1];
      id v10 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    }
    else
    {
      if ([*(id *)(a1 + 56) containsObject:objc_opt_class()])
      {
        uint64_t v13 = [*(id *)(a1 + 32) _createURLForPackageIfNeeded];

        [*(id *)(a1 + 32) setFetchingState:1];
        uint64_t v14 = *(void *)(a1 + 72);
        v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13];
        (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);

        id v7 = (id)v13;
LABEL_18:

        goto LABEL_19;
      }
      id v10 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    }
LABEL_17:
    v10();
    goto LABEL_18;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_19:
}

- (void)subscribeToPreviewItemProgress
{
  if (!self->_progressSubscriber)
  {
    id v3 = (void *)MEMORY[0x1E4F28F90];
    BOOL v4 = [(QLUbiquitousItemFetcher *)self fileURL];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke;
    v7[3] = &unk_1E6DD4068;
    v7[4] = self;
    uint64_t v5 = [v3 _addSubscriberForFileURL:v4 withPublishingHandler:v7];
    id progressSubscriber = self->_progressSubscriber;
    self->_id progressSubscriber = v5;
  }
}

id __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v3, "totalUnitCount"));
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  id v7 = *(id *)(*(void *)(a1 + 32) + 40);
  objc_sync_enter(v7);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
        [v3 fractionCompleted];
        uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
        (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
  [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted" options:1 context:0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke_2;
  v19[3] = &unk_1E6DD3AA0;
  uint64_t v15 = *(void *)(a1 + 32);
  id v20 = v3;
  uint64_t v21 = v15;
  id v16 = v3;
  v17 = (void *)MEMORY[0x1E4E5A320](v19);

  return v17;
}

uint64_t __57__QLUbiquitousItemFetcher_subscribeToPreviewItemProgress__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"fractionCompleted"];
}

- (BOOL)canBeCanceled
{
  return 1;
}

- (void)cancelFetch
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"fractionCompleted"])
  {
    [v11 fractionCompleted];
    double v14 = v13;
    obj = self->_updateBlocks;
    objc_sync_enter(obj);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v15 = self->_updateBlocks;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
    float v18 = v14;
    if (v16)
    {
      uint64_t v19 = *(void *)v30;
      do
      {
        uint64_t v20 = 0;
        do
        {
          id v21 = v11;
          id v22 = v12;
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * v20);
          *(float *)&double v17 = v18;
          long long v24 = [MEMORY[0x1E4F28ED0] numberWithFloat:v17];
          (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

          id v12 = v22;
          id v11 = v21;
          ++v20;
        }
        while (v16 != v20);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v16);
    }

    objc_sync_exit(obj);
    long long v25 = (NSObject **)MEMORY[0x1E4F945F0];
    v26 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v26 = *v25;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v34 = v18;
      _os_log_impl(&dword_1E2805000, v26, OS_LOG_TYPE_DEBUG, "Updated progress for downloading file: %f #Downloading", buf, 0xCu);
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)QLUbiquitousItemFetcher;
    [(QLUbiquitousItemFetcher *)&v28 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)dealloc
{
  [MEMORY[0x1E4F28F90] _removeSubscriber:self->_progressSubscriber];
  [(QLUbiquitousItemFetcher *)self _deleteTempraryZipPackageFileIfNeeded];
  if (self->_isAccessingURL)
  {
    id v3 = [(FPSandboxingURLWrapper *)self->_sandboxingWrapper url];
    [v3 stopAccessingSecurityScopedResource];
  }
  v4.receiver = self;
  v4.super_class = (Class)QLUbiquitousItemFetcher;
  [(QLUbiquitousItemFetcher *)&v4 dealloc];
}

- (BOOL)isLongFetchOperation
{
  id v3 = [(QLUbiquitousItemFetcher *)self fileURL];
  int v4 = [v3 startAccessingSecurityScopedResource];

  uint64_t v5 = [(QLUbiquitousItemFetcher *)self fileURL];
  char v6 = [v5 _QLDownloadingStatusIsNotCurrent];

  if (v4)
  {
    id v7 = [(QLUbiquitousItemFetcher *)self fileURL];
    [v7 stopAccessingSecurityScopedResource];
  }
  return v6;
}

- (id)itemSize
{
  sizeTotalUnitCount = self->_sizeTotalUnitCount;
  if (sizeTotalUnitCount)
  {
    id v3 = sizeTotalUnitCount;
  }
  else
  {
    uint64_t v5 = [(QLUbiquitousItemFetcher *)self fileURL];
    int v6 = [v5 startAccessingSecurityScopedResource];

    id v7 = [(QLUbiquitousItemFetcher *)self fileURL];
    id v3 = [v7 _QLUrlFileSize];

    if (v6)
    {
      id v8 = [(QLUbiquitousItemFetcher *)self fileURL];
      [v8 stopAccessingSecurityScopedResource];
    }
  }
  return v3;
}

- (id)fetchedContent
{
  id v3 = [(QLItemFetcher *)self fetchingState];
  if (v3)
  {
    id v3 = [(QLUbiquitousItemFetcher *)self fileURL];
  }
  return v3;
}

- (NSURL)fileURL
{
  return (NSURL *)[(FPSandboxingURLWrapper *)self->_sandboxingWrapper url];
}

- (id)newItemProvider
{
  id v3 = objc_opt_new();
  int v4 = [(QLUbiquitousItemFetcher *)self fileURL];
  uint64_t v5 = (void *)[v4 copy];

  int v6 = [MEMORY[0x1E4F3A700] UTIForURL:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__QLUbiquitousItemFetcher_newItemProvider__block_invoke;
  v9[3] = &unk_1E6DD4090;
  id v10 = v5;
  id v7 = v5;
  [v3 registerFileRepresentationForTypeIdentifier:v6 fileOptions:0 visibility:0 loadHandler:v9];

  return v3;
}

uint64_t __42__QLUbiquitousItemFetcher_newItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)_removeUpdateBlockIfNeeded:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = self->_updateBlocks;
    objc_sync_enter(v5);
    updateBlocks = self->_updateBlocks;
    id v7 = (void *)MEMORY[0x1E4E5A320](v8);
    [(NSMutableArray *)updateBlocks removeObject:v7];

    objc_sync_exit(v5);
    id v4 = v8;
  }
}

- (id)_createURLForPackageIfNeeded
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = [(QLUbiquitousItemFetcher *)self fileURL];
  char v4 = [v3 _QLIsPackageURL];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = [(QLUbiquitousItemFetcher *)self fileURL];
    goto LABEL_5;
  }
  zipPackageUrlHandler = self->_zipPackageUrlHandler;
  if (zipPackageUrlHandler)
  {
    uint64_t v6 = [(QLURLHandler *)zipPackageUrlHandler fileURL];
LABEL_5:
    id v7 = (void *)v6;
    goto LABEL_6;
  }
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];

  id v11 = (void *)MEMORY[0x1E4F1CB10];
  id v12 = NSString;
  double v13 = NSTemporaryDirectory();
  double v14 = [v12 stringWithFormat:@"%@%@", v13, v10];
  uint64_t v15 = [v11 fileURLWithPath:v14];

  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v38 = 0;
  char v17 = [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v38];
  id v18 = v38;
  if (v18) {
    char v17 = 0;
  }

  if (v17)
  {
    uint64_t v19 = [(QLUbiquitousItemFetcher *)self fileURL];
    uint64_t v20 = [v19 lastPathComponent];
    id v21 = [v15 URLByAppendingPathComponent:v20];

    *(void *)&long long v43 = 0;
    *((void *)&v43 + 1) = &v43;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    id v47 = 0;
    id v22 = objc_opt_new();
    uint64_t v23 = [(QLUbiquitousItemFetcher *)self fileURL];
    id v37 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __55__QLUbiquitousItemFetcher__createURLForPackageIfNeeded__block_invoke;
    v34[3] = &unk_1E6DD40B8;
    id v24 = v21;
    id v35 = v24;
    uint64_t v36 = &v43;
    [v22 coordinateReadingItemAtURL:v23 options:8 error:&v37 byAccessor:v34];
    id v25 = v37;

    if (v25)
    {
      v26 = (void **)MEMORY[0x1E4F945F0];
      uint64_t v27 = (void *)*MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        uint64_t v27 = *v26;
      }
      objc_super v28 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        long long v29 = [(QLUbiquitousItemFetcher *)self fileURL];
        *(_DWORD *)buf = 138412546;
        v40 = v29;
        __int16 v41 = 2112;
        id v42 = v25;
        _os_log_impl(&dword_1E2805000, v28, OS_LOG_TYPE_ERROR, "Could not do a coordinated read for directory at URL: %@ (%@). #PreviewItem", buf, 0x16u);
      }
    }
    else
    {
      id v32 = objc_alloc(MEMORY[0x1E4F3A6F8]);
      id v33 = (QLURLHandler *)[v32 initWithURL:*(void *)(*((void *)&v43 + 1) + 40) sandboxType:*MEMORY[0x1E4F3A748]];
      objc_super v28 = self->_zipPackageUrlHandler;
      self->_zipPackageUrlHandler = v33;
    }

    id v7 = [(QLURLHandler *)self->_zipPackageUrlHandler fileURL];

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    long long v30 = (NSObject **)MEMORY[0x1E4F945F0];
    long long v31 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      long long v31 = *v30;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v43) = 138412290;
      *(void *)((char *)&v43 + 4) = v18;
      _os_log_impl(&dword_1E2805000, v31, OS_LOG_TYPE_ERROR, "Could not create temporary folder for data item with error: %@ #PreviewItem", (uint8_t *)&v43, 0xCu);
    }
    id v7 = 0;
  }

LABEL_6:
  return v7;
}

void __55__QLUbiquitousItemFetcher__createURLForPackageIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = 0;
  [v4 copyItemAtURL:v3 toURL:v5 error:&v10];
  id v6 = v10;

  if (v6)
  {
    id v7 = (NSObject **)MEMORY[0x1E4F945F0];
    id v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_ERROR, "Could not copy zipped folder at URL (%@) to URL (%@). Error: %@ #PreviewItem", buf, 0x20u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
  }
}

- (void)_deleteTempraryZipPackageFileIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_zipPackageUrlHandler)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v4 = [(QLURLHandler *)self->_zipPackageUrlHandler fileURL];
    uint64_t v5 = [v4 path];
    int v6 = [v3 fileExistsAtPath:v5];

    if (v6)
    {
      id v7 = [(QLURLHandler *)self->_zipPackageUrlHandler fileURL];
      id v13 = 0;
      char v8 = [v3 removeItemAtURL:v7 error:&v13];
      id v9 = v13;

      if ((v8 & 1) == 0)
      {
        id v10 = (NSObject **)MEMORY[0x1E4F945F0];
        id v11 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          QLSInitLogging();
          id v11 = *v10;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v9;
          _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_ERROR, "Could not delete temporary zip file for folder URL with error: %@ #PreviewItem", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    else
    {
      id v9 = 0;
    }
    zipPackageUrlHandler = self->_zipPackageUrlHandler;
    self->_zipPackageUrlHandler = 0;

LABEL_10:
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLUbiquitousItemFetcher;
  id v4 = a3;
  [(QLItemFetcher *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sandboxingWrapper, @"sandboxingWrapper", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_zipPackageUrlHandler forKey:@"zipPackageUrlHandler"];
  [v4 encodeBool:self->_shouldZipPackageIfNeeded forKey:@"shouldZipPackageIfNeeded"];
}

- (QLUbiquitousItemFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLUbiquitousItemFetcher;
  objc_super v5 = [(QLItemFetcher *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    updateBlocks = v5->_updateBlocks;
    v5->_updateBlocks = (NSMutableArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxingWrapper"];
    sandboxingWrapper = v5->_sandboxingWrapper;
    v5->_sandboxingWrapper = (FPSandboxingURLWrapper *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zipPackageUrlHandler"];
    zipPackageUrlHandler = v5->_zipPackageUrlHandler;
    v5->_zipPackageUrlHandler = (QLURLHandler *)v10;

    v5->_shouldZipPackageIfNeeded = [v4 decodeBoolForKey:@"shouldZipPackageIfNeeded"];
    id v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zipPackageUrlHandler, 0);
  objc_storeStrong((id *)&self->_sizeTotalUnitCount, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_sandboxingWrapper, 0);
}

@end