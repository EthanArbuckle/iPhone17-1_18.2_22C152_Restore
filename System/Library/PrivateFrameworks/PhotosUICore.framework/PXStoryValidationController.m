@interface PXStoryValidationController
+ (id)_validateTimeline:(id)a3 progress:(id)a4;
- (BOOL)isActive;
- (NSError)timelineValidationError;
- (NSProgress)timelineValidationProgress;
- (OS_dispatch_queue)workQueue;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryModel)model;
- (PXStoryTimeline)timelineToValidate;
- (PXStoryValidationController)initWithObservableModel:(id)a3;
- (PXStoryValidationController)initWithViewModel:(id)a3;
- (PXStoryViewModel)viewModel;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (int64_t)timelineValidationCount;
- (void)_handleTimelineValidationError:(id)a3 progress:(id)a4;
- (void)_invalidateModel;
- (void)_invalidateTimelineToValidate;
- (void)_invalidateTimelineValidation;
- (void)_updateModel;
- (void)_updateTimelineToValidate;
- (void)_updateTimelineValidation;
- (void)configureUpdater:(id)a3;
- (void)dealloc;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setIsActive:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setTimelineToValidate:(id)a3;
- (void)setTimelineValidationCount:(int64_t)a3;
- (void)setTimelineValidationError:(id)a3;
- (void)setTimelineValidationProgress:(id)a3;
@end

@implementation PXStoryValidationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timelineValidationError, 0);
  objc_storeStrong((id *)&self->_timelineValidationProgress, 0);
  objc_storeStrong((id *)&self->_timelineToValidate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setTimelineValidationCount:(int64_t)a3
{
  self->_timelineValidationCount = a3;
}

- (int64_t)timelineValidationCount
{
  return self->_timelineValidationCount;
}

- (NSError)timelineValidationError
{
  return self->_timelineValidationError;
}

- (NSProgress)timelineValidationProgress
{
  return self->_timelineValidationProgress;
}

- (PXStoryTimeline)timelineToValidate
{
  return self->_timelineToValidate;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PXStoryViewModel *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ModelObservationContext_48993 == a5)
  {
    if ((a4 & 0x20000010) != 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __60__PXStoryValidationController_observable_didChange_context___block_invoke;
      v10[3] = &unk_1E5DB3E18;
      v10[4] = self;
      [(PXStoryController *)self performChanges:v10];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryValidationController;
    [(PXStoryController *)&v9 observable:v8 didChange:a4 context:a5];
  }
}

uint64_t __60__PXStoryValidationController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateTimelineToValidate];
}

- (void)handleModelChange:(unint64_t)a3
{
  char v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXStoryValidationController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((v3 & 0x40) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__PXStoryValidationController_handleModelChange___block_invoke;
    v5[3] = &unk_1E5DB3E18;
    v5[4] = self;
    [(PXStoryController *)self performChanges:v5];
  }
}

uint64_t __49__PXStoryValidationController_handleModelChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateModel];
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v5 = [(PXStoryValidationController *)self timelineValidationError];
  [v4 setObject:v5 forKeyedSubscript:@"TimelineValidation"];

  objc_super v6 = (void *)[v4 copy];
  return v6;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(PXStoryValidationController *)self isActive])
  {
    objc_super v6 = [(PXStoryValidationController *)self timelineToValidate];

    if (v6)
    {
      v7 = [(PXStoryValidationController *)self timelineValidationProgress];

      if (v7)
      {
        id v8 = @"Validating…";
      }
      else
      {
        objc_super v9 = [(PXStoryValidationController *)self timelineValidationError];

        id v10 = [NSString alloc];
        v11 = v10;
        if (v9)
        {
          v12 = [(PXStoryValidationController *)self timelineValidationError];
          v13 = PXStoryErrorDetailsDescription(v12);
          id v8 = (__CFString *)[v11 initWithFormat:@"❌ %@", v13];
        }
        else
        {
          id v8 = (__CFString *)[v10 initWithFormat:@"✅"];
        }
      }
    }
    else
    {
      id v8 = @"Waiting…";
    }
    [v5 appendFormat:@"Timeline: %@\n", v8];
    objc_msgSend(v5, "appendFormat:", @"Validation Count: %li\n", -[PXStoryValidationController timelineValidationCount](self, "timelineValidationCount"));
  }
  else
  {
    [v5 appendString:@"⚠️ Inactive"];
  }
  v14 = (void *)[v5 copy];

  return v14;
}

- (void)_handleTimelineValidationError:(id)a3 progress:(id)a4
{
  id v6 = a3;
  if (([a4 isCancelled] & 1) == 0)
  {
    [(PXStoryValidationController *)self setTimelineValidationProgress:0];
    [(PXStoryValidationController *)self setTimelineValidationError:v6];
    [(PXStoryValidationController *)self setTimelineValidationCount:[(PXStoryValidationController *)self timelineValidationCount] + 1];
  }
}

