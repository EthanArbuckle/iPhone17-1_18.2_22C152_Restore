@interface PXCPLSharedLibraryActivity
+ (OS_dispatch_queue)sharedQueue;
- (PHPhotoLibrary)photoLibrary;
- (PXCPLSharedLibraryActivity)init;
- (PXCPLSharedLibraryActivity)initWithPhotoLibrary:(id)a3;
- (int64_t)state;
- (unint64_t)movingToPersonal;
- (unint64_t)movingToShared;
- (void)_queue_fetchLibraryScopeForPhotoLibrary:(id)a3;
- (void)_queue_handleCloudStatusCounts:(id)a3 error:(id)a4 libraryScope:(id)a5;
- (void)_queue_updateScopeStatusCounts;
- (void)_setMovingToShared:(unint64_t)a3 movingToPersonal:(unint64_t)a4;
- (void)_setState:(int64_t)a3;
- (void)_updateScopeStatusCounts;
- (void)photoLibraryDidChange:(id)a3;
- (void)setMovingToPersonal:(unint64_t)a3;
- (void)setMovingToShared:(unint64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation PXCPLSharedLibraryActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryScopeFetchResult, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (unint64_t)movingToPersonal
{
  return self->_movingToPersonal;
}

- (unint64_t)movingToShared
{
  return self->_movingToShared;
}

- (int64_t)state
{
  return self->_state;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)_updateScopeStatusCounts
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PXCPLSharedLibraryActivity__updateScopeStatusCounts__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__PXCPLSharedLibraryActivity__updateScopeStatusCounts__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateScopeStatusCounts");
}

- (void)_queue_updateScopeStatusCounts
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v3 = [(PHFetchResult *)self->_libraryScopeFetchResult firstObject];
  v4 = v3;
  if (v3)
  {
    if (![v3 exitState])
    {
      objc_initWeak(buf, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke;
      v7[3] = &unk_1E5DBFAB0;
      v7[4] = self;
      objc_copyWeak(&v9, buf);
      id v8 = v4;
      [v8 getCloudStatusCountsWithCompletionHandler:v7];

      objc_destroyWeak(&v9);
      objc_destroyWeak(buf);
      goto LABEL_10;
    }
    id v5 = PLUserStatusGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v6 = "PXCPLSharedLibraryActivity: Library scope is exiting when fetching scope status counts - bailing out";
LABEL_7:
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    id v5 = PLUserStatusGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v6 = "PXCPLSharedLibraryActivity: No library scope available for fetching scope status counts - bailing out";
      goto LABEL_7;
    }
  }

LABEL_10:
}

void __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke_2;
  v10[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_queue_handleCloudStatusCounts:error:libraryScope:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_handleCloudStatusCounts:(id)a3 error:(id)a4 libraryScope:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v11 = [(PHFetchResult *)self->_libraryScopeFetchResult firstObject];
  if (v11 != v10)
  {
    id v12 = PLUserStatusGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "PXCPLSharedLibraryActivity: Library scope changed while fetching scope status counts - bailing out";
LABEL_9:
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v14 = v10;
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"BOOL _IsExiting(PHLibraryScope *__strong)"];
    [v19 handleFailureInFunction:v20, @"PXCPLSharedLibraryActivity.m", 132, @"Invalid parameter not satisfying: %@", @"libraryScope" file lineNumber description];
  }
  uint64_t v15 = [v14 exitState];

  if (v15)
  {
    id v12 = PLUserStatusGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "PXCPLSharedLibraryActivity: Library scope is exiting after fetching scope status counts - bailing out";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v8)
  {
    v16 = (void *)[v8 countOfSharingRecords];
    v17 = (void *)[v8 countOfUnsharingRecords];
  }
  else
  {
    v18 = PLUserStatusGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "PXCPLSharedLibraryActivity: Failed to fetch scope status counts: %@", buf, 0xCu);
    }

    v16 = 0;
    v17 = 0;
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXCPLSharedLibraryActivity__queue_handleCloudStatusCounts_error_libraryScope___block_invoke;
  block[3] = &unk_1E5DBFA88;
  objc_copyWeak(v22, (id *)buf);
  v22[1] = v16;
  v22[2] = v17;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
