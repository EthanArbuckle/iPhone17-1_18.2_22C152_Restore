@interface PXPeopleProgressDataSource
+ ($DF4FB41D2F0E3F59E20087ACD782DC9D)_invalidProgressReport;
+ (int64_t)pendingCountForAllowedCount:(int64_t)a3 processedCount:(int64_t)a4;
- ($DF4FB41D2F0E3F59E20087ACD782DC9D)progressReportForLibrary:(SEL)a3;
- (BOOL)countCacheValid;
- (BOOL)hasHomePeople;
- (BOOL)isPhotoLibraryReadyForAnalysis;
- (BOOL)isReadyForAnalysis;
- (OS_dispatch_queue)personPromoterQueue;
- (OS_dispatch_queue)scanningProgressQueue;
- (PHFetchResult)homeResult;
- (PHPhotoLibrary)photoLibrary;
- (PXPeopleProgressDataSource)initWithPhotoLibrary:(id)a3;
- (id)_fetchPeople;
- (int64_t)allowedAssetCount;
- (int64_t)pendingToAnyVersionAssetCount;
- (int64_t)pendingToLatestVersionAssetCount;
- (int64_t)processedToAnyVersionAssetCount;
- (int64_t)processedToLatestVersionAssetCount;
- (os_unfair_lock_s)progressLock;
- (void)_logFaceCounts;
- (void)appWillEnterForeground;
- (void)asyncUpdateProgressWithReportBlock:(id)a3;
- (void)dealloc;
- (void)loadQueryData;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)requestPersonPromoterStatusWithCompletionBlock:(id)a3;
- (void)setAllowedAssetCount:(int64_t)a3;
- (void)setCountCacheValid:(BOOL)a3;
- (void)setHomeResult:(id)a3;
- (void)setIsReadyForAnalysis:(BOOL)a3;
- (void)setPendingToAnyVersionAssetCount:(int64_t)a3;
- (void)setPendingToLatestVersionAssetCount:(int64_t)a3;
- (void)setProcessedToAnyVersionAssetCount:(int64_t)a3;
- (void)setProcessedToLatestVersionAssetCount:(int64_t)a3;
- (void)syncUpdateProgressWithReportBlock:(id)a3;
- (void)updateProgressFromIsReadyForAnalysis:(BOOL)a3 progressReport:(id *)a4;
- (void)updateProgressIfNeededWithReportBlock:(id)a3;
@end

