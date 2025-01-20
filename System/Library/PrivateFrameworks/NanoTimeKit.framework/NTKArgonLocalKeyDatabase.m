@interface NTKArgonLocalKeyDatabase
+ (BOOL)_decodedKeyDescriptors:(id *)a3 changeTokens:(id *)a4 fromData:(id)a5 error:(id *)a6;
+ (id)_argonKeyDatabaseErrorWithCode:(unint64_t)a3 userInfo:(id)a4;
+ (id)_jsonDataForKeyDescriptors:(id)a3 changeTokens:(id)a4 error:(id *)a5;
- (BOOL)addKeyDescriptor:(id)a3 error:(id *)a4;
- (NSMutableDictionary)newlyAddedChangeTokens;
- (NSMutableDictionary)newlyAddedKeyDescriptorsByFileName;
- (NSMutableDictionary)persistedChangeTokens;
- (NSMutableDictionary)persistedKeyDescriptorsByFileName;
- (NSMutableOrderedSet)newlyAddedKeyDescriptors;
- (NSMutableOrderedSet)persistedKeyDescriptors;
- (NSString)storagePath;
- (NTKArgonLocalKeyDatabase)initWithKeyStoragePath:(id)a3;
- (OS_dispatch_queue)stateQueue;
- (id)keyDescriptorForFileName:(id)a3;
- (id)latestChangeTokenForServerIdentifier:(id)a3;
- (unint64_t)nextFlushTime;
- (void)_queue_flushImmediately;
- (void)_queue_requestDelayedFlushWithMaximumTimeInterval:(double)a3;
- (void)enumerateKeyDescriptors:(id)a3;
- (void)flush;
- (void)flushWithinTimeInterval:(double)a3;
- (void)recordChangeToken:(id)a3 forServerIdentifier:(id)a4;
- (void)setNextFlushTime:(unint64_t)a3;
- (void)setStateQueue:(id)a3;
@end

@implementation NTKArgonLocalKeyDatabase

- (NTKArgonLocalKeyDatabase)initWithKeyStoragePath:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)NTKArgonLocalKeyDatabase;
  v5 = [(NTKArgonLocalKeyDatabase *)&v55 init];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v6 = [v4 copy];
  storagePath = v5->_storagePath;
  v5->_storagePath = (NSString *)v6;

  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanotimekit.facesupport.keydatabase", v8);
  stateQueue = v5->_stateQueue;
  v5->_stateQueue = (OS_dispatch_queue *)v9;

  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 fileExistsAtPath:v5->_storagePath];

  id v13 = 0;
  if (!v12) {
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x1E4F1C9B8];
  v15 = [(NTKArgonLocalKeyDatabase *)v5 storagePath];
  id v54 = 0;
  v16 = [v14 dataWithContentsOfFile:v15 options:0 error:&v54];
  id v17 = v54;

  if (!v16)
  {
    v24 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[NTKArgonLocalKeyDatabase initWithKeyStoragePath:]();
    }

    id v13 = 0;
    goto LABEL_13;
  }
  id v52 = 0;
  id v53 = 0;
  id v51 = v17;
  BOOL v18 = +[NTKArgonLocalKeyDatabase _decodedKeyDescriptors:&v53 changeTokens:&v52 fromData:v16 error:&v51];
  id v19 = v53;
  id v13 = v52;
  id v20 = v51;

  if (!v18)
  {
    v21 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[NTKArgonLocalKeyDatabase initWithKeyStoragePath:]();
    }
  }
  if (!v19)
  {
LABEL_13:
    v22 = [MEMORY[0x1E4F1CA70] orderedSet];
    v44 = 0;
    persistedKeyDescriptors = v5->_persistedKeyDescriptors;
    goto LABEL_14;
  }
  v22 = (NSMutableOrderedSet *)v19;
  persistedKeyDescriptors = v5->_persistedKeyDescriptors;
  v44 = v22;
