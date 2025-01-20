@interface _UIRepeatingGestureClock
- (_UIRepeatingGestureClockDelegate)delegate;
- (void)_cancelTimer;
- (void)_createTick:(id)a3;
- (void)_performTick:(id)a3;
- (void)_scheduleTimer;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startClock;
@end

@implementation _UIRepeatingGestureClock

- (void)dealloc
{
  [(_UIRepeatingGestureClock *)self _cancelTimer];
  v3.receiver = self;
  v3.super_class = (Class)_UIRepeatingGestureClock;
  [(_UIRepeatingGestureClock *)&v3 dealloc];
}

- (void)startClock
{
  self->_delayIndex = 0;
  [(_UIRepeatingGestureClock *)self _scheduleTimer];
}

- (void)_cancelTimer
{
  if (self->_timerOn)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__createTick_ object:0];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__performTick_ object:0];
  }
  self->_timerOn = 0;
}

- (void)_scheduleTimer
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [(_UIRepeatingGestureClock *)self _cancelTimer];
  self->_timerOn = 1;
  unint64_t delayIndex = self->_delayIndex;
  self->_unint64_t delayIndex = delayIndex + 1;
  if (delayIndex >= 3) {
    unint64_t delayIndex = 3;
  }
  double v4 = kDelayTable[delayIndex];
  v6[0] = *MEMORY[0x1E4F1C4B0];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(_UIRepeatingGestureClock *)self performSelector:sel__createTick_ withObject:0 afterDelay:v5 inModes:v4];
}

- (void)_createTick:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = *MEMORY[0x1E4F1C4B0];
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(_UIRepeatingGestureClock *)self performSelector:sel__performTick_ withObject:0 afterDelay:v4 inModes:0.0];
}

- (void)_performTick:(id)a3
{
  if (self->_timerOn)
  {
    double v4 = [(_UIRepeatingGestureClock *)self delegate];
    id v5 = v4;
    if (v4)
    {
      [v4 repeatingGestureClockDidTick:self];
      [(_UIRepeatingGestureClock *)self _scheduleTimer];
    }
    else
    {
      [(_UIRepeatingGestureClock *)self _cancelTimer];
    }
  }
}

- (_UIRepeatingGestureClockDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIRepeatingGestureClockDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end