@interface PXPeopleProgressManager
+ (BOOL)hasSubstantialProcessingRemainingForThreshold:(int64_t)a3 pendingAssetCount:(int64_t)a4 allowedAssetCount:(int64_t)a5 photoLibrary:(id)a6;
+ (BOOL)isFaceProcessingFinishedForPhotoLibrary:(id)a3;
+ (BOOL)progressComplete:(double)a3;
+ (BOOL)shouldCheckProcessedCountsForThreshold:(int64_t)a3;
+ (id)_progressFooterQueue;
+ (id)statusStringForStatus:(int64_t)a3;
+ (void)shouldCheckProcessedCounts:(BOOL *)a3 hasSubstantialProcessingRemaining:(BOOL *)a4 threshold:(int64_t)a5 featureUnlocked:(BOOL)a6;
- (BOOL)_hasSubstantialProcessingRemainingForThreshold:(int64_t)a3 allowMocking:(BOOL)a4;
- (BOOL)debug_ignoreMockingHasSubstantialProcessingRemainingForThreshold:(int64_t)a3;
- (BOOL)featureUnlocked;
- (BOOL)hasSubstantialProcessingRemainingForThreshold:(int64_t)a3;
- (BOOL)monitoringProgress;
- (BOOL)shouldUseInterstitial;
- (NSTimer)statusTimer;
- (PXPeopleProgressDataSource)dataSource;
- (PXPeopleProgressManager)initWithPhotoLibrary:(id)a3;
- (double)progress;
- (double)updateInterval;
- (int64_t)mockSubstantialProcessingCount;
- (int64_t)processingStatus;
- (os_unfair_lock_s)progressLock;
- (void)_handleAsyncUpdateIsReadyForAnalysis:(BOOL)a3 processedToAnyVersionProgress:(int64_t)a4 processedToAnyVersionCount:(int64_t)a5;
- (void)_logFaceCounts;
- (void)_scheduleNextUpdate;
- (void)_updateStatusForIsReadyForAnalysis:(BOOL)a3 progress:(double)a4 processCount:(int64_t)a5;
- (void)setMockSubstantialProcessingCount:(int64_t)a3;
- (void)setMonitoringProgress:(BOOL)a3;
- (void)setProcessingStatus:(int64_t)a3;
- (void)setProgress:(double)a3;
- (void)setStatusTimer:(id)a3;
- (void)setUpdateInterval:(double)a3;
- (void)shouldUseProgressFooterWithCompletion:(id)a3;
- (void)updateProgressWithForce:(BOOL)a3;
@end

@implementation PXPeopleProgressManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setMockSubstantialProcessingCount:(int64_t)a3
{
  self->_mockSubstantialProcessingCount = a3;
}

- (int64_t)mockSubstantialProcessingCount
{
  return self->_mockSubstantialProcessingCount;
}

- (os_unfair_lock_s)progressLock
{
  return self->_progressLock;
}

- (void)setStatusTimer:(id)a3
{
}

- (NSTimer)statusTimer
{
  return self->_statusTimer;
}

