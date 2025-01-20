@interface PXPhotoAnalysisStatusController
+ (id)sharedStatusController;
- (BOOL)_didReceiveGraphFractionCompleted;
- (BOOL)_isGraphReady;
- (BOOL)_isRequestingGraphFractionCompleted;
- (BOOL)_isWithinGracePeriod;
- (BOOL)_needsUpdate;
- (BOOL)hasBeenReadyForSomeTime;
- (NSDate)_initialUpdateDate;
- (NSDate)_lastGraphBecameReadyDate;
- (NSError)_graphError;
- (NSMutableArray)_retryBlocks;
- (NSString)stateDescription;
- (PXPhotoAnalysisStatusController)init;
- (double)graphFractionCompleted;
- (int64_t)graphStatus;
- (void)_dequeueAndPerformBlocks:(id)a3;
- (void)_handleGraphFractionCompletedReply:(id)a3 error:(id)a4;
- (void)_handleGraphReadyForSomeTimeForDate:(id)a3;
- (void)_handleGraphReadyReplyWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleInitialGraceDelay;
- (void)_invalidateGraphStatus;
- (void)_requestGraphFractionCompleted;
- (void)_requestGraphReady;
- (void)_setDidReceiveGraphFractionCompleted:(BOOL)a3;
- (void)_setGraphError:(id)a3;
- (void)_setGraphFractionCompleted:(double)a3;
- (void)_setGraphReady:(BOOL)a3;
- (void)_setGraphStatus:(int64_t)a3;
- (void)_setHasBeenReadyForSomeTime:(BOOL)a3;
- (void)_setInitialUpdateDate:(id)a3;
- (void)_setLastGraphBecameReadyDate:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setRequestingGraphFractionCompleted:(BOOL)a3;
- (void)_updateGraphStatusIfNeeded;
- (void)_updateIfNeeded;
- (void)didPerformChanges;
- (void)registerRetryBlock:(id)a3;
- (void)update;
@end

@implementation PXPhotoAnalysisStatusController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__retryBlocks, 0);
  objc_storeStrong((id *)&self->__graphError, 0);
  objc_storeStrong((id *)&self->__lastGraphBecameReadyDate, 0);
  objc_storeStrong((id *)&self->__initialUpdateDate, 0);
}

- (NSMutableArray)_retryBlocks
{
  return self->__retryBlocks;
}

- (void)_setRequestingGraphFractionCompleted:(BOOL)a3
{
  self->__requestingGraphFractionCompleted = a3;
}

- (BOOL)_isRequestingGraphFractionCompleted
{
  return self->__requestingGraphFractionCompleted;
}

- (NSError)_graphError
{
  return self->__graphError;
}

- (BOOL)_isGraphReady
{
  return self->__graphReady;
}

- (void)_setLastGraphBecameReadyDate:(id)a3
{
}

- (NSDate)_lastGraphBecameReadyDate
{
  return self->__lastGraphBecameReadyDate;
}

- (void)_setInitialUpdateDate:(id)a3
{
}

- (NSDate)_initialUpdateDate
{
  return self->__initialUpdateDate;
}

- (BOOL)_didReceiveGraphFractionCompleted
{
  return self->__didReceiveGraphFractionCompleted;
}

- (double)graphFractionCompleted
{
  return self->_graphFractionCompleted;
}

- (BOOL)hasBeenReadyForSomeTime
{
  return self->_hasBeenReadyForSomeTime;
}

- (int64_t)graphStatus
{
  return self->_graphStatus;
}

