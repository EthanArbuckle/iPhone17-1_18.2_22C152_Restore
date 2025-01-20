@interface NTKArgonExtractor
+ (BOOL)_createUnprotectedDirectoryAtPath:(id)a3 error:(id *)a4;
- (NSMapTable)extractionCallbacksByDescriptor;
- (NSMapTable)removalCallbacksByDescriptor;
- (NSMutableOrderedSet)queuedKeyDescriptorOperations;
- (NSString)extractionPath;
- (NSString)sourcePath;
- (NTKArgonExtractor)initWithSourcePath:(id)a3 inProgressPath:(id)a4 extractionPath:(id)a5;
- (NTKArgonExtractorOperation)performingOperation;
- (OS_dispatch_queue)workQueue;
- (void)_queue_extractKeyDescriptor:(id)a3;
- (void)_queue_extractUsingKeyDescriptor:(id)a3 completion:(id)a4;
- (void)_queue_performNextOperationIfNeeded;
- (void)_queue_removeKeyDescriptor:(id)a3;
- (void)_queue_removeKeyDescriptor:(id)a3 completion:(id)a4;
- (void)extractUsingKeyDescriptor:(id)a3 completion:(id)a4;
- (void)removeExtractedKeyDescriptor:(id)a3 completion:(id)a4;
- (void)setPerformingOperation:(id)a3;
@end

@implementation NTKArgonExtractor

- (NSString)sourcePath
{
  return self->_sourcePath;
}

+ (BOOL)_createUnprotectedDirectoryAtPath:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    char v8 = 1;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v12 = *MEMORY[0x1E4F28370];
    v13[0] = *MEMORY[0x1E4F28378];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v8 = [v9 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v10 error:a4];
  }
  return v8;
}

- (NTKArgonExtractor)initWithSourcePath:(id)a3 inProgressPath:(id)a4 extractionPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)NTKArgonExtractor;
  v11 = [(NTKArgonExtractor *)&v38 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    extractionPath = v11->_extractionPath;
    v11->_extractionPath = (NSString *)v12;

    v14 = v11->_extractionPath;
    id v37 = 0;
    BOOL v15 = +[NTKArgonExtractor _createUnprotectedDirectoryAtPath:v14 error:&v37];
    id v16 = v37;
    if (!v15)
    {
      v17 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[NTKArgonExtractor initWithSourcePath:inProgressPath:extractionPath:]();
      }
    }
    uint64_t v18 = [v9 copy];
    inProgressPath = v11->_inProgressPath;
    v11->_inProgressPath = (NSString *)v18;

    v20 = v11->_inProgressPath;
    id v36 = 0;
    BOOL v21 = +[NTKArgonExtractor _createUnprotectedDirectoryAtPath:v20 error:&v36];
    id v22 = v36;
    if (!v21)
    {
      v23 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[NTKArgonExtractor initWithSourcePath:inProgressPath:extractionPath:]();
      }
    }
    uint64_t v24 = [v8 copy];
    sourcePath = v11->_sourcePath;
    v11->_sourcePath = (NSString *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.nanotimekit.facesupport.extractor", v26);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    extractionCallbacksByDescriptor = v11->_extractionCallbacksByDescriptor;
    v11->_extractionCallbacksByDescriptor = (NSMapTable *)v29;

    uint64_t v31 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    removalCallbacksByDescriptor = v11->_removalCallbacksByDescriptor;
    v11->_removalCallbacksByDescriptor = (NSMapTable *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA70] orderedSet];
    queuedKeyDescriptorOperations = v11->_queuedKeyDescriptorOperations;
    v11->_queuedKeyDescriptorOperations = (NSMutableOrderedSet *)v33;
  }
  return v11;
}

