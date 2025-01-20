@interface NTKArgonManager
- (NSArray)fetchers;
- (NSHashTable)observers;
- (NTKArgonExtractorProviding)extractor;
- (NTKArgonLocalKeyDatabaseProviding)keyDatabase;
- (NTKArgonManager)initWithKeyDatabase:(id)a3 fetchers:(id)a4 extractor:(id)a5;
- (OS_dispatch_queue)workQueue;
- (id)_queue_extractedKeyDescriptors;
- (void)_queue_extractKnownKeyDescriptorsIfNeededWithCompletion:(id)a3;
- (void)addArgonManagerObserver:(id)a3;
- (void)extractKnownKeyDescriptorsIfNeededWithCompletion:(id)a3;
- (void)refreshWithReason:(int64_t)a3;
- (void)removeArgonManagerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation NTKArgonManager

- (NTKArgonExtractorProviding)extractor
{
  return self->_extractor;
}

- (NTKArgonManager)initWithKeyDatabase:(id)a3 fetchers:(id)a4 extractor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKArgonManager;
  v12 = [(NTKArgonManager *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyDatabase, a3);
    uint64_t v14 = [v10 copy];
    fetchers = v13->_fetchers;
    v13->_fetchers = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_extractor, a5);
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.nanotimekit.facesupport.manager", v18);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v19;
  }
  return v13;
}

- (id)_queue_extractedKeyDescriptors
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [(NTKArgonManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v37 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(NTKArgonManager *)self extractor];
  v40 = [v4 extractionPath];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [(NTKArgonManager *)self extractor];
  v7 = [v6 extractionPath];
  v8 = [v5 enumeratorAtPath:v7];

  [v8 skipDescendants];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    v13 = @"bundle";
    uint64_t v14 = *(void *)v42;
    uint64_t v15 = *MEMORY[0x1E4F283C0];
    *(void *)&long long v11 = 138543362;
    long long v35 = v11;
    uint64_t v39 = *(void *)v42;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v9);
        }
        v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
        v18 = objc_msgSend(v9, "fileAttributes", v35);
        dispatch_queue_t v19 = [v18 fileType];
        int v20 = [v19 isEqualToString:v15];

        if (v20)
        {
          v21 = [v17 pathExtension];
          int v22 = [v21 isEqualToString:v13];

          if (v22)
          {
            v23 = v13;
            v24 = [v40 stringByAppendingPathComponent:v17];
            v25 = [v24 stringByAppendingPathComponent:@"Info.plist"];

            v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v25];
            v27 = v26;
            if (v26)
            {
              v28 = [v26 objectForKey:@"Argon"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v29 = [v28 objectForKey:@"Key"];
                uint64_t v30 = [v28 objectForKey:@"FileName"];
                objc_opt_class();
                v38 = (void *)v30;
                if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
                {
                  v31 = [[NTKArgonKeyDescriptor alloc] initWithKey:v29 fileName:v30];
                  if (v31)
                  {
                    [v37 addObject:v31];
                  }
                  else
                  {
                    log = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v35;
                      v46 = v25;
                      _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed key descriptor", buf, 0xCu);
                    }
                  }
                }
                else
                {
                  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                  v31 = (NTKArgonKeyDescriptor *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v35;
                    v46 = v25;
                    _os_log_error_impl(&dword_1BC5A9000, &v31->super, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed Info.plist", buf, 0xCu);
                  }
                }
              }
              else
              {
                v29 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v35;
                  v46 = v25;
                  _os_log_error_impl(&dword_1BC5A9000, v29, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed Info.plist", buf, 0xCu);
                }
              }
            }
            else
            {
              v28 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v35;
                v46 = v25;
                _os_log_error_impl(&dword_1BC5A9000, v28, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed or missing Info.plist", buf, 0xCu);
              }
            }

            v13 = v23;
            uint64_t v14 = v39;
          }
        }
        ++v16;
      }
      while (v12 != v16);
      uint64_t v32 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
      uint64_t v12 = v32;
    }
    while (v32);
  }

  v33 = (void *)[v37 copy];
  return v33;
}