- (void)_updateGraphStatusIfNeeded
{
  if (self->_needsUpdateFlags.graphStatus)
  {
    self->_needsUpdateFlags.graphStatus = 0;
    if ([(PXPhotoAnalysisStatusController *)self _isGraphReady])
    {
      [(PXPhotoAnalysisStatusController *)self _setGraphFractionCompleted:0.0];
      uint64_t v3 = 1;
    }
    else if ([(PXPhotoAnalysisStatusController *)self _isWithinGracePeriod])
    {
      uint64_t v3 = 0;
    }
    else
    {
      v4 = [(PXPhotoAnalysisStatusController *)self _graphError];

      if (v4)
      {
        uint64_t v3 = 3;
      }
      else if ([(PXPhotoAnalysisStatusController *)self _didReceiveGraphFractionCompleted])
      {
        uint64_t v3 = 2;
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
    [(PXPhotoAnalysisStatusController *)self _setGraphStatus:v3];
  }
}

- (void)_invalidateGraphStatus
{
  self->_needsUpdateFlags.graphStatus = 1;
  [(PXPhotoAnalysisStatusController *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(PXPhotoAnalysisStatusController *)self _needsUpdate])
  {
    [(PXPhotoAnalysisStatusController *)self _updateGraphStatusIfNeeded];
    uint64_t v3 = PLMemoriesGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = [(PXPhotoAnalysisStatusController *)self stateDescription];
      int v6 = 138412546;
      v7 = self;
      __int16 v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "[%@] state: %@", (uint8_t *)&v6, 0x16u);
    }
    if (([(PXPhotoAnalysisStatusController *)self graphStatus] | 2) == 3)
    {
      v5 = [(PXPhotoAnalysisStatusController *)self _retryBlocks];
      [(PXPhotoAnalysisStatusController *)self _dequeueAndPerformBlocks:v5];
    }
  }
}

- (void)_setNeedsUpdate
{
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.graphStatus;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoAnalysisStatusController;
  [(PXPhotoAnalysisStatusController *)&v3 didPerformChanges];
  [(PXPhotoAnalysisStatusController *)self _updateIfNeeded];
}

- (void)_dequeueAndPerformBlocks:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = (void *)[v3 copy];
    [v3 removeAllObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)_isWithinGracePeriod
{
  v2 = [(PXPhotoAnalysisStatusController *)self _initialUpdateDate];
  [v2 timeIntervalSinceNow];
  double v4 = -v3;

  id v5 = +[PXModelSettings sharedInstance];
  [v5 photoAnalysisGraphInitialGraceDelay];
  BOOL v7 = v6 > v4;

  return v7;
}

- (void)_setGraphError:(id)a3
{
  BOOL v7 = (NSError *)a3;
  id v5 = self->__graphError;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSError *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__graphError, a3);
      [(PXPhotoAnalysisStatusController *)self _invalidateGraphStatus];
    }
  }
}

- (void)_setGraphReady:(BOOL)a3
{
  if (self->__graphReady != a3)
  {
    self->__graphReady = a3;
    [(PXPhotoAnalysisStatusController *)self _invalidateGraphStatus];
  }
}

- (void)_setDidReceiveGraphFractionCompleted:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->__didReceiveGraphFractionCompleted != a3)
  {
    BOOL v3 = a3;
    self->__didReceiveGraphFractionCompleted = a3;
    id v5 = PLMemoriesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      BOOL v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[%@] did receive graph fraction completed=%i", (uint8_t *)&v6, 0x12u);
    }

    [(PXPhotoAnalysisStatusController *)self _invalidateGraphStatus];
  }
}

- (void)_setGraphFractionCompleted:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_graphFractionCompleted != a3)
  {
    self->_graphFractionCompleted = a3;
    id v5 = PLMemoriesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      BOOL v7 = self;
      __int16 v8 = 2048;
      double v9 = a3 * 100.0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[%@] graph fraction completed=%f%%", (uint8_t *)&v6, 0x16u);
    }

    [(PXPhotoAnalysisStatusController *)self signalChange:2];
    if (a3 > 0.0) {
      [(PXPhotoAnalysisStatusController *)self _invalidateGraphStatus];
    }
  }
}

- (void)_handleGraphReadyForSomeTimeForDate:(id)a3
{
  if (self->__lastGraphBecameReadyDate == a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __71__PXPhotoAnalysisStatusController__handleGraphReadyForSomeTimeForDate___block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXPhotoAnalysisStatusController *)self performChanges:v3];
  }
}

uint64_t __71__PXPhotoAnalysisStatusController__handleGraphReadyForSomeTimeForDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHasBeenReadyForSomeTime:1];
}

