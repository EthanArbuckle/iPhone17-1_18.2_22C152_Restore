@interface PXSchedulerTrackedAnimation
- (NSString)label;
- (PXSchedulerTrackedAnimation)initWithScheduler:(id)a3 label:(id)a4;
- (void)dealloc;
@end

@implementation PXSchedulerTrackedAnimation

uint64_t __38__PXSchedulerTrackedAnimation_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) schedulePerformPendingBlocksAfterAnimation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_destroyWeak((id *)&self->_scheduler);
}

- (PXSchedulerTrackedAnimation)initWithScheduler:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXSchedulerTrackedAnimation;
  v8 = [(PXSchedulerTrackedAnimation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scheduler, v6);
    objc_storeStrong((id *)&v9->_label, a4);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__PXSchedulerTrackedAnimation_dealloc__block_invoke;
    v6[3] = &unk_26545BC00;
    id v7 = WeakRetained;
    px_perform_on_main_runloop(2, v6);
  }
  v5.receiver = self;
  v5.super_class = (Class)PXSchedulerTrackedAnimation;
  [(PXSchedulerTrackedAnimation *)&v5 dealloc];
}

- (NSString)label
{
  return self->_label;
}

@end