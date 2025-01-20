@interface PSGWallClockMinuteTimer
- (PSGWallClockMinuteTimer)initWithTarget:(id)a3 selector:(SEL)a4;
- (void)_fireAction;
- (void)invalidate;
- (void)startTimer;
@end

@implementation PSGWallClockMinuteTimer

- (PSGWallClockMinuteTimer)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSGWallClockMinuteTimer;
  v7 = [(PSGWallClockMinuteTimer *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    timer = v8->_timer;
    v8->_action = v9;
    v8->_timer = 0;
  }
  return v8;
}

- (void)startTimer
{
  [(PSGWallClockMinuteTimer *)self invalidate];
  v3 = (void *)MEMORY[0x263EFFA20];
  v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  v5 = [MEMORY[0x263EFF910] date];
  id v6 = [v4 components:128 fromDate:v5];
  double v7 = (double)[v6 second];

  [v4 rangeOfUnit:128 inUnit:64 forDate:v5];
  double v9 = (double)v8 - v7;
  [v5 timeIntervalSinceReferenceDate];
  long double v11 = v9 - fmod(v10, 1.0);

  self->_timer = [v3 scheduledTimerWithTimeInterval:self target:sel__fireAction selector:0 userInfo:0 repeats:(double)v11];
  MEMORY[0x270F9A758]();
}

- (void)invalidate
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_fireAction
{
  [(PSGWallClockMinuteTimer *)self startTimer];
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (self->_action) {
    SEL action = self->_action;
  }
  else {
    SEL action = 0;
  }
  id v5 = WeakRetained;
  [WeakRetained performSelector:action withObject:0 afterDelay:0.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
}

@end