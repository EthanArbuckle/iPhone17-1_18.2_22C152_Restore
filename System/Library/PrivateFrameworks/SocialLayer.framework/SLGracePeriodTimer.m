@interface SLGracePeriodTimer
+ (id)timerWithQueue:(id)a3 delay:(double)a4 action:(id)a5;
- (BOOL)isValid;
- (SLGracePeriodTimer)initWithQueue:(id)a3 delay:(double)a4 action:(id)a5;
- (id)description;
- (void)_createTimer;
- (void)arm;
- (void)dealloc;
- (void)suppress;
@end

@implementation SLGracePeriodTimer

+ (id)timerWithQueue:(id)a3 delay:(double)a4 action:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[SLGracePeriodTimer alloc] initWithQueue:v8 delay:v7 action:a4];

  return v9;
}

- (SLGracePeriodTimer)initWithQueue:(id)a3 delay:(double)a4 action:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SLGracePeriodTimer;
  v11 = [(SLGracePeriodTimer *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_callbackQueue, a3);
    v12->_delay = a4;
    v13 = _Block_copy(v10);
    id action = v12->_action;
    v12->_id action = v13;
  }
  return v12;
}

- (void)dealloc
{
  [(SLGracePeriodTimer *)self suppress];
  v3.receiver = self;
  v3.super_class = (Class)SLGracePeriodTimer;
  [(SLGracePeriodTimer *)&v3 dealloc];
}

- (BOOL)isValid
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_timer != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_createTimer
{
  BOOL v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  timer = self->_timer;
  self->_timer = v3;

  dispatch_set_qos_class_fallback();
  double delay = self->_delay;
  uint64_t v6 = (unint64_t)(delay / 10.0 * 1000000000.0);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v7, 0xFFFFFFFFFFFFFFFFLL, v6);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_expectedFiringTimeSinceReferenceDate = v8 + self->_delay;
  objc_initWeak(&location, self);
  id v9 = self->_timer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__SLGracePeriodTimer__createTimer__block_invoke;
  v12[3] = &unk_1E58A85E0;
  objc_copyWeak(&v13, &location);
  id v10 = v9;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v12);
  dispatch_source_set_event_handler(v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __34__SLGracePeriodTimer__createTimer__block_invoke(uint64_t a1)
{
  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = _Block_copy(WeakRetained[1]);
    BOOL v3 = v2;
    if (v2) {
      (*((void (**)(void *))v2 + 2))(v2);
    }
    [v4 suppress];

    WeakRetained = v4;
  }
}

- (void)arm
{
  obj = self;
  objc_sync_enter(obj);
  [(SLGracePeriodTimer *)obj suppress];
  [(SLGracePeriodTimer *)obj _createTimer];
  dispatch_resume((dispatch_object_t)obj->_timer);
  objc_sync_exit(obj);
}

- (void)suppress
{
  obj = self;
  objc_sync_enter(obj);
  timer = obj->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    BOOL v3 = obj->_timer;
    obj->_timer = 0;

    obj->_expectedFiringTimeSinceReferenceDate = 0.0;
  }
  objc_sync_exit(obj);
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_timer)
  {
    BOOL v3 = NSString;
    double expectedFiringTimeSinceReferenceDate = v2->_expectedFiringTimeSinceReferenceDate;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v6 = [v3 stringWithFormat:@"armed, firing in %.1gs", expectedFiringTimeSinceReferenceDate - v5];
  }
  else
  {
    uint64_t v6 = @"not running";
  }
  objc_sync_exit(v2);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_action, 0);
}

@end