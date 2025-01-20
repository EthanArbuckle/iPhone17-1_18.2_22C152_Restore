@interface OITSUScaledProgress
- (BOOL)isIndeterminate;
- (OITSUProgress)progress;
- (OITSUScaledProgress)init;
- (double)maxValue;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (void)dealloc;
- (void)p_addProgressObserverToProgressInQueue;
- (void)p_removeProgressObserverFromProgressInQueue;
- (void)removeProgressObserver:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setProgress:(id)a3;
@end

@implementation OITSUScaledProgress

- (OITSUScaledProgress)init
{
  v4.receiver = self;
  v4.super_class = (Class)OITSUScaledProgress;
  v2 = [(OITSUProgress *)&v4 init];
  if (v2)
  {
    v2->mStorage = objc_alloc_init(OITSUScaledProgressStorage);
    v2->mProgressQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUScaledProgress", 0);
    [(OITSUScaledProgressStorage *)v2->mStorage setMaxValue:1.0];
  }
  return v2;
}

- (void)dealloc
{
  mProgressQueue = self->mProgressQueue;
  if (mProgressQueue) {
    dispatch_release(mProgressQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)OITSUScaledProgress;
  [(OITSUProgress *)&v4 dealloc];
}

- (OITSUProgress)progress
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  mProgressQueue = self->mProgressQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__OITSUScaledProgress_progress__block_invoke;
  v5[3] = &unk_264D61028;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressQueue, v5);
  v3 = (OITSUProgress *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__OITSUScaledProgress_progress__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x23EC9A170]();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 40);
}

- (void)setProgress:(id)a3
{
  mProgressQueue = self->mProgressQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__OITSUScaledProgress_setProgress___block_invoke;
  v4[3] = &unk_264D610A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mProgressQueue, v4);
}

void __35__OITSUScaledProgress_setProgress___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x23EC9A170]();
  v3 = *(void **)(a1 + 32);
  if (v3[5] != *(void *)(a1 + 40))
  {
    objc_msgSend(v3, "p_removeProgressObserverFromProgressInQueue");
    id v4 = *(id *)(a1 + 40);

    *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
    objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
  }
}

- (double)value
{
  v3 = [(OITSUScaledProgress *)self progress];
  if (!v3) {
    return 0.0;
  }
  id v4 = v3;
  [(OITSUProgress *)v3 value];
  double v6 = v5;
  [(OITSUProgress *)v4 maxValue];
  double v8 = v6 / v7;
  [(OITSUScaledProgress *)self maxValue];
  return v8 * v9;
}

- (double)maxValue
{
  [(OITSUScaledProgressStorage *)self->mStorage maxValue];
  return result;
}

- (void)setMaxValue:(double)a3
{
  [(OITSUScaledProgressStorage *)self->mStorage setMaxValue:a3];
  [(OITSUProgress *)self protected_progressDidChange];
}

- (BOOL)isIndeterminate
{
  v2 = [(OITSUScaledProgress *)self progress];
  if (!v2) {
    return 1;
  }
  return [(OITSUProgress *)v2 isIndeterminate];
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)OITSUScaledProgress;
  id v6 = [(OITSUProgress *)&v10 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__OITSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
  return v6;
}

void __74__OITSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x23EC9A170]();
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
}

- (void)removeProgressObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OITSUScaledProgress;
  [(OITSUProgress *)&v6 removeProgressObserver:a3];
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__OITSUScaledProgress_removeProgressObserver___block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
}

void __46__OITSUScaledProgress_removeProgressObserver___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x23EC9A170]();
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
}

- (void)p_addProgressObserverToProgressInQueue
{
  if (self->mProgress)
  {
    [(OITSUProgress *)self protected_minProgressObserverValueInterval];
    double v4 = *(double *)&v3;
    if (v3 >= 0 && ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      [(OITSUProgress *)self->mProgress maxValue];
      double v8 = v7;
      [(OITSUScaledProgress *)self maxValue];
      mProgress = self->mProgress;
      mProgressQueue = self->mProgressQueue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__OITSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke;
      v12[3] = &unk_264D60B18;
      v12[4] = self;
      self->mProgressObserver = [(OITSUProgress *)mProgress addProgressObserverWithValueInterval:mProgressQueue queue:v12 handler:v4 * (v8 / v9)];
    }
  }
}

uint64_t __61__OITSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
}

- (void)p_removeProgressObserverFromProgressInQueue
{
  if (self->mProgressObserver)
  {
    -[OITSUProgress removeProgressObserver:](self->mProgress, "removeProgressObserver:");

    self->mProgressObserver = 0;
  }
}

@end