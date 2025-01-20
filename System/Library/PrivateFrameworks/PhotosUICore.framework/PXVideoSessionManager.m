@interface PXVideoSessionManager
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoCrossfadeDuration;
+ (BOOL)isLivePhotoStabilizationEnabled;
+ (PXVideoSessionManager)sharedInstance;
- (NSArray)activeSessions;
- (NSString)description;
- (PXAVResourceReclamationController)resourceReclamationController;
- (PXVideoSessionManager)init;
- (PXVideoSessionManager)initWithResourceReclamationController:(id)a3;
- (id)checkOutReusableWrappedPlayer;
- (id)checkOutSessionWithContentProvider:(id)a3;
- (id)contentProviderForAsset:(id)a3 withOptions:(id)a4 mediaProvider:(id)a5 requestURLOnly:(BOOL)a6;
- (id)videoSessionForAsset:(id)a3 mediaProvider:(id)a4;
- (id)videoSessionForAsset:(id)a3 withOptions:(id)a4 mediaProvider:(id)a5;
- (void)_flushReusablePlayerPool;
- (void)_ivarQueue_flushReusablePlayerPool;
- (void)_updateCanStoreReusablePlayers;
- (void)checkInReusableWrappedPlayer:(id)a3;
- (void)checkInVideoSession:(id)a3;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXVideoSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_ivarQueue_sessionCounts, 0);
  objc_storeStrong((id *)&self->_ivarQueue_sessionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_ivarQueue_playerPool, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (void)_ivarQueue_flushReusablePlayerPool
{
}

- (void)_flushReusablePlayerPool
{
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PXVideoSessionManager__flushReusablePlayerPool__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

uint64_t __49__PXVideoSessionManager__flushReusablePlayerPool__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ivarQueue_flushReusablePlayerPool");
}

- (void)_updateCanStoreReusablePlayers
{
  v3 = +[PXApplicationState sharedState];
  BOOL v4 = [v3 visibilityState] != 3;

  ivarQueue = self->_ivarQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PXVideoSessionManager__updateCanStoreReusablePlayers__block_invoke;
  v6[3] = &unk_1E5DCFE98;
  v6[4] = self;
  BOOL v7 = v4;
  dispatch_async(ivarQueue, v6);
}

unsigned char *__55__PXVideoSessionManager__updateCanStoreReusablePlayers__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = *(unsigned char *)(a1 + 40);
  result = *(unsigned char **)(a1 + 32);
  if (!result[136]) {
    return (unsigned char *)objc_msgSend(result, "_ivarQueue_flushReusablePlayerPool");
  }
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ApplicationStateContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXVideoSessionManager.m" lineNumber:181 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXVideoSessionManager *)self _updateCanStoreReusablePlayers];
    id v9 = v11;
  }
}

- (void)checkInReusableWrappedPlayer:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 status] == 2)
  {
    v5 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v6 = [v4 error];
      int v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Dropping checked-in wrapped player because it's status is .failed. Error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [(PXReusableObjectPool *)self->_ivarQueue_playerPool checkInReusableObject:v4];
  }
}

- (id)checkOutReusableWrappedPlayer
{
  return (id)[(PXReusableObjectPool *)self->_ivarQueue_playerPool checkOutReusableObjectWithReuseIdentifier:42];
}

- (NSArray)activeSessions
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__56775;
  v10 = __Block_byref_object_dispose__56776;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PXVideoSessionManager_activeSessions__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __39__PXVideoSessionManager_activeSessions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__56775;
  v25 = __Block_byref_object_dispose__56776;
  id v26 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PXVideoSessionManager_description__block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  void block[5] = &v21;
  dispatch_sync(ivarQueue, block);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)v22[5];
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      v6 += v7;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) description];
        [v3 appendFormat:@"\t%@\n", v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v7);
  }

  id v11 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)PXVideoSessionManager;
  v12 = [(PXVideoSessionManager *)&v15 description];
  v13 = [v11 stringWithFormat:@"%@, %lu sessions:\n%@", v12, v6, v3];

  _Block_object_dispose(&v21, 8);
  return (NSString *)v13;
}

void __36__PXVideoSessionManager_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)checkInVideoSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    ivarQueue = self->_ivarQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke;
    v7[3] = &unk_1E5DD32A8;
    id v8 = v4;
    uint64_t v9 = self;
    dispatch_async(ivarQueue, v7);
  }
}

