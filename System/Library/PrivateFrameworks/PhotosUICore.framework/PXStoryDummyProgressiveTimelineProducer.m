@interface PXStoryDummyProgressiveTimelineProducer
- (OS_dispatch_queue)workQueue;
- (PXStoryDummyProgressiveTimelineProducer)init;
- (PXStoryDummyTimelineProducer)timelineProducer;
- (double)delayBetweenIterations;
- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
- (int64_t)numberOfIterations;
- (void)setDelayBetweenIterations:(double)a3;
- (void)setNumberOfIterations:(int64_t)a3;
@end

@implementation PXStoryDummyProgressiveTimelineProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineProducer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (PXStoryDummyTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setDelayBetweenIterations:(double)a3
{
  self->_delayBetweenIterations = a3;
}

- (double)delayBetweenIterations
{
  return self->_delayBetweenIterations;
}

- (void)setNumberOfIterations:(int64_t)a3
{
  self->_numberOfIterations = a3;
}

- (int64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DB03D0;
  aBlock[4] = self;
  aBlock[5] = v8;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if ((v6 & 2) != 0)
  {
    v15 = [(PXStoryDummyProgressiveTimelineProducer *)self workQueue];
    int64_t v16 = 1;
  }
  else
  {
    v12 = (*((void (**)(void *, double))v10 + 2))(v10, 0.0);
    v13 = [[PXStoryProducerResult alloc] initWithObject:v12];
    v14 = [(PXStoryProducerResult *)v13 flags:1];
    v9[2](v9, v14);

    v15 = [(PXStoryDummyProgressiveTimelineProducer *)self workQueue];
    int64_t v16 = [(PXStoryDummyProgressiveTimelineProducer *)self numberOfIterations];
  }
  [(PXStoryDummyProgressiveTimelineProducer *)self delayBetweenIterations];
  [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:v16];
  (id)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  id v18 = v11;
  id v19 = v15;
  PXIterateAsynchronously();
}

id __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke(uint64_t a1, double a2)
{
  v4 = [*(id *)(a1 + 32) timelineProducer];
  v5 = [v4 createTimelineWithConfiguration:*(void *)(a1 + 40) detailsFraction:a2];

  return v5;
}

void __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5DB03F8;
  v5 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  uint64_t v12 = *(void *)(a1 + 72);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_after(v4, v5, block);
}

void __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isCancelled];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 stop];
  }
  else
  {
    double v4 = (double)(unint64_t)([v3 index] + 1) / (double)*(uint64_t *)(a1 + 64);
    (*(void (**)(double))(*(void *)(a1 + 48) + 16))(v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [[PXStoryProducerResult alloc] initWithObject:v8];
    v7 = [(PXStoryProducerResult *)v6 flags:v4 < 1.0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    [*(id *)(a1 + 40) next];
  }
}

- (PXStoryDummyProgressiveTimelineProducer)init
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryDummyProgressiveTimelineProducer;
  char v2 = [(PXStoryDummyProgressiveTimelineProducer *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PXStoryDummyTimelineProducer);
    timelineProducer = v2->_timelineProducer;
    v2->_timelineProducer = v3;

    v2->_numberOfIterations = 10;
    v2->_delayBetweenIterations = 1.0;
    uint64_t v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    v7 = (const char *)[v6 UTF8String];
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create(v7, v9);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

@end