LABEL_14:
  v5->_persistedKeyDescriptors = v22;

  v45 = v13;
  id v46 = v4;
  if (v13)
  {
    v25 = (NSMutableDictionary *)v13;
  }
  else
  {
    v25 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  persistedChangeTokens = v5->_persistedChangeTokens;
  v5->_persistedChangeTokens = v25;

  uint64_t v27 = [MEMORY[0x1E4F1CA70] orderedSet];
  newlyAddedKeyDescriptors = v5->_newlyAddedKeyDescriptors;
  v5->_newlyAddedKeyDescriptors = (NSMutableOrderedSet *)v27;

  uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
  newlyAddedChangeTokens = v5->_newlyAddedChangeTokens;
  v5->_newlyAddedChangeTokens = (NSMutableDictionary *)v29;

  uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableOrderedSet count](v5->_persistedKeyDescriptors, "count"));
  persistedKeyDescriptorsByFileName = v5->_persistedKeyDescriptorsByFileName;
  v5->_persistedKeyDescriptorsByFileName = (NSMutableDictionary *)v31;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v33 = v5->_persistedKeyDescriptors;
  uint64_t v34 = [(NSMutableOrderedSet *)v33 countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v39 = [v38 fileName];
        if (v39)
        {
          [(NSMutableDictionary *)v5->_persistedKeyDescriptorsByFileName setObject:v38 forKeyedSubscript:v39];
          v40 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v39;
            _os_log_impl(&dword_1BC5A9000, v40, OS_LOG_TYPE_DEFAULT, "Loaded key descriptor for file name %@", buf, 0xCu);
          }
        }
      }
      uint64_t v35 = [(NSMutableOrderedSet *)v33 countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v35);
  }

  uint64_t v41 = [MEMORY[0x1E4F1CA60] dictionary];
  newlyAddedKeyDescriptorsByFileName = v5->_newlyAddedKeyDescriptorsByFileName;
  v5->_newlyAddedKeyDescriptorsByFileName = (NSMutableDictionary *)v41;

  v5->_nextFlushTime = 0;
  id v4 = v46;
LABEL_29:

  return v5;
}

- (void)enumerateKeyDescriptors:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v6 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NTKArgonLocalKeyDatabase_enumerateKeyDescriptors___block_invoke;
  block[3] = &unk_1E62C09C0;
  id v7 = v5;
  id v18 = v7;
  id v19 = self;
  dispatch_sync(v6, block);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v10);
  }
}

void __52__NTKArgonLocalKeyDatabase_enumerateKeyDescriptors___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) persistedKeyDescriptors];
  [v2 unionOrderedSet:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) newlyAddedKeyDescriptors];
  [v4 unionOrderedSet:v5];
}

- (BOOL)addKeyDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 fileName];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  id v8 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__NTKArgonLocalKeyDatabase_addKeyDescriptor_error___block_invoke;
  v15[3] = &unk_1E62C2928;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  id v18 = &v19;
  id v10 = v7;
  id v17 = v10;
  dispatch_sync(v8, v15);

  uint64_t v11 = v20;
  if (v20[5])
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "Skipped key descriptor for file name %@", buf, 0xCu);
    }

    uint64_t v11 = v20;
    if (a4)
    {
      *a4 = (id) v20[5];
      uint64_t v11 = v20;
    }
  }
  BOOL v13 = v11[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __51__NTKArgonLocalKeyDatabase_addKeyDescriptor_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistedKeyDescriptors];
  v3 = [*(id *)(a1 + 32) newlyAddedKeyDescriptors];
  if (([v2 containsObject:*(void *)(a1 + 40)] & 1) != 0
    || [v3 containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v4 = [(id)objc_opt_class() _argonKeyDatabaseErrorWithCode:1 userInfo:&unk_1F16E8868];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    id v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Adding key descriptor for file name %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = [*(id *)(a1 + 32) newlyAddedKeyDescriptors];
    [v9 addObject:*(void *)(a1 + 40)];

    if (*(void *)(a1 + 48))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = [*(id *)(a1 + 32) newlyAddedKeyDescriptorsByFileName];
      [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 48)];
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_requestDelayedFlushWithMaximumTimeInterval:", 30.0);
  }
}