LABEL_11:
}

void __80__PXCPLSharedLibraryActivity__queue_handleCloudStatusCounts_error_libraryScope___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setMovingToShared:*(void *)(a1 + 40) movingToPersonal:*(void *)(a1 + 48)];
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) changeDetailsForFetchResult:*(void *)(*(void *)(a1 + 40) + 104)];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 fetchResultAfterChanges];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v4;

    objc_initWeak(&location, *(id *)(a1 + 40));
    Result = (void *)_StateForLibraryScopeFetchResult(*(void **)(*(void *)(a1 + 40) + 104));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke_2;
    block[3] = &unk_1E5DD0260;
    objc_copyWeak(v9, &location);
    v9[1] = Result;
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setState:*(void *)(a1 + 40)];
}

- (void)_setMovingToShared:(unint64_t)a3 movingToPersonal:(unint64_t)a4
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int64_t state = self->_state;
  BOOL v8 = state == 1;
  if (state == 1) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PXCPLSharedLibraryActivity__setMovingToShared_movingToPersonal___block_invoke;
  v11[3] = &unk_1E5DD0460;
  if (v8) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = 0;
  }
  v11[4] = self;
  v11[5] = v9;
  v11[6] = v10;
  [(PXCPLSharedLibraryActivity *)self performChanges:v11];
}

void __66__PXCPLSharedLibraryActivity__setMovingToShared_movingToPersonal___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setMovingToShared:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setMovingToPersonal:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) currentChanges];
  if (v2)
  {
    char v3 = v2;
    uint64_t v4 = PLUserStatusGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = _StateDescription(*(void *)(*(void *)(a1 + 32) + 120));
      uint64_t v6 = *(void *)(a1 + 40);
      if ((v3 & 2) != 0) {
        v7 = @" (new)";
      }
      else {
        v7 = &stru_1F00B0030;
      }
      BOOL v8 = v7;
      uint64_t v9 = *(void *)(a1 + 48);
      if ((v3 & 4) != 0) {
        unint64_t v10 = @" (new)";
      }
      else {
        unint64_t v10 = &stru_1F00B0030;
      }
      id v11 = v10;
      int v12 = 138544386;
      id v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PXCPLSharedLibraryActivity { state:%{public}@, movingToShared:%lu%{public}@, movingToPersonal:%lu%{public}@ }", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (void)_setState:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int64_t v5 = [(PXCPLSharedLibraryActivity *)self state];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PXCPLSharedLibraryActivity__setState___block_invoke;
  v6[3] = &unk_1E5DD0460;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = v5;
  [(PXCPLSharedLibraryActivity *)self performChanges:v6];
}

void __40__PXCPLSharedLibraryActivity__setState___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) currentChanges])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = v2[15];
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [v2 setMovingToShared:0];
      [*(id *)(a1 + 32) setMovingToPersonal:0];
      char v4 = [*(id *)(a1 + 32) currentChanges];
      if ((v4 & 2) != 0) {
        int64_t v5 = @" (new)";
      }
      else {
        int64_t v5 = &stru_1F00B0030;
      }
      if ((v4 & 4) != 0) {
        uint64_t v6 = @" (new)";
      }
      else {
        uint64_t v6 = &stru_1F00B0030;
      }
    }
    else
    {
      if (v3 == 1 || *(void *)(a1 + 48) == 0) {
        [v2 _updateScopeStatusCounts];
      }
      uint64_t v6 = &stru_1F00B0030;
      int64_t v5 = &stru_1F00B0030;
    }
    BOOL v8 = PLUserStatusGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = _StateDescription(*(void *)(*(void *)(a1 + 32) + 120));
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 128);
      id v11 = v5;
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 136);
      id v13 = v6;
      int v14 = 138544642;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = @" (new)";
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXCPLSharedLibraryActivity { state:%{public}@%{public}@, movingToShared:%lu%{public}@, movingToPersonal:%lu%{public}@ }", (uint8_t *)&v14, 0x3Eu);
    }
  }
}

