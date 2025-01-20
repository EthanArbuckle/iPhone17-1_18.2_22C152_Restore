@interface PXCPLPhotoLibrarySource
+ (id)sharedQueue;
- (BOOL)isCloudPhotosEnabled;
- (BOOL)isKeepOriginalsEnabled;
- (BOOL)isLocalModeEnabled;
- (BOOL)isRebuildingThumbnails;
- (NSProgress)postOpenProgress;
- (OS_dispatch_queue)sharedQueue;
- (PHPhotoLibrary)photoLibrary;
- (PLCPLSettingsObserver)cplSettingsObserver;
- (PXCPLPhotoLibrarySource)init;
- (PXCPLPhotoLibrarySource)initWithPhotoLibrary:(id)a3;
- (float)fractionCompletedForRebuild;
- (void)_logChanges;
- (void)_queue_resolveSettings;
- (void)_queue_subscribeToPostOpenProgressForPhotoLibrary:(id)a3;
- (void)_removePostOpenProgressObserverIfNeeded;
- (void)_updateFractionCompletedForRebuild;
- (void)_updateIsCloudPhotosEnabled:(BOOL)a3;
- (void)_updateIsKeepOriginalsEnabled:(BOOL)a3;
- (void)_updateIsLocalModeEnabled;
- (void)_updateIsRebuildingThumbnails;
- (void)cplSettingsDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFractionCompletedForRebuild:(float)a3;
- (void)setIsCloudPhotosEnabled:(BOOL)a3;
- (void)setIsKeepOriginalsEnabled:(BOOL)a3;
- (void)setIsLocalModeEnabled:(BOOL)a3;
- (void)setIsRebuildingThumbnails:(BOOL)a3;
- (void)setPostOpenProgress:(id)a3;
- (void)setSharedQueue:(id)a3;
@end

@implementation PXCPLPhotoLibrarySource

- (BOOL)isCloudPhotosEnabled
{
  return self->_isCloudPhotosEnabled;
}

- (PXCPLPhotoLibrarySource)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXCPLPhotoLibrarySource.m", 72, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)PXCPLPhotoLibrarySource;
  v7 = [(PXCPLPhotoLibrarySource *)&v26 init];
  v8 = v7;
  if (v7)
  {
    p_photoLibrary = (void **)&v7->_photoLibrary;
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    id v10 = objc_alloc(MEMORY[0x1E4F8A6C8]);
    v11 = [v6 photoLibraryBundle];
    uint64_t v12 = [v10 initWithLibraryBundle:v11];
    cplSettingsObserver = v8->_cplSettingsObserver;
    v8->_cplSettingsObserver = (PLCPLSettingsObserver *)v12;

    [(PLCPLSettingsObserver *)v8->_cplSettingsObserver setDelegate:v8];
    v8->_isCloudPhotosEnabled = [(PLCPLSettingsObserver *)v8->_cplSettingsObserver isCloudPhotoLibraryEnabled];
    v8->_isLocalModeEnabled = _IsLocalModeEnabled(*p_photoLibrary);
    v8->_percentCompletedForRebuild = -1;
    v14 = [*p_photoLibrary pathManager];
    v8->_isRebuildingThumbnails = [MEMORY[0x1E4F8AC48] hasRebuildingThumbnailsIndicatorAndRebuildingWithPathManager:v14];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_systemPhotoLibraryURLDidChange, (CFStringRef)objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(MEMORY[0x1E4F39228], "systemPhotoLibraryURLChangeNotificationName")), 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_localModeEnabledDidChange, (CFStringRef)*MEMORY[0x1E4F8AD50], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_thumbnailRebuildDidStop, (CFStringRef)[NSString stringWithUTF8String:*MEMORY[0x1E4F8B780]], 0, (CFNotificationSuspensionBehavior)1024);
    uint64_t v16 = +[PXCPLPhotoLibrarySource sharedQueue];
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v16;

    objc_initWeak(&location, v8);
    v18 = v8->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PXCPLPhotoLibrarySource_initWithPhotoLibrary___block_invoke;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v24, &location);
    id v23 = v6;
    dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(v18, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v8;
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken_210048 != -1) {
    dispatch_once(&sharedQueue_onceToken_210048, &__block_literal_global_210049);
  }
  v2 = (void *)sharedQueue_sharedQueue_210050;
  return v2;
}

