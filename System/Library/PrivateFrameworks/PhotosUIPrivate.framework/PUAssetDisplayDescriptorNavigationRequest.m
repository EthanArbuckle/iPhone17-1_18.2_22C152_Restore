@interface PUAssetDisplayDescriptorNavigationRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetSeekTime;
- (BOOL)_arrived;
- (BOOL)_isPerformingChanges;
- (BOOL)_isUpdating;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateArrived;
- (BOOL)_needsUpdateDone;
- (BOOL)_needsUpdateFoundTargetAssetReference;
- (BOOL)_seeked;
- (BOOL)_timedOut;
- (NSDate)targetModificationDate;
- (PUAssetDisplayDescriptorNavigationRequest)init;
- (PUAssetReference)_foundTargetAssetReference;
- (PUAssetReference)targetAssetReference;
- (PUBrowsingViewModel)viewModel;
- (double)timeOut;
- (id)_infoMessage;
- (id)_navigationRequestError;
- (id)completionHandler;
- (void)_assertInsideChangeBlock;
- (void)_assertInsideUpdate;
- (void)_cleanUpWhenDone;
- (void)_finishRequest;
- (void)_invalidateArrived;
- (void)_invalidateDone;
- (void)_invalidateFoundTargetAssetReference;
- (void)_setArrived:(BOOL)a3;
- (void)_setFoundTargetAssetReference:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setNeedsUpdateArrived:(BOOL)a3;
- (void)_setNeedsUpdateDone:(BOOL)a3;
- (void)_setNeedsUpdateFoundTargetAssetReference:(BOOL)a3;
- (void)_setPerformingChanges:(BOOL)a3;
- (void)_setSeeked:(BOOL)a3;
- (void)_setTimedOut:(BOOL)a3;
- (void)_setUpdating:(BOOL)a3;
- (void)_updateArrivedIfNeeded;
- (void)_updateCurrentAssetReference;
- (void)_updateDoneIfNeeded;
- (void)_updateFoundTargetAssetReferenceIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateSeeking;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setTargetAssetReference:(id)a3;
- (void)setTargetModificationDate:(id)a3;
- (void)setTargetSeekTime:(id *)a3;
- (void)setTimeOut:(double)a3;
- (void)setViewModel:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUAssetDisplayDescriptorNavigationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__foundTargetAssetReference, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_targetModificationDate, 0);
  objc_storeStrong((id *)&self->_targetAssetReference, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_timeOutTimer, 0);
}

- (BOOL)_timedOut
{
  return self->__timedOut;
}

- (BOOL)_arrived
{
  return self->__arrived;
}

- (BOOL)_seeked
{
  return self->__seeked;
}

- (PUAssetReference)_foundTargetAssetReference
{
  return self->__foundTargetAssetReference;
}

- (void)_setNeedsUpdateDone:(BOOL)a3
{
  self->__needsUpdateDone = a3;
}

- (BOOL)_needsUpdateDone
{
  return self->__needsUpdateDone;
}

- (void)_setNeedsUpdateArrived:(BOOL)a3
{
  self->__needsUpdateArrived = a3;
}

- (BOOL)_needsUpdateArrived
{
  return self->__needsUpdateArrived;
}

- (void)_setNeedsUpdateFoundTargetAssetReference:(BOOL)a3
{
  self->__needsUpdateFoundTargetAssetReference = a3;
}

- (BOOL)_needsUpdateFoundTargetAssetReference
{
  return self->__needsUpdateFoundTargetAssetReference;
}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (double)timeOut
{
  return self->_timeOut;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (NSDate)targetModificationDate
{
  return self->_targetModificationDate;
}

- (PUAssetReference)targetAssetReference
{
  return self->_targetAssetReference;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (id)_infoMessage
{
  v2 = @"YES";
  if (self->__arrived) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (self->__timedOut) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (self->__foundTargetAssetReference) {
    v5 = @"NO";
  }
  else {
    v5 = @"YES";
  }
  if (self->_hasSeenContentChange) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (!self->__seeked) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"Navigation request terminated with success %@, timedOut %@, waiting for dataSource %@, has seen content change %@, seeked %@", v3, v4, v5, v6, v2];
}

- (id)_navigationRequestError
{
  if ([(PUAssetDisplayDescriptorNavigationRequest *)self _arrived])
  {
    v3 = 0;
  }
  else
  {
    if ([(PUAssetDisplayDescriptorNavigationRequest *)self _timedOut])
    {
      if (self->__foundTargetAssetReference)
      {
        v4 = (void *)MEMORY[0x1E4F28C58];
        if (self->_hasSeenContentChange) {
          uint64_t v5 = 5;
        }
        else {
          uint64_t v5 = 4;
        }
      }
      else
      {
        v4 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v5 = 3;
      }
    }
    else
    {
      v4 = (void *)MEMORY[0x1E4F28C58];
      if (self->_timeOutTimer) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 0;
      }
    }
    v3 = [v4 errorWithDomain:@"PUAssetDisplayDescriptorNavigationErrorDomain" code:v5 userInfo:0];
  }
  return v3;
}