- (void)setProcessingStatus:(int64_t)a3
{
  self->_processingStatus = a3;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (BOOL)monitoringProgress
{
  return self->_monitoringProgress;
}

- (PXPeopleProgressDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_logFaceCounts
{
  v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXPeopleProgressManager__logFaceCounts__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __41__PXPeopleProgressManager__logFaceCounts__block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) dataSource];
  lock._os_unfair_lock_opaque = [*(id *)(a1 + 32) progressLock];
  os_unfair_lock_lock(&lock);
  int v3 = [*(id *)(a1 + 32) monitoringProgress];
  [*(id *)(a1 + 32) updateInterval];
  uint64_t v5 = v4;
  [*(id *)(a1 + 32) progress];
  double v7 = v6;
  int v8 = [*(id *)(a1 + 32) featureUnlocked];
  int v9 = [*(id *)(a1 + 32) shouldUseInterstitial];
  uint64_t v10 = [*(id *)(a1 + 32) processingStatus];
  os_unfair_lock_unlock(&lock);
  BOOL v11 = +[PXPeopleProgressManager progressComplete:v7];
  int v12 = [v2 isReadyForAnalysis];
  int v13 = [v2 hasHomePeople];
  v14 = +[PXPeopleProgressManager statusStringForStatus:v10];
  v15 = PLUIGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v37 = v2;
    if (v3) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    v17 = v16;
    v33 = v17;
    if (v11) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    int v19 = v12;
    v20 = v18;
    v32 = v20;
    v36 = v17;
    if (v8) {
      v21 = @"YES";
    }
    else {
      v21 = @"NO";
    }
    v22 = v21;
    v35 = v20;
    if (v19) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    v24 = v23;
    v34 = v22;
    if (v13) {
      v25 = @"YES";
    }
    else {
      v25 = @"NO";
    }
    v26 = v14;
    v27 = v25;
    v28 = v24;
    if (v9) {
      v29 = @"YES";
    }
    else {
      v29 = @"NO";
    }
    v30 = v29;
    v31 = v27;
    *(_DWORD *)buf = 136317442;
    v40 = "-[PXPeopleProgressManager _logFaceCounts]_block_invoke";
    __int16 v41 = 2112;
    v42 = v33;
    __int16 v43 = 2048;
    uint64_t v44 = v5;
    __int16 v45 = 2048;
    double v46 = v7;
    __int16 v47 = 2112;
    v48 = v32;
    __int16 v49 = 2112;
    v50 = v22;
    __int16 v51 = 2112;
    v52 = v24;
    __int16 v53 = 2112;
    v54 = v27;
    v14 = v26;
    __int16 v55 = 2112;
    v56 = v30;
    __int16 v57 = 2112;
    v58 = v26;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_INFO, "%s, monitoringProgress: %@, updateInterval: %f, progress: %f, progressComplete: %@, featureUnlocked: %@ ((isReadyForAnalysis: %@) && (hasHomePeople: %@)), shouldUseInterstitial: %@, statusString: %@", buf, 0x66u);

    v2 = v37;
  }

  [*(id *)(a1 + 32) shouldUseProgressFooterWithCompletion:&__block_literal_global_26];
}

void __41__PXPeopleProgressManager__logFaceCounts__block_invoke_23(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = @"NO";
    if (a2) {
      uint64_t v4 = @"YES";
    }
    uint64_t v5 = v4;
    int v6 = 136315394;
    double v7 = "-[PXPeopleProgressManager _logFaceCounts]_block_invoke";
    __int16 v8 = 2112;
    int v9 = v5;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "%s, shouldUseProgressFooter: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)debug_ignoreMockingHasSubstantialProcessingRemainingForThreshold:(int64_t)a3
{
  return [(PXPeopleProgressManager *)self _hasSubstantialProcessingRemainingForThreshold:a3 allowMocking:0];
}

- (void)_handleAsyncUpdateIsReadyForAnalysis:(BOOL)a3 processedToAnyVersionProgress:(int64_t)a4 processedToAnyVersionCount:(int64_t)a5
{
  [(PXPeopleProgressManager *)self _updateStatusForIsReadyForAnalysis:a3 progress:a5 processCount:(double)a4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PXPeopleProgressManager__handleAsyncUpdateIsReadyForAnalysis_processedToAnyVersionProgress_processedToAnyVersionCount___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __121__PXPeopleProgressManager__handleAsyncUpdateIsReadyForAnalysis_processedToAnyVersionProgress_processedToAnyVersionCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextUpdate];
}

- (void)_scheduleNextUpdate
{
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressManager *)self progressLock];
  os_unfair_lock_lock(&lock);
  int v3 = [(PXPeopleProgressManager *)self statusTimer];
  BOOL v4 = [(PXPeopleProgressManager *)self monitoringProgress];
  os_unfair_lock_unlock(&lock);
  if (!v3 && v4)
  {
    objc_initWeak(&location, self);
    v14._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressManager *)self progressLock];
    os_unfair_lock_lock(&v14);
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
    [(PXPeopleProgressManager *)self updateInterval];
    double v7 = v6;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __46__PXPeopleProgressManager__scheduleNextUpdate__block_invoke;
    int v12 = &unk_1E5DCD920;
    objc_copyWeak(&v13, &location);
    __int16 v8 = [v5 scheduledTimerWithTimeInterval:1 repeats:&v9 block:v7];
    -[PXPeopleProgressManager setStatusTimer:](self, "setStatusTimer:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    os_unfair_lock_unlock(&v14);
    objc_destroyWeak(&location);
  }
}