void __45__PXVideoSessionManager_checkInVideoSession___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contentProvider];
  uint64_t v3 = [v2 contentIdentifier];

  [*(id *)(*(void *)(a1 + 40) + 128) removeObject:v3];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 128) countForObject:v3];
  if (!v4) {
    [*(id *)(*(void *)(a1 + 40) + 120) removeObjectForKey:v3];
  }
  id v5 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_2;
  v15[3] = &unk_1E5DD0FA8;
  v15[4] = v5;
  [v5 performChanges:v15];
  if (!v4)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_3;
    v13[3] = &unk_1E5DB4558;
    id v14 = v6;
    [v14 performChanges:v13 withPresentationContext:1 presenter:0];
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 104);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_4;
    v10[3] = &unk_1E5DD32A8;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = v8;
    uint64_t v12 = v9;
    dispatch_async(v7, v10);
  }
}

uint64_t __45__PXVideoSessionManager_checkInVideoSession___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

void __45__PXVideoSessionManager_checkInVideoSession___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 setDesiredPlayState:0];
  id v3 = [*(id *)(a1 + 32) videoPlayer];
  [v3 replaceCurrentItemWithPlayerItem:0];
}

void __45__PXVideoSessionManager_checkInVideoSession___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) performFinalCleanup];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(NSObject **)(v3 + 96);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_5;
  v6[3] = &unk_1E5DD32A8;
  id v7 = v2;
  uint64_t v8 = v3;
  id v5 = v2;
  dispatch_async(v4, v6);
}

uint64_t __45__PXVideoSessionManager_checkInVideoSession___block_invoke_5(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = *(void *)(result + 40);
    if (*(unsigned char *)(v1 + 136)) {
      return objc_msgSend(*(id *)(v1 + 112), "checkInReusableObject:");
    }
  }
  return result;
}

- (id)checkOutSessionWithContentProvider:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contentIdentifier];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__56775;
  long long v19 = __Block_byref_object_dispose__56776;
  id v20 = 0;
  ivarQueue = self->_ivarQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke;
  v11[3] = &unk_1E5DCA7A8;
  v11[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v14 = &v15;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(ivarQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 112) checkOutReusableObjectWithReuseIdentifier:42];
    uint64_t v6 = [PXVideoSession alloc];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 32) resourceReclamationController];
    uint64_t v9 = [(PXVideoSession *)v6 initWithContentProvider:v7 videoPlayer:v5 resourceReclamationController:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [*(id *)(*(void *)(a1 + 32) + 120) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 40)];
  }
  [*(id *)(*(void *)(a1 + 32) + 128) addObject:*(void *)(a1 + 40)];
  id v12 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke_2;
  v14[3] = &unk_1E5DD0FA8;
  v14[4] = v12;
  return [v12 performChanges:v14];
}

uint64_t __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXVideoSessionManager;
  [(PXVideoSessionManager *)&v4 dealloc];
}

- (PXVideoSessionManager)initWithResourceReclamationController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoSessionManager;
  uint64_t v6 = [(PXVideoSessionManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceReclamationController, a3);
    [v5 registerObserver:v7];
    px_dispatch_queue_create_serial_with_priority();
  }

  return 0;
}

uint64_t __63__PXVideoSessionManager_initWithResourceReclamationController___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[PXApplicationState sharedState];
  [v2 registerChangeObserver:*(void *)(a1 + 32) context:ApplicationStateContext];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _updateCanStoreReusablePlayers];
}

id __63__PXVideoSessionManager_initWithResourceReclamationController___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F8EBD0]);
  return v0;
}

- (PXVideoSessionManager)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8EB70]);
  objc_super v4 = [(PXVideoSessionManager *)self initWithResourceReclamationController:v3];

  return v4;
}

+ (PXVideoSessionManager)sharedInstance
{
  if (sharedInstance_onceToken_56806 != -1) {
    dispatch_once(&sharedInstance_onceToken_56806, &__block_literal_global_56807);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_56808;
  return (PXVideoSessionManager *)v2;
}

void __39__PXVideoSessionManager_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init(PXVideoSessionManager);
  uint64_t v1 = (void *)sharedInstance_sharedInstance_56808;
  sharedInstance_sharedInstance_56808 = (uint64_t)v0;
}

