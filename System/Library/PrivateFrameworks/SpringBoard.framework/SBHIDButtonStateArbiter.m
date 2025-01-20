@interface SBHIDButtonStateArbiter
- (BOOL)_canIncrementRepeatedPressCount;
- (BOOL)isLongPressDisabled;
- (BOOL)isRepeatedPressDisabled;
- (SBHIDButtonStateArbiter)init;
- (SBHIDButtonStateDelegate)delegate;
- (double)longPressTimeout;
- (double)repeatedPressTimeout;
- (int64_t)pressSequence;
- (uint64_t)_repeatedPressTimeoutDidOccur;
- (unint64_t)downTime;
- (unint64_t)maximumRepeatedPressCount;
- (unint64_t)repeatedPressCount;
- (unint64_t)repeatedPressInitialDownTime;
- (void)_invalidateLongPressTimer;
- (void)_invalidateRepeatedPressTimer;
- (void)_longPressTimeoutDidOccur;
- (void)_startLongPressTimerWithTimeout:(double *)val;
- (void)_startRepeatedPressTimerWithTimeout:(double *)val;
- (void)dealloc;
- (void)processEvent:(__IOHIDEvent *)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setLongPressTimeout:(double)a3;
- (void)setMaximumRepeatedPressCount:(unint64_t)a3;
- (void)setRepeatedPressTimeout:(double)a3;
@end

@implementation SBHIDButtonStateArbiter

- (SBHIDButtonStateArbiter)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIDButtonStateArbiter;
  result = [(SBHIDButtonStateArbiter *)&v3 init];
  if (result) {
    *(int64x2_t *)&result->_repeatedPressCount = vdupq_n_s64(1uLL);
  }
  return result;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_longPressTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_repeatedPressTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHIDButtonStateArbiter;
  [(SBHIDButtonStateArbiter *)&v3 dealloc];
}

- (void)reset
{
  if (self)
  {
    [(BSAbsoluteMachTimer *)self->_longPressTimer invalidate];
    longPressTimer = self->_longPressTimer;
    self->_longPressTimer = 0;

    [(BSAbsoluteMachTimer *)self->_repeatedPressTimer invalidate];
    repeatedPressTimer = self->_repeatedPressTimer;
    self->_repeatedPressTimer = 0;
  }
  self->_recognizedLongPress = 0;
  self->_downTime = 0;
  self->_previousUpTime = 0;
  self->_longPressTimeoutAtDownEvent = 0.0;
  self->_repeatedPressTimeoutAtUpEvent = 0.0;
  self->_downEventSenderID = 0;
}