- (void)refreshWithReason:(int64_t)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t queue = [(NTKArgonManager *)self workQueue];
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__17;
  v72[4] = __Block_byref_object_dispose__17;
  id v73 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__NTKArgonManager_refreshWithReason___block_invoke;
  aBlock[3] = &unk_1E62C38E0;
  aBlock[4] = v72;
  long long v35 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(aBlock);
  v3 = v35;
  v35[2](v35, @"7fANGylL6PUa3uY81gCLFCCt5U+XnmAjQ3dxfLMkoSw=", @"6d71ba2edb6ed7bcac81260d78a90e2d406774094c76eb31a442f8b4ff5b3631.aea");
  v3[2](v3, @"TL/Q1YYFljbn/n5bqLhisDb9QNanzHRT5EaNf+ZMCiM=", @"56d4a6adb4b04c9917f0c1ae56cf70e6044de7e91d6fd6fc5e9113148f8619d0.aea");
  v3[2](v3, @"dEc80tVMljpKxC/0UaPLLcbNZMatPSFK8pYhVp8a9f8=", @"520971cc499189d3cb8042fb7551a727effccfc6201fcf32bedab306ac668881.aea");
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v5 = [(NTKArgonManager *)self fetchers];
  v38 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__17;
  v69[4] = __Block_byref_object_dispose__17;
  id v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  char v68 = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7 = [(NTKArgonManager *)self fetchers];
  v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v9 = [(NTKArgonManager *)self fetchers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v64;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v64 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        [v8 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v10);
  }

  uint64_t v15 = dispatch_group_create();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v16 = [(NTKArgonManager *)self fetchers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v60;
    id obj = v16;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v60 != v18) {
          objc_enumerationMutation(obj);
        }
        int v20 = *(void **)(*((void *)&v59 + 1) + 8 * v19);
        dispatch_group_enter(v15);
        v21 = (objc_class *)objc_opt_class();
        int v22 = NSStringFromClass(v21);
        v23 = [(NTKArgonManager *)self keyDatabase];
        v24 = [v23 latestChangeTokenForServerIdentifier:v22];

        v25 = [MEMORY[0x1E4F1C9C8] date];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_2;
        v49[3] = &unk_1E62C3930;
        v50 = queue;
        v56 = v67;
        id v26 = v22;
        id v51 = v26;
        id v27 = v25;
        id v52 = v27;
        id v53 = v8;
        v57 = v72;
        id v54 = v38;
        v58 = v69;
        v55 = v15;
        [v20 fetchNewRecordsSinceChangeToken:v24 forReason:a3 completion:v49];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v16 = obj;
      uint64_t v17 = [obj countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v17);
  }

  if (NTKInternalBuild(v28, v29)) {
    int64_t v30 = 60000000000;
  }
  else {
    int64_t v30 = 43200000000000;
  }
  dispatch_time_t v31 = dispatch_time(0, v30);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_52;
  block[3] = &unk_1E62C2810;
  v47 = v15;
  uint64_t v48 = v67;
  id v46 = v8;
  uint64_t v32 = v15;
  id v33 = v8;
  dispatch_after(v31, queue, block);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_53;
  v41[3] = &unk_1E62C3958;
  v41[4] = self;
  id v42 = v38;
  long long v43 = v72;
  long long v44 = v69;
  id v34 = v38;
  dispatch_group_notify(v32, queue, v41);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(v72, 8);
}

void __37__NTKArgonManager_refreshWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v8 = [[NTKArgonKeyDescriptor alloc] initWithKey:v6 fileName:v5];

  v7 = v8;
  if (v8)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
    v7 = v8;
  }
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_3;
  block[3] = &unk_1E62C3908;
  uint64_t v24 = *(void *)(a1 + 80);
  uint64_t v10 = *(NSObject **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v19 = v7;
  uint64_t v25 = *(void *)(a1 + 88);
  id v20 = *(id *)(a1 + 64);
  id v21 = v8;
  uint64_t v11 = *(void *)(a1 + 96);
  id v22 = v9;
  uint64_t v26 = v11;
  id v23 = *(id *)(a1 + 72);
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v10, block);
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    v2 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __37__NTKArgonManager_refreshWithReason___block_invoke_3_cold_1(a1, v2);
    }
  }
  else
  {
    [*(id *)(a1 + 48) removeObject:*(void *)(a1 + 32)];
    v3 = *(void **)(a1 + 56);
    if (v3)
    {
      id v4 = [v3 allObjects];
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) addObjectsFromArray:v4];
    }
    [*(id *)(a1 + 64) setObject:*(void *)(a1 + 72) forKeyedSubscript:*(void *)(a1 + 32)];
    id v5 = *(void **)(a1 + 80);
    if (v5) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), v5);
    }
    id v6 = *(NSObject **)(a1 + 88);
    dispatch_group_leave(v6);
  }
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_52(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v14 = v7;
          _os_log_error_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_ERROR, "Fetcher %{public}@: Timed out. Abandoning results.", buf, 0xCu);
        }

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_53(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "_queue_extractedKeyDescriptors");
  id v2 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    id v47 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded key descriptors %@", buf, 0xCu);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v31 = *(void *)v41;
    *(void *)&long long v5 = 138412290;
    long long v28 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        long long v9 = objc_msgSend(v8, "fileName", v28);
        long long v10 = +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_55;
        v38[3] = &unk_1E62C0D88;
        id v11 = v9;
        id v39 = v11;
        [v10 beginRecordingForIdentifier:v11 method:2 completion:v38];
        long long v12 = [*(id *)(a1 + 32) keyDatabase];
        id v37 = 0;
        char v13 = [v12 addKeyDescriptor:v8 error:&v37];
        id v14 = v37;

        if (v13)
        {
          if (![v29 containsObject:v8]) {
            goto LABEL_15;
          }
          uint64_t v15 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v28;
            id v47 = v8;
            _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_DEFAULT, "Bundle already extracted for key descriptor %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v15 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            id v47 = v14;
            _os_log_error_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_ERROR, "Couldn't add key descriptor: %@", buf, 0xCu);
          }
        }