@implementation PXPeopleProgressDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeResult, 0);
  objc_storeStrong((id *)&self->_personPromoterQueue, 0);
  objc_storeStrong((id *)&self->_scanningProgressQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setCountCacheValid:(BOOL)a3
{
  self->_countCacheValid = a3;
}

- (BOOL)countCacheValid
{
  return self->_countCacheValid;
}

- (os_unfair_lock_s)progressLock
{
  return self->_progressLock;
}

- (void)setHomeResult:(id)a3
{
}

- (PHFetchResult)homeResult
{
  return self->_homeResult;
}

- (OS_dispatch_queue)personPromoterQueue
{
  return self->_personPromoterQueue;
}

- (OS_dispatch_queue)scanningProgressQueue
{
  return self->_scanningProgressQueue;
}

- (void)setPendingToAnyVersionAssetCount:(int64_t)a3
{
  self->_pendingToAnyVersionAssetCount = a3;
}

- (void)setPendingToLatestVersionAssetCount:(int64_t)a3
{
  self->_pendingToLatestVersionAssetCount = a3;
}

- (void)setProcessedToAnyVersionAssetCount:(int64_t)a3
{
  self->_processedToAnyVersionAssetCount = a3;
}

- (void)setProcessedToLatestVersionAssetCount:(int64_t)a3
{
  self->_processedToLatestVersionAssetCount = a3;
}

- (void)setAllowedAssetCount:(int64_t)a3
{
  self->_allowedAssetCount = a3;
}

- (void)setIsReadyForAnalysis:(BOOL)a3
{
  self->_isReadyForAnalysis = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)_logFaceCounts
{
  v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PXPeopleProgressDataSource__logFaceCounts__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __44__PXPeopleProgressDataSource__logFaceCounts__block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photoLibrary];
  int v3 = objc_msgSend(v2, "isReadyForAnalysis_FOR_UI_USE_ONLY");
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 progressReportForLibrary:v2];
    uint64_t v6 = *((void *)&v29 + 1);
    uint64_t v5 = v29;
    uint64_t v7 = v30;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  int64_t v27 = +[PXPeopleProgressDataSource pendingCountForAllowedCount:v5 processedCount:v6];
  int64_t v8 = +[PXPeopleProgressDataSource pendingCountForAllowedCount:v5 processedCount:v7];
  lock._os_unfair_lock_opaque = [*(id *)(a1 + 32) progressLock];
  os_unfair_lock_lock(&lock);
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(unsigned __int8 *)(v9 + 8);
  uint64_t v22 = *(void *)(v9 + 24);
  uint64_t v23 = *(void *)(v9 + 32);
  uint64_t v24 = *(void *)(v9 + 40);
  uint64_t v25 = *(void *)(v9 + 48);
  uint64_t v26 = *(void *)(v9 + 56);
  os_unfair_lock_unlock(&lock);
  int v11 = [*(id *)(a1 + 32) hasHomePeople];
  v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v3) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    uint64_t v20 = v6;
    v14 = v13;
    if (v10) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    v16 = v15;
    v21 = v14;
    if (v11) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    v18 = v17;
    v19 = v16;
    *(_DWORD *)buf = 136318466;
    v33 = "-[PXPeopleProgressDataSource _logFaceCounts]_block_invoke";
    __int16 v34 = 2112;
    v35 = v14;
    __int16 v36 = 2048;
    uint64_t v37 = v5;
    __int16 v38 = 2048;
    uint64_t v39 = v20;
    __int16 v40 = 2048;
    uint64_t v41 = v7;
    __int16 v42 = 2048;
    int64_t v43 = v27;
    __int16 v44 = 2048;
    int64_t v45 = v8;
    __int16 v46 = 2112;
    v47 = v16;
    __int16 v48 = 2048;
    uint64_t v49 = v22;
    __int16 v50 = 2048;
    uint64_t v51 = v23;
    __int16 v52 = 2048;
    uint64_t v53 = v24;
    __int16 v54 = 2048;
    uint64_t v55 = v25;
    __int16 v56 = 2048;
    uint64_t v57 = v26;
    __int16 v58 = 2112;
    v59 = v18;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_INFO, "%s, libraryIsReadyForAnalysis: %@, reportAllowedCount: %ld, reportProcessedToLatestVersionCount: %ld, reportProcessedToAnyVersionCount: %ld, reportPendingToLatestVersionAssetCount: %ld, reportPendingToAnyVersionAssetCount: %ld, cachedIsReadyForAnalysis: %@, cachedAllowedCount: %ld, cachedProcessedToLatestVersionCount: %ld, cachedProcessedToAnyVersionCount: %ld, cachedPendingToLatestVersionCount: %ld, cachedPendingToAnyVersionCount: %ld, hasHomePeople: %@", buf, 0x8Eu);
  }
  [*(id *)(a1 + 32) requestPersonPromoterStatusWithCompletionBlock:&__block_literal_global_259_154151];
}

void __44__PXPeopleProgressDataSource__logFaceCounts__block_invoke_256(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = @"NO";
    if (a2) {
      uint64_t v6 = @"YES";
    }
    uint64_t v7 = v6;
    int64_t v8 = v7;
    uint64_t v9 = @"nil";
    int v10 = 136315650;
    int v11 = "-[PXPeopleProgressDataSource _logFaceCounts]_block_invoke";
    __int16 v12 = 2112;
    if (v4) {
      uint64_t v9 = v4;
    }
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "%s, isPersonPromoterDone: %@, error: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)appWillEnterForeground
{
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressDataSource *)self progressLock];
  os_unfair_lock_lock(&lock);
  [(PXPeopleProgressDataSource *)self setAllowedAssetCount:0];
  [(PXPeopleProgressDataSource *)self setProcessedToLatestVersionAssetCount:0];
  [(PXPeopleProgressDataSource *)self setProcessedToAnyVersionAssetCount:0];
  [(PXPeopleProgressDataSource *)self setPendingToLatestVersionAssetCount:0];
  [(PXPeopleProgressDataSource *)self setPendingToAnyVersionAssetCount:0];
  [(PXPeopleProgressDataSource *)self setCountCacheValid:0];
  os_unfair_lock_unlock(&lock);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(PXPeopleProgressDataSource *)self homeResult];
  uint64_t v7 = [v5 changeDetailsForFetchResult:v6];

  if (v7)
  {
    int64_t v8 = [v7 fetchResultAfterChanges];
    lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressDataSource *)self progressLock];
    os_unfair_lock_lock(&lock);
    [(PXPeopleProgressDataSource *)self setHomeResult:v8];
    [(PXPeopleProgressDataSource *)self setCountCacheValid:0];
    os_unfair_lock_unlock(&lock);
    if (![v8 count])
    {
      dispatch_time_t v9 = dispatch_time(0, 200000000);
      dispatch_after(v9, MEMORY[0x1E4F14428], &__block_literal_global_154161);
    }
  }
}