void __46__PXPeopleProgressManager__scheduleNextUpdate__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMockSubstantialProcessingCount:", objc_msgSend(WeakRetained, "mockSubstantialProcessingCount") + 1);

  id v3 = objc_loadWeakRetained(v1);
  [v3 updateProgressWithForce:0];
}

- (void)_updateStatusForIsReadyForAnalysis:(BOOL)a3 progress:(double)a4 processCount:(int64_t)a5
{
  __int16 v8 = [(PXPeopleProgressManager *)self dataSource];
  BOOL v9 = +[PXPeopleProgressManager progressComplete:a4];
  int v10 = [v8 hasHomePeople];
  char v11 = v10;
  int v12 = v9 & ~v10;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke;
  aBlock[3] = &unk_1E5DBAD38;
  objc_copyWeak(v21, &location);
  BOOL v22 = a3;
  char v23 = v11;
  BOOL v24 = v9;
  v21[1] = *(id *)&a4;
  id v13 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_2;
  block[3] = &unk_1E5DCE8A0;
  id v14 = v13;
  id v18 = v14;
  char v19 = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (v12 == 1)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_3;
    v15[3] = &unk_1E5DCDD58;
    id v16 = v14;
    [v8 requestPersonPromoterStatusWithCompletionBlock:v15];
  }
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke(uint64_t a1, int a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  lock._os_unfair_lock_opaque = [WeakRetained progressLock];
  os_unfair_lock_lock(&lock);
  double v7 = +[PXPeopleUISettings sharedInstance];
  int v8 = [v7 mockEmptyContentUpdates];

  if (v8)
  {
    BOOL v9 = [WeakRetained processingStatus] == 4;
    uint64_t v10 = 3;
LABEL_11:
    if (v9) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v10 + 1;
    }
    goto LABEL_14;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if (!*(unsigned char *)(a1 + 49))
    {
      if (*(unsigned char *)(a1 + 50)) {
        int v12 = a2;
      }
      else {
        int v12 = 1;
      }
      BOOL v9 = (v12 | a3 ^ 1) == 0;
      uint64_t v10 = 2;
      goto LABEL_11;
    }
    uint64_t v11 = 4;
  }
  else
  {
    uint64_t v11 = 1;
  }
LABEL_14:
  [WeakRetained setProcessingStatus:v11];
  if ([WeakRetained monitoringProgress])
  {
    [WeakRetained setProgress:*(double *)(a1 + 40)];
    os_unfair_lock_unlock(&lock);
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"PXPeopleProgressDidChangeNotification" object:WeakRetained];
  }
  else
  {
    os_unfair_lock_unlock(&lock);
  }
}

