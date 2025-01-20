@interface SBFFileCache
- (SBFFileCache)init;
- (SBFFileCache)initWithStore:(id)a3 faultHandler:(id)a4;
- (SBFFileCacheDelegate)delegate;
- (SBFFileCacheFaultHandler)faultHandler;
- (SBFFileCacheStore)store;
- (double)_queue_accessDateTimeAdjustment;
- (double)maxAllowedTimeSinceGeneration;
- (double)maxAllowedTimeSinceLastAccess;
- (id)callbackQueue;
- (id)description;
- (id)fileNameForIdentifier:(id)a3;
- (unint64_t)maxTotalFileCount;
- (unint64_t)maxTotalFileSize;
- (void)_queue_createManifestEntryForGeneratedFileWrapper:(id)a3 filename:(id)a4 usingStore:(id)a5;
- (void)_queue_evictFileWithInfo:(id)a3 usingStore:(id)a4;
- (void)_queue_evictFilesAtManifestIndexes:(id)a3 usingStore:(id)a4;
- (void)_queue_evictIfNeededUsingStore:(id)a3;
- (void)_queue_loadManifestUsingStore:(id)a3;
- (void)_queue_removeManifestEntryForFilename:(id)a3 usingStore:(id)a4;
- (void)_queue_resetManifestUsingStore:(id)a3;
- (void)_queue_saveManifestUsingStore:(id)a3;
- (void)_queue_updateManifestForLoadedFileWrapper:(id)a3 filename:(id)a4 usingStore:(id)a5;
- (void)loadFileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)performOnWorkQueueUsingBlock:(id)a3;
- (void)removeAllFiles;
- (void)removeFileWithIdentifier:(id)a3;
- (void)setAccessDateTimeAdjustment:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxAllowedTimeSinceGeneration:(double)a3;
- (void)setMaxAllowedTimeSinceLastAccess:(double)a3;
- (void)setMaxTotalFileCount:(unint64_t)a3;
- (void)setMaxTotalFileSize:(unint64_t)a3;
@end

@implementation SBFFileCache

- (SBFFileCache)initWithStore:(id)a3 faultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBFFileCache;
  v9 = [(SBFFileCache *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_faultHandler, a4);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)Serial;
  }
  return v10;
}

- (SBFFileCache)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't directly init this class" userInfo:0];
  objc_exception_throw(v2);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBFFileCache *)self store];
  id v5 = (id)[v3 appendObject:v4 withName:@"store"];

  v6 = [(SBFFileCache *)self faultHandler];
  id v7 = (id)[v3 appendObject:v6 withName:@"faultHandler"];

  id v8 = [(SBFFileCache *)self delegate];
  id v9 = (id)[v3 appendObject:v8 withName:@"delegate"];

  id v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[SBFFileCache maxTotalFileCount](self, "maxTotalFileCount"), @"maxTotalFileCount");
  id v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[SBFFileCache maxTotalFileSize](self, "maxTotalFileSize"), @"maxTotalFileSize");
  queue = self->_queue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __27__SBFFileCache_description__block_invoke;
  v19 = &unk_1E548CBA0;
  id v20 = v3;
  v21 = self;
  id v13 = v3;
  dispatch_sync(queue, &v16);
  objc_super v14 = objc_msgSend(v13, "build", v16, v17, v18, v19);

  return v14;
}

id __27__SBFFileCache_description__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"manifest"];
}

- (void)loadFileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E548D340;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBFFileCache *)self performOnWorkQueueUsingBlock:v10];
}

void __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) fileNameForIdentifier:*(void *)(a1 + 40)];
  id v8 = [v5 fileCache:*(void *)(a1 + 32) loadFileWrapperNamed:v7];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v8)
  {
    id v10 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_2;
    block[3] = &unk_1E548D2A0;
    id v19 = *(id *)(a1 + 48);
    id v11 = v8;
    id v18 = v11;
    dispatch_async(v10, block);

    objc_msgSend(*(id *)(a1 + 32), "_queue_updateManifestForLoadedFileWrapper:filename:usingStore:", v11, v7, v5);
    id v12 = v19;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_3;
    v14[3] = &unk_1E548D318;
    v14[4] = v9;
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v15 = v7;
    [v6 fileCache:v9 loadFileForIdentifier:v13 completionHandler:v14];

    id v12 = v16;
  }
}

