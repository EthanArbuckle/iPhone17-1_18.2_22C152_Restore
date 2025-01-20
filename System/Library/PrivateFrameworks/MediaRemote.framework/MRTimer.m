@interface MRTimer
- (BOOL)isValid;
- (MRTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6;
- (NSDate)fireDate;
- (double)timeRemaining;
- (void)invalidate;
- (void)invalidateWithReason:(id)a3;
@end

@implementation MRTimer

- (MRTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MRTimer;
  v13 = [(MRTimer *)&v24 init];
  if (v13)
  {
    objc_initWeak(&location, v13);
    id v14 = objc_alloc(MEMORY[0x1E4F77A30]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__MRTimer_initWithInterval_name_queue_block___block_invoke;
    v20[3] = &unk_1E57D2918;
    objc_copyWeak(&v22, &location);
    id v21 = v12;
    uint64_t v15 = [v14 initWithInterval:0 repeats:v11 queue:v20 block:a3];
    timer = v13->_timer;
    v13->_timer = (MSVTimer *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
    fireDate = v13->_fireDate;
    v13->_fireDate = (NSDate *)v17;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

uint64_t __45__MRTimer_initWithInterval_name_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidateWithReason:@"Timer Fired"];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)invalidate
{
}

- (void)invalidateWithReason:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  timer = v4->_timer;
  if (timer)
  {
    [(MSVTimer *)timer invalidate];
    v6 = v4->_timer;
    v4->_timer = 0;

    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    fireDate = v4->_fireDate;
    v4->_fireDate = (NSDate *)v7;
  }
  objc_sync_exit(v4);
}

- (BOOL)isValid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_timer != 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)fireDate
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_fireDate;
  objc_sync_exit(v2);

  return v3;
}

- (double)timeRemaining
{
  v2 = [(MRTimer *)self fireDate];
  [v2 timeIntervalSinceNow];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end