- (id)keyDescriptorForFileName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__10;
    long long v15 = __Block_byref_object_dispose__10;
    id v16 = 0;
    uint64_t v5 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__NTKArgonLocalKeyDatabase_keyDescriptorForFileName___block_invoke;
    block[3] = &unk_1E62C2810;
    uint64_t v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __53__NTKArgonLocalKeyDatabase_keyDescriptorForFileName___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) newlyAddedKeyDescriptorsByFileName];
  v3 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = v3;
  if (!v3)
  {
    v1 = [*(id *)(a1 + 32) persistedKeyDescriptorsByFileName];
    id v4 = [v1 objectForKeyedSubscript:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  if (!v3)
  {
  }
}

- (void)recordChangeToken:(id)a3 forServerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NTKArgonLocalKeyDatabase_recordChangeToken_forServerIdentifier___block_invoke;
  block[3] = &unk_1E62C04F0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

uint64_t __66__NTKArgonLocalKeyDatabase_recordChangeToken_forServerIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) newlyAddedChangeTokens];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_queue_requestDelayedFlushWithMaximumTimeInterval:", 30.0);
}

- (id)latestChangeTokenForServerIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__10;
  id v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  id v5 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__NTKArgonLocalKeyDatabase_latestChangeTokenForServerIdentifier___block_invoke;
  block[3] = &unk_1E62C2810;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __65__NTKArgonLocalKeyDatabase_latestChangeTokenForServerIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) newlyAddedChangeTokens];
  v3 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = v3;
  if (!v3)
  {
    v1 = [*(id *)(a1 + 32) persistedChangeTokens];
    id v4 = [v1 objectForKeyedSubscript:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  if (!v3)
  {
  }
}

- (void)flush
{
}

- (void)flushWithinTimeInterval:(double)a3
{
  id v5 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__NTKArgonLocalKeyDatabase_flushWithinTimeInterval___block_invoke;
  v6[3] = &unk_1E62C2950;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __52__NTKArgonLocalKeyDatabase_flushWithinTimeInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestDelayedFlushWithMaximumTimeInterval:", *(double *)(a1 + 40));
}

- (void)_queue_requestDelayedFlushWithMaximumTimeInterval:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (NTKInternalBuild(self, a2))
  {
    id v5 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
    dispatch_assert_queue_V2(v5);
  }
  unint64_t v6 = [(NTKArgonLocalKeyDatabase *)self nextFlushTime];
  __uint64_t v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  unint64_t v8 = (unint64_t)(a3 * 1000000000.0);
  id v9 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  id v10 = v9;
  if (v6 - v8 <= v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[NTKArgonLocalKeyDatabase _queue_requestDelayedFlushWithMaximumTimeInterval:](v10);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v16 = a3;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Key Database: Enqueueing flush request within %f seconds.", buf, 0xCu);
    }

    dispatch_time_t v11 = dispatch_time(0x8000000000000000, (unint64_t)(a3 * 1000000000.0));
    uint64_t v12 = [(NTKArgonLocalKeyDatabase *)self stateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__NTKArgonLocalKeyDatabase__queue_requestDelayedFlushWithMaximumTimeInterval___block_invoke;
    block[3] = &unk_1E62BFF20;
    void block[4] = self;
    dispatch_after(v11, v12, block);

    if (v6 <= v7 + v8) {
      unint64_t v13 = v7 + v8;
    }
    else {
      unint64_t v13 = v6;
    }
    [(NTKArgonLocalKeyDatabase *)self setNextFlushTime:v13];
  }
}