- (void)removeExtractedKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [(NTKArgonExtractor *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__NTKArgonExtractor_removeExtractedKeyDescriptor_completion___block_invoke;
      block[3] = &unk_1E62C0098;
      block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async(v8, block);
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKArgonExtractorErrorDomain" code:300 userInfo:&unk_1F16E8750];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
}

uint64_t __61__NTKArgonExtractor_removeExtractedKeyDescriptor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeKeyDescriptor:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_removeKeyDescriptor:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(NTKArgonExtractor *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(NTKArgonExtractor *)self removalCallbacksByDescriptor];
  id v9 = [v8 objectForKey:v13];
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    [v8 setObject:v9 forKey:v13];
  }
  id v10 = _Block_copy(v6);
  [v9 addObject:v10];

  id v11 = [[NTKArgonExtractorOperation alloc] initWithKeyDescriptor:v13 operationType:2];
  id v12 = [(NTKArgonExtractor *)self queuedKeyDescriptorOperations];
  [v12 addObject:v11];

  [(NTKArgonExtractor *)self _queue_performNextOperationIfNeeded];
}

- (void)extractUsingKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [(NTKArgonExtractor *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__NTKArgonExtractor_extractUsingKeyDescriptor_completion___block_invoke;
      block[3] = &unk_1E62C0098;
      block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async(v8, block);
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKArgonExtractorErrorDomain" code:300 userInfo:&unk_1F16E8778];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
}

uint64_t __58__NTKArgonExtractor_extractUsingKeyDescriptor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_extractUsingKeyDescriptor:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_extractUsingKeyDescriptor:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(NTKArgonExtractor *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(NTKArgonExtractor *)self extractionCallbacksByDescriptor];
  id v9 = [v8 objectForKey:v13];
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    [v8 setObject:v9 forKey:v13];
  }
  id v10 = _Block_copy(v6);
  [v9 addObject:v10];

  id v11 = [[NTKArgonExtractorOperation alloc] initWithKeyDescriptor:v13 operationType:1];
  id v12 = [(NTKArgonExtractor *)self queuedKeyDescriptorOperations];
  [v12 addObject:v11];

  [(NTKArgonExtractor *)self _queue_performNextOperationIfNeeded];
}

- (void)_queue_performNextOperationIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "ERROR: Unknown.", v1, 2u);
}