uint64_t __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_4;
  v10[3] = &unk_1E548D2F0;
  v10[4] = v7;
  id v14 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  [v7 performOnWorkQueueUsingBlock:v10];
}

void __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_5;
  block[3] = &unk_1E548D2C8;
  id v9 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    [v5 setFilename:*(void *)(a1 + 56)];
    [v3 fileCache:*(void *)(a1 + 32) storeFileWrapper:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_createManifestEntryForGeneratedFileWrapper:filename:usingStore:", *(void *)(a1 + 40), *(void *)(a1 + 56), v3);
  }
}

uint64_t __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removeFileWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SBFFileCache_removeFileWithIdentifier___block_invoke;
  v6[3] = &unk_1E548D368;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBFFileCache *)self performOnWorkQueueUsingBlock:v6];
}

void __41__SBFFileCache_removeFileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 fileNameForIdentifier:v4];
  [v5 fileCache:*(void *)(a1 + 32) removeFileWrapperNamed:v6];
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeManifestEntryForFilename:usingStore:", v6, v5);
}

- (void)removeAllFiles
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __30__SBFFileCache_removeAllFiles__block_invoke;
  v2[3] = &unk_1E548D390;
  v2[4] = self;
  [(SBFFileCache *)self performOnWorkQueueUsingBlock:v2];
}

void __30__SBFFileCache_removeAllFiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 removeAllFileWrappersForFileCache:v3];
  objc_msgSend(*(id *)(a1 + 32), "_queue_resetManifestUsingStore:", v4);
}

- (id)fileNameForIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 fileCacheStableDataRepresentation];
  CC_SHA1((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:md length:20 freeWhenDone:0];
  id v5 = objc_msgSend(v4, "sbf_hexadecimalEncodedString");

  return v5;
}

- (void)performOnWorkQueueUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFFileCache *)self store];
  id v6 = [(SBFFileCache *)self faultHandler];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__SBFFileCache_performOnWorkQueueUsingBlock___block_invoke;
  v11[3] = &unk_1E548CB28;
  v11[4] = self;
  id v12 = v5;
  id v13 = v6;
  id v14 = v4;
  id v8 = v6;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(queue, v11);
}

uint64_t __45__SBFFileCache_performOnWorkQueueUsingBlock___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (!v2[2]) {
    objc_msgSend(v2, "_queue_loadManifestUsingStore:", a1[5]);
  }
  id v3 = *(uint64_t (**)(void))(a1[7] + 16);
  return v3();
}

- (id)callbackQueue
{
  return dispatch_get_global_queue(17, 0);
}

- (void)setAccessDateTimeAdjustment:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SBFFileCache_setAccessDateTimeAdjustment___block_invoke;
  v4[3] = &unk_1E548D3B8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __44__SBFFileCache_setAccessDateTimeAdjustment___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (void)_queue_loadManifestUsingStore:(id)a3
{
  id v19 = a3;
  id v4 = [v19 fileCache:self loadFileWrapperNamed:@"Manifest.plist"];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 regularFileContents];
    id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:0];
    id v8 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = v7;
      id v11 = [v10 objectForKey:@"version"];
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 integerValue] == 1)
      {
        id v12 = [v10 objectForKey:@"files"];
        id v13 = self;
        char v14 = objc_opt_isKindOfClass();

        if (v14)
        {
          id v15 = (NSMutableArray *)[v12 mutableCopy];
          manifest = self->_manifest;
          self->_manifest = v15;
        }
      }
    }
  }
  if (!self->_manifest)
  {
    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v18 = self->_manifest;
    self->_manifest = v17;

    [v19 removeAllFileWrappersForFileCache:self];
  }
}

- (void)_queue_saveManifestUsingStore:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28F98];
  manifest = self->_manifest;
  v11[0] = @"files";
  v11[1] = @"version";
  v12[0] = manifest;
  v12[1] = &unk_1ED89E5A8;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [v4 dataWithPropertyList:v8 format:200 options:0 error:0];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:v9];
  [v10 setFilename:@"Manifest.plist"];
  [v7 fileCache:self storeFileWrapper:v10];
}

