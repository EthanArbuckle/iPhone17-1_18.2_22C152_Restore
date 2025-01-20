@interface PXStoryTransitionController
+ (BOOL)_isSupportedTransitionWithKind:(char)a3 forClipWithResourceKind:(int64_t)a4;
- ($0AC6E346AE4835514AAA8AC86D8F4844)activeTransition;
- (BOOL)_canStartTransitionWithKind:(char)a3;
- (NSArray)interruptedTransitionErrorDescriptions;
- (NSError)currentError;
- (PXGEntityManager)entityManager;
- (PXStoryModel)model;
- (PXStoryTransitionController)initWithModel:(id)a3 transitionSource:(id)a4;
- (PXStoryTransitionModel)pendingTransitionModel;
- (PXStoryTransitionSource)transitionSource;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (int64_t)currentSegmentIdentifier;
- (void)_handleTransitionCompleted:(id)a3;
- (void)_interruptActiveTransitions;
- (void)_reportInterruptedTransitionForNewTransitionBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4;
- (void)_startTransition:(id)a3;
- (void)_updateCurrentSegmentIdentifierIfNeeded;
- (void)_updatePendingTransitionModelWithSegmentTransitionInfo:(id)a3;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)enumerateClipIdentifiersForActiveTransitionsUsingBlock:(id)a3;
- (void)enumerateClipIdentifiersForPendingTransitionUsingBlock:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setActiveTransition:(id)a3;
- (void)setCurrentError:(id)a3;
- (void)setCurrentSegmentIdentifier:(int64_t)a3;
- (void)setCurrentSegmentIdentifier:(int64_t)a3 allowTransitions:(BOOL)a4;
- (void)setEntityManager:(id)a3;
- (void)setInterruptedTransitionErrorDescriptions:(id)a3;
- (void)setPendingTransitionModel:(id)a3;
- (void)startPendingTransitionIfNeeded;
@end

@implementation PXStoryTransitionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptedTransitionErrorDescriptions, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_pendingTransitionModel, 0);
  objc_destroyWeak((id *)&self->_transitionSource);
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_entityManager);
  objc_storeStrong((id *)&self->_transitionProducer, 0);
  objc_storeStrong((id *)&self->_activeClipTransitions, 0);
}

- (void)setInterruptedTransitionErrorDescriptions:(id)a3
{
}

- (NSArray)interruptedTransitionErrorDescriptions
{
  return self->_interruptedTransitionErrorDescriptions;
}

- (NSError)currentError
{
  return self->_currentError;
}

- (PXStoryTransitionModel)pendingTransitionModel
{
  return self->_pendingTransitionModel;
}

- (void)setCurrentSegmentIdentifier:(int64_t)a3
{
  self->_currentSegmentIdentifier = a3;
}

- (int64_t)currentSegmentIdentifier
{
  return self->_currentSegmentIdentifier;
}

- (PXStoryTransitionSource)transitionSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionSource);
  return (PXStoryTransitionSource *)WeakRetained;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)activeTransition
{
  p_activeTransition = &self->_activeTransition;
  int64_t fromSegmentIdentifier = self->_activeTransition.fromSegmentIdentifier;
  int64_t toSegmentIdentifier = p_activeTransition->toSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (void)setEntityManager:(id)a3
{
}

- (PXGEntityManager)entityManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entityManager);
  return (PXGEntityManager *)WeakRetained;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v8 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(PXStoryTransitionProducer *)self->_transitionProducer fallbackTransitionReasons];
  [v4 addObjectsFromArray:v5];
  v6 = [(PXStoryTransitionController *)self interruptedTransitionErrorDescriptions];
  [v4 addObjectsFromArray:v6];

  if ([v4 count])
  {
    v7 = [v4 componentsJoinedByString:@"\n"];
    [v8 addAttachmentWithText:v7 name:@"TransitionErrors"];
  }
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v5 = [(PXStoryTransitionController *)self currentError];
  [v4 setObject:v5 forKeyedSubscript:@"Transitions"];

  v6 = (void *)[v4 copy];
  return v6;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  v7 = [WeakRetained timeline];

  id v8 = objc_loadWeakRetained((id *)&self->_model);
  v9 = v8;
  if (v8) {
    [v8 nominalPlaybackTime];
  }

  +[PXStoryAutoEditConfigurationFactory autoEditConfiguration];
  objc_claimAutoreleasedReturnValue();
  id v10 = objc_loadWeakRetained((id *)&self->_model);
  v11 = [v10 currentStyle];
  [v11 originalColorGradeCategory];
  objc_claimAutoreleasedReturnValue();

  [v7 size];
  PXRectWithOriginAndSize();
}