void __38__PXCPLPhotoLibrarySource_sharedQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.PXCPLPhotoLibrarySource", attr);
  v3 = (void *)sharedQueue_sharedQueue_210050;
  sharedQueue_sharedQueue_210050 = (uint64_t)v2;

  v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleMainQueueTask:&__block_literal_global_193_210054];
}

- (void)_queue_resolveSettings
{
  v3 = [(PLCPLSettingsObserver *)self->_cplSettingsObserver settings];
  char v4 = [v3 isKeepOriginalsEnabled];

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PXCPLPhotoLibrarySource__queue_resolveSettings__block_invoke;
  block[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v6, &location);
  char v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postOpenProgress, 0);
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_cplSettingsObserver, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)setPostOpenProgress:(id)a3
{
}

- (NSProgress)postOpenProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSharedQueue:(id)a3
{
}

- (OS_dispatch_queue)sharedQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)isRebuildingThumbnails
{
  return self->_isRebuildingThumbnails;
}

- (BOOL)isKeepOriginalsEnabled
{
  return self->_isKeepOriginalsEnabled;
}

- (BOOL)isLocalModeEnabled
{
  return self->_isLocalModeEnabled;
}

- (PLCPLSettingsObserver)cplSettingsObserver
{
  return self->_cplSettingsObserver;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_PostOpenProgressObservationContext == a6)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXCPLPhotoLibrarySource_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCPLPhotoLibrarySource;
    -[PXCPLPhotoLibrarySource observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __74__PXCPLPhotoLibrarySource_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFractionCompletedForRebuild];
}

- (void)cplSettingsDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PXCPLPhotoLibrarySource_cplSettingsDidChange___block_invoke;
  v6[3] = &unk_1E5DD32A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __48__PXCPLPhotoLibrarySource_cplSettingsDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateIsCloudPhotosEnabled:", objc_msgSend(*(id *)(a1 + 40), "isCloudPhotoLibraryEnabled"));
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) settings];
  objc_msgSend(v2, "_updateIsKeepOriginalsEnabled:", objc_msgSend(v3, "isKeepOriginalsEnabled"));
}

- (void)_logChanges
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(PXCPLPhotoLibrarySource *)self currentChanges])
  {
    id v3 = PLUserStatusGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isCloudPhotosEnabled = self->_isCloudPhotosEnabled;
      BOOL isLocalModeEnabled = self->_isLocalModeEnabled;
      BOOL isKeepOriginalsEnabled = self->_isKeepOriginalsEnabled;
      id v7 = _DescriptionForPercentCompleted(self->_percentCompletedForRebuild);
      BOOL isRebuildingThumbnails = self->_isRebuildingThumbnails;
      int v9 = 138544642;
      id v10 = self;
      __int16 v11 = 1024;
      BOOL v12 = isCloudPhotosEnabled;
      __int16 v13 = 1024;
      BOOL v14 = isLocalModeEnabled;
      __int16 v15 = 1024;
      BOOL v16 = isKeepOriginalsEnabled;
      __int16 v17 = 2112;
      v18 = v7;
      __int16 v19 = 1024;
      BOOL v20 = isRebuildingThumbnails;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ IsCloudPhotosEnabled: %d, IsLocalModeEnabled: %d, IsKeepOriginalsEnabled: %d, FractionCompletedForRebuild: %@, IsRebuildingThumbnails: %d (new)", (uint8_t *)&v9, 0x2Eu);
    }
  }
}

- (void)_updateIsRebuildingThumbnails
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PXCPLPhotoLibrarySource__updateIsRebuildingThumbnails__block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXCPLPhotoLibrarySource *)self performChanges:v3];
}

uint64_t __56__PXCPLPhotoLibrarySource__updateIsRebuildingThumbnails__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsRebuildingThumbnails:0];
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  return [v2 _logChanges];
}

