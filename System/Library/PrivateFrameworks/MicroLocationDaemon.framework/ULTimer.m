@interface ULTimer
- (BOOL)isTimerSourceNil;
- (OS_dispatch_source)timerSource;
- (ULTimer)init;
- (ULTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)setTimerSource:(id)a3;
@end

@implementation ULTimer

- (ULTimer)init
{
  [NSString stringWithFormat:@"%@ cannot be initialized directly", objc_opt_class()];
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v2);
}

- (void)dealloc
{
  [(ULTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ULTimer;
  [(ULTimer *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = [(ULTimer *)self timerSource];

  if (v3)
  {
    v4 = [(ULTimer *)self timerSource];
    dispatch_source_cancel(v4);

    [(ULTimer *)self setTimerSource:0];
  }
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (void).cxx_destruct
{
}

- (ULTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  BOOL v7 = a4;
  v10 = a5;
  id v11 = a6;
  v29.receiver = self;
  v29.super_class = (Class)ULTimer;
  v12 = [(ULTimer *)&v29 init];
  if (v12)
  {
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v10);
    [(ULTimer *)v12 setTimerSource:v13];

    double v14 = a3 * 1000000000.0;
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)v14);
    if (v7) {
      uint64_t v16 = (unint64_t)v14;
    }
    else {
      uint64_t v16 = -1;
    }
    v17 = [(ULTimer *)v12 timerSource];
    dispatch_source_set_timer(v17, v15, v16, 0x989680uLL);

    objc_initWeak(&location, v12);
    v18 = [(ULTimer *)v12 timerSource];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __54__ULTimer_init__initWithInterval_repeats_queue_block___block_invoke;
    v24 = &unk_2653F98C0;
    id v25 = v11;
    BOOL v27 = v7;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v18, &v21);

    v19 = [(ULTimer *)v12 timerSource];
    dispatch_activate(v19);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __54__ULTimer_init__initWithInterval_repeats_queue_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained invalidate];
  }
}

- (BOOL)isTimerSourceNil
{
  id v2 = [(ULTimer *)self timerSource];
  BOOL v3 = v2 == 0;

  return v3;
}

@end