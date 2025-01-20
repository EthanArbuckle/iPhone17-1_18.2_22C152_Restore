@interface REUpNextTimer
+ (REUpNextTimer)timerWithFireDate:(id)a3 queue:(id)a4 block:(id)a5;
+ (REUpNextTimer)timerWithFireInterval:(id)a3 atRate:(double)a4 queue:(id)a5 block:(id)a6;
+ (REUpNextTimer)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
- (BOOL)_isNowRepeatingTimerWithCurrentDate:(id)a3;
- (BOOL)isValid;
- (NSDateInterval)fireInterval;
- (OS_dispatch_source)dispatch_timer;
- (REUpNextTimer)initWithDateInterval:(id)a3 rate:(double)a4 queue:(id)a5 block:(id)a6;
- (double)rate;
- (id)block;
- (void)_handleTimer;
- (void)_rescheduleTimer;
- (void)_scheduleTimerWithInterval:(id)a3 rate:(double)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatch_timer:(id)a3;
@end

@implementation REUpNextTimer

+ (REUpNextTimer)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return (REUpNextTimer *)[a1 timerWithFireInterval:0 atRate:a4 queue:a5 block:a3];
}

+ (REUpNextTimer)timerWithFireDate:(id)a3 queue:(id)a4 block:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F08798];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithStartDate:v11 duration:0.0];

  v13 = [a1 timerWithFireInterval:v12 atRate:v10 queue:v9 block:0.0];

  return (REUpNextTimer *)v13;
}

+ (REUpNextTimer)timerWithFireInterval:(id)a3 atRate:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithDateInterval:v12 rate:v11 queue:v10 block:a4];

  return (REUpNextTimer *)v13;
}

- (REUpNextTimer)initWithDateInterval:(id)a3 rate:(double)a4 queue:(id)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)REUpNextTimer;
  v14 = [(REUpNextTimer *)&v28 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fireInterval, a3);
    v15->_rate = a4;
    uint64_t v16 = MEMORY[0x223C31700](v13);
    id block = v15->_block;
    v15->_id block = (id)v16;

    objc_msgSend(NSString, "stringWithFormat:", @"%s.RETimer", dispatch_queue_get_label(v12));
    id v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2((const char *)[v18 UTF8String], 0, v12);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v19;

    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v15->_queue);
    [(REUpNextTimer *)v15 setDispatch_timer:v21];

    [(REUpNextTimer *)v15 _scheduleTimerWithInterval:v11 rate:a4];
    objc_initWeak(&location, v15);
    v22 = [(REUpNextTimer *)v15 dispatch_timer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __55__REUpNextTimer_initWithDateInterval_rate_queue_block___block_invoke;
    handler[3] = &unk_2644BC638;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v22, handler);

    v23 = [(REUpNextTimer *)v15 dispatch_timer];
    dispatch_resume(v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v15;
}

void __55__REUpNextTimer_initWithDateInterval_rate_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTimer];
}

