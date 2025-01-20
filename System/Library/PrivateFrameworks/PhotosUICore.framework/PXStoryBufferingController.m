@interface PXStoryBufferingController
- (BOOL)isActive;
- (BOOL)isBuffering;
- (NSDictionary)totalBufferingTimeIntervalsPerReason;
- (NSIndexSet)bufferingReasons;
- (NSMutableIndexSet)bufferingReasonsStore;
- (PXStoryBufferingController)initWithModel:(id)a3;
- (PXStoryBufferingController)initWithObservableModel:(id)a3;
- (PXStoryModel)model;
- (double)lastCriticalBufferingDuration;
- (double)lastNoncriticalBufferingDuration;
- (double)noncriticalBufferingTimeout;
- (double)totalBufferingTimeInterval;
- (id)onBufferingEnd;
- (int64_t)overallReadinessStatus;
- (void)_accountForReason:(int64_t)a3 status:(int64_t)a4;
- (void)_invalidateModelProperties;
- (void)_invalidateOverallReadinessStatus;
- (void)_updateModelProperties;
- (void)_updateOverallReadinessStatus;
- (void)configureUpdater:(id)a3;
- (void)dealloc;
- (void)handleModelChange:(unint64_t)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsBuffering:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setOnBufferingEnd:(id)a3;
- (void)setOverallReadinessStatus:(int64_t)a3;
@end

@implementation PXStoryBufferingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferingReasonsStore, 0);
  objc_storeStrong(&self->_onBufferingEnd, 0);
  objc_destroyWeak((id *)&self->_model);
}

- (NSMutableIndexSet)bufferingReasonsStore
{
  return self->_bufferingReasonsStore;
}

- (int64_t)overallReadinessStatus
{
  return self->_overallReadinessStatus;
}

- (void)setOnBufferingEnd:(id)a3
{
}

- (id)onBufferingEnd
{
  return self->_onBufferingEnd;
}

- (BOOL)isBuffering
{
  return self->_isBuffering;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setModel:(id)a3
{
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (double)noncriticalBufferingTimeout
{
  v2 = [(PXStoryBufferingController *)self model];
  v3 = [v2 configuration];
  [v3 noncriticalBufferingTimeout];
  double v5 = v4;

  return v5;
}

- (void)setOverallReadinessStatus:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t overallReadinessStatus = self->_overallReadinessStatus;
  if (overallReadinessStatus != a3)
  {
    self->_int64_t overallReadinessStatus = a3;
    [(PXStoryBufferingController *)self _invalidateModelProperties];
    a3 = self->_overallReadinessStatus;
  }
  if (a3 != 3)
  {
    if (!self->_overallBufferingDuration.currentStartTime) {
      self->_overallBufferingDuration.currentStartTime = mach_absolute_time();
    }
    mach_absolute_time();
    PXTimebaseConversionFactor();
  }
  mach_absolute_time();
  if (self->_overallBufferingDuration.currentStartTime) {
    PXTimebaseConversionFactor();
  }
  self->_overallBufferingDuration.previousDuration = self->_overallBufferingDuration.previousDuration + 0.0;
  self->_overallBufferingDuration.currentStartTime = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke;
  aBlock[3] = &unk_1E5DC4E30;
  aBlock[4] = self;
  aBlock[5] = overallReadinessStatus;
  double v5 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_2;
  v13[3] = &unk_1E5DC4E30;
  v13[4] = self;
  v13[5] = overallReadinessStatus;
  v6 = (unsigned int (**)(void *, uint64_t))_Block_copy(v13);
  if (v5[2](v5, 2))
  {
    self->_lastNoncriticalBufferingDurationStore.previousDuration = 0.0;
    self->_lastNoncriticalBufferingDurationStore.currentStartTime = 0;
    self->_lastNoncriticalBufferingDurationStore.currentStartTime = mach_absolute_time();
    objc_initWeak(&buf, self);
    [(PXStoryBufferingController *)self noncriticalBufferingTimeout];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v9 = [(PXStoryController *)self storyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_3;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v12, &buf);
    dispatch_after(v8, v9, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&buf);
  }
  else if (v6[2](v6, 2))
  {
    mach_absolute_time();
    if (self->_lastNoncriticalBufferingDurationStore.currentStartTime) {
      PXTimebaseConversionFactor();
    }
    self->_lastNoncriticalBufferingDurationStore.previousDuration = self->_lastNoncriticalBufferingDurationStore.previousDuration
                                                                  + 0.0;
    self->_lastNoncriticalBufferingDurationStore.currentStartTime = 0;
  }
  if (v5[2](v5, 1))
  {
    self->_lastCriticalBufferingDurationStore.previousDuration = 0.0;
    self->_lastCriticalBufferingDurationStore.currentStartTime = 0;
    self->_lastCriticalBufferingDurationStore.currentStartTime = mach_absolute_time();
  }
  else if (v6[2](v6, 1))
  {
    mach_absolute_time();
    p_lastCriticalBufferingDurationStore = &self->_lastCriticalBufferingDurationStore;
    if (p_lastCriticalBufferingDurationStore->currentStartTime) {
      PXTimebaseConversionFactor();
    }
    p_lastCriticalBufferingDurationStore->previousDuration = p_lastCriticalBufferingDurationStore->previousDuration
                                                           + 0.0;
    p_lastCriticalBufferingDurationStore->currentStartTime = 0;
  }
}

BOOL __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 40) != a2 && *(void *)(*(void *)(a1 + 32) + 208) == a2;
}