- (void)_queue_fetchLibraryScopeForPhotoLibrary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v6 = PLUserStatusGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "PXCPLSharedLibraryActivity { %{public}@ }", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_photoLibrary, a3);
  [(PHPhotoLibrary *)self->_photoLibrary registerChangeObserver:self];
  v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v7 setIncludeExitingShares:1];
  BOOL v8 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v7];
  libraryScopeFetchResult = self->_libraryScopeFetchResult;
  self->_libraryScopeFetchResult = v8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_scopeStatusCountsDidChange, (CFStringRef)*MEMORY[0x1E4F39738], 0, (CFNotificationSuspensionBehavior)1024);
  objc_initWeak((id *)buf, self);
  Result = (void *)_StateForLibraryScopeFetchResult(self->_libraryScopeFetchResult);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PXCPLSharedLibraryActivity__queue_fetchLibraryScopeForPhotoLibrary___block_invoke;
  v12[3] = &unk_1E5DD0260;
  objc_copyWeak(v13, (id *)buf);
  v13[1] = Result;
  dispatch_async(MEMORY[0x1E4F14428], v12);
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

void __70__PXCPLSharedLibraryActivity__queue_fetchLibraryScopeForPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setState:*(void *)(a1 + 40)];
}

- (void)setMovingToPersonal:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_movingToPersonal != a3)
  {
    self->_movingToPersonal = a3;
    [(PXCPLSharedLibraryActivity *)self signalChange:4];
  }
}

- (void)setMovingToShared:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_movingToShared != a3)
  {
    self->_movingToShared = a3;
    [(PXCPLSharedLibraryActivity *)self signalChange:2];
  }
}

- (void)setState:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_state != a3)
  {
    self->_int64_t state = a3;
    [(PXCPLSharedLibraryActivity *)self signalChange:1];
  }
}

- (PXCPLSharedLibraryActivity)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCPLSharedLibraryActivity.m", 49, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXCPLSharedLibraryActivity;
  uint64_t v6 = [(PXCPLSharedLibraryActivity *)&v17 init];
  if (v6)
  {
    uint64_t v7 = +[PXCPLSharedLibraryActivity sharedQueue];
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v6);
    uint64_t v9 = v6->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PXCPLSharedLibraryActivity_initWithPhotoLibrary___block_invoke;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v15, &location);
    id v14 = v5;
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(v9, v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __51__PXCPLSharedLibraryActivity_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_fetchLibraryScopeForPhotoLibrary:", *(void *)(a1 + 32));
}

- (PXCPLSharedLibraryActivity)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCPLSharedLibraryActivity.m", 45, @"%s is not available as initializer", "-[PXCPLSharedLibraryActivity init]");

  abort();
}

+ (OS_dispatch_queue)sharedQueue
{
  if (sharedQueue_onceToken_151963 != -1) {
    dispatch_once(&sharedQueue_onceToken_151963, &__block_literal_global_151964);
  }
  uint64_t v2 = (void *)sharedQueue_sharedQueue_151965;
  return (OS_dispatch_queue *)v2;
}

void __41__PXCPLSharedLibraryActivity_sharedQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.PXCPLSharedLibraryActivity.sharedQueue", attr);
  uint64_t v3 = (void *)sharedQueue_sharedQueue_151965;
  sharedQueue_sharedQueue_151965 = (uint64_t)v2;

  char v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleMainQueueTask:&__block_literal_global_193_151969];
}

void __41__PXCPLSharedLibraryActivity_sharedQueue__block_invoke_2()
{
}

@end