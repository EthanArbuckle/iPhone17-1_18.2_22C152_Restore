@interface TSUScaledProgress
- (BOOL)isIndeterminate;
- (TSUProgress)progress;
- (TSUScaledProgress)init;
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

@implementation TSUScaledProgress

- (TSUScaledProgress)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSUScaledProgress;
  v2 = [(TSUProgress *)&v4 init];
  if (v2)
  {
    v2->mStorage = objc_alloc_init(TSUScaledProgressStorage);
    v2->mProgressQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUScaledProgress", 0);
    [(TSUScaledProgressStorage *)v2->mStorage setMaxValue:1.0];
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
  v4.super_class = (Class)TSUScaledProgress;
  [(TSUProgress *)&v4 dealloc];
}

- (TSUProgress)progress
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  uint64_t v11 = 0;
  mProgressQueue = self->mProgressQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__TSUScaledProgress_progress__block_invoke;
  v5[3] = &unk_26462A4E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mProgressQueue, v5);
  v3 = (TSUProgress *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__TSUScaledProgress_progress__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(id *)(*(void *)(a1 + 32) + 40);
  return [v2 drain];
}

- (void)setProgress:(id)a3
{
  mProgressQueue = self->mProgressQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__TSUScaledProgress_setProgress___block_invoke;
  v4[3] = &unk_26462A298;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mProgressQueue, v4);
}

uint64_t __33__TSUScaledProgress_setProgress___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  v3 = *(void **)(a1 + 32);
  if (v3[5] != *(void *)(a1 + 40))
  {
    objc_msgSend(v3, "p_removeProgressObserverFromProgressInQueue");
    id v4 = *(id *)(a1 + 40);

    *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
    objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
  }
  return [v2 drain];
}

- (double)value
{
  v3 = [(TSUScaledProgress *)self progress];
  if (!v3) {
    return 0.0;
  }
  id v4 = v3;
  [(TSUProgress *)v3 value];
  double v6 = v5;
  [(TSUProgress *)v4 maxValue];
  double v8 = v6 / v7;
  [(TSUScaledProgress *)self maxValue];
  return v8 * v9;
}

- (double)maxValue
{
  [(TSUScaledProgressStorage *)self->mStorage maxValue];
  return result;
}

- (void)setMaxValue:(double)a3
{
  [(TSUScaledProgressStorage *)self->mStorage setMaxValue:a3];
  [(TSUProgress *)self protected_progressDidChange];
}

- (BOOL)isIndeterminate
{
  id v2 = [(TSUScaledProgress *)self progress];
  if (!v2) {
    return 1;
  }
  return [(TSUProgress *)v2 isIndeterminate];
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSUScaledProgress;
  id v6 = [(TSUProgress *)&v10 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__TSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke;
  block[3] = &unk_26462A048;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
  return v6;
}

uint64_t __72__TSUScaledProgress_addProgressObserverWithValueInterval_queue_handler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
  return [v2 drain];
}

- (void)removeProgressObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUScaledProgress;
  [(TSUProgress *)&v6 removeProgressObserver:a3];
  mProgressQueue = self->mProgressQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TSUScaledProgress_removeProgressObserver___block_invoke;
  block[3] = &unk_26462A048;
  block[4] = self;
  dispatch_async(mProgressQueue, block);
}

uint64_t __44__TSUScaledProgress_removeProgressObserver___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  objc_msgSend(*(id *)(a1 + 32), "p_removeProgressObserverFromProgressInQueue");
  objc_msgSend(*(id *)(a1 + 32), "p_addProgressObserverToProgressInQueue");
  return [v2 drain];
}

- (void)p_addProgressObserverToProgressInQueue
{
  if (self->mProgress)
  {
    [(TSUProgress *)self protected_minProgressObserverValueInterval];
    double v4 = *(double *)&v3;
    if (v3 >= 0 && ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      [(TSUProgress *)self->mProgress maxValue];
      double v8 = v7;
      [(TSUScaledProgress *)self maxValue];
      mProgress = self->mProgress;
      mProgressQueue = self->mProgressQueue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __59__TSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke;
      v12[3] = &unk_26462A048;
      v12[4] = self;
      self->mProgressObserver = [(TSUProgress *)mProgress addProgressObserverWithValueInterval:mProgressQueue queue:v12 handler:v4 * (v8 / v9)];
    }
  }
}

uint64_t __59__TSUScaledProgress_p_addProgressObserverToProgressInQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
}

- (void)p_removeProgressObserverFromProgressInQueue
{
  if (self->mProgressObserver)
  {
    -[TSUProgress removeProgressObserver:](self->mProgress, "removeProgressObserver:");

    self->mProgressObserver = 0;
  }
}

@end