- (void)_invalidateLongPressTimer
{
  if (a1)
  {
    [*(id *)(a1 + 24) invalidate];
    v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (void)_invalidateRepeatedPressTimer
{
  if (a1)
  {
    [*(id *)(a1 + 32) invalidate];
    v2 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (BOOL)isLongPressDisabled
{
  return self->_longPressTimeout <= 0.0;
}

- (void)_startLongPressTimerWithTimeout:(double *)val
{
  if (val)
  {
    if (a2 > 0.0)
    {
      val[6] = a2;
      objc_initWeak(&location, val);
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBHIDButtonStateArbiter.longPressTimer"];
      v5 = (void *)*((void *)val + 3);
      *((void *)val + 3) = v4;

      v6 = (void *)*((void *)val + 3);
      uint64_t v7 = MEMORY[0x1E4F14428];
      id v8 = MEMORY[0x1E4F14428];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__SBHIDButtonStateArbiter__startLongPressTimerWithTimeout___block_invoke;
      v9[3] = &unk_1E6AF5838;
      objc_copyWeak(&v10, &location);
      [v6 scheduleWithFireInterval:v7 leewayInterval:v9 queue:a2 handler:0.0];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __59__SBHIDButtonStateArbiter__startLongPressTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBHIDButtonStateArbiter _longPressTimeoutDidOccur]((uint64_t)WeakRetained);
}

- (void)_longPressTimeoutDidOccur
{
  if (a1 && *(void *)(a1 + 24))
  {
    *(unsigned char *)(a1 + 16) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained performActionsForButtonLongPress:a1];

    *(void *)(a1 + 48) = 0;
    [*(id *)(a1 + 24) invalidate];
    objc_super v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (BOOL)isRepeatedPressDisabled
{
  return self->_repeatedPressTimeout <= 0.0 || self->_maximumRepeatedPressCount == 1;
}

- (void)_startRepeatedPressTimerWithTimeout:(double *)val
{
  if (val)
  {
    if (a2 > 0.0)
    {
      val[7] = a2;
      objc_initWeak(&location, val);
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBHIDButtonStateArbiter.repeatedPressTimer"];
      v5 = (void *)*((void *)val + 4);
      *((void *)val + 4) = v4;

      v6 = (void *)*((void *)val + 4);
      uint64_t v7 = MEMORY[0x1E4F14428];
      id v8 = MEMORY[0x1E4F14428];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__SBHIDButtonStateArbiter__startRepeatedPressTimerWithTimeout___block_invoke;
      v9[3] = &unk_1E6AF5838;
      objc_copyWeak(&v10, &location);
      [v6 scheduleWithFireInterval:v7 leewayInterval:v9 queue:a2 handler:0.0];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __63__SBHIDButtonStateArbiter__startRepeatedPressTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBHIDButtonStateArbiter _repeatedPressTimeoutDidOccur]((uint64_t)WeakRetained);
}

- (uint64_t)_repeatedPressTimeoutDidOccur
{
  if (result)
  {
    v1 = (void *)result;
    if (*(void *)(result + 32))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(result + 120));
      [WeakRetained performActionsForButtonUp:v1];

      v1[14] = 0;
      v1[9] = 1;
      return [v1 reset];
    }
  }
  return result;
}

- (BOOL)_canIncrementRepeatedPressCount
{
  if (result)
  {
    unint64_t v1 = *(void *)(result + 80);
    return !v1 || *(void *)(result + 72) < v1;
  }
  return result;
}

- (void)processEvent:(__IOHIDEvent *)a3
{
  unint64_t SenderID = IOHIDEventGetSenderID();
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (IntegerValue)
  {
    id v18 = WeakRetained;
    unint64_t TimeStamp = IOHIDEventGetTimeStamp();
    double repeatedPressTimeoutAtUpEvent = self->_repeatedPressTimeoutAtUpEvent;
    if (repeatedPressTimeoutAtUpEvent <= 0.0)
    {
      [(SBHIDButtonStateArbiter *)self reset];
      self->_downEventunint64_t SenderID = SenderID;
      ++self->_pressSequence;
      self->_downTime = TimeStamp;
    }
    else
    {
      BSMonotonicReferencedTimeFromMachTime();
      if (v9 > repeatedPressTimeoutAtUpEvent) {
        -[SBHIDButtonStateArbiter _repeatedPressTimeoutDidOccur]((uint64_t)self);
      }
      [(SBHIDButtonStateArbiter *)self reset];
      self->_downEventunint64_t SenderID = SenderID;
      ++self->_pressSequence;
      self->_downTime = TimeStamp;
      BSMonotonicReferencedTimeFromMachTime();
      if (v10 < repeatedPressTimeoutAtUpEvent)
      {
        unint64_t repeatedPressCount = self->_repeatedPressCount;
        if (self->_maximumRepeatedPressCount - 1 >= repeatedPressCount)
        {
          self->_unint64_t repeatedPressCount = repeatedPressCount + 1;
          [(BSAbsoluteMachTimer *)self->_longPressTimer invalidate];
          longPressTimer = self->_longPressTimer;
          self->_longPressTimer = 0;

          goto LABEL_18;
        }
      }
    }
    self->_unint64_t repeatedPressCount = 1;
    [(SBHIDButtonStateArbiter *)(double *)self _startLongPressTimerWithTimeout:self->_longPressTimeout];
    [v18 performActionsForButtonDown:self];
    goto LABEL_18;
  }
  if (self->_downEventSenderID != SenderID) {
    goto LABEL_19;
  }
  id v18 = WeakRetained;
  unint64_t v13 = IOHIDEventGetTimeStamp();
  double longPressTimeoutAtDownEvent = self->_longPressTimeoutAtDownEvent;
  if (longPressTimeoutAtDownEvent > 0.0)
  {
    BSMonotonicReferencedTimeFromMachTime();
    if (v15 > longPressTimeoutAtDownEvent) {
      -[SBHIDButtonStateArbiter _longPressTimeoutDidOccur]((uint64_t)self);
    }
  }
  double repeatedPressTimeout = self->_repeatedPressTimeout;
  if (repeatedPressTimeout <= 0.0
    || self->_recognizedLongPress
    || (unint64_t v17 = self->_repeatedPressCount, self->_maximumRepeatedPressCount - 1 < v17))
  {
    [v18 performActionsForButtonUp:self];
    self->_repeatedPressInitialDownTime = 0;
    [(SBHIDButtonStateArbiter *)self reset];
  }
  else
  {
    if (v17 == 1) {
      self->_repeatedPressInitialDownTime = self->_downTime;
    }
    [(SBHIDButtonStateArbiter *)self reset];
    self->_previousUpTime = v13;
    [(SBHIDButtonStateArbiter *)(double *)self _startRepeatedPressTimerWithTimeout:repeatedPressTimeout];
  }
LABEL_18:
  id WeakRetained = v18;
LABEL_19:
}

- (double)longPressTimeout
{
  return self->_longPressTimeout;
}

- (void)setLongPressTimeout:(double)a3
{
  self->_longPressTimeout = a3;
}

- (unint64_t)repeatedPressCount
{
  return self->_repeatedPressCount;
}

- (unint64_t)maximumRepeatedPressCount
{
  return self->_maximumRepeatedPressCount;
}

- (void)setMaximumRepeatedPressCount:(unint64_t)a3
{
  self->_maximumRepeatedPressCount = a3;
}

- (double)repeatedPressTimeout
{
  return self->_repeatedPressTimeout;
}

- (void)setRepeatedPressTimeout:(double)a3
{
  self->_double repeatedPressTimeout = a3;
}

- (int64_t)pressSequence
{
  return self->_pressSequence;
}

- (unint64_t)downTime
{
  return self->_downTime;
}

- (unint64_t)repeatedPressInitialDownTime
{
  return self->_repeatedPressInitialDownTime;
}

- (SBHIDButtonStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIDButtonStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_repeatedPressTimer, 0);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
}

@end