- (void)_cleanUpWhenDone
{
  [(NSTimer *)self->_timeOutTimer invalidate];
  timeOutTimer = self->_timeOutTimer;
  self->_timeOutTimer = 0;

  [(PUAssetDisplayDescriptorNavigationRequest *)self setCompletionHandler:0];
}

- (void)_finishRequest
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PUAssetDisplayDescriptorNavigationRequest *)self _navigationRequestError];
  BOOL v4 = [(PUAssetDisplayDescriptorNavigationRequest *)self _arrived];
  uint64_t v5 = [(PUAssetDisplayDescriptorNavigationRequest *)self _infoMessage];
  v6 = PLOneUpGetLog();
  v7 = v6;
  if (v3 || !v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    v8 = v7;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    v8 = v7;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1AE9F8000, v8, v9, "%@", buf, 0xCu);
LABEL_8:

  v10 = (void *)[self->_completionHandler copy];
  v11 = v10;
  if (v10)
  {
    id v13 = v10;
    id v12 = v3;
    px_dispatch_on_main_queue();
  }
  [(PUAssetDisplayDescriptorNavigationRequest *)self _cleanUpWhenDone];
}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__finishRequest__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_updateDoneIfNeeded
{
  if ([(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdateDone])
  {
    [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdateDone:0];
    if ([(PUAssetDisplayDescriptorNavigationRequest *)self _arrived]
      || [(PUAssetDisplayDescriptorNavigationRequest *)self _timedOut])
    {
      [(PUAssetDisplayDescriptorNavigationRequest *)self _finishRequest];
    }
  }
}

- (void)_invalidateDone
{
  [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdateDone:1];
  [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdate];
}

- (void)_updateArrivedIfNeeded
{
  if ([(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdateArrived])
  {
    [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdateArrived:0];
    v3 = [(PUAssetDisplayDescriptorNavigationRequest *)self _foundTargetAssetReference];

    if (v3) {
      BOOL v4 = [(PUAssetDisplayDescriptorNavigationRequest *)self _seeked];
    }
    else {
      BOOL v4 = 0;
    }
    [(PUAssetDisplayDescriptorNavigationRequest *)self _setArrived:v4];
  }
}

- (void)_invalidateArrived
{
  [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdateArrived:1];
  [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdate];
}

- (void)_updateFoundTargetAssetReferenceIfNeeded
{
  if ([(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdateFoundTargetAssetReference])
  {
    [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdateFoundTargetAssetReference:0];
    id v3 = [(PUAssetDisplayDescriptorNavigationRequest *)self _foundTargetAssetReference];
    if (!v3)
    {
      BOOL v4 = [(PUBrowsingViewModel *)self->_viewModel assetsDataSource];
      uint64_t v5 = [v4 assetReferenceForAssetReference:self->_targetAssetReference];
      v6 = v5;
      if (v5)
      {
        if (self->_targetModificationDate)
        {
          v7 = [v5 asset];
          v8 = [v7 modificationDate];
          uint64_t v9 = [v8 compare:self->_targetModificationDate];

          BOOL v10 = v9 == 1;
          if (v10)
          {
            id v3 = v6;
          }
          else
          {
            uint64_t v11 = MEMORY[0x1E4F143A8];
            uint64_t v12 = 3221225472;
            id v13 = __85__PUAssetDisplayDescriptorNavigationRequest__updateFoundTargetAssetReferenceIfNeeded__block_invoke;
            v14 = &unk_1E5F2ECC8;
            v15 = self;
            id v16 = v6;
            [(PUAssetDisplayDescriptorNavigationRequest *)self performChanges:&v11];

            id v3 = 0;
          }
          self->_hasSeenContentChange = v10;
        }
        else
        {
          id v3 = v5;
        }
      }
      else
      {
        id v3 = 0;
      }
    }
    -[PUAssetDisplayDescriptorNavigationRequest _setFoundTargetAssetReference:](self, "_setFoundTargetAssetReference:", v3, v11, v12, v13, v14, v15);
  }
}

uint64_t __85__PUAssetDisplayDescriptorNavigationRequest__updateFoundTargetAssetReferenceIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTargetAssetReference:*(void *)(a1 + 40)];
}

- (void)_invalidateFoundTargetAssetReference
{
  [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdateFoundTargetAssetReference:1];
  [(PUAssetDisplayDescriptorNavigationRequest *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (![(PUAssetDisplayDescriptorNavigationRequest *)self _isUpdating]
    && ![(PUAssetDisplayDescriptorNavigationRequest *)self _isPerformingChanges])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUAssetDisplayDescriptorNavigationRequest.m" lineNumber:284 description:@"not within a change block or update"];
  }
}

- (BOOL)_needsUpdate
{
  if ([(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdateFoundTargetAssetReference]|| [(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdateArrived])
  {
    return 1;
  }
  return [(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdateDone];
}

- (void)_updateIfNeeded
{
  if ([(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdate])
  {
    BOOL v4 = [(PUAssetDisplayDescriptorNavigationRequest *)self _isUpdating];
    [(PUAssetDisplayDescriptorNavigationRequest *)self _setUpdating:1];
    [(PUAssetDisplayDescriptorNavigationRequest *)self _updateFoundTargetAssetReferenceIfNeeded];
    [(PUAssetDisplayDescriptorNavigationRequest *)self _updateArrivedIfNeeded];
    [(PUAssetDisplayDescriptorNavigationRequest *)self _updateDoneIfNeeded];
    [(PUAssetDisplayDescriptorNavigationRequest *)self _setUpdating:v4];
    if ([(PUAssetDisplayDescriptorNavigationRequest *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PUAssetDisplayDescriptorNavigationRequest.m" lineNumber:271 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)performChanges:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  BOOL v5 = [(PUAssetDisplayDescriptorNavigationRequest *)self _isPerformingChanges];
  [(PUAssetDisplayDescriptorNavigationRequest *)self _setPerformingChanges:1];
  v4[2](v4);

  [(PUAssetDisplayDescriptorNavigationRequest *)self _setPerformingChanges:v5];
  if (!v5)
  {
    [(PUAssetDisplayDescriptorNavigationRequest *)self _updateIfNeeded];
  }
}

- (void)_assertInsideUpdate
{
  if (![(PUAssetDisplayDescriptorNavigationRequest *)self _isUpdating])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUAssetDisplayDescriptorNavigationRequest.m" lineNumber:244 description:@"not withing update"];
  }
}

- (void)_assertInsideChangeBlock
{
  if (![(PUAssetDisplayDescriptorNavigationRequest *)self _isPerformingChanges])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUAssetDisplayDescriptorNavigationRequest.m" lineNumber:239 description:@"not within a change block"];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "assetsDataSourceDidChange", a3))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke_2;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __65__PUAssetDisplayDescriptorNavigationRequest_viewModel_didChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFoundTargetAssetReference];
}

- (void)_setArrived:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideUpdate];
  if (self->__arrived != v3)
  {
    self->__arrived = v3;
    [(PUAssetDisplayDescriptorNavigationRequest *)self _invalidateDone];
  }
}

- (void)_setTimedOut:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideChangeBlock];
  if (self->__timedOut != v3)
  {
    self->__timedOut = v3;
    [(PUAssetDisplayDescriptorNavigationRequest *)self _invalidateDone];
  }
}

- (void)_setSeeked:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideChangeBlock];
  if (self->__seeked != v3)
  {
    self->__seeked = v3;
    [(PUAssetDisplayDescriptorNavigationRequest *)self _invalidateArrived];
  }
}

- (void)_setFoundTargetAssetReference:(id)a3
{
  v7 = (PUAssetReference *)a3;
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideUpdate];
  BOOL v5 = v7;
  if (self->__foundTargetAssetReference != v7)
  {
    BOOL v6 = -[PUAssetReference isEqual:](v7, "isEqual:");
    BOOL v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->__foundTargetAssetReference, a3);
      [(PUAssetDisplayDescriptorNavigationRequest *)self _updateCurrentAssetReference];
      [(PUAssetDisplayDescriptorNavigationRequest *)self _updateSeeking];
      [(PUAssetDisplayDescriptorNavigationRequest *)self _invalidateArrived];
      BOOL v5 = v7;
    }
  }
}