uint64_t __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_3(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_4;
  v3[3] = &unk_1E5DCE8A0;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_hasSubstantialProcessingRemainingForThreshold:(int64_t)a3 allowMocking:(BOOL)a4
{
  BOOL v4 = a4;
  __int16 v19 = 0;
  +[PXPeopleProgressManager shouldCheckProcessedCounts:(char *)&v19 + 1 hasSubstantialProcessingRemaining:&v19 threshold:a3 featureUnlocked:[(PXPeopleProgressManager *)self featureUnlocked]];
  if (HIBYTE(v19))
  {
    double v7 = [(PXPeopleProgressManager *)self dataSource];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__PXPeopleProgressManager__hasSubstantialProcessingRemainingForThreshold_allowMocking___block_invoke;
    v16[3] = &unk_1E5DBAD10;
    objc_copyWeak(&v17, &location);
    [v7 updateProgressIfNeededWithReportBlock:v16];
    uint64_t v8 = [v7 allowedAssetCount];
    if ((unint64_t)a3 >= 2)
    {
      if (a3 != 2)
      {
        uint64_t v10 = 0;
LABEL_8:
        uint64_t v11 = [(PXPeopleProgressManager *)self dataSource];
        int v12 = [v11 photoLibrary];
        LOBYTE(v19) = +[PXPeopleProgressManager hasSubstantialProcessingRemainingForThreshold:a3 pendingAssetCount:v10 allowedAssetCount:v8 photoLibrary:v12];

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

        goto LABEL_9;
      }
      uint64_t v9 = [v7 pendingToLatestVersionAssetCount];
    }
    else
    {
      uint64_t v9 = [v7 pendingToAnyVersionAssetCount];
    }
    uint64_t v10 = v9;
    goto LABEL_8;
  }
LABEL_9:
  if (v4
    && (+[PXPeopleUISettings sharedInstance],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 mockProcessingUpdates],
        v13,
        v14))
  {
    return ([(PXPeopleProgressManager *)self mockSubstantialProcessingCount] & 0x8000000000000001) == 1;
  }
  else
  {
    return (_BYTE)v19 != 0;
  }
}

void __87__PXPeopleProgressManager__hasSubstantialProcessingRemainingForThreshold_allowMocking___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStatusForIsReadyForAnalysis:a2 progress:a6 processCount:a4];
}

- (void)updateProgressWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressManager *)self progressLock];
  os_unfair_lock_lock(&lock);
  BOOL v5 = [(PXPeopleProgressManager *)self monitoringProgress];
  os_unfair_lock_unlock(&lock);
  if (v5 || v3)
  {
    double v6 = dispatch_get_global_queue(9, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke;
    v7[3] = &unk_1E5DD36F8;
    v7[4] = self;
    dispatch_async(v6, v7);
  }
}

void __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) dataSource];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke_2;
  v3[3] = &unk_1E5DBAD10;
  objc_copyWeak(&v4, &location);
  [v2 asyncUpdateProgressWithReportBlock:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAsyncUpdateIsReadyForAnalysis:a2 processedToAnyVersionProgress:(uint64_t)a4 processedToAnyVersionCount:a6];
}

- (BOOL)hasSubstantialProcessingRemainingForThreshold:(int64_t)a3
{
  return [(PXPeopleProgressManager *)self _hasSubstantialProcessingRemainingForThreshold:a3 allowMocking:1];
}

- (void)shouldUseProgressFooterWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXPeopleProgressManager.m", 117, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  double v6 = +[PXPeopleProgressManager _progressFooterQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXPeopleProgressManager_shouldUseProgressFooterWithCompletion___block_invoke;
  block[3] = &unk_1E5DD3280;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __65__PXPeopleProgressManager_shouldUseProgressFooterWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) hasSubstantialProcessingRemainingForThreshold:2];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (int64_t)processingStatus
{
  objc_initWeak(&location, self);
  BOOL v3 = [(PXPeopleProgressManager *)self dataSource];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PXPeopleProgressManager_processingStatus__block_invoke;
  v6[3] = &unk_1E5DBAD10;
  objc_copyWeak(&v7, &location);
  [v3 updateProgressIfNeededWithReportBlock:v6];

  int64_t processingStatus = self->_processingStatus;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return processingStatus;
}

void __43__PXPeopleProgressManager_processingStatus__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStatusForIsReadyForAnalysis:a2 progress:a6 processCount:a4];
}

- (BOOL)shouldUseInterstitial
{
  return [(PXPeopleProgressManager *)self hasSubstantialProcessingRemainingForThreshold:0];
}

- (BOOL)featureUnlocked
{
  v2 = [(PXPeopleProgressManager *)self dataSource];
  char v3 = [v2 isReadyForAnalysis];
  char v4 = v3 & [v2 hasHomePeople];

  return v4;
}