- (void)_updateTimelineValidation
{
  if ([(PXStoryValidationController *)self isActive])
  {
    char v3 = [(PXStoryValidationController *)self timelineToValidate];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
      objc_initWeak(&location, self);
      id v5 = [(PXStoryValidationController *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__PXStoryValidationController__updateTimelineValidation__block_invoke;
      block[3] = &unk_1E5DCEA88;
      id v6 = v4;
      id v8 = v6;
      id v9 = v3;
      id v10 = self;
      objc_copyWeak(&v11, &location);
      dispatch_async(v5, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      id v6 = 0;
    }
    [(PXStoryValidationController *)self setTimelineValidationProgress:v6];
  }
}

void __56__PXStoryValidationController__updateTimelineValidation__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v2 = +[PXStoryValidationController _validateTimeline:*(void *)(a1 + 40) progress:*(void *)(a1 + 32)];
    char v3 = [*(id *)(a1 + 48) storyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PXStoryValidationController__updateTimelineValidation__block_invoke_2;
    block[3] = &unk_1E5DD2548;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    id v6 = v2;
    id v7 = *(id *)(a1 + 32);
    id v4 = v2;
    dispatch_async(v3, block);

    objc_destroyWeak(&v8);
  }
}

void __56__PXStoryValidationController__updateTimelineValidation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleTimelineValidationError:*(void *)(a1 + 32) progress:*(void *)(a1 + 40)];
}

- (void)_invalidateTimelineValidation
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTimelineValidation];
}

- (void)_updateTimelineToValidate
{
  id v6 = [(PXStoryValidationController *)self model];
  char v3 = +[PXStorySettings sharedInstance];
  if ([v3 validationShouldWaitForTimelineToBeReadyToPlay])
  {
    uint64_t v4 = [v6 timelineAttributes] & 3;

    if (!v4)
    {
      id v5 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v5 = [v6 timeline];
LABEL_6:
  [(PXStoryValidationController *)self setTimelineToValidate:v5];
}

- (void)_invalidateTimelineToValidate
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTimelineToValidate];
}

- (void)_updateModel
{
  id v4 = [(PXStoryValidationController *)self viewModel];
  char v3 = [v4 mainModel];
  [(PXStoryValidationController *)self setModel:v3];
}

- (void)_invalidateModel
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateModel];
}

- (void)setTimelineValidationError:(id)a3
{
  id v5 = (NSError *)a3;
  p_timelineValidationError = &self->_timelineValidationError;
  if (self->_timelineValidationError != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_timelineValidationError, a3);
    id v7 = [(PXStoryValidationController *)self errorReporter];
    [v7 setError:*p_timelineValidationError forComponent:@"TimelineValidation"];

    id v5 = v8;
  }
}

- (void)setTimelineValidationProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_timelineValidationProgress = &self->_timelineValidationProgress;
  if (*p_timelineValidationProgress != v5)
  {
    id v7 = v5;
    [(NSProgress *)*p_timelineValidationProgress cancel];
    objc_storeStrong((id *)p_timelineValidationProgress, a3);
    id v5 = v7;
  }
}

- (void)setTimelineToValidate:(id)a3
{
  id v7 = (PXStoryTimeline *)a3;
  id v5 = self->_timelineToValidate;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryTimeline *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timelineToValidate, a3);
      [(PXStoryValidationController *)self _invalidateTimelineValidation];
    }
  }
}

- (void)setModel:(id)a3
{
  id v5 = (PXStoryModel *)a3;
  model = self->_model;
  if (model != v5)
  {
    id v7 = v5;
    [(PXStoryModel *)model unregisterChangeObserver:self context:ModelObservationContext_48993];
    objc_storeStrong((id *)&self->_model, a3);
    [(PXStoryModel *)self->_model registerChangeObserver:self context:ModelObservationContext_48993];
    [(PXStoryValidationController *)self _invalidateTimelineToValidate];
    id v5 = v7;
  }
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryValidationController *)self _invalidateTimelineValidation];
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryValidationController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateModel, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateTimelineToValidate];
  [v3 addUpdateSelector:sel__updateTimelineValidation];
}

- (void)dealloc
{
  [(NSProgress *)self->_timelineValidationProgress cancel];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryValidationController;
  [(PXStoryValidationController *)&v3 dealloc];
}

