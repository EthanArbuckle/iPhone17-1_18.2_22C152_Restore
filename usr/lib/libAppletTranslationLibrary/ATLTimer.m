@interface ATLTimer
- (id)initOnQueue:(void *)a3 withTimerBlock:;
- (void)dealloc;
- (void)onExpire;
- (void)startTimerWithDelay:(uint64_t)a1;
- (void)stopTimer;
@end

@implementation ATLTimer

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_src);
  v3.receiver = self;
  v3.super_class = (Class)ATLTimer;
  [(ATLTimer *)&v3 dealloc];
}

- (id)initOnQueue:(void *)a3 withTimerBlock:
{
  v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)ATLTimer;
    a1 = [super init];
    if (a1)
    {
      dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 1uLL, 0, v6);
      v9 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v8;

      objc_initWeak(&location, a1);
      v10 = *((void *)a1 + 1);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __39__ATLTimer_initOnQueue_withTimerBlock___block_invoke;
      v14[3] = &unk_1E65AE1F8;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v10, v14);
      dispatch_activate(*((dispatch_object_t *)a1 + 1));
      v11 = _Block_copy(v7);
      v12 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v11;

      objc_storeStrong((id *)a1 + 4, a2);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __39__ATLTimer_initOnQueue_withTimerBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[ATLTimer onExpire]((uint64_t)WeakRetained);
}

- (void)onExpire
{
  if (a1)
  {
    double v2 = *(double *)(a1 + 24);
    if (v2 <= 0.0)
    {
      v4 = *(void (**)(void))(*(void *)(a1 + 16) + 16);
      v4();
    }
    else
    {
      dispatch_time_t v3 = dispatch_time(0, (uint64_t)(v2 * 1000000.0));
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 8), v3, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
      *(void *)(a1 + 24) = 0;
    }
  }
}

- (void)startTimerWithDelay:(uint64_t)a1
{
  if (a1)
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(a2 * 1000000.0));
    v4 = *(NSObject **)(a1 + 8);
    dispatch_source_set_timer(v4, v3, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }
}

- (void)stopTimer
{
  if (a1)
  {
    dispatch_source_cancel(a1[1]);
    objc_initWeak(&location, a1);
    dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 1uLL, 0, a1[4]);
    dispatch_source_t v3 = a1[1];
    a1[1] = v2;

    v4 = a1[1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __21__ATLTimer_stopTimer__block_invoke;
    v5[3] = &unk_1E65AE1F8;
    objc_copyWeak(&v6, &location);
    dispatch_source_set_event_handler(v4, v5);
    dispatch_activate(a1[1]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __21__ATLTimer_stopTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[ATLTimer onExpire]((uint64_t)WeakRetained);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_src, 0);
}

@end