void __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  if (a2 >= 1)
  {
    uint64_t v46 = v11;
    uint64_t v47 = v10;
    uint64_t v48 = v9;
    uint64_t v49 = v8;
    uint64_t v50 = v7;
    uint64_t v51 = v6;
    uint64_t v52 = v4;
    uint64_t v53 = v5;
    uint64_t v14 = a2;
    v32 = (long long *)(a1 + 96);
    v31 = (long long *)(a1 + 120);
    do
    {
      long long v16 = a3[1];
      long long v43 = *a3;
      long long v44 = v16;
      long long v45 = a3[2];
      unint64_t v17 = *(unsigned __int8 *)(a4 + 48);
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"Segment: %ld @", *(void *)a4);
      v18 = @"??";
      if (v17 <= 0xA) {
        v18 = off_1E5DC5088[v17];
      }
      a4 += 200;
      v19 = v18;
      [*(id *)(a1 + 32) appendFormat:@" ➡️: %@\n", v19];
      [*(id *)(a1 + 32) appendString:@" Clips: "];
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_2;
      v34[3] = &unk_1E5DC2C88;
      v22 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      long long v36 = v43;
      long long v37 = v44;
      long long v38 = v45;
      long long v39 = *v32;
      uint64_t v40 = *((void *)v32 + 2);
      long long v23 = *v31;
      uint64_t v42 = *((void *)v31 + 2);
      long long v41 = v23;
      v34[4] = v21;
      id v35 = v20;
      v33[0] = v43;
      v33[1] = v44;
      v33[2] = v45;
      double v24 = *(double *)(a1 + 56);
      double v25 = *(double *)(a1 + 64);
      double v26 = *(double *)(a1 + 72);
      double v27 = *(double *)(a1 + 80);
      id v28 = v20;
      objc_msgSend(v22, "enumerateClipsInTimeRange:rect:usingBlock:", v33, v34, v24, v25, v26, v27);
      v29 = *(void **)(a1 + 32);
      v30 = [v28 componentsJoinedByString:@", "];
      [v29 appendFormat:@"%@ \n", v30];

      ++*(_DWORD *)(*(void *)(a1 + 88) + 4 * (char)v17);
      a3 += 3;
      --v14;
    }
    while (v14);
  }
}