- (void)_updateFractionCompletedForRebuild
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(PXCPLPhotoLibrarySource *)self postOpenProgress];
  [v3 fractionCompleted];
  BOOL v5 = v4 >= 1.0 || v4 <= 0.0;
  float v6 = v4;
  uint64_t v9 = 3221225472;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  id v10 = __61__PXCPLPhotoLibrarySource__updateFractionCompletedForRebuild__block_invoke;
  __int16 v11 = &unk_1E5DCCD70;
  if (v5) {
    float v6 = -1.0;
  }
  BOOL v12 = self;
  float v13 = v6;
  [(PXCPLPhotoLibrarySource *)self performChanges:&v8];
  if (objc_msgSend(v3, "isFinished", v8, v9, v10, v11))
  {
    id v7 = PLUserStatusGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v15 = self;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Post-open progress finished", buf, 0xCu);
    }

    [(PXCPLPhotoLibrarySource *)self _removePostOpenProgressObserverIfNeeded];
  }
}

uint64_t __61__PXCPLPhotoLibrarySource__updateFractionCompletedForRebuild__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) setFractionCompletedForRebuild:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 _logChanges];
}

- (void)_updateIsKeepOriginalsEnabled:(BOOL)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PXCPLPhotoLibrarySource__updateIsKeepOriginalsEnabled___block_invoke;
  v5[3] = &unk_1E5DCEB78;
  v5[4] = self;
  BOOL v6 = a3;
  [(PXCPLPhotoLibrarySource *)self performChanges:v5];
}

uint64_t __57__PXCPLPhotoLibrarySource__updateIsKeepOriginalsEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsKeepOriginalsEnabled:*(unsigned __int8 *)(a1 + 40)];
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  return [v2 _logChanges];
}

- (void)_updateIsLocalModeEnabled
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  char IsLocalModeEnabled = _IsLocalModeEnabled(self->_photoLibrary);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PXCPLPhotoLibrarySource__updateIsLocalModeEnabled__block_invoke;
  v4[3] = &unk_1E5DCEB78;
  v4[4] = self;
  char v5 = IsLocalModeEnabled;
  [(PXCPLPhotoLibrarySource *)self performChanges:v4];
}

uint64_t __52__PXCPLPhotoLibrarySource__updateIsLocalModeEnabled__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsLocalModeEnabled:*(unsigned __int8 *)(a1 + 40)];
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  return [v2 _logChanges];
}

- (void)_updateIsCloudPhotosEnabled:(BOOL)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PXCPLPhotoLibrarySource__updateIsCloudPhotosEnabled___block_invoke;
  v5[3] = &unk_1E5DCEB78;
  v5[4] = self;
  BOOL v6 = a3;
  [(PXCPLPhotoLibrarySource *)self performChanges:v5];
}

void __55__PXCPLPhotoLibrarySource__updateIsCloudPhotosEnabled___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setIsCloudPhotosEnabled:*(unsigned __int8 *)(a1 + 40)];
  if ([*(id *)(a1 + 32) currentChanges])
  {
    dispatch_queue_t v2 = PLUserStatusGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v4 = *(unsigned __int8 *)(v3 + 112);
      int v5 = *(unsigned __int8 *)(v3 + 113);
      BOOL v6 = _DescriptionForPercentCompleted(*(void *)(v3 + 104));
      int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 115);
      int v8 = 138544386;
      uint64_t v9 = v3;
      __int16 v10 = 1024;
      int v11 = v4;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 2112;
      __int16 v15 = v6;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ IsCloudPhotosEnabled: %d (new), IsLocalModeEnabled: %d, FractionCompletedForRebuild: %@, IsRebuildingThumbnails: %d", (uint8_t *)&v8, 0x28u);
    }
  }
}

