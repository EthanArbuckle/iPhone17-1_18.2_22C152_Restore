@interface VUIMPHomeShareMediaLibraryManager
+ (id)_sharedMPMediaLibraries;
- (NSArray)homeShareMediaLibraries;
- (NSMutableArray)mutableHomeShareMediaLibraries;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUIHomeShareMediaLibraryManagerDelegate)delegate;
- (VUIMPHomeShareMediaLibraryManager)initWithManager:(id)a3;
- (VUIMediaLibraryManager)manager;
- (id)_homeShareMediaLibraries;
- (void)_handleAvailableMediaLibrariesDidChange:(id)a3;
- (void)_notifyDelegateHomeShareMediaLibrariesDidUpdate:(id)a3 withChangeSet:(id)a4;
- (void)_updateMediaLibrariesWithSharedMPMediaLibraries:(id)a3;
- (void)beginDiscoveringMediaLibraries;
- (void)dealloc;
- (void)endDiscoveringMediaLibraries;
- (void)setDelegate:(id)a3;
- (void)setManager:(id)a3;
- (void)setMutableHomeShareMediaLibraries:(id)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
@end

@implementation VUIMPHomeShareMediaLibraryManager

- (void)setDelegate:(id)a3
{
}

- (VUIMPHomeShareMediaLibraryManager)initWithManager:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIMPHomeShareMediaLibraryManager;
  v5 = [(VUIMPHomeShareMediaLibraryManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_manager, v4);
    v7 = [(VUIMPHomeShareMediaLibraryManager *)v6 _homeShareMediaLibraries];
    uint64_t v8 = [v7 mutableCopy];
    mutableHomeShareMediaLibraries = v6->_mutableHomeShareMediaLibraries;
    v6->_mutableHomeShareMediaLibraries = (NSMutableArray *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.videosui.VUIMPHomeShareMediaLibraryManager.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v6->_serialProcessingDispatchQueue;
    v6->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v6 selector:sel__handleAvailableMediaLibrariesDidChange_ name:*MEMORY[0x1E4F31550] object:0];
  }
  return v6;
}

- (id)_homeShareMediaLibraries
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(id)objc_opt_class() _sharedMPMediaLibraries];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        dispatch_queue_t v10 = [VUIMPHomeShareMediaLibrary alloc];
        v11 = [(VUIMPHomeShareMediaLibraryManager *)self manager];
        v12 = [(VUIMPMediaLibrary *)v10 initWithMPMediaLibrary:v9 type:1 manager:v11];

        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)_sharedMPMediaLibraries
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F31940] sharedMediaLibraries];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"name" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v5 = [v2 sortedArrayUsingDescriptors:v4];

  return v5;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIMPHomeShareMediaLibraryManager;
  [(VUIMPHomeShareMediaLibraryManager *)&v4 dealloc];
}

- (NSArray)homeShareMediaLibraries
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__22;
  v11 = __Block_byref_object_dispose__22;
  id v12 = 0;
  id v3 = [(VUIMPHomeShareMediaLibraryManager *)self serialProcessingDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__VUIMPHomeShareMediaLibraryManager_homeShareMediaLibraries__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __60__VUIMPHomeShareMediaLibraryManager_homeShareMediaLibraries__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mutableHomeShareMediaLibraries];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)beginDiscoveringMediaLibraries
{
}

- (void)endDiscoveringMediaLibraries
{
}

- (void)_handleAvailableMediaLibrariesDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(VUIMPHomeShareMediaLibraryManager *)self serialProcessingDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__VUIMPHomeShareMediaLibraryManager__handleAvailableMediaLibrariesDidChange___block_invoke;
  v6[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __77__VUIMPHomeShareMediaLibraryManager__handleAvailableMediaLibrariesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [(id)objc_opt_class() _sharedMPMediaLibraries];
    [v3 _updateMediaLibrariesWithSharedMPMediaLibraries:v2];

    id WeakRetained = v3;
  }
}

- (void)_updateMediaLibrariesWithSharedMPMediaLibraries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIMPHomeShareMediaLibraryManager *)self mutableHomeShareMediaLibraries];
  uint64_t v6 = [(VUIMPHomeShareMediaLibraryManager *)self _homeShareMediaLibraries];
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v4;
    __int16 v14 = 2112;
    long long v15 = v6;
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIMPHomeShareMediaLibraryManager: Shared MP media libraries did change: %@. latestHomeShareMediaLibraries: %@, Current Libraries: %@", (uint8_t *)&v12, 0x20u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4FB3C58]);
  uint64_t v9 = [v8 changeSetFromObjects:v5 toObjects:v6 identifierBlock:&__block_literal_global_108 isEqualBlock:&__block_literal_global_16_1];
  objc_msgSend(v5, "vui_applyChangeSet:destinationObjects:", v9, v6);
  dispatch_queue_t v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    long long v15 = v9;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIMPHomeShareMediaLibraryManager: Updated home share media libraries : %@ using change set: %@", (uint8_t *)&v12, 0x16u);
  }

  v11 = (void *)[v5 copy];
  [(VUIMPHomeShareMediaLibraryManager *)self _notifyDelegateHomeShareMediaLibrariesDidUpdate:v11 withChangeSet:v9];
}

uint64_t __85__VUIMPHomeShareMediaLibraryManager__updateMediaLibrariesWithSharedMPMediaLibraries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __85__VUIMPHomeShareMediaLibraryManager__updateMediaLibrariesWithSharedMPMediaLibraries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 title];
  uint64_t v6 = [v4 title];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

- (void)_notifyDelegateHomeShareMediaLibrariesDidUpdate:(id)a3 withChangeSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VUIMPHomeShareMediaLibraryManager *)self delegate];
  [v8 homeShareManager:self mediaLibrariesDidUpdate:v7 withChangeSet:v6];
}

- (VUIHomeShareMediaLibraryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIHomeShareMediaLibraryManagerDelegate *)WeakRetained;
}

- (VUIMediaLibraryManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (VUIMediaLibraryManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (NSMutableArray)mutableHomeShareMediaLibraries
{
  return self->_mutableHomeShareMediaLibraries;
}

- (void)setMutableHomeShareMediaLibraries:(id)a3
{
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_mutableHomeShareMediaLibraries, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end