@interface PFCoalescer
+ (PFCoalescer)coalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5;
+ (PFCoalescer)coalescerWithLabel:(id)a3 target:(id)a4 buffer:(id)a5 queue:(id)a6 bufferDrainer:(id)a7 action:(id)a8;
+ (PFCoalescer)coalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6;
+ (id)arrayCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5;
+ (id)arrayCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6;
+ (id)dictionaryCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5;
+ (id)dictionaryCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6;
+ (id)mutableCollectionBufferDrainer;
+ (id)mutableContainerCoalescerWithLabel:(id)a3 container:(id)a4 queue:(id)a5 action:(id)a6;
+ (id)mutableContainerCoalescerWithLabel:(id)a3 target:(id)a4 container:(id)a5 queue:(id)a6 action:(id)a7;
+ (id)setCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5;
+ (id)setCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6;
- (BOOL)initialDelayTimerIsArmed;
- (BOOL)usesTarget;
- (NSString)label;
- (OS_dispatch_queue)isolationQueue;
- (OS_dispatch_queue)sourceQueue;
- (OS_dispatch_queue)targetQueue;
- (OS_dispatch_source)source;
- (OS_os_transaction)transaction;
- (PFCoalescer)init;
- (PFCoalescer)initWithLabel:(id)a3 target:(id)a4 buffer:(id)a5 queue:(id)a6 bufferDrainer:(id)a7 action:(id)a8;
- (PFCoalescerContext)context;
- (double)initialDelay;
- (id)action;
- (id)buffer;
- (id)snapshotAndDrainHandler;
- (id)stateCaptureDictionary;
- (id)target;
- (int64_t)state;
- (void)_resetWhileLocked;
- (void)performEventActionWithTarget:(id)a3;
- (void)reset;
- (void)resetAndShutDown;
- (void)setAction:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setContext:(id)a3;
- (void)setInitialDelay:(double)a3;
- (void)setInitialDelayTimerIsArmed:(BOOL)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSnapshotAndDrainHandler:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceQueue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTarget:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUsesTarget:(BOOL)a3;
- (void)update;
- (void)update:(id)a3;
@end

@implementation PFCoalescer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_snapshotAndDrainHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_sourceQueue, 0);
  objc_storeStrong(&self->_buffer, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_lastTransactionEndDate, 0);
  objc_storeStrong((id *)&self->_lastTransactionStartDate, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 152, 1);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setInitialDelayTimerIsArmed:(BOOL)a3
{
  self->_initialDelayTimerIsArmed = a3;
}

- (BOOL)initialDelayTimerIsArmed
{
  return self->_initialDelayTimerIsArmed;
}

- (void)setContext:(id)a3
{
}

- (PFCoalescerContext)context
{
  return (PFCoalescerContext *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAction:(id)a3
{
}

- (id)action
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setSnapshotAndDrainHandler:(id)a3
{
}

- (id)snapshotAndDrainHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setSource:(id)a3
{
}

- (OS_dispatch_source)source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTargetQueue:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSourceQueue:(id)a3
{
}

- (OS_dispatch_queue)sourceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBuffer:(id)a3
{
}

- (id)buffer
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setUsesTarget:(BOOL)a3
{
  self->_usesTarget = a3;
}

- (BOOL)usesTarget
{
  return self->_usesTarget;
}

- (void)setTarget:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (id)stateCaptureDictionary
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_label forKeyedSubscript:@"label"];
  v4 = [NSNumber numberWithInteger:self->_state];
  v20 = v3;
  [v3 setObject:v4 forKeyedSubscript:@"state"];

  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v19 = self;
  id obj = [(PFCoalescerContext *)self->_context pendingActivityTokensSnapshot];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v26[0] = @"reason";
        v11 = [v10 reason];
        v27[0] = v11;
        v26[1] = @"ageTimeInterval";
        v12 = NSNumber;
        v13 = [MEMORY[0x1E4F1C9C8] date];
        v14 = [v10 creationDate];
        [v13 timeIntervalSinceDate:v14];
        v15 = objc_msgSend(v12, "numberWithDouble:");
        v27[1] = v15;
        v26[2] = @"callStackReturnAddresses";
        v16 = [v10 callStackReturnAddresses];
        v27[2] = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

        [v5 addObject:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  [v20 setObject:v5 forKeyedSubscript:@"pendingActivityTokens"];
  [v20 setObject:v19->_lastTransactionStartDate forKeyedSubscript:@"lastTransactionStartDate"];
  [v20 setObject:v19->_lastTransactionEndDate forKeyedSubscript:@"lastTransactionEndDate"];

  return v20;
}

- (void)_resetWhileLocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  ++self->_resetSequenceNumber;
  if (self->_buffer)
  {
    snapshotAndDrainHandler = (uint64_t (**)(void))self->_snapshotAndDrainHandler;
    if (snapshotAndDrainHandler) {
      id v4 = (id)snapshotAndDrainHandler[2]();
    }
  }
  context = self->_context;
  [(PFCoalescerContext *)context cancelPendingActivityTokens];
}

