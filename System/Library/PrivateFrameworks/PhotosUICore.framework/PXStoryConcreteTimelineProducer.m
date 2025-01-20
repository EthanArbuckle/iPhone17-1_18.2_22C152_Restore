@interface PXStoryConcreteTimelineProducer
+ (OS_dispatch_queue)workQueue;
- (OS_os_log)log;
- (PXStoryConcreteTimelineProducer)init;
- (double)initialProductionTimeLimit;
- (double)subsequentProductionSimulatedDelay;
- (double)subsequentProductionTimeLimit;
- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
- (int64_t)initialProductionCountLimit;
- (int64_t)subsequentProductionCountLimit;
- (void)setInitialProductionCountLimit:(int64_t)a3;
- (void)setInitialProductionTimeLimit:(double)a3;
- (void)setSubsequentProductionCountLimit:(int64_t)a3;
- (void)setSubsequentProductionSimulatedDelay:(double)a3;
- (void)setSubsequentProductionTimeLimit:(double)a3;
@end

@implementation PXStoryConcreteTimelineProducer

- (void).cxx_destruct
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setSubsequentProductionSimulatedDelay:(double)a3
{
  self->_subsequentProductionSimulatedDelay = a3;
}

- (double)subsequentProductionSimulatedDelay
{
  return self->_subsequentProductionSimulatedDelay;
}

- (void)setSubsequentProductionCountLimit:(int64_t)a3
{
  self->_subsequentProductionCountLimit = a3;
}

- (int64_t)subsequentProductionCountLimit
{
  return self->_subsequentProductionCountLimit;
}

- (void)setSubsequentProductionTimeLimit:(double)a3
{
  self->_subsequentProductionTimeLimit = a3;
}

- (double)subsequentProductionTimeLimit
{
  return self->_subsequentProductionTimeLimit;
}

- (void)setInitialProductionCountLimit:(int64_t)a3
{
  self->_initialProductionCountLimit = a3;
}

- (int64_t)initialProductionCountLimit
{
  return self->_initialProductionCountLimit;
}

- (void)setInitialProductionTimeLimit:(double)a3
{
  self->_initialProductionTimeLimit = a3;
}

- (double)initialProductionTimeLimit
{
  return self->_initialProductionTimeLimit;
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v8 = a5;
  if ((a4 & 5) == 5) {
    PXAssertGetLog();
  }
  v9 = [[PXStoryConcreteTimelineParser alloc] initWithConfiguration:v40];
  v10 = [(PXStoryConcreteTimelineProducer *)self log];
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
  *(void *)v57 = 0;
  v58 = v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DC84F0;
  v12 = v9;
  v50 = v12;
  v13 = v10;
  v51 = v13;
  os_signpost_id_t v54 = v11;
  id v38 = v8;
  id v52 = v38;
  v53 = v57;
  v14 = (void (**)(void))_Block_copy(aBlock);
  v15 = v13;
  v16 = v15;
  unint64_t v17 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v18 = PXStoryProducerRequestOptionsDescription(a4);
    *(_DWORD *)buf = 138543362;
    v56 = v18;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v11, "StoryTimelineTotalProduction", "Options=%{public}@", buf, 0xCu);
  }
  if ((a4 & 5) != 4)
  {
    if ((a4 & 2) != 0)
    {
      uint64_t v19 = objc_msgSend(v40, "rangeOfPrioritizedDisplayAssetResources", v38);
      if (v20) {
        [(PXStoryConcreteTimelineParser *)v12 setPreferredInitialDisplayAssetResourceIndex:v19];
      }
      v21 = +[PXStoryConcreteTimelineSettings sharedInstance];
      [v21 rotationInitialProductionTimeLimit];
      -[PXStoryConcreteTimelineParser setParseTimeLimit:](v12, "setParseTimeLimit:");
      -[PXStoryConcreteTimelineParser setParseCountLimit:](v12, "setParseCountLimit:", [v21 rotationInitialProductionCountLimit]);
    }
    else
    {
      [(PXStoryConcreteTimelineProducer *)self initialProductionTimeLimit];
      -[PXStoryConcreteTimelineParser setParseTimeLimit:](v12, "setParseTimeLimit:");
      [(PXStoryConcreteTimelineParser *)v12 setParseCountLimit:[(PXStoryConcreteTimelineProducer *)self initialProductionCountLimit]];
    }
    v22 = v16;
    v23 = v22;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v11, "StoryTimelineInitialProduction", "", buf, 2u);
    }

    v14[2](v14);
    v24 = v23;
    v25 = v24;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_END, v11, "StoryTimelineInitialProduction", "", buf, 2u);
    }
  }
  if ([(PXStoryConcreteTimelineParser *)v12 isAtEnd] && v58[24])
  {
    v26 = v16;
    v27 = v26;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v27, OS_SIGNPOST_INTERVAL_END, v11, "StoryTimelineTotalProduction", "", buf, 2u);
    }
    id v28 = 0;
  }
  else
  {
    v29 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    if ((a4 & 4) != 0)
    {
      [(PXStoryConcreteTimelineParser *)v12 setParseTimeLimit:0.0];
      int64_t v30 = 0;
    }
    else
    {
      [(PXStoryConcreteTimelineProducer *)self subsequentProductionTimeLimit];
      -[PXStoryConcreteTimelineParser setParseTimeLimit:](v12, "setParseTimeLimit:");
      int64_t v30 = [(PXStoryConcreteTimelineProducer *)self subsequentProductionCountLimit];
    }
    [(PXStoryConcreteTimelineParser *)v12 setParseCountLimit:v30];
    [(PXStoryConcreteTimelineProducer *)self subsequentProductionSimulatedDelay];
    uint64_t v32 = v31;
    v33 = [v40 loadingCoordinator];
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      v35 = PXStoryFallbackLoadingCoordinator();
    }
    v27 = v35;

    v36 = [(id)objc_opt_class() workQueue];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_4;
    v41[3] = &unk_1E5DC8518;
    v42 = v16;
    os_signpost_id_t v47 = v11;
    id v28 = v29;
    id v43 = v28;
    v44 = v12;
    v46 = v57;
    uint64_t v48 = v32;
    v45 = v14;
    [v27 dispatchTimelineWorkAsyncOnQueue:v36 block:v41];
  }
  _Block_object_dispose(v57, 8);

  return v28;
}