uint64_t __78__NTKArgonLocalKeyDatabase__queue_requestDelayedFlushWithMaximumTimeInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_flushImmediately");
}

- (void)_queue_flushImmediately
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Key Database: Couldn't create directory: %@. Skipping persistence attempt.", (uint8_t *)&v2, 0xCu);
}

+ (id)_jsonDataForKeyDescriptors:(id)a3 changeTokens:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "argon_JSONRepresentation");
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v12);
  }
  uint64_t v34 = a5;

  double v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        v23 = [v17 objectForKeyedSubscript:v22];
        id v24 = [v23 base64EncodedStringWithOptions:0];
        [v16 setObject:v24 forKeyedSubscript:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v50 count:16];
    }
    while (v19);
  }

  v48[0] = @"kd";
  v48[1] = @"ct";
  v49[0] = v9;
  v49[1] = v16;
  v48[2] = @"v";
  v49[2] = &unk_1F16E0ED0;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v25])
  {
    id v35 = 0;
    id v26 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v25 options:0 error:&v35];
    id v27 = v35;
    if (v26)
    {
      id v26 = v26;
      v28 = v26;
    }
    else
    {
      if (v34)
      {
        v30 = [NSString stringWithFormat:@"Could not encode JSON %@", v27];
        uint64_t v31 = objc_opt_class();
        v44 = @"description";
        v45 = v30;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        *uint64_t v34 = [v31 _argonKeyDatabaseErrorWithCode:3 userInfo:v32];
      }
      v28 = 0;
    }
    goto LABEL_23;
  }
  if (v34)
  {
    id v27 = [NSString stringWithFormat:@"Object %@ is not valid JSON", v25];
    uint64_t v29 = objc_opt_class();
    id v46 = @"description";
    id v47 = v27;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    [v29 _argonKeyDatabaseErrorWithCode:2 userInfo:v26];
    v28 = 0;
    *uint64_t v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

    goto LABEL_24;
  }
  v28 = 0;
LABEL_24:

  return v28;
}