void __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_2(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t *a5)
{
  if (a2 >= 1)
  {
    uint64_t v7 = a2;
    uint64_t v9 = (_OWORD *)(a1 + 48);
    uint64_t v10 = (CMTime *)(a1 + 96);
    v19 = (CMTime *)(a1 + 120);
    do
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      uint64_t v12 = *a5;
      long long v13 = a3[1];
      long long v25 = *a3;
      long long v26 = v13;
      long long v27 = a3[2];
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      uint64_t v14 = *(void **)(a1 + 32);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_3;
      v20[3] = &unk_1E5DC2C60;
      v20[4] = &v21;
      v20[5] = v12;
      [v14 enumerateClipIdentifiersForActiveTransitionsUsingBlock:v20];
      if (*((unsigned char *)v22 + 24))
      {
        long long v15 = v9[1];
        *(_OWORD *)&range.start.value = *v9;
        *(_OWORD *)&range.start.epoch = v15;
        *(_OWORD *)&range.duration.timescale = v9[2];
        *(_OWORD *)&time.value = v25;
        time.epoch = v26;
        if (CMTimeRangeContainsTime(&range, &time)) {
          long long v16 = @"▶️";
        }
        else {
          long long v16 = @"✅";
        }
      }
      else
      {
        long long v17 = v9[1];
        *(_OWORD *)&range.start.value = *v9;
        *(_OWORD *)&range.start.epoch = v17;
        *(_OWORD *)&range.duration.timescale = v9[2];
        CMTime time = *v10;
        int v18 = CMTimeRangeContainsTime(&range, &time);
        long long v16 = @"🟧";
        if (!v18)
        {
          *(_OWORD *)&range.start.value = v25;
          range.start.epoch = v26;
          CMTime time = *v19;
          if (CMTimeCompare(&range.start, &time) >= 0) {
            long long v16 = @"🟥";
          }
          else {
            long long v16 = @"✅";
          }
        }
      }
      [v11 appendFormat:v16];
      objc_msgSend(v11, "appendFormat:", @" %ld", v12);
      [*(id *)(a1 + 40) addObject:v11];
      a5 += 96;
      _Block_object_dispose(&v21, 8);

      a3 += 3;
      --v7;
    }
    while (v7);
  }
}

uint64_t __68__PXStoryTransitionController_diagnosticTextForHUDType_displaySize___block_invoke_3(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 40) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)_updateCurrentSegmentIdentifierIfNeeded
{
  v3 = [(PXStoryTransitionController *)self model];
  BOOL v4 = ([v3 shouldPauseTransitions] & 1) == 0 && objc_msgSend(v3, "lastPlaybackTimeChangeSource") == 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PXStoryTransitionController__updateCurrentSegmentIdentifierIfNeeded__block_invoke;
  v6[3] = &unk_1E5DC2C38;
  id v7 = v3;
  BOOL v8 = v4;
  id v5 = v3;
  [(PXStoryTransitionController *)self performChanges:v6];
}

void __70__PXStoryTransitionController__updateCurrentSegmentIdentifierIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setCurrentSegmentIdentifier:allowTransitions:", objc_msgSend(v3, "currentSegmentIdentifier"), *(unsigned __int8 *)(a1 + 40));
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ModelObservationContext_185142 == a5)
  {
    if ((a4 & 0x40020) != 0) {
      [(PXStoryTransitionController *)self _updateCurrentSegmentIdentifierIfNeeded];
    }
    if ((a4 & 0x400010000) != 0) {
      [(PXStoryTransitionController *)self _interruptActiveTransitions];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryTransitionController;
    [(PXStoryController *)&v9 observable:v8 didChange:a4 context:a5];
  }
}

- (void)setCurrentError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (NSError *)a3;
  p_currentError = &self->_currentError;
  id v7 = *p_currentError;
  if (v7 == v5)
  {
  }
  else
  {
    id v8 = v7;
    char v9 = [(NSError *)v7 isEqual:v5];

    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)p_currentError, a3);
      if (v5)
      {
        uint64_t v10 = PLStoryGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          uint64_t v12 = v5;
          _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "Transition controller encountered error: %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
  }
}

- (void)enumerateClipIdentifiersForActiveTransitionsUsingBlock:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  PXFilter();
}

uint64_t __86__PXStoryTransitionController_enumerateClipIdentifiersForActiveTransitionsUsingBlock___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)enumerateClipIdentifiersForPendingTransitionUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryTransitionController *)self pendingTransitionModel];
  uint64_t v6 = v5;
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  if (v5)
  {
    [v5 transitionInfo];
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    [v6 orderOutCompositionInfo];
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    [v6 orderInCompositionInfo];
  }
  else
  {
    uint64_t v24 = 0;
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    uint64_t v21 = 0;
    long long v19 = 0uLL;
    long long v20 = 0uLL;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PXStoryTransitionController_enumerateClipIdentifiersForPendingTransitionUsingBlock___block_invoke;
  v8[3] = &unk_1E5DC2BF0;
  long long v10 = v25;
  long long v11 = v26;
  uint64_t v12 = v27;
  long long v13 = v22;
  long long v14 = v23;
  uint64_t v15 = v24;
  uint64_t v18 = v21;
  long long v17 = v20;
  long long v16 = v19;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateClipIdentifiersUsingBlock:v8];
}