void __49__PXCPLPhotoLibrarySource__queue_resolveSettings__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIsKeepOriginalsEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_removePostOpenProgressObserverIfNeeded
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXCPLPhotoLibrarySource *)self postOpenProgress];
  [(PXCPLPhotoLibrarySource *)self setPostOpenProgress:0];
  if (v3)
  {
    int v4 = PLUserStatusGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      BOOL v6 = self;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsubscribing from post-open progress", (uint8_t *)&v5, 0xCu);
    }

    [v3 removeObserver:self forKeyPath:@"fractionCompleted" context:_PostOpenProgressObservationContext];
  }
}

- (void)_queue_subscribeToPostOpenProgressForPhotoLibrary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v5)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCPLPhotoLibrarySource.m", 171, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  BOOL v6 = [v5 postOpenProgress];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v9 = PLUserStatusGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v16 = self;
      int v11 = "%{public}@ No post-open progress - bailing out";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_14;
  }
  int v8 = [v6 isFinished];
  uint64_t v9 = PLUserStatusGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      __int16 v16 = self;
      int v11 = "%{public}@ Post-open progress already finished - bailing out";
LABEL_9:
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138543362;
    __int16 v16 = self;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribing to post-open progress", buf, 0xCu);
  }

  [v7 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:_PostOpenProgressObservationContext];
  [(PXCPLPhotoLibrarySource *)self setPostOpenProgress:v7];
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXCPLPhotoLibrarySource__queue_subscribeToPostOpenProgressForPhotoLibrary___block_invoke;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
LABEL_14:
}

void __77__PXCPLPhotoLibrarySource__queue_subscribeToPostOpenProgressForPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFractionCompletedForRebuild];
}

- (void)setIsRebuildingThumbnails:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_isRebuildingThumbnails != v3)
  {
    self->_BOOL isRebuildingThumbnails = v3;
    [(PXCPLPhotoLibrarySource *)self signalChange:8];
  }
}

- (void)setFractionCompletedForRebuild:(float)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ((a3 > 1.0 || a3 < 0.0) && a3 != -1.0) {
    PXAssertGetLog();
  }
  int64_t v7 = -1;
  uint64_t v8 = vcvtps_s32_f32(a3 * 100.0);
  if (v8 >= 100) {
    uint64_t v8 = 100;
  }
  if (a3 >= 0.0) {
    int64_t v7 = v8;
  }
  if (self->_percentCompletedForRebuild != v7)
  {
    self->_percentCompletedForRebuild = v7;
    [(PXCPLPhotoLibrarySource *)self signalChange:4];
  }
}

- (void)setIsKeepOriginalsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_isKeepOriginalsEnabled != v3)
  {
    self->_BOOL isKeepOriginalsEnabled = v3;
    [(PXCPLPhotoLibrarySource *)self signalChange:16];
  }
}

- (void)setIsLocalModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_isLocalModeEnabled != v3)
  {
    self->_BOOL isLocalModeEnabled = v3;
    [(PXCPLPhotoLibrarySource *)self signalChange:2];
  }
}

- (void)setIsCloudPhotosEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_isCloudPhotosEnabled != v3)
  {
    self->_BOOL isCloudPhotosEnabled = v3;
    [(PXCPLPhotoLibrarySource *)self signalChange:1];
  }
}

- (float)fractionCompletedForRebuild
{
  int64_t percentCompletedForRebuild = self->_percentCompletedForRebuild;
  if (percentCompletedForRebuild < 0) {
    return -1.0;
  }
  float result = (double)percentCompletedForRebuild / 100.0;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (void)dealloc
{
  [(PXCPLPhotoLibrarySource *)self _removePostOpenProgressObserverIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)PXCPLPhotoLibrarySource;
  [(PXCPLPhotoLibrarySource *)&v3 dealloc];
}

void __48__PXCPLPhotoLibrarySource_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_subscribeToPostOpenProgressForPhotoLibrary:", *(void *)(a1 + 32));

  id v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_queue_resolveSettings");
}

- (PXCPLPhotoLibrarySource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCPLPhotoLibrarySource.m", 68, @"%s is not available as initializer", "-[PXCPLPhotoLibrarySource init]");

  abort();
}

void __38__PXCPLPhotoLibrarySource_sharedQueue__block_invoke_2()
{
}

@end