+ (BOOL)_decodedKeyDescriptors:(id *)a3 changeTokens:(id *)a4 fromData:(id)a5 error:(id *)a6
{
  v112[1] = *MEMORY[0x1E4F143B8];
  id v95 = 0;
  id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a5 options:0 error:&v95];
  id v10 = v95;
  if (!a6 || v9)
  {
    v79 = a3;
    uint64_t v12 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v81 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v74 = a4;
        id v76 = v10;
        id v80 = v12;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        v78 = v9;
        id v42 = v9;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v83 objects:v100 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v84;
          while (2)
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v84 != v45) {
                objc_enumerationMutation(v42);
              }
              id v47 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a6)
                {
                  v60 = [NSString stringWithFormat:@"Array contains class %@, not dictionary", objc_opt_class()];
                  v61 = objc_opt_class();
                  v98 = @"description";
                  v99 = v60;
                  v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
                  v63 = [v61 _argonKeyDatabaseErrorWithCode:5 userInfo:v62];

                  id v64 = v63;
                  *a6 = v64;
                }
                BOOL v13 = 0;
                id v10 = v76;
                id v9 = v78;
                uint64_t v12 = v80;
                goto LABEL_70;
              }
              long long v48 = [NTKArgonKeyDescriptor alloc];
              long long v49 = [(NTKArgonKeyDescriptor *)v48 argon_initWithJSONRepresentation:v47];

              if (v49)
              {
                [v80 addObject:v49];
              }
              else
              {
                long long v50 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v102 = v47;
                  _os_log_error_impl(&dword_1BC5A9000, v50, OS_LOG_TYPE_ERROR, "Could not create descriptor from %@", buf, 0xCu);
                }
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v83 objects:v100 count:16];
            if (v44) {
              continue;
            }
            break;
          }
        }

        uint64_t v12 = v80;
        id *v79 = v80;
        [MEMORY[0x1E4F1CA60] dictionary];
        id v10 = v76;
        id *v74 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v13 = 1;
        id v9 = v78;
      }
      else
      {
        if (a6)
        {
          v57 = [NSString stringWithFormat:@"Unknown format with root object of class %@", objc_opt_class()];
          v58 = objc_opt_class();
          v96 = @"description";
          v97 = v57;
          uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
          *a6 = [v58 _argonKeyDatabaseErrorWithCode:5 userInfo:v59];
        }
        BOOL v13 = 0;
      }
      goto LABEL_70;
    }
    id v14 = v9;
    long long v15 = [v14 objectForKeyedSubscript:@"v"];
    char v16 = [v15 isEqual:&unk_1F16E0ED0];

    if (v16)
    {
      id v17 = [v14 objectForKeyedSubscript:@"kd"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v73 = a4;
        uint64_t v18 = [v14 objectForKeyedSubscript:@"ct"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v75 = v10;
          v77 = v9;
          uint64_t v20 = [v14 objectForKeyedSubscript:@"kd"];
          id v71 = v14;
          v72 = [v14 objectForKeyedSubscript:@"ct"];
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          obuint64_t j = v20;
          uint64_t v21 = [obj countByEnumeratingWithState:&v91 objects:v106 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v92;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v92 != v23) {
                  objc_enumerationMutation(obj);
                }
                v25 = *(void **)(*((void *)&v91 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v26 = [NTKArgonKeyDescriptor alloc];
                  id v27 = [(NTKArgonKeyDescriptor *)v26 argon_initWithJSONRepresentation:v25];

                  if (v27)
                  {
                    [v12 addObject:v27];
                  }
                  else
                  {
                    v28 = v12;
                    uint64_t v29 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v102 = v25;
                      _os_log_error_impl(&dword_1BC5A9000, v29, OS_LOG_TYPE_ERROR, "Could not create descriptor from %@", buf, 0xCu);
                    }

                    uint64_t v12 = v28;
                  }
                }
                else
                {
                  id v27 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v102 = v25;
                    _os_log_error_impl(&dword_1BC5A9000, v27, OS_LOG_TYPE_ERROR, "Could not create key descriptor from %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v22 = [obj countByEnumeratingWithState:&v91 objects:v106 count:16];
            }
            while (v22);
          }

          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v30 = v72;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v87 objects:v105 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v88;
            unint64_t v34 = 0x1E4F1C000uLL;
            do
            {
              for (uint64_t k = 0; k != v32; ++k)
              {
                if (*(void *)v88 != v33) {
                  objc_enumerationMutation(v30);
                }
                long long v36 = *(void **)(*((void *)&v87 + 1) + 8 * k);
                long long v37 = [v30 objectForKeyedSubscript:v36];
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
                {
                  long long v38 = [objc_alloc(*(Class *)(v34 + 2488)) initWithBase64EncodedString:v37 options:0];
                  if (!v38)
                  {
                    unint64_t v39 = v34;
                    long long v40 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v102 = v37;
                      _os_log_error_impl(&dword_1BC5A9000, v40, OS_LOG_TYPE_ERROR, "Could not create change token from %@: not encoded correctly", buf, 0xCu);
                    }

                    unint64_t v34 = v39;
                  }
                  [v81 setObject:v38 forKeyedSubscript:v36];
                }
                else
                {
                  long long v38 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v102 = v36;
                    __int16 v103 = 2112;
                    v104 = v37;
                    _os_log_error_impl(&dword_1BC5A9000, v38, OS_LOG_TYPE_ERROR, "Could not create change token from %@ -> %@", buf, 0x16u);
                  }
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v87 objects:v105 count:16];
            }
            while (v32);
          }

          id *v79 = v12;
          id v10 = v75;
          id *v73 = v81;
          BOOL v13 = 1;
          id v9 = v77;
          id v14 = v71;
          long long v41 = obj;
          goto LABEL_67;
        }
      }
      else
      {
      }
      if (a6)
      {
        v65 = NSString;
        v66 = [v14 objectForKeyedSubscript:@"kd"];
        uint64_t v67 = objc_opt_class();
        v68 = [v14 objectForKeyedSubscript:@"ct"];
        long long v41 = [v65 stringWithFormat:@"Unknown format with key descriptor container of class %@ and change token container of class %@", v67, objc_opt_class()];

        id v53 = objc_opt_class();
        v107 = @"description";
        v108 = v41;
        id v54 = (void *)MEMORY[0x1E4F1C9E8];
        objc_super v55 = &v108;
        v56 = &v107;
        goto LABEL_66;
      }
    }
    else if (a6)
    {
      id v51 = NSString;
      uint64_t v52 = [v14 objectForKeyedSubscript:@"v"];
      long long v41 = [v51 stringWithFormat:@"Unknown format version %@", v52];

      id v53 = objc_opt_class();
      v109 = @"description";
      v110 = v41;
      id v54 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v55 = &v110;
      v56 = &v109;
LABEL_66:
      [v54 dictionaryWithObjects:v55 forKeys:v56 count:1];
      v69 = a6;
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      [v53 _argonKeyDatabaseErrorWithCode:5 userInfo:v30];
      BOOL v13 = 0;
      id *v69 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

LABEL_69:
LABEL_70:

      goto LABEL_71;
    }
    BOOL v13 = 0;
    goto LABEL_69;
  }
  uint64_t v11 = objc_opt_class();
  uint64_t v111 = *MEMORY[0x1E4F28A50];
  v112[0] = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:&v111 count:1];
  [v11 _argonKeyDatabaseErrorWithCode:4 userInfo:v12];
  BOOL v13 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_71:

  return v13;
}