LABEL_15:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v6);
  }

  uint64_t v16 = *(void **)(a1 + 32);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_57;
  v36[3] = &unk_1E62BFF20;
  v36[4] = v16;
  objc_msgSend(v16, "_queue_extractKnownKeyDescriptorsIfNeededWithCompletion:", v36);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = *(id *)(a1 + 40);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:v22];
        uint64_t v24 = [*(id *)(a1 + 32) keyDatabase];
        [v24 recordChangeToken:v23 forServerIdentifier:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v19);
  }

  uint64_t v26 = *(void *)(a1 + 56);
  uint64_t v25 = a1 + 56;
  if (*(void *)(*(void *)(v26 + 8) + 40))
  {
    id v27 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __37__NTKArgonManager_refreshWithReason___block_invoke_53_cold_1(v25, v27);
    }
  }
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37__NTKArgonManager_refreshWithReason___block_invoke_55_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_57(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) argonManagerDidRefresh:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)extractKnownKeyDescriptorsIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKArgonManager *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__NTKArgonManager_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke;
  v8[3] = &unk_1E62C2290;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(v5, v7);
}

uint64_t __68__NTKArgonManager_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_extractKnownKeyDescriptorsIfNeededWithCompletion:", *(void *)(a1 + 40));
}

- (void)addArgonManagerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NTKArgonManager *)v5 observers];
    [v6 addObject:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)removeArgonManagerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NTKArgonManager *)v5 observers];
    [v6 removeObject:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)_queue_extractKnownKeyDescriptorsIfNeededWithCompletion:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NTKArgonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2810000000;
  v44[3] = &unk_1BC8E8B0B;
  int v45 = 0;
  id v6 = [(NTKArgonManager *)self _queue_extractedKeyDescriptors];
  id v7 = (void *)[v6 mutableCopy];

  long long v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = [(NTKArgonManager *)self extractor];
  long long v10 = [v9 sourcePath];
  id v11 = [v8 fileURLWithPath:v10];

  uint64_t v12 = [NTKArgonEncryptedBundleEnumerator alloc];
  v47[0] = v11;
  char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  id v14 = [(NTKArgonEncryptedBundleEnumerator *)v12 initWithSourceDirectoryURLs:v13];

  uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v16 = v14;
  uint64_t v17 = [(NTKArgonEncryptedBundleEnumerator *)v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v41;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = [*(id *)(*((void *)&v40 + 1) + 8 * v19) lastPathComponent];
        [v15 addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NTKArgonEncryptedBundleEnumerator *)v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v17);
  }

  id v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  uint64_t v22 = [(NTKArgonManager *)self keyDatabase];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke;
  v34[3] = &unk_1E62C39A8;
  id v39 = v44;
  id v23 = v7;
  id v35 = v23;
  id v24 = v15;
  id v36 = v24;
  uint64_t v25 = v21;
  id v37 = v25;
  v38 = self;
  [v22 enumerateKeyDescriptors:v34];

  uint64_t v26 = [(NTKArgonManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_64;
  block[3] = &unk_1E62C39D0;
  id v30 = v23;
  uint64_t v31 = self;
  id v32 = v4;
  long long v33 = v44;
  id v27 = v4;
  id v28 = v23;
  dispatch_group_notify(v25, v26, block);

  dispatch_group_leave(v25);
  _Block_object_dispose(v44, 8);
}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  char v4 = [*(id *)(a1 + 32) containsObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [v3 fileName];
    LOBYTE(v5) = [v5 containsObject:v6];

    if (v5)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      id v7 = [*(id *)(a1 + 56) extractor];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_61;
      v11[3] = &unk_1E62C3980;
      uint64_t v15 = *(void *)(a1 + 64);
      uint64_t v12 = *(id *)(a1 + 32);
      id v13 = v3;
      int8x16_t v10 = *(int8x16_t *)(a1 + 48);
      id v8 = (id)v10.i64[0];
      int8x16_t v14 = vextq_s8(v10, v10, 8uLL);
      [v7 extractUsingKeyDescriptor:v13 completion:v11];

      id v9 = v12;
    }
    else
    {
      id v9 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_cold_1(v3, v9);
      }
    }
  }
}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Extracted key to %@", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    id v9 = *(id *)(a1 + 48);
    objc_sync_enter(v9);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int8x16_t v10 = objc_msgSend(*(id *)(a1 + 48), "observers", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) argonManager:*(void *)(a1 + 48) didExtractKeyDescriptor:*(void *)(a1 + 40) toPath:v5];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_61_cold_1((uint64_t)v6, v8);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    id v9 = *(id *)(a1 + 48);
    objc_sync_enter(v9);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int8x16_t v10 = [*(id *)(a1 + 48) observers];
    uint64_t v14 = [v10 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * j) argonManager:*(void *)(a1 + 48) failedToExtractKeyDescriptor:*(void *)(a1 + 40) error:v6];
        }
        uint64_t v14 = [v10 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v14);
    }
  }

  objc_sync_exit(v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_64(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v55 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v54 + 1) + 8 * i) fileName];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  uint64_t v41 = a1;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v9 = [*(id *)(a1 + 40) extractor];
  uint64_t v10 = [v9 sourcePath];

  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v40 = (void *)v10;
  uint64_t v12 = [v11 contentsOfDirectoryAtPath:v10 error:0];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v43 = 0;
    uint64_t v16 = *(void *)v51;
    long long v17 = v42;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        long long v20 = [v19 pathExtension];
        int v21 = [v20 isEqualToString:@"aea"];

        if (v21)
        {
          if ([v2 containsObject:v19]) {
            ++v43;
          }
          else {
            [v42 addObject:v19];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v43 = 0;
    long long v17 = v42;
  }
  id v39 = v13;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v22 = [v17 allObjects];
  long long v23 = [v22 sortedArrayUsingSelector:sel_compare_];

  uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        uint64_t v29 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = v28;
          _os_log_impl(&dword_1BC5A9000, v29, OS_LOG_TYPE_DEFAULT, "No key available to extract %@", buf, 0xCu);
        }
      }
      uint64_t v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v62, 16, v39);
    }
    while (v25);
  }

  uint64_t v30 = [v42 count] + v43;
  uint64_t v31 = [v42 count];
  id v32 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    uint64_t v34 = v41;
    if (!v33) {
      goto LABEL_36;
    }
    uint64_t v35 = [v42 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v59 = v35;
    __int16 v60 = 2048;
    uint64_t v61 = v30;
    id v36 = "Still waiting for keys for %lu of %lu archives";
    id v37 = v32;
    uint32_t v38 = 22;
  }
  else
  {
    uint64_t v34 = v41;
    if (!v33) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v59 = v30;
    id v36 = "All keys obtained for %lu available archives";
    id v37 = v32;
    uint32_t v38 = 12;
  }
  _os_log_impl(&dword_1BC5A9000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
LABEL_36:

  if (*(void *)(v34 + 48))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_70;
    block[3] = &unk_1E62C0718;
    id v45 = *(id *)(v34 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NTKArgonLocalKeyDatabaseProviding)keyDatabase
{
  return self->_keyDatabase;
}

- (NSArray)fetchers
{
  return self->_fetchers;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_fetchers, 0);
  objc_storeStrong((id *)&self->_keyDatabase, 0);
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:*(void *)(a1 + 40)];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2050;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Fetcher %{public}@: Timed out. Fetch completed after %{public}f seconds.", (uint8_t *)&v7, 0x16u);
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_53_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Asset and key fetch failed: %{public}@.", (uint8_t *)&v3, 0xCu);
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_55_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Couldn't ingest key from JSON %@ - %@", (uint8_t *)&v4, 0x16u);
}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 fileName];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "Skipping extraction of %{public}@: archive doesn't exist; possibly from previous release?",
    (uint8_t *)&v4,
    0xCu);
}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_61_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Could not extract to %@ - %@", (uint8_t *)&v2, 0x16u);
}

@end