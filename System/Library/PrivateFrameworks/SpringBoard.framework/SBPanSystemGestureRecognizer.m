@interface SBPanSystemGestureRecognizer
- (BOOL)failsPastMaximumPressDurationWithoutHysteresis;
- (NSTimer)noHysterisisCancellationTimer;
- (SBPanSystemGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)maximumPressDuration;
- (void)dealloc;
- (void)invalidateNoHysterisisCancellationTimer;
- (void)reset;
- (void)setFailsPastMaximumPressDurationWithoutHysteresis:(BOOL)a3;
- (void)setMaximumPressDuration:(double)a3;
- (void)setNoHysterisisCancellationTimer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setupNoHysterisisCancellationTimerIfNeeded;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SBPanSystemGestureRecognizer

- (SBPanSystemGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBPanSystemGestureRecognizer;
  result = [(SBPanSystemGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_failsPastMaximumPressDurationWithoutHysteresis = 0;
    result->_maximumPressDuration = 2.0;
    result->_initialTouchReceivedTime = -1.79769313e308;
  }
  return result;
}

- (void)dealloc
{
  [(SBPanSystemGestureRecognizer *)self invalidateNoHysterisisCancellationTimer];
  v3.receiver = self;
  v3.super_class = (Class)SBPanSystemGestureRecognizer;
  [(SBPanSystemGestureRecognizer *)&v3 dealloc];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBPanSystemGestureRecognizer;
  [(SBPanSystemGestureRecognizer *)&v3 reset];
  [(SBPanSystemGestureRecognizer *)self invalidateNoHysterisisCancellationTimer];
  self->_initialTouchReceived = 0;
}

- (void)setState:(int64_t)a3
{
  BOOL v5 = [(SBPanSystemGestureRecognizer *)self failsPastMaximumPressDurationWithoutHysteresis];
  if (a3 == 1 && v5)
  {
    BSContinuousMachTimeNow();
    double v7 = v6 - self->_initialTouchReceivedTime;
    [(SBPanSystemGestureRecognizer *)self maximumPressDuration];
    if (v7 >= v8) {
      a3 = 5;
    }
    else {
      a3 = 1;
    }
  }
  noHysterisisCancellationTimer = self->_noHysterisisCancellationTimer;
  if (noHysterisisCancellationTimer)
  {
    [(NSTimer *)noHysterisisCancellationTimer invalidate];
    v10 = self->_noHysterisisCancellationTimer;
    self->_noHysterisisCancellationTimer = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)SBPanSystemGestureRecognizer;
  [(SBPanSystemGestureRecognizer *)&v11 setState:a3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPanSystemGestureRecognizer;
  [(SBPanSystemGestureRecognizer *)&v10 touchesBegan:v6 withEvent:a4];
  if (!self->_initialTouchReceived)
  {
    self->_initialTouchReceived = 1;
    BSContinuousMachTimeNow();
    self->_initialTouchReceivedTime = v7;
    [(SBPanSystemGestureRecognizer *)self setupNoHysterisisCancellationTimerIfNeeded];
    double v8 = [(SBPanSystemGestureRecognizer *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 anyObject];
      [v8 panSystemGestureRecognizer:self didReceiveInitialTouch:v9];
    }
  }
}

- (void)setupNoHysterisisCancellationTimerIfNeeded
{
  if ([(SBPanSystemGestureRecognizer *)self failsPastMaximumPressDurationWithoutHysteresis])
  {
    [(SBPanSystemGestureRecognizer *)self invalidateNoHysterisisCancellationTimer];
    objc_initWeak(&location, self);
    objc_super v3 = (void *)MEMORY[0x1E4F1CB00];
    [(SBPanSystemGestureRecognizer *)self maximumPressDuration];
    double v5 = v4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__SBPanSystemGestureRecognizer_setupNoHysterisisCancellationTimerIfNeeded__block_invoke;
    v9[3] = &unk_1E6AF8EE0;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    id v6 = [v3 timerWithTimeInterval:0 repeats:v9 block:v5];
    noHysterisisCancellationTimer = self->_noHysterisisCancellationTimer;
    self->_noHysterisisCancellationTimer = v6;

    double v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v8 addTimer:self->_noHysterisisCancellationTimer forMode:*MEMORY[0x1E4F1C4B0]];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __74__SBPanSystemGestureRecognizer_setupNoHysterisisCancellationTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) state];
    id WeakRetained = v4;
    if (!v3)
    {
      [*(id *)(a1 + 32) setState:5];
      id WeakRetained = v4;
    }
  }
}

- (void)invalidateNoHysterisisCancellationTimer
{
  noHysterisisCancellationTimer = self->_noHysterisisCancellationTimer;
  if (noHysterisisCancellationTimer)
  {
    [(NSTimer *)noHysterisisCancellationTimer invalidate];
    id v4 = self->_noHysterisisCancellationTimer;
    self->_noHysterisisCancellationTimer = 0;
  }
}

- (BOOL)failsPastMaximumPressDurationWithoutHysteresis
{
  return self->_failsPastMaximumPressDurationWithoutHysteresis;
}

- (void)setFailsPastMaximumPressDurationWithoutHysteresis:(BOOL)a3
{
  self->_failsPastMaximumPressDurationWithoutHysteresis = a3;
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (NSTimer)noHysterisisCancellationTimer
{
  return self->_noHysterisisCancellationTimer;
}

- (void)setNoHysterisisCancellationTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end