- (void)_queue_extractKeyDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKArgonExtractor *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v34 = [(NTKArgonExtractor *)self extractionCallbacksByDescriptor];
  id v6 = [v34 objectForKey:v4];
  id v7 = [(NTKArgonExtractor *)self sourcePath];
  id v8 = [v4 fileName];
  id v9 = [v7 stringByAppendingPathComponent:v8];

  id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
  id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v12 = [v4 key];
  v35 = (void *)[v11 initWithBase64EncodedString:v12 options:0];

  uint64_t v33 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v33 UUIDString];
  v14 = [(NSString *)self->_inProgressPath stringByAppendingPathComponent:v13];
  v50[0] = 0;
  LOBYTE(v11) = +[NTKArgonExtractor _createUnprotectedDirectoryAtPath:v14 error:v50];
  id v15 = v50[0];
  if ((v11 & 1) == 0)
  {
    id v16 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(NTKArgonExtractor *)v4 _queue_extractKeyDescriptor:v16];
    }
  }
  v32 = v15;
  v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  uint64_t v18 = [NTKAppleEncryptedArchiveDiskExtractor alloc];
  uint64_t v19 = *MEMORY[0x1E4F28378];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke;
  v38[3] = &unk_1E62C00E8;
  v38[4] = self;
  id v20 = v10;
  id v39 = v20;
  id v21 = v17;
  id v40 = v21;
  v43 = &v44;
  id v22 = v14;
  id v41 = v22;
  id v23 = v6;
  id v42 = v23;
  uint64_t v24 = [(NTKAppleEncryptedArchiveDiskExtractor *)v18 initWithArchiveURL:v20 symmetricKey:v35 outputDirectoryURL:v21 fileProtection:v19 completion:v38];
  v25 = (void *)v45[5];
  v45[5] = v24;

  v26 = (void *)v45[5];
  id v37 = 0;
  dispatch_queue_t v27 = [v26 requiredDiskSpaceWithError:&v37];
  id v28 = v37;
  if (v27)
  {
    uint64_t v29 = [(id)v45[5] outputDirectoryURL];
    unsigned int v30 = [v27 unsignedIntValue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_56;
    v36[3] = &unk_1E62C0110;
    v36[4] = &v44;
    NTKRequestFreeSpaceOnVolume(v29, v30, v36);
  }
  else
  {
    uint64_t v31 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[NTKArgonExtractor _queue_extractKeyDescriptor:]();
    }

    [(id)v45[5] resume];
  }

  _Block_object_dispose(&v44, 8);
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2;
  v10[3] = &unk_1E62C00C0;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  char v18 = a2;
  uint64_t v17 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = *(id *)(a1 + 64);
  id v9 = v5;
  dispatch_async(v6, v10);
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v58 = v3;
    __int16 v59 = 2114;
    v60 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Successfully extracted %{public}@ to %{public}@", buf, 0x16u);
  }

  id v5 = *(id *)(a1 + 48);
  if (*(unsigned char *)(a1 + 88))
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v55 = v5;
    int v7 = [v6 verifyExtractedContentsWithError:&v55];
    id v8 = v55;

    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ArgonBugReportShowBugReportAlwaysAfterExtraction", @"com.apple.NanoTimeKit.face", 0);
    if (v7) {
      BOOL v10 = AppBooleanValue == 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      id v11 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_2();
      }

      NTKArgonExtractorReportExtractionFailure((uint64_t)"Argon verification failed", *(void **)(a1 + 32), v8);
    }
    else
    {
      int v7 = 1;
    }
  }
  else
  {
    id v12 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_1();
    }

    NTKArgonExtractorReportExtractionFailure((uint64_t)"Argon extraction failed", *(void **)(a1 + 32), v5);
    int v7 = 0;
    id v8 = v5;
  }
  id v13 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v58 = v14;
    _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "Successfully verified extracted bundle at %{public}@", buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 88)) {
    int v15 = v7;
  }
  else {
    int v15 = 0;
  }
  unint64_t v16 = 0x1E4F28000uLL;
  if (v15 == 1)
  {
    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v18 = [v17 contentsOfDirectoryAtPath:*(void *)(a1 + 56) error:0];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v52;
      *(void *)&long long v20 = 138543874;
      long long v44 = v20;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          v25 = objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathComponent:", v24, v44);
          v26 = [*(id *)(a1 + 64) extractionPath];
          dispatch_queue_t v27 = [v26 stringByAppendingPathComponent:v24];

          id v28 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v50 = 0;
          char v29 = [v28 moveItemAtPath:v25 toPath:v27 error:&v50];
          id v30 = v50;

          uint64_t v31 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v32 = v31;
          if (v29)
          {
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v58 = v25;
              __int16 v59 = 2114;
              v60 = v27;
              _os_log_impl(&dword_1BC5A9000, v32, OS_LOG_TYPE_DEFAULT, "Successfully moved bundle %{public}@ -> %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v44;
            v58 = v25;
            __int16 v59 = 2114;
            v60 = v27;
            __int16 v61 = 2114;
            id v62 = v30;
            _os_log_fault_impl(&dword_1BC5A9000, v32, OS_LOG_TYPE_FAULT, "Couldn't move %{public}@ to %{public}@ - %{public}@", buf, 0x20u);
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
      }
      while (v21);
    }

    uint64_t v33 = [obj firstObject];
    v34 = [*(id *)(a1 + 64) extractionPath];
    v35 = [v34 stringByAppendingPathComponent:v33];

    id v8 = 0;
    unint64_t v16 = 0x1E4F28000;
  }
  else
  {
    v35 = 0;
  }
  id v36 = [*(id *)(v16 + 3256) defaultManager];
  [v36 removeItemAtPath:*(void *)(a1 + 56) error:0];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v37 = *(id *)(a1 + 72);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v46 + 1) + 8 * j) + 16))();
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v39);
  }

  [*(id *)(a1 + 72) removeAllObjects];
  [*(id *)(a1 + 64) setPerformingOperation:0];
  objc_msgSend(*(id *)(a1 + 64), "_queue_performNextOperationIfNeeded");
  uint64_t v42 = *(void *)(*(void *)(a1 + 80) + 8);
  v43 = *(void **)(v42 + 40);
  *(void *)(v42 + 40) = 0;
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_56(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  BOOL v10 = v9;
  if (v7)
  {
    BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v11)
      {
        int v13 = 138477827;
        id v14 = v7;
        id v12 = "Purged stale data to ensure free space was available. At least %{private}@ bytes are now available.";
LABEL_9:
        _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
      }
    }
    else if (v11)
    {
      int v13 = 138477827;
      id v14 = v7;
      id v12 = "Enough space available to attempt extraction. At least %{private}@ bytes are available.";
      goto LABEL_9;
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_56_cold_1(a3, (uint64_t)v8, v10);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) resume];
}

