@interface PXStoryPassthroughProducer
- (BOOL)allowsProgress;
- (BOOL)prefersAsynchronousDelivery;
- (OS_dispatch_queue)workQueue;
- (PXStoryPassthroughProducer)init;
- (PXStoryPassthroughProducer)initWithResult:(id)a3;
- (PXStoryPassthroughProducer)initWithResult:(id)a3 options:(unint64_t)a4;
- (id)requestResultWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (id)result;
@end

@implementation PXStoryPassthroughProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_result, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)allowsProgress
{
  return self->_allowsProgress;
}

- (BOOL)prefersAsynchronousDelivery
{
  return self->_prefersAsynchronousDelivery;
}

- (id)result
{
  return self->_result;
}

- (id)requestResultWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  v7 = [(PXStoryPassthroughProducer *)self result];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DD3280;
  id v8 = v6;
  id v21 = v8;
  id v9 = v7;
  id v20 = v9;
  v10 = (void (**)(void))_Block_copy(aBlock);
  BOOL v11 = [(PXStoryPassthroughProducer *)self prefersAsynchronousDelivery];
  if ((v4 & 1) != 0 || !v11)
  {
    v10[2](v10);
    id v13 = 0;
  }
  else
  {
    if ([(PXStoryPassthroughProducer *)self allowsProgress])
    {
      v12 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    }
    else
    {
      v12 = 0;
    }
    v14 = [(PXStoryPassthroughProducer *)self workQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke_2;
    v16[3] = &unk_1E5DD3280;
    id v13 = v12;
    id v17 = v13;
    v18 = v10;
    dispatch_async(v14, v16);
  }
  return v13;
}

void __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [[PXStoryProducerResult alloc] initWithObject:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v1 + 16))(v1, v2);
}

uint64_t __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (PXStoryPassthroughProducer)initWithResult:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryPassthroughProducer;
  id v8 = [(PXStoryPassthroughProducer *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_result, a3);
    v9->_prefersAsynchronousDelivery = v4 & 1;
    v9->_allowsProgress = (v4 & 2) == 0;
    if (v4)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      id v11 = objc_claimAutoreleasedReturnValue();
      v12 = (const char *)[v11 UTF8String];
      id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
      workQueue = v9->_workQueue;
      v9->_workQueue = (OS_dispatch_queue *)v15;
    }
  }

  return v9;
}

- (PXStoryPassthroughProducer)initWithResult:(id)a3
{
  return [(PXStoryPassthroughProducer *)self initWithResult:a3 options:0];
}

- (PXStoryPassthroughProducer)init
{
  return [(PXStoryPassthroughProducer *)self initWithResult:0];
}

@end