BOOL __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 40) == a2 && *(void *)(*(void *)(a1 + 32) + 208) != a2;
}

void __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_4;
  v3[3] = &unk_1E5DC4E58;
  objc_copyWeak(&v4, v1);
  [WeakRetained performChanges:v3];

  objc_destroyWeak(&v4);
}

void __56__PXStoryBufferingController_setOverallReadinessStatus___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateOverallReadinessStatus];
}

- (void)setIsBuffering:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isBuffering != a3)
  {
    self->_isBuffering = a3;
    if (a3)
    {
      id v4 = [(PXStoryBufferingController *)self log];
      uint64_t v5 = [(PXStoryBufferingController *)self logContext];
      os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v4, self);
      double v7 = v4;
      dispatch_time_t v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_DWORD *)id buf = 134217984;
        uint64_t v19 = v5;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PXStoryBufferingController.PlaybackBuffering", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }

      uint64_t v9 = [MEMORY[0x1E4F56658] startSignpost];
      v10 = PLStoryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Buffering started", buf, 2u);
      }

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__PXStoryBufferingController_setIsBuffering___block_invoke;
      v13[3] = &unk_1E5DD01C8;
      v14 = v8;
      os_signpost_id_t v15 = v6;
      uint64_t v16 = v5;
      uint64_t v17 = v9;
      v11 = v8;
      [(PXStoryBufferingController *)self setOnBufferingEnd:v13];
    }
    else
    {
      id v12 = [(PXStoryBufferingController *)self onBufferingEnd];
      v12[2]();

      [(PXStoryBufferingController *)self setOnBufferingEnd:0];
    }
  }
}

void __45__PXStoryBufferingController_setIsBuffering___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)id buf = 134217984;
    uint64_t v14 = v5;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PXStoryBufferingController.PlaybackBuffering", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
  }

  os_signpost_id_t v6 = (void *)MEMORY[0x1E4F56658];
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *MEMORY[0x1E4F56440];
  uint64_t v11 = *MEMORY[0x1E4F56580];
  id v12 = @"com.apple.photos.memory.interactiveMemoryPlaybackBuffering";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v6 endSignpost:v7 forEventName:v8 withPayload:v9];

  v10 = PLStoryGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "Buffering ended", buf, 2u);
  }
}