uint64_t __86__PXStoryTransitionController_enumerateClipIdentifiersForPendingTransitionUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v5 = *(_OWORD *)(a1 + 56);
  v11[0] = *(_OWORD *)(a1 + 40);
  v11[1] = v5;
  uint64_t v12 = *(void *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 96);
  v9[0] = *(_OWORD *)(a1 + 80);
  v9[1] = v6;
  uint64_t v10 = *(void *)(a1 + 112);
  PXStoryTransitionGetLayoutOrder(v11, (uint64_t)v9, a3, a4);
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v7();
}

- (BOOL)_canStartTransitionWithKind:(char)a3
{
  int v4 = a3;
  long long v5 = [(PXStoryTransitionController *)self model];
  uint64_t v6 = [v5 desiredPlayState];
  id v7 = [(PXStoryTransitionController *)self entityManager];

  char v8 = 0;
  BOOL v10 = [v5 viewMode] == 4 && (v4 - 4) < 0xFFFFFFFD;
  if (v6 == 1 && !v10 && v7)
  {
    if (([v5 isScrolling] & 1) != 0
      || ([v5 inLiveResize] & 1) != 0
      || ([v5 isTouching] & 1) != 0
      || ([v5 isPerformingViewControllerTransition] & 1) != 0)
    {
      char v8 = 0;
    }
    else
    {
      uint64_t v12 = +[PXStorySettings sharedInstance];
      char v8 = [v12 wantsTransitions];
    }
  }

  return v8;
}

- (void)setActiveTransition:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_activeTransition = &self->_activeTransition;
  int64_t fromSegmentIdentifier = self->_activeTransition.fromSegmentIdentifier;
  int64_t toSegmentIdentifier = self->_activeTransition.toSegmentIdentifier;
  if (fromSegmentIdentifier != a3.var0 || toSegmentIdentifier != a3.var1)
  {
    int64_t var1 = a3.var1;
    int64_t var0 = a3.var0;
    if (fromSegmentIdentifier | toSegmentIdentifier)
    {
      BOOL v10 = [(PXStoryTransitionController *)self log];
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          int v17 = 134217984;
          uint64_t v18 = [(PXStoryTransitionController *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryTransitionControllerChangedActiveTransition", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    if (var0 | var1)
    {
      long long v13 = [(PXStoryTransitionController *)self log];
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v15 = v14;
        if (os_signpost_enabled(v13))
        {
          uint64_t v16 = [(PXStoryTransitionController *)self logContext];
          int v17 = 134218496;
          uint64_t v18 = v16;
          __int16 v19 = 2048;
          int64_t v20 = var0;
          __int16 v21 = 2048;
          int64_t v22 = var1;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryTransitionControllerChangedActiveTransition", "Context=%{signpost.telemetry:string2}lu segmentIdentifier: %ld -> %ld", (uint8_t *)&v17, 0x20u);
        }
      }
    }
    p_activeTransition->int64_t fromSegmentIdentifier = var0;
    p_activeTransition->int64_t toSegmentIdentifier = var1;
    [(PXStoryTransitionController *)self signalChange:1];
  }
}

- (void)setPendingTransitionModel:(id)a3
{
  long long v5 = (PXStoryTransitionModel *)a3;
  if (self->_pendingTransitionModel != v5)
  {
    objc_storeStrong((id *)&self->_pendingTransitionModel, a3);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57__PXStoryTransitionController_setPendingTransitionModel___block_invoke;
      v6[3] = &unk_1E5DC2BC8;
      void v6[4] = self;
      id v7 = v5;
      [(PXStoryTransitionController *)self performChanges:v6];
    }
  }
}

