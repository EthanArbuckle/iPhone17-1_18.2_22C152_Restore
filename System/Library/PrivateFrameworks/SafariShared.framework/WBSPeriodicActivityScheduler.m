@interface WBSPeriodicActivityScheduler
- (WBSPeriodicActivityScheduler)init;
- (WBSPeriodicActivityScheduler)initWithInterval:(double)a3 minimumDelay:(double)a4 lastFireDate:(id)a5 block:(id)a6;
- (void)_performActivity;
- (void)_scheduleActivityWithInterval:(double)a3;
- (void)invalidate;
@end

@implementation WBSPeriodicActivityScheduler

void __62__WBSPeriodicActivityScheduler__scheduleActivityWithInterval___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    double v3 = fmin(*(double *)(a1 + 40) * 0.5, 3600.0);
    [*(id *)(v1 + 40) invalidate];
    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)(a1 + 40)];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v8 interval:*(void *)(a1 + 32) target:sel__timerDidFire_ selector:0 userInfo:0 repeats:0.0];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    [*(id *)(*(void *)(a1 + 32) + 40) setTolerance:v3];
    v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v7 addTimer:*(void *)(*(void *)(a1 + 32) + 40) forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (WBSPeriodicActivityScheduler)initWithInterval:(double)a3 minimumDelay:(double)a4 lastFireDate:(id)a5 block:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WBSPeriodicActivityScheduler;
  v12 = [(WBSPeriodicActivityScheduler *)&v23 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SafariShared.WBSPeriodicActivityScheduler", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_interval = a3;
    uint64_t v15 = MEMORY[0x1AD0C4F80](v11);
    id block = v12->_block;
    v12->_id block = (id)v15;

    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    [v10 timeIntervalSinceNow];
    double v18 = v17 + a3;
    double v19 = 0.0;
    if (v18 > 0.0)
    {
      objc_msgSend(v10, "timeIntervalSinceNow", 0.0);
      double v19 = v20 + a3;
    }
    if (v19 < a4) {
      double v19 = a4;
    }
    [(WBSPeriodicActivityScheduler *)v12 _scheduleActivityWithInterval:v19];
    v21 = v12;
  }

  return v12;
}

- (void)_scheduleActivityWithInterval:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__WBSPeriodicActivityScheduler__scheduleActivityWithInterval___block_invoke;
  v4[3] = &unk_1E5C8CF50;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (WBSPeriodicActivityScheduler)init
{
  return 0;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WBSPeriodicActivityScheduler_invalidate__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__WBSPeriodicActivityScheduler_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
}

- (void)_performActivity
{
  double v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSPeriodicActivityScheduler__performActivity__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __48__WBSPeriodicActivityScheduler__performActivity__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  uint64_t v2 = *(double **)(a1 + 32);
  double v3 = v2[3];
  return [v2 _scheduleActivityWithInterval:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end