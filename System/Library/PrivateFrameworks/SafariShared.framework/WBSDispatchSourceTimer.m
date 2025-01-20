@interface WBSDispatchSourceTimer
+ (id)scheduledRepeatingTimerWithStartDelay:(double)a3 interval:(double)a4 handler:(id)a5;
+ (id)scheduledTimerWithInterval:(double)a3 repeats:(BOOL)a4 handler:(id)a5;
+ (id)scheduledTimerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 handler:(id)a6;
+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 handler:(id)a6;
- (BOOL)isValid;
- (BOOL)repeats;
- (OS_dispatch_queue)queue;
- (WBSDispatchSourceTimer)initWithStartDelay:(double)a3 interval:(double)a4 repeats:(BOOL)a5 queue:(id)a6 handler:(id)a7;
- (double)interval;
- (double)startDelay;
- (id)handler;
- (void)_scheduleTimer;
- (void)dealloc;
- (void)invalidate;
- (void)resetFireDate;
- (void)schedule;
@end

@implementation WBSDispatchSourceTimer

+ (id)scheduledTimerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 handler:(id)a6
{
  v6 = [a1 timerWithInterval:a4 repeats:a5 queue:a6 handler:a3];
  [v6 schedule];
  return v6;
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 handler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  v12 = (void *)[objc_alloc((Class)a1) initWithStartDelay:v7 interval:v11 repeats:v10 queue:a3 handler:a3];

  return v12;
}

- (WBSDispatchSourceTimer)initWithStartDelay:(double)a3 interval:(double)a4 repeats:(BOOL)a5 queue:(id)a6 handler:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)WBSDispatchSourceTimer;
  v15 = [(WBSDispatchSourceTimer *)&v21 init];
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    v15->_interval = a4;
    v15->_startDelay = a3;
    v15->_repeats = a5;
    objc_storeStrong((id *)&v15->_queue, a6);
    uint64_t v17 = MEMORY[0x1AD0C4F80](v14);
    id handler = v16->_handler;
    v16->_id handler = (id)v17;

    v19 = v16;
  }

  return v16;
}

- (void)schedule
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_timer)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v4;

    objc_initWeak(&location, self);
    v6 = self->_timer;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __34__WBSDispatchSourceTimer_schedule__block_invoke;
    id v10 = &unk_1E5C8E0B0;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v6, &v7);
    [(WBSDispatchSourceTimer *)self _scheduleTimer];
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_scheduleTimer
{
  os_unfair_lock_assert_owner(&self->_lock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_startDelay * 1000000000.0));
    uint64_t v5 = (unint64_t)(self->_interval * 1000000000.0);
    uint64_t v6 = (unint64_t)(self->_startDelay * 0.1 * 1000000000.0);
    dispatch_source_set_timer(timer, v4, v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

void __34__WBSDispatchSourceTimer_schedule__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (([WeakRetained repeats] & 1) == 0) {
      [v3 invalidate];
    }
    v2 = [v3 handler];
    v2[2]();

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(WBSDispatchSourceTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSDispatchSourceTimer;
  [(WBSDispatchSourceTimer *)&v3 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    uint64_t v5 = self->_timer;
    self->_timer = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (id)handler
{
  return self->_handler;
}

+ (id)scheduledTimerWithInterval:(double)a3 repeats:(BOOL)a4 handler:(id)a5
{
  uint64_t v5 = [a1 timerWithInterval:a4 repeats:MEMORY[0x1E4F14428] queue:a5 handler:a3];
  [v5 schedule];
  return v5;
}

+ (id)scheduledRepeatingTimerWithStartDelay:(double)a3 interval:(double)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc((Class)a1);
  id v10 = (void *)[v9 initWithStartDelay:1 interval:MEMORY[0x1E4F14428] repeats:v8 queue:a3 handler:a4];

  [v10 schedule];
  return v10;
}

- (BOOL)isValid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_time_t v4 = self->_timer;
  os_unfair_lock_unlock(p_lock);

  return v4 != 0;
}

- (void)resetFireDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WBSDispatchSourceTimer *)self _scheduleTimer];
  os_unfair_lock_unlock(p_lock);
}

- (double)interval
{
  return self->_interval;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end