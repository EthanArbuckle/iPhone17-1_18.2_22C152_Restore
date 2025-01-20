@interface VUIMediaLibraryManager
+ (id)defaultManager;
+ (void)setDeleteAllVideosAndKeysOnInitializationForAppRemoval:(BOOL)a3;
- (NSArray)homeShareMediaLibraries;
- (OS_dispatch_queue)completionDispatchQueue;
- (OS_dispatch_queue)serialProcessingDispatchQueue;
- (VUIAggregateMediaLibrary)aggregateMediaLibrary;
- (VUIDeviceMediaLibrary)deviceMediaLibrary;
- (VUIHomeShareMediaLibraryManager)homeShareManager;
- (VUIMediaLibrary)activeMediaLibrary;
- (VUIMediaLibraryManager)init;
- (VUISidebandMediaLibrary)sidebandMediaLibrary;
- (id)_deviceMediaLibrary;
- (id)_homeShareMediaLibraryManager;
- (id)_mediaLibraryForIdentifier:(id)a3;
- (id)mediaLibraryForIdentifier:(id)a3;
- (void)_enqueueCompletionQueueBlock:(id)a3;
- (void)_enqueueStrongSelfCompletionQueueBlock:(id)a3;
- (void)_postHomeShareMediaLibrariesDidChangeNotificationWithMediaLibraries:(id)a3 andChangeSet:(id)a4;
- (void)beginDiscoveringHomeShareMediaLibraries;
- (void)endDiscoveringHomeShareMediaLibraries;
- (void)homeShareManager:(id)a3 mediaLibrariesDidUpdate:(id)a4 withChangeSet:(id)a5;
- (void)setActiveMediaLibrary:(id)a3;
- (void)setAggregateMediaLibrary:(id)a3;
- (void)setCompletionDispatchQueue:(id)a3;
- (void)setDeviceMediaLibrary:(id)a3;
- (void)setHomeShareManager:(id)a3;
- (void)setSerialProcessingDispatchQueue:(id)a3;
- (void)setSidebandMediaLibrary:(id)a3;
@end

@implementation VUIMediaLibraryManager

uint64_t __55__VUIMediaLibraryManager__enqueueCompletionQueueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (VUIDeviceMediaLibrary)deviceMediaLibrary
{
  return self->_deviceMediaLibrary;
}

void __49__VUIMediaLibraryManager_completionDispatchQueue__block_invoke(uint64_t a1)
{
}

- (void)_enqueueCompletionQueueBlock:(id)a3
{
  id v4 = a3;
  v5 = [(VUIMediaLibraryManager *)self completionDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VUIMediaLibraryManager__enqueueCompletionQueueBlock___block_invoke;
  block[3] = &unk_1E6DF3DD0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (OS_dispatch_queue)completionDispatchQueue
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  v3 = [(VUIMediaLibraryManager *)self serialProcessingDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__VUIMediaLibraryManager_completionDispatchQueue__block_invoke;
  v6[3] = &unk_1E6DF4B00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (OS_dispatch_queue *)v4;
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

+ (id)defaultManager
{
  if (defaultManager___once != -1) {
    dispatch_once(&defaultManager___once, &__block_literal_global_69);
  }
  v2 = (void *)defaultManager___defaultManager;
  return v2;
}

- (VUISidebandMediaLibrary)sidebandMediaLibrary
{
  return self->_sidebandMediaLibrary;
}

void __40__VUIMediaLibraryManager_defaultManager__block_invoke()
{
  v0 = VUISignpostLogObject();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MediaLibraryManager.Init", "", buf, 2u);
  }

  v1 = objc_alloc_init(VUIMediaLibraryManager);
  v2 = (void *)defaultManager___defaultManager;
  defaultManager___defaultManager = (uint64_t)v1;

  v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MediaLibraryManager.Init", "", v4, 2u);
  }
}

- (VUIMediaLibraryManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)VUIMediaLibraryManager;
  v2 = [(VUIMediaLibraryManager *)&v24 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_completionDispatchQueue, MEMORY[0x1E4F14428]);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.videosui.VUIMediaLibraryManager.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v3->_serialProcessingDispatchQueue;
    v3->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v4;

    id v6 = VUISignpostLogObject();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SidebandMediaLibrary.Init", "", v23, 2u);
    }

    uint64_t v7 = [[VUISidebandMediaLibrary alloc] initWithManager:v3];
    sidebandMediaLibrary = v3->_sidebandMediaLibrary;
    v3->_sidebandMediaLibrary = v7;

    uint64_t v9 = VUISignpostLogObject();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SidebandMediaLibrary.Init", "", v23, 2u);
    }

    v10 = VUISignpostLogObject();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.Init", "", v23, 2u);
    }

    uint64_t v11 = [(VUIMediaLibraryManager *)v3 _deviceMediaLibrary];
    deviceMediaLibrary = v3->_deviceMediaLibrary;
    v3->_deviceMediaLibrary = (VUIDeviceMediaLibrary *)v11;

    v13 = VUISignpostLogObject();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.Init", "", v23, 2u);
    }

    v14 = VUISignpostLogObject();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AggregateMediaLibrary.Init", "", v23, 2u);
    }

    v15 = [[VUIAggregateMediaLibrary alloc] initWithManager:v3 deviceMediaLibrary:v3->_deviceMediaLibrary sidebandMediaLibrary:v3->_sidebandMediaLibrary];
    aggregateMediaLibrary = v3->_aggregateMediaLibrary;
    v3->_aggregateMediaLibrary = v15;

    v17 = VUISignpostLogObject();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AggregateMediaLibrary.Init", "", v23, 2u);
    }

    v18 = VUISignpostLogObject();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HomeShareManager.Init", "", v23, 2u);
    }

    uint64_t v19 = [(VUIMediaLibraryManager *)v3 _homeShareMediaLibraryManager];
    homeShareManager = v3->_homeShareManager;
    v3->_homeShareManager = (VUIHomeShareMediaLibraryManager *)v19;

    v21 = VUISignpostLogObject();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HomeShareManager.Init", "", v23, 2u);
    }

    [(VUIHomeShareMediaLibraryManager *)v3->_homeShareManager setDelegate:v3];
  }
  return v3;
}

