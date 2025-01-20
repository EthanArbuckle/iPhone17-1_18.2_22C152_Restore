@interface NADecayingTimer
+ (id)scheduledTimerWithReferenceDate:(id)a3 minimumUnit:(unint64_t)a4 block:(id)a5;
- (NADecayingTimer)initWithReferenceDate:(id)a3 minimumUnit:(unint64_t)a4 block:(id)a5;
- (NSDate)referenceDate;
- (NSTimer)timer;
- (id)_nextFireDate;
- (id)block;
- (unint64_t)_mostSignificantUnitForDateComponents:(id)a3;
- (unint64_t)minimumUnit;
- (void)_scheduleNextTimer;
- (void)_timerEvent;
- (void)dealloc;
- (void)invalidate;
- (void)setTimer:(id)a3;
@end

@implementation NADecayingTimer

- (NADecayingTimer)initWithReferenceDate:(id)a3 minimumUnit:(unint64_t)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NADecayingTimer;
  v11 = [(NADecayingTimer *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_referenceDate, a3);
    v12->_minimumUnit = a4;
    uint64_t v13 = MEMORY[0x1BA99CF00](v10);
    id block = v12->_block;
    v12->_id block = (id)v13;

    [(NADecayingTimer *)v12 _scheduleNextTimer];
  }

  return v12;
}

- (void)dealloc
{
  [(NADecayingTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NADecayingTimer;
  [(NADecayingTimer *)&v3 dealloc];
}

+ (id)scheduledTimerWithReferenceDate:(id)a3 minimumUnit:(unint64_t)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithReferenceDate:v9 minimumUnit:a4 block:v8];

  return v10;
}

- (void)invalidate
{
  id v2 = [(NADecayingTimer *)self timer];
  [v2 invalidate];
}

- (id)_nextFireDate
{
  objc_super v3 = __32__NADecayingTimer__nextFireDate__block_invoke();
  v4 = [(NADecayingTimer *)self referenceDate];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [v3 components:252 fromDate:v4 toDate:v5 options:0];

  unint64_t v7 = [(NADecayingTimer *)self _mostSignificantUnitForDateComponents:v6];
  uint64_t v8 = [v6 valueForComponent:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v9 setValue:v8 + 1 forComponent:v7];
  id v10 = [(NADecayingTimer *)self referenceDate];
  v11 = [v3 dateByAddingComponents:v9 toDate:v10 options:0];

  return v11;
}

id __32__NADecayingTimer__nextFireDate__block_invoke()
{
  if (_block_invoke_na_once_token_0_0 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_0, &__block_literal_global_5);
  }
  v0 = (void *)_block_invoke_na_once_object_0_0;
  return v0;
}

uint64_t __32__NADecayingTimer__nextFireDate__block_invoke_2()
{
  _block_invoke_na_once_object_0_0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  return MEMORY[0x1F41817F8]();
}

- (void)_scheduleNextTimer
{
  objc_super v3 = [(NADecayingTimer *)self _nextFireDate];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F1CB00]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __37__NADecayingTimer__scheduleNextTimer__block_invoke;
  v11 = &unk_1E6109BA8;
  objc_copyWeak(&v12, &location);
  v5 = (void *)[v4 initWithFireDate:v3 interval:0 repeats:&v8 block:0.0];
  -[NADecayingTimer setTimer:](self, "setTimer:", v5, v8, v9, v10, v11);

  v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  unint64_t v7 = [(NADecayingTimer *)self timer];
  [v6 addTimer:v7 forMode:*MEMORY[0x1E4F1C3A0]];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __37__NADecayingTimer__scheduleNextTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerEvent];
}

- (void)_timerEvent
{
  objc_super v3 = [(NADecayingTimer *)self block];
  ((void (**)(void, NADecayingTimer *))v3)[2](v3, self);

  [(NADecayingTimer *)self _scheduleNextTimer];
}

- (unint64_t)_mostSignificantUnitForDateComponents:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 4;
  if ([(NADecayingTimer *)self minimumUnit] >= 5)
  {
    do
    {
      if ((unint64_t)([v4 valueForComponent:v5] - 1) < 0x7FFFFFFFFFFFFFFELL) {
        break;
      }
      v5 *= 2;
    }
    while (v5 < [(NADecayingTimer *)self minimumUnit]);
  }

  return v5;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (unint64_t)minimumUnit
{
  return self->_minimumUnit;
}

- (id)block
{
  return self->_block;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end