- (void)setUpdateInterval:(double)a3
{
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressManager *)self progressLock];
  os_unfair_lock_lock(&lock);
  if (self->_updateInterval != a3)
  {
    double v5 = 1.0;
    if (a3 >= 1.0) {
      double v5 = a3;
    }
    self->_updateInterval = v5;
  }
  os_unfair_lock_unlock(&lock);
}

- (void)setMonitoringProgress:(BOOL)a3
{
  BOOL v3 = a3;
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressManager *)self progressLock];
  os_unfair_lock_lock(&lock);
  if (self->_monitoringProgress != v3)
  {
    self->_monitoringProgress = v3;
    if (v3)
    {
      os_unfair_lock_unlock(&lock);
      [(PXPeopleProgressManager *)self updateProgressWithForce:0];
      return;
    }
    if (self->_statusTimer)
    {
      double v5 = [(PXPeopleProgressManager *)self statusTimer];
      [v5 invalidate];

      [(PXPeopleProgressManager *)self setStatusTimer:0];
    }
  }
  os_unfair_lock_unlock(&lock);
}

- (PXPeopleProgressManager)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPeopleProgressManager;
  double v5 = [(PXPeopleProgressManager *)&v13 init];
  double v6 = v5;
  if (v5)
  {
    v5->_updateInterval = 1.0;
    v5->_int64_t processingStatus = 0;
    id v7 = [[PXPeopleProgressDataSource alloc] initWithPhotoLibrary:v4];
    dataSource = v6->_dataSource;
    v6->_dataSource = v7;
    uint64_t v9 = v7;

    [(PXPeopleProgressDataSource *)v9 loadQueryData];
    v6->_progressLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = *MEMORY[0x1E4FB2720];
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__logFaceCounts name:v10 object:0];
  }
  return v6;
}

+ (id)statusStringForStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"PXPeopleProcessStatusNotAvailable";
  }
  else {
    return off_1E5DBAD58[a3 - 1];
  }
}

+ (id)_progressFooterQueue
{
  if (_progressFooterQueue_onceToken != -1) {
    dispatch_once(&_progressFooterQueue_onceToken, &__block_literal_global_111921);
  }
  v2 = (void *)_progressFooterQueue_footerQueue;
  return v2;
}

void __47__PXPeopleProgressManager__progressFooterQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.people.progressFooter", v2);
  v1 = (void *)_progressFooterQueue_footerQueue;
  _progressFooterQueue_footerQueue = (uint64_t)v0;
}

+ (BOOL)shouldCheckProcessedCountsForThreshold:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

+ (void)shouldCheckProcessedCounts:(BOOL *)a3 hasSubstantialProcessingRemaining:(BOOL *)a4 threshold:(int64_t)a5 featureUnlocked:(BOOL)a6
{
  if (a6)
  {
    BOOL v8 = +[PXPeopleProgressManager shouldCheckProcessedCountsForThreshold:a5];
    BOOL v9 = v8;
  }
  else
  {
    BOOL v8 = 0;
    BOOL v9 = 1;
  }
  *a3 = v8;
  *a4 = v9;
}

+ (BOOL)progressComplete:(double)a3
{
  return 100.0 - a3 < 0.00001;
}

+ (BOOL)isFaceProcessingFinishedForPhotoLibrary:(id)a3
{
  return [a3 isFaceProcessingFinished];
}

+ (BOOL)hasSubstantialProcessingRemainingForThreshold:(int64_t)a3 pendingAssetCount:(int64_t)a4 allowedAssetCount:(int64_t)a5 photoLibrary:(id)a6
{
  id v9 = a6;
  double v10 = ceil((double)a5 * 0.05);
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      if (!a4) {
        goto LABEL_14;
      }
      if (v10 > 150.0) {
        double v10 = 150.0;
      }
      if (v10 <= (double)a4) {
        LOBYTE(v12) = 1;
      }
      else {
LABEL_14:
      }
        int v12 = [(id)objc_opt_class() isFaceProcessingFinishedForPhotoLibrary:v9] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = v10 <= (double)a4 && a4 != 0;
  }

  return v12;
}

@end