uint64_t __57__PXStoryTransitionController_setPendingTransitionModel___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 40) segmentTransitionInfo];
  int v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setActiveTransition:", v3, v2);
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionController;
  [(PXStoryController *)&v3 performChanges:a3];
}

- (void)_handleTransitionCompleted:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(PXStoryTransitionController *)self log];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = [(PXStoryTransitionController *)self logContext];
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryTransitionActive", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }
  }

  [(NSMutableArray *)self->_activeClipTransitions removeObject:v4];
  if (![(NSMutableArray *)self->_activeClipTransitions count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PXStoryTransitionController__handleTransitionCompleted___block_invoke;
    v8[3] = &unk_1E5DC2B78;
    void v8[4] = self;
    [(PXStoryTransitionController *)self performChanges:v8];
  }
}

uint64_t __58__PXStoryTransitionController__handleTransitionCompleted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveTransition:", 0, 0);
}

- (void)_reportInterruptedTransitionForNewTransitionBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4
{
  uint64_t v7 = [(PXStoryTransitionController *)self activeTransition];
  uint64_t v9 = v8;
  uint64_t v10 = [(PXStoryTransitionController *)self interruptedTransitionErrorDescriptions];
  uint64_t v11 = (void *)v10;
  os_signpost_id_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    os_signpost_id_t v12 = (void *)v10;
  }
  id v13 = v12;

  os_signpost_id_t v14 = NSString;
  os_signpost_id_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%ld → %ld", a3, a4);
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld → %ld", v7, v9);
  int v17 = [v14 stringWithFormat:@"New transition (%@) started while existing one (%@) was in progress.", v15, v16];
  id v26 = [v13 arrayByAddingObject:v17];

  [(PXStoryTransitionController *)self setInterruptedTransitionErrorDescriptions:v26];
  uint64_t v18 = [v26 count];
  long long v25 = PXStoryErrorCreateWithCodeDebugFormat(18, @"Transitions got interrupted %ld times.", v19, v20, v21, v22, v23, v24, v18);
  [(PXStoryTransitionController *)self setCurrentError:v25];
}