- (void)_queue_removeKeyDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKArgonExtractor *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(NTKArgonExtractor *)self removalCallbacksByDescriptor];
  id v7 = [v6 objectForKey:v4];
  id v8 = [(NTKArgonExtractor *)self extractionPath];
  id v9 = [v4 fileName];

  BOOL v10 = [v8 stringByAppendingPathComponent:v9];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__NTKArgonExtractor__queue_removeKeyDescriptor___block_invoke;
  aBlock[3] = &unk_1E62C0138;
  id v11 = v7;
  id v20 = v11;
  uint64_t v21 = self;
  id v12 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  int v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = 0;
  char v14 = [v13 removeItemAtPath:v10 error:&v18];
  id v15 = v18;

  if (v14)
  {
    unint64_t v16 = v10;
    id v17 = 0;
  }
  else
  {
    unint64_t v16 = 0;
    id v17 = v15;
  }
  v12[2](v12, v16, v17);
}

void __48__NTKArgonExtractor__queue_removeKeyDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v22[0] = @"description";
    v22[1] = v9;
    v23[0] = @"filesystem operation failed";
    v23[1] = v6;
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v11 = [v8 errorWithDomain:@"NTKArgonExtractorErrorDomain" code:301 userInfo:v10];
  }
  else
  {
    id v11 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * i));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (void)v17);
  [*(id *)(a1 + 40) setPerformingOperation:0];
  objc_msgSend(*(id *)(a1 + 40), "_queue_performNextOperationIfNeeded");
}

- (NSString)extractionPath
{
  return self->_extractionPath;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NTKArgonExtractorOperation)performingOperation
{
  return self->_performingOperation;
}

- (void)setPerformingOperation:(id)a3
{
}

- (NSMutableOrderedSet)queuedKeyDescriptorOperations
{
  return self->_queuedKeyDescriptorOperations;
}

- (NSMapTable)extractionCallbacksByDescriptor
{
  return self->_extractionCallbacksByDescriptor;
}

- (NSMapTable)removalCallbacksByDescriptor
{
  return self->_removalCallbacksByDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalCallbacksByDescriptor, 0);
  objc_storeStrong((id *)&self->_extractionCallbacksByDescriptor, 0);
  objc_storeStrong((id *)&self->_queuedKeyDescriptorOperations, 0);
  objc_storeStrong((id *)&self->_performingOperation, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_extractionPath, 0);

  objc_storeStrong((id *)&self->_inProgressPath, 0);
}

- (void)initWithSourcePath:inProgressPath:extractionPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error creating progress directory: %@", v2, v3, v4, v5, v6);
}

- (void)initWithSourcePath:inProgressPath:extractionPath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error creating extraction directory: %@", v2, v3, v4, v5, v6);
}

- (void)_queue_extractKeyDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Failed to check for free space: %{public}@. Will continue, since space purging is best effort.", v2, v3, v4, v5, v6);
}

- (void)_queue_extractKeyDescriptor:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 fileName];
  OUTLINED_FUNCTION_2();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "Couldn't make temporary path to extract %@ - %@", v6, 0x16u);
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_FAULT, "Argon extraction failed: %{public}@", v1, 0xCu);
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_FAULT, "Argon verification failed: %{public}@", v1, 0xCu);
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_56_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = "YES";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "NO";
  }
  *(_DWORD *)uint64_t v4 = 136315394;
  *(void *)&v4[4] = v3;
  *(_WORD *)&v4[12] = 2114;
  *(void *)&v4[14] = a2;
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, a2, a3, "Failed to ensure free space available (purge attempted: %s): %{public}@. Will continue, since space purging is best effort.", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], *MEMORY[0x1E4F143B8]);
}

@end