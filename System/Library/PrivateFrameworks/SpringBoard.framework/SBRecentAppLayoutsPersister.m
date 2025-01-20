@interface SBRecentAppLayoutsPersister
- (BOOL)initializedNewStoreOnDisk;
- (NSArray)recents;
- (SBRecentAppLayoutsPersister)initWithPersistenceURL:(id)a3;
- (id)_scheduledPersistTimer;
- (void)_enqueueDiskWrite;
- (void)_loadRecents;
- (void)_queue_writeCompressedProtobufRepresentationToDisk:(id)a3;
- (void)setRecents:(id)a3;
- (void)syncToDiskSoonIfDirty;
- (void)syncToDiskSynchronously;
@end

@implementation SBRecentAppLayoutsPersister

- (void)setRecents:(id)a3
{
  id v8 = a3;
  BSDispatchQueueAssertMain();
  if (![(NSArray *)self->_recents isEqualToArray:v8])
  {
    v4 = (NSArray *)[v8 copy];
    recents = self->_recents;
    self->_recents = v4;

    if (!self->_persistTimer)
    {
      v6 = [(SBRecentAppLayoutsPersister *)self _scheduledPersistTimer];
      persistTimer = self->_persistTimer;
      self->_persistTimer = v6;
    }
  }
}

- (id)_scheduledPersistTimer
{
  v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__persistTimerExpired_ selector:0 userInfo:0 repeats:10.0];
  [v2 setTolerance:5.0];
  return v2;
}

- (SBRecentAppLayoutsPersister)initWithPersistenceURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBRecentAppLayoutsPersister;
  v5 = [(SBRecentAppLayoutsPersister *)&v13 init];
  if (v5)
  {
    BSDispatchQueueAssertMain();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.springboard.SBRecentAppLayoutsPersistence.IOQueue", 0);
    ioQueue = v5->_ioQueue;
    v5->_ioQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [v4 copy];
    persistenceURL = v5->_persistenceURL;
    v5->_persistenceURL = (NSURL *)v8;

    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v11 = [(NSURL *)v5->_persistenceURL path];
    v5->_initializedNewStoreOnDisk = [v10 fileExistsAtPath:v11] ^ 1;

    [(SBRecentAppLayoutsPersister *)v5 _loadRecents];
  }

  return v5;
}

- (BOOL)initializedNewStoreOnDisk
{
  return self->_initializedNewStoreOnDisk;
}

- (void)syncToDiskSoonIfDirty
{
  BSDispatchQueueAssertMain();
  if (self->_persistTimer)
  {
    [(SBRecentAppLayoutsPersister *)self _enqueueDiskWrite];
  }
}

- (void)syncToDiskSynchronously
{
  BSDispatchQueueAssertMain();
  [(NSTimer *)self->_persistTimer invalidate];
  persistTimer = self->_persistTimer;
  self->_persistTimer = 0;

  id v4 = [(NSArray *)self->_recents bs_map:&__block_literal_global_105];
  ioQueue = self->_ioQueue;
  uint64_t v8 = v4;
  id v6 = v4;
  v7 = (void *)BSDispatchBlockCreateWithQualityOfService();
  dispatch_sync(ioQueue, v7);
}

uint64_t __54__SBRecentAppLayoutsPersister_syncToDiskSynchronously__block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobufRepresentation];
}

uint64_t __54__SBRecentAppLayoutsPersister_syncToDiskSynchronously__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_writeCompressedProtobufRepresentationToDisk:", *(void *)(a1 + 40));
}