- (void)resetAndShutDown
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PFCoalescer_resetAndShutDown__block_invoke;
  block[3] = &unk_1E62ABFB0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

void *__31__PFCoalescer_resetAndShutDown__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[18] != 3)
  {
    result = (void *)[result _resetWhileLocked];
    *(void *)(*(void *)(a1 + 32) + 144) = 3;
  }
  return result;
}

- (void)reset
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__PFCoalescer_reset__block_invoke;
  block[3] = &unk_1E62ABFB0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

void *__20__PFCoalescer_reset__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[18] != 3)
  {
    result = (void *)[result _resetWhileLocked];
    *(void *)(*(void *)(a1 + 32) + 144) = 0;
  }
  return result;
}

- (void)update
{
}

- (void)update:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__PFCoalescer_update___block_invoke;
  block[3] = &unk_1E62AC0C8;
  block[4] = self;
  v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(isolationQueue, block);
  if (!*((unsigned char *)v15 + 24))
  {
    if (self->_initialDelay != 0.0)
    {
      uint64_t v7 = self->_isolationQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __22__PFCoalescer_update___block_invoke_2;
      v10[3] = &unk_1E62ABFB0;
      v10[4] = self;
      dispatch_sync(v7, v10);
    }
    uint64_t v8 = self->_isolationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __22__PFCoalescer_update___block_invoke_4;
    v9[3] = &unk_1E62ABFB0;
    v9[4] = self;
    dispatch_sync(v8, v9);
    dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
  }

  _Block_object_dispose(&v14, 8);
}

void __22__PFCoalescer_update___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = v2[18];
  if (v3 == 3)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    return;
  }
  uint64_t v4 = a1[5];
  if (v4)
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, v2[10]);
    v2 = (void *)a1[4];
    uint64_t v3 = v2[18];
  }
  if (v3 != 2)
  {
    if (v3) {
      return;
    }
    id v5 = [NSString stringWithFormat:@"PFCoalescer %p %@", v2, v2[8]];
    [v5 UTF8String];
    uint64_t v6 = os_transaction_create();
    uint64_t v7 = a1[4];
    uint64_t v8 = *(void **)(v7 + 152);
    *(void *)(v7 + 152) = v6;

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v10 = a1[4];
    v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;

    v2 = (void *)a1[4];
  }
  v2[18] = 1;
}

void __22__PFCoalescer_update___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 49))
  {
    *(unsigned char *)(v1 + 49) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__PFCoalescer_update___block_invoke_3;
    block[3] = &unk_1E62ABFB0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __22__PFCoalescer_update___block_invoke_4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

uint64_t __22__PFCoalescer_update___block_invoke_3(uint64_t a1)
{
  return usleep((*(double *)(*(void *)(a1 + 32) + 56) * 1000000.0));
}

- (void)performEventActionWithTarget:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy_;
  v14[4] = __Block_byref_object_dispose_;
  id v15 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PFCoalescer_performEventActionWithTarget___block_invoke;
  block[3] = &unk_1E62AC050;
  block[4] = self;
  void block[5] = &v16;
  block[6] = v14;
  dispatch_sync(isolationQueue, block);
  if (!*((unsigned char *)v17 + 24))
  {
    [(PFCoalescerContext *)self->_context setCoalescedUpdatesCount:dispatch_source_get_data((dispatch_source_t)self->_source)];
    targetQueue = self->_targetQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__PFCoalescer_performEventActionWithTarget___block_invoke_2;
    v10[3] = &unk_1E62AC078;
    v10[4] = self;
    id v11 = v4;
    id v12 = v14;
    dispatch_sync(targetQueue, v10);
    dispatch_suspend((dispatch_object_t)self->_source);
    context = self->_context;
    uint64_t v8 = self->_isolationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PFCoalescer_performEventActionWithTarget___block_invoke_3;
    v9[3] = &unk_1E62ABFB0;
    v9[4] = self;
    [(PFCoalescerContext *)context notifyActivityTokenCompletionOnQueue:v8 handler:v9];
  }
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(&v16, 8);
}