- (void)_updateSeeking
{
  BOOL v3 = [(PUAssetDisplayDescriptorNavigationRequest *)self _foundTargetAssetReference];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 asset];
    uint64_t v6 = [v5 mediaType];

    if (v6 == 2 && (self->_targetSeekTime.flags & 1) != 0)
    {
      v7 = [(PUAssetDisplayDescriptorNavigationRequest *)self viewModel];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke;
      v17[3] = &unk_1E5F2ED10;
      id v8 = v7;
      id v18 = v8;
      [v8 performChanges:v17];
      uint64_t v9 = [v8 assetViewModelForAssetReference:v4];
      BOOL v10 = [v9 videoPlayer];

      objc_initWeak(&location, self);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_2;
      v14[3] = &unk_1E5F2D898;
      objc_copyWeak(&v15, &location);
      long long v12 = *(_OWORD *)&self->_targetSeekTime.value;
      int64_t epoch = self->_targetSeekTime.epoch;
      [v10 seekToTime:&v12 completionHandler:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_5;
      v11[3] = &unk_1E5F2ED10;
      v11[4] = self;
      [(PUAssetDisplayDescriptorNavigationRequest *)self performChanges:v11];
    }
  }
}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVideoContentAllowedForAllReasons];
}

void __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_3;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSeeked:1];
}