- (id)contentProviderForAsset:(id)a3 withOptions:(id)a4 mediaProvider:(id)a5 requestURLOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6
    && (([v11 shouldCrossfadeLivePhotosWhenLooping] & 1) != 0
     || ([v11 shouldStabilizeLivePhotosIfPossible] & 1) != 0
     || ([v11 isAudioAllowed] & 1) == 0))
  {
    PXAssertGetLog();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 mediaType] != 1 || v6)
    {
      id v18 = v12;
      id v19 = v10;
      id v20 = [PXPhotoKitVideoContentProvider alloc];
      [v11 strategies];
      uint64_t v21 = v33 = v12;
      v22 = [v11 audioSession];
      uint64_t v23 = [(PXVideoSessionManager *)self resourceReclamationController];
      id v13 = [(PXPhotoKitVideoContentProvider *)v20 initWithAsset:v19 mediaProvider:v18 deliveryStrategies:v21 audioSession:v22 requestURLOnly:v6 resourceReclamationController:v23];

      id v12 = v33;
    }
    else if ([v11 shouldPlayLivePhotosWithSettlingEffectIfPossible])
    {
      id v13 = [[PXWallpaperAssetVideoContentProvider alloc] initWithWallpaperAsset:v10];
    }
    else
    {
      id v34 = v12;
      id v24 = v10;
      v25 = objc_alloc_init(PXPhotoKitLivePhotoVideoContentProviderSpec);
      if (v11)
      {
        [v11 livePhotoLoopTimeRange];
      }
      else
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v42 = 0u;
      }
      v41[0] = v42;
      v41[1] = v43;
      v41[2] = v44;
      [(PXPhotoKitLivePhotoVideoContentProviderSpec *)v25 setLoopTimeRange:v41];
      long long v39 = *MEMORY[0x1E4F1FA48];
      uint64_t v40 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [(PXPhotoKitLivePhotoVideoContentProviderSpec *)v25 setLoopStartTime:&v39];
      if ([v11 shouldCrossfadeLivePhotosWhenLooping])
      {
        id v26 = objc_opt_class();
        if (v26)
        {
          [v26 livePhotoCrossfadeDuration];
        }
        else
        {
          long long v37 = 0uLL;
          uint64_t v38 = 0;
        }
        long long v35 = v37;
        uint64_t v36 = v38;
        [(PXPhotoKitLivePhotoVideoContentProviderSpec *)v25 setCrossfadeDuration:&v35];
      }
      if ([v11 shouldStabilizeLivePhotosIfPossible]) {
        -[PXPhotoKitLivePhotoVideoContentProviderSpec setStabilizeIfPossible:](v25, "setStabilizeIfPossible:", [(id)objc_opt_class() isLivePhotoStabilizationEnabled]);
      }
      id v27 = v12;
      if ([v11 isAudioAllowed]) {
        [(PXPhotoKitLivePhotoVideoContentProviderSpec *)v25 setWantsAudio:1];
      }
      uint64_t v28 = [PXPhotoKitLivePhotoVideoContentProvider alloc];
      v29 = [v11 strategies];
      v30 = [v11 audioSession];
      v31 = [(PXVideoSessionManager *)self resourceReclamationController];
      id v13 = [(PXPhotoKitLivePhotoVideoContentProvider *)v28 initWithAsset:v24 mediaProvider:v34 deliveryStrategies:v29 audioSession:v30 spec:v25 resourceReclamationController:v31];

      id v12 = v27;
    }
  }
  else
  {
    id v14 = [PXDisplayAssetVideoContentProvider alloc];
    uint64_t v15 = [v11 strategies];
    long long v16 = [v11 audioSession];
    uint64_t v17 = [(PXVideoSessionManager *)self resourceReclamationController];
    id v13 = [(PXDisplayAssetVideoContentProvider *)v14 initWithAsset:v10 mediaProvider:v12 deliveryStrategies:v15 audioSession:v16 requestURLOnly:v6 resourceReclamationController:v17];
  }
  if ([v11 shouldCreateUniqueVideoSession]) {
    [(PXWallpaperAssetVideoContentProvider *)v13 makeUniqueContentIdentifier];
  }

  return v13;
}

- (id)videoSessionForAsset:(id)a3 withOptions:(id)a4 mediaProvider:(id)a5
{
  BOOL v6 = [(PXVideoSessionManager *)self contentProviderForAsset:a3 withOptions:a4 mediaProvider:a5 requestURLOnly:0];
  uint64_t v7 = [(PXVideoSessionManager *)self checkOutSessionWithContentProvider:v6];

  return v7;
}

- (id)videoSessionForAsset:(id)a3 mediaProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
  objc_super v9 = [(PXVideoSessionManager *)self videoSessionForAsset:v7 withOptions:v8 mediaProvider:v6];

  return v9;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoCrossfadeDuration
{
  id v6 = +[PXCuratedLibrarySettings sharedInstance];
  [v6 livePhotoLoopingCrossfadeDuration];
  CMTimeMakeWithSeconds((CMTime *)retstr, v4, 600);

  return result;
}

+ (BOOL)isLivePhotoStabilizationEnabled
{
  uint64_t v2 = +[PXCuratedLibrarySettings sharedInstance];
  char v3 = [v2 stabilizeLivePhotos];

  return v3;
}

@end