- (void)_accountForReason:(int64_t)a3 status:(int64_t)a4
{
  uint64_t v7 = [(PXStoryBufferingController *)self bufferingReasonsStore];
  uint64_t v8 = v7;
  if (a4 == 3)
  {
    [v7 removeIndex:a3];

    uint64_t v9 = &self->_bufferingDurationsPerReason[a3];
    mach_absolute_time();
    if (v9->var1) {
      PXTimebaseConversionFactor();
    }
    v9->var0 = v9->var0 + 0.0;
    v9->unint64_t var1 = 0;
  }
  else
  {
    [v7 addIndex:a3];

    if (a4)
    {
      v10 = &self->_bufferingDurationsPerReason[a3];
      unint64_t var1 = v10->var1;
      p_unint64_t var1 = &v10->var1;
      if (!var1) {
        unint64_t *p_var1 = mach_absolute_time();
      }
    }
  }
}

- (void)_updateModelProperties
{
  v3 = [(PXStoryBufferingController *)self model];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PXStoryBufferingController__updateModelProperties__block_invoke;
  v4[3] = &unk_1E5DCEE38;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __52__PXStoryBufferingController__updateModelProperties__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setReadinessStatus:", objc_msgSend(v2, "overallReadinessStatus"));
}

- (void)_invalidateModelProperties
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateModelProperties];
}

- (void)_updateOverallReadinessStatus
{
  if ([(PXStoryBufferingController *)self isActive])
  {
    id v10 = [(PXStoryBufferingController *)self model];
    char v3 = [v10 isExporting];
    unint64_t v4 = [v10 contentReadinessStatus];
    if (v3)
    {
      uint64_t v5 = [v10 activeSongResource];
      uint64_t v6 = 3;
      if (v5) {
        unint64_t v7 = 3;
      }
      else {
        unint64_t v7 = 1;
      }

      unint64_t v8 = [v10 timelineAttributes] & 2 | 1;
    }
    else
    {
      unint64_t v8 = 3;
      if ([v10 musicReadinessStatus]) {
        uint64_t v6 = 3;
      }
      else {
        uint64_t v6 = 1;
      }
      unint64_t v7 = [v10 musicReadinessStatus];
      if (([v10 timelineAttributes] & 1) == 0) {
        unint64_t v8 = 1;
      }
    }
    [(PXStoryBufferingController *)self _accountForReason:0 status:v6];
    [(PXStoryBufferingController *)self _accountForReason:1 status:v7];
    [(PXStoryBufferingController *)self _accountForReason:3 status:v8];
    [(PXStoryBufferingController *)self _accountForReason:2 status:v4];
    unint64_t v9 = PXStoryPlaybackReadinessStatusCombine(v4, v7);
    PXStoryPlaybackReadinessStatusCombine(v9, v8);
    mach_absolute_time();
    PXTimebaseConversionFactor();
  }
}

- (void)_invalidateOverallReadinessStatus
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOverallReadinessStatus];
}

- (void)handleModelChange:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryBufferingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PXStoryBufferingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5DC4E08;
  v5[4] = self;
  v5[5] = a3;
  [(PXStoryController *)self performChanges:v5];
}

uint64_t __48__PXStoryBufferingController_handleModelChange___block_invoke(uint64_t result)
{
  if ((*(_DWORD *)(result + 40) & 0x201004A2) != 0) {
    return [*(id *)(result + 32) _invalidateOverallReadinessStatus];
  }
  return result;
}

- (NSDictionary)totalBufferingTimeIntervalsPerReason
{
  mach_absolute_time();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = 0;
  for (uint64_t i = 0; i != 4; ++i)
  {
    objc_super v6 = &self->_bufferingDurationsPerReason[v4];
    if (v6->var1) {
      PXTimebaseConversionFactor();
    }
    if (v6->var0 + 0.0 > 0.0)
    {
      unint64_t v7 = objc_msgSend(NSNumber, "numberWithDouble:");
      unint64_t v8 = [NSNumber numberWithInteger:i];
      [v3 setObject:v7 forKeyedSubscript:v8];
    }
    ++v4;
  }
  unint64_t v9 = (void *)[v3 copy];

  return (NSDictionary *)v9;
}

