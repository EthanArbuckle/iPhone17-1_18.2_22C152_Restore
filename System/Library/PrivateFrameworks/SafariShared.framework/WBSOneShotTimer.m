@interface WBSOneShotTimer
- (BOOL)isValid;
- (NSDate)fireDate;
- (OS_dispatch_queue)queue;
- (WBSOneShotTimer)initWithFireDate:(id)a3 queue:(id)a4 block:(id)a5;
- (WBSOneShotTimer)initWithFireDate:(id)a3 queue:(id)a4 target:(id)a5 selector:(SEL)a6;
- (void)invalidate;
@end

@implementation WBSOneShotTimer

- (WBSOneShotTimer)initWithFireDate:(id)a3 queue:(id)a4 block:(id)a5
{
  id v9 = a3;
  v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)WBSOneShotTimer;
  v12 = [(WBSOneShotTimer *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v13->_fireDate, a3);
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v11);
    id block = v13->_block;
    v13->_id block = v14;

    [v9 timeIntervalSinceNow];
    double v17 = v16 * 1000000000.0;
    BOOL v18 = v16 < 0.0;
    double v19 = 0.0;
    if (!v18) {
      double v19 = v17;
    }
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)v19);
    dispatch_after(v20, v10, v13->_block);
    v21 = v13;
  }

  return v13;
}

- (WBSOneShotTimer)initWithFireDate:(id)a3 queue:(id)a4 target:(id)a5 selector:(SEL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__WBSOneShotTimer_initWithFireDate_queue_target_selector___block_invoke;
  v15[3] = &unk_1E5C9E058;
  objc_copyWeak(&v16, &from);
  v17[1] = (id)a6;
  objc_copyWeak(v17, &location);
  v13 = [(WBSOneShotTimer *)self initWithFireDate:v10 queue:v11 block:v15];
  objc_destroyWeak(v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

void __58__WBSOneShotTimer_initWithFireDate_queue_target_selector___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *(const char **)(a1 + 48);
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, v2, v3);
  }
}

- (void)invalidate
{
}

- (BOOL)isValid
{
  return dispatch_block_testcancel(self->_block) == 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end