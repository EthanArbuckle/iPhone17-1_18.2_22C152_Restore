@interface MNWeakTimer
+ (id)scheduledTimerWithTimeInterval:(double)a3 target:(id)a4 selector:(SEL)a5;
- (MNWeakTimer)initWithTimeInterval:(double)a3 target:(id)a4 selector:(SEL)a5;
- (NSTimer)timer;
- (SEL)selector;
- (id)target;
- (void)_timerDidFire;
- (void)dealloc;
- (void)invalidate;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation MNWeakTimer

+ (id)scheduledTimerWithTimeInterval:(double)a3 target:(id)a4 selector:(SEL)a5
{
  id v7 = a4;
  v8 = [[MNWeakTimer alloc] initWithTimeInterval:v7 target:a5 selector:a3];

  return v8;
}

- (MNWeakTimer)initWithTimeInterval:(double)a3 target:(id)a4 selector:(SEL)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MNWeakTimer;
  v9 = [(MNWeakTimer *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(&v9->_target, v8);
    if (a5) {
      SEL v11 = a5;
    }
    else {
      SEL v11 = 0;
    }
    v10->_selector = v11;
    uint64_t v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v10 target:sel__timerDidFire selector:0 userInfo:0 repeats:a3];
    timer = v10->_timer;
    v10->_timer = (NSTimer *)v12;
  }
  return v10;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNWeakTimer;
  [(MNWeakTimer *)&v4 dealloc];
}

- (void)invalidate
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_timerDidFire
{
  v3 = [(MNWeakTimer *)self target];

  if (v3)
  {
    id v4 = [(MNWeakTimer *)self target];
    objc_msgSend(v4, "performSelector:", -[MNWeakTimer selector](self, "selector"));
  }
  else
  {
    [(MNWeakTimer *)self invalidate];
  }
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
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
}

@end