void __44__PFCoalescer_performEventActionWithTarget___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2[2] == v2[1])
  {
    if (v2[10])
    {
      uint64_t v3 = v2[15];
      if (v3)
      {
        uint64_t v4 = (*(void (**)(void))(v3 + 16))();
        uint64_t v5 = *(void *)(a1[6] + 8);
        uint64_t v6 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v4;

        uint64_t v2 = (void *)a1[4];
      }
    }
    if (v2[18] == 1) {
      v2[18] = 2;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
}

void __44__PFCoalescer_performEventActionWithTarget___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1C186E190]();
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 128) + 16))();
}

void __44__PFCoalescer_performEventActionWithTarget___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 144) == 2)
  {
    *(void *)(v1 + 144) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 152);
    *(void *)(v3 + 152) = 0;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v1 = *(void *)(a1 + 32);
  }
  uint64_t v8 = *(NSObject **)(v1 + 112);
  dispatch_resume(v8);
}

- (PFCoalescer)initWithLabel:(id)a3 target:(id)a4 buffer:(id)a5 queue:(id)a6 bufferDrainer:(id)a7 action:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = v20;
  if (v15)
  {
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PFCoalescer.m", 220, @"Invalid parameter not satisfying: %@", @"label" object file lineNumber description];

    if (v21) {
      goto LABEL_3;
    }
  }
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"PFCoalescer.m", 221, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

LABEL_3:
  v49.receiver = self;
  v49.super_class = (Class)PFCoalescer;
  long long v22 = [(PFCoalescer *)&v49 init];
  long long v23 = v22;
  if (v22)
  {
    [(PFCoalescer *)v22 setTarget:v16];
    [(PFCoalescer *)v23 setUsesTarget:v16 != 0];
    id v45 = v17;
    [(PFCoalescer *)v23 setBuffer:v17];
    [(PFCoalescer *)v23 setSnapshotAndDrainHandler:v19];
    [(PFCoalescer *)v23 setAction:v21];
    [(PFCoalescer *)v23 setLabel:v15];
    id v24 = [@"coalescer-" stringByAppendingString:v15];
    long long v25 = (const char *)[v24 UTF8String];
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v28 = dispatch_queue_create(v25, v27);
    [(PFCoalescer *)v23 setSourceQueue:v28];

    id v29 = [@"coalescer-buffer-" stringByAppendingString:v15];
    v30 = (const char *)[v29 UTF8String];
    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v33 = dispatch_queue_create(v30, v32);
    [(PFCoalescer *)v23 setIsolationQueue:v33];

    if (v18)
    {
      [(PFCoalescer *)v23 setTargetQueue:v18];
    }
    else
    {
      v34 = dispatch_get_global_queue(9, 0);
      [(PFCoalescer *)v23 setTargetQueue:v34];
    }
    v35 = [(PFCoalescer *)v23 sourceQueue];
    dispatch_source_t v36 = dispatch_source_create(MEMORY[0x1E4F14438], 0, 0, v35);
    [(PFCoalescer *)v23 setSource:v36];

    v37 = [[PFCoalescerContext alloc] initWithCoalescer:v23];
    [(PFCoalescer *)v23 setContext:v37];

    objc_initWeak(&location, v23);
    v38 = [(PFCoalescer *)v23 source];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __70__PFCoalescer_initWithLabel_target_buffer_queue_bufferDrainer_action___block_invoke;
    handler[3] = &unk_1E62AC028;
    objc_copyWeak(&v47, &location);
    dispatch_source_set_event_handler(v38, handler);

    [(PFCoalescer *)v23 source];
    v39 = id v17 = v45;
    dispatch_resume(v39);

    v40 = [[PFStateCaptureHandler alloc] initWithProvider:v23];
    stateCaptureHandler = v23->_stateCaptureHandler;
    v23->_stateCaptureHandler = v40;

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }

  return v23;
}

void __70__PFCoalescer_initWithLabel_target_buffer_queue_bufferDrainer_action___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained usesTarget])
  {
    uint64_t v1 = [WeakRetained target];
    BOOL v2 = v1 == 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  uint64_t v3 = WeakRetained;
  if (WeakRetained && !v2)
  {
    uint64_t v4 = [WeakRetained target];
    if (![WeakRetained usesTarget] || v4) {
      [WeakRetained performEventActionWithTarget:v4];
    }

    uint64_t v3 = WeakRetained;
  }
}

- (PFCoalescer)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFCoalescer;
  BOOL v2 = [(PFCoalescer *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(PFCoalescer *)v2 setState:0];
  }
  return v3;
}

+ (id)mutableCollectionBufferDrainer
{
  return &__block_literal_global_298;
}

id __45__PFCoalescer_mutableCollectionBufferDrainer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)[v2 copy];
  [v2 removeAllObjects];

  return v3;
}

