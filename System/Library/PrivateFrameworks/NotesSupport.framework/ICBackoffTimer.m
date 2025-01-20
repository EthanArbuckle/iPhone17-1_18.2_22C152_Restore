@interface ICBackoffTimer
- (BOOL)isScheduled;
- (ICBackoffTimer)init;
- (ICBackoffTimer)initWithInitialInterval:(double)a3 maxInterval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7;
- (NSTimer)timer;
- (SEL)selector;
- (double)initialTimeInterval;
- (double)maxTimeInterval;
- (double)nextTimeInterval;
- (id)target;
- (id)userInfo;
- (unint64_t)backoffCount;
- (void)dealloc;
- (void)fire;
- (void)fire:(id)a3;
- (void)invalidate;
- (void)scheduleToFire;
- (void)setBackoffCount:(unint64_t)a3;
- (void)setInitialTimeInterval:(double)a3;
- (void)setMaxTimeInterval:(double)a3;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation ICBackoffTimer

- (ICBackoffTimer)init
{
  return 0;
}

- (ICBackoffTimer)initWithInitialInterval:(double)a3 maxInterval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)ICBackoffTimer;
  v14 = [(ICBackoffTimer *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(ICBackoffTimer *)v14 setInitialTimeInterval:a3];
    [(ICBackoffTimer *)v15 setMaxTimeInterval:a4];
    [(ICBackoffTimer *)v15 setTarget:v12];
    [(ICBackoffTimer *)v15 setSelector:a6];
    [(ICBackoffTimer *)v15 setUserInfo:v13];
    [(ICBackoffTimer *)v15 setBackoffCount:0];
  }

  return v15;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__ICBackoffTimer_dealloc__block_invoke;
  v4[3] = &unk_2640CD3A8;
  v4[4] = self;
  performBlockOnMainThreadAndWait(v4);
  v3.receiver = self;
  v3.super_class = (Class)ICBackoffTimer;
  [(ICBackoffTimer *)&v3 dealloc];
}

void __25__ICBackoffTimer_dealloc__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) timer];
  [v1 invalidate];
}

- (double)nextTimeInterval
{
  [(ICBackoffTimer *)self initialTimeInterval];
  double v4 = v3 + pow(3.0, (double)[(ICBackoffTimer *)self backoffCount]) + -1.0;
  [(ICBackoffTimer *)self maxTimeInterval];
  if (v4 < result) {
    return v4;
  }
  return result;
}

- (void)fire:(id)a3
{
  id v8 = a3;
  id v4 = [(ICBackoffTimer *)self timer];
  if (v4 == v8)
  {
    v5 = [(ICBackoffTimer *)self target];

    if (!v5) {
      goto LABEL_5;
    }
    v6 = [(ICBackoffTimer *)self target];
    v7 = (void (*)(id, SEL, ICBackoffTimer *))objc_msgSend(v6, "methodForSelector:", -[ICBackoffTimer selector](self, "selector"));

    id v4 = [(ICBackoffTimer *)self target];
    v7(v4, [(ICBackoffTimer *)self selector], self);
  }

LABEL_5:
}

- (void)invalidate
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __28__ICBackoffTimer_invalidate__block_invoke;
  v2[3] = &unk_2640CD3A8;
  v2[4] = self;
  performBlockOnMainThreadAndWait(v2);
}

uint64_t __28__ICBackoffTimer_invalidate__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timer];
  [v2 invalidate];

  double v3 = *(void **)(a1 + 32);
  return [v3 setTimer:0];
}

- (BOOL)isScheduled
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__ICBackoffTimer_isScheduled__block_invoke;
  v4[3] = &unk_2640CD2F8;
  v4[4] = self;
  void v4[5] = &v5;
  performBlockOnMainThreadAndWait(v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__ICBackoffTimer_isScheduled__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timer];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isValid];
}

- (void)scheduleToFire
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __32__ICBackoffTimer_scheduleToFire__block_invoke;
  v2[3] = &unk_2640CD3A8;
  v2[4] = self;
  performBlockOnMainThreadAndWait(v2);
}

uint64_t __32__ICBackoffTimer_scheduleToFire__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timer];

  if (v2)
  {
    double v3 = [*(id *)(a1 + 32) timer];
    [v3 invalidate];
  }
  id v4 = (void *)MEMORY[0x263EFFA20];
  [*(id *)(a1 + 32) nextTimeInterval];
  uint64_t v5 = objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), sel_fire_, 0, 0);
  [*(id *)(a1 + 32) setTimer:v5];

  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 backoffCount] + 1;
  return [v6 setBackoffCount:v7];
}

- (void)fire
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __22__ICBackoffTimer_fire__block_invoke;
  v2[3] = &unk_2640CD3A8;
  v2[4] = self;
  performBlockOnMainThreadAndWait(v2);
}

uint64_t __22__ICBackoffTimer_fire__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timer];
  [v2 fire];

  double v3 = *(void **)(a1 + 32);
  return [v3 setTimer:0];
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (double)initialTimeInterval
{
  return self->_initialTimeInterval;
}

- (void)setInitialTimeInterval:(double)a3
{
  self->_initialTimeInterval = a3;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    double v3 = a3;
  }
  else {
    double v3 = 0;
  }
  self->_selector = v3;
}

- (unint64_t)backoffCount
{
  return self->_backoffCount;
}

- (void)setBackoffCount:(unint64_t)a3
{
  self->_backoffCount = a3;
}

- (double)maxTimeInterval
{
  return self->_maxTimeInterval;
}

- (void)setMaxTimeInterval:(double)a3
{
  self->_maxTimeInterval = a3;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_userInfo, 0);
}

@end