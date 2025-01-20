@interface PXRepetitivePausableTimer
- (PXRepetitivePausableTimer)initWithRepeatedInterval:(double)a3 initialTrigger:(BOOL)a4 target:(id)a5;
- (void)_handleTimer:(id)a3;
- (void)_pauseWithReasons:(int)a3;
- (void)_startTimer;
- (void)_stopTimer;
- (void)_unpauseWithReasons:(int)a3;
- (void)pause;
- (void)reset;
- (void)unpause;
@end

@implementation PXRepetitivePausableTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_callBlock, 0);
}

- (void)reset
{
  [(PXRepetitivePausableTimer *)self _stopTimer];
  [(PXRepetitivePausableTimer *)self _startTimer];
}

- (void)unpause
{
}

- (void)_unpauseWithReasons:(int)a3
{
  int v3 = self->_reasonsToPause - a3;
  self->_reasonsToPause = v3;
  if (!v3) {
    [(PXRepetitivePausableTimer *)self _startTimer];
  }
}

- (void)pause
{
  [(PXRepetitivePausableTimer *)self _stopTimer];
  [(PXRepetitivePausableTimer *)self _pauseWithReasons:1];
}

- (void)_pauseWithReasons:(int)a3
{
  self->_reasonsToPause += a3;
}

- (void)_handleTimer:(id)a3
{
}

- (void)_startTimer
{
  objc_msgSend(MEMORY[0x1E4F1CB00], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleTimer_, 0, 1, self->_repetitiveInterval);
  int v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v3;
}

- (void)_stopTimer
{
  timer = self->_timer;
  if (timer)
  {
    [(NSTimer *)timer invalidate];
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (PXRepetitivePausableTimer)initWithRepeatedInterval:(double)a3 initialTrigger:(BOOL)a4 target:(id)a5
{
  id v7 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXRepetitivePausableTimer;
  v8 = [(PXRepetitivePausableTimer *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_repetitiveInterval = a3;
    v10 = _Block_copy(v7);
    id callBlock = v9->_callBlock;
    v9->_id callBlock = v10;

    v9->_reasonsToPause = 0;
    id v12 = (id)objc_msgSend(MEMORY[0x1E4F1CB00], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", v9, sel__handleTimer_, 0, 0, 0.0);
    [(PXRepetitivePausableTimer *)v9 _startTimer];
  }

  return v9;
}

@end