- (NSIndexSet)bufferingReasons
{
  id v2 = [(PXStoryBufferingController *)self bufferingReasonsStore];
  id v3 = (void *)[v2 copy];

  return (NSIndexSet *)v3;
}

- (double)lastCriticalBufferingDuration
{
  p_lastCriticalBufferingDurationStore = &self->_lastCriticalBufferingDurationStore;
  mach_absolute_time();
  if (p_lastCriticalBufferingDurationStore->currentStartTime) {
    PXTimebaseConversionFactor();
  }
  return p_lastCriticalBufferingDurationStore->previousDuration + 0.0;
}

- (double)lastNoncriticalBufferingDuration
{
  p_lastNoncriticalBufferingDurationStore = &self->_lastNoncriticalBufferingDurationStore;
  mach_absolute_time();
  if (p_lastNoncriticalBufferingDurationStore->currentStartTime) {
    PXTimebaseConversionFactor();
  }
  return p_lastNoncriticalBufferingDurationStore->previousDuration + 0.0;
}

- (double)totalBufferingTimeInterval
{
  p_overallBufferingDuration = &self->_overallBufferingDuration;
  mach_absolute_time();
  if (p_overallBufferingDuration->currentStartTime) {
    PXTimebaseConversionFactor();
  }
  return p_overallBufferingDuration->previousDuration + 0.0;
}

- (void)setIsActive:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    if (a3)
    {
      uint64_t v4 = [(PXStoryBufferingController *)self log];
      os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v6 = v5;
        if (os_signpost_enabled(v4))
        {
          int v7 = 134217984;
          uint64_t v8 = [(PXStoryBufferingController *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_EVENT, v6, "PXStoryBufferingControllerIsActive", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v7, 0xCu);
        }
      }

      self->_activatedTime = mach_absolute_time();
    }
    [(PXStoryBufferingController *)self _invalidateOverallReadinessStatus];
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryBufferingController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateOverallReadinessStatus, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateModelProperties];
}

- (void)dealloc
{
  free(self->_bufferingDurationsPerReason);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryBufferingController;
  [(PXStoryBufferingController *)&v3 dealloc];
}

- (PXStoryBufferingController)initWithModel:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryBufferingController;
  os_signpost_id_t v5 = [(PXStoryController *)&v15 initWithObservableModel:v4];
  os_signpost_id_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    int v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    bufferingReasonsStore = v6->_bufferingReasonsStore;
    v6->_bufferingReasonsStore = v7;

    uint64_t v9 = ($175F2685EF764341F5DD80B75CC65478 *)malloc_type_malloc(0x40uLL, 0x1000040451B5BE8uLL);
    uint64_t v10 = 0;
    v6->_bufferingDurationsPerReason = v9;
    do
    {
      p_var0 = (void *)&v6->_bufferingDurationsPerReason[v10].var0;
      void *p_var0 = 0;
      p_var0[1] = 0;
      ++v10;
    }
    while (v10 != 4);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__PXStoryBufferingController_initWithModel___block_invoke;
    v13[3] = &unk_1E5DC4DE0;
    uint64_t v14 = v6;
    [(PXStoryController *)v14 performChanges:v13];
  }
  return v6;
}

uint64_t __44__PXStoryBufferingController_initWithModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateOverallReadinessStatus];
}

- (PXStoryBufferingController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  os_signpost_id_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryBufferingController.m", 88, @"%s is not available as initializer", "-[PXStoryBufferingController initWithObservableModel:]");

  abort();
}

@end