void __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) parseNextBestTimeline];
  uint64_t v3 = [*(id *)(a1 + 32) isAtEnd] ^ 1;
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryTimelineResultDelivery", "", buf, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [[PXStoryProducerResult alloc] initWithObject:v2];
  v9 = [(PXStoryProducerResult *)v8 flags:v3];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  v10 = *(id *)(a1 + 40);
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 64);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, v12, "StoryTimelineResultDelivery", "", v13, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

void __90__PXStoryConcreteTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 32);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "StoryTimelineSubsequentProduction", "", (uint8_t *)&v13, 2u);
  }

  if (([*(id *)(a1 + 40) isCancelled] & 1) == 0)
  {
    do
    {
      if ([*(id *)(a1 + 48) isAtEnd]
        && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        break;
      }
      v5 = (void *)MEMORY[0x1AD10CB00]();
      [MEMORY[0x1E4F29060] sleepForTimeInterval:*(double *)(a1 + 80)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    while (![*(id *)(a1 + 40) isCancelled]);
  }
  os_signpost_id_t v6 = *(id *)(a1 + 32);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 72);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v13 = 138412290;
    uint64_t v14 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "StoryTimelineSubsequentProduction", "progress:%@", (uint8_t *)&v13, 0xCu);
  }

  v10 = *(id *)(a1 + 32);
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, v12, "StoryTimelineTotalProduction", "", (uint8_t *)&v13, 2u);
  }
}

- (PXStoryConcreteTimelineProducer)init
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteTimelineProducer;
  v2 = [(PXStoryConcreteTimelineProducer *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[PXStoryConcreteTimelineSettings sharedInstance];
    v2->_initialProductionCountLimit = [v3 initialProductionCountLimit];
    [v3 initialProductionTimeLimit];
    v2->_initialProductionTimeLimit = v4;
    [v3 subsequentProductionTimeLimit];
    v2->_subsequentProductionTimeLimit = v5;
    os_signpost_id_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    os_signpost_id_t v8 = (const char *)*MEMORY[0x1E4F8C518];
    id v9 = v7;
    os_log_t v10 = os_log_create(v8, (const char *)[v9 UTF8String]);
    log = v2->_log;
    v2->_log = (OS_os_log *)v10;
  }
  return v2;
}

+ (OS_dispatch_queue)workQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PXStoryConcreteTimelineProducer_workQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (workQueue_onceToken != -1) {
    dispatch_once(&workQueue_onceToken, block);
  }
  v2 = (void *)workQueue_workQueue;
  return (OS_dispatch_queue *)v2;
}

void __44__PXStoryConcreteTimelineProducer_workQueue__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v6 = objc_claimAutoreleasedReturnValue();
  v1 = (const char *)[v6 UTF8String];
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v4 = dispatch_queue_create(v1, v3);
  double v5 = (void *)workQueue_workQueue;
  workQueue_workQueue = (uint64_t)v4;
}

@end