+ (id)_argonKeyDatabaseErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"NTKArgonLocalKeyDatabaseErrorDomain" code:a3 userInfo:a4];
}

- (NSString)storagePath
{
  return self->_storagePath;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
}

- (NSMutableOrderedSet)persistedKeyDescriptors
{
  return self->_persistedKeyDescriptors;
}

- (NSMutableOrderedSet)newlyAddedKeyDescriptors
{
  return self->_newlyAddedKeyDescriptors;
}

- (NSMutableDictionary)persistedKeyDescriptorsByFileName
{
  return self->_persistedKeyDescriptorsByFileName;
}

- (NSMutableDictionary)newlyAddedKeyDescriptorsByFileName
{
  return self->_newlyAddedKeyDescriptorsByFileName;
}

- (NSMutableDictionary)persistedChangeTokens
{
  return self->_persistedChangeTokens;
}

- (NSMutableDictionary)newlyAddedChangeTokens
{
  return self->_newlyAddedChangeTokens;
}

- (unint64_t)nextFlushTime
{
  return self->_nextFlushTime;
}

- (void)setNextFlushTime:(unint64_t)a3
{
  self->_nextFlushTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newlyAddedChangeTokens, 0);
  objc_storeStrong((id *)&self->_persistedChangeTokens, 0);
  objc_storeStrong((id *)&self->_newlyAddedKeyDescriptorsByFileName, 0);
  objc_storeStrong((id *)&self->_persistedKeyDescriptorsByFileName, 0);
  objc_storeStrong((id *)&self->_newlyAddedKeyDescriptors, 0);
  objc_storeStrong((id *)&self->_persistedKeyDescriptors, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
}

- (void)initWithKeyStoragePath:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error loading key database at %@: %@");
}

- (void)initWithKeyStoragePath:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error decoding key database at %@: %@");
}

- (void)_queue_requestDelayedFlushWithMaximumTimeInterval:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_DEBUG, "Key Database: Flush request already in flight. Not enqueueing additional flush task.", v1, 2u);
}

@end