- (PXStoryValidationController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXStoryValidationController;
  id v5 = [(PXStoryController *)&v24 initWithObservableModel:v4];
  char v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_viewModel, v4);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__PXStoryValidationController_initWithViewModel___block_invoke;
    v22[3] = &unk_1E5DD1EF0;
    id v8 = v6;
    v23 = v8;
    [v4 performChanges:v22];

    id v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = objc_claimAutoreleasedReturnValue();
    id v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create(v11, v13);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v14;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_viewModel);
    uint64_t v17 = [WeakRetained errorReporter];
    errorReporter = v8->_errorReporter;
    v8->_errorReporter = (PXStoryErrorReporter *)v17;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__PXStoryValidationController_initWithViewModel___block_invoke_2;
    v20[3] = &unk_1E5DB3E18;
    v21 = v8;
    [(PXStoryController *)v21 performChanges:v20];
  }
  return v6;
}

uint64_t __49__PXStoryValidationController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:16];
}

uint64_t __49__PXStoryValidationController_initWithViewModel___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateModel];
}

- (PXStoryValidationController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryValidationController.m", 38, @"%s is not available as initializer", "-[PXStoryValidationController initWithObservableModel:]");

  abort();
}

+ (id)_validateTimeline:(id)a3 progress:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v4 size];
  PXRectWithOriginAndSize();
}