- (void)_interruptActiveTransitions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(PXStoryTransitionController *)self setPendingTransitionModel:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_super v3 = (void *)[(NSMutableArray *)self->_activeClipTransitions copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v9 + 1) + 8 * v7);
        [v8 performChanges:&__block_literal_global_15_185168];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __58__PXStoryTransitionController__interruptActiveTransitions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (void)_startTransition:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXStoryTransitionController *)self log];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = [(PXStoryTransitionController *)self logContext];
      __int16 v21 = 2114;
      id v22 = v4;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXStoryTransitionActive", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
    }
  }

  if (v4)
  {
    [(NSMutableArray *)self->_activeClipTransitions addObject:v4];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    id v8 = [v4 completionHandler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__PXStoryTransitionController__startTransition___block_invoke;
    v14[3] = &unk_1E5DC2BA0;
    objc_copyWeak(&v16, (id *)buf);
    objc_copyWeak(&v17, &location);
    id v9 = v8;
    id v15 = v9;
    [v4 setCompletionHandler:v14];
    long long v10 = [(PXStoryTransitionController *)self model];
    long long v11 = [v10 animationController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__PXStoryTransitionController__startTransition___block_invoke_2;
    v12[3] = &unk_1E5DD1110;
    id v13 = v4;
    [v11 performChanges:v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __48__PXStoryTransitionController__startTransition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleTransitionCompleted:v3];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __48__PXStoryTransitionController__startTransition___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addAnimation:*(void *)(a1 + 32)];
}

- (void)startPendingTransitionIfNeeded
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryTransitionController *)self pendingTransitionModel];
  if (v3)
  {
    [(PXStoryTransitionController *)self setPendingTransitionModel:0];
    id v4 = [(PXStoryTransitionController *)self model];
    uint64_t v5 = objc_alloc_init(PXStoryTransitionConfiguration);
    [(PXStoryTransitionConfiguration *)v5 setTransitionModel:v3];
    os_signpost_id_t v6 = [(PXStoryTransitionController *)self entityManager];
    [(PXStoryTransitionConfiguration *)v5 setEntityManager:v6];

    os_signpost_id_t v7 = [(PXStoryTransitionController *)self transitionSource];
    [(PXStoryTransitionConfiguration *)v5 setSource:v7];

    id v8 = [v4 timeline];
    [(PXStoryTransitionConfiguration *)v5 setTimeline:v8];

    id v9 = [v4 timelineSpec];
    [(PXStoryTransitionConfiguration *)v5 setTimelineSpec:v9];

    long long v10 = [(PXStoryTransitionProducer *)self->_transitionProducer transitionsWithConfiguration:v5];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          [(PXStoryTransitionController *)self _startTransition:*(void *)(*((void *)&v25 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }
    if (![v10 count])
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __61__PXStoryTransitionController_startPendingTransitionIfNeeded__block_invoke;
      v24[3] = &unk_1E5DC2B78;
      v24[4] = self;
      [(PXStoryTransitionController *)self performChanges:v24];
    }
    id v15 = [(PXStoryTransitionProducer *)self->_transitionProducer fallbackTransitionReasons];
    uint64_t v16 = [v15 count];

    if (v16 >= 1)
    {
      uint64_t v23 = PXStoryErrorCreateWithCodeDebugFormat(18, @"Transitions fell back to cuts %ld times.", v17, v18, v19, v20, v21, v22, v16);
      [(PXStoryTransitionController *)self setCurrentError:v23];
    }
  }
}

uint64_t __61__PXStoryTransitionController_startPendingTransitionIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveTransition:", 0, 0);
}

- (void)_updatePendingTransitionModelWithSegmentTransitionInfo:(id)a3
{
  id v3 = [(PXStoryTransitionController *)self model];
  id v4 = [v3 timeline];

  [v4 size];
  PXRectWithOriginAndSize();
}