- (id)_homeShareMediaLibraryManager
{
  v3 = (void *)CFPreferencesCopyAppValue(@"UseTVHomeSharing", @"com.apple.VideosUI");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 BOOLValue];
  }
  dispatch_queue_t v4 = [[VUIMPHomeShareMediaLibraryManager alloc] initWithManager:self];

  return v4;
}

- (id)_deviceMediaLibrary
{
  v3 = (void *)CFPreferencesCopyAppValue(@"PlistDatabasePath", @"com.apple.VideosUI");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_queue_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    v5 = [[VUIPlistMediaLibrary alloc] initWithURL:v4 manager:self];
  }
  else
  {
    v5 = [[VUIMPDeviceMediaLibrary alloc] initWithManager:self];
  }

  return v5;
}

+ (void)setDeleteAllVideosAndKeysOnInitializationForAppRemoval:(BOOL)a3
{
}

- (void)setCompletionDispatchQueue:(id)a3
{
  id v4 = a3;
  v5 = [(VUIMediaLibraryManager *)self serialProcessingDispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__VUIMediaLibraryManager_setCompletionDispatchQueue___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __53__VUIMediaLibraryManager_setCompletionDispatchQueue___block_invoke(uint64_t a1)
{
}

- (NSArray)homeShareMediaLibraries
{
  v2 = [(VUIMediaLibraryManager *)self homeShareManager];
  v3 = [v2 homeShareMediaLibraries];

  return (NSArray *)v3;
}

- (void)beginDiscoveringHomeShareMediaLibraries
{
  id v2 = [(VUIMediaLibraryManager *)self homeShareManager];
  [v2 beginDiscoveringMediaLibraries];
}

- (void)endDiscoveringHomeShareMediaLibraries
{
  id v2 = [(VUIMediaLibraryManager *)self homeShareManager];
  [v2 endDiscoveringMediaLibraries];
}

- (id)mediaLibraryForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  v5 = [(VUIMediaLibraryManager *)self serialProcessingDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VUIMediaLibraryManager_mediaLibraryForIdentifier___block_invoke;
  block[3] = &unk_1E6DF4B78;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__VUIMediaLibraryManager_mediaLibraryForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _mediaLibraryForIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)homeShareManager:(id)a3 mediaLibrariesDidUpdate:(id)a4 withChangeSet:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__VUIMediaLibraryManager_homeShareManager_mediaLibrariesDidUpdate_withChangeSet___block_invoke;
  v11[3] = &unk_1E6DF8010;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(VUIMediaLibraryManager *)self _enqueueStrongSelfCompletionQueueBlock:v11];
}

void __81__VUIMediaLibraryManager_homeShareManager_mediaLibrariesDidUpdate_withChangeSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 willChangeValueForKey:@"homeShareMediaLibraries"];
  [v3 didChangeValueForKey:@"homeShareMediaLibraries"];
  [v3 _postHomeShareMediaLibrariesDidChangeNotificationWithMediaLibraries:*(void *)(a1 + 32) andChangeSet:*(void *)(a1 + 40)];
}

- (void)_enqueueStrongSelfCompletionQueueBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__VUIMediaLibraryManager__enqueueStrongSelfCompletionQueueBlock___block_invoke;
  v6[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(VUIMediaLibraryManager *)self _enqueueCompletionQueueBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__VUIMediaLibraryManager__enqueueStrongSelfCompletionQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (id)_mediaLibraryForIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"identifier" format];
  }
  id v5 = [(VUIMediaLibraryManager *)self deviceMediaLibrary];
  id v6 = [(VUIMediaLibraryManager *)self homeShareMediaLibraries];
  id v7 = (void *)[v6 mutableCopy];

  [v7 addObject:v5];
  id v8 = [(VUIMediaLibraryManager *)self sidebandMediaLibrary];
  if (v8) {
    [v7 addObject:v8];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [v13 identifier];
        int v15 = [v14 isEqual:v4];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_15;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v10;
}

- (void)_postHomeShareMediaLibrariesDidChangeNotificationWithMediaLibraries:(id)a3 andChangeSet:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v10 = objc_alloc_init(v6);
  objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v8, @"VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyMediaLibraries");

  objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v7, @"VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyChangeSet");
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"VUIMediaLibraryManagerHomeSharesDidChangeNotification" object:self userInfo:v10];
}

- (VUIMediaLibrary)activeMediaLibrary
{
  return self->_activeMediaLibrary;
}

- (void)setActiveMediaLibrary:(id)a3
{
}

- (void)setDeviceMediaLibrary:(id)a3
{
}

- (void)setSidebandMediaLibrary:(id)a3
{
}

- (VUIAggregateMediaLibrary)aggregateMediaLibrary
{
  return self->_aggregateMediaLibrary;
}

- (void)setAggregateMediaLibrary:(id)a3
{
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
}

- (VUIHomeShareMediaLibraryManager)homeShareManager
{
  return self->_homeShareManager;
}

- (void)setHomeShareManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeShareManager, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_aggregateMediaLibrary, 0);
  objc_storeStrong((id *)&self->_sidebandMediaLibrary, 0);
  objc_storeStrong((id *)&self->_deviceMediaLibrary, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeMediaLibrary, 0);
}

@end