void __58__PXStoryValidationController__validateTimeline_progress___block_invoke(uint64_t a1, uint64_t a2, long long *a3, long long *a4)
{
  uint64_t v62 = 0;
  long long v60 = PXStoryTransitionInfoNone;
  long long v61 = xmmword_1AB35CB38;
  if (a2 >= 1)
  {
    uint64_t v6 = a2;
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    do
    {
      aBlock[0] = v9;
      aBlock[1] = 3221225472;
      aBlock[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_2;
      aBlock[3] = &unk_1E5DB3E68;
      id v58 = *(id *)(a1 + 32);
      uint64_t v59 = v8;
      id v10 = _Block_copy(aBlock);
      long long v11 = a3[1];
      long long v54 = *a3;
      long long v55 = v11;
      long long v12 = a3[1];
      long long v56 = a3[2];
      long long v13 = a4[11];
      long long v51 = a4[10];
      long long v52 = v13;
      uint64_t v53 = *((void *)a4 + 24);
      long long v14 = a4[7];
      long long v48 = a4[6];
      long long v49 = v14;
      long long v15 = a4[9];
      *(_OWORD *)v50 = a4[8];
      *(_OWORD *)&v50[16] = v15;
      long long v16 = a4[3];
      long long v44 = a4[2];
      long long v45 = v16;
      long long v17 = a4[5];
      long long v46 = a4[4];
      long long v47 = v17;
      long long v18 = a4[1];
      long long v42 = *a4;
      long long v43 = v18;
      long long v19 = a3[2];
      *(void *)&time1_16[8] = *((void *)&v12 + 1);
      *(_OWORD *)&time1_16[16] = v19;
      long long v40 = *(_OWORD *)&time1_16[8];
      uint64_t v41 = *((void *)&v19 + 1);
      long long time1 = *(_OWORD *)&time1_16[8];
      *(void *)time1_16 = *((void *)&v19 + 1);
      CMTime time2 = *(CMTime *)&v50[8];
      if (CMTimeCompare((CMTime *)&time1, &time2) == 1)
      {
        v20 = *(void **)(a1 + 32);
        v21 = NSString;
        long long time1 = v40;
        *(void *)time1_16 = v41;
        v22 = PXStoryTimeDescription((CMTime *)&time1);
        long long time1 = *(_OWORD *)&v50[8];
        *(void *)time1_16 = *(void *)&v50[24];
        v23 = PXStoryTimeDescription((CMTime *)&time1);
        objc_super v24 = [v21 stringWithFormat:@"segment duration exceeding maximum allowed (#%li: %@ > %@)", v8, v22, v23];
        [v20 addObject:v24];

        uint64_t v9 = v29;
        uint64_t v6 = a2;
      }
      time2.value = 0;
      *(void *)&time2.timescale = &time2;
      time2.epoch = 0x2020000000;
      uint64_t v37 = 0;
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      uint64_t v35 = 0;
      v25 = *(void **)(a1 + 40);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_6;
      v31[3] = &unk_1E5DB3E90;
      v31[4] = &time2;
      v31[5] = &v32;
      long long time1 = v54;
      *(_OWORD *)time1_16 = v55;
      *(_OWORD *)&time1_16[16] = v56;
      objc_msgSend(v25, "enumerateClipsInTimeRange:rect:usingBlock:", &time1, v31, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
      if (*(void *)(*(void *)&time2.timescale + 24) == 1) {
        uint64_t v26 = v33[3];
      }
      else {
        uint64_t v26 = 0;
      }
      v27 = (void (*)(void *, uint64_t, long long *, void))v10[2];
      long long time1 = v60;
      *(_OWORD *)time1_16 = v61;
      *(void *)&time1_16[16] = v62;
      v27(v10, v26, &time1, 0);
      v28 = (void (*)(void *, uint64_t, long long *, uint64_t))v10[2];
      long long time1 = v45;
      *(_OWORD *)time1_16 = v46;
      *(void *)&time1_16[16] = v47;
      v28(v10, v26, &time1, 1);
      long long v60 = v45;
      long long v61 = v46;
      uint64_t v62 = v47;
      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(&time2, 8);

      ++v8;
      a4 = (long long *)((char *)a4 + 200);
      a3 += 3;
    }
    while (v6 != v8);
  }
}

void __58__PXStoryValidationController__validateTimeline_progress___block_invoke_2(uint64_t a1, uint64_t a2, unsigned __int8 *a3, char a4)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_3;
  aBlock[3] = &unk_1E5DB3E40;
  id v8 = *(id *)(a1 + 32);
  char v25 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  id v23 = v8;
  uint64_t v24 = v9;
  id v10 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_4;
  v20[3] = &unk_1E5DD3128;
  id v11 = v10;
  id v21 = v11;
  long long v12 = _Block_copy(v20);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__PXStoryValidationController__validateTimeline_progress___block_invoke_5;
  v18[3] = &unk_1E5DD3128;
  id v19 = v11;
  id v13 = v11;
  long long v14 = _Block_copy(v18);
  long long v15 = v14;
  if (*a3 <= 0xAuLL)
  {
    switch(*a3)
    {
      case 5u:
        switch(a3[29])
        {
          case 1u:
            if ((unint64_t)(a2 - 6) < 2) {
              goto LABEL_27;
            }
            long long v14 = v12;
            if (a2 == 5) {
              goto LABEL_27;
            }
            break;
          case 2u:
            if ((unint64_t)(a2 - 6) < 2) {
              goto LABEL_27;
            }
            long long v14 = v12;
            if (a2 == 4) {
              goto LABEL_27;
            }
            break;
          case 3u:
            if ((unint64_t)(a2 - 4) < 2) {
              goto LABEL_27;
            }
            long long v14 = v12;
            if (a2 == 7) {
              goto LABEL_27;
            }
            break;
          case 4u:
            if ((unint64_t)(a2 - 4) < 2) {
              goto LABEL_27;
            }
            long long v14 = v12;
            if (a2 == 6) {
              goto LABEL_27;
            }
            break;
          default:
            goto LABEL_28;
        }
        break;
      case 6u:
      case 9u:
        int v16 = (char)a3[29];
        if (v16 == 2)
        {
          long long v14 = v12;
          if (a2 == 2) {
            goto LABEL_27;
          }
        }
        else if (v16 == 1)
        {
          long long v14 = v12;
          if (a2 == 3) {
            goto LABEL_27;
          }
        }
        break;
      case 7u:
        int v17 = (char)a3[29];
        if (v17 == 2)
        {
          long long v14 = v12;
          if ((unint64_t)(a2 - 11) > 2) {
            break;
          }
        }
        else
        {
          if (v17 != 1) {
            break;
          }
          long long v14 = v12;
          if ((unint64_t)(a2 - 8) >= 3) {
            break;
          }
        }
LABEL_27:
        (*((void (**)(void))v14 + 2))();
        break;
      default:
        break;
    }
  }
LABEL_28:
}

uint64_t __58__PXStoryValidationController__validateTimeline_progress___block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v14 = v5;
    uint64_t v15 = v6;
    uint64_t v8 = a2;
    do
    {
      if (*(void *)(a5 + 8) == 1)
      {
        ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
        long long v9 = *(_OWORD *)(a5 + 632);
        v12[4] = *(_OWORD *)(a5 + 616);
        v12[5] = v9;
        v12[6] = *(_OWORD *)(a5 + 648);
        uint64_t v13 = *(void *)(a5 + 664);
        long long v10 = *(_OWORD *)(a5 + 568);
        v12[0] = *(_OWORD *)(a5 + 552);
        v12[1] = v10;
        long long v11 = *(_OWORD *)(a5 + 600);
        v12[2] = *(_OWORD *)(a5 + 584);
        v12[3] = v11;
        PXStoryClipKenBurnsAnimationInfoGetMovementType(v12);
      }
      a5 += 768;
      --v8;
    }
    while (v8);
  }
  return result;
}

void __58__PXStoryValidationController__validateTimeline_progress___block_invoke_3(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = (objc_class *)NSString;
  id v5 = a2;
  id v6 = [v4 alloc];
  id v7 = @"after";
  if (!*(unsigned char *)(a1 + 48)) {
    id v7 = @"before";
  }
  id v8 = (id)[v6 initWithFormat:@"%@ (%@ segment #%li)", v5, v7, *(void *)(a1 + 40)];

  [v3 addObject:v8];
}

uint64_t __58__PXStoryValidationController__validateTimeline_progress___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__PXStoryValidationController__validateTimeline_progress___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end