- (void)_queue_createManifestEntryForGeneratedFileWrapper:(id)a3 filename:(id)a4 usingStore:(id)a5
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(SBFFileCache *)self _queue_accessDateTimeAdjustment];
  double v12 = v11;
  uint64_t v13 = objc_msgSend(v10, "sb_fileSize");

  char v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v12];
  v18[0] = v9;
  v17[0] = @"filename";
  v17[1] = @"size";
  id v15 = [NSNumber numberWithUnsignedInteger:v13];
  v18[1] = v15;
  v18[2] = v14;
  v17[2] = @"generated";
  v17[3] = @"accessed";
  v18[3] = v14;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  [(NSMutableArray *)self->_manifest insertObject:v16 atIndex:0];
  [(SBFFileCache *)self _queue_evictIfNeededUsingStore:v8];
  [(SBFFileCache *)self _queue_saveManifestUsingStore:v8];
}

- (void)_queue_updateManifestForLoadedFileWrapper:(id)a3 filename:(id)a4 usingStore:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(SBFFileCache *)self _queue_accessDateTimeAdjustment];
  id v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
  manifest = self->_manifest;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SBFFileCache__queue_updateManifestForLoadedFileWrapper_filename_usingStore___block_invoke;
  v17[3] = &unk_1E548D3E0;
  id v18 = v8;
  id v12 = v8;
  uint64_t v13 = [(NSMutableArray *)manifest indexOfObjectPassingTest:v17];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBFFileCache.m" lineNumber:222 description:@"Should not call this method for a newly-created file!"];
  }
  else
  {
    uint64_t v14 = v13;
    id v15 = [(NSMutableArray *)self->_manifest objectAtIndex:v13];
    id v16 = (void *)[v15 mutableCopy];

    [v16 setObject:v10 forKey:@"accessed"];
    [(NSMutableArray *)self->_manifest removeObjectAtIndex:v14];
    [(NSMutableArray *)self->_manifest insertObject:v16 atIndex:0];
    [(SBFFileCache *)self _queue_evictIfNeededUsingStore:v9];
    [(SBFFileCache *)self _queue_saveManifestUsingStore:v9];
  }
}

uint64_t __78__SBFFileCache__queue_updateManifestForLoadedFileWrapper_filename_usingStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"filename"];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_queue_removeManifestEntryForFilename:(id)a3 usingStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  manifest = self->_manifest;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __65__SBFFileCache__queue_removeManifestEntryForFilename_usingStore___block_invoke;
  v11[3] = &unk_1E548D3E0;
  id v9 = v6;
  id v12 = v9;
  uint64_t v10 = [(NSMutableArray *)manifest indexOfObjectPassingTest:v11];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_manifest removeObjectAtIndex:v10];
    [(SBFFileCache *)self _queue_evictIfNeededUsingStore:v7];
    [(SBFFileCache *)self _queue_saveManifestUsingStore:v7];
  }
}

uint64_t __65__SBFFileCache__queue_removeManifestEntryForFilename_usingStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"filename"];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_queue_evictIfNeededUsingStore:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  unint64_t v4 = [(SBFFileCache *)self maxTotalFileCount];
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = [(NSMutableArray *)self->_manifest count];
    if (v6 > v5)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v5, v6 - v5);
      [(SBFFileCache *)self _queue_evictFilesAtManifestIndexes:v7 usingStore:v29];
    }
  }
  unint64_t v8 = [(SBFFileCache *)self maxTotalFileSize];
  if (v8)
  {
    unint64_t v9 = v8;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v10 = self->_manifest;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v11)
    {
LABEL_14:

      goto LABEL_15;
    }
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v42 + 1) + 8 * i) objectForKey:@"size"];
        uint64_t v16 = [v15 unsignedIntegerValue];

        v12 += v16;
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v11);

    if (v12 > v9)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v41[3] = 0;
      manifest = self->_manifest;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke;
      v36[3] = &unk_1E548D408;
      uint64_t v10 = (NSMutableArray *)v17;
      v37 = v10;
      v38 = v41;
      unint64_t v39 = v12;
      unint64_t v40 = v9;
      [(NSMutableArray *)manifest enumerateObjectsWithOptions:2 usingBlock:v36];
      [(SBFFileCache *)self _queue_evictFilesAtManifestIndexes:v10 usingStore:v29];

      _Block_object_dispose(v41, 8);
      goto LABEL_14;
    }
  }