void __80__PXPeopleProgressDataSource_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PXPeopleProgressDidChangeNotification" object:0];
}

- (void)updateProgressFromIsReadyForAnalysis:(BOOL)a3 progressReport:(id *)a4
{
  BOOL v4 = a3;
  int64_t var0 = a4->var0;
  int64_t var1 = a4->var1;
  int64_t var2 = a4->var2;
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressDataSource *)self progressLock];
  os_unfair_lock_lock(&lock);
  [(PXPeopleProgressDataSource *)self setAllowedAssetCount:var0];
  [(PXPeopleProgressDataSource *)self setProcessedToLatestVersionAssetCount:var1];
  [(PXPeopleProgressDataSource *)self setProcessedToAnyVersionAssetCount:var2];
  [(PXPeopleProgressDataSource *)self setPendingToLatestVersionAssetCount:+[PXPeopleProgressDataSource pendingCountForAllowedCount:var0 processedCount:var1]];
  [(PXPeopleProgressDataSource *)self setPendingToAnyVersionAssetCount:+[PXPeopleProgressDataSource pendingCountForAllowedCount:var0 processedCount:var2]];
  [(PXPeopleProgressDataSource *)self setIsReadyForAnalysis:v4];
  [(PXPeopleProgressDataSource *)self setCountCacheValid:1];
  os_unfair_lock_unlock(&lock);
}

- (id)_fetchPeople
{
  v2 = [(PXPeopleProgressDataSource *)self photoLibrary];
  int v3 = [v2 librarySpecificFetchOptions];

  [v3 setFetchLimit:1];
  [v3 setPersonContext:1];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v3 setIncludedDetectionTypes:v4];

  id v5 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v3];

  return v5;
}

- (BOOL)isPhotoLibraryReadyForAnalysis
{
  v2 = [(PXPeopleProgressDataSource *)self photoLibrary];
  char v3 = objc_msgSend(v2, "isReadyForAnalysis_FOR_UI_USE_ONLY");

  return v3;
}

- (void)syncUpdateProgressWithReportBlock:(id)a3
{
  BOOL v4 = (void (**)(id, BOOL, int64_t, int64_t, double, double))a3;
  BOOL v5 = [(PXPeopleProgressDataSource *)self isPhotoLibraryReadyForAnalysis];
  if (v5)
  {
    uint64_t v6 = [(PXPeopleProgressDataSource *)self photoLibrary];
    [(PXPeopleProgressDataSource *)self progressReportForLibrary:v6];
    long long v15 = v11;
    uint64_t v16 = v12;
    double v7 = v13;
    double v8 = v14;
  }
  else
  {
    +[PXPeopleProgressDataSource _invalidProgressReport];
    long long v15 = v11;
    uint64_t v16 = v12;
    double v7 = v13;
    double v8 = v14;
  }
  long long v11 = v15;
  uint64_t v12 = v16;
  double v13 = v7;
  double v14 = v8;
  [(PXPeopleProgressDataSource *)self updateProgressFromIsReadyForAnalysis:v5 progressReport:&v11];
  if (v4)
  {
    LODWORD(v11) = [(PXPeopleProgressDataSource *)self progressLock];
    os_unfair_lock_lock((os_unfair_lock_t)&v11);
    int64_t v9 = [(PXPeopleProgressDataSource *)self processedToLatestVersionAssetCount];
    int64_t v10 = [(PXPeopleProgressDataSource *)self processedToAnyVersionAssetCount];
    os_unfair_lock_unlock((os_unfair_lock_t)&v11);
    v4[2](v4, v5, v9, v10, v7, v8);
  }
}

- ($DF4FB41D2F0E3F59E20087ACD782DC9D)progressReportForLibrary:(SEL)a3
{
  return ($DF4FB41D2F0E3F59E20087ACD782DC9D *)[MEMORY[0x1E4F8E7F0] faceProcessingProgressForLibrary:a4];
}

- (void)requestPersonPromoterStatusWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXPeopleProgressDataSource.m", 144, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  uint64_t v6 = [(PXPeopleProgressDataSource *)self personPromoterQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5DD1848;
  objc_copyWeak(&v11, &location);
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = [WeakRetained photoLibrary];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E5DD1FE8;
  id v5 = *(id *)(a1 + 32);
  [v3 personPromotionProcessingStatusForUserInterface:v4];
}

void __77__PXPeopleProgressDataSource_requestPersonPromoterStatusWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:@"status"];
  [v7 BOOLValue];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    double v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      id v10 = "-[PXPeopleProgressDataSource requestPersonPromoterStatusWithCompletionBlock:]_block_invoke_2";
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "%s - error checking person promotion status: %@, results: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)asyncUpdateProgressWithReportBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeopleProgressDataSource *)self scanningProgressQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PXPeopleProgressDataSource_asyncUpdateProgressWithReportBlock___block_invoke;
  v7[3] = &unk_1E5DD3280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__PXPeopleProgressDataSource_asyncUpdateProgressWithReportBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncUpdateProgressWithReportBlock:*(void *)(a1 + 40)];
}

- (void)updateProgressIfNeededWithReportBlock:(id)a3
{
  id v4 = a3;
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressDataSource *)self progressLock];
  os_unfair_lock_lock(&lock);
  BOOL v5 = [(PXPeopleProgressDataSource *)self countCacheValid];
  os_unfair_lock_unlock(&lock);
  if (!v5) {
    [(PXPeopleProgressDataSource *)self syncUpdateProgressWithReportBlock:v4];
  }
}

- (void)loadQueryData
{
  char v3 = [(PXPeopleProgressDataSource *)self photoLibrary];
  objc_msgSend(v3, "px_registerChangeObserver:", self);

  id v4 = [(PXPeopleProgressDataSource *)self _fetchPeople];
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressDataSource *)self progressLock];
  os_unfair_lock_lock(&lock);
  [(PXPeopleProgressDataSource *)self setHomeResult:v4];
  os_unfair_lock_unlock(&lock);
}

- (BOOL)hasHomePeople
{
  lock._os_unfair_lock_opaque = (uint32_t)[(PXPeopleProgressDataSource *)self progressLock];
  os_unfair_lock_lock(&lock);
  char v3 = [(PXPeopleProgressDataSource *)self homeResult];
  os_unfair_lock_unlock(&lock);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (int64_t)pendingToAnyVersionAssetCount
{
  return self->_pendingToAnyVersionAssetCount;
}

- (int64_t)pendingToLatestVersionAssetCount
{
  return self->_pendingToLatestVersionAssetCount;
}

- (int64_t)processedToAnyVersionAssetCount
{
  return self->_processedToAnyVersionAssetCount;
}

- (int64_t)processedToLatestVersionAssetCount
{
  return self->_processedToLatestVersionAssetCount;
}

- (int64_t)allowedAssetCount
{
  return self->_allowedAssetCount;
}

- (BOOL)isReadyForAnalysis
{
  return self->_isReadyForAnalysis;
}

- (void)dealloc
{
  [(PHPhotoLibrary *)self->_photoLibrary px_unregisterChangeObserver:self];
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleProgressDataSource;
  [(PXPeopleProgressDataSource *)&v4 dealloc];
}

- (PXPeopleProgressDataSource)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleProgressDataSource;
  id v6 = [(PXPeopleProgressDataSource *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4FB2730];
    [v8 addObserver:v7 selector:sel__logFaceCounts name:*MEMORY[0x1E4FB2720] object:0];
    [v8 addObserver:v7 selector:sel_appWillEnterForeground name:v9 object:0];
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.people.progressDataSource.scanningProgress", v10);
    scanningProgressQueue = v7->_scanningProgressQueue;
    v7->_scanningProgressQueue = (OS_dispatch_queue *)v11;

    __int16 v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.people.progressDataSource.personPromoter", v13);
    personPromoterQueue = v7->_personPromoterQueue;
    v7->_personPromoterQueue = (OS_dispatch_queue *)v14;

    v7->_progressLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (int64_t)pendingCountForAllowedCount:(int64_t)a3 processedCount:(int64_t)a4
{
  if (a3 <= a4) {
    return 0;
  }
  else {
    return a3 - a4;
  }
}

+ ($DF4FB41D2F0E3F59E20087ACD782DC9D)_invalidProgressReport
{
  retstr->int64_t var1 = -1;
  retstr->int64_t var2 = -1;
  retstr->int64_t var0 = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&retstr->var3 = _Q0;
  return result;
}

@end