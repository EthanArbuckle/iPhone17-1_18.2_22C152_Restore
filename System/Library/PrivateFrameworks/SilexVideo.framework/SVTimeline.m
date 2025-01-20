@interface SVTimeline
- (SVTimeline)init;
- (uint64_t)cancelScheduledBlocks;
- (uint64_t)resetTime;
- (void)dealloc;
- (void)executeActionsForTime:(double)a3 withDuration:;
- (void)performBlock:(double)a3 at:;
- (void)setDuration:(uint64_t)a1;
- (void)setTime:(uint64_t)a1;
@end

@implementation SVTimeline

- (SVTimeline)init
{
  v6.receiver = self;
  v6.super_class = (Class)SVTimeline;
  v2 = [(SVTimeline *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    actions = v2->_actions;
    v2->_actions = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)dealloc
{
  if (self) {
    [(NSMutableArray *)self->_actions removeAllObjects];
  }
  v3.receiver = self;
  v3.super_class = (Class)SVTimeline;
  [(SVTimeline *)&v3 dealloc];
}

- (uint64_t)cancelScheduledBlocks
{
  if (result) {
    return [*(id *)(result + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)resetTime
{
  if (result)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
  }
  return result;
}

- (void)setDuration:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 8) != a2)
    {
      *(double *)(a1 + 8) = a2;
      -[SVTimeline executeActionsForTime:withDuration:](a1, *(double *)(a1 + 16), a2);
    }
  }
}

- (void)executeActionsForTime:(double)a3 withDuration:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = (void *)[*(id *)(a1 + 24) copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = a3 > 0.0;
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          double v11 = -[SVTimeBasedAction time]((uint64_t)v10);
          BOOL v12 = v11 < 0.0;
          double v13 = v11 + a3;
          if (-v11 > a3) {
            BOOL v12 = 0;
          }
          if (!v9 || !v12) {
            double v13 = -1.79769313e308;
          }
          BOOL v14 = v11 <= a3 && v11 >= 0.0;
          if (!v9 || !v14) {
            double v11 = v13;
          }
          if (v11 <= a2 && v11 != -1.79769313e308)
          {
            objc_initWeak(&location, v10);
            -[SVTimeBasedAction block]((uint64_t)v10);
            v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
            id v17 = objc_loadWeakRetained(&location);
            ((void (**)(void, id))v16)[2](v16, v17);

            objc_destroyWeak(&location);
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
  }
}

- (void)setTime:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 16) != a2)
    {
      *(double *)(a1 + 16) = a2;
      -[SVTimeline executeActionsForTime:withDuration:](a1, a2, *(double *)(a1 + 8));
    }
  }
}

- (void)performBlock:(double)a3 at:
{
  id v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    uint64_t v6 = [SVTimeBasedAction alloc];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__SVTimeline_performBlock_at___block_invoke;
    v9[3] = &unk_2647710C8;
    id v10 = v5;
    objc_copyWeak(&v11, &location);
    uint64_t v7 = -[SVTimeBasedAction initWithTime:block:](v6, v9, a3);
    if (v7) {
      [a1[3] addObject:v7];
    }
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __30__SVTimeline_performBlock_at___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v4 && WeakRetained) {
    [WeakRetained[3] removeObject:v4];
  }
}

- (void).cxx_destruct
{
}

@end