+ (id)arrayCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 array];
  id v16 = [a1 mutableContainerCoalescerWithLabel:v14 target:v13 container:v15 queue:v12 action:v11];

  return v16;
}

+ (id)arrayCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 array];
  id v13 = [a1 mutableContainerCoalescerWithLabel:v11 container:v12 queue:v10 action:v9];

  return v13;
}

+ (id)dictionaryCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 dictionary];
  id v16 = [a1 mutableContainerCoalescerWithLabel:v14 target:v13 container:v15 queue:v12 action:v11];

  return v16;
}

+ (id)dictionaryCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 dictionary];
  id v13 = [a1 mutableContainerCoalescerWithLabel:v11 container:v12 queue:v10 action:v9];

  return v13;
}

+ (id)setCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CA80];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 set];
  id v16 = [a1 mutableContainerCoalescerWithLabel:v14 target:v13 container:v15 queue:v12 action:v11];

  return v16;
}

+ (id)setCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA80];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 set];
  id v13 = [a1 mutableContainerCoalescerWithLabel:v11 container:v12 queue:v10 action:v9];

  return v13;
}

+ (id)mutableContainerCoalescerWithLabel:(id)a3 container:(id)a4 queue:(id)a5 action:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PFCoalescer.m", 348, @"Unsupported container, does not respond to removeAllObjects" object file lineNumber description];
  }
  if (([v11 conformsToProtocol:&unk_1F15F4138] & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PFCoalescer.m", 349, @"Unsupported container, does not conform to NSCopying" object file lineNumber description];
  }
  id v15 = [(id)objc_opt_class() mutableCollectionBufferDrainer];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__PFCoalescer_mutableContainerCoalescerWithLabel_container_queue_action___block_invoke;
  v21[3] = &unk_1E62AC0A0;
  id v22 = v12;
  id v16 = v12;
  id v17 = [a1 coalescerWithLabel:v14 target:0 buffer:v11 queue:v13 bufferDrainer:v15 action:v21];

  return v17;
}

uint64_t __73__PFCoalescer_mutableContainerCoalescerWithLabel_container_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)mutableContainerCoalescerWithLabel:(id)a3 target:(id)a4 container:(id)a5 queue:(id)a6 action:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PFCoalescer.m", 334, @"Unsupported container, does not respond to removeAllObjects" object file lineNumber description];
  }
  if ([v13 conformsToProtocol:&unk_1F15F4138])
  {
    if (v16) {
      goto LABEL_5;
    }
  }
  else
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PFCoalescer.m", 335, @"Unsupported container, does not conform to NSCopying" object file lineNumber description];

    if (v16) {
      goto LABEL_5;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"PFCoalescer.m", 336, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

LABEL_5:
  id v18 = [(id)objc_opt_class() mutableCollectionBufferDrainer];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __80__PFCoalescer_mutableContainerCoalescerWithLabel_target_container_queue_action___block_invoke;
  v25[3] = &unk_1E62AC0A0;
  id v26 = v14;
  id v19 = v14;
  id v20 = [a1 coalescerWithLabel:v17 target:v16 buffer:v13 queue:v15 bufferDrainer:v18 action:v25];

  return v20;
}

uint64_t __80__PFCoalescer_mutableContainerCoalescerWithLabel_target_container_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (PFCoalescer)coalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__PFCoalescer_coalescerWithLabel_queue_action___block_invoke;
  v12[3] = &unk_1E62AC0A0;
  id v13 = v8;
  id v9 = v8;
  id v10 = [a1 coalescerWithLabel:a3 target:0 buffer:0 queue:a4 bufferDrainer:0 action:v12];

  return (PFCoalescer *)v10;
}

uint64_t __47__PFCoalescer_coalescerWithLabel_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (PFCoalescer)coalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PFCoalescer.m", 311, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__PFCoalescer_coalescerWithLabel_target_queue_action___block_invoke;
  v19[3] = &unk_1E62AC0A0;
  id v20 = v14;
  id v15 = v14;
  id v16 = [a1 coalescerWithLabel:v11 target:v12 buffer:0 queue:v13 bufferDrainer:0 action:v19];

  return (PFCoalescer *)v16;
}

uint64_t __54__PFCoalescer_coalescerWithLabel_target_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (PFCoalescer)coalescerWithLabel:(id)a3 target:(id)a4 buffer:(id)a5 queue:(id)a6 bufferDrainer:(id)a7 action:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:v18 target:v17 buffer:v16 queue:v15 bufferDrainer:v14 action:v13];

  return (PFCoalescer *)v19;
}

@end