- (void)_loadRecents
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __43__SBRecentAppLayoutsPersister__loadRecents__block_invoke;
  v40[3] = &unk_1E6AF4A70;
  v40[4] = self;
  v40[5] = a2;
  v3 = (void (**)(void))MEMORY[0x1D948C7A0](v40);
  v33 = self;
  persistenceURL = self->_persistenceURL;
  id v39 = 0;
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:persistenceURL options:0 error:&v39];
  id v6 = v39;
  if (v5)
  {
    id v38 = 0;
    v7 = [v5 decompressedDataUsingAlgorithm:0 error:&v38];
    uint64_t v8 = (NSURL *)v38;
    v9 = v8;
    if (v7)
    {
      v29 = v8;
      v31 = v5;
      v32 = v3;
      v30 = v7;
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F94090]) initWithData:v7];
      v11 = objc_alloc_init(SBPBAppLayoutList);
      v28 = (void *)v10;
      [(SBPBAppLayoutList *)v11 readFrom:v10];
      v12 = [MEMORY[0x1E4F1CA48] array];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v27 = v11;
      objc_super v13 = -[SBPBAppLayoutList applayouts]((uint64_t)v11);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(NSURL **)(*((void *)&v34 + 1) + 8 * i);
            v19 = +[SBAppLayout appLayoutWithProtobufRepresentation:v18];
            if (v19)
            {
              [v12 addObject:v19];
            }
            else
            {
              v20 = SBLogAppSwitcher();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v21 = _SBFLoggingMethodProem();
                *(_DWORD *)buf = 138543618;
                v43 = v21;
                __int16 v44 = 2114;
                v45 = v18;
                _os_log_error_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Couldn't derive app layout from Protobuf representation: %{public}@", buf, 0x16u);
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
        }
        while (v15);
      }

      [(SBRecentAppLayoutsPersister *)v33 setRecents:v12];
      v5 = v31;
      v3 = v32;
      v7 = v30;
      v9 = v29;
    }
    else
    {
      v23 = SBLogAppSwitcher();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v26 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543618;
        v43 = v26;
        __int16 v44 = 2114;
        v45 = v9;
        _os_log_error_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Error decompressing recents: %{public}@", buf, 0x16u);
      }
      v3[2](v3);
    }
  }
  else
  {
    v22 = SBLogAppSwitcher();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = _SBFLoggingMethodProem();
      v25 = v33->_persistenceURL;
      *(_DWORD *)buf = 138543874;
      v43 = v24;
      __int16 v44 = 2114;
      v45 = v25;
      __int16 v46 = 2114;
      id v47 = v6;
      _os_log_error_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Error reading recents from %{public}@: %{public}@", buf, 0x20u);
    }
    v3[2](v3);
  }
}

void __43__SBRecentAppLayoutsPersister__loadRecents__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = SBLogAppSwitcher();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "%{public}@ Using empty switcher model to recover from error with persisted switcher model", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setRecents:MEMORY[0x1E4F1CBF0]];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
  id v13 = 0;
  int v6 = [v4 removeItemAtURL:v5 error:&v13];
  id v7 = v13;

  uint64_t v8 = SBLogAppSwitcher();
  v9 = v8;
  if (!v6)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    uint64_t v10 = _SBFLoggingMethodProem();
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v12;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_error_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Error removing faulty switcher model from %{public}@: %{public}@", buf, 0x20u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = _SBFLoggingMethodProem();
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "%{public}@ Removed faulty switcher model from %{public}@", buf, 0x16u);
LABEL_6:
  }
LABEL_8:
}

- (void)_enqueueDiskWrite
{
  BSDispatchQueueAssertMain();
  [(NSTimer *)self->_persistTimer invalidate];
  persistTimer = self->_persistTimer;
  self->_persistTimer = 0;

  id v4 = [(NSArray *)self->_recents bs_map:&__block_literal_global_12];
  ioQueue = self->_ioQueue;
  uint64_t v8 = v4;
  id v6 = v4;
  id v7 = (void *)BSDispatchBlockCreateWithQualityOfService();
  dispatch_async(ioQueue, v7);
}

uint64_t __48__SBRecentAppLayoutsPersister__enqueueDiskWrite__block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobufRepresentation];
}

uint64_t __48__SBRecentAppLayoutsPersister__enqueueDiskWrite__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_writeCompressedProtobufRepresentationToDisk:", *(void *)(a1 + 40));
}

- (void)_queue_writeCompressedProtobufRepresentationToDisk:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  ioQueue = self->_ioQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(ioQueue);
  id v6 = objc_alloc_init(SBPBAppLayoutList);
  id v7 = (void *)[v5 mutableCopy];

  -[SBPBAppLayoutList setApplayouts:]((uint64_t)v6, v7);
  id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
  [(SBPBAppLayoutList *)v6 writeTo:v8];
  v9 = [v8 immutableData];
  id v20 = 0;
  uint64_t v10 = [v9 compressedDataUsingAlgorithm:0 error:&v20];
  uint64_t v11 = (NSURL *)v20;
  if (v10)
  {
    persistenceURL = self->_persistenceURL;
    id v19 = 0;
    char v13 = [v10 writeToURL:persistenceURL options:268435457 error:&v19];
    uint64_t v14 = v19;
    if ((v13 & 1) == 0)
    {
      uint64_t v15 = SBLogAppSwitcher();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = _SBFLoggingMethodProem();
        __int16 v18 = self->_persistenceURL;
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        __int16 v23 = 2112;
        v24 = v18;
        __int16 v25 = 2112;
        v26 = v14;
        _os_log_error_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Error writing recents to %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v14 = SBLogAppSwitcher();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      __int16 v23 = 2112;
      v24 = v11;
      _os_log_error_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Error compressing data: %@", buf, 0x16u);
    }
  }
}

- (NSArray)recents
{
  return self->_recents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_persistTimer, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end