LABEL_15:
  [(SBFFileCache *)self maxAllowedTimeSinceLastAccess];
  double v20 = v19;
  if (v19 > 0.0)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v22 = self->_manifest;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_2;
    v33[3] = &unk_1E548D430;
    double v35 = v20;
    id v34 = v21;
    id v23 = v21;
    [(NSMutableArray *)v22 enumerateObjectsWithOptions:2 usingBlock:v33];
    [(SBFFileCache *)self _queue_evictFilesAtManifestIndexes:v23 usingStore:v29];
  }
  [(SBFFileCache *)self maxAllowedTimeSinceGeneration];
  double v25 = v24;
  if (v24 > 0.0)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v27 = self->_manifest;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_3;
    v30[3] = &unk_1E548D430;
    double v32 = v25;
    id v31 = v26;
    id v28 = v26;
    [(NSMutableArray *)v27 enumerateObjectsWithOptions:2 usingBlock:v30];
    [(SBFFileCache *)self _queue_evictFilesAtManifestIndexes:v28 usingStore:v29];
  }
}

void __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (void *)a1[4];
  id v8 = a2;
  [v7 addIndex:a3];
  id v9 = [v8 objectForKey:@"size"];

  *(void *)(*(void *)(a1[5] + 8) + 24) += [v9 unsignedIntegerValue];
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6] - a1[7]) {
    *a4 = 1;
  }
}

void __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = [a2 objectForKey:@"accessed"];
  if (v9 && ([v9 timeIntervalSinceNow], id v7 = v9, v8 >= -*(double *)(a1 + 40)))
  {
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) addIndex:a3];
    id v7 = v9;
  }
}

void __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = [a2 objectForKey:@"generated"];
  if (v9 && ([v9 timeIntervalSinceNow], id v7 = v9, v8 >= -*(double *)(a1 + 40)))
  {
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) addIndex:a3];
    id v7 = v9;
  }
}

- (void)_queue_evictFilesAtManifestIndexes:(id)a3 usingStore:(id)a4
{
  id v6 = a4;
  manifest = self->_manifest;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  unint64_t v12 = __62__SBFFileCache__queue_evictFilesAtManifestIndexes_usingStore___block_invoke;
  uint64_t v13 = &unk_1E548D458;
  uint64_t v14 = self;
  id v15 = v6;
  id v8 = v6;
  id v9 = a3;
  [(NSMutableArray *)manifest enumerateObjectsAtIndexes:v9 options:0 usingBlock:&v10];
  -[NSMutableArray removeObjectsAtIndexes:](self->_manifest, "removeObjectsAtIndexes:", v9, v10, v11, v12, v13, v14);
}

uint64_t __62__SBFFileCache__queue_evictFilesAtManifestIndexes_usingStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_evictFileWithInfo:usingStore:", a2, *(void *)(a1 + 40));
}

- (void)_queue_evictFileWithInfo:(id)a3 usingStore:(id)a4
{
  id v6 = a4;
  id v8 = [a3 objectForKey:@"filename"];
  [v6 fileCache:self removeFileWrapperNamed:v8];

  id v7 = [(SBFFileCache *)self delegate];
  [v7 fileCacheDidEvictFile:self];
}

- (void)_queue_resetManifestUsingStore:(id)a3
{
  manifest = self->_manifest;
  id v5 = a3;
  [(NSMutableArray *)manifest removeAllObjects];
  [(SBFFileCache *)self _queue_saveManifestUsingStore:v5];
}

- (double)_queue_accessDateTimeAdjustment
{
  return self->_accessDateTimeAdjustment;
}

- (SBFFileCacheStore)store
{
  return self->_store;
}

- (SBFFileCacheFaultHandler)faultHandler
{
  return self->_faultHandler;
}

- (SBFFileCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFFileCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maxTotalFileSize
{
  return self->_maxTotalFileSize;
}

- (void)setMaxTotalFileSize:(unint64_t)a3
{
  self->_maxTotalFileSize = a3;
}

- (unint64_t)maxTotalFileCount
{
  return self->_maxTotalFileCount;
}

- (void)setMaxTotalFileCount:(unint64_t)a3
{
  self->_maxTotalFileCount = a3;
}

- (double)maxAllowedTimeSinceLastAccess
{
  return self->_maxAllowedTimeSinceLastAccess;
}

- (void)setMaxAllowedTimeSinceLastAccess:(double)a3
{
  self->_maxAllowedTimeSinceLastAccess = a3;
}

- (double)maxAllowedTimeSinceGeneration
{
  return self->_maxAllowedTimeSinceGeneration;
}

- (void)setMaxAllowedTimeSinceGeneration:(double)a3
{
  self->_maxAllowedTimeSinceGeneration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_faultHandler, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end