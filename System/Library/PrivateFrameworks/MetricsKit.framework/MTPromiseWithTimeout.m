@interface MTPromiseWithTimeout
- (MTPromise)promise;
- (MTPromiseWithTimeout)initWithTimeout:(double)a3 queue:(id)a4 timeoutBlock:(id)a5;
- (NSDate)startDate;
- (OS_dispatch_source)dispatchSourceTimer;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)finishWithResult:(id)a3;
- (void)setDispatchSourceTimer:(id)a3;
- (void)setPromise:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MTPromiseWithTimeout

- (void)finishWithResult:(id)a3
{
  id v9 = a3;
  v4 = [(MTPromiseWithTimeout *)self promise];
  char v5 = [v4 isFinished];

  if ((v5 & 1) == 0)
  {
    v6 = [(MTPromiseWithTimeout *)self promise];
    [v6 finishWithResult:v9];
  }
  v7 = [(MTPromiseWithTimeout *)self dispatchSourceTimer];

  if (v7)
  {
    v8 = [(MTPromiseWithTimeout *)self dispatchSourceTimer];
    dispatch_source_cancel(v8);

    [(MTPromiseWithTimeout *)self setDispatchSourceTimer:0];
  }
}

- (MTPromise)promise
{
  return self->_promise;
}

- (OS_dispatch_source)dispatchSourceTimer
{
  return self->_dispatchSourceTimer;
}

- (MTPromiseWithTimeout)initWithTimeout:(double)a3 queue:(id)a4 timeoutBlock:(id)a5
{
  v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MTPromiseWithTimeout;
  v10 = [(MTPromiseWithTimeout *)&v22 init];
  if (v10)
  {
    v11 = [MEMORY[0x263EFF910] date];
    [(MTPromiseWithTimeout *)v10 setStartDate:v11];

    v12 = objc_alloc_init(MTPromise);
    [(MTPromiseWithTimeout *)v10 setPromise:v12];

    v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
    dispatch_source_set_timer(v13, 0, (unint64_t)(a3 * 1000000000.0), 0x989680uLL);
    objc_initWeak(&location, v10);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __59__MTPromiseWithTimeout_initWithTimeout_queue_timeoutBlock___block_invoke;
    v18 = &unk_2643109F0;
    objc_copyWeak(v20, &location);
    v20[1] = *(id *)&a3;
    id v19 = v9;
    dispatch_source_set_event_handler(v13, &v15);
    -[MTPromiseWithTimeout setDispatchSourceTimer:](v10, "setDispatchSourceTimer:", v13, v15, v16, v17, v18);
    dispatch_resume(v13);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (void)setDispatchSourceTimer:(id)a3
{
}

- (void)setStartDate:(id)a3
{
}

- (void)setPromise:(id)a3
{
}

void __59__MTPromiseWithTimeout_initWithTimeout_queue_timeoutBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    v3 = [WeakRetained startDate];
    [v3 timeIntervalSinceNow];
    double v5 = v4 + -0.01;
    double v6 = -*(double *)(a1 + 48);

    id WeakRetained = v7;
    if (v5 < v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id WeakRetained = v7;
    }
  }
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSourceTimer, 0);
  objc_storeStrong((id *)&self->_promise, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)dealloc
{
  v3 = [(MTPromiseWithTimeout *)self dispatchSourceTimer];

  if (v3)
  {
    double v4 = [(MTPromiseWithTimeout *)self dispatchSourceTimer];
    dispatch_source_cancel(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTPromiseWithTimeout;
  [(MTPromiseWithTimeout *)&v5 dealloc];
}

- (void)finishWithError:(id)a3
{
  id v9 = a3;
  double v4 = [(MTPromiseWithTimeout *)self promise];
  char v5 = [v4 isFinished];

  if ((v5 & 1) == 0)
  {
    double v6 = [(MTPromiseWithTimeout *)self promise];
    [v6 finishWithError:v9];
  }
  id v7 = [(MTPromiseWithTimeout *)self dispatchSourceTimer];

  if (v7)
  {
    v8 = [(MTPromiseWithTimeout *)self dispatchSourceTimer];
    dispatch_source_cancel(v8);

    [(MTPromiseWithTimeout *)self setDispatchSourceTimer:0];
  }
}

@end