void __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_4;
  v3[3] = &unk_1E5F2ED10;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  [v2 performChanges:v3];
}

uint64_t __59__PUAssetDisplayDescriptorNavigationRequest__updateSeeking__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSeeked:1];
}

- (void)_updateCurrentAssetReference
{
  BOOL v3 = [(PUAssetDisplayDescriptorNavigationRequest *)self _foundTargetAssetReference];
  if (v3)
  {
    id v4 = [(PUAssetDisplayDescriptorNavigationRequest *)self viewModel];
    BOOL v5 = [v4 currentAssetReference];
    if (([v3 isEqual:v5] & 1) == 0)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __73__PUAssetDisplayDescriptorNavigationRequest__updateCurrentAssetReference__block_invoke;
      v6[3] = &unk_1E5F2ECC8;
      id v7 = v4;
      id v8 = v3;
      [v7 performChanges:v6];
    }
  }
}

uint64_t __73__PUAssetDisplayDescriptorNavigationRequest__updateCurrentAssetReference__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40)];
}

- (void)setCompletionHandler:(id)a3
{
  if (self->_completionHandler != a3)
  {
    id v4 = (void *)[a3 copy];
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v4;
  }
}

- (void)setTimeOut:(double)a3
{
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideChangeBlock];
  [(NSTimer *)self->_timeOutTimer invalidate];
  timeOutTimer = self->_timeOutTimer;
  self->_timeOutTimer = 0;

  self->_timeOut = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x1E4F1CB00];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke;
  v9[3] = &unk_1E5F2E4E8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v6, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, v9, a3);
  id v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  id v8 = self->_timeOutTimer;
  self->_timeOutTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke_2;
  v6[3] = &unk_1E5F2ED10;
  id v7 = WeakRetained;
  id v3 = WeakRetained;
  [v3 performChanges:v6];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

uint64_t __56__PUAssetDisplayDescriptorNavigationRequest_setTimeOut___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTimedOut:1];
}

- (void)setTargetSeekTime:(id *)a3
{
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideChangeBlock];
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 targetSeekTime = self->_targetSeekTime;
  if (CMTimeCompare(&time1, (CMTime *)&targetSeekTime))
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_targetSeekTime.int64_t epoch = a3->var3;
    *(_OWORD *)&self->_targetSeekTime.value = v5;
    [(PUAssetDisplayDescriptorNavigationRequest *)self _setSeeked:0];
  }
}

- (void)setTargetModificationDate:(id)a3
{
  id v7 = (NSDate *)a3;
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideChangeBlock];
  long long v5 = v7;
  if (self->_targetModificationDate != v7)
  {
    char v6 = -[NSDate isEqual:](v7, "isEqual:");
    long long v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_targetModificationDate, a3);
      [(PUAssetDisplayDescriptorNavigationRequest *)self _invalidateFoundTargetAssetReference];
      long long v5 = v7;
    }
  }
}

- (void)setTargetAssetReference:(id)a3
{
  long long v5 = (PUAssetReference *)a3;
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideChangeBlock];
  if (self->_targetAssetReference != v5)
  {
    objc_storeStrong((id *)&self->_targetAssetReference, a3);
    [(PUAssetDisplayDescriptorNavigationRequest *)self _invalidateFoundTargetAssetReference];
  }
}

- (void)setViewModel:(id)a3
{
  char v6 = (PUBrowsingViewModel *)a3;
  [(PUAssetDisplayDescriptorNavigationRequest *)self _assertInsideChangeBlock];
  viewModel = self->_viewModel;
  if (viewModel != v6)
  {
    [(PUBrowsingViewModel *)viewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PUBrowsingViewModel *)self->_viewModel registerChangeObserver:self];
    [(PUAssetDisplayDescriptorNavigationRequest *)self _invalidateFoundTargetAssetReference];
  }
}

- (void)dealloc
{
  if (self->_timeOutTimer) {
    [(PUAssetDisplayDescriptorNavigationRequest *)self _finishRequest];
  }
  v3.receiver = self;
  v3.super_class = (Class)PUAssetDisplayDescriptorNavigationRequest;
  [(PUAssetDisplayDescriptorNavigationRequest *)&v3 dealloc];
}

- (PUAssetDisplayDescriptorNavigationRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetDisplayDescriptorNavigationRequest;
  result = [(PUAssetDisplayDescriptorNavigationRequest *)&v4 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_targetSeekTime.value = *MEMORY[0x1E4F1F9F8];
    result->_targetSeekTime.int64_t epoch = *(void *)(v3 + 16);
  }
  return result;
}

@end