- (void)_setGraphStatus:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_graphStatus != a3)
  {
    self->_graphStatus = a3;
    if (a3 == 1)
    {
      id v5 = [MEMORY[0x1E4F1C9C8] date];
      objc_storeStrong((id *)&self->__lastGraphBecameReadyDate, v5);
      objc_initWeak((id *)location, self);
      dispatch_time_t v6 = dispatch_time(0, 10000000000);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__PXPhotoAnalysisStatusController__setGraphStatus___block_invoke;
      v11[3] = &unk_1E5DD20C8;
      objc_copyWeak(&v13, (id *)location);
      id v12 = v5;
      id v7 = v5;
      dispatch_after(v6, MEMORY[0x1E4F14428], v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)location);
    }
    else
    {
      lastGraphBecameReadyDate = self->__lastGraphBecameReadyDate;
      self->__lastGraphBecameReadyDate = 0;

      [(PXPhotoAnalysisStatusController *)self _setHasBeenReadyForSomeTime:0];
    }
    double v9 = PLMemoriesGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3) {
        uint64_t v10 = @"?";
      }
      else {
        uint64_t v10 = off_1E5DD09E8[a3];
      }
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = self;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[%@] graph status=%@", location, 0x16u);
    }

    [(PXPhotoAnalysisStatusController *)self signalChange:1];
  }
}

void __51__PXPhotoAnalysisStatusController__setGraphStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleGraphReadyForSomeTimeForDate:*(void *)(a1 + 32)];
}

- (void)_setHasBeenReadyForSomeTime:(BOOL)a3
{
  if (self->_hasBeenReadyForSomeTime != a3)
  {
    self->_hasBeenReadyForSomeTime = a3;
    [(PXPhotoAnalysisStatusController *)self signalChange:4];
  }
}

- (void)_handleGraphFractionCompletedReply:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PXPhotoAnalysisStatusController *)self _setRequestingGraphFractionCompleted:0];
  __int16 v8 = PLMemoriesGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "[%@] fraction completed=%@ error=%@", buf, 0x20u);
  }

  if (v6 && !v7)
  {
    [v6 doubleValue];
    BOOL v10 = v9 < 1.0;
    if (v9 < 0.0) {
      double v9 = 0.0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke;
    v16[3] = &unk_1E5DD09C8;
    v16[4] = self;
    v16[5] = fmin(v9, 1.0);
    [(PXPhotoAnalysisStatusController *)self performChanges:v16];
    if (v10 && ![(PXPhotoAnalysisStatusController *)self _isGraphReady])
    {
      objc_initWeak((id *)buf, self);
      long long v11 = +[PXModelSettings sharedInstance];
      [v11 photoAnalysisGraphProgressUpdateInterval];
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke_2;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v15, (id *)buf);
      dispatch_after(v13, MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

uint64_t __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDidReceiveGraphFractionCompleted:1];
  [*(id *)(a1 + 32) _setGraphFractionCompleted:*(double *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _setGraphError:0];
}

void __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestGraphFractionCompleted];
}

- (void)_requestGraphFractionCompleted
{
  if (![(PXPhotoAnalysisStatusController *)self _isRequestingGraphFractionCompleted])
  {
    [(PXPhotoAnalysisStatusController *)self _setRequestingGraphFractionCompleted:1];
    objc_initWeak(&location, self);
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__PXPhotoAnalysisStatusController__requestGraphFractionCompleted__block_invoke;
    v4[3] = &unk_1E5DD09A0;
    objc_copyWeak(&v5, &location);
    [v3 requestGraphRebuildProgressWithCompletion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __65__PXPhotoAnalysisStatusController__requestGraphFractionCompleted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v5;
  v6;
  px_dispatch_on_main_queue();
}

void __65__PXPhotoAnalysisStatusController__requestGraphFractionCompleted__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleGraphFractionCompletedReply:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_handleGraphReadyReplyWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke;
  v8[3] = &unk_1E5DD0978;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PXPhotoAnalysisStatusController *)self performChanges:v8];
}

void __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _setGraphReady:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) _setGraphError:*(void *)(a1 + 40)];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = PLMemoriesGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v5;
      __int16 v14 = 1024;
      LODWORD(v15) = v6;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%@] graph ready reply success=%i", buf, 0x12u);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%@] graph ready reply error=%@", buf, 0x16u);
    }

    if ([*(id *)(a1 + 32) _isWithinGracePeriod])
    {
      id v9 = PLMemoriesGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v10;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[%@] within grace period, re-requesting graph ready", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke_210;
      block[3] = &unk_1E5DD36F8;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke_210(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestGraphReady];
}

- (void)_requestGraphReady
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PLMemoriesGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[%@] request graph ready", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PXPhotoAnalysisStatusController__requestGraphReady__block_invoke;
  v5[3] = &unk_1E5DD0950;
  objc_copyWeak(&v6, (id *)buf);
  [v4 requestGraphReadyNotificationWithCoalescingIdentifier:0 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __53__PXPhotoAnalysisStatusController__requestGraphReady__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  v5;
  px_dispatch_on_main_queue();
}

void __53__PXPhotoAnalysisStatusController__requestGraphReady__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleGraphReadyReplyWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)_handleInitialGraceDelay
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__PXPhotoAnalysisStatusController__handleInitialGraceDelay__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXPhotoAnalysisStatusController *)self performChanges:v2];
}

uint64_t __59__PXPhotoAnalysisStatusController__handleInitialGraceDelay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateGraphStatus];
}

- (NSString)stateDescription
{
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  unint64_t v4 = [(PXPhotoAnalysisStatusController *)self graphStatus];
  if (v4 > 3) {
    id v5 = @"?";
  }
  else {
    id v5 = off_1E5DD09E8[v4];
  }
  [v3 appendFormat:@"Graph Status: %@\n", v5];
  [(PXPhotoAnalysisStatusController *)self graphFractionCompleted];
  objc_msgSend(v3, "appendFormat:", @"Graph Fraction Completed: %0.2f%%\n", v6 * 100.0);
  char v7 = [(PXPhotoAnalysisStatusController *)self _graphError];
  [v3 appendFormat:@"Graph Error: %@\n", v7];

  if ([(PXPhotoAnalysisStatusController *)self _isWithinGracePeriod]) {
    [v3 appendString:@"Within grace period\n"];
  }
  return (NSString *)v3;
}

- (void)registerRetryBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PXPhotoAnalysisStatusController_registerRetryBlock___block_invoke;
  v6[3] = &unk_1E5DD0900;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXPhotoAnalysisStatusController *)self performChanges:v6];
}

uint64_t __54__PXPhotoAnalysisStatusController_registerRetryBlock___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _retryBlocks];
  BOOL v3 = (void *)[*(id *)(a1 + 40) copy];
  id v4 = _Block_copy(v3);
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 update];
}

- (void)update
{
  BOOL v3 = [(PXPhotoAnalysisStatusController *)self _initialUpdateDate];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(PXPhotoAnalysisStatusController *)self _setInitialUpdateDate:v4];

    objc_initWeak(&location, self);
    id v5 = +[PXModelSettings sharedInstance];
    [v5 photoAnalysisGraphInitialGraceDelay];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PXPhotoAnalysisStatusController_update__block_invoke;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v10, &location);
    dispatch_after(v7, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  [(PXPhotoAnalysisStatusController *)self _requestGraphReady];
  [(PXPhotoAnalysisStatusController *)self _requestGraphFractionCompleted];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PXPhotoAnalysisStatusController_update__block_invoke_2;
  v8[3] = &unk_1E5DD0FA8;
  v8[4] = self;
  [(PXPhotoAnalysisStatusController *)self performChanges:v8];
}

void __41__PXPhotoAnalysisStatusController_update__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInitialGraceDelay];
}

uint64_t __41__PXPhotoAnalysisStatusController_update__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateGraphStatus];
}

- (PXPhotoAnalysisStatusController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPhotoAnalysisStatusController;
  int v2 = [(PXPhotoAnalysisStatusController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    retryBlocks = v2->__retryBlocks;
    v2->__retryBlocks = (NSMutableArray *)v3;
  }
  return v2;
}

+ (id)sharedStatusController
{
  if (sharedStatusController_onceToken != -1) {
    dispatch_once(&sharedStatusController_onceToken, &__block_literal_global_284815);
  }
  int v2 = (void *)sharedStatusController_sharedStatusController;
  return v2;
}

void __57__PXPhotoAnalysisStatusController_sharedStatusController__block_invoke()
{
  v0 = objc_alloc_init(PXPhotoAnalysisStatusController);
  v1 = (void *)sharedStatusController_sharedStatusController;
  sharedStatusController_sharedStatusController = (uint64_t)v0;
}

@end