void __86__PXStoryTransitionController__updatePendingTransitionModelWithSegmentTransitionInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    [v5 timeRangeForSegmentWithIdentifier:a2];
    os_signpost_id_t v6 = *(void **)(a1 + 32);
  }
  else
  {
    os_signpost_id_t v6 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = __86__PXStoryTransitionController__updatePendingTransitionModelWithSegmentTransitionInfo___block_invoke_2;
  v9[3] = &unk_1E5DC2B28;
  os_signpost_id_t v7 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 88);
  id v10 = v7;
  uint64_t v11 = a3;
  v8[0] = v13;
  v8[1] = v14;
  v8[2] = v15;
  objc_msgSend(v6, "enumerateClipsInTimeRange:rect:usingBlock:", v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __86__PXStoryTransitionController__updatePendingTransitionModelWithSegmentTransitionInfo___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v17 = v5;
    uint64_t v18 = v6;
    uint64_t v7 = a2;
    uint64_t v8 = result;
    id v9 = (void *)(a5 + 16);
    do
    {
      uint64_t v10 = *(v9 - 2);
      uint64_t v11 = *(v9 - 1);
      memcpy(__dst, v9, sizeof(__dst));
      uint64_t result = [(id)objc_opt_class() _isSupportedTransitionWithKind:*(char *)(v8 + 56) forClipWithResourceKind:v11];
      if (result)
      {
        char v12 = *(void **)(v8 + 40);
        uint64_t v13 = *(void *)(v8 + 48);
        v14[0] = v10;
        v14[1] = v11;
        memcpy(v15, __dst, sizeof(v15));
        uint64_t result = [v12 addClipWithIdentifier:v10 info:v14 event:v13];
      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
  return result;
}

- (void)setCurrentSegmentIdentifier:(int64_t)a3 allowTransitions:(BOOL)a4
{
  int64_t currentSegmentIdentifier = self->_currentSegmentIdentifier;
  if (currentSegmentIdentifier != a3)
  {
    BOOL v5 = a4;
    self->_int64_t currentSegmentIdentifier = a3;
    uint64_t v8 = [(PXStoryTransitionController *)self activeTransition];
    if (v8 | v9)
    {
      uint64_t v10 = +[PXStoryTransitionsSettings sharedInstance];
      uint64_t v11 = v10;
      if (v5 && ([v10 suppressInterruptedTransitionErrors] & 1) == 0) {
        [(PXStoryTransitionController *)self _reportInterruptedTransitionForNewTransitionBetweenSegmentWithIdentifier:currentSegmentIdentifier andSegmentWithIdentifier:a3];
      }
      [(PXStoryTransitionController *)self _interruptActiveTransitions];
    }
    if (v5)
    {
      char v12 = [(PXStoryTransitionController *)self model];
      id v14 = [v12 timeline];

      uint64_t v13 = [v14 indexOfSegmentWithIdentifier:currentSegmentIdentifier];
      if (v13 + 1 == [v14 indexOfSegmentWithIdentifier:a3]) {
        -[PXStoryTransitionController _updatePendingTransitionModelWithSegmentTransitionInfo:](self, "_updatePendingTransitionModelWithSegmentTransitionInfo:", currentSegmentIdentifier, a3);
      }
    }
  }
}

- (PXStoryTransitionController)initWithModel:(id)a3 transitionSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryTransitionController;
  uint64_t v8 = [(PXStoryController *)&v20 initWithObservableModel:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_model, v6);
    [v6 registerChangeObserver:v9 context:ModelObservationContext_185142];

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_model);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__PXStoryTransitionController_initWithModel_transitionSource___block_invoke;
    v18[3] = &unk_1E5DCEE38;
    char v12 = v9;
    uint64_t v19 = v12;
    [WeakRetained performChanges:v18];

    v12->_activeTransition.int64_t fromSegmentIdentifier = 0;
    v12->_activeTransition.int64_t toSegmentIdentifier = 0;
    objc_storeWeak((id *)&v12->_transitionSource, v7);
    uint64_t v13 = objc_alloc_init(PXStoryTransitionProducer);
    transitionProducer = v12->_transitionProducer;
    v12->_transitionProducer = v13;

    v12->_int64_t currentSegmentIdentifier = [v6 currentSegmentIdentifier];
    long long v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeClipTransitions = v12->_activeClipTransitions;
    v12->_activeClipTransitions = v15;
  }
  return v9;
}

uint64_t __62__PXStoryTransitionController_initWithModel_transitionSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:6];
}

+ (BOOL)_isSupportedTransitionWithKind:(char)a3 forClipWithResourceKind:(int64_t)a4
{
  if (_isSupportedTransitionWithKind_forClipWithResourceKind__onceToken != -1) {
    dispatch_once(&_isSupportedTransitionWithKind_forClipWithResourceKind__onceToken, &__block_literal_global_185188);
  }
  BOOL v5 = (void *)_isSupportedTransitionWithKind_forClipWithResourceKind__supportedTransitionKinds;
  return [v5 containsIndex:a4];
}

void __86__PXStoryTransitionController__isSupportedTransitionWithKind_forClipWithResourceKind___block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:1];
  [v2 addIndex:3];
  [v2 addIndex:4];
  [v2 addIndex:5];
  uint64_t v0 = [v2 copy];
  v1 = (void *)_isSupportedTransitionWithKind_forClipWithResourceKind__supportedTransitionKinds;
  _isSupportedTransitionWithKind_forClipWithResourceKind__supportedTransitionKinds = v0;
}

@end