- (void)dealloc
{
  v3 = [(REUpNextTimer *)self dispatch_timer];

  if (v3)
  {
    v4 = [(REUpNextTimer *)self dispatch_timer];
    dispatch_source_cancel(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)REUpNextTimer;
  [(REUpNextTimer *)&v5 dealloc];
}

- (BOOL)_isNowRepeatingTimerWithCurrentDate:(id)a3
{
  fireInterval = self->_fireInterval;
  return !fireInterval || [(NSDateInterval *)fireInterval containsDate:a3];
}

- (void)_scheduleTimerWithInterval:(id)a3 rate:(double)a4
{
  id v6 = a3;
  if ([(REUpNextTimer *)self isValid])
  {
    v7 = [MEMORY[0x263EFF910] date];
    if ([(REUpNextTimer *)self _isNowRepeatingTimerWithCurrentDate:v7])
    {
      lastFireDate = self->_lastFireDate;
      if (!lastFireDate)
      {
        objc_storeStrong((id *)&self->_lastFireDate, v7);
        lastFireDate = self->_lastFireDate;
      }
      id v9 = [(NSDate *)lastFireDate dateByAddingTimeInterval:self->_rate];
      BOOL v10 = 1;
    }
    else
    {
      [v6 duration];
      double v13 = v12;
      BOOL v10 = v12 > 2.22044605e-16;
      v14 = [v6 endDate];
      v15 = [v14 earlierDate:v7];

      if (v15 != v7)
      {
        [0 timeIntervalSinceDate:v7];
        id v9 = 0;
        dispatch_time_t v16 = -1;
        uint64_t v17 = -1;
        if (v13 <= 2.22044605e-16) {
          goto LABEL_30;
        }
        goto LABEL_23;
      }
      id v9 = [v6 startDate];
    }
    [v9 timeIntervalSinceDate:v7];
    if (v9)
    {
      if (v18 > 0.0)
      {
        if (v18 <= 9223372040.0) {
          int64_t v19 = (uint64_t)(v18 * 1000000000.0);
        }
        else {
          int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        }
        dispatch_time_t v16 = dispatch_walltime(0, v19);
        if (!v10) {
          goto LABEL_29;
        }
        goto LABEL_23;
      }
      dispatch_time_t v16 = 0;
    }
    else
    {
      dispatch_time_t v16 = -1;
    }
    if (!v10)
    {
LABEL_29:
      uint64_t v17 = -1;
LABEL_30:
      id v26 = [(REUpNextTimer *)self dispatch_timer];
      dispatch_source_set_timer(v26, v16, v17, 0x1DCD6500uLL);

      goto LABEL_31;
    }
LABEL_23:
    if (a4 > 1.84467441e10) {
      uint64_t v17 = -1;
    }
    else {
      uint64_t v17 = (unint64_t)(a4 * 1000000000.0);
    }
    if (v16 == -1 || v17) {
      goto LABEL_30;
    }
    [v6 duration];
    v27 = objc_msgSend(NSNumber, "numberWithDouble:");
    _REGenerateSimulatedCrash(@"UpNextBadTimerInterval", @"About to invoke dispatch with a zero repeat interval. repeats=%d start=%lld [interval duration]=%@ %016llX rate=%f leeway=%llu nextFireDate=%@ now=%@ interval=<<%@>>", v20, v21, v22, v23, v24, v25, 1);

    goto LABEL_29;
  }
  id v11 = RELogForDomain(9);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[REUpNextTimer _scheduleTimerWithInterval:rate:]((uint64_t)self, v11);
  }

LABEL_31:
}

- (void)_handleTimer
{
  if (self->_block && [(REUpNextTimer *)self isValid]) {
    (*((void (**)(void))self->_block + 2))();
  }
  v3 = [MEMORY[0x263EFF910] date];
  lastFireDate = self->_lastFireDate;
  self->_lastFireDate = v3;

  fireInterval = self->_fireInterval;
  if (fireInterval)
  {
    id v6 = [(NSDateInterval *)fireInterval endDate];
    v7 = [MEMORY[0x263EFF910] date];
    uint64_t v8 = [v6 compare:v7];

    if (v8 == -1)
    {
      [(REUpNextTimer *)self invalidate];
    }
  }
}

- (void)_rescheduleTimer
{
  if ([(REUpNextTimer *)self isValid])
  {
    id v5 = [MEMORY[0x263EFF910] date];
    v3 = [(NSDateInterval *)self->_fireInterval endDate];
    uint64_t v4 = [v3 compare:v5];

    if (v4 == -1) {
      [(REUpNextTimer *)self _handleTimer];
    }
    else {
      [(REUpNextTimer *)self _scheduleTimerWithInterval:self->_fireInterval rate:self->_rate];
    }
  }
}

- (BOOL)isValid
{
  v2 = [(REUpNextTimer *)self dispatch_timer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__REUpNextTimer_invalidate__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __27__REUpNextTimer_invalidate__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "dispatch_timer");

  if (v2)
  {
    BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "dispatch_timer");
    dispatch_source_cancel(v3);

    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "setDispatch_timer:", 0);
  }
}

- (NSDateInterval)fireInterval
{
  return self->_fireInterval;
}

- (double)rate
{
  return self->_rate;
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_source)dispatch_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDispatch_timer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatch_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_fireInterval, 0);
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_scheduleTimerWithInterval:(uint64_t)a1 rate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Trying to schedule invalid timer %